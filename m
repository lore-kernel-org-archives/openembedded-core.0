Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D6DC41513
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:16:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.16219.1717489007233632192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPLZ-0000vo-MF; Tue, 04 Jun 2024 10:16:45 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPLZ-000BM7-9t; Tue, 04 Jun 2024 10:16:45 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPLZ-007vhE-0p;
	Tue, 04 Jun 2024 10:16:45 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 1/2] oeqa/utils/commands: extend docstring for runqemu context manager
Date: Tue,  4 Jun 2024 10:16:29 +0200
Message-Id: <20240604081630.1889720-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200309

From: Enrico Jorns <ejo@pengutronix.de>

Usage and arguments are not necessarily self-explaining, thus add a bit
of documentation here.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/utils/commands.py | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 575e380017..bf2f49d0c0 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -314,7 +314,23 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 @contextlib.contextmanager
 def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
     """
-    launch_cmd means directly run the command, don't need set rootfs or env vars.
+    Starts a context manager for a 'oeqa.targetcontrol.QemuTarget' resource.
+    The underlying Qemu will be booted into a shell when the generator yields
+    and stopped when the 'with' block exits.
+
+    Usage:
+
+        with runqemu('core-image-minimal') as qemu:
+            qemu.run_serial('cat /proc/cpuinfo')
+
+    Args:
+        pn (str): (image) recipe to run on
+        ssh (boolean): whether or not to enable SSH (network access)
+        runqemuparams (str): space-separated list of params to pass to 'runqemu' script (like 'nographics', 'ovmf', etc.)
+        image_fstype (str): IMAGE_FSTYPE to use
+        launch_cmd (str): directly run this command and bypass automatic runqemu parameter generation
+        overrides (dict): dict of "'<bitbake-variable>': value" pairs that allows overriding bitbake variables
+        discard_writes (boolean): enables qemu -snapshot feature to prevent modifying original image
     """
 
     import bb.tinfoil
-- 
2.39.2


