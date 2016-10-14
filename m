Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 66E2C71B60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705471"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:31 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:26 -0500
Message-Id: <4139c9aa1622a83597d0b6ea336923686f844bd1.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/9] selftest: set correct linux-yocto recipe when distro is poky-tiny
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The poky-tiny distro points to linux-yocto-tiny instead of linux-yocto,
so setting the correct name depending on the distro.

[YOCTO #8525]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/base.py     | 1 +
 meta/lib/oeqa/selftest/bblayers.py | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 26c93f9..b477db3 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -41,6 +41,7 @@ class oeSelfTest(unittest.TestCase):
             self.testinc_path, self.testinc_bblayers_path,
             self.machineinc_path, self.localconf_backup,
             self.local_bblayers_backup]
+        self.distro = get_bb_var('DISTRO')
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index d23675e..a0206a2 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -68,6 +68,7 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(1384)
     def test_bitbakelayers_showrecipes(self):
+        distro = get_bb_var('DISTRO')
         result = runCmd('bitbake-layers show-recipes')
         self.assertIn('aspell:', result.output)
         self.assertIn('mtd-utils:', result.output)
@@ -77,11 +78,12 @@ class BitbakeLayers(oeSelfTest):
         self.assertIn('mtd-utils:', result.output)
         self.assertNotIn('aspell:', result.output)
         result = runCmd('bitbake-layers show-recipes -i kernel')
-        self.assertIn('linux-yocto:', result.output)
+        linux_yocto = 'linux-yocto-tiny' if distro == 'poky-tiny' else 'linux-yocto'
+        self.assertIn(linux_yocto, result.output)
         self.assertNotIn('mtd-utils:', result.output)
         result = runCmd('bitbake-layers show-recipes -i image')
         self.assertIn('core-image-minimal', result.output)
-        self.assertNotIn('linux-yocto:', result.output)
+        self.assertNotIn(linux_yocto, result.output)
         self.assertNotIn('mtd-utils:', result.output)
         result = runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
         self.assertIn('libproxy:', result.output)
-- 
2.1.4


