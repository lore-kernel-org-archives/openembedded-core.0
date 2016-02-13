Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4F175E2D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 13 Feb 2016 03:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="47336522"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2016 03:12:35 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 8B9A16A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:26 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:13 +0200
Message-Id: <5dad0aa3cdf3970ab5be405f58235868962bfad7.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 06/14] oeqa/targetcontrol: make ssh control optional
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:35 -0000

Added new parameter 'ssh' to targetcontrol 'start' method
to be able to test images without running ssh server.

[YOCTO #8498]

(From OE-Core rev: 1c3c66aadd43092bc19242b0651ee810cc31fe7c)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/targetcontrol.py  | 18 ++++++++++--------
 meta/lib/oeqa/utils/commands.py |  4 ++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index edc0d01..f461651 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -68,7 +68,7 @@ class BaseTarget(object):
         bb.note("SSH log file: %s" %  self.sshlog)
 
     @abstractmethod
-    def start(self, params=None):
+    def start(self, params=None, ssh=True):
         pass
 
     @abstractmethod
@@ -176,11 +176,12 @@ class QemuTarget(BaseTarget):
         bb.note("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
-    def start(self, params=None):
-        if self.runner.start(params):
-            self.ip = self.runner.ip
-            self.server_ip = self.runner.server_ip
-            self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
+    def start(self, params=None, ssh=True):
+        if self.runner.start(params, get_ip=ssh):
+            if ssh:
+                self.ip = self.runner.ip
+                self.server_ip = self.runner.server_ip
+                self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
         else:
             self.stop()
             if os.path.exists(self.qemulog):
@@ -231,8 +232,9 @@ class SimpleRemoteTarget(BaseTarget):
     def deploy(self):
         super(SimpleRemoteTarget, self).deploy()
 
-    def start(self, params=None):
-        self.connection = SSHControl(self.ip, logfile=self.sshlog, port=self.port)
+    def start(self, params=None, ssh=True):
+        if ssh:
+            self.connection = SSHControl(self.ip, logfile=self.sshlog, port=self.port)
 
     def stop(self):
         self.connection = None
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 93a0e48..32e001c 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -178,7 +178,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn):
+def runqemu(pn, ssh=True):
 
     import bb.tinfoil
     import bb.build
@@ -222,7 +222,7 @@ def runqemu(pn):
     try:
         qemu.deploy()
         try:
-            qemu.start()
+            qemu.start(ssh=ssh)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
-- 
2.1.4


