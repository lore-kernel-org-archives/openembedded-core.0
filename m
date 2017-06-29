Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 47BA6780F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 20:37:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 13:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,282,1496127600"; d="scan'208";a="105320483"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 29 Jun 2017 13:37:52 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 9F847580887;
	Thu, 29 Jun 2017 13:37:52 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 15:42:39 -0500
Message-Id: <86b8c1ceec0da4d3bc1e70befe19587e6b9d501a.1498768832.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <cover.1498768832.git.humberto.ibarra.lopez@intel.com>
References: <cover.1498768832.git.humberto.ibarra.lopez@intel.com>
Subject: [PATCH 1/1] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Thu, 29 Jun 2017 20:37:52 -0000

Add new testcase to check varibale IMAGE_GEN_DEBUGFS. Test makes
sure that debug filesystem is created accordingly.

[YOCTO #10906]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index e6652ec..8233957 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -3,6 +3,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.sshcontrol import SSHControl
 import os
+import glob
 
 class ImageFeatures(OESelftestTestCase):
 
@@ -124,3 +125,23 @@ class ImageFeatures(OESelftestTestCase):
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
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+
+        features = 'IMAGE_GEN_DEBUGFS = "1"\n'
+        features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"'
+        self.write_config(features)
+
+        bitbake(image_name)
+        debug_files = glob.glob(os.path.join(deploy_dir_image,"*-dbg.rootfs.tar.bz2"))
+        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not generated')
-- 
2.7.5


