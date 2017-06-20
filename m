Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 72EE7780BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 16:17:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 09:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="276513577"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2017 09:17:25 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id AED215803BB;
	Tue, 20 Jun 2017 09:17:25 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 11:22:00 -0500
Message-Id: <0da0f61da7d2a62088369ceea0d5c250125b419a.1497975577.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <cover.1497975577.git.humberto.ibarra.lopez@intel.com>
References: <cover.1497975577.git.humberto.ibarra.lopez@intel.com>
Subject: [PATCH v2 1/1] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Tue, 20 Jun 2017 16:17:25 -0000

Add new testcase to check varibale IMAGE_GEN_DEBUGFS. Test makes
sure that debug filesystem is created accordingly.

[YOCTO #10906]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 45a06fe..9a26253 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -3,6 +3,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.sshcontrol import SSHControl
 import os
+import glob
 
 class ImageFeatures(OESelftestTestCase):
 
@@ -123,3 +124,28 @@ class ImageFeatures(OESelftestTestCase):
         # check if result image is sparse
         image_stat = os.stat(image_path)
         self.assertTrue(image_stat.st_size > image_stat.st_blocks * 512)
+
+    def test_image_gen_debugfs(self):
+        """
+        Summary:     Check debugfs generation
+        Expected:    1. core-image-minimal can be build with IMAGE_GEN_DEBUGFS variable set
+                     2. debug filesystem is created when variable set
+        Product:     oe-core
+        Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+        """
+
+        image_name = 'core-image-minimal'
+        clean_cmd = '-c clean %s' % image_name
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+
+        for pack_class in [ "rpm", "deb", "ipk"]:
+            bitbake(clean_cmd)
+            features = 'IMAGE_GEN_DEBUGFS = "1"\n'
+            features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
+            features += 'PACKAGE_CLASSES = "package_%s"' % pack_class
+            self.write_config(features)
+
+            bitbake(image_name)
+            debug_files = glob.glob(os.path.join(deploy_dir_image,"*-dbg.rootfs.tar.bz2"))
+            self.assertNotEqual(len(debug_files), 0,
+                    'debug filesystem not generated for %s' % pack_class)
-- 
2.7.5


