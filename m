Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEB571B73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828212"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:53 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:08 -0600
Message-Id: <674fcc8ed927384fe160fa9961bbf4dfffffd1c0.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 08/13] selftest: imagefeatures: skip bmap test in case of poky-tiny
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:52 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Poky-tiny distro cannot execute bmap test because ext4 filesystem
is used, so skip test in this is the case.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index a61510b..6e00fe9 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -111,7 +111,10 @@ class ImageFeatures(oeSelfTest):
         Author:      Ed Bartosh <ed.bartosh@linux.intel.com>
         """
 
-        features = 'IMAGE_FSTYPES += " ext4 ext4.bmap"'
+        ext4_features = "ext4 ext4.bmap"
+        features = 'IMAGE_FSTYPES += " %s"' % ext4_features
+        if self.distro == 'poky-tiny':
+            self.skipTest('Features (%s) not supported for poky-tiny' % ext4_features)
         self.write_config(features)
 
         image_name = 'core-image-minimal'
-- 
2.1.4


