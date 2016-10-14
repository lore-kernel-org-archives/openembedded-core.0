Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAEC71B80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:32 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705485"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:33 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:30 -0500
Message-Id: <758e9e3a2047f36dc368add36bd006d53d83a662.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 5/9] selftest: skip those imagefeatures tests not relevant for certain distros
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:32 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

core-image-clutter|weston can only be built on poky and poky-lsb, so skip
these tests in case other distro is defined. In the other hand, poky-tiny
does not support ext4 filesystem types, so skip test_bmap which includes
these image features.

[YOCTO #8525]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index d015c49..ef80b87 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -78,7 +78,11 @@ class ImageFeatures(oeSelfTest):
         """
 
         # Build a core-image-clutter
-        bitbake('core-image-clutter')
+        image = 'core-image-clutter'
+        supported_distros = ['poky', 'poky-lsb']
+        if not self.distro in supported_distros:
+            self.skipTest('Test is consider for distros (%s) supporting %s' % (','.join(supported_distros), image))
+        bitbake(image)
 
     @testcase(1117)
     def test_wayland_support_in_image(self):
@@ -96,7 +100,11 @@ class ImageFeatures(oeSelfTest):
         self.write_config(features)
 
         # Build a core-image-weston
-        bitbake('core-image-weston')
+        image = 'core-image-weston'
+        supported_distros = ['poky', 'poky-lsb']
+        if not self.distro in supported_distros:
+            self.skipTest('Test is only considered for distros (%s) supporting %s' % (','.join(supported_distros), image))
+        bitbake(image)
 
     def test_bmap(self):
         """
@@ -107,7 +115,11 @@ class ImageFeatures(oeSelfTest):
         Author:      Ed Bartosh <ed.bartosh@linux.intel.com>
         """
 
-        features = 'IMAGE_FSTYPES += " ext4 ext4.bmap"'
+        ext4_features = "ext4 ext4.bmap"
+        features = 'IMAGE_FSTYPES += " %s"' % ext4_features
+        if self.distro == 'poky-tiny':
+            self.skipTest('Features (%s) not supported for poky-tiny' % ext4_features)
+
         self.write_config(features)
 
         image_name = 'core-image-minimal'
-- 
2.1.4


