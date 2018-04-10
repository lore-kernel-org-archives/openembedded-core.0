Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 73DF0744AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 08:42:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 01:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="45651622"
Received: from echidna.jf.intel.com ([10.54.77.42])
	by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2018 01:42:04 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 18:28:32 -0700
Message-Id: <1523323712-112201-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe-selftest: runqemu: add tests for qemu boot and shutdown
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
X-List-Received-Date: Tue, 10 Apr 2018 08:42:03 -0000

QA team were testing qemu boot image and shutdown on each
qemu architecture manually. Add automated test to test qemu boot on
ext4 and nfs, finally check that it can shutdown properly.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 70 ++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 47d41f5..f3ff015 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -3,9 +3,10 @@
 #
 
 import re
-
+import tempfile
+import time
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
 from oeqa.core.decorator.oeid import OETestID
 
 class RunqemuTests(OESelftestTestCase):
@@ -136,3 +137,68 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s" % (self.cmd_common, rootfs)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+# This test was designed as a separate class to test that shutdown
+# command will shutdown qemu as expected on each qemu architecture
+# based on the MACHINE configuration inside the config file
+# (eg. local.conf).
+#
+# This was different compared to RunqemuTests, where RunqemuTests was
+# dedicated for MACHINE=qemux86-64 where it test that qemux86-64 will
+# bootup various filesystem types, including live image(iso and hddimg)
+# where live image was not supported on all qemu architecture.
+class QemuTest(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(QemuTest, cls).setUpClass()
+        cls.recipe = 'core-image-minimal'
+        cls.machine =  get_bb_var('MACHINE')
+        cls.deploy_dir_image =  get_bb_var('DEPLOY_DIR_IMAGE')
+        cls.cmd_common = "runqemu nographic"
+        cls.qemuboot_conf = "%s-%s.qemuboot.conf" % (cls.recipe, cls.machine)
+        cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
+        bitbake(cls.recipe)
+
+    def _start_qemu_shutdown_check_if_shutdown_succeeded(self, qemu, timeout):
+        qemu.run_serial("shutdown -h now")
+        # Stop thread will stop the LoggingThread instance used for logging
+        # qemu through serial console, stop thread will prevent this code
+        # from facing exception (Console connection closed unexpectedly)
+        # when qemu was shutdown by the above shutdown command
+        qemu.runner.stop_thread()
+        time_track = 0
+        while True:
+            is_alive = qemu.check()
+            if not is_alive:
+                return True
+            if time_track > timeout:
+                return False
+            time.sleep(1)
+            time_track += 1
+
+    def test_qemu_can_shutdown(self):
+        self.assertExists(self.qemuboot_conf)
+        cmd = "%s %s" % (self.cmd_common, self.qemuboot_conf)
+        shutdown_timeout = 120
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            qemu_shutdown_succeeded = self._start_qemu_shutdown_check_if_shutdown_succeeded(qemu, shutdown_timeout)
+            self.assertTrue(qemu_shutdown_succeeded, 'Failed: %s does not shutdown within timeout(%s)' % (self.machine, shutdown_timeout))
+
+    def test_qemu_can_boot_nfs_and_shutdown(self):
+        self.assertExists(self.qemuboot_conf)
+        bitbake('meta-ide-support')
+        rootfs_tar = "%s-%s.tar.bz2" % (self.recipe, self.machine)
+        rootfs_tar = os.path.join(self.deploy_dir_image, rootfs_tar)
+        self.assertExists(rootfs_tar)
+        tmpdir = tempfile.mkdtemp(prefix='qemu_nfs')
+        tmpdir_nfs = os.path.join(tmpdir, 'nfs')
+        cmd_extract_nfs = 'runqemu-extract-sdk %s %s' % (rootfs_tar, tmpdir_nfs)
+        result = runCmd(cmd_extract_nfs)
+        self.assertEqual(0, result.status, "runqemu-extract-sdk didn't run as expected. %s" % result.output)
+        cmd = "%s nfs %s %s" % (self.cmd_common, self.qemuboot_conf, tmpdir_nfs)
+        shutdown_timeout = 120
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            qemu_shutdown_succeeded = self._start_qemu_shutdown_check_if_shutdown_succeeded(qemu, shutdown_timeout)
+            self.assertTrue(qemu_shutdown_succeeded, 'Failed: %s does not shutdown within timeout(%s)' % (self.machine, shutdown_timeout))
+        runCmd('rm -rf %s' % tmpdir)
-- 
2.7.4


