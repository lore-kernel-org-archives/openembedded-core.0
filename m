Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15FDF357D5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:22 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21688.1771943593202420144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Rj1/UNje;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4837907f535so50166905e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943591; x=1772548391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqhnSY3MLjisje7z/DW3OoTCFPkSZL+Si/7KSWZ4WMI=;
        b=Rj1/UNjefVeaIKBbg1nUvge/9baRzZX5FE+yEyHHuyTLpF8rj+H2wY6vFNRbNNRErG
         L2mcuyeoAXitFPhR7/+s5Uv+E2K+LLiQOBT1JZTNcHhyPpc0UJMBZ5JoynRMkRCkEI+i
         Ffv1dv6fezOKMnhPkP3XB6Bi11r3DtSVK9xBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943591; x=1772548391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jqhnSY3MLjisje7z/DW3OoTCFPkSZL+Si/7KSWZ4WMI=;
        b=NNK2Yhr3YYAIURths1BCAKoY7iKnOQ29TJK2QEPifizf8n7ATfaEOnNdcsQJ1Ph3Qg
         Qo+hqHpoQRKBc5O3ZdqsTNbqzL/LVkjTWcO82z0bat2ztIT34Sw2qiOGatmqIPPXLfEK
         +YGVJdAT/vJZ9X5HS7T72W3R8vt32w8GI7BB33KhBnjtndpiDiZ6nlfDg+57KViBmbnb
         sj8YSqRpZVZ4bUB0cMWute5Pl+++ONsjUAA1BKXs+cRtd8fp/mXlJUjk2yy+inNf81yK
         mHt75iNvrEcWjTpL4kvxQAJNaaQeeISFP6cIqrqYX7bHqquTP/gYFPZhJjroPuH/3jDL
         DJCw==
X-Gm-Message-State: AOJu0Yx7unsrTBBo9V8PuyCzXJxri7Wn0zXGxlPO+qjLgtKMu/oBgv5g
	qJQSZzHpIG8QyJofPaaV4tW9tN0R4pkIxKfBhc9WhmDC6lR0T1CKkGeHA8Jyogh9MF7akdQwaN+
	06hrP4Mo=
X-Gm-Gg: AZuq6aLzkTzCMSR1ktNIlqZO/BHI/KkQz8y86FvBNbU6zoO/yO4aOkoTuWTsrDpjUg+
	3rPz2c/KpcJ6Z6P5tANOJS+Y7CMaCo37yMbBsahduyxCDP89BEXbynbNdoe1QFfyT/6STUR2wnN
	/CSqDFXTWPXwLLWAfT8mw4H7QeE5HHqVU8Ss8YsAUkSoac1+2Bn3bCQwqyR2fLbfKUGnqSH6yu/
	XyazhJAaOhM1fsNx3azM04OnQSKjq6DZhiY11wn8nhI4z2qeaXE8lYJlAPvkGT/8CBkTL2dmd1I
	bwRUjM5SJzwMK6mY66RHlf6yTGGHu40z4u0E/JhsQ3Jomw4KTDdzm3TbNII2fZsMPeMTRCLTuhQ
	XaCMPq1h0BTGDBOXaEb6V4dDJlqlUe2caxg8JWVScMti8C8KRK+3vl7U6MzXLbiclnToR+Clbx5
	zPkPq7sbOreyQgjCCkgC0ViNkPpfhmwQ4Vj3+HEFfom9RQ6uc9NIQpg/c/jSC/4+D8/fhCqPdQw
	LQNXgNa3HgzIbmd3I09O2s7Ck3PE6BTMnfgueZXf1VM
X-Received: by 2002:a05:600c:608f:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-483a95bd7e8mr201405395e9.5.1771943591151;
        Tue, 24 Feb 2026 06:33:11 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:10 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/44] classes/buildhistory: Do not sign buildhistory commits
Date: Tue, 24 Feb 2026 15:31:59 +0100
Message-ID: <f432402f26ab73cf2b825caef8daf7941cb3dd31.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231838

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0b1bd518fef..954edfe46ac 100644
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
 

