Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0A767735BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425650"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:40:00 +0000
Message-Id: <38dffb41b304acd829f88910e9db4810ca39c5c5.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/15] devtool: update-recipe: add handling for git recipes
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:33 -0000

When updating git-based recipes, in a lot of cases what you want is to
push the changes to the repository and update SRCREV rather than to
apply patches within the recipe. Updating SRCREV is now the default
behaviour for recipes that fetch from git, but this can be overridden
in both directions using a new -m/--mode option.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py |  70 +++++++++++-
 scripts/lib/devtool/standard.py   | 230 ++++++++++++++++++++++++--------------
 2 files changed, 213 insertions(+), 87 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 8caf07a..f147f24 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -233,6 +233,8 @@ class DevtoolTests(oeSelfTest):
         self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         testrecipe = 'minicom'
         recipefile = get_bb_var('FILE', testrecipe)
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
         result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
         self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
         # First, modify a recipe
@@ -266,11 +268,77 @@ class DevtoolTests(oeSelfTest):
                 self.assertEqual(line[:3], '?? ', 'Unexpected status in line: %s' % line)
             elif line.endswith('0002-Add-a-new-file.patch'):
                 self.assertEqual(line[:3], '?? ', 'Unexpected status in line: %s' % line)
-            elif re.search('minicom_[^_]*.bb$', line):
+            elif re.search('%s_[^_]*.bb$' % testrecipe, line):
                 self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
             else:
                 raise AssertionError('Unexpected modified file in status: %s' % line)
 
+    def test_devtool_update_recipe_git(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        testrecipe = 'mtd-utils'
+        recipefile = get_bb_var('FILE', testrecipe)
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
+        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
+        result = runCmd('git status --porcelain', cwd=tempdir)
+        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
+        result = runCmd('git symbolic-ref HEAD', cwd=tempdir)
+        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        # Add a couple of commits
+        # FIXME: this only tests adding, need to also test update and remove
+        result = runCmd('echo "# Additional line" >> Makefile', cwd=tempdir)
+        result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempdir)
+        result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
+        result = runCmd('git add devtool-new-file', cwd=tempdir)
+        result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
+        self.assertNotEqual(result.output.strip(), "", '%s recipe should be modified' % testrecipe)
+        status = result.output.splitlines()
+        self.assertEqual(len(status), 3, 'Less/more files modified than expected. Entire status:\n%s' % result.output)
+        for line in status:
+            if line.endswith('add-exclusion-to-mkfs-jffs2-git-2.patch'):
+                self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
+            elif line.endswith('fix-armv7-neon-alignment.patch'):
+                self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
+            elif re.search('%s_[^_]*.bb$' % testrecipe, line):
+                self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
+            else:
+                raise AssertionError('Unexpected modified file in status: %s' % line)
+        result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
+        removelines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git \\\\', 'file://add-exclusion-to-mkfs-jffs2-git-2.patch \\\\', 'file://fix-armv7-neon-alignment.patch \\\\', '"']
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
+
     def test_devtool_extract(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9b5a085..3a8c66c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -359,104 +359,162 @@ def update_recipe(args, config, basepath, workspace):
     from oe.patch import GitApplyTree
     import oe.recipeutils
 
-    srctree = workspace[args.recipename]
-    commits = []
-    update_rev = None
-    if args.initial_rev:
-        initial_rev = args.initial_rev
-    else:
-        initial_rev = None
-        with open(appends[0], 'r') as f:
-            for line in f:
-                if line.startswith('# initial_rev:'):
-                    initial_rev = line.split(':')[-1].strip()
-                elif line.startswith('# commit:'):
-                    commits.append(line.split(':')[-1].strip())
-
-        if initial_rev:
-            # Find first actually changed revision
-            (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
-            newcommits = stdout.split()
-            for i in xrange(min(len(commits), len(newcommits))):
-                if newcommits[i] == commits[i]:
-                    update_rev = commits[i]
-
-    if not initial_rev:
-        logger.error('Unable to find initial revision - please specify it with --initial-rev')
-        return -1
-
-    if not update_rev:
-        update_rev = initial_rev
-
-    # Find list of existing patches in recipe file
     recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
     if not recipefile:
         # Error already logged
         return -1
     rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
-    existing_patches = oe.recipeutils.get_recipe_patches(rd)
 
-    removepatches = []
-    if not args.no_remove:
-        # Get all patches from source tree and check if any should be removed
+    orig_src_uri = rd.getVar('SRC_URI', False) or ''
+    if args.mode == 'auto':
+        if 'git://' in orig_src_uri:
+            mode = 'srcrev'
+        else:
+            mode = 'patch'
+    else:
+        mode = args.mode
+
+    def remove_patches(srcuri, patchlist):
+        # Remove any patches that we don't need
+        updated = False
+        for patch in patchlist:
+            patchfile = os.path.basename(patch)
+            for i in xrange(len(srcuri)):
+                if srcuri[i].startswith('file://') and os.path.basename(srcuri[i]).split(';')[0] == patchfile:
+                    logger.info('Removing patch %s' % patchfile)
+                    srcuri.pop(i)
+                    # FIXME "git rm" here would be nice if the file in question is tracked
+                    # FIXME there's a chance that this file is referred to by another recipe, in which case deleting wouldn't be the right thing to do
+                    if patch.startswith(os.path.dirname(recipefile)):
+                        os.remove(patch)
+                    updated = True
+                    break
+        return updated
+
+    srctree = workspace[args.recipename]
+    if mode == 'srcrev':
+        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
+        srcrev = stdout.strip()
+        if len(srcrev) != 40:
+            logger.error('Invalid hash returned by git: %s' % stdout)
+            return 1
+
+        logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
+        patchfields = {}
+        patchfields['SRCREV'] = srcrev
+        if not args.no_remove:
+            # Find list of existing patches in recipe file
+            existing_patches = oe.recipeutils.get_recipe_patches(rd)
+
+            old_srcrev = (rd.getVar('SRCREV', False) or '')
+            tempdir = tempfile.mkdtemp(prefix='devtool')
+            removepatches = []
+            try:
+                GitApplyTree.extractPatches(srctree, old_srcrev, tempdir)
+                newpatches = os.listdir(tempdir)
+                for patch in existing_patches:
+                    patchfile = os.path.basename(patch)
+                    if patchfile in newpatches:
+                        removepatches.append(patch)
+            finally:
+                shutil.rmtree(tempdir)
+            if removepatches:
+                srcuri = (rd.getVar('SRC_URI', False) or '').split()
+                if remove_patches(srcuri, removepatches):
+                    patchfields['SRC_URI'] = ' '.join(srcuri)
+
+        oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
+
+        if not 'git://' in orig_src_uri:
+            logger.info('You will need to update SRC_URI within the recipe to point to a git repository where you have pushed your changes')
+
+    elif mode == 'patch':
+        commits = []
+        update_rev = None
+        if args.initial_rev:
+            initial_rev = args.initial_rev
+        else:
+            initial_rev = None
+            with open(appends[0], 'r') as f:
+                for line in f:
+                    if line.startswith('# initial_rev:'):
+                        initial_rev = line.split(':')[-1].strip()
+                    elif line.startswith('# commit:'):
+                        commits.append(line.split(':')[-1].strip())
+
+            if initial_rev:
+                # Find first actually changed revision
+                (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
+                newcommits = stdout.split()
+                for i in xrange(min(len(commits), len(newcommits))):
+                    if newcommits[i] == commits[i]:
+                        update_rev = commits[i]
+
+        if not initial_rev:
+            logger.error('Unable to find initial revision - please specify it with --initial-rev')
+            return -1
+
+        if not update_rev:
+            update_rev = initial_rev
+
+        # Find list of existing patches in recipe file
+        existing_patches = oe.recipeutils.get_recipe_patches(rd)
+
+        removepatches = []
+        if not args.no_remove:
+            # Get all patches from source tree and check if any should be removed
+            tempdir = tempfile.mkdtemp(prefix='devtool')
+            try:
+                GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
+                newpatches = os.listdir(tempdir)
+                for patch in existing_patches:
+                    patchfile = os.path.basename(patch)
+                    if patchfile not in newpatches:
+                        removepatches.append(patch)
+            finally:
+                shutil.rmtree(tempdir)
+
+        # Get updated patches from source tree
         tempdir = tempfile.mkdtemp(prefix='devtool')
         try:
-            GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
+            GitApplyTree.extractPatches(srctree, update_rev, tempdir)
+
+            # Match up and replace existing patches with corresponding new patches
+            updatepatches = False
+            updaterecipe = False
             newpatches = os.listdir(tempdir)
             for patch in existing_patches:
                 patchfile = os.path.basename(patch)
-                if patchfile not in newpatches:
-                    removepatches.append(patch)
+                if patchfile in newpatches:
+                    logger.info('Updating patch %s' % patchfile)
+                    shutil.move(os.path.join(tempdir, patchfile), patch)
+                    newpatches.remove(patchfile)
+                    updatepatches = True
+            srcuri = (rd.getVar('SRC_URI', False) or '').split()
+            if newpatches:
+                # Add any patches left over
+                patchdir = os.path.join(os.path.dirname(recipefile), rd.getVar('BPN', True))
+                bb.utils.mkdirhier(patchdir)
+                for patchfile in newpatches:
+                    logger.info('Adding new patch %s' % patchfile)
+                    shutil.move(os.path.join(tempdir, patchfile), os.path.join(patchdir, patchfile))
+                    srcuri.append('file://%s' % patchfile)
+                    updaterecipe = True
+            if removepatches:
+                if remove_patches(srcuri, removepatches):
+                    updaterecipe = True
+            if updaterecipe:
+                logger.info('Updating recipe %s' % os.path.basename(recipefile))
+                oe.recipeutils.patch_recipe(rd, recipefile, {'SRC_URI': ' '.join(srcuri)})
+            elif not updatepatches:
+                # Neither patches nor recipe were updated
+                logger.info('No patches need updating')
         finally:
             shutil.rmtree(tempdir)
 
-    # Get updated patches from source tree
-    tempdir = tempfile.mkdtemp(prefix='devtool')
-    try:
-        GitApplyTree.extractPatches(srctree, update_rev, tempdir)
-
-        # Match up and replace existing patches with corresponding new patches
-        updatepatches = False
-        updaterecipe = False
-        newpatches = os.listdir(tempdir)
-        for patch in existing_patches:
-            patchfile = os.path.basename(patch)
-            if patchfile in newpatches:
-                logger.info('Updating patch %s' % patchfile)
-                shutil.move(os.path.join(tempdir, patchfile), patch)
-                newpatches.remove(patchfile)
-                updatepatches = True
-        srcuri = (rd.getVar('SRC_URI', False) or '').split()
-        if newpatches:
-            # Add any patches left over
-            patchdir = os.path.join(os.path.dirname(recipefile), rd.getVar('BPN', True))
-            bb.utils.mkdirhier(patchdir)
-            for patchfile in newpatches:
-                logger.info('Adding new patch %s' % patchfile)
-                shutil.move(os.path.join(tempdir, patchfile), os.path.join(patchdir, patchfile))
-                srcuri.append('file://%s' % patchfile)
-                updaterecipe = True
-        if removepatches:
-            # Remove any patches that we don't need
-            for patch in removepatches:
-                patchfile = os.path.basename(patch)
-                for i in xrange(len(srcuri)):
-                    if srcuri[i].startswith('file://') and os.path.basename(srcuri[i]).split(';')[0] == patchfile:
-                        logger.info('Removing patch %s' % patchfile)
-                        srcuri.pop(i)
-                        # FIXME "git rm" here would be nice if the file in question is tracked
-                        # FIXME there's a chance that this file is referred to by another recipe, in which case deleting wouldn't be the right thing to do
-                        os.remove(patch)
-                        updaterecipe = True
-                        break
-        if updaterecipe:
-            logger.info('Updating recipe %s' % os.path.basename(recipefile))
-            oe.recipeutils.patch_recipe(rd, recipefile, {'SRC_URI': ' '.join(srcuri)})
-        elif not updatepatches:
-            # Neither patches nor recipe were updated
-            logger.info('No patches need updating')
-    finally:
-        shutil.rmtree(tempdir)
+    else:
+        logger.error('update_recipe: invalid mode %s' % mode)
+        return 1
 
     return 0
 
@@ -539,9 +597,9 @@ def register_commands(subparsers, context):
     parser_add.set_defaults(func=extract)
 
     parser_add = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
-                                       description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary)',
-                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+                                       description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV)')
     parser_add.add_argument('recipename', help='Name of recipe to update')
+    parser_add.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_add.add_argument('--initial-rev', help='Starting revision for patches')
     parser_add.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
     parser_add.set_defaults(func=update_recipe)
-- 
1.9.3


