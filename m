Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CF3E66AF53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:46:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2013 09:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="369245218"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2013 09:46:48 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 5A8AD6A4092
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:46:47 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 19:46:51 +0300
Message-Id: <b967c234f34d8aec6d13e13e7fa2b7c111475668.1373647359.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
Subject: [PATCH 3/8] testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout configurable and increase it
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
X-List-Received-Date: Fri, 12 Jul 2013 16:46:47 -0000

On a loaded host (such as an AB setup where multiple builds run)
the 200 seconds timeout might not be enough to reach the login prompt.
Also make it configurable so we can set it from local.conf/auto.conf

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass    |  6 ++++++
 meta/lib/oeqa/utils/qemurunner.py | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 35c6811..f66f514 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -7,6 +7,8 @@ DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh connman rpm smart gcc xor
 
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
+TEST_QEMUBOOT_TIMEOUT ?= "500"
+
 python do_testimage() {
     testimage_main(d)
 }
@@ -65,6 +67,10 @@ def testimage_main(d):
     qemu.tmpdir = d.getVar("TMPDIR", True)
     qemu.display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
     qemu.logfile = os.path.join(testdir, "qemu_boot_log.%s" % d.getVar('DATETIME', True))
+    try:
+        qemu.boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True))
+    except ValueError:
+        qemu.boottime = 500
 
     bb.note("DISPLAY value: %s" % qemu.display)
     bb.note("rootfs file: %s" %  rootfs)
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 3132b68..ec92988 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -10,7 +10,7 @@ from oeqa.utils.oeqemuconsole import oeQemuConsole
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display = None, tmpdir = None, logfile = None):
+    def __init__(self, machine, rootfs, display = None, tmpdir = None, logfile = None, boottime = 400):
         # Popen object
         self.runqemu = None
 
@@ -25,6 +25,7 @@ class QemuRunner:
         self.display = display
         self.tmpdir = tmpdir
         self.logfile = logfile
+        self.boottime = boottime
 
     def launch(self, qemuparams = None):
 
@@ -49,7 +50,6 @@ class QemuRunner:
         self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
 
         bb.note("runqemu started, pid is %s" % self.runqemu.pid)
-        # wait at most 30 seconds until qemu pid appears
         bb.note("waiting at most 60 seconds for qemu pid")
         endtime = time.time() + 60
         while not self.is_alive() and time.time() < endtime:
@@ -59,8 +59,8 @@ class QemuRunner:
             bb.note("qemu started - qemu procces pid is %s" % self.qemupid)
 
             console = oeQemuConsole(self.streampath, self.logfile)
-            bb.note("Waiting at most 200 seconds for login banner")
-            (match, text) = console.read_all_timeout("login:", 200)
+            bb.note("Waiting at most %d seconds for login banner" % self.boottime )
+            (match, text) = console.read_all_timeout("login:", self.boottime)
 
             if match:
                 bb.note("Reached login banner")
@@ -80,7 +80,7 @@ class QemuRunner:
                     return False
             else:
                 console.close()
-                bb.note("Target didn't reached login boot in 120 seconds")
+                bb.note("Target didn't reached login boot in %d seconds" % self.boottime)
                 lines = "\n".join(text.splitlines()[-5:])
                 bb.note("Last 5 lines of text:\n%s" % lines)
                 bb.note("Check full boot log: %s" % self.logfile)
-- 
1.8.1.4


