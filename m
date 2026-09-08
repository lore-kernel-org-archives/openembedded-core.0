Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E406FC79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 11:17:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4807.1788866267804390653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 04:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: f.pflug@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1x3tph-0001SU-G6; Tue, 08 Sep 2026 13:17:45 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Fabian Pflug <f.pflug@pengutronix.de>
Subject: [PATCH] iproute2: Add subpackage for dcb command
Date: Tue,  8 Sep 2026 13:16:56 +0200
Message-ID: <20260908111714.1070763-1-f.pflug@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 11:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245361

The dcb command is part of iproute2 and is used to show / manipulate
DCB (Data Center Bridging) settings. This patch adds options to build
and include it.

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
index 096601029c..b6f155d03f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
@@ -27,8 +27,9 @@ PACKAGECONFIG[devlink] = ",,libmnl,"
 PACKAGECONFIG[iptables] = ",,iptables"
 PACKAGECONFIG[rdma] = ",,libmnl,"
 PACKAGECONFIG[selinux] = ",,libselinux"
+PACKAGECONFIG[dcb] = ",,libmnl,"
 
-IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma', d)}"
+IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma dcb', d)}"
 
 # This is needed with GCC-14 and musl
 CFLAGS += "-Wno-error=incompatible-pointer-types"
@@ -79,6 +80,7 @@ IPROUTE2_PACKAGES =+ "\
     ${PN}-tc \
     ${PN}-tipc \
     ${PN}-rdma \
+    ${PN}-dcb \
 "
 
 PACKAGE_BEFORE_PN += "${IPROUTE2_PACKAGES}"
@@ -100,6 +102,7 @@ FILES:${PN}-devlink = "${base_sbindir}/devlink"
 FILES:${PN}-rdma = "${base_sbindir}/rdma"
 FILES:${PN}-routel = "${base_sbindir}/routel"
 FILES:${PN}-bridge = "${base_sbindir}/bridge"
+FILES:${PN}-dcb = "${base_sbindir}/dcb"
 
 RDEPENDS:${PN}-routel = "python3-core"
 
-- 
2.47.3


