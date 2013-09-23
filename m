Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EA5A06007B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 07:57:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2013 00:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,960,1371106800"; d="scan'208";a="405696039"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2013 00:57:56 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 790EB6A4092;
	Mon, 23 Sep 2013 00:57:53 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 10:58:11 +0300
Message-Id: <1379923091-8294-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] classes/testimage: add informational messages about tests and do some cleanup/formatting
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
X-List-Received-Date: Mon, 23 Sep 2013 07:57:55 -0000

Adds info about tests run even if they passed (in case of errors log will
be printed anyway). Also some style change for qemu object.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 9ecef68..86bf22e 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -85,6 +85,7 @@ def testimage_main(d):
     import oeqa.runtime
     import re
     import shutil
+    import time
     from oeqa.oetest import runTests
     from oeqa.utils.sshcontrol import SSHControl
     from oeqa.utils.qemurunner import QemuRunner
@@ -114,21 +115,23 @@ def testimage_main(d):
     #will handle fs type eventually, stick with ext3 for now
     #make a copy of the original rootfs and use that for tests
     origrootfs=os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME",True) + '.ext3')
-    rootfs=os.path.join(testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.ext3')
+    testrootfs=os.path.join(testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.ext3')
     try:
-        shutil.copyfile(origrootfs, rootfs)
+        shutil.copyfile(origrootfs, testrootfs)
     except Exception as e:
         bb.fatal("Error copying rootfs: %s" % e)
 
-    qemu = QemuRunner(machine, rootfs)
-    qemu.tmpdir = d.getVar("TMPDIR", True)
-    qemu.deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True)
-    qemu.display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
-    qemu.logfile = os.path.join(testdir, "qemu_boot_log.%s" % d.getVar('DATETIME', True))
     try:
-        qemu.boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True))
+        boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True))
     except ValueError:
-        qemu.boottime = 500
+        boottime = 1000
+
+    qemu = QemuRunner(machine=machine, rootfs=testrootfs,
+                        tmpdir = d.getVar("TMPDIR", True),
+                        deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
+                        display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
+                        logfile = os.path.join(testdir, "qemu_boot_log.%s" % d.getVar('DATETIME', True)),
+                        boottime = boottime)
 
     qemuloglink = os.path.join(testdir, "qemu_boot_log")
     if os.path.islink(qemuloglink):
@@ -141,12 +144,12 @@ def testimage_main(d):
         os.unlink(sshloglink)
     os.symlink(sshlog, sshloglink)
 
-
     bb.note("DISPLAY value: %s" % qemu.display)
-    bb.note("rootfs file: %s" %  rootfs)
+    bb.note("rootfs file: %s" %  qemu.rootfs)
     bb.note("Qemu log file: %s" % qemu.logfile)
     bb.note("SSH log file: %s" %  sshlog)
 
+    pn = d.getVar("PN", True)
     #catch exceptions when loading or running tests (mostly our own errors)
     try:
         if qemu.launch():
@@ -156,14 +159,19 @@ def testimage_main(d):
             tc.qemu = qemu
             tc.target = SSHControl(host=qemu.ip,logfile=sshlog)
             # run tests and get the results
+            starttime = time.time()
             result = runTests(tc)
-
+            stoptime = time.time()
             if result.wasSuccessful():
-                bb.note("All required tests passed")
+                bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+                msg = "%s - OK - All required tests passed" % pn
+                skipped = len(result.skipped)
+                if skipped:
+                    msg += " (skipped=%d)" % skipped
+                bb.plain(msg)
             else:
-                raise bb.build.FuncFailed("Some tests failed. You should check the task log and the ssh log. (ssh log is %s" % sshlog)
-
+                raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
         else:
-            raise bb.build.FuncFailed("Failed to start qemu. You should check the task log and the qemu boot log (qemu log is %s)" % qemu.logfile)
+            raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % pn)
     finally:
         qemu.kill()
-- 
1.8.3.1


