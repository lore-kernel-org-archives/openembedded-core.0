Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F2DCD7454A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 07:49:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 00:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,410,1517904000"; d="scan'208";a="217764691"
Received: from echidna.jf.intel.com ([10.54.77.42])
	by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2018 00:49:03 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 17:35:30 -0700
Message-Id: <1522888530-82278-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe-selftest: qemutest: add tests for qemu boot and shutdown
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
X-List-Received-Date: Thu, 05 Apr 2018 07:49:03 -0000

QA team were testing qemu boot image and shutdown on each qemu
architecture manually. Add automated test to test qemu boot on
ext4 and nfs, finally it can shutdown properly.

This tests was not included into existing runqemu.py as runqemu
was dedicated for qemux86-64 where it test various live image
(iso and hddimg) can boot but this live image was not supported
on other qemu architechture.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/qemutest.py | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/qemutest.py

diff --git a/meta/lib/oeqa/selftest/cases/qemutest.py b/meta/lib/oeqa/selftest/cases/qemutest.py
new file mode 100644
index 0000000..f06e3fd
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/qemutest.py
@@ -0,0 +1,44 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runCmd, runqemu
+import os
+import tempfile
+
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
+        result = bitbake(cls.recipe)
+
+    def test_qemu_can_shutdown(self):
+        if not os.path.exists(self.qemuboot_conf):
+            self.skipTest("%s not found" % self.qemuboot_conf)
+        cmd = "%s %s" % (self.cmd_common, self.qemuboot_conf)
+        with runqemu(self.recipe, ssh=True, launch_cmd=cmd) as qemu:
+            status, output = qemu.run("shutdown -h now")
+        self.assertEqual(status, 0, 'Failed: qemu shutdown')
+
+    def test_qemu_can_boot_nfs_and_shutdown(self):
+        bitbake('meta-ide-support')
+        rootfs_tar = "%s-%s.tar.bz2" % (self.recipe, self.machine)
+        rootfs_tar = os.path.join(self.deploy_dir_image, rootfs_tar)
+        if not os.path.exists(rootfs_tar):
+            self.skipTest("%s not found" % rootfs_tar)
+        tmpdir = tempfile.mkdtemp(prefix='qemu_nfs')
+        tmpdir_nfs = os.path.join(tmpdir, 'nfs')
+        cmd_extract_nfs = 'runqemu-extract-sdk %s %s' % (rootfs_tar, tmpdir_nfs)
+        runCmd(cmd_extract_nfs)
+        if not os.path.exists(self.qemuboot_conf):
+            self.skipTest("%s not found" % self.qemuboot_conf)
+        cmd = "%s nfs %s %s" % (self.cmd_common, self.qemuboot_conf, tmpdir_nfs)
+        with runqemu(self.recipe, ssh=True, launch_cmd=cmd) as qemu:
+            status, output = qemu.run("shutdown -h now")
+        self.assertEqual(status, 0, 'Failed: qemu shutdown')
+        runCmd('rm -rf %s' % tmpdir)
+
-- 
2.7.4


