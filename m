Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 066836AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:27:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2013 02:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="340862008"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2013 02:27:19 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id CF5D06A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 02:27:17 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 12:27:42 +0300
Message-Id: <9ee6302891d230c9d95fade86dccab92c946fb26.1373013888.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH v2 1/8] classes/testimage.bbclass: new class for image tests
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
X-List-Received-Date: Fri, 05 Jul 2013 09:27:22 -0000

Replacement class for imagetest-qemu.bbclass. It launches a qemu instance and
runs test modules defined in TEST_SUITES.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/classes/testimage.bbclass | 92 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 meta/classes/testimage.bbclass

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
new file mode 100644
index 0000000..35c6811
--- /dev/null
+++ b/meta/classes/testimage.bbclass
@@ -0,0 +1,92 @@
+TEST_LOG_DIR ?= "${WORKDIR}/testimage"
+
+DEFAULT_TEST_SUITES = "ping auto"
+DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
+DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh connman rpm smart xorg dmesg"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh connman rpm smart gcc xorg dmesg"
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
+    from oeqa.oetest import runTests
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
+    # tests in TEST_SUITES become required tests
+    # they won't be skipped even if they aren't suitable for a default image (like xorg for minimal)
+    testsuites = d.getVar("TEST_SUITES", True)
+    # testslist is what we'll run and order matters
+    testslist = [ x for x in testsuites.split() if x != "auto" ]
+    # if we have auto search for other modules
+    if "auto" in testsuites:
+        for f in os.listdir(os.path.dirname(os.path.abspath(oeqa.runtime.__file__))):
+            if f.endswith('.py') and not f.startswith('_')  and f[:-3] not in testslist:
+                testslist.append(f[:-3])
+
+    testslist = [ "oeqa.runtime." + x for x in testslist ]
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
+    bb.note("DISPLAY value: %s" % qemu.display)
+    bb.note("rootfs file: %s" %  rootfs)
+    bb.note("Qemu logfile: %s" % qemu.logfile)
+
+    #catch exceptions when loading or running tests (mostly our own errors)
+    try:
+        if qemu.launch():
+
+            # set more context - ssh instance and qemu
+            # we do these here because we needed qemu to boot and get the ip
+            tc.qemu = qemu
+            tc.target = SSHControl(host=qemu.ip,logfile=sshlog)
+            # run tests and get the results
+            result = runTests(tc)
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


