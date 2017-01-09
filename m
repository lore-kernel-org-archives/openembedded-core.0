Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE42471AE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:39:27 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 09 Jan 2017 09:39:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="51794769"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2017 09:39:27 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:45:52 -0600
Message-Id: <bd50489338d4e001bc7f5511db02792b311a3672.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH V3 2/4] selftest: imagefeatures: skip tests based on distro features and supported fstypes
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
X-List-Received-Date: Mon, 09 Jan 2017 17:39:28 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Some images (clutter and weston) requires certain distros features to be present,
so check presence before proceeding. Some distros does not support the ext4* fstypes
(poky-tiny only supports cpio.gz) so skip the test if this is the case.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index d015c49..5d50c69 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -77,6 +77,9 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
+        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
+            self.skipTest('opengl not present on DISTRO_FEATURES so core-image-clutter cannot be built')
+
         # Build a core-image-clutter
         bitbake('core-image-clutter')
 
@@ -91,6 +94,10 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
+        distro_features = get_bb_var('DISTRO_FEATURES')
+        if not ('opengl' in distro_features and 'wayland' in distro_features):
+            self.skipTest('neither opengl nor wayland present on DISTRO_FEATURES so core-image-weston cannot be built')
+
         features = 'DISTRO_FEATURES_append = " wayland"\n'
         features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
         self.write_config(features)
@@ -110,6 +117,10 @@ class ImageFeatures(oeSelfTest):
         features = 'IMAGE_FSTYPES += " ext4 ext4.bmap"'
         self.write_config(features)
 
+        image_fstypes = get_bb_var('IMAGE_FSTYPES')
+        if 'ext4 ext4.bmap' not in image_fstypes:
+            self.skipTest('Current distro does not allow "ext4 ext4.bmap" filesystem type. Supported: %s' % image_fstypes)
+
         image_name = 'core-image-minimal'
         bitbake(image_name)
 
-- 
2.1.4


