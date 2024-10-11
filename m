Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F106ECFD36E
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:02:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.9682.1728648121418561631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1szEKt-0002PD-LA; Fri, 11 Oct 2024 14:01:35 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1szEKt-0014uL-0L; Fri, 11 Oct 2024 14:01:35 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1szEKs-003RPt-35;
	Fri, 11 Oct 2024 14:01:34 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v9 3/7] barebox: set default BAREBOX_CONFIG for qemu machines
Date: Fri, 11 Oct 2024 14:01:13 +0200
Message-Id: <20241011120117.818804-4-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011120117.818804-1-ejo@pengutronix.de>
References: <20241011120117.818804-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205683

From: Enrico Jorns <ejo@pengutronix.de>

These are set in the barebox class rather in the corresponding machines
(where they would belong otherwise) to keep the impact of barebox to
oe-core minimal for now.

"multi_v7_defconfig" is used for qemuarm since this is the default
barebox armv7 config that just enables all supported platforms.

"multi_v8_defconfig" is used for qemuarm64 sine this is the default
barebox armv8 config that just enables all supported platforms.

"efi_defconfig" is used for qemux86-64 which is the primary platform
where barebox will not be the first stage bootloader but an EFI payload.

Since these changes make barebox a provider for virtual/bootloader,
explicitly default to u-boot in the corresponding MACHINE configs to not
unnecessarily surprise users.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/classes-recipe/barebox.bbclass | 5 +++++
 meta/conf/machine/qemuarm.conf      | 1 +
 meta/conf/machine/qemuarm64.conf    | 1 +
 meta/conf/machine/qemux86-64.conf   | 1 +
 4 files changed, 8 insertions(+)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 413a78f18c..200ba08326 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -57,6 +57,11 @@ EXTRA_OEMAKE = " \
 BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
 BAREBOX_CONFIG ?= ""
 
+# set sensible default configs for some of oe-core's QEMU MACHINEs
+BAREBOX_CONFIG:qemuarm = "multi_v7_defconfig"
+BAREBOX_CONFIG:qemuarm64 = "multi_v8_defconfig"
+BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"
+
 # prevent from acting as non-buildable provider
 python () {
     bareboxconfig = d.getVar('BAREBOX_CONFIG')
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 943ce7c16a..af76a53b8e 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 UBOOT_MACHINE ?= "qemu_arm_defconfig"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index a096d964db..d310445a34 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
 
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 UBOOT_MACHINE ?= "qemu_arm64_defconfig"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 14873a3b4f..4a9c6d364b 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -13,6 +13,7 @@ DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/x86/tune-x86-64-v3.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
 
 KERNEL_IMAGETYPE = "bzImage"
-- 
2.39.5


