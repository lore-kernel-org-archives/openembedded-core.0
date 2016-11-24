Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0B79860797
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828208"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:52 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:05 -0600
Message-Id: <aa3240cbb83bd2b6afb8c09a6e500405f81dad47.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 05/13] selftest: buildoptions: skip test in case features are missing
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:51 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The sato image needs opengl and x11 as distro features, so skip
test if this is not the case.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index b228c56..25d14f7 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -43,8 +43,9 @@ class ImageOptionsTests(oeSelfTest):
 
     @testcase(1435)
     def test_read_only_image(self):
-        if self.distro == 'poky-tiny':
-            self.skipTest('core-image-sato is not buildable with poky-tiny')
+        distro_features = get_bb_var('DISTRO_FEATURES')
+        if not ('x11' in distro_features and 'opengl' in distro_features):
+            self.skipTest('core-image-sato requires x11 and opengl in distro features')
         self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
         bitbake("core-image-sato")
         # do_image will fail if there are any pending postinsts
-- 
2.1.4


