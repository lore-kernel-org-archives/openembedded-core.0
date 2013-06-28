Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 792866AEC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:07:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 03:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="261338627"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jun 2013 03:04:16 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 5ADF66A4092
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:04:15 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 13:04:36 +0300
Message-Id: <930fa344649f35a278842c94601b7e07bc82a103.1372413711.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 1/8] classes/testimage.bbclass: new class for image tests
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
X-List-Received-Date: Fri, 28 Jun 2013 10:07:32 -0000

Replacement class for imagetest-qemu.bbclass. It launches a qemu instance and
runs test modules defined in TEST_SUITES.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/classes/testimage.bbclass | 95 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 meta/classes/testimage.bbclass

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
new file mode 100644
index 0000000..82d0491
--- /dev/null
+++ b/meta/classes/testimage.bbclass
@@ -0,0 +1,95 @@
+TEST_LOG_DIR ?= "${WORKDIR}/testimage"
+
+DEFAULT_TEST_SUITES = "ping ssh auto"
+DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
+DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh connman rpm smart dmesg"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh connman rpm smart gcc dmesg"
+
+TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
+
+python do_testimage() {
+    testimage_main(d)
+}
+addtask testimage
+do_testimage[nostamp] = "1"
+do_testimage[depends] += "qemu-native:do_populate_sysroot"
+do_testimage[depends] += "qemu-helper-native:do_populate_sysroot"
+
+def testimage_main(d):
+    import unittest
+    import os
+    import oeqa.runtime
+    import re
+    from oeqa.oetest import createTestContext
+    from oeqa.utils.sshcontrol import SSHControl
+    from oeqa.utils.qemurunner import QemuRunner
+
+    testdir = d.getVar("TEST_LOG_DIR", True)
+    bb.utils.mkdirhier(testdir)
+    sshlog = os.path.join(testdir, "ssh_target_log.%s" % d.getVar('DATETIME', True))
+    sshloglink = os.path.join(testdir, "ssh_target_log")
+    if os.path.islink(sshloglink):
+        os.unlink(sshloglink)
+    os.symlink(sshlog, sshloglink)
+
+    # testsuite are modules - they are what the user wants (required tests)
+    testsuites = d.getVar("TEST_SUITES", True)
+    # testslist is what we'll run - order matters
+    # perhaps let the user decide if it wants the ssh test or not - it should be the first one though
+    #testslist = [ "ssh" ]
+    testslist = [ x for x in testsuites.split() if x != "auto" ]
+    # if we have auto search for other modules
+    if "auto" in testsuites:
+        for f in os.listdir(os.path.dirname(os.path.abspath(oeqa.runtime.__file__))):
+            if f.endswith('.py') and not f.startswith('_')  and f[:-3] not in testslist:
+                testslist.append(f[:-3])
+
+    testslist = [ "oeqa.runtime." + x for x in testslist ]
+
+    bb.note("Test modules  %s" % testslist)
+
+    class TestContext:
+        def __init__(self):
+            self.d = d
+            self.testslist = testslist
+            self.testsrequired = testsuites.split()
+            self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
+
+    # test context
+    tc = TestContext()
+
+    # prepare qemu instance
+    # and boot each supported fs type
+    machine=d.getVar("MACHINE", True)
+    #will handle fs type eventually, stick with ext3 for now
+    rootfs=d.getVar("DEPLOY_DIR_IMAGE", True) + '/' + d.getVar("IMAGE_BASENAME",True) + '-' + machine + '.ext3'
+
+    qemu = QemuRunner(machine, rootfs)
+    qemu.tmpdir = d.getVar("TMPDIR", True)
+    qemu.display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
+    qemu.logfile = os.path.join(testdir, "qemu_boot_log.%s" % d.getVar('DATETIME', True))
+
+    #catch exceptions when loading or running tests (mostly our own errors)
+    try:
+        if qemu.launch():
+
+            # prepare test suite, loader and runner
+            suite = unittest.TestSuite()
+            runner = unittest.TextTestRunner(verbosity=2)
+            # set more context - ssh instance and qemu - we do this here because we needed the qemu ip
+            tc.qemu = qemu
+            tc.target = SSHControl(host=qemu.ip,logfile=sshlog)
+            # create suite
+            suite = createTestContext(tc)
+            bb.note("Found %s tests" % suite.countTestCases())
+            result = runner.run(suite)
+
+            if result.wasSuccessful():
+                bb.note("All required tests passed")
+            else:
+                raise bb.build.FuncFailed("Some tests failed. You should check the task log and the ssh log. (ssh log is %s" % sshlog)
+
+        else:
+            raise bb.build.FuncFailed("Failed to start qemu. You should check the task log and the qemu boot log (qemu log is %s)" % qemu.logfile)
+    finally:
+        qemu.kill()
-- 
1.8.1.4


