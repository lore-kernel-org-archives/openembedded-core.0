Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A0BD672F60
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 19:29:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2017 12:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,307,1493708400"; d="scan'208";a="977532223"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Jun 2017 12:29:59 -0700
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id E6D365802EB;
	Tue,  6 Jun 2017 12:29:58 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 12:29:58 -0700
Message-Id: <1496777398-4493-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v3] oeqa/selftest: Adds verification for the integrity compressed images
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
X-List-Received-Date: Tue, 06 Jun 2017 19:30:00 -0000

Added verification for images compression divided in 3 steps.
1. Add IMAGE_FSTYPES += "[type(s)]" to ~/conf/local.conf
2. Build a "core-image-minimal" using this configuration.
3. Verify that the image compressed file is present in rootfs directory.
YOCTO[#10745]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 9fec4d8..d0e467e 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -237,3 +237,36 @@ postinst-delayed-t \
                     sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
                     result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
                     self.assertEqual(result.status, 0, 'File %s was not created at firts boot'% fileboot_name)
+
+class GeneratedImages(OESelftestTestCase):
+    @OETestID(1845)
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
+        image_types = get_bb_var('IMAGE_TYPES', 'core-image-minimal')
+        features = 'IMAGE_CONTAINER_NO_DUMMY = "1"\n'
+        features_list = image_types.split()
+        self.write_config("IMAGE_FSTYPES += \"%s\"" % image_types)
+        self.append_config(features)
+        
+        # Step 2, compile.
+        build = 'core-image-minimal'
+        bitbake(build)
+        
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


