Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFE2731C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 12:46:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Apr 2016 05:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,536,1455004800"; d="scan'208";a="940453954"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Apr 2016 05:47:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 1BE2D6A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:34:35 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 13:26:25 +0300
Message-Id: <7416c3ba19f26fe6eea485fefad4db4881f829ad.1461664163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461664163.git.ed.bartosh@linux.intel.com>
References: <cover.1461664163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461664163.git.ed.bartosh@linux.intel.com>
References: <cover.1461664163.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/3] selftest: add bmap test
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
X-List-Received-Date: Tue, 26 Apr 2016 12:46:59 -0000

Added test_bmap to imagefeatures tests.
It tests if bmap file is generated for the images and
if the image is sparse.

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


