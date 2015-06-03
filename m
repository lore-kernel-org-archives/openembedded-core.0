Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D75B6736BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:50:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2015 07:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663496"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:43 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:29 +0300
Message-Id: <1433343032-4559-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 4/7] oe-selftest: devtool: add method for checking srctree repo
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
X-List-Received-Date: Wed, 03 Jun 2015 14:50:57 -0000

Removes some code duplication.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 50 +++++++++++++++------------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index c01e361..08ed2eb 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -71,6 +71,18 @@ class DevtoolTests(DevtoolBase):
                         'under the build directory')
         return workspacedir
 
+    def _check_src_repo(self, repo_dir):
+        """Check srctree git repository"""
+        self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
+                        'git repository for external source tree not found')
+        result = runCmd('git status --porcelain', cwd=repo_dir)
+        self.assertEqual(result.output.strip(), "",
+                         'Created git repo is not clean')
+        result = runCmd('git symbolic-ref HEAD', cwd=repo_dir)
+        self.assertEqual(result.output.strip(), "refs/heads/devtool",
+                         'Wrong branch in git repo')
+
+
     def test_create_workspace(self):
         # Check preconditions
         workspacedir = self._get_workspace_dir()
@@ -267,7 +279,6 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c clean mdadm')
         result = runCmd('devtool modify mdadm -x %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
         self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         matches = glob.glob(os.path.join(workspacedir, 'appends', 'mdadm_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
@@ -276,10 +287,7 @@ class DevtoolTests(DevtoolBase):
         self.assertIn('mdadm', result.output)
         self.assertIn(tempdir, result.output)
         # Check git repo
-        result = runCmd('git status --porcelain', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempdir)
         # Try building
         bitbake('mdadm')
         # Try making (minor) modifications to the source
@@ -350,7 +358,6 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
         self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         matches = glob.glob(os.path.join(workspacedir, 'appends', 'mkelfimage_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
@@ -359,10 +366,7 @@ class DevtoolTests(DevtoolBase):
         self.assertIn(testrecipe, result.output)
         self.assertIn(tempdir, result.output)
         # Check git repo
-        result = runCmd('git status --porcelain', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempdir)
         # Try building
         bitbake(testrecipe)
 
@@ -414,11 +418,7 @@ class DevtoolTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Check git repo
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempdir)
         # Add a couple of commits
         # FIXME: this only tests adding, need to also test update and remove
         result = runCmd('echo "Additional line" >> README', cwd=tempdir)
@@ -464,11 +464,7 @@ class DevtoolTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Check git repo
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempdir)
         # Add a couple of commits
         # FIXME: this only tests adding, need to also test update and remove
         result = runCmd('echo "# Additional line" >> Makefile', cwd=tempdir)
@@ -534,11 +530,7 @@ class DevtoolTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
         # Check git repo
-        self.assertTrue(os.path.isdir(os.path.join(tempsrcdir, '.git')), 'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempdir)
         # Add a commit
         result = runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
@@ -612,11 +604,7 @@ class DevtoolTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
         # Check git repo
-        self.assertTrue(os.path.isdir(os.path.join(tempsrcdir, '.git')), 'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempdir)
         # Add a commit
         result = runCmd('echo "# Additional line" >> Makefile', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
@@ -693,7 +681,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool extract remake %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
+        self._check_src_repo(tempdir)
 
     def test_devtool_reset_all(self):
         workspacedir = self._get_workspace_dir()
-- 
2.1.4


