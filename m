Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B145C76FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:53:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 04:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="796374460"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 04:53:14 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:53:02 +0300
Message-Id: <1443095587-13852-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3 05/10] oe-selftest: devtool: add method for checking repo status
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
X-List-Received-Date: Thu, 24 Sep 2015 11:53:15 -0000

New method for checking the status of the working tree of a repository.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 87 ++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 52 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index f459a6d..a893ed3 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -103,6 +103,23 @@ class DevtoolTests(DevtoolBase):
         self.assertEqual(result.output.strip(), "refs/heads/devtool",
                          'Wrong branch in git repo')
 
+    def _check_repo_status(self, repo_dir, expected_status):
+        """Check the worktree status of a repository"""
+        result = runCmd('git status . --porcelain',
+                        cwd=repo_dir)
+        for line in result.output.splitlines():
+            for ind, (f_status, fn_re) in enumerate(expected_status):
+                if re.match(fn_re, line[3:]):
+                    if f_status != line[:2]:
+                        self.fail('Unexpected status in line: %s' % line)
+                    expected_status.pop(ind)
+                    break
+            else:
+                self.fail('Unexpected modified file in line: %s' % line)
+        if expected_status:
+            self.fail('Missing file changes: %s' % expected_status)
+
+
     @testcase(1158)
     def test_create_workspace(self):
         # Check preconditions
@@ -468,8 +485,7 @@ class DevtoolTests(DevtoolBase):
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -488,19 +504,10 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
         self.add_command_to_tearDown('cd %s; rm %s/*.patch; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
         result = runCmd('devtool update-recipe %s' % testrecipe)
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertNotEqual(result.output.strip(), "", '%s recipe should be modified' % testrecipe)
-        status = result.output.splitlines()
-        self.assertEqual(len(status), 3, 'Less/more files modified than expected. Entire status:\n%s' % result.output)
-        for line in status:
-            if line.endswith('0001-Change-the-README.patch'):
-                self.assertEqual(line[:3], '?? ', 'Unexpected status in line: %s' % line)
-            elif line.endswith('0002-Add-a-new-file.patch'):
-                self.assertEqual(line[:3], '?? ', 'Unexpected status in line: %s' % line)
-            elif re.search('%s_[^_]*.bb$' % testrecipe, line):
-                self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
-            else:
-                raise AssertionError('Unexpected modified file in status: %s' % line)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('??', '.*/0001-Change-the-README.patch$'),
+                           ('??', '.*/0002-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
     @testcase(1172)
     def test_devtool_update_recipe_git(self):
@@ -515,8 +522,7 @@ class DevtoolTests(DevtoolBase):
             if entry.startswith('file://') and entry.endswith('.patch'):
                 patches.append(entry[7:].split(';')[0])
         self.assertGreater(len(patches), 0, 'The %s recipe does not appear to contain any patches, so this test will not be effective' % testrecipe)
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -535,19 +541,10 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
         self.add_command_to_tearDown('cd %s; rm -rf %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
         result = runCmd('devtool update-recipe -m srcrev %s' % testrecipe)
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertNotEqual(result.output.strip(), "", '%s recipe should be modified' % testrecipe)
-        status = result.output.splitlines()
-        for line in status:
-            for patch in patches:
-                if line.endswith(patch):
-                    self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
-                    break
-            else:
-                if re.search('%s_[^_]*.bb$' % testrecipe, line):
-                    self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
-                else:
-                    raise AssertionError('Unexpected modified file in status: %s' % line)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile))] + \
+                          [(' D', '.*/%s$' % patch) for patch in patches]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
         addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
         srcurilines = src_uri.split()
@@ -576,21 +573,11 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool update-recipe %s' % testrecipe)
         result = runCmd('git rev-parse --show-toplevel')
         topleveldir = result.output.strip()
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        status = result.output.splitlines()
         relpatchpath = os.path.join(os.path.relpath(os.path.dirname(recipefile), topleveldir), testrecipe)
-        expectedstatus = [('M', os.path.relpath(recipefile, topleveldir)),
-                          ('??', '%s/0001-Change-the-Makefile.patch' % relpatchpath),
-                          ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
-        for line in status:
-            statusline = line.split(None, 1)
-            for fstatus, fn in expectedstatus:
-                if fn == statusline[1]:
-                    if fstatus != statusline[0]:
-                        self.fail('Unexpected status in line: %s' % line)
-                    break
-            else:
-                self.fail('Unexpected modified file in line: %s' % line)
+        expected_status = [(' M', os.path.relpath(recipefile, topleveldir)),
+                           ('??', '%s/0001-Change-the-Makefile.patch' % relpatchpath),
+                           ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
     @testcase(1170)
     def test_devtool_update_recipe_append(self):
@@ -600,8 +587,7 @@ class DevtoolTests(DevtoolBase):
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         tempsrcdir = os.path.join(tempdir, 'source')
@@ -623,8 +609,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
         self.assertNotIn('WARNING:', result.output)
         # Check recipe is still clean
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
         # Check bbappend was created
         splitpath = os.path.dirname(recipefile).split(os.sep)
         appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
@@ -675,8 +660,7 @@ class DevtoolTests(DevtoolBase):
             if entry.startswith('git://'):
                 git_uri = entry
                 break
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
         # First, modify a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         tempsrcdir = os.path.join(tempdir, 'source')
@@ -707,8 +691,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertNotIn('WARNING:', result.output)
         # Check recipe is still clean
-        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
-        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
         # Check bbappend was created
         splitpath = os.path.dirname(recipefile).split(os.sep)
         appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
-- 
2.1.4


