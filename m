Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D53CA75C61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 11:57:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2016 04:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="92857803"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2016 04:57:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id E4F686A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:44:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 12:36:32 +0300
Message-Id: <111f44cacf25799dc296b8e300b571d798067fdc.1461749328.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461749328.git.ed.bartosh@linux.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461749328.git.ed.bartosh@linux.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 3/3] selftest: add bmap test
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
X-List-Received-Date: Wed, 27 Apr 2016 11:57:02 -0000

Added test_bmap to imagefeatures tests.
It tests if bmap file is generated for the images and
if the image is sparse.

[YOCTO #9414]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 8a53899..08e382f 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -98,3 +98,30 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-weston
         bitbake('core-image-weston')
 
+    def test_bmap(self):
+        """
+        Summary:     Check bmap support
+        Expected:    1. core-image-minimal can be build with bmap support
+                     2. core-image-minimal is sparse
+        Product:     oe-core
+        Author:      Ed Bartosh <ed.bartosh@linux.intel.com>
+        """
+
+        features = 'IMAGE_FSTYPES += " ext4 ext4.bmap"'
+        self.write_config(features)
+
+        image_name = 'core-image-minimal'
+        bitbake(image_name)
+
+        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
+        image_path = os.path.join(deploy_dir, "%s.ext4" % link_name)
+        bmap_path = "%s.bmap" % image_path
+
+        # check if result image and bmap file are in deploy directory
+        self.assertTrue(os.path.exists(image_path))
+        self.assertTrue(os.path.exists(bmap_path))
+
+        # check if result image is sparse
+        image_stat = os.stat(image_path)
+        self.assertTrue(image_stat.st_size > image_stat.st_blocks * 512)
-- 
2.1.4


