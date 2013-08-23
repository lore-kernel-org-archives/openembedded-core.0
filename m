Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 644386B9FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2013 11:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="367512552"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2013 11:04:42 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 994042C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:40 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:25 +0300
Message-Id: <a556ac9162c42ccbc31814f76f6cabd960e6553e.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 15/19] lib/oeqa: make it possible to restart the target
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:42 -0000

Tweak QemuRunner so we can actually restart the
qemu target in a test (if we want more memory for example).
Also add a restart method to the base test class so that tests
can use it.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/oetest.py           |  7 +++++++
 meta/lib/oeqa/utils/qemurunner.py | 28 +++++++++++++++++++++-------
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 7f6baa4..4a406e7 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -81,6 +81,13 @@ class oeRuntimeTest(unittest.TestCase):
         else:
             return False
 
+    @classmethod
+    def restartTarget(self,params=None):
+
+        if oeRuntimeTest.tc.qemu.restart(params):
+            oeRuntimeTest.tc.target.host = oeRuntimeTest.tc.qemu.ip
+        else:
+            raise Exception("Restarting target failed")
 
 
 def getmodule(pos=2):
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9ae618f..6ee5b85 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -32,6 +32,10 @@ class QemuRunner:
         self.boottime = boottime
         self.runqemutime = runqemutime
 
+        self.create_socket()
+
+    def create_socket(self):
+
         self.bootlog = ''
         self.qemusock = None
 
@@ -137,21 +141,31 @@ class QemuRunner:
         return self.is_alive()
 
     def kill(self):
+
+        if self.runqemu:
+            bb.note("Sending SIGTERM to runqemu")
+            os.kill(-self.runqemu.pid,signal.SIGTERM)
+            endtime = time.time() + self.runqemutime
+            while self.runqemu.poll() is None and time.time() < endtime:
+                time.sleep(1)
+            if self.runqemu.poll() is None:
+                bb.note("Sending SIGKILL to runqemu")
+                os.kill(-self.runqemu.pid,signal.SIGKILL)
+            self.runqemu = None
         if self.server_socket:
             self.server_socket.close()
             self.server_socket = None
-        if self.runqemu.pid:
-            os.kill(-self.runqemu.pid,signal.SIGTERM)
-            os.kill(-self.runqemu.pid,signal.SIGKILL)
-            self.runqemu.pid = None
         self.qemupid = None
         self.ip = None
 
     def restart(self, qemuparams = None):
-        if self.is_alive():
+        bb.note("Restarting qemu process")
+        if self.runqemu.poll() is None:
             self.kill()
-        bb.note("Qemu Restart required...")
-        return self.launch(qemuparams)
+        self.create_socket()
+        if self.launch(qemuparams):
+            return True
+        return False
 
     def is_alive(self):
         qemu_child = self.find_child(str(self.runqemu.pid))
-- 
1.8.3.1


