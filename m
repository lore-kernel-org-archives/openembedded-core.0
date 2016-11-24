Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EDF7F71B7D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828227"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:56 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:13 -0600
Message-Id: <0ecbe690afc170246161c62c62cd11e967780efc.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 13/13] selftest: bblayers: remove linux kernel checks for show-recipes check
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:55 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Preferred kernel recipes depends on the distro, so remove the kernel
checks to avoid failures on non-poky distros and make the test
distro agnostic.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index d23675e..677161f 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -68,20 +68,16 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(1384)
     def test_bitbakelayers_showrecipes(self):
+        distro = get_bb_var('DISTRO')
         result = runCmd('bitbake-layers show-recipes')
         self.assertIn('aspell:', result.output)
         self.assertIn('mtd-utils:', result.output)
-        self.assertIn('linux-yocto:', result.output)
         self.assertIn('core-image-minimal:', result.output)
         result = runCmd('bitbake-layers show-recipes mtd-utils')
         self.assertIn('mtd-utils:', result.output)
         self.assertNotIn('aspell:', result.output)
-        result = runCmd('bitbake-layers show-recipes -i kernel')
-        self.assertIn('linux-yocto:', result.output)
-        self.assertNotIn('mtd-utils:', result.output)
         result = runCmd('bitbake-layers show-recipes -i image')
         self.assertIn('core-image-minimal', result.output)
-        self.assertNotIn('linux-yocto:', result.output)
         self.assertNotIn('mtd-utils:', result.output)
         result = runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
         self.assertIn('libproxy:', result.output)
-- 
2.1.4


