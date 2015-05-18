Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7570974053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:15:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2015 08:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731190801"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 08:15:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:15:08 +0100
Message-Id: <b49755a783d9f29e32a82f393d12a74838970eda.1431961859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] devtool: update-recipe: add option to write changes to bbappend
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
X-List-Received-Date: Mon, 18 May 2015 15:15:20 -0000

Quite often what you want to do having made customisations to a piece of
software is to apply those customisations in your own layer rather than
in the original recipe. Thus, add a -a/--append option to the
update-recipe subcommand which allows you to specify the layer to write
a bbappend into. The bbappend will be created at the appropriate path
within the specified layer directory (which may or may not be in your
bblayers.conf) or if one already exists it will be updated
appropriately.

(This re-uses code written for recipetool appendfile.)

Implements [YOCTO #7587].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 171 ++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 148 ++++++++++++++++++++++++---------
 2 files changed, 278 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index ad10af5..4e22e1d 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -524,6 +524,177 @@ class DevtoolTests(DevtoolBase):
                         break
                 self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
 
+    def test_devtool_update_recipe_append(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        testrecipe = 'mdadm'
+        recipefile = get_bb_var('FILE', testrecipe)
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        self.assertNotIn('git://', src_uri, 'This test expects the %s recipe to NOT be a git recipe' % testrecipe)
+        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
+        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempsrcdir = os.path.join(tempdir, 'source')
+        templayerdir = os.path.join(tempdir, 'layer')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
+        # Check git repo
+        self.assertTrue(os.path.isdir(os.path.join(tempsrcdir, '.git')), 'git repository for external source tree not found')
+        result = runCmd('git status --porcelain', cwd=tempsrcdir)
+        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
+        result = runCmd('git symbolic-ref HEAD', cwd=tempsrcdir)
+        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        # Add a commit
+        result = runCmd("sed 's!\\(#define VERSION\\W*\"[^\"]*\\)\"!\\1-custom\"!' -i ReadMe.c", cwd=tempsrcdir)
+        result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
+        self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
+        # Create a temporary layer and add it to bblayers.conf
+        self._create_temp_layer(templayerdir, True, 'selftestupdaterecipe')
+        # Create the bbappend
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertNotIn('WARNING:', result.output)
+        # Check recipe is still clean
+        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
+        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        # Check bbappend was created
+        splitpath = os.path.dirname(recipefile).split(os.sep)
+        appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
+        patchfile = os.path.join(appenddir, testrecipe, '0001-Add-our-custom-version.patch')
+        self.assertTrue(os.path.exists(patchfile), 'Patch file not created')
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
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Drop new commit and check patch gets deleted
+        result = runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertFalse(os.path.exists(patchfile), 'Patch file not deleted')
+        expectedlines2 = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
+                         '\n']
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines2, f.readlines())
+        # Put commit back and check we can run it if layer isn't in bblayers.conf
+        os.remove(bbappendfile)
+        result = runCmd('git commit -a -m "Add our custom version"', cwd=tempsrcdir)
+        result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
+        self.assertTrue(os.path.exists(patchfile), 'Patch file not created (with disabled layer)')
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Deleting isn't expected to work under these circumstances
+
+    def test_devtool_update_recipe_append_git(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        testrecipe = 'mtd-utils'
+        recipefile = get_bb_var('FILE', testrecipe)
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        for entry in src_uri.split():
+            if entry.startswith('git://'):
+                git_uri = entry
+                break
+        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
+        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempsrcdir = os.path.join(tempdir, 'source')
+        templayerdir = os.path.join(tempdir, 'layer')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempsrcdir))
+        # Check git repo
+        self.assertTrue(os.path.isdir(os.path.join(tempsrcdir, '.git')), 'git repository for external source tree not found')
+        result = runCmd('git status --porcelain', cwd=tempsrcdir)
+        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
+        result = runCmd('git symbolic-ref HEAD', cwd=tempsrcdir)
+        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        # Add a commit
+        result = runCmd('echo "# Additional line" >> Makefile', cwd=tempsrcdir)
+        result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
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
+        result = runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
+        # Create the bbappend
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertNotIn('WARNING:', result.output)
+        # Check recipe is still clean
+        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
+        self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
+        # Check bbappend was created
+        splitpath = os.path.dirname(recipefile).split(os.sep)
+        appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
+        self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
+
+        # Check bbappend contents
+        result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        expectedlines = ['SRCREV = "%s"\n' % result.output,
+                         '\n',
+                         'SRC_URI = "%s"\n' % git_uri,
+                         '\n']
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+
+        # Check we can run it again and bbappend isn't modified
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Drop new commit and check SRCREV changes
+        result = runCmd('git reset HEAD^', cwd=tempsrcdir)
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
+        result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        expectedlines = ['SRCREV = "%s"\n' % result.output,
+                         '\n',
+                         'SRC_URI = "%s"\n' % git_uri,
+                         '\n']
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Put commit back and check we can run it if layer isn't in bblayers.conf
+        os.remove(bbappendfile)
+        result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
+        result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
+        self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
+        result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
+        expectedlines = ['SRCREV = "%s"\n' % result.output,
+                         '\n',
+                         'SRC_URI = "%s"\n' % git_uri,
+                         '\n']
+        with open(bbappendfile, 'r') as f:
+            self.assertEqual(expectedlines, f.readlines())
+        # Deleting isn't expected to work under these circumstances
+
     def test_devtool_extract(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 122121a..c5b32d8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -24,6 +24,7 @@ import tempfile
 import logging
 import argparse
 import scriptutils
+import errno
 from devtool import exec_build_env_command, setup_tinfoil
 
 logger = logging.getLogger('devtool')
@@ -510,6 +511,14 @@ def update_recipe(args, config, basepath, workspace):
         logger.error("no recipe named %s in your workspace" % args.recipename)
         return -1
 
+    if args.append:
+        if not os.path.exists(args.append):
+            logger.error('bbappend destination layer directory "%s" does not exist' % args.append)
+            return 2
+        if not os.path.exists(os.path.join(args.append, 'conf', 'layer.conf')):
+            logger.error('conf/layer.conf not found in bbappend destination layer "%s"' % args.append)
+            return 2
+
     tinfoil = setup_tinfoil()
     import bb
     from oe.patch import GitApplyTree
@@ -535,22 +544,19 @@ def update_recipe(args, config, basepath, workspace):
     else:
         mode = args.mode
 
-    def remove_patches(srcuri, patchlist):
-        """Remove patches"""
-        updated = False
+    def remove_patch_entries(srcuri, patchlist):
+        """Remove patch entries from SRC_URI"""
+        remaining = patchlist[:]
+        entries = []
         for patch in patchlist:
             patchfile = os.path.basename(patch)
             for i in xrange(len(srcuri)):
-                if srcuri[i].startswith('file://') and os.path.basename(srcuri[i]).split(';')[0] == patchfile:
-                    logger.info('Removing patch %s' % patchfile)
+                if srcuri[i].startswith('file://') and os.path.basename(srcuri[i].split(';')[0]) == patchfile:
+                    entries.append(srcuri[i])
+                    remaining.remove(patch)
                     srcuri.pop(i)
-                    # FIXME "git rm" here would be nice if the file in question is tracked
-                    # FIXME there's a chance that this file is referred to by another recipe, in which case deleting wouldn't be the right thing to do
-                    if patch.startswith(os.path.dirname(recipefile)):
-                        os.remove(patch)
-                    updated = True
                     break
-        return updated
+        return entries, remaining
 
     srctree = workspace[args.recipename]
 
@@ -565,8 +571,11 @@ def update_recipe(args, config, basepath, workspace):
         logger.error('Invalid hash returned by git: %s' % stdout)
         return 1
 
+    removepatches = []
+    destpath = None
     if mode == 'srcrev':
         logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
+        removevalues = None
         patchfields = {}
         patchfields['SRCREV'] = srcrev
         if not args.no_remove:
@@ -575,7 +584,6 @@ def update_recipe(args, config, basepath, workspace):
 
             old_srcrev = (rd.getVar('SRCREV', False) or '')
             tempdir = tempfile.mkdtemp(prefix='devtool')
-            removepatches = []
             try:
                 GitApplyTree.extractPatches(srctree, old_srcrev, tempdir)
                 newpatches = os.listdir(tempdir)
@@ -587,10 +595,14 @@ def update_recipe(args, config, basepath, workspace):
                 shutil.rmtree(tempdir)
             if removepatches:
                 srcuri = (rd.getVar('SRC_URI', False) or '').split()
-                if remove_patches(srcuri, removepatches):
+                removedentries, _ = remove_patch_entries(srcuri, removepatches)
+                if removedentries:
                     patchfields['SRC_URI'] = ' '.join(srcuri)
 
-        oe.recipeutils.patch_recipe(tinfoil.config_data, recipefile, patchfields)
+        if args.append:
+            (appendfile, destpath) = oe.recipeutils.bbappend_recipe(rd, args.append, None, wildcardver=args.wildcard_version, extralines=patchfields)
+        else:
+            oe.recipeutils.patch_recipe(tinfoil.config_data, recipefile, patchfields)
 
         if not 'git://' in orig_src_uri:
             logger.info('You will need to update SRC_URI within the recipe to point to a git repository where you have pushed your changes')
@@ -628,6 +640,7 @@ def update_recipe(args, config, basepath, workspace):
         existing_patches = oe.recipeutils.get_recipe_patches(rd)
 
         removepatches = []
+        seqpatch_re = re.compile('^[0-9]{4}-')
         if not args.no_remove:
             # Get all patches from source tree and check if any should be removed
             tempdir = tempfile.mkdtemp(prefix='devtool')
@@ -635,8 +648,18 @@ def update_recipe(args, config, basepath, workspace):
                 GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
                 newpatches = os.listdir(tempdir)
                 for patch in existing_patches:
+                    # If it's a git sequence named patch, the numbers might not match up
+                    # since we are starting from a different revision
+                    # This does assume that people are using unique shortlog values, but
+                    # they ought to be anyway...
                     patchfile = os.path.basename(patch)
-                    if patchfile not in newpatches:
+                    if seqpatch_re.search(patchfile):
+                        for newpatch in newpatches:
+                            if seqpatch_re.search(newpatch) and patchfile[5:] == newpatch[5:]:
+                                break
+                        else:
+                            removepatches.append(patch)
+                    elif patchfile not in newpatches:
                         removepatches.append(patch)
             finally:
                 shutil.rmtree(tempdir)
@@ -650,33 +673,56 @@ def update_recipe(args, config, basepath, workspace):
             updatepatches = False
             updaterecipe = False
             newpatches = os.listdir(tempdir)
-            for patch in existing_patches:
-                patchfile = os.path.basename(patch)
-                if patchfile in newpatches:
-                    logger.info('Updating patch %s' % patchfile)
-                    shutil.move(os.path.join(tempdir, patchfile), patch)
-                    newpatches.remove(patchfile)
-                    updatepatches = True
-            srcuri = (rd.getVar('SRC_URI', False) or '').split()
-            if newpatches:
-                # Add any patches left over
-                patchdir = os.path.join(os.path.dirname(recipefile), rd.getVar('BPN', True))
-                bb.utils.mkdirhier(patchdir)
+            if args.append:
+                patchfiles = {}
+                for patch in existing_patches:
+                    patchfile = os.path.basename(patch)
+                    if patchfile in newpatches:
+                        patchfiles[os.path.join(tempdir, patchfile)] = patchfile
+                        newpatches.remove(patchfile)
                 for patchfile in newpatches:
-                    logger.info('Adding new patch %s' % patchfile)
-                    shutil.move(os.path.join(tempdir, patchfile), os.path.join(patchdir, patchfile))
-                    srcuri.append('file://%s' % patchfile)
-                    updaterecipe = True
-            if removepatches:
-                if remove_patches(srcuri, removepatches):
-                    updaterecipe = True
-            if updaterecipe:
-                logger.info('Updating recipe %s' % os.path.basename(recipefile))
-                oe.recipeutils.patch_recipe(tinfoil.config_data,
-                        recipefile, {'SRC_URI': ' '.join(srcuri)})
-            elif not updatepatches:
-                # Neither patches nor recipe were updated
-                logger.info('No patches need updating')
+                    patchfiles[os.path.join(tempdir, patchfile)] = None
+
+                if patchfiles or removepatches:
+                    removevalues = None
+                    if removepatches:
+                        srcuri = (rd.getVar('SRC_URI', False) or '').split()
+                        removedentries, remaining = remove_patch_entries(srcuri, removepatches)
+                        if removedentries or remaining:
+                            removevalues = {'SRC_URI': removedentries + ['file://' + os.path.basename(item) for item in remaining]}
+                    (appendfile, destpath) = oe.recipeutils.bbappend_recipe(rd, args.append, patchfiles, removevalues=removevalues)
+                else:
+                    logger.info('No patches needed updating')
+            else:
+                for patch in existing_patches:
+                    patchfile = os.path.basename(patch)
+                    if patchfile in newpatches:
+                        logger.info('Updating patch %s' % patchfile)
+                        shutil.move(os.path.join(tempdir, patchfile), patch)
+                        newpatches.remove(patchfile)
+                        updatepatches = True
+                srcuri = (rd.getVar('SRC_URI', False) or '').split()
+                if newpatches:
+                    # Add any patches left over
+                    patchdir = os.path.join(os.path.dirname(recipefile), rd.getVar('BPN', True))
+                    bb.utils.mkdirhier(patchdir)
+                    for patchfile in newpatches:
+                        logger.info('Adding new patch %s' % patchfile)
+                        shutil.move(os.path.join(tempdir, patchfile), os.path.join(patchdir, patchfile))
+                        srcuri.append('file://%s' % patchfile)
+                        updaterecipe = True
+                if removepatches:
+                    removedentries, _ = remove_patch_entries(srcuri, removepatches)
+                    if removedentries:
+                        updaterecipe = True
+                if updaterecipe:
+                    logger.info('Updating recipe %s' % os.path.basename(recipefile))
+                    oe.recipeutils.patch_recipe(tinfoil.config_data,
+                            recipefile, {'SRC_URI': ' '.join(srcuri)})
+                elif not updatepatches:
+                    # Neither patches nor recipe were updated
+                    logger.info('No patches need updating')
+
         finally:
             shutil.rmtree(tempdir)
 
@@ -684,6 +730,24 @@ def update_recipe(args, config, basepath, workspace):
         logger.error('update_recipe: invalid mode %s' % mode)
         return 1
 
+    if removepatches:
+        for patchfile in removepatches:
+            if args.append:
+                if not destpath:
+                    raise Exception('destpath should be set here')
+                patchfile = os.path.join(destpath, os.path.basename(patchfile))
+
+            if os.path.exists(patchfile):
+                logger.info('Removing patch %s' % patchfile)
+                # FIXME "git rm" here would be nice if the file in question is tracked
+                # FIXME there's a chance that this file is referred to by another recipe, in which case deleting wouldn't be the right thing to do
+                os.remove(patchfile)
+                # Remove directory if empty
+                try:
+                    os.rmdir(os.path.dirname(patchfile))
+                except OSError as ose:
+                    if ose.errno != errno.ENOTEMPTY:
+                        raise
     return 0
 
 
@@ -797,6 +861,8 @@ def register_commands(subparsers, context):
     parser_update_recipe.add_argument('recipename', help='Name of recipe to update')
     parser_update_recipe.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_update_recipe.add_argument('--initial-rev', help='Starting revision for patches')
+    parser_update_recipe.add_argument('--append', '-a', help='Write changes to a bbappend in the specified layer instead of the recipe', metavar='LAYERDIR')
+    parser_update_recipe.add_argument('--wildcard-version', '-w', help='In conjunction with -a/--append, use a wildcard to make the bbappend apply to any recipe version', action='store_true')
     parser_update_recipe.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
     parser_update_recipe.set_defaults(func=update_recipe)
 
-- 
2.1.0


