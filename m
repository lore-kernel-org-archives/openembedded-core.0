Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84819C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 10:46:39 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.114809.1669632398816051270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 02:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bq7K6fg5;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id vp12so23406028ejc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 02:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+b7FdxbpiLbUza9LW5uZf8ZSyOuNa+3NDi9I3KrdcA=;
        b=Bq7K6fg5yXEw/GE5CLB8f6y3nIFjRMfnh71C7i8+ebGFdS1TslIl1KMH2Cp8N1V3rF
         5OjejfVouIE1MAGKt++FsBWNyjKewgsg4DhbletjvSHqgY0C2aOAWzp5l6X2agXrxiLM
         44IrDfWn0LaDN8EYmGl1eDOcRYjMRbEhsk6oayeQczX7S97+eGexIfPo2ZbD1E1CeTzH
         RAI6tzDUb4Ht6VRN46oJvr6ndYKVmg052jDbcI3/6u55swkUvngV4nnzd16akZKZsQfU
         I2Zbuq8JpSnzL+61SZ1C8LqkNzK5SXlPPzOE+Q+ZYM8KP9EANKgXIewGxVATbfVZ2pNb
         7qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+b7FdxbpiLbUza9LW5uZf8ZSyOuNa+3NDi9I3KrdcA=;
        b=7Z86rNSsYsEDtGHV+TkJ0nUixAkN0edDCGyF8uPL5g6NUV0+hY0S+Nm98/wsRyLUux
         fiCyCky5U3kZUfKWBU1H6vQLww3wwn00iGNn1GKnx31lYQ8fShMM0rSaKZb+d51rv7cF
         +Un7a+5lGINNEXjTT3Kvg1zBUcOhKMMRHXRI9q/v5R5Ti3BtsQJH7Pp8Ja2aa/u0w7UH
         P8mq3jXXrA3KE0OsYO6ZE6j6JHOusSC7e7CQon5UvDEo5hip1edStBZ5zKzxY9dGRBti
         DKKzp/+VLiMM2JHg13LG39Z9vkS+E4kSXDMkY2eVbvkW0sNW1WbHPYIZMJFPZBt9TBPt
         +NSg==
X-Gm-Message-State: ANoB5pnqNjCM6HP9kZRP8asSwjZr1vxC3HMChDxhGwcbvP6gXJdskq64
	UjiKhBrVHdSntxGDnxv7EtYUz+npk8A=
X-Google-Smtp-Source: AA0mqf5C7JfzOrjbKPzez+0xRoe2XtbT0B6Jr02ZYY0QmUe79MhHNTnsUkkL/r3FpCY/b3qRSMhC5w==
X-Received: by 2002:a17:906:eb04:b0:7ae:77ef:d048 with SMTP id mb4-20020a170906eb0400b007ae77efd048mr26701496ejb.740.1669632397188;
        Mon, 28 Nov 2022 02:46:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q8-20020a17090676c800b0078db18d7972sm4776707ejn.117.2022.11.28.02.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 02:46:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/3] qemu-helper: depend on unfs3 and pseudo directly
Date: Mon, 28 Nov 2022 11:46:31 +0100
Message-Id: <20221128104633.52375-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173902

The eliminates having to do extra steps (e.g. meta-ide-support)
when booting an image with a nfs mount as rootfs - startng runqemu
with a nfs mount starts to 'just work' after building an image.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb    | 2 +-
 scripts/runqemu-export-rootfs                           | 8 ++------
 scripts/runqemu-extract-sdk                             | 2 +-
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index abba7fe159..2a5bcfb909 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Qemu helper scripts"
 LICENSE = "GPL-2.0-only"
-RDEPENDS:${PN} = "nativesdk-qemu \
+RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
                   nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
 
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index e297586bbb..6053b71717 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -25,5 +25,5 @@ do_install() {
 	install qemu-oe-bridge-helper ${D}${bindir}/
 }
 
-DEPENDS += "qemu-system-native"
+DEPENDS += "qemu-system-native unfs3-native pseudo-native"
 addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index c1fff7fcb3..6a8acd0d5a 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -34,16 +34,12 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 	echo "Did you forget to source your build environment setup script?"
 	exit 1
 fi
-. $SYSROOT_SETUP_SCRIPT meta-ide-support
+. $SYSROOT_SETUP_SCRIPT qemu-helper-native
 
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd" ]; then
 	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
 
-	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
-		echo "Have you run 'bitbake meta-ide-support'?"
-	else
-		echo "This shouldn't happen - something is missing from your toolchain installation"
-	fi
+	echo "This shouldn't happen - something is missing from your toolchain installation"
 	exit 1
 fi
 
diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 9bc0c07fb8..db05da25f2 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -25,7 +25,7 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 	echo "Did you forget to source your build system environment setup script?"
 	exit 1
 fi
-. $SYSROOT_SETUP_SCRIPT meta-ide-support
+. $SYSROOT_SETUP_SCRIPT qemu-helper-native
 PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
 
 ROOTFS_TARBALL=$1
-- 
2.30.2


