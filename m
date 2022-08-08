Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AFFC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 04:21:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.21783.1659932512498240378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 21:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DWEjpN+r;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659932512; x=1691468512;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fP7EB2BYGaxbT48QgHyFe5PDkiLp+S5b+HzAt75joOQ=;
  b=DWEjpN+rn75ufrl1H3c3OWgJd8SJHx2RLPjM6uPSEJMvw3DxFuPTdMe8
   GHrDCesQEWcIxkkaAha6a4gfSoQ37Usv7oBqI/eweH9aybVQnd0ginsFY
   NAtLLgtXLFDils1hS6iLLmz+A8zjzdh5RLJuy1IyC54bpxDai5itdNoPA
   d4H47Z/g/XpyirEQ22cvPHNcFAB9KXxC+kb6AIJZfgyCmkFkI3+DlbKxs
   U+JekYJ+Ml5+/ECHom8pxtQ20Wk0gtxrwPeQDjv9RGmZuM3crDD5pewLg
   OY1T2n6ZqM9Llwb4T1eC3JPyNP5dfWUobWvvKUG7NMMlKSi5Tc1UrAeAG
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="273546787"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200";
   d="scan'208";a="273546787"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2022 21:21:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200";
   d="scan'208";a="632721994"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Aug 2022 21:21:50 -0700
From: Yogesh Tyagi <yogesh.tyagi@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdbserver : add selftest
Date: Mon,  8 Aug 2022 12:21:40 +0800
Message-Id: <20220808042140.12374-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 04:21:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169011

The test runs gdbserver on qemu and connects the gdb client from host over TCP.

It builds a cross gdb on the host and compiles the program to be debugged on the target,
launches the gdbserver and tries to connect cross gdb to it.

[YOCTO #13996]

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 122 ++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/gdbserver.py

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
new file mode 100644
index 0000000000..2c733a1342
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: MIT
+#
+import os
+from subprocess import Popen, PIPE
+import threading
+import time
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu , runCmd
+from oeqa.core.exception import OEQATimeoutError
+
+
+#The test runs gdbserver on qemu and connects the gdb client from host over TCP.
+#
+#It builds a cross gdb on the host and compiles the program to be debugged on the target,
+#launches the gdbserver and tries to connect cross gdb to it.
+
+
+class GdbTest(OESelftestTestCase):
+
+    def run_gdb(self, native_sysroot=None, **options):
+        # Add path to cross gdb to environment.
+        extra_paths = "%s/usr/bin/%s" % (self.recipe_sysroot_native, self.target_sys)
+        nenv = dict(options.get('env', os.environ))
+        nenv['PATH'] = extra_paths + ':' + nenv.get('PATH', '')
+        options['env'] = nenv
+
+        for count in range(5):
+            # Let the gdb server start before by putting client thread to sleep.
+            # Still, if gdb client happens to start before gdbserver, if will
+            # return "gdb connection timed out". In that case try
+            # connecting again
+            time.sleep(1)
+            cmd = "%s-gdb -ex 'set sysroot %s' -ex \"target remote %s:%s\" -ex continue -ex quit %s" \
+                       %(self.target_sys, self.recipe_sysroot_native, self.qemu_ip, self.gdbserver_port, self.binary)
+            r = runCmd(cmd, native_sysroot=self.recipe_sysroot_native, **options)
+            if "Connection timed out" not in r.output:
+                break
+            if count == 4:
+                self.assertTrue(False, "gdb unable to connect to gdbserver")
+
+    def run_gdb_client(self):
+        self.run_gdb(native_sysroot=self.recipe_sysroot_native, ignore_status=False)
+
+    def test_gdb_server(self):
+        self.target_dst = "/tmp/"
+        self.source  = "test.c"
+        self.binary  = "test"
+        self.target_source = self.target_dst + self.source
+        self.target_binary = self.target_dst + self.binary
+        self.gdbserver_port = 2001
+
+        try:
+            # These aren't the actual IP addresses but testexport class needs something defined
+            features  = 'TEST_SERVER_IP = "192.168.7.1"\n'
+            features += 'TEST_TARGET_IP = "192.168.7.2"\n'
+            features += 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh"\n'
+            features += 'CORE_IMAGE_EXTRA_INSTALL += "gdbserver packagegroup-core-buildessential"\n'
+            self.write_config(features)
+
+            self.target_arch = get_bb_var('TARGET_ARCH')
+            self.target_sys  = get_bb_var('TARGET_SYS')
+
+            recipe = "gdb-cross-%s" %self.target_arch
+            gdb_cross_bitbake_command = "%s -c addto_recipe_sysroot" %recipe
+
+            bitbake(gdb_cross_bitbake_command)
+
+            self.recipe_sysroot_native = get_bb_var('RECIPE_SYSROOT_NATIVE', recipe)
+
+            bitbake('core-image-minimal')
+
+            self.cross_gdb_name = "%s-gdb" %self.target_sys
+
+            # wrap the execution with a qemu instance
+            with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+                status, target_gcc = qemu.run_serial("which gcc")
+
+                self.assertNotEqual(target_gcc, None, 'gcc not found on the target')
+
+                self.qemu_ip = qemu.ip
+
+                # self.tc.files_dir = meta/lib/oeqa/files
+                src = os.path.join(self.tc.files_dir, 'test.c')
+
+                self.logger.debug("src : %s qemu.ip : %s self.target_dst : %s" % (src , self.qemu_ip , self.target_dst))
+                cmd = "scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR %s root@%s:%s"  % (src, qemu.ip, self.target_dst)
+                result = runCmd(cmd)
+
+                cmd = "cat %s" %(self.target_source)
+                status, output = qemu.run_serial(cmd)
+                self.assertIn("1234", output, "Source file copied to target is different that what is expected")
+
+                cmd = "%s %s -o %s -lm -g" % (target_gcc, self.target_source, self.target_binary)
+                status, output = qemu.run_serial(cmd)
+
+                cmd = "ls %s" %self.target_binary
+                status, output = qemu.run_serial(cmd)
+                self.assertNotIn("No such file or directory", output, "Test file compilation failed on target")
+
+                status, output = qemu.run_serial(self.target_binary)
+                self.assertIn("1234", output, "Test binary is different than what is expected")
+
+                cmd = "scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR root@%s:%s %s"  % (qemu.ip, self.target_binary, os.getcwd())
+                result = runCmd(cmd)
+
+                cmd = "strip -s --strip-debug %s" %self.target_binary
+                status, output = qemu.run_serial(cmd)
+
+                gdb_client_thread = threading.Thread(target=self.run_gdb_client)
+                gdb_client_thread.start()
+
+                cmd = "gdbserver localhost:%s %s" %(self.gdbserver_port, self.target_binary)
+                status, output = qemu.run_serial(cmd)
+                self.logger.debug("gdbserver status : %s output : %s" % (status, output))
+
+                gdb_client_thread.join()
+                self.assertIn("1234", output, "Expected string (1234) not present in test output")
+
+        except OEQATimeoutError:
+            self.fail("gdbserver test timeout error")
+
-- 
2.36.1


