Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4DEE7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 15:25:44 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
 by mx.groups.io with SMTP id smtpd.web11.131236.1734621937900290507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 07:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YDZB84Y7Vz7RF;
	Thu, 19 Dec 2024 16:25:36 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YDZB81dkJzqBg;
	Thu, 19 Dec 2024 16:25:36 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 19 Dec 2024 16:25:17 +0100
Subject: [PATCH 2/2] uboot-extlinux-config.bbclass: add support for DTBOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-extlinux-overlays-v1-2-9a2eb81c1efa@cherry.de>
References: <20241219-extlinux-overlays-v1-0-9a2eb81c1efa@cherry.de>
In-Reply-To: <20241219-extlinux-overlays-v1-0-9a2eb81c1efa@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 15:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208922

From: Quentin Schulz <quentin.schulz@cherry.de>

Also known as FDTO, DTO or Device Tree Overlay.

This adds a new property per label in extlinux.conf for which device
tree overlays to apply on top of the base device tree (the one specified
in FDT or guessed by the bootloader if only FDTDIR is set). It is a
space-separated list of paths to the .dtbo file(s).

Note that the base FDT needs to have symbols enabled (DTC_FLAGS needs to
have -@ in it) for an overlay to be applicable.

This is only applicable for non-FIT setups.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index a6938ab0631ac0d0a06828a721d5da4d0a77199a..2fa83b2c8b5c90ced37048d9051493e31837b305 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -15,6 +15,7 @@
 # UBOOT_EXTLINUX_KERNEL_IMAGE      - Kernel image name.
 # UBOOT_EXTLINUX_FDTDIR            - Device tree directory.
 # UBOOT_EXTLINUX_FDT               - Device tree file.
+# UBOOT_EXTLINUX_FDTOVERLAYS       - Device tree overlay files. Space-separated list.
 # UBOOT_EXTLINUX_INITRD            - Indicates a list of filesystem images to
 #                                    concatenate and use as an initrd (optional).
 # UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
@@ -66,6 +67,7 @@
 UBOOT_EXTLINUX_CONSOLE ??= "console=${console},${baudrate}"
 UBOOT_EXTLINUX_LABELS ??= "linux"
 UBOOT_EXTLINUX_FDT ??= ""
+UBOOT_EXTLINUX_FDTOVERLAYS ??= ""
 UBOOT_EXTLINUX_FDTDIR ??= "../"
 UBOOT_EXTLINUX_KERNEL_IMAGE ??= "../${KERNEL_IMAGETYPE}"
 UBOOT_EXTLINUX_KERNEL_ARGS ??= "rootwait rw"
@@ -136,6 +138,7 @@ python do_create_extlinux_config() {
                 fdtdir = localdata.getVar('UBOOT_EXTLINUX_FDTDIR')
 
                 fdt = localdata.getVar('UBOOT_EXTLINUX_FDT')
+                fdtoverlays = localdata.getVar('UBOOT_EXTLINUX_FDTOVERLAYS')
 
                 cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_description, kernel_image))
 
@@ -144,6 +147,9 @@ python do_create_extlinux_config() {
                 elif fdtdir:
                     cfgfile.write('\tFDTDIR %s\n' % (fdtdir))
 
+                if fdtoverlays:
+                    cfgfile.write('\tFDTOVERLAYS %s\n' % (' '.join(fdtoverlays.split())))
+
                 kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS')
 
                 initrd = localdata.getVar('UBOOT_EXTLINUX_INITRD')

-- 
2.47.1


