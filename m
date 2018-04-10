Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4006B74537
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 01:46:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 18:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,434,1517904000"; d="scan'208";a="32430667"
Received: from echidna.jf.intel.com ([10.54.77.42])
	by orsmga007.jf.intel.com with ESMTP; 10 Apr 2018 18:46:04 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 11:32:33 -0700
Message-Id: <1523385153-167408-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Wed, 11 Apr 2018 01:46:04 -0000

QA team were testing crosstap script manually. Add automated
tests and systemtap file to test that crosstap script will
instructs SystemTap to print hello world in qemu. This test
will first built core-image-minimal image with tools-profile
& ssh-server-openssh features and build systemtap-native on
the host machine. Finally this test will boot the image with qemu
and then execute crosstap script to print hello world on qemu.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/files/trace_begin_hello.stp |  5 +++++
 meta/lib/oeqa/selftest/cases/crosstap.py  | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
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
index 0000000..57523cb
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/crosstap.py
@@ -0,0 +1,25 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars, runCmd, runqemu
+import os
+
+class CrossTapTest(OESelftestTestCase):
+
+    def test_crosstap_can_use_systemtap_on_qemu(self):
+        self.write_config('EXTRA_IMAGE_FEATURES += "tools-profile ssh-server-openssh"')
+        result = bitbake('core-image-minimal')
+        self.assertEqual(result.status, 0, msg="Bitbake core-image-minimal failed. Bitbake output: %s" % result.output)
+        result = bitbake('systemtap-native')
+        self.assertEqual(result.status, 0, msg="Bitbake systemtap-native failed. Bitbake output: %s" % result.output)
+
+        recipe = 'core-image-minimal'
+        bb_vars = get_bb_vars(['MACHINE', 'DEPLOY_DIR_IMAGE'])
+        machine =  bb_vars['MACHINE']
+        deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+        qemuboot_conf = "%s-%s.qemuboot.conf" % (recipe, machine)
+        qemuboot_conf = os.path.join(deploy_dir_image, qemuboot_conf)
+        cmd_common = "runqemu nographic"
+        cmd = "%s %s" % (cmd_common, qemuboot_conf)
+        with runqemu(recipe, ssh=True, launch_cmd=cmd) as qemu:
+            systap_file = os.path.join(self.tc.files_dir, 'trace_begin_hello.stp')
+            result = runCmd("crosstap root@%s %s" % (qemu.ip, systap_file))
+        self.assertTrue('hello world' in result.output, 'Crosstap failed.')
-- 
2.7.4


