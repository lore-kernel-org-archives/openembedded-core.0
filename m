Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E772771DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:13:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GADZAF004008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 03:13:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 03:13:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 03:13:28 -0700
Message-ID: <1cb116a66853942b33444ee1063fc9168d7b2228.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1489657029.git.liezhi.yang@windriver.com>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] selftest/runqemu.py: add it to test runqemu
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
X-List-Received-Date: Thu, 16 Mar 2017 10:13:34 -0000
Content-Type: text/plain

Usage:
$ oe-selftest -r runqemu

Current test cases:
$ runqemu nographic qemux86-64
$ runqemu nographic qemux86-64 ext4
$ runqemu nographic qemux86-64 iso
$ runqemu nographic core-image-minimal
$ runqemu nographic core-image-minimal vmdk
$ runqemu nographic core-image-minimal vdi
$ runqemu nographic tmp/deploy/images/qemux86-64
$ runqemu nographic tmp/deploy/images/qemux86-64 hddimg
$ runqemu nographic qemux86-64 slirp
$ runqemu nographic qemux86-64 slirp qcow2
$ runqemu nographic tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.qemuboot.conf
$ runqemu nographic tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4

Need more later:
- Test initramfs
- Test nfs
- Test when set DEPLOY_DIR_IMAGE and OECORE_NATIVE_SYSROOT
- And others which similate runqemu runs on SDK and eSDK.

[YOCTO #10249]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/runqemu.py | 136 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/runqemu.py

diff --git a/meta/lib/oeqa/selftest/runqemu.py b/meta/lib/oeqa/selftest/runqemu.py
new file mode 100644
index 0000000..c1d5c16
--- /dev/null
+++ b/meta/lib/oeqa/selftest/runqemu.py
@@ -0,0 +1,136 @@
+#
+# Copyright (c) 2017 Wind River Systems, Inc.
+#
+
+import re
+import logging
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
+from oeqa.utils.decorators import testcase
+
+class RunqemuTests(oeSelfTest):
+    """Runqemu test class"""
+
+    image_is_ready = False
+    deploy_dir_image = ''
+
+    def setUpLocal(self):
+        self.recipe = 'core-image-minimal'
+        self.machine =  'qemux86-64'
+        self.fstypes = "ext4 iso hddimg vmdk qcow2 vdi"
+        self.cmd_common = "runqemu nographic"
+
+        self.write_config(
+"""
+MACHINE = "%s"
+IMAGE_FSTYPES = "%s"
+# 10 means 1 second
+SYSLINUX_TIMEOUT = "10"
+"""
+% (self.machine, self.fstypes)
+        )
+
+        if not RunqemuTests.image_is_ready:
+            RunqemuTests.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+            bitbake(self.recipe)
+            RunqemuTests.image_is_ready = True
+
+    @testcase(2001)
+    def test_boot_machine(self):
+        """Test runqemu machine"""
+        cmd = "%s %s" % (self.cmd_common, self.machine)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+    @testcase(2002)
+    def test_boot_machine_ext4(self):
+        """Test runqemu machine ext4"""
+        cmd = "%s %s ext4" % (self.cmd_common, self.machine)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue('rootfs.ext4' in f.read(), "Failed: %s" % cmd)
+
+    @testcase(2003)
+    def test_boot_machine_iso(self):
+        """Test runqemu machine iso"""
+        cmd = "%s %s iso" % (self.cmd_common, self.machine)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(' -cdrom ' in f.read(), "Failed: %s" % cmd)
+
+    @testcase(2004)
+    def test_boot_recipe_image(self):
+        """Test runqemu recipe-image"""
+        cmd = "%s %s" % (self.cmd_common, self.recipe)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+    @testcase(2005)
+    def test_boot_recipe_image_vmdk(self):
+        """Test runqemu recipe-image vmdk"""
+        cmd = "%s %s vmdk" % (self.cmd_common, self.recipe)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue('format=vmdk' in f.read(), "Failed: %s" % cmd)
+
+    @testcase(2006)
+    def test_boot_recipe_image_vdi(self):
+        """Test runqemu recipe-image vdi"""
+        cmd = "%s %s vdi" % (self.cmd_common, self.recipe)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue('format=vdi' in f.read(), "Failed: %s" % cmd)
+
+    @testcase(2007)
+    def test_boot_deploy(self):
+        """Test runqemu deploy_dir_image"""
+        cmd = "%s %s" % (self.cmd_common, self.deploy_dir_image)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+    @testcase(2008)
+    def test_boot_deploy_hddimg(self):
+        """Test runqemu deploy_dir_image hddimg"""
+        cmd = "%s %s hddimg" % (self.cmd_common, self.deploy_dir_image)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(re.search('file=.*.hddimg', f.read()), "Failed: %s" % cmd)
+
+    @testcase(2009)
+    def test_boot_machine_slirp(self):
+        """Test runqemu machine slirp"""
+        cmd = "%s slirp %s" % (self.cmd_common, self.machine)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(' -netdev user' in f.read(), "Failed: %s" % cmd)
+
+    @testcase(2009)
+    def test_boot_machine_slirp_qcow2(self):
+        """Test runqemu machine slirp qcow2"""
+        cmd = "%s slirp qcow2 %s" % (self.cmd_common, self.machine)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue('format=qcow2' in f.read(), "Failed: %s" % cmd)
+
+    @testcase(2010)
+    def test_boot_qemu_boot(self):
+        """Test runqemu /path/to/image.qemuboot.conf"""
+        qemuboot_conf = "%s-%s.qemuboot.conf" % (self.recipe, self.machine)
+        qemuboot_conf = os.path.join(self.deploy_dir_image, qemuboot_conf)
+        if not os.path.exists(qemuboot_conf):
+            self.skipTest("%s not found" % qemuboot_conf)
+        cmd = "%s %s" % (self.cmd_common, qemuboot_conf)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+
+    @testcase(2011)
+    def test_boot_rootfs(self):
+        """Test runqemu /path/to/rootfs.ext4"""
+        rootfs = "%s-%s.ext4" % (self.recipe, self.machine)
+        rootfs = os.path.join(self.deploy_dir_image, rootfs)
+        if not os.path.exists(rootfs):
+            self.skipTest("%s not found" % rootfs)
+        cmd = "%s %s" % (self.cmd_common, rootfs)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
-- 
2.9.0


