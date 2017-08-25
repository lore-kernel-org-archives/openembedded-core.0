Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0327478476
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:36 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Aug 2017 06:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="122556607"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 25 Aug 2017 06:42:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 9C24A58048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:45 +0300
Message-Id: <89c308096684417ff1da262afcfefb10cac67ef8.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/10] wic: setlftest: test expanding MBR image
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:37 -0000

Added test_expand_mbr_image test case to the wic oe-selftest suite.
The test expands directrisk wic image to 1Gb target, checks if it's
expanded correctly and boots it in qemu to make sure the image
is bootable, i.e. bootloader, kernel, boot and root partitions
are still functional.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index aaefd4f..aa73ba4 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -938,3 +938,56 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
+
+    def test_expand_mbr_image(self):
+        """Test wic write --expand command for mbr image"""
+        # build an image
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "directdisk.wks"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+
+        # get path to the image
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
+        deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
+        machine = bb_vars['MACHINE']
+        image_path = os.path.join(deploy_dir, 'core-image-minimal-%s.wic' % machine)
+
+        self.remove_config(config)
+
+        try:
+            # expand image to 1G
+            new_image_path = None
+            with NamedTemporaryFile(mode='wb', suffix='.wic.exp',
+                                    dir=deploy_dir, delete=False) as sparse:
+                sparse.truncate(1024 ** 3)
+                new_image_path = sparse.name
+
+            sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+            cmd = "wic write -n %s --expand 1:0 %s %s" % (sysroot, image_path, new_image_path)
+            self.assertEqual(0, runCmd(cmd).status)
+
+            # check if partitions are expanded
+            orig = runCmd("wic ls %s -n %s" % (image_path, sysroot))
+            exp = runCmd("wic ls %s -n %s" % (new_image_path, sysroot))
+            orig_sizes = [int(line.split()[3]) for line in orig.output.split('\n')[1:]]
+            exp_sizes = [int(line.split()[3]) for line in exp.output.split('\n')[1:]]
+            self.assertEqual(orig_sizes[0], exp_sizes[0]) # first partition is not resized
+            self.assertTrue(orig_sizes[1] < exp_sizes[1])
+
+            # Check if all free space is partitioned
+            result = runCmd("%s/usr/sbin/sfdisk -F %s" % (sysroot, new_image_path))
+            self.assertTrue("0 B, 0 bytes, 0 sectors" in result.output)
+
+            os.rename(image_path, image_path + '.bak')
+            os.rename(new_image_path, image_path)
+
+            # Check if it boots in qemu
+            with runqemu('core-image-minimal', ssh=False) as qemu:
+                cmd = "ls /etc/"
+                status, output = qemu.run_serial('true')
+                self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+        finally:
+            if os.path.exists(new_image_path):
+                os.unlink(new_image_path)
+            if os.path.exists(image_path + '.bak'):
+                os.rename(image_path + '.bak', image_path)
-- 
2.1.4


