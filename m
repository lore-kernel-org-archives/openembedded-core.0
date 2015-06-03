Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EEEB2736BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:50:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2015 07:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663490"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:42 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:28 +0300
Message-Id: <1433343032-4559-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/7] oe-selftest: devtool: add method for checking workspace dir
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
X-List-Received-Date: Wed, 03 Jun 2015 14:50:58 -0000

In order to remove some code duplication.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 64 +++++++++++++++------------------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 4e22e1d..c01e361 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -63,10 +63,17 @@ class DevtoolBase(oeSelfTest):
 
 class DevtoolTests(DevtoolBase):
 
+    def _get_workspace_dir(self):
+        """Get workspace directory"""
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir),
+                        'This test cannot be run with a workspace directory '
+                        'under the build directory')
+        return workspacedir
+
     def test_create_workspace(self):
         # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         result = runCmd('bitbake-layers show-layers')
         self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
         # Try creating a workspace layer with a specific path
@@ -86,9 +93,7 @@ class DevtoolTests(DevtoolBase):
         self.assertIn(workspacedir, result.output)
 
     def test_devtool_add(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -120,9 +125,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
     def test_devtool_add_library(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         # We don't have the ability to pick up this dependency automatically yet...
         bitbake('libusb1')
         # Fetch source
@@ -160,9 +163,7 @@ class DevtoolTests(DevtoolBase):
         self.assertFalse(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary still found in STAGING_LIBDIR after cleaning')
 
     def test_devtool_add_fetch(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -206,9 +207,7 @@ class DevtoolTests(DevtoolBase):
         self._test_recipe_contents(recipefile, checkvars, [])
 
     def test_devtool_add_fetch_git(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -257,9 +256,7 @@ class DevtoolTests(DevtoolBase):
         self._test_recipe_contents(recipefile, checkvars, [])
 
     def test_devtool_modify(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         # Clean up anything in the workdir/sysroot/sstate cache
         bitbake('mdadm -c cleansstate')
         # Try modifying a recipe
@@ -308,9 +305,7 @@ class DevtoolTests(DevtoolBase):
         self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
 
     def test_devtool_modify_invalid(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         # Try modifying some recipes
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -341,8 +336,7 @@ class DevtoolTests(DevtoolBase):
 
     def test_devtool_modify_git(self):
         # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         testrecipe = 'mkelfimage'
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
@@ -374,8 +368,7 @@ class DevtoolTests(DevtoolBase):
 
     def test_devtool_modify_localfiles(self):
         # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         testrecipe = 'lighttpd'
         src_uri = (get_bb_var('SRC_URI', testrecipe) or '').split()
         foundlocal = False
@@ -406,8 +399,7 @@ class DevtoolTests(DevtoolBase):
 
     def test_devtool_update_recipe(self):
         # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         testrecipe = 'minicom'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
@@ -452,8 +444,7 @@ class DevtoolTests(DevtoolBase):
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         testrecipe = 'mtd-utils'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
@@ -526,8 +517,7 @@ class DevtoolTests(DevtoolBase):
 
     def test_devtool_update_recipe_append(self):
         # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         testrecipe = 'mdadm'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
@@ -601,8 +591,7 @@ class DevtoolTests(DevtoolBase):
 
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         testrecipe = 'mtd-utils'
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
@@ -696,9 +685,7 @@ class DevtoolTests(DevtoolBase):
         # Deleting isn't expected to work under these circumstances
 
     def test_devtool_extract(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
@@ -709,9 +696,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
 
     def test_devtool_reset_all(self):
-        # Check preconditions
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(workspacedir)
@@ -760,8 +745,7 @@ class DevtoolTests(DevtoolBase):
                 break
         else:
             self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
-        workspacedir = os.path.join(self.builddir, 'workspace')
-        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        workspacedir = self._get_workspace_dir()
         import pexpect
         # Definitions
         testrecipe = 'mdadm'
-- 
2.1.4


