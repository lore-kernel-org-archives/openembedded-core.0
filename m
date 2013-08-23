Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DDEE56BA23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2013 08:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385514938"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 08:32:48 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 99D0E2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:46 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:31:00 +0300
Message-Id: <a623659f5aeb279f7db42e9e91c08155ad1207f8.1377269486.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 20/21] lib/oeqa/utils: qemurunner: improve kill and restart
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:48 -0000

Tweak QemuRunner so we can actually restart the
qemu target in a test (if we want more memory for example).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

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


