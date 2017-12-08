Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F0E81786E8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 21:04:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 13:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1234779"
Received: from jairdeje-mobl1.zpn.intel.com ([10.219.4.135])
	by orsmga007.jf.intel.com with ESMTP; 08 Dec 2017 13:04:01 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 15:03:56 -0600
Message-Id: <91239d937858880057ddc741cc6a80fda699575b.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <cover.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Subject: [PATCH V4 1/2] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Fri, 08 Dec 2017 21:04:01 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Add new testcase to check varibale IMAGE_GEN_DEBUGFS. Test makes
sure that debug filesystem is created accordingly.

[YOCTO #10906]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 0ffb686..88fdf96 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -4,6 +4,7 @@ from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.sshcontrol import SSHControl
 import os
 import json
+import glob
 
 class ImageFeatures(OESelftestTestCase):
 
@@ -238,3 +239,23 @@ USERADD_GID_TABLES += "files/static-group"
 """
         self.write_config(config)
         bitbake("core-image-base")
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


