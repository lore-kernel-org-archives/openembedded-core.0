Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C424177E4D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 07:13:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 00:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,334,1517904000"; d="scan'208";a="38941158"
Received: from echidna.jf.intel.com ([10.54.77.42])
	by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2018 00:13:24 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 16:59:47 -0700
Message-Id: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe-selftest: crosstap: add tests for crosstap script
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
X-List-Received-Date: Tue, 20 Mar 2018 07:13:38 -0000

QA team were testing crosstap script  manually. Add automated
tests and systemtap file to test that crosstap script will
instructs SystemTap to print hello world in qemu. This test
will first built core-image-minimal image with tools-profile
& ssh-server-openssh features and build systemtap-native on
the host machine. Finally this test will boot the image with qemu
and then execute crosstap script to print hello world on qemu.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/files/trace_begin_hello.stp |  5 +++
 meta/lib/oeqa/selftest/cases/crosstap.py  | 65 +++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta/lib/oeqa/files/trace_begin_hello.stp
 create mode 100644 meta/lib/oeqa/selftest/cases/crosstap.py

diff --git a/meta/lib/oeqa/files/trace_begin_hello.stp b/meta/lib/oeqa/files/trace_begin_hello.stp
new file mode 100644
index 0000000..5ad5f15
--- /dev/null
+++ b/meta/lib/oeqa/files/trace_begin_hello.stp
@@ -0,0 +1,5 @@
+probe begin
+{
+  printf ("hello world\n")
+  exit ()
+}
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/crosstap.py b/meta/lib/oeqa/selftest/cases/crosstap.py
new file mode 100644
index 0000000..41c1d2f
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/crosstap.py
@@ -0,0 +1,65 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runCmd
+import os
+import sys
+import logging
+import bb.tinfoil
+import bb.build
+import oeqa.targetcontrol
+
+class CrossTapTest(OESelftestTestCase):
+
+    def start_qemu_with_image(self, recipe, fstypes, cmd, targetlogger):
+        tinfoil = bb.tinfoil.Tinfoil()
+        tinfoil.prepare(config_only=False, quiet=True)
+        try:
+            tinfoil.logger.setLevel(logging.WARNING)
+            tinfoil.config_data.setVar("TEST_LOG_DIR", "${WORKDIR}/testimage")
+            tinfoil.config_data.setVar("TEST_QEMUBOOT_TIMEOUT", "1000")
+            # Tell QemuTarget() whether need find rootfs/kernel or not
+            #tinfoil.config_data.setVar("FIND_ROOTFS", '0')
+            recipedata = tinfoil.parse_recipe(recipe)
+            logdir = recipedata.getVar("TEST_LOG_DIR")
+            qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, fstypes)
+        finally:
+            # We need to shut down tinfoil early here in case we actually want
+            # to run tinfoil-using utilities with the running QEMU instance.
+            # Luckily QemuTarget doesn't need it after the constructor.
+            tinfoil.shutdown()
+        print('DEBUG: qemu.deploy')
+        qemu.deploy()
+        try:
+            print('DEBUG: qemu.start')
+            qemu.start(ssh=True, launch_cmd=cmd, discard_writes=True)
+        except bb.build.FuncFailed:
+            raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
+
+        return qemu
+
+    def test_crosstap_can_use_systemtap_on_qemu(self):
+        self.write_config('EXTRA_IMAGE_FEATURES += "tools-profile ssh-server-openssh"')
+        result = bitbake('core-image-minimal')
+        self.assertEqual(result.status, 0, msg="Bitbake core-image-minimal failed. Bitbake output: %s" % result.output)
+        result = bitbake('systemtap-native')
+        self.assertEqual(result.status, 0, msg="Bitbake systemtap-native failed. Bitbake output: %s" % result.output)
+
+        recipe = 'core-image-minimal'
+        fstypes = "ext4 iso hddimg wic.vmdk wic.qcow2 wic.vdi"
+        machine =  'qemux86'
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        qemuboot_conf = "%s-%s.qemuboot.conf" % (recipe, machine)
+        qemuboot_conf = os.path.join(deploy_dir_image, qemuboot_conf)
+        cmd_common = "runqemu nographic"
+        cmd = "%s %s" % (cmd_common, qemuboot_conf)
+        # Need a non-'BitBake' logger to capture the runner output
+        targetlogger = logging.getLogger('TargetRunner')
+        targetlogger.setLevel(logging.DEBUG)
+        handler = logging.StreamHandler(sys.stdout)
+        targetlogger.addHandler(handler)
+        qemu = self.start_qemu_with_image(recipe, fstypes, cmd, targetlogger)
+        systap_file = os.path.join(self.tc.files_dir, 'trace_begin_hello.stp')
+        result = runCmd("crosstap root@%s %s" % (qemu.ip, systap_file))
+        qemu.stop()
+        targetlogger.removeHandler(handler)
+        print(result.output)
+        self.assertTrue('hello world' in result.output, 'Crosstap failed.')
-- 
2.7.4


