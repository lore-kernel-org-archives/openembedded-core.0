Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D005D597CF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:48 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.3473.1731467798430288179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mlzlTIs+;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a3aeb19ea2so23848875ab.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467797; x=1732072597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcsKZcnERIAkKLnmrwqcI8YbevnvtkXQip36ax/XPQQ=;
        b=mlzlTIs+0wiCx+TG3hi2XmqO6FXR9MFFyYc40EZLWNkQPExDBCbOycJoZ5tUVodrV2
         OVuqKb3bdRWPOGIu430i3t6JNsAXTyO9xOhTW9olawoVFmbEwDC8kpxmZOX4NwsDvEF3
         AWYvntIH8nIgnaqXNY11Mg/rqngt/5WB4/zQhf3HPbL8FPpmM8W9x5iHtG9IjsHuJQ/u
         BWv7WHBkP/5pwmgZoXQipLzDGbub2aMt6ptMzGmZ9bGqZwoqaJyWghGGrP9ACWNePRvm
         mAjo4w+sf3jx5l6+xLN/eb55BZSFwYrENBKc/j03iP3f6FeEK7zB9YCpj97U1d6/a+9N
         qqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467797; x=1732072597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcsKZcnERIAkKLnmrwqcI8YbevnvtkXQip36ax/XPQQ=;
        b=VFQiuOuM4HYpXytEOzXvUzDMR3U0blw7J93lyTzQM2JbkPbbjAThPuiQY5Txr7QWoU
         QRgKY1/bWO9k0tYKT0O3+ln8vZzmZSix7/VxJHqyRlNzJxEzA1vXBKjatRxSzxDJD8+X
         mNM72p9fkVQBlayRzgBkTAKvUcV6rIUthn9Qw+ZH7zE4tjD85aCLpmaRfdOhAcKGnh0G
         GxEI5+dAM1I+JZ+K2Lyyr/oOFkXzBIMqvwdbruK8J2axUGLemijyWz7oQDBx+IYx8/7I
         FWboTIVnoZpFCqdmq14I3NUumDSioXabbvew8tko283vC1Sf8FkoGbVABHnYsCKSvbbk
         71QA==
X-Gm-Message-State: AOJu0Yx9DFqwlMiw8dk9KJJcAzfebHrsD1U5TUU5v2XGg7MYEpoYKRwC
	vh9Q5NIYfXAlPIvNmEwk0NOl09PVfZarGnHhrX1hWS8rdSlBAXQKDVq2zFYKYQ6s7jY5RI1SU/E
	Z
X-Google-Smtp-Source: AGHT+IH4hQB8eSe6hb4rSE3atlsLX3SInFzAH2+kIhx7Kv5QHWim955nZtN5JUltxnMlz5wyo4FLuQ==
X-Received: by 2002:a05:6e02:1a44:b0:3a6:aade:e30f with SMTP id e9e14a558f8ab-3a6f198e7c5mr186440455ab.3.1731467797495;
        Tue, 12 Nov 2024 19:16:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/19] pseudo: Update to pull in fd leak fix
Date: Tue, 12 Nov 2024 19:16:05 -0800
Message-Id: <b8445072f4009b3e912792931bd71a4201d541e9.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207085

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Pull in:
    pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak

    Use close-on-exec (O_CLOEXEC) flag when open log file to
    make sure its file descriptor is not leaked to parent
    process on fork/exec.

    Fixes [YOCTO #13311]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d38c9d79c0..134d941609 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9df045968d739ead0bebacce415d05269694de4e"
+SRCREV = "ec6151a2b057109b3f798f151a36690af582e166"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


