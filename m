Return-Path: <bst@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3538C369B5
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:06:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.19573.1744722374842086217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1u4fzR-0008VJ-AT; Tue, 15 Apr 2025 15:06:13 +0200
From: Bastian Krause <bst@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [RFC PATCH oe-core 1/4] initramfs-framework: make RDEPENDS/RRECOMMENDS base package-specific
Date: Tue, 15 Apr 2025 15:06:05 +0200
Message-Id: <20250415130608.1804620-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214848

initramfs-framework itself is a meta package. It cannot be referenced in
PACKAGE_INSTALL directly, so the RDEPENDS/RRECOMMENDS do not have an
effect. So turn them into directives for initramfs-framework-base
instead.

Currently all users of initramfs-framework-* add
${VIRTUAL-RUNTIME_base-utils} explicitly to PACKAGE_INSTALL. For
`PACKAGE_CLASSES = "package_rpm"`, a dependency for `/bin/sh` is added by
RPM's shebang detection further hiding this issue.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index bb4984366d..184da4f39d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,8 +1,6 @@
 SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
-RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 
 inherit allarch
@@ -72,6 +70,7 @@ PACKAGES = "${PN}-base \
            "
 
 FILES:${PN}-base = "/init /init.d/99-finish /dev"
+RDEPENDS:${PN}-base += "${VIRTUAL-RUNTIME_base-utils}"
 
 # 99-finish in base depends on some other module which mounts
 # the rootfs, like 90-rootfs. To replace that default, use
@@ -79,7 +78,7 @@ FILES:${PN}-base = "/init /init.d/99-finish /dev"
 # initramfs recipe and install something else, or install
 # something that runs earlier (for example, a 89-my-rootfs)
 # and mounts the rootfs. Then 90-rootfs will proceed immediately.
-RRECOMMENDS:${PN}-base += "initramfs-module-rootfs"
+RRECOMMENDS:${PN}-base += "initramfs-module-rootfs ${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 SUMMARY:initramfs-module-exec = "initramfs support for easy execution of applications"
 RDEPENDS:initramfs-module-exec = "${PN}-base"
-- 
2.39.5


