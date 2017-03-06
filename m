Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BF4BA77511
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:24:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 07:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="1105352389"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2017 07:24:13 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 12ACD6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:24:09 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 17:10:09 +0200
Message-Id: <c471f461c2a64223e8d4a2c3f9c7a38d8d2f0faf.1488812619.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488812619.git.ed.bartosh@linux.intel.com>
References: <cover.1488812619.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/5] qemurunner: add runqemuparams argument to commands.runqemu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Mar 2017 15:24:13 -0000

Added possibility to pass additional runqemu parameters
down the stack of APIs:
 commands.runqemu -> QemuTarget.start -> QemuRunner.start

This will be used to pass ovmf parameter in testing of
efi wic images under qemu.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py        | 4 ++--
 meta/lib/oeqa/utils/commands.py       | 4 ++--
 meta/lib/oeqa/utils/qemurunner.py     | 4 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d1f441f..dbd2c7c 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -176,8 +176,8 @@ class QemuTarget(BaseTarget):
         bb.note("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
-    def start(self, params=None, ssh=True, extra_bootparams=None):
-        if self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams):
+    def start(self, params=None, ssh=True, extra_bootparams=None, runqemuparams=''):
+        if self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams):
             if ssh:
                 self.ip = self.runner.ip
                 self.server_ip = self.runner.server_ip
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 0425c9f..73ede23 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True):
+def runqemu(pn, ssh=True, runqemuparams=''):
 
     import bb.tinfoil
     import bb.build
@@ -260,7 +260,7 @@ def runqemu(pn, ssh=True):
     try:
         qemu.deploy()
         try:
-            qemu.start(ssh=ssh)
+            qemu.start(ssh=ssh, runqemuparams=runqemuparams)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 21bc35a..19f0f92 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -95,7 +95,7 @@ class QemuRunner:
                 self._dump_host()
                 raise SystemExit
 
-    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None):
+    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams=''):
         if self.display:
             os.environ["DISPLAY"] = self.display
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
@@ -136,7 +136,7 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        launch_cmd = 'runqemu snapshot '
+        launch_cmd = 'runqemu snapshot %s ' % runqemuparams
         if self.use_kvm:
             logger.info('Using kvm for runqemu')
             launch_cmd += 'kvm '
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index d554f0d..ec52473 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -60,7 +60,7 @@ class QemuTinyRunner(QemuRunner):
             with open(self.logfile, "a") as f:
                 f.write("%s" % msg)
 
-    def start(self, qemuparams = None, ssh=True, extra_bootparams=None):
+    def start(self, qemuparams = None, ssh=True, extra_bootparams=None, runqemuparams=''):
 
         if self.display:
             os.environ["DISPLAY"] = self.display
-- 
2.1.4


