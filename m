Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE38C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:17:53 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.web10.2908.1711041469934200092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 10:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V0sbc3LQ3z7Gk;
	Thu, 21 Mar 2024 18:17:48 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4V0sbc08c4zTB7;
	Thu, 21 Mar 2024 18:17:47 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 21 Mar 2024 18:17:07 +0100
Subject: [PATCH] u-boot: fix externalsrc not triggering do_configure on
 defconfig changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-u-boot-defconfig-devtool-v1-1-2fccfc4c6f5e@theobroma-systems.com>
X-B4-Tracking: v=1; b=H4sIAJJr/GUC/x2MywqEMAwAf0Vy3kBbH7j+yuKhtqkGlkZaFUH8d
 4u3mcPMBZkSU4ahuiDRwZklFtGfCtxi40zIvjgYZRpVG407TiIbegpOYuC50LGJ/PGr2q6vrZ7
 IOyj5mijw+a5/430/F8e4z2oAAAA=
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Iskander Amara <iskander.amara@theobroma-systems.com>, 
 Quentin Schulz <foss+yocto@0leil.net>
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 17:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197422

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

externalsrc only monitors files listed in CONFIGURE_FILES environment
variable to know if it should trigger a rebuild of do_configure. By
default it is unset, but the defconfig from U-Boot should be listed
otherwise an old defconfig may be used even though the change is
technically detected by the do_compile logic later in the process.

Because U-Boot recipe uses `make oldconfig` when no defconfig is passed,
monitor .config for that special case.

This fixes U-Boot recipes not detecting defconfig changes when
devtool'ed.

Reported-by: Iskander Amara <iskander.amara@theobroma-systems.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
Tested by running:

MACHINE=qemuarm devtool modify u-boot
MACHINE=qemuarm devtool build u-boot
[modify configs/qemu_arm_defconfig]
MACHINE=qemuarm devtool build u-boot
MACHINE=qemuarm bitbake-diffsigs -t u-boot compile
[Checksum for file oe-devtool-tree-sha1-u-boot changed]

Apply the patch, then run:

MACHINE=qemuarm devtool build u-boot
[modify configs/qemu_arm_defconfig]
MACHINE=qemuarm devtool build u-boot
MACHINE=qemuarm bitbake-diffsigs -t u-boot compile
[Hash for task dependency u-boot:do_configure changed
    Checksum for file qemu_arm_defconfig changed]
---
 meta/recipes-bsp/u-boot/u-boot-configure.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
index 235623d25a..378d675364 100644
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -8,6 +8,8 @@ inherit uboot-config cml1
 
 DEPENDS += "kern-tools-native"
 
+CONFIGURE_FILES = "${@d.getVar('UBOOT_MACHINE') or '.config'}"
+
 do_configure () {
     if [ -n "${UBOOT_CONFIG}" ]; then
         unset i j

---
base-commit: 94f99434eff15a92cfdc2dce423d32a1b74aab39
change-id: 20240321-u-boot-defconfig-devtool-905683a1bedc

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>


