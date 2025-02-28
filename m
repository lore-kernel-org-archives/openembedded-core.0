Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCD9C19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 07:42:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.10753.1740728561239945586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 23:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnv15-0006w0-IE; Fri, 28 Feb 2025 08:42:39 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnv14-003G0s-1o;
	Fri, 28 Feb 2025 08:42:38 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnv14-0060UM-1c;
	Fri, 28 Feb 2025 08:42:38 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] cml1.bbclass: use consistent make flags for menuconfig
Date: Fri, 28 Feb 2025 08:42:27 +0100
Message-Id: <20250228074227.1429276-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 07:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212052

The class called 'make menuconfig' without any of the make variables and
options set in EXTRA_OEMAKE, resulting in a quite different build
environment than actually intended.

For the kernel.bbclass this was fixed in commit 8c616bc0 ("kernel: Use
consistent make flags for menuconfig") by appending ${EXTRA_OEMAKE} to
KCONFIG_CONFIG_COMMAND.

Instead of fixing this individually for additional recipes, we simply
include ${EXTRA_OEMAKE} in KCONFIG_CONFIG_COMMAND by default.

For most class users, this change is directly visible in the generated
.config file:

* For barebox and u-boot, the CONFIG_GCC_VERSION erroneously reflected
  the host GCC version before where it now correctly reflects the target
  toolchain's GCC.

* For u-boot, also the "Compiler: " line at the beginning of the .config
  now prints the target toolchain instead of the host ones.

* The kernel had this already set.

* busybox did not produce any difference.

Note that these projects might base some compile-time decisions on e.g.
the actual compiler version used. Having the wrong one in the
menuconfig-generated .config affects at least the visibility and
consistency.

Reported-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-recipe/cml1.bbclass   | 2 +-
 meta/classes-recipe/kernel.bbclass | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 0bf171a668..efaee1428a 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -31,7 +31,7 @@ CROSS_CURSES_LIB = "-lncurses -ltinfo"
 CROSS_CURSES_INC = '-DCURSES_LOC="<curses.h>"'
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
-KCONFIG_CONFIG_COMMAND ??= "menuconfig"
+KCONFIG_CONFIG_COMMAND ??= "menuconfig ${EXTRA_OEMAKE}"
 KCONFIG_CONFIG_ENABLE_MENUCONFIG ??= "true"
 KCONFIG_CONFIG_ROOTDIR ??= "${B}"
 python do_menuconfig() {
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 6fe7c60e17..64a685a964 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -691,9 +691,6 @@ kernel_do_configure() {
 
 inherit cml1 pkgconfig
 
-# Need LD, HOSTLDFLAGS and more for config operations
-KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
-
 EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
-- 
2.39.5


