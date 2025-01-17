Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6598C02188
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 16:40:39 +0000 (UTC)
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
 by mx.groups.io with SMTP id smtpd.web11.15118.1737132034487047737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 08:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YZQTD74kqzH3m;
	Fri, 17 Jan 2025 17:40:32 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YZQTD4SxgzkhF;
	Fri, 17 Jan 2025 17:40:32 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 17 Jan 2025 17:40:20 +0100
Subject: [PATCH RFC kirkstone scarthgap styhead 2/2]
 uboot-extlinux-config.bbclass: add support for DTBOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-extlinux-overlays-backport-v1-2-dad9fdb81777@cherry.de>
References: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
In-Reply-To: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
To: openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 16:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209994

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ac21b32b5f5616cc7c0641fb3132eec9b27e5b7)
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
2.48.0


