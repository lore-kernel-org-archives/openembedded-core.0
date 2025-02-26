Return-Path: <bst@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE7AC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 09:45:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.2322.1740563107842177821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 01:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1tnDyU-00056J-0R; Wed, 26 Feb 2025 10:45:06 +0100
From: Bastian Krause <bst@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [PATCH] systemd: move sysusers.d systemd-remote to PN-journal-remote
Date: Wed, 26 Feb 2025 10:45:03 +0100
Message-Id: <20250226094503.3697222-1-bst@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211947

systemd's sysusers.d/systemd-remote.conf contains the user
"systemd-journal-remote" [1]. This file is currently not part of any
specific package.

To make this match the corresponding USERADD_PARAM:${PN}-journal-remote
for the same user, move the file to the correct package.

This prevents warnings in case PACKAGECONFIG contains "microhttpd" but
systemd-journal-remote is not installed, such as:

  WARNING: some-image-1.0-r0 do_rootfs: User systemd-journal-remote has never been defined

[1] https://github.com/systemd/systemd/blob/v257.3/sysusers.d/systemd-remote.conf

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta/recipes-core/systemd/systemd_257.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
index 03b9c9362a..324e91e051 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -531,6 +531,7 @@ FILES:${PN}-journal-upload = "${nonarch_libdir}/systemd/systemd-journal-upload \
 SYSTEMD_SERVICE:${PN}-journal-upload = "systemd-journal-upload.service"
 
 FILES:${PN}-journal-remote = "${nonarch_libdir}/systemd/systemd-journal-remote \
+                              ${nonarch_libdir}/sysusers.d/systemd-remote.conf \
                               ${sysconfdir}/systemd/journal-remote.conf \
                               ${systemd_system_unitdir}/systemd-journal-remote.service \
                               ${systemd_system_unitdir}/systemd-journal-remote.socket \
-- 
2.39.5


