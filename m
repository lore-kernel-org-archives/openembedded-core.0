Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3A16A77248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 20:34:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2017 12:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="1086413489"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2017 12:34:37 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 14:41:31 -0600
Message-Id: <56b4dcc61fa01718ecd1415e33d1fe0069aec327.1485203593.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485203593.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1485203593.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v4 1/2] selftest/imagefeatures: skip weston test if required features are not present
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
X-List-Received-Date: Mon, 23 Jan 2017 20:34:42 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Also, remove hard-coded features because the image already contains them.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index d015c49..76896c7 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -91,9 +91,9 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'DISTRO_FEATURES_append = " wayland"\n'
-        features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
-        self.write_config(features)
+        distro_features = get_bb_var('DISTRO_FEATURES')
+        if not ('opengl' in distro_features and 'wayland' in distro_features):
+            self.skipTest('neither opengl nor wayland present on DISTRO_FEATURES so core-image-weston cannot be built')
 
         # Build a core-image-weston
         bitbake('core-image-weston')
-- 
2.1.4


