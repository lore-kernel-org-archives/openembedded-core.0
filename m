Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EF5ECE582
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 07:21:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.17243.1725952860577223115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 00:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1snvBK-0004oJ-GN; Tue, 10 Sep 2024 09:20:58 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1snvBJ-006qD8-JV; Tue, 10 Sep 2024 09:20:57 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1snvBJ-00GYEd-1n;
	Tue, 10 Sep 2024 09:20:57 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH v4 5/7] oeqa: support passing custom boot patterns to runqemu
Date: Tue, 10 Sep 2024 09:20:04 +0200
Message-Id: <20240910072006.3938401-6-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910072006.3938401-1-ejo@pengutronix.de>
References: <20240910072006.3938401-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 07:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204330

From: Enrico Jorns <ejo@pengutronix.de>

This allows defining non-standard patterns from QEMU tests just as they
are already supported by the testimage.bbclass.

Will allow testing non-Linux shells in QEMU, too (e.g. a U-Boot shell or
another bootloader shell).

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/targetcontrol.py    | 5 +++--
 meta/lib/oeqa/utils/commands.py   | 5 +++--
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 6e8b781973..cdf382ee21 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -88,7 +88,7 @@ class QemuTarget(BaseTarget):
 
     supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
-    def __init__(self, d, logger, image_fstype=None):
+    def __init__(self, d, logger, image_fstype=None, boot_patterns=None):
 
         import oe.types
 
@@ -141,7 +141,8 @@ class QemuTarget(BaseTarget):
                             dump_dir = dump_dir,
                             logger = logger,
                             tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
-                            serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
+                            serial_ports = len(d.getVar("SERIAL_CONSOLES").split()),
+                            boot_patterns = boot_patterns)
 
         self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
         if (self.monitor_dumper):
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index bf2f49d0c0..ca22d69f29 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -312,7 +312,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
         f.write('LAYERSERIES_COMPAT_%s = "%s"\n' % (templayername, corenames))
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, boot_patterns = {}, discard_writes=True):
     """
     Starts a context manager for a 'oeqa.targetcontrol.QemuTarget' resource.
     The underlying Qemu will be booted into a shell when the generator yields
@@ -330,6 +330,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         image_fstype (str): IMAGE_FSTYPE to use
         launch_cmd (str): directly run this command and bypass automatic runqemu parameter generation
         overrides (dict): dict of "'<bitbake-variable>': value" pairs that allows overriding bitbake variables
+        boot_patterns (dict): dict of "'<pattern-name>': value" pairs to override default boot patterns, e.g. when not booting Linux
         discard_writes (boolean): enables qemu -snapshot feature to prevent modifying original image
     """
 
@@ -361,7 +362,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
 
         logdir = recipedata.getVar("TEST_LOG_DIR")
 
-        qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, image_fstype)
+        qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, image_fstype, boot_patterns=boot_patterns)
     finally:
         # We need to shut down tinfoil early here in case we actually want
         # to run tinfoil-using utilities with the running QEMU instance.
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 63fc6f6b53..5c3a8e5999 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -103,7 +103,7 @@ class QemuRunner:
 
         # Only override patterns that were set e.g. login user TESTIMAGE_BOOT_PATTERNS[send_login_user] = "webserver\n"
         for pattern in accepted_patterns:
-            if not self.boot_patterns[pattern]:
+            if pattern not in self.boot_patterns or not self.boot_patterns[pattern]:
                 self.boot_patterns[pattern] = default_boot_patterns[pattern]
 
     def create_socket(self):
-- 
2.39.2


