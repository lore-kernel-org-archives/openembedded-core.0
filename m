Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 802F073D17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:53:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 04:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="796374457"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 04:53:13 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:53:01 +0300
Message-Id: <1443095587-13852-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3 04/10] oe-selftest: devtool: add method for checking srctree repo
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
X-List-Received-Date: Thu, 24 Sep 2015 11:53:14 -0000

Removes some code duplication.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 49 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index b8b872c..f459a6d 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -92,6 +92,17 @@ class DevtoolTests(DevtoolBase):
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
     @testcase(1158)
     def test_create_workspace(self):
         # Check preconditions
@@ -294,7 +305,6 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c clean mdadm')
         result = runCmd('devtool modify mdadm -x %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
         self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         matches = glob.glob(os.path.join(workspacedir, 'appends', 'mdadm_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
@@ -303,10 +313,7 @@ class DevtoolTests(DevtoolBase):
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
@@ -409,7 +416,6 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
         self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. devtool output: %s' % result.output)
         matches = glob.glob(os.path.join(workspacedir, 'appends', 'mkelfimage_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
@@ -418,10 +424,7 @@ class DevtoolTests(DevtoolBase):
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
 
@@ -475,11 +478,7 @@ class DevtoolTests(DevtoolBase):
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
@@ -526,11 +525,7 @@ class DevtoolTests(DevtoolBase):
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
@@ -617,11 +612,7 @@ class DevtoolTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
         # Check git repo
-        self.assertTrue(os.path.isdir(os.path.join(tempsrcdir, '.git')), 'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempsrcdir)
         # Add a commit
         result = runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
@@ -696,11 +687,7 @@ class DevtoolTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
         # Check git repo
-        self.assertTrue(os.path.isdir(os.path.join(tempsrcdir, '.git')), 'git repository for external source tree not found')
-        result = runCmd('git status --porcelain', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
-        result = runCmd('git symbolic-ref HEAD', cwd=tempsrcdir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        self._check_src_repo(tempsrcdir)
         # Add a commit
         result = runCmd('echo "# Additional line" >> Makefile', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
@@ -778,7 +765,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool extract remake %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
-        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
+        self._check_src_repo(tempdir)
 
     @testcase(1168)
     def test_devtool_reset_all(self):
-- 
2.1.4


