Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA13D4898C
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 11:56:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4450.1768564583223074226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 03:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1vgiRB-0001BI-N4; Fri, 16 Jan 2026 12:56:21 +0100
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1vgiRB-000uX2-2A;
	Fri, 16 Jan 2026 12:56:21 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <uol@pengutronix.de>)
	id 1vgiRA-0000000CT2o-3dxU;
	Fri, 16 Jan 2026 12:56:20 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH v2] initramfs-framework: add handover of PID 1's arguments
Date: Fri, 16 Jan 2026 12:56:19 +0100
Message-ID: <20260116115619.2971573-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229544

Although many PID 1 programs parse /proc/cmdline, let's follow the standard
convention and forward the command-line arguments received from the kernel to
the next PID 1 program.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
v1 -> v2:
  - Add missing SoB.
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework/init   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 21eaa5739343..69d555368d4c 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -42,7 +42,7 @@ finish_run() {
 		mount --move /run $ROOTFS_DIR/run
 
 		cd $ROOTFS_DIR
-		exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/init}
+		exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/init} "$@"
 	else
 		debug "No rootfs has been set"
 	fi
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index fe6e3cbf0782..51db083e2e53 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -154,7 +154,7 @@ for m in $MODULES_DIR/*; do
 	fi
 
 	debug "Running ${module}_run"
-	eval "${module}_run"
+	eval "${module}_run" "$@"
 
 	# post hooks
 	for h in $MODULE_POST_HOOKS; do
-- 
2.47.3


