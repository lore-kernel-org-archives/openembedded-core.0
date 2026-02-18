Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BDFE9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 09:47:40 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8685.1771408054656895444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 01:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F+y5AbUD;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4837584120eso34065365e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 01:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771408053; x=1772012853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KXKaEkP4CVU4hYUoc3pzCJxdZr6NXXIe6rncbiHGWX0=;
        b=F+y5AbUDL5aUNc4UwhNrbFLDtMvpj3HECaSweyoyabltn5VnQF8cDeoxmE3Eddjjlg
         S2aVnPpvhsKPV/nAQYluIdk8gY4nlBMnMxt3a2+aia2itYdeU9vVPp6QJcXdL9OseYzg
         +3u7IV3t/ab29aqm4H3xpBu0sJrcbfAdee1FpF/pYM2aTi8nxI+L+1eH8RtOcqr0aS+Y
         twxPHJNnMmIKhc8kW7HJorkwtOeRkPH0N7EqxJ1HB6XSfJ29NoN9/KcsO/kWasFwdLot
         jMdTQt0RQXc2lQAsT9MtREcwQkQFA8TER5ED/ae979blHG1coqa4fWMUDcPN7NF26KF0
         lOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408053; x=1772012853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXKaEkP4CVU4hYUoc3pzCJxdZr6NXXIe6rncbiHGWX0=;
        b=nun7KeluFISHW64rsEjNs8ig5g/Yt4XuzBWnqxMpRWdCRq4f4h9KxaSw0jK1rPnypI
         VyKNYqNB1vK/AvF1/nDN4r8FK7A13Gkfez4Q4omWWMLUUUOJumJer1uTGa5sl1zID/DI
         5maDd0uqo+xkhoGNo6FXUu+qXOr/G79QUSGopz/+3iDmuOkAmostGnshmhVz6kRVuUdZ
         CVNueeqLU8DqialZ/DNsWnGamvtJPEHkfP2EWWK5N8vT49ZtyPyzkbVk9GufMPatW8b8
         ApdAsxhjmJr4NUhxVSwnSNjxWFbNqjPXcQydJDxcx5kivdSPihsxOs85RqbH+S/xYSGj
         Jpsg==
X-Gm-Message-State: AOJu0YyWUqpG1ziJ4Z9DY+os8vPH2lrhC7HUBUYqF/U3u9PG6PrUSm8M
	BQnuE6WpDy2Ij0yiF8w3AEhPnWiKY+jMllwcSqqncrx35fL59wKLeshkqFhZEtdw
X-Gm-Gg: AZuq6aJIoewJhrNcyctceCVw8bw0B1MWBlrxIQHOUyUMfiad3AC3VlSXXhHH1ytDbmf
	PJKz7epELcFd5TgII9FjiZ7di93FuYnEQJRxfPPqmUVEGfn5eny26KW7nZSwq/Hp+IAnXraW86F
	tcCjzEGb9ddGDGZeYoZCvZp9kC5slLOkTA9nu5bS59uKa4bXofYDNTeJeeILN7oR+DkFhypodBH
	9iGvqHlPmQ3+eSYI7OD4f36OUzkNRfngMZEW2DMO/PlliL8A1od6vG5RS5SzZ1xaYHqIC4Af8WW
	ghUM4cPdN1Uo3sPDpWvCiXM4NV6lUZTdtDsi9g0cJoCkATa8X162NLUhPVbZTJuMdm5hvaZGQRh
	2KEDxQRAPgBfJ5rS6KuGSj9HupwprnF9Dn16n/8FkqjtkLo0SSm8uGfeB4NICTk1zmeZ0WTxnDI
	VjuRe7HsrnIponYqmaS0M+9arVeLXpqdi2uSXqJd96SnXZF9GjqSV5
X-Received: by 2002:a05:600c:8189:b0:482:f12f:f35e with SMTP id 5b1f17b1804b1-48379b98ff9mr229652475e9.12.1771408052237;
        Wed, 18 Feb 2026 01:47:32 -0800 (PST)
Received: from CTW01359.. (171.195.137.78.rev.vodafone.pt. [78.137.195.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839741ad7bsm20922695e9.3.2026.02.18.01.47.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:47:31 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] classes/buildhistory: Do not sign buildhistory commits
Date: Wed, 18 Feb 2026 09:47:30 +0000
Message-ID: <20260218094730.84150-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 09:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231290

From: Fabio Berton <fabio.berton@ctw.bmwgroup.com>

This change adds the --no-gpg-sign option to prevent buildhistory
commits from failing due to GPG signing issues. Depending on the setup,
buildhistory may fail to create a commit if the user has the
commit.gpgsign option enabled.

For example, if the user creates a signing key that requires a password,
the commit won't be created and will fail with the following error:

/
|error: Enter passphrase: Load key "/home/<user>/.ssh/id_ed25519":
|incorrect passphrase supplied to decrypt private key?
|fatal: failed to write commit object
\

The bitbake command won't fail, but buildhistory won't have a commit.
Also, the commit may silently fail when building inside a container due
to missing packages or issues with accessing the GPG agent.

This is similar to [1], and signing the buildhistory commit
should be avoided to prevent such issues.

1 - https://git.openembedded.org/openembedded-core/commit/?id=7595a0a63a933af9dd9d1e458dc34a4ba80d9eae

Signed-off-by: Fabio Berton <fabio.berton@ctw.bmwgroup.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5e18714aee52db898aaf9d222fb5a4168bde96e)
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0b1bd518fe..954edfe46a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -841,7 +841,7 @@ result: $result
 metadata revisions:
 END
 	cat ${BUILDHISTORY_DIR}/metadata-revs >> $commitmsgfile
-	git commit $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+	git commit --no-gpg-sign $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 	rm $commitmsgfile
 }
 
-- 
2.43.0


