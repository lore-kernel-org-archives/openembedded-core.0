Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 308DA78170
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:21 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133882"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:37:11 -0500
Message-Id: <f224df764bb52a731cd23c234a7c19f56a2d4b50.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 25/29] selftest/cases/devtool{, end}: Move update/finish_modify tests to its own module
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This devtool tests are set to run at end because made changes into the
poky repository causing problems (non deteministic meta data) in other
execution threads.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 545 ++--------------------------
 meta/lib/oeqa/selftest/cases/devtool_end.py | 506 ++++++++++++++++++++++++++
 2 files changed, 532 insertions(+), 519 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/devtool_end.py

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3d8d246bb7c..44ba361f16c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -112,6 +112,32 @@ class DevtoolBase(OESelftestTestCase):
             filelist.append(' '.join(splitline))
         return filelist
 
+    def _check_src_repo(self, repo_dir):
+        """Check srctree git repository"""
+        self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
+                        'git repository for external source tree not found')
+        result = self.runCmd('git status --porcelain', cwd=repo_dir)
+        self.assertEqual(result.output.strip(), "",
+                         'Created git repo is not clean')
+        result = self.runCmd('git symbolic-ref HEAD', cwd=repo_dir)
+        self.assertEqual(result.output.strip(), "refs/heads/devtool",
+                         'Wrong branch in git repo')
+
+    def _check_repo_status(self, repo_dir, expected_status):
+        """Check the worktree status of a repository"""
+        result = self.runCmd('git status . --porcelain',
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
 
 class DevtoolCommon(DevtoolBase):
     _use_own_builddir = True
@@ -150,33 +176,6 @@ class DevtoolTests(DevtoolCommon):
     _use_own_builddir = True
     _main_thread = False
 
-    def _check_src_repo(self, repo_dir):
-        """Check srctree git repository"""
-        self.assertTrue(os.path.isdir(os.path.join(repo_dir, '.git')),
-                        'git repository for external source tree not found')
-        result = self.runCmd('git status --porcelain', cwd=repo_dir)
-        self.assertEqual(result.output.strip(), "",
-                         'Created git repo is not clean')
-        result = self.runCmd('git symbolic-ref HEAD', cwd=repo_dir)
-        self.assertEqual(result.output.strip(), "refs/heads/devtool",
-                         'Wrong branch in git repo')
-
-    def _check_repo_status(self, repo_dir, expected_status):
-        """Check the worktree status of a repository"""
-        result = self.runCmd('git status . --porcelain',
-                        cwd=repo_dir)
-        for line in result.output.splitlines():
-            for ind, (f_status, fn_re) in enumerate(expected_status):
-                if re.match(fn_re, line[3:]):
-                    if f_status != line[:2]:
-                        self.fail('Unexpected status in line: %s' % line)
-                    expected_status.pop(ind)
-                    break
-            else:
-                self.fail('Unexpected modified file in line: %s' % line)
-        if expected_status:
-            self.fail('Missing file changes: %s' % expected_status)
-
     @OETestID(1158)
     def test_create_workspace(self):
         # Check preconditions
@@ -687,417 +686,6 @@ class DevtoolTests(DevtoolCommon):
         self._check_src_repo(tempdir)
         # This is probably sufficient
 
-
-    @OETestID(1169)
-    def test_devtool_update_recipe(self):
-        # Check preconditions
-        testrecipe = 'minicom'
-        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
-        recipefile = bb_vars['FILE']
-        src_uri = bb_vars['SRC_URI']
-        self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
-        self._check_repo_status(os.path.dirname(recipefile), [])
-        # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        # We don't use -x here so that we test the behaviour of devtool modify without it
-        result = self.runCmd('devtool modify %s %s' % (testrecipe, tempdir))
-        # Check git repo
-        self._check_src_repo(tempdir)
-        # Add a couple of commits
-        # FIXME: this only tests adding, need to also test update and remove
-        result = self.runCmd('echo "Additional line" >> README', cwd=tempdir)
-        result = self.runCmd('git commit -a -m "Change the README"', cwd=tempdir)
-        result = self.runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
-        result = self.runCmd('git add devtool-new-file', cwd=tempdir)
-        result = self.runCmd('git commit -m "Add a new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; rm %s/*.patch; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = self.runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           ('??', '.*/0001-Change-the-README.patch$'),
-                           ('??', '.*/0002-Add-a-new-file.patch$')]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
-    @OETestID(1172)
-    def test_devtool_update_recipe_git(self):
-        # Check preconditions
-        testrecipe = 'mtd-utils'
-        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
-        recipefile = bb_vars['FILE']
-        src_uri = bb_vars['SRC_URI']
-        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
-        patches = []
-        for entry in src_uri.split():
-            if entry.startswith('file://') and entry.endswith('.patch'):
-                patches.append(entry[7:].split(';')[0])
-        self.assertGreater(len(patches), 0, 'The %s recipe does not appear to contain any patches, so this test will not be effective' % testrecipe)
-        self._check_repo_status(os.path.dirname(recipefile), [])
-        # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        # Check git repo
-        self._check_src_repo(tempdir)
-        # Add a couple of commits
-        # FIXME: this only tests adding, need to also test update and remove
-        result = self.runCmd('echo "# Additional line" >> Makefile.am', cwd=tempdir)
-        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempdir)
-        result = self.runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
-        result = self.runCmd('git add devtool-new-file', cwd=tempdir)
-        result = self.runCmd('git commit -m "Add a new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; rm -rf %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = self.runCmd('devtool update-recipe -m srcrev %s' % testrecipe)
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile))] + \
-                          [(' D', '.*/%s$' % patch) for patch in patches]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
-        result = self.runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
-        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
-        srcurilines = src_uri.split()
-        srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
-        srcurilines.append('"')
-        removelines = ['SRCREV = ".*"'] + srcurilines
-        for line in result.output.splitlines():
-            if line.startswith('+++') or line.startswith('---'):
-                continue
-            elif line.startswith('+'):
-                matched = False
-                for item in addlines:
-                    if re.match(item, line[1:].strip()):
-                        matched = True
-                        break
-                self.assertTrue(matched, 'Unexpected diff add line: %s' % line)
-            elif line.startswith('-'):
-                matched = False
-                for item in removelines:
-                    if re.match(item, line[1:].strip()):
-                        matched = True
-                        break
-                self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
-        # Now try with auto mode
-        self.runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
-        result = self.runCmd('devtool update-recipe %s' % testrecipe)
-        result = self.runCmd('git rev-parse --show-toplevel', cwd=os.path.dirname(recipefile))
-        topleveldir = result.output.strip()
-        relpatchpath = os.path.join(os.path.relpath(os.path.dirname(recipefile), topleveldir), testrecipe)
-        expected_status = [(' M', os.path.relpath(recipefile, topleveldir)),
-                           ('??', '%s/0001-Change-the-Makefile.patch' % relpatchpath),
-                           ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
-    @OETestID(1170)
-    def test_devtool_update_recipe_append(self):
-        # Check preconditions
-        testrecipe = 'mdadm'
-        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
-        recipefile = bb_vars['FILE']
-        src_uri = bb_vars['SRC_URI']
-        self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
-        self._check_repo_status(os.path.dirname(recipefile), [])
-        # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        tempsrcdir = os.path.join(tempdir, 'source')
-        templayerdir = os.path.join(tempdir, 'layer')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
-        # Check git repo
-        self._check_src_repo(tempsrcdir)
-        # Add a commit
-        result = self.runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
-        result = self.runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
-        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
-        # Create a temporary layer and add it to bblayers.conf
-        self._create_temp_layer(templayerdir, True, 'selftestupdaterecipe')
-        # Create the bbappend
-        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
-        self.assertNotIn('WARNING:', result.output)
-        # Check recipe is still clean
-        self._check_repo_status(os.path.dirname(recipefile), [])
-        # Check bbappend was created
-        splitpath = os.path.dirname(recipefile).split(os.sep)
-        appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
-        bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
-        patchfile = os.path.join(appenddir, testrecipe, '0001-Add-our-custom-version.patch')
-        self.assertExists(patchfile, 'Patch file not created')
-
-        # Check bbappend contents
-        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
-                         '\n',
-                         'SRC_URI += "file://0001-Add-our-custom-version.patch"\n',
-                         '\n']
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
-
-        # Check we can run it again and bbappend isn't modified
-        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
-        # Drop new commit and check patch gets deleted
-        result = self.runCmd('git reset HEAD^', cwd=tempsrcdir)
-        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
-        self.assertNotExists(patchfile, 'Patch file not deleted')
-        expectedlines2 = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
-                         '\n']
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines2, f.readlines())
-        # Put commit back and check we can run it if layer isn't in bblayers.conf
-        os.remove(bbappendfile)
-        result = self.runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
-        result = self.runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
-        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
-        self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
-        self.assertExists(patchfile, 'Patch file not created (with disabled layer)')
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
-        # Deleting isn't expected to work under these circumstances
-
-    @OETestID(1171)
-    def test_devtool_update_recipe_append_git(self):
-        # Check preconditions
-        testrecipe = 'mtd-utils'
-        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
-        recipefile = bb_vars['FILE']
-        src_uri = bb_vars['SRC_URI']
-        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
-        for entry in src_uri.split():
-            if entry.startswith('git://'):
-                git_uri = entry
-                break
-        self._check_repo_status(os.path.dirname(recipefile), [])
-        # First, modify a recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        tempsrcdir = os.path.join(tempdir, 'source')
-        templayerdir = os.path.join(tempdir, 'layer')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
-        # Check git repo
-        self._check_src_repo(tempsrcdir)
-        # Add a commit
-        result = self.runCmd('echo "# Additional line" >> Makefile.am', cwd=tempsrcdir)
-        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
-        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
-        # Create a temporary layer
-        os.makedirs(os.path.join(templayerdir, 'conf'))
-        with open(os.path.join(templayerdir, 'conf', 'layer.conf'), 'w') as f:
-            f.write('BBPATH .= ":${LAYERDIR}"\n')
-            f.write('BBFILES += "${LAYERDIR}/recipes-*/*/*.bbappend"\n')
-            f.write('BBFILE_COLLECTIONS += "oeselftesttemplayer"\n')
-            f.write('BBFILE_PATTERN_oeselftesttemplayer = "^${LAYERDIR}/"\n')
-            f.write('BBFILE_PRIORITY_oeselftesttemplayer = "999"\n')
-            f.write('BBFILE_PATTERN_IGNORE_EMPTY_oeselftesttemplayer = "1"\n')
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
-        result = self.runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
-        # Create the bbappend
-        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
-        self.assertNotIn('WARNING:', result.output)
-        # Check recipe is still clean
-        self._check_repo_status(os.path.dirname(recipefile), [])
-        # Check bbappend was created
-        splitpath = os.path.dirname(recipefile).split(os.sep)
-        appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
-        bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
-        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
-
-        # Check bbappend contents
-        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
-        expectedlines = set(['SRCREV = "%s"\n' % result.output,
-                             '\n',
-                             'SRC_URI = "%s"\n' % git_uri,
-                             '\n'])
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, set(f.readlines()))
-
-        # Check we can run it again and bbappend isn't modified
-        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, set(f.readlines()))
-        # Drop new commit and check SRCREV changes
-        result = self.runCmd('git reset HEAD^', cwd=tempsrcdir)
-        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
-        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
-        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
-        expectedlines = set(['SRCREV = "%s"\n' % result.output,
-                             '\n',
-                             'SRC_URI = "%s"\n' % git_uri,
-                             '\n'])
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, set(f.readlines()))
-        # Put commit back and check we can run it if layer isn't in bblayers.conf
-        os.remove(bbappendfile)
-        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
-        result = self.runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
-        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
-        self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
-        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
-        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
-        expectedlines = set(['SRCREV = "%s"\n' % result.output,
-                             '\n',
-                             'SRC_URI = "%s"\n' % git_uri,
-                             '\n'])
-        with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, set(f.readlines()))
-        # Deleting isn't expected to work under these circumstances
-
-    @OETestID(1370)
-    def test_devtool_update_recipe_local_files(self):
-        """Check that local source files are copied over instead of patched"""
-        testrecipe = 'makedevs'
-        recipefile = self.get_bb_var('FILE', testrecipe)
-        # Setup srctree for modifying the recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be
-        # building it)
-        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        # Check git repo
-        self._check_src_repo(tempdir)
-        # Try building just to ensure we haven't broken that
-        self.bitbake("%s" % testrecipe)
-        # Edit / commit local source
-        self.runCmd('echo "/* Foobar */" >> oe-local-files/makedevs.c', cwd=tempdir)
-        self.runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
-        self.runCmd('echo "Bar" > new-file', cwd=tempdir)
-        self.runCmd('git add new-file', cwd=tempdir)
-        self.runCmd('git commit -m "Add new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
-                                     os.path.dirname(recipefile))
-        self.runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           (' M', '.*/makedevs/makedevs.c$'),
-                           ('??', '.*/makedevs/new-local$'),
-                           ('??', '.*/makedevs/0001-Add-new-file.patch$')]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
-    @OETestID(1371)
-    def test_devtool_update_recipe_local_files_2(self):
-        """Check local source files support when oe-local-files is in Git"""
-        testrecipe = 'lzo'
-        recipefile = self.get_bb_var('FILE', testrecipe)
-        # Setup srctree for modifying the recipe
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        # Check git repo
-        self._check_src_repo(tempdir)
-        # Add oe-local-files to Git
-        self.runCmd('rm oe-local-files/.gitignore', cwd=tempdir)
-        self.runCmd('git add oe-local-files', cwd=tempdir)
-        self.runCmd('git commit -m "Add local sources"', cwd=tempdir)
-        # Edit / commit local sources
-        self.runCmd('echo "# Foobar" >> oe-local-files/acinclude.m4', cwd=tempdir)
-        self.runCmd('git commit -am "Edit existing file"', cwd=tempdir)
-        self.runCmd('git rm oe-local-files/run-ptest', cwd=tempdir)
-        self.runCmd('git commit -m"Remove file"', cwd=tempdir)
-        self.runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
-        self.runCmd('git add oe-local-files/new-local', cwd=tempdir)
-        self.runCmd('git commit -m "Add new local file"', cwd=tempdir)
-        self.runCmd('echo "Gar" > new-file', cwd=tempdir)
-        self.runCmd('git add new-file', cwd=tempdir)
-        self.runCmd('git commit -m "Add new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
-                                     os.path.dirname(recipefile))
-        # Checkout unmodified file to working copy -> devtool should still pick
-        # the modified version from HEAD
-        self.runCmd('git checkout HEAD^ -- oe-local-files/acinclude.m4', cwd=tempdir)
-        self.runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           (' M', '.*/acinclude.m4$'),
-                           (' D', '.*/run-ptest$'),
-                           ('??', '.*/new-local$'),
-                           ('??', '.*/0001-Add-new-file.patch$')]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
-    @OETestID(1627)
-    def test_devtool_update_recipe_local_files_3(self):
-        # First, modify the recipe
-        testrecipe = 'devtool-test-localonly'
-        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
-        recipefile = bb_vars['FILE']
-        src_uri = bb_vars['SRC_URI']
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = self.runCmd('devtool modify %s' % testrecipe)
-        # Modify one file
-        self.runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe, 'oe-local-files'))
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = self.runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
-    @OETestID(1629)
-    def test_devtool_update_recipe_local_patch_gz(self):
-        # First, modify the recipe
-        testrecipe = 'devtool-test-patch-gz'
-        if self.get_bb_var('DISTRO') == 'poky-tiny':
-            self.skipTest("The DISTRO 'poky-tiny' does not provide the dependencies needed by %s" % testrecipe)
-        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
-        recipefile = bb_vars['FILE']
-        src_uri = bb_vars['SRC_URI']
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = self.runCmd('devtool modify %s' % testrecipe)
-        # Modify one file
-        srctree = os.path.join(self.workspacedir, 'sources', testrecipe)
-        self.runCmd('echo "Another line" >> README', cwd=srctree)
-        self.runCmd('git commit -a --amend --no-edit', cwd=srctree)
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = self.runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = [(' M', '.*/%s/readme.patch.gz$' % testrecipe)]
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-        patch_gz = os.path.join(os.path.dirname(recipefile), testrecipe, 'readme.patch.gz')
-        result = self.runCmd('file %s' % patch_gz)
-        if 'gzip compressed data' not in result.output:
-            self.fail('New patch file is not gzipped - file reports:\n%s' % result.output)
-
-    @OETestID(1628)
-    def test_devtool_update_recipe_local_files_subdir(self):
-        # Try devtool extract on a recipe that has a file with subdir= set in
-        # SRC_URI such that it overwrites a file that was in an archive that
-        # was also in SRC_URI
-        # First, modify the recipe
-        testrecipe = 'devtool-test-subdir'
-        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
-        recipefile = bb_vars['FILE']
-        src_uri = bb_vars['SRC_URI']
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = self.runCmd('devtool modify %s' % testrecipe)
-        testfile = os.path.join(self.workspacedir, 'sources', testrecipe, 'testfile')
-        self.assertExists(testfile, 'Extracted source could not be found')
-        with open(testfile, 'r') as f:
-            contents = f.read().rstrip()
-        self.assertEqual(contents, 'Modified version', 'File has apparently not been overwritten as it should have been')
-        # Test devtool update-recipe without modifying any files
-        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
-        result = self.runCmd('devtool update-recipe %s' % testrecipe)
-        expected_status = []
-        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-
     @OETestID(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -1399,87 +987,6 @@ class DevtoolTests(DevtoolCommon):
         self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
         self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
 
-    def _setup_test_devtool_finish_modify(self):
-        # Check preconditions
-        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-        # Try modifying a recipe
-        self.track_for_cleanup(self.workspacedir)
-        recipe = 'mdadm'
-        oldrecipefile = self.get_bb_var('FILE', recipe)
-        recipedir = os.path.dirname(oldrecipefile)
-        result = self.runCmd('git status --porcelain .', cwd=recipedir)
-        if result.output.strip():
-            self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        result = self.runCmd('devtool modify %s %s' % (recipe, tempdir))
-        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
-        # Test devtool status
-        result = self.runCmd('devtool status')
-        self.assertIn(recipe, result.output)
-        self.assertIn(tempdir, result.output)
-        # Make a change to the source
-        result = self.runCmd('sed -i \'/^#include "mdadm.h"/a \\/* Here is a new comment *\\/\' maps.c', cwd=tempdir)
-        result = self.runCmd('git status --porcelain', cwd=tempdir)
-        self.assertIn('M maps.c', result.output)
-        result = self.runCmd('git commit maps.c -m "Add a comment to the code"', cwd=tempdir)
-        for entry in os.listdir(recipedir):
-            filesdir = os.path.join(recipedir, entry)
-            if os.path.isdir(filesdir):
-                break
-        else:
-            self.fail('Unable to find recipe files directory for %s' % recipe)
-        return recipe, oldrecipefile, recipedir, filesdir
-
-    @OETestID(1621)
-    def test_devtool_finish_modify_origlayer(self):
-        recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
-        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
-        self.assertIn('/meta/', recipedir)
-        # Try finish to the original layer
-        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
-        result = self.runCmd('devtool finish %s meta' % recipe)
-        result = self.runCmd('devtool status')
-        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
-        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
-        expected_status = [(' M', '.*/%s$' % os.path.basename(oldrecipefile)),
-                           ('??', '.*/.*-Add-a-comment-to-the-code.patch$')]
-        self._check_repo_status(recipedir, expected_status)
-
-    @OETestID(1622)
-    def test_devtool_finish_modify_otherlayer(self):
-        recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
-        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
-        self.assertIn('/meta/', recipedir)
-        relpth = os.path.relpath(recipedir, os.path.join(self.get_bb_var('COREBASE'), 'meta'))
-        appenddir = os.path.join(self.testlayer_path, relpth)
-        self.track_for_cleanup(appenddir)
-        # Try finish to the original layer
-        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
-        result = self.runCmd('devtool finish %s meta-selftest' % recipe)
-        result = self.runCmd('devtool status')
-        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
-        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
-        result = self.runCmd('git status --porcelain .', cwd=recipedir)
-        if result.output.strip():
-            self.fail('Recipe directory for %s contains the following unexpected changes after finish:\n%s' % (recipe, result.output.strip()))
-        recipefn = os.path.splitext(os.path.basename(oldrecipefile))[0]
-        recipefn = recipefn.split('_')[0] + '_%'
-        appendfile = os.path.join(appenddir, recipefn + '.bbappend')
-        self.assertExists(appendfile, 'bbappend %s should have been created but wasn\'t' % appendfile)
-        newdir = os.path.join(appenddir, recipe)
-        files = os.listdir(newdir)
-        foundpatch = None
-        for fn in files:
-            if fnmatch.fnmatch(fn, '*-Add-a-comment-to-the-code.patch'):
-                foundpatch = fn
-        if not foundpatch:
-            self.fail('No patch file created next to bbappend')
-        files.remove(foundpatch)
-        if files:
-            self.fail('Unexpected file(s) copied next to bbappend: %s' % ', '.join(files))
-
     @OETestID(1626)
     def test_devtool_rename(self):
         # Check preconditions
diff --git a/meta/lib/oeqa/selftest/cases/devtool_end.py b/meta/lib/oeqa/selftest/cases/devtool_end.py
new file mode 100644
index 00000000000..8d41501d726
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/devtool_end.py
@@ -0,0 +1,506 @@
+import os
+import tempfile
+import re
+import fnmatch
+
+from oeqa.selftest.cases import devtool
+from oeqa.core.decorator.oeid import OETestID
+
+class DevtoolFinishModifyTests(devtool.DevtoolCommon):
+    _use_own_builddir = True
+    _main_thread = False
+    _end_thread = True
+
+    def _setup_test_devtool_finish_modify(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Try modifying a recipe
+        self.track_for_cleanup(self.workspacedir)
+        recipe = 'mdadm'
+        oldrecipefile = self.get_bb_var('FILE', recipe)
+        recipedir = os.path.dirname(oldrecipefile)
+        result = self.runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool modify %s %s' % (recipe, tempdir))
+        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
+        # Test devtool status
+        result = self.runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Make a change to the source
+        result = self.runCmd('sed -i \'/^#include "mdadm.h"/a \\/* Here is a new comment *\\/\' maps.c', cwd=tempdir)
+        result = self.runCmd('git status --porcelain', cwd=tempdir)
+        self.assertIn('M maps.c', result.output)
+        result = self.runCmd('git commit maps.c -m "Add a comment to the code"', cwd=tempdir)
+        for entry in os.listdir(recipedir):
+            filesdir = os.path.join(recipedir, entry)
+            if os.path.isdir(filesdir):
+                break
+        else:
+            self.fail('Unable to find recipe files directory for %s' % recipe)
+        return recipe, oldrecipefile, recipedir, filesdir
+
+    @OETestID(1621)
+    def test_devtool_finish_modify_origlayer(self):
+        recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
+        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
+        self.assertIn('/meta/', recipedir)
+        # Try finish to the original layer
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        result = self.runCmd('devtool finish %s meta' % recipe)
+        result = self.runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
+        expected_status = [(' M', '.*/%s$' % os.path.basename(oldrecipefile)),
+                           ('??', '.*/.*-Add-a-comment-to-the-code.patch$')]
+        self._check_repo_status(recipedir, expected_status)
+
+    @OETestID(1622)
+    def test_devtool_finish_modify_otherlayer(self):
+        recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
+        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
+        self.assertIn('/meta/', recipedir)
+        relpth = os.path.relpath(recipedir, os.path.join(self.get_bb_var('COREBASE'), 'meta'))
+        appenddir = os.path.join(self.testlayer_path, relpth)
+        self.track_for_cleanup(appenddir)
+        # Try finish to the original layer
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        result = self.runCmd('devtool finish %s meta-selftest' % recipe)
+        result = self.runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
+        result = self.runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains the following unexpected changes after finish:\n%s' % (recipe, result.output.strip()))
+        recipefn = os.path.splitext(os.path.basename(oldrecipefile))[0]
+        recipefn = recipefn.split('_')[0] + '_%'
+        appendfile = os.path.join(appenddir, recipefn + '.bbappend')
+        self.assertExists(appendfile, 'bbappend %s should have been created but wasn\'t' % appendfile)
+        newdir = os.path.join(appenddir, recipe)
+        files = os.listdir(newdir)
+        foundpatch = None
+        for fn in files:
+            if fnmatch.fnmatch(fn, '*-Add-a-comment-to-the-code.patch'):
+                foundpatch = fn
+        if not foundpatch:
+            self.fail('No patch file created next to bbappend')
+        files.remove(foundpatch)
+        if files:
+            self.fail('Unexpected file(s) copied next to bbappend: %s' % ', '.join(files))
+
+class DevtoolUpdateTests(devtool.DevtoolCommon):
+    _end_thread = True
+
+    @OETestID(1169)
+    def test_devtool_update_recipe(self):
+        # Check preconditions
+        testrecipe = 'minicom'
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        # We don't use -x here so that we test the behaviour of devtool modify without it
+        result = self.runCmd('devtool modify %s %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Add a couple of commits
+        # FIXME: this only tests adding, need to also test update and remove
+        result = self.runCmd('echo "Additional line" >> README', cwd=tempdir)
+        result = self.runCmd('git commit -a -m "Change the README"', cwd=tempdir)
+        result = self.runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git add devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git commit -m "Add a new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; rm %s/*.patch; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('??', '.*/0001-Change-the-README.patch$'),
+                           ('??', '.*/0002-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
+    @OETestID(1172)
+    def test_devtool_update_recipe_git(self):
+        # Check preconditions
+        testrecipe = 'mtd-utils'
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        patches = []
+        for entry in src_uri.split():
+            if entry.startswith('file://') and entry.endswith('.patch'):
+                patches.append(entry[7:].split(';')[0])
+        self.assertGreater(len(patches), 0, 'The %s recipe does not appear to contain any patches, so this test will not be effective' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Add a couple of commits
+        # FIXME: this only tests adding, need to also test update and remove
+        result = self.runCmd('echo "# Additional line" >> Makefile.am', cwd=tempdir)
+        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempdir)
+        result = self.runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git add devtool-new-file', cwd=tempdir)
+        result = self.runCmd('git commit -m "Add a new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; rm -rf %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = self.runCmd('devtool update-recipe -m srcrev %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile))] + \
+                          [(' D', '.*/%s$' % patch) for patch in patches]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
+        result = self.runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
+        srcurilines = src_uri.split()
+        srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
+        srcurilines.append('"')
+        removelines = ['SRCREV = ".*"'] + srcurilines
+        for line in result.output.splitlines():
+            if line.startswith('+++') or line.startswith('---'):
+                continue
+            elif line.startswith('+'):
+                matched = False
+                for item in addlines:
+                    if re.match(item, line[1:].strip()):
+                        matched = True
+                        break
+                self.assertTrue(matched, 'Unexpected diff add line: %s' % line)
+            elif line.startswith('-'):
+                matched = False
+                for item in removelines:
+                    if re.match(item, line[1:].strip()):
+                        matched = True
+                        break
+                self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
+        # Now try with auto mode
+        self.runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
+        result = self.runCmd('git rev-parse --show-toplevel', cwd=os.path.dirname(recipefile))
+        topleveldir = result.output.strip()
+        relpatchpath = os.path.join(os.path.relpath(os.path.dirname(recipefile), topleveldir), testrecipe)
+        expected_status = [(' M', os.path.relpath(recipefile, topleveldir)),
+                           ('??', '%s/0001-Change-the-Makefile.patch' % relpatchpath),
+                           ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
+    @OETestID(1170)
+    def test_devtool_update_recipe_append(self):
+        # Check preconditions
+        testrecipe = 'mdadm'
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempsrcdir = os.path.join(tempdir, 'source')
+        templayerdir = os.path.join(tempdir, 'layer')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
+        # Check git repo
+        self._check_src_repo(tempsrcdir)
+        # Add a commit
+        result = self.runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
+        result = self.runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
+        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
+        # Create a temporary layer and add it to bblayers.conf
+        self._create_temp_layer(templayerdir, True, 'selftestupdaterecipe')
+        # Create the bbappend
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertNotIn('WARNING:', result.output)
+        # Check recipe is still clean
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # Check bbappend was created
+        splitpath = os.path.dirname(recipefile).split(os.sep)
+        appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
+        patchfile = os.path.join(appenddir, testrecipe, '0001-Add-our-custom-version.patch')
+        self.assertExists(patchfile, 'Patch file not created')
+
+        # Check bbappend contents
+        expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n',
+                         'SRC_URI += "file://0001-Add-our-custom-version.patch"\n',
+                         '\n']
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+
+        # Check we can run it again and bbappend isn't modified
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Drop new commit and check patch gets deleted
+        result = self.runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertNotExists(patchfile, 'Patch file not deleted')
+        expectedlines2 = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines2, f.readlines())
+        # Put commit back and check we can run it if layer isn't in bblayers.conf
+        os.remove(bbappendfile)
+        result = self.runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
+        result = self.runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
+        result = self.runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
+        self.assertExists(patchfile, 'Patch file not created (with disabled layer)')
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Deleting isn't expected to work under these circumstances
+
+    @OETestID(1171)
+    def test_devtool_update_recipe_append_git(self):
+        # Check preconditions
+        testrecipe = 'mtd-utils'
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        for entry in src_uri.split():
+            if entry.startswith('git://'):
+                git_uri = entry
+                break
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempsrcdir = os.path.join(tempdir, 'source')
+        templayerdir = os.path.join(tempdir, 'layer')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
+        # Check git repo
+        self._check_src_repo(tempsrcdir)
+        # Add a commit
+        result = self.runCmd('echo "# Additional line" >> Makefile.am', cwd=tempsrcdir)
+        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
+        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
+        # Create a temporary layer
+        os.makedirs(os.path.join(templayerdir, 'conf'))
+        with open(os.path.join(templayerdir, 'conf', 'layer.conf'), 'w') as f:
+            f.write('BBPATH .= ":${LAYERDIR}"\n')
+            f.write('BBFILES += "${LAYERDIR}/recipes-*/*/*.bbappend"\n')
+            f.write('BBFILE_COLLECTIONS += "oeselftesttemplayer"\n')
+            f.write('BBFILE_PATTERN_oeselftesttemplayer = "^${LAYERDIR}/"\n')
+            f.write('BBFILE_PRIORITY_oeselftesttemplayer = "999"\n')
+            f.write('BBFILE_PATTERN_IGNORE_EMPTY_oeselftesttemplayer = "1"\n')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
+        result = self.runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
+        # Create the bbappend
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        self.assertNotIn('WARNING:', result.output)
+        # Check recipe is still clean
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # Check bbappend was created
+        splitpath = os.path.dirname(recipefile).split(os.sep)
+        appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
+        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
+
+        # Check bbappend contents
+        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        expectedlines = set(['SRCREV = "%s"\n' % result.output,
+                             '\n',
+                             'SRC_URI = "%s"\n' % git_uri,
+                             '\n'])
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, set(f.readlines()))
+
+        # Check we can run it again and bbappend isn't modified
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, set(f.readlines()))
+        # Drop new commit and check SRCREV changes
+        result = self.runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
+        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        expectedlines = set(['SRCREV = "%s"\n' % result.output,
+                             '\n',
+                             'SRC_URI = "%s"\n' % git_uri,
+                             '\n'])
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, set(f.readlines()))
+        # Put commit back and check we can run it if layer isn't in bblayers.conf
+        os.remove(bbappendfile)
+        result = self.runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
+        result = self.runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
+        result = self.runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
+        self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
+        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
+        result = self.runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        expectedlines = set(['SRCREV = "%s"\n' % result.output,
+                             '\n',
+                             'SRC_URI = "%s"\n' % git_uri,
+                             '\n'])
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, set(f.readlines()))
+        # Deleting isn't expected to work under these circumstances
+
+    @OETestID(1370)
+    def test_devtool_update_recipe_local_files(self):
+        """Check that local source files are copied over instead of patched"""
+        testrecipe = 'makedevs'
+        recipefile = self.get_bb_var('FILE', testrecipe)
+        # Setup srctree for modifying the recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be
+        # building it)
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Try building just to ensure we haven't broken that
+        self.bitbake("%s" % testrecipe)
+        # Edit / commit local source
+        self.runCmd('echo "/* Foobar */" >> oe-local-files/makedevs.c', cwd=tempdir)
+        self.runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
+        self.runCmd('echo "Bar" > new-file', cwd=tempdir)
+        self.runCmd('git add new-file', cwd=tempdir)
+        self.runCmd('git commit -m "Add new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
+                                     os.path.dirname(recipefile))
+        self.runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           (' M', '.*/makedevs/makedevs.c$'),
+                           ('??', '.*/makedevs/new-local$'),
+                           ('??', '.*/makedevs/0001-Add-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
+    @OETestID(1371)
+    def test_devtool_update_recipe_local_files_2(self):
+        """Check local source files support when oe-local-files is in Git"""
+        testrecipe = 'lzo'
+        recipefile = self.get_bb_var('FILE', testrecipe)
+        # Setup srctree for modifying the recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Add oe-local-files to Git
+        self.runCmd('rm oe-local-files/.gitignore', cwd=tempdir)
+        self.runCmd('git add oe-local-files', cwd=tempdir)
+        self.runCmd('git commit -m "Add local sources"', cwd=tempdir)
+        # Edit / commit local sources
+        self.runCmd('echo "# Foobar" >> oe-local-files/acinclude.m4', cwd=tempdir)
+        self.runCmd('git commit -am "Edit existing file"', cwd=tempdir)
+        self.runCmd('git rm oe-local-files/run-ptest', cwd=tempdir)
+        self.runCmd('git commit -m"Remove file"', cwd=tempdir)
+        self.runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
+        self.runCmd('git add oe-local-files/new-local', cwd=tempdir)
+        self.runCmd('git commit -m "Add new local file"', cwd=tempdir)
+        self.runCmd('echo "Gar" > new-file', cwd=tempdir)
+        self.runCmd('git add new-file', cwd=tempdir)
+        self.runCmd('git commit -m "Add new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
+                                     os.path.dirname(recipefile))
+        # Checkout unmodified file to working copy -> devtool should still pick
+        # the modified version from HEAD
+        self.runCmd('git checkout HEAD^ -- oe-local-files/acinclude.m4', cwd=tempdir)
+        self.runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           (' M', '.*/acinclude.m4$'),
+                           (' D', '.*/run-ptest$'),
+                           ('??', '.*/new-local$'),
+                           ('??', '.*/0001-Add-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
+    @OETestID(1627)
+    def test_devtool_update_recipe_local_files_3(self):
+        # First, modify the recipe
+        testrecipe = 'devtool-test-localonly'
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = self.runCmd('devtool modify %s' % testrecipe)
+        # Modify one file
+        self.runCmd('echo "Another line" >> file2', cwd=os.path.join(self.workspacedir, 'sources', testrecipe, 'oe-local-files'))
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
+    @OETestID(1629)
+    def test_devtool_update_recipe_local_patch_gz(self):
+        # First, modify the recipe
+        testrecipe = 'devtool-test-patch-gz'
+        if self.get_bb_var('DISTRO') == 'poky-tiny':
+            self.skipTest("The DISTRO 'poky-tiny' does not provide the dependencies needed by %s" % testrecipe)
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = self.runCmd('devtool modify %s' % testrecipe)
+        # Modify one file
+        srctree = os.path.join(self.workspacedir, 'sources', testrecipe)
+        self.runCmd('echo "Another line" >> README', cwd=srctree)
+        self.runCmd('git commit -a --amend --no-edit', cwd=srctree)
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s/readme.patch.gz$' % testrecipe)]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        patch_gz = os.path.join(os.path.dirname(recipefile), testrecipe, 'readme.patch.gz')
+        result = self.runCmd('file %s' % patch_gz)
+        if 'gzip compressed data' not in result.output:
+            self.fail('New patch file is not gzipped - file reports:\n%s' % result.output)
+
+    @OETestID(1628)
+    def test_devtool_update_recipe_local_files_subdir(self):
+        # Try devtool extract on a recipe that has a file with subdir= set in
+        # SRC_URI such that it overwrites a file that was in an archive that
+        # was also in SRC_URI
+        # First, modify the recipe
+        testrecipe = 'devtool-test-subdir'
+        bb_vars = self.get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = self.runCmd('devtool modify %s' % testrecipe)
+        testfile = os.path.join(self.workspacedir, 'sources', testrecipe, 'testfile')
+        self.assertExists(testfile, 'Extracted source could not be found')
+        with open(testfile, 'r') as f:
+            contents = f.read().rstrip()
+        self.assertEqual(contents, 'Modified version', 'File has apparently not been overwritten as it should have been')
+        # Test devtool update-recipe without modifying any files
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = self.runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = []
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
-- 
2.11.0


