DROP TABLE TBL_REPLY;
CREATE SEQUENCE SEQ_REPLY;

CREATE TABLE TBL_REPLY(
	RNO NUMBER (10, 0) PRIMARY KEY,
	BNO NUMBER (10, 0) NOT NULL,
	REPLY VARCHAR2(1000) NOT NULL,
	REPLYER VARCHAR2(50) NOT NULL,
	REPLYDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE
);
	


ALTER TABLE TBL_REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY(RNO);

ALTER TABLE TBL_REPLY DROP CONSTRAINT PK_REPLY;

ALTER TABLE TBL_REPLY ADD CONSTRAINT FK_REPLY FOREIGN KEY (BNO) REFERENCES TBL_MAILBOX(BNO);

ALTER TABLE TBL_REPLY DROP CONSTRAINT FK_REPLY_BOARD;

SELECT * FROM BOARD;
SELECT * FROM TBL_REPLY;

INSERT INTO TBL_REPLY (RNO, BNO, REPLY, REPLYER)
VALUES(
	SEQ_REPLY.NEXTVAL, 4, 'THIS IS REPLY 1', 'I AM A REPLYER 1'
)
-- 인덱스 만드는 법
CREATE INDEX IDX_REPLY ON TBL_REPLY (BNO DESC, RNO ASC);

SELECT RNO, BNO, REPLY, REPLYER, REPLYDATE, UPDATEDATE
FROM
(
	SELECT /*INDEX(TBL_REPLY IDX_REPLY)*/
	ROWNUM RN, BNO, RNO, REPLY, REPLYER, REPLYDATE, UPDATEDATE
	FROM TBL_REPLY
	WHERE BNO = 53 AND RNO > 0 AND ROWNUM <= 20
)
	WHERE RN > 10;


