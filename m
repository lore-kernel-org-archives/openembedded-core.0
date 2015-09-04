Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BF30C76FF2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 04:23:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 21:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,472,1437462000"; d="scan'208";a="555731734"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2015 21:23:11 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 20:14:08 +0000
Message-Id: <1441397648-16269-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] testimage: handle SIGTERM to conclude runqemu
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
X-List-Received-Date: Sat, 05 Sep 2015 04:23:14 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

In the current state if a SIGTERM is sent to
the testimage worker, the worker will exit but
runqemu and qemu won't exit and the processes
need to be killed manually to free the
bitbake lock.

This allows to catch the SIGTERM signal in
testimage, this way it is possible to stop
runqemu and qemu and allow to free the bitbake lock.

Also this allows to skip the rest of the tests
when running the tests in qemu or real hardware.

This also solves minimal breaks when handling the
SIGCHLD in qemurunner and when checking if qemu
is alive in the test setup.

[YOCTO #8239]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass    | 12 +++++++++++-
 meta/lib/oeqa/oetest.py           |  6 +++++-
 meta/lib/oeqa/utils/qemurunner.py |  3 +--
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 7c783ea..19a37cb 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -236,6 +236,7 @@ def testimage_main(d):
     import os
     import oeqa.runtime
     import time
+    import signal
     from oeqa.oetest import loadTests, runTests
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
@@ -273,12 +274,20 @@ def testimage_main(d):
             self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
             self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
             manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
+            self.sigterm = False
+            self.origsigtermhandler = signal.getsignal(signal.SIGTERM)
+            signal.signal(signal.SIGTERM, self.sigterm_exception)
             try:
                 with open(manifest) as f:
                     self.pkgmanifest = f.read()
             except IOError as e:
                 bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
 
+        def sigterm_exception(self, signum, stackframe):
+            bb.warn("TestImage received SIGTERM, shutting down...")
+            self.sigterm = True
+            self.target.stop()
+
     # test context
     tc = TestContext()
 
@@ -293,8 +302,8 @@ def testimage_main(d):
 
     target.deploy()
 
-    target.start()
     try:
+        target.start()
         if export:
             exportTests(d,tc)
         else:
@@ -311,6 +320,7 @@ def testimage_main(d):
             else:
                 raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
     finally:
+        signal.signal(signal.SIGTERM, tc.origsigtermhandler)
         target.stop()
 
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index ff62c30..0fe68d4 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -145,7 +145,11 @@ class oeRuntimeTest(oeTest):
         super(oeRuntimeTest, self).__init__(methodName)
 
     def setUp(self):
-        self.assertTrue(self.target.check(), msg = "Qemu not running?")
+        # Check if test needs to run
+        if self.tc.sigterm:
+            self.fail("Got SIGTERM")
+        elif (type(self.target).__name__ == "QemuTarget"):
+            self.assertTrue(self.target.check(), msg = "Qemu not running?")
 
     def tearDown(self):
         # If a test fails or there is an exception
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c04ee0d..4b29284 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -232,7 +232,7 @@ class QemuRunner:
         return self.is_alive()
 
     def stop(self):
-
+        signal.signal(signal.SIGCHLD, self.origchldhandler)
         self.stop_thread()
         if self.runqemu:
             logger.info("Sending SIGTERM to runqemu")
@@ -253,7 +253,6 @@ class QemuRunner:
             self.server_socket = None
         self.qemupid = None
         self.ip = None
-        signal.signal(signal.SIGCHLD, self.origchldhandler)
 
     def stop_thread(self):
         if self.thread and self.thread.is_alive():
-- 
1.8.4.5


