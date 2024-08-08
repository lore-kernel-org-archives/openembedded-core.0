Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0FDC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 11:04:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.57387.1723115092932398569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 04:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sc0wt-00089Y-0E; Thu, 08 Aug 2024 13:04:51 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sc0ws-005PYG-JJ; Thu, 08 Aug 2024 13:04:50 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sc0ws-00H7Ta-1k;
	Thu, 08 Aug 2024 13:04:50 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] archiver.bbclass: fix BB_GENERATE_MIRROR_TARBALLS checking
Date: Thu,  8 Aug 2024 13:04:09 +0200
Message-Id: <20240808110409.4077831-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 11:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203131

The variable 'have_mirror_tarballs' is used as a boolean while it is
actually the result of 'd.getVar('BB_GENERATE_MIRROR_TARBALLS')' and
thus a string.

Fix this by converting it into a boolean before using it.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9d286224d6..9c8b0daf31 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -339,7 +339,7 @@ python do_ar_mirror() {
     dl_dir = d.getVar('DL_DIR')
     mirror_exclusions = (d.getVar('ARCHIVER_MIRROR_EXCLUDE') or '').split()
     mirror_mode = d.getVarFlag('ARCHIVER_MODE', 'mirror')
-    have_mirror_tarballs = d.getVar('BB_GENERATE_MIRROR_TARBALLS')
+    have_mirror_tarballs = d.getVar('BB_GENERATE_MIRROR_TARBALLS') == "1"
 
     if mirror_mode == 'combined':
         destdir = d.getVar('ARCHIVER_COMBINED_MIRRORDIR')
-- 
2.39.2


