Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBEBC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 14:57:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.19079.1738076264645654417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 06:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oN2YtDJm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82C08440E0;
	Tue, 28 Jan 2025 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738076262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rfkam4Rab1WCZLNJvxvjOOxXYStgGGzo3BA59lA5Uac=;
	b=oN2YtDJmmNf6bes5zpFNaLlzKH0LANBJTzmqVzk89Dbm2CRcEhnABqyfNC/TdHa/mAam2b
	AaX8OdBOFg3+C0nwMtsesNfRM4AyrN2P02tkS2xbHZQnwvDf6qQNbFdBty503uWyUyls3E
	aWcVmrcE24ajMSpeqRAgcuaWGJRbeWrkMSxD8E40yAFTVKCMOtNbsbrHXT7ECdJr9DGw7C
	PjEfVQDEUNoEwrVAZxGHWUOD1nra4l0Jz/8gsgQi8QCYvV1NLcoRjiumFQ6kpgwX7aQmzD
	p1HNRlWPYovanxQvvP9qsB/TkXEqoUChE6KdUqTf4tNzbvKWEMRIxHJPG+1v0w==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] u-boot: Convert ${UBOOT_ENV}.cmd into ${UBOOT_ENV}.env
Date: Tue, 28 Jan 2025 15:57:36 +0100
Message-ID: <20250128145736.2258098-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhenucggtffrrghtthgvrhhnpeehieduiefgvdelveevleevhedtudefffejjeevvdffhfeivdehudfgueduleekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepgihpshdufedqudduieehghejrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 14:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210326

From: Thomas Perrot <thomas.perrot@bootlin.com>

It is U-Boot environment files that contain environment variables
in a binary format, that enables compact data storage and allows
for faster loading and processing by U-Boot.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/classes-recipe/uboot-config.bbclass |  8 +++++++-
 meta/recipes-bsp/u-boot/u-boot.inc       | 11 +++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index bf21961977cc..50e16efe50aa 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -75,6 +75,12 @@ UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
 UBOOT_MKIMAGE_DTCOPTS ??= ""
 SPL_MKIMAGE_DTCOPTS ??= ""
 
+# Options for the binary format, such as enabling a redundant environment.
+UBOOT_MKENVIMAGE_BIN_ARGS ??= ""
+
+#mkenvimage command
+UBOOT_MKENVIMAGE ?= "uboot-mkenvimage"
+
 # mkimage command
 UBOOT_MKIMAGE ?= "uboot-mkimage"
 UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
@@ -119,7 +125,7 @@ python () {
         for config in ubootconfig:
             found = False
             for f, v in ubootconfigflags.items():
-                if config == f: 
+                if config == f:
                     found = True
                     items = v.split(',')
                     if items[0] and len(items) > 3:
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 3270c22e8d42..f1308d65609f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -4,6 +4,7 @@ PROVIDES = "virtual/bootloader"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
+DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'env', 'u-boot-mkenvimage-native', '', d)}"
 
 inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
 
@@ -68,9 +69,15 @@ do_compile () {
         uboot_compile
     fi
 
-    if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
+    if [ -n "${UBOOT_ENV}" ]
     then
-        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
+        if [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
+        then
+            ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
+        elif [ "${UBOOT_ENV_SUFFIX}" = "env" ]
+        then
+            ${UBOOT_MKENVIMAGE} ${UBOOT_MKENVIMAGE_BIN_ARGS} -s ${UBOOT_ENV_SIZE} ${UNPACKDIR}/${UBOOT_ENV_SRC} -o ${B}/${UBOOT_ENV_BINARY}
+        fi
     fi
 }
 
-- 
2.48.1


