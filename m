Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBD076FB8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 18:26:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 05 Sep 2015 11:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,475,1437462000"; d="scan'208";a="783526855"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2015 11:26:33 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Sep 2015 10:17:26 +0000
Message-Id: <a478eadc586baf9c1c871dd6ccd46a9da3d5f250.1441448042.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441448042.git.mariano.lopez@linux.intel.com>
References: <cover.1441448042.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1441448042.git.mariano.lopez@linux.intel.com>
References: <cover.1441448042.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1 v2] testimage: handle SIGTERM to conclude runqemu
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
X-List-Received-Date: Sat, 05 Sep 2015 18:26:34 -0000

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

This also solves minimal breaks in the setup of the
runtime test when checking if qemu is alive.

[YOCTO #8239]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 12 +++++++++++-
 meta/lib/oeqa/oetest.py        |  6 +++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

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
-- 
1.8.4.5


