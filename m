Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69580C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 10:09:36 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28048.1785146974805146366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 03:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: f.pflug@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1woIH6-0006rR-Uo; Mon, 27 Jul 2026 12:09:32 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [PATCH] systemd: add watchdog device
Date: Mon, 27 Jul 2026 12:08:45 +0200
Message-ID: <20260727100926.3137215-1-f.pflug@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 10:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242080

Some systems may have multiple watchdogs and want systemd to manage a
different one. This patch allows to set the WatchdogDevice setting in
system.conf

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index f3ec0edae7..8cb523a330 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -253,6 +253,11 @@ WATCHDOG_TIMEOUT ??= "60"
 # and the watchdog is enabled. (defaults is no hardware watchdog use)
 WATCHDOG_RUNTIME_SEC ??= ""
 
+# If a different device, other then /dev/watchdog0 should be used, set
+# WATCHDOG_DEVICE_PATH to the full path to the watchdog device.
+# (Will set the WatchdogDevice= option in /etc/systemd/system.conf)
+WATCHDOG_DEVICE_PATH ??= ""
+
 do_install() {
 	meson_do_install
 
@@ -368,6 +373,11 @@ do_install() {
 			${D}/${sysconfdir}/systemd/system.conf
 	fi
 
+	if [ -n "${WATCHDOG_DEVICE_PATH}" ]; then
+		sed -i -e 's|#WatchdogDevice=|WatchdogDevice=${WATCHDOG_DEVICE_PATH}|' \
+			${D}/${sysconfdir}/systemd/system.conf
+	fi
+
 	# Actively disable Predictable Network Interface Names
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
 		sed -i 's/^NamePolicy=.*/NamePolicy=/;s/^AlternativeNamesPolicy=.*/AlternativeNamesPolicy=/' ${D}${nonarch_libdir}/systemd/network/99-default.link
-- 
2.47.3


