Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 001AB723BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 10:45:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2015 03:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,407,1422950400"; d="scan'208";a="541464620"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2015 03:44:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 10:45:29 +0000
Message-Id: <6f5f7e0b9335f5d1a45993879501348bd414b56d.1426502565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426502565.git.paul.eggleton@linux.intel.com>
References: <cover.1426502565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426502565.git.paul.eggleton@linux.intel.com>
References: <cover.1426502565.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] oe-selftest: improve bitbake-layers tests
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
X-List-Received-Date: Mon, 16 Mar 2015 10:45:34 -0000

* Add a test for add-layer and remove-layer
* Correct message for test_bitbakelayers_showoverlayed()
* Improve test_bitbakelayers_flatten() to use a more unique name for the
  temp output directory and clean it up using track_for_cleanup()

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 449c17e..5b046d0 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -29,15 +29,32 @@ class BitbakeLayers(oeSelfTest):
     @testcase(90)
     def test_bitbakelayers_showoverlayed(self):
         result = runCmd('bitbake-layers show-overlayed')
-        self.assertTrue('aspell' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
+        self.assertTrue('aspell' in result.output, msg='aspell overlayed recipe was not recognised')
 
     @testcase(95)
     def test_bitbakelayers_flatten(self):
-        self.assertFalse(os.path.isdir(os.path.join(self.builddir, 'test')))
-        result = runCmd('bitbake-layers flatten test')
-        bb_file = os.path.join(self.builddir, 'test/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb')
+        testoutdir = os.path.join(self.builddir, 'test_bitbakelayers_flatten')
+        self.assertFalse(os.path.isdir(testoutdir))
+        self.track_for_cleanup(testoutdir)
+        result = runCmd('bitbake-layers flatten %s' % testoutdir)
+        bb_file = os.path.join(testoutdir, 'recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb')
         self.assertTrue(os.path.isfile(bb_file))
         contents = ftools.read_file(bb_file)
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
-        shutil.rmtree(os.path.join(self.builddir, 'test'))
         self.assertTrue(find_in_contents)
+
+    def test_bitbakelayers_add_remove(self):
+        result = runCmd('bitbake-layers show-layers')
+        self.assertNotIn('meta-skeleton', result.output, 'This test cannot run with meta-skeleton in bblayers.conf')
+        result = runCmd('bitbake-layers add-layer ../meta-skeleton')
+        result = runCmd('bitbake-layers show-layers')
+        self.assertIn('meta-skeleton', result.output)
+        result = runCmd('bitbake-layers remove-layer ../meta-skeleton')
+        result = runCmd('bitbake-layers show-layers')
+        self.assertNotIn('meta-skeleton', result.output)
+        result = runCmd('bitbake-layers add-layer ../meta-skeleton')
+        result = runCmd('bitbake-layers show-layers')
+        self.assertIn('meta-skeleton', result.output)
+        result = runCmd('bitbake-layers remove-layer */meta-skeleton')
+        result = runCmd('bitbake-layers show-layers')
+        self.assertNotIn('meta-skeleton', result.output)
-- 
1.9.3


