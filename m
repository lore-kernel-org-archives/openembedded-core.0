Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4D5C7EE22
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.88571.1682448497543569063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-0003kF-W3; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi1-00Dl5X-PP; Tue, 25 Apr 2023 20:48:13 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209f-Cq; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 6/9] oeqa/utils/commands: document runqemu context manager
Date: Tue, 25 Apr 2023 20:47:17 +0200
Message-Id: <20230425184720.456896-7-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425184720.456896-1-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 18:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180397

Usage and arguments are not necessarily self-explaining.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/utils/commands.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index c1f533802e..21e0265c9d 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -312,7 +312,22 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 @contextlib.contextmanager
 def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
     """
-    launch_cmd means directly run the command, don't need set rootfs or env vars.
+    Starts a context manager for a 'oeqa.targetcontrol.QemuTarget' resource.
+    The underlying Qemu will be booted into a shell when the generator yields.
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


