Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6257689C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:05:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Aug 2015 02:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="775153158"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2015 02:04:36 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0D0D46A4087;
	Tue, 25 Aug 2015 02:03:45 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:13 +0300
Message-Id: <aced3a41376ba10d3b1d8e8b1eff0551a251ac95.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/17] oe-selftest: test generation of <image>.env
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
X-List-Received-Date: Tue, 25 Aug 2015 09:05:05 -0000

Added test case to check if <image>.env file is generated
and contains bitbake variables used in wic code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 117bd9d..639234b 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -23,6 +23,7 @@
 
 """Test cases for wic."""
 
+import os
 import sys
 
 from glob import glob
@@ -168,3 +169,21 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
+    def test19_image_env(self):
+        """Test generation of <image>.env files."""
+        image = 'core-image-minimal'
+        stdir = get_bb_var('STAGING_DIR_TARGET', image)
+        imgdatadir = os.path.join(stdir, 'imgdata')
+        basename = get_bb_var('IMAGE_BASENAME', image)
+        self.assertEqual(basename, image)
+        path = os.path.join(imgdatadir, basename) + '.env'
+        self.assertTrue(os.path.isfile(path))
+        with open(path) as envfile:
+            content = dict(line.split("=", 1) for line in envfile)
+            # test if variables used by wic present in the .env file
+            for var in ('IMAGE_ROOTFS', 'DEPLOY_DIR_IMAGE', 'BBLAYERS',
+                        'STAGING_DIR_NATIVE', 'STAGING_DATADIR', 'TARGET_SYS',
+                        'IMAGE_BASENAME', 'INITRAMFS_FSTYPES', 'MACHINE_ARCH',
+                        'IMAGE_LINK_NAME', 'STAGING_LIBDIR', 'ROOTFS_SIZE'):
+                self.assertTrue(var in content)
+                self.assertTrue(content[var])
-- 
2.1.4


