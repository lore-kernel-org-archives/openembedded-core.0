Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC1AE9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 09:50:30 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8714.1771408219914400841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 01:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dr3INCx4;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-435f177a8f7so5510936f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 01:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771408218; x=1772013018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YfVr+3k7wP84fd9CVf3ziisxrf9U9YOUymZyuj8+3I=;
        b=dr3INCx4GGl2YxmzgBFIVEMeEJNyzgUAzytGb8GOWnhantOTMnbHuifluxg8di/LIk
         zYd9fIO03cPaFLpG3Br7j1lcJ/c6YXyFIzYTUkEOXRnZ4DJi9KW31QsHhsy4K4mvNa70
         avWi+W1QgHidwwTS9tHcNF6/M+CggZDPjOfrFlmItz/FRGJGeJIpVvfeeqZ0SFWhtiiD
         Rb8VFnD/htqW9IpS2CZaoghUqdNd9pj75A3d6VBgF9g5n4PJT/XXwqc6qyNHXeNjc+7P
         LgXEQcgSyh+rc7B36Z0hTg7uX42uOk8ueSpYh7ws6gz5yn6Vjp0LVo2qYW9GuFSXp7Ve
         jGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408218; x=1772013018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YfVr+3k7wP84fd9CVf3ziisxrf9U9YOUymZyuj8+3I=;
        b=AE7huomR1ex5uj1gVnJlyrnqEzvdVtN7zWqi6o1UswrsAMk37DJlkSQtDPQg7BYCjX
         qad6hs5SPDTeWREHS9zgnFoGxr+9GrjO6rx7fiai7iayggjSE7U9J32ATUZ+kTjqbShx
         qoHQTwa0/Q3N7XfZfxEyz1DJmO503I4QuF9w3cYu7HAob0DYP+/6kbnu2OnSyY7ui5Cd
         GYSQ3RCf4JT4ib/VFhzxWko9z23DezQrWnYA2yethSXi6d5Q73TrtQoYVcmidfLLHK6y
         FAncR252odIbZeRb+7XOOWXPHbUduCqQ+LuIA6TQZl91b53MiSeuUAIN2vDI+lM2uvqP
         ceRg==
X-Gm-Message-State: AOJu0YyFdE6MefTWQjW1v41xiqc9sYTqvqxEsy/w+8bOSPlkySyqtl6U
	hcPKyeilJUbvsJws2YE2enureHDAiQb7v6xfo2pILT7gWNnTVYunMw7rOSnjTQib
X-Gm-Gg: AZuq6aKUcCQUi8RM5WK8bmCs+mkWLpQGb61vHwVfLvw//2Zpy27AUlQQPD5gOVYYY/2
	YmCp/LrVe/NxGJynMbTd8EDgYvBdZ97HZd0qjBCd21lBmxvN1CvFIeTHAQqjoNygn0SUJ0O+zJ6
	uP4ef0G3OSiOQPXsh4HUFHdTCNjLJI8bOYoLzHp2WXNplJwoYBHqdKy07yvequuMyh+wEq4TLNm
	KH/+po1FSuJtiVSkTaHvVJcq4rPObE+cHBCvVIjlZuiehYBGlEFNxwCXCbsXrkCYSGsH8sAJYXI
	im9ztAL1COlS3C3qCGjCQiz1kcvOr9JGnoiKdjP6HzBnLZK6ea7BYQNiHGByaxd2r8B+S2h5WrD
	mr9FmIoPmSIKRiKz271Gt5eRoPMrjxZcnN/aRvH+O7hR5zyt1HEK6KNgLe1gL9pp5m9m4sw7HLP
	EPTEpgBzODJpMn5XX1FbwRPfBYGjuoHls8ETgHbLgj6HTFjTamf0eZ
X-Received: by 2002:a05:6000:22c9:b0:436:1989:a1ba with SMTP id ffacd0b85a97d-4379db31007mr26552496f8f.10.1771408217589;
        Wed, 18 Feb 2026 01:50:17 -0800 (PST)
Received: from CTW01359.. (171.195.137.78.rev.vodafone.pt. [78.137.195.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6ba57sm33047805f8f.15.2026.02.18.01.50.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:50:17 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] classes/buildhistory: Do not sign buildhistory commits
Date: Wed, 18 Feb 2026 09:50:16 +0000
Message-ID: <20260218095016.87018-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 09:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231292

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
index 83993f5752..52f886dff6 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -859,7 +859,7 @@ result: $result
 metadata revisions:
 END
 	cat ${BUILDHISTORY_DIR}/metadata-revs >> $commitmsgfile
-	git commit $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
+	git commit --no-gpg-sign $commitopts -F $commitmsgfile --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 	rm $commitmsgfile
 }
 
-- 
2.43.0


