Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DAFD660191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 03:38:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 30 May 2017 20:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,421,1491289200"; d="scan'208";a="862986394"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 30 May 2017 20:38:19 -0700
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id 995AD58038B;
	Tue, 30 May 2017 20:38:18 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 20:38:17 -0700
Message-Id: <1496201897-48058-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v2] oeqa/selftest: Adds verification for the integrity compressed images
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
X-List-Received-Date: Wed, 31 May 2017 03:38:19 -0000

Added verification for images compression divided in 3 steps.
1. Add IMAGE_FSTYPES += "[type(s)]" to ~/conf/local.conf
2. Build a "core-image-minimal" using this configuration.
3. Verify that the image compressed file is present in rootfs directory.
YOCTO[#10745]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/runtime-test.py | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 13a4c03..4c5e7cc 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -236,3 +236,47 @@ postinst-delayed-t \
                     sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
                     result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
                     self.assertEqual(result.status, 0, 'File %s was not created at firts boot'% fileboot_name)
+
+class GeneratedImages(oeSelfTest):
+    @testcase(1845)
+    def test_integrity_compressed_images(self):
+        """
+        Summary: The purpose of this test is to verify the correct behavior of all the available images compression.
+        Bugzilla ID: [10745]
+        Steps:
+            1. Add IMAGE_FSTYPES += "[type(s)]" to ~/conf/local.conf
+            2. Build a "core-image-minimal" using this configuration.
+            3. Verify that the image compressed file is present in rootfs directory.
+        """
+        # Step 1 Add configuration to conf/local.conf
+        features = 'btrfs ' + \
+'cpio cpio.gz cpio.lz4 cpio.lzma cpio.xz ' + \
+'cramfs ' + \
+'elf ' + \
+'ext2 ext2.bz2 ext2.gz ext2.lzma ext3 ext3.gz ext4 ext4.gz ' + \
+'hdddirect hddimg ' + \
+'iso ' + \
+'jffs2 jffs2.sum ' + \
+'multiubi ' + \
+'qcow2 ' + \
+'squashfs squashfs-lzo squashfs-xz ' + \
+'tar tar.bz2 tar.gz tar.lz4 tar.xz ' + \
+'ubi ubifs ' + \
+'vdi ' + \
+'vmdk ' + \
+'wic wic.bz2 wic.gz wic.lzma ' 
+        features_list = features.split()
+        self.write_config('IMAGE_FSTYPES = "%s"' % features)
+        # Setp 2 Compile.
+        build = 'core-image-minimal'
+        bitbake(build)
+        for image_feature in features_list:
+            # Step 3 Verify compressed images are present in rottfs directory.
+            need_vars = ['DEPLOY_DIR_IMAGE','MACHINE']
+            bb_vars = get_bb_vars(need_vars, 'core-image-minimal')
+            deploy_dir_image = bb_vars['DEPLOY_DIR_IMAGE']
+            machine = bb_vars['MACHINE']
+            compressed_file = "%s-%s.%s" % (build, machine, image_feature)
+            complete_path = os.path.join(deploy_dir_image, compressed_file)
+            msg = "Couldn't find compressed file: %s" % complete_path
+            self.assertEqual(os.path.isfile(complete_path), True, msg)
-- 
1.8.3.1


