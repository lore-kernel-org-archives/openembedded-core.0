Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 583AD6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 15:07:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2016 08:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,416,1455004800"; d="scan'208";a="934766474"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2016 08:03:11 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 10EBB6A4002;
	Wed, 30 Mar 2016 08:50:52 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 18:07:32 +0300
Message-Id: <1459350452-1807-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] selftest: Added testcase decorator to tests
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
X-List-Received-Date: Wed, 30 Mar 2016 15:07:28 -0000

1418	test_recipetool_create_cmake
1422	test_qemu
1423	test_devtool_add_git_local
1433	test_devtool_upgrade_git
1434	test_sanity_unsafe_binary_references
1435	test_read_only_image

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 ++
 meta/lib/oeqa/selftest/devtool.py      | 2 ++
 meta/lib/oeqa/selftest/recipetool.py   | 1 +
 meta/lib/oeqa/selftest/wic.py          | 1 +
 4 files changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 2fc77e1..ff34e9a 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -57,6 +57,7 @@ class ImageOptionsTests(oeSelfTest):
         res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
         self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))
 
+    @testcase(1435)
     def test_read_only_image(self):
         self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
         bitbake("core-image-sato")
@@ -124,6 +125,7 @@ do_install_append_pn-gzip () {
         line = self.getline(res, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
 
+    @testcase(1434)
     def test_sanity_unsafe_binary_references(self):
         self.write_config('WARN_QA_append = " unsafe-references-in-binaries"')
 
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 32025be..132a73d 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -201,6 +201,7 @@ class DevtoolTests(DevtoolBase):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
+    @testcase(1423)
     def test_devtool_add_git_local(self):
         # Fetch source from a remote URL, but do it outside of devtool
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -1138,6 +1139,7 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
 
+    @testcase(1433)
     def test_devtool_upgrade_git(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index a04ee87..e72911b 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -424,6 +424,7 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools']
         self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
 
+    @testcase(1418)
     def test_recipetool_create_cmake(self):
         # Try adding a recipe
         temprecipe = os.path.join(self.tempdir, 'recipe')
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 56ce8c8..a569fbf 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -266,6 +266,7 @@ class Wic(oeSelfTest):
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
+    @testcase(1422)
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
-- 
2.1.0


