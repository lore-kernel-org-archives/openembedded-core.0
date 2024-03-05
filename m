Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57460C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 21:58:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.1390.1709675922117281476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 13:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rhco3-000727-Ua; Tue, 05 Mar 2024 22:58:39 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1rhco2-004cr8-Ux; Tue, 05 Mar 2024 22:58:38 +0100
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1rhco2-000s7R-2v;
	Tue, 05 Mar 2024 22:58:38 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 1/2] cml1: remove needless check for write_taint attribute
Date: Tue,  5 Mar 2024 22:57:27 +0100
Message-Id: <20240305215728.207879-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 21:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196651

The 'FIXME' comment itself says to remove this once the minimum bitbake
version has been bumped. This was in 2012.

The function was introduced in bitbake commit f7b55a94 ("bitbake:
bitbake: ensure -f causes dependent tasks to be re-run") and is already
part of bitbake 1.15.3 which is the minimum bitbake version since
'danny'.

Remove the check.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-recipe/cml1.bbclass | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index c4e3c9ff7a..2da19cb4cf 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -61,16 +61,14 @@ python do_menuconfig() {
     oe_terminal("sh -c 'make %s; if [ \\$? -ne 0 ]; then echo \"Command failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
 
-    # FIXME this check can be removed when the minimum bitbake version has been bumped
-    if hasattr(bb.build, 'write_taint'):
-        try:
-            newmtime = os.path.getmtime(config)
-        except OSError:
-            newmtime = 0
-
-        if newmtime > mtime:
-            bb.note("Configuration changed, recompile will be forced")
-            bb.build.write_taint('do_compile', d)
+    try:
+        newmtime = os.path.getmtime(config)
+    except OSError:
+        newmtime = 0
+
+    if newmtime > mtime:
+        bb.note("Configuration changed, recompile will be forced")
+        bb.build.write_taint('do_compile', d)
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
-- 
2.39.2


