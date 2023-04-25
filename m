Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F97C77B78
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.88567.1682448497406163574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-0003kE-W3; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi1-00Dl5W-Ou; Tue, 25 Apr 2023 20:48:13 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209T-Bi; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 3/9] barebox: set default BAREBOX_CONFIG for qemu machines
Date: Tue, 25 Apr 2023 20:47:14 +0200
Message-Id: <20230425184720.456896-4-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425184720.456896-1-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 18:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180395

These are set in the barebox recipe rather in the corresponding machines
(where they would belong otherwise) to keep the impact of barebox to
oe-core minimal for now.

"multi_v7_defconfig" is used for qemuarm since this is the default
barebox armv7 config that just enables all platforms.

"qemu_virt64_defconfig" is used for qemuarm64 sine this is a dedicated
config for the standard QEMU armv8 'virt64' machine.

"efi_defconfig" is used for qemux86-64 which is the primary platform
where barebox will not be the first stage bootloader but an EFI payload.

Since these changes make barebox a provider for virtual/bootloader,
explicitly default to u-boot in the corresponding MACHINE configs to not
unnecessarily surprise users.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/conf/machine/qemuarm.conf       | 1 +
 meta/conf/machine/qemuarm64.conf     | 1 +
 meta/conf/machine/qemux86-64.conf    | 1 +
 meta/recipes-bsp/barebox/barebox.inc | 5 +++++
 4 files changed, 8 insertions(+)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index aa9ce88203..1394cce9ef 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -7,6 +7,7 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 UBOOT_MACHINE ?= "qemu_arm_defconfig"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 2f0f0e4f84..f289f7aa7d 100644
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
diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebox/barebox.inc
index 5609980a64..c5afb75f49 100644
--- a/meta/recipes-bsp/barebox/barebox.inc
+++ b/meta/recipes-bsp/barebox/barebox.inc
@@ -48,6 +48,11 @@ EXTRA_OEMAKE = " \
 BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
 BAREBOX_CONFIG ?= ""
 
+# set sensible default configs for some of oe-core's QEMU MACHINEs
+BAREBOX_CONFIG:qemuarm = "multi_v7_defconfig"
+BAREBOX_CONFIG:qemuarm64 = "qemu_virt64_defconfig"
+BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"
+
 # prevent from acting as non-buildable provider
 python () {
     bareboxconfig = d.getVar('BAREBOX_CONFIG')
-- 
2.39.2


