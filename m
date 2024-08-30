Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC3DCA0FEF
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:53:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.13718.1725022381169792945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ai28MVf7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2053525bd90so2550785ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022380; x=1725627180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHSdxx6oJhkWKhfY645+SRz0uqxSVvekkYqdP1fDNOw=;
        b=ai28MVf7nJgQUUvqH6OmfOozz//InzrpFQ3zKsdTGEAyIlnpv9JpjOx/+1A1Q8QBgZ
         d9Ubx+Ad5X8ICHwmMYX3VyFy6cqwmiqJVWmsQaEAEETv1gIXTHC391k7idGFtamR1qYm
         swVL34LErC9fRe9OkFHwjAmfqi+hhAcpXij0iE+rbxV4XPyuXii7dtnlXD//ZTuKvSmY
         0a2hOpec3SKvt5uyhEYkdQLdjMQ4GSnOlMNUs7qyNuVCaLscxu61q/B+Xa0OE2dBVnFI
         j/P9Gu1wIBZNArLXSazLqM4x3pDV5LE/L/H95uve6khWa9q+/rZgJAJ/vKmmxZueSxzI
         gPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022380; x=1725627180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHSdxx6oJhkWKhfY645+SRz0uqxSVvekkYqdP1fDNOw=;
        b=SDkFXF8u9ThFwHrLZ70jtp4mVDokclN+CMkJt29CySx+9qHggohgjdIPPsZZiIHzpS
         MfEgFa6Tq37sfmxuT43RUQTjew7xpNvYyQtKrvC02QmjmC40px6M3pDRQTNWaMC4e5se
         WbpK4bnmY3lS36d44admpWXfXEE53SQViN4j9NWFO7J594FoCLqCVcOGHvkC5ociModi
         DlcBq0RYwA5OhE/oxMs/i+fjGazc5hYNWzrWb+ucVRzUrkijYpwV6GaOYti39+yDFpn7
         1dZxAXOCraHXs7wyxAYZnuSPuR9DIHqrgVfs9spwfNZWf6di+62ksy6ursEmHlcFeFL9
         edHQ==
X-Gm-Message-State: AOJu0YyjtnAr2wtBJXfp5QVR8TYvtcqT7Rtslr6Hf63OUOcs0CJWBhkO
	WGxRJiB30o6mt/7b9i3aCBMQVPJyy2FrXbN7yjOq5gnVF+vqyirRyUlslCUDANsctvH11y2cqpj
	G3aA=
X-Google-Smtp-Source: AGHT+IGTYm+AkutdSHggE6wutHIuXjFVypN4RS3R798qZ/1Y65GyOXveIFN2w/nHhl/+GXMviSDtSA==
X-Received: by 2002:a17:902:ea0d:b0:202:3432:233d with SMTP id d9443c01a7336-2050c3b79b9mr70150065ad.14.1725022380352;
        Fri, 30 Aug 2024 05:53:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.52.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:53:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] cryptodev-module: Fix build for linux 5.10.220
Date: Fri, 30 Aug 2024 05:52:46 -0700
Message-Id: <047ee2fe7bc9920038213d014a920518a264ef17.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725022186.git.steve@sakoman.com>
References: <cover.1725022186.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203965

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/157a624d7a892ea5fb2df4bbd4e71c008adbecb7]

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cryptodev/cryptodev-module_1.12.bb        |  1 +
 .../0001-Fix-build-for-linux-5.10.220.patch   | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linux-5.10.220.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
index 5192cf03ed..71d7b0ede3 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
@@ -8,6 +8,7 @@ inherit module
 DEPENDS += "cryptodev-linux"
 
 SRC_URI += "file://0001-Disable-installing-header-file-provided-by-another-p.patch \
+            file://0001-Fix-build-for-linux-5.10.220.patch \
            "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linux-5.10.220.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linux-5.10.220.patch
new file mode 100644
index 0000000000..ebc4058814
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linux-5.10.220.patch
@@ -0,0 +1,32 @@
+From 47f9d88ca5107d1814ecfc7faf6d02d1140978a8 Mon Sep 17 00:00:00 2001
+From: Alexandre Bard <alexandre.bard@netmodule.com>
+Date: Wed, 3 Jul 2024 15:01:22 +0200
+Subject: [PATCH] Fix build for linux 5.10.220
+
+The commit previously integrated is 5.11 has now been backported to
+5.10.y branch.
+
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.10.y&id=1aecdaa7e2c6619a7d2c0a81c8f5c06e52f870f3
+
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/157a624d7a892ea5fb2df4bbd4e71c008adbecb7]
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ ioctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 95481d4..11fa27a 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -871,7 +871,7 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
+ 		if (unlikely(ret)) {
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
+ 			sys_close(fd);
+-#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 11, 0))
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 10, 220))
+ 			ksys_close(fd);
+ #else
+ 			close_fd(fd);
+-- 
+2.46.0
+
-- 
2.34.1


