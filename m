Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE519D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 19:17:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.940.1765221461644876811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 11:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1vSgjr-0008Lt-Nx
	for openembedded-core@lists.openembedded.org; Mon, 08 Dec 2025 20:17:39 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1vSgjr-004fOR-1f
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2025 20:17:39 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oe-depends-dot: handle packages with period in name
Date: Mon,  8 Dec 2025 20:17:39 +0100
Message-ID: <20251208191739.3238955-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 19:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227404

oe-depends-dot currently fails to look up the key when the package
name contains a period, as the key gets truncated in the split from
the task. Handle this by only splitting a single time from the right.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
An example of a problematic package is gstreamer1.0-plugins-base.
---
 scripts/oe-depends-dot | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index d02ee455f60f..10e8b1d3872d 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -114,8 +114,8 @@ Reduce the .dot file packages only, no tasks:
                 if key == "meta-world-pkgdata":
                     continue
                 dep = m.group(2)
-                key = key.split('.')[0]
-                dep = dep.split('.')[0]
+                key = key.rsplit('.', 1)[0]
+                dep = dep.rsplit('.', 1)[0]
                 if key == dep:
                     continue
                 if key in depends:
-- 
2.47.3


