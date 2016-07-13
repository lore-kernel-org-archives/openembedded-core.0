Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 92CDD731B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:05:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jul 2016 14:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733801596"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 14:05:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:04:25 +1200
Message-Id: <af18eaba2b4207ebb9862c0fec777c4ab5ea1c9c.1468443702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] devtool: add finish subcommand
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
X-List-Received-Date: Wed, 13 Jul 2016 21:05:12 -0000

Add a subcommand which will "finish" the work on a recipe. This is
effectively the same as update-recipe followed by reset, except that the
destination layer is required and it will do the right thing depending
on the situation - if the recipe file itself is in the workspace (e.g.
as a result of devtool add), the recipe file and any associated files
will be moved to the destination layer; or if the destination layer is
the one containing the original recipe, the recipe will be overwritten;
otherwise a bbappend will be created to apply the changes. In all cases
the layer path can be loosely specified - it could be a layer name, or
a partial path into a recipe. In the case of upgrades, devtool finish
will also take care of deleting the old recipe.

This avoids the user having to figure out the correct actions when
they're done - they just do "devtool finish recipename layername" and
it saves their work and then removes the recipe from the workspace.

Addresses [YOCTO #8594].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py        |  57 +++++++++++++-
 meta/lib/oeqa/selftest/devtool.py | 157 +++++++++++++++++++++++++++++++++++++-
 scripts/lib/devtool/standard.py   | 111 ++++++++++++++++++++++++++-
 3 files changed, 322 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index b8d481a..0e7abf8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -2,7 +2,7 @@
 #
 # Some code borrowed from the OE layer index
 #
-# Copyright (C) 2013-2015 Intel Corporation
+# Copyright (C) 2013-2016 Intel Corporation
 #
 
 import sys
@@ -15,6 +15,7 @@ from . import utils
 import shutil
 import re
 import fnmatch
+import glob
 from collections import OrderedDict, defaultdict
 
 
@@ -450,6 +451,60 @@ def validate_pn(pn):
     return ''
 
 
+def get_bbfile_path(d, destdir, extrapathhint=None):
+    """
+    Determine the correct path for a recipe within a layer
+    Parameters:
+        d: Recipe-specific datastore
+        destdir: destination directory. Can be the path to the base of the layer or a
+            partial path somewhere within the layer.
+        extrapathhint: a path relative to the base of the layer to try
+    """
+    import bb.cookerdata
+
+    destdir = os.path.abspath(destdir)
+    destlayerdir = find_layerdir(destdir)
+
+    # Parse the specified layer's layer.conf file directly, in case the layer isn't in bblayers.conf
+    confdata = d.createCopy()
+    confdata.setVar('BBFILES', '')
+    confdata.setVar('LAYERDIR', destlayerdir)
+    destlayerconf = os.path.join(destlayerdir, "conf", "layer.conf")
+    confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
+    pn = d.getVar('PN', True)
+
+    bbfilespecs = (confdata.getVar('BBFILES', True) or '').split()
+    if destdir == destlayerdir:
+        for bbfilespec in bbfilespecs:
+            if not bbfilespec.endswith('.bbappend'):
+                for match in glob.glob(bbfilespec):
+                    splitext = os.path.splitext(os.path.basename(match))
+                    if splitext[1] == '.bb':
+                        mpn = splitext[0].split('_')[0]
+                        if mpn == pn:
+                            return os.path.dirname(match)
+
+    # Try to make up a path that matches BBFILES
+    # this is a little crude, but better than nothing
+    bpn = d.getVar('BPN', True)
+    recipefn = os.path.basename(d.getVar('FILE', True))
+    pathoptions = [destdir]
+    if extrapathhint:
+        pathoptions.append(os.path.join(destdir, extrapathhint))
+    if destdir == destlayerdir:
+        pathoptions.append(os.path.join(destdir, 'recipes-%s' % bpn, bpn))
+        pathoptions.append(os.path.join(destdir, 'recipes', bpn))
+        pathoptions.append(os.path.join(destdir, bpn))
+    elif not destdir.endswith(('/' + pn, '/' + bpn)):
+        pathoptions.append(os.path.join(destdir, bpn))
+    closepath = ''
+    for pathoption in pathoptions:
+        bbfilepath = os.path.join(pathoption, 'test.bb')
+        for bbfilespec in bbfilespecs:
+            if fnmatch.fnmatchcase(bbfilepath, bbfilespec):
+                return pathoption
+    return None
+
 def get_bbappend_path(d, destlayerdir, wildcardver=False):
     """Determine how a bbappend for a recipe should be named and located within another layer"""
 
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 0b305c8..974333f 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -5,10 +5,11 @@ import re
 import shutil
 import tempfile
 import glob
+import fnmatch
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, runqemu
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, runqemu, get_test_layer
 from oeqa.utils.decorators import testcase
 
 class DevtoolBase(oeSelfTest):
@@ -1189,3 +1190,157 @@ class DevtoolTests(DevtoolBase):
         s = "Microsoft Made No Profit From Anyone's Zunes Yo"
         result = runCmd("devtool --quiet selftest-reverse \"%s\"" % s)
         self.assertEqual(result.output, s[::-1])
+
+    def _setup_test_devtool_finish_upgrade(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # Use a "real" recipe from meta-selftest
+        recipe = 'devtool-upgrade-test1'
+        oldversion = '1.5.3'
+        newversion = '1.6.0'
+        oldrecipefile = get_bb_var('FILE', recipe)
+        recipedir = os.path.dirname(oldrecipefile)
+        result = runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        # Check that recipe is not already under devtool control
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        # Do the upgrade
+        result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, newversion))
+        # Check devtool status and make sure recipe is present
+        result = runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Make a change to the source
+        result = runCmd('sed -i \'/^#include "pv.h"/a \\/* Here is a new comment *\\/\' src/pv/number.c', cwd=tempdir)
+        result = runCmd('git status --porcelain', cwd=tempdir)
+        self.assertIn('M src/pv/number.c', result.output)
+        result = runCmd('git commit src/pv/number.c -m "Add a comment to the code"', cwd=tempdir)
+        # Check if patch is there
+        recipedir = os.path.dirname(oldrecipefile)
+        olddir = os.path.join(recipedir, recipe + '-' + oldversion)
+        patchfn = '0001-Add-a-note-line-to-the-quick-reference.patch'
+        self.assertTrue(os.path.exists(os.path.join(olddir, patchfn)), 'Original patch file does not exist')
+        return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn
+
+    def test_devtool_finish_upgrade_origlayer(self):
+        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
+        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
+        self.assertIn('/meta-selftest/', recipedir)
+        # Try finish to the original layer
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        result = runCmd('devtool finish %s meta-selftest' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
+        self.assertFalse(os.path.exists(oldrecipefile), 'Old recipe file should have been deleted but wasn\'t')
+        self.assertFalse(os.path.exists(os.path.join(olddir, patchfn)), 'Old patch file should have been deleted but wasn\'t')
+        newrecipefile = os.path.join(recipedir, '%s_%s.bb' % (recipe, newversion))
+        newdir = os.path.join(recipedir, recipe + '-' + newversion)
+        self.assertTrue(os.path.exists(newrecipefile), 'New recipe file should have been copied into existing layer but wasn\'t')
+        self.assertTrue(os.path.exists(os.path.join(newdir, patchfn)), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertTrue(os.path.exists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch')), 'New patch file should have been created but wasn\'t')
+
+    def test_devtool_finish_upgrade_otherlayer(self):
+        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
+        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
+        self.assertIn('/meta-selftest/', recipedir)
+        # Try finish to a different layer - should create a bbappend
+        # This cleanup isn't strictly necessary but do it anyway just in case it goes wrong and writes to here
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        oe_core_dir = os.path.join(get_bb_var('COREBASE'), 'meta')
+        newrecipedir = os.path.join(oe_core_dir, 'recipes-test', 'devtool')
+        newrecipefile = os.path.join(newrecipedir, '%s_%s.bb' % (recipe, newversion))
+        self.track_for_cleanup(newrecipedir)
+        result = runCmd('devtool finish %s oe-core' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
+        self.assertTrue(os.path.exists(oldrecipefile), 'Old recipe file should not have been deleted')
+        self.assertTrue(os.path.exists(os.path.join(olddir, patchfn)), 'Old patch file should not have been deleted')
+        newdir = os.path.join(newrecipedir, recipe + '-' + newversion)
+        self.assertTrue(os.path.exists(newrecipefile), 'New recipe file should have been copied into existing layer but wasn\'t')
+        self.assertTrue(os.path.exists(os.path.join(newdir, patchfn)), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertTrue(os.path.exists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch')), 'New patch file should have been created but wasn\'t')
+
+    def _setup_test_devtool_finish_modify(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Try modifying a recipe
+        self.track_for_cleanup(self.workspacedir)
+        recipe = 'mdadm'
+        oldrecipefile = get_bb_var('FILE', recipe)
+        recipedir = os.path.dirname(oldrecipefile)
+        result = runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s %s' % (recipe, tempdir))
+        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Make a change to the source
+        result = runCmd('sed -i \'/^#include "mdadm.h"/a \\/* Here is a new comment *\\/\' maps.c', cwd=tempdir)
+        result = runCmd('git status --porcelain', cwd=tempdir)
+        self.assertIn('M maps.c', result.output)
+        result = runCmd('git commit maps.c -m "Add a comment to the code"', cwd=tempdir)
+        for entry in os.listdir(recipedir):
+            filesdir = os.path.join(recipedir, entry)
+            if os.path.isdir(filesdir):
+                break
+        else:
+            self.fail('Unable to find recipe files directory for %s' % recipe)
+        return recipe, oldrecipefile, recipedir, filesdir
+
+    def test_devtool_finish_modify_origlayer(self):
+        recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
+        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
+        self.assertIn('/meta/', recipedir)
+        # Try finish to the original layer
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        result = runCmd('devtool finish %s meta' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
+        expected_status = [(' M', '.*/%s$' % os.path.basename(oldrecipefile)),
+                           ('??', '.*/.*-Add-a-comment-to-the-code.patch$')]
+        self._check_repo_status(recipedir, expected_status)
+
+    def test_devtool_finish_modify_otherlayer(self):
+        recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
+        # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
+        self.assertIn('/meta/', recipedir)
+        relpth = os.path.relpath(recipedir, os.path.join(get_bb_var('COREBASE'), 'meta'))
+        appenddir = os.path.join(get_test_layer(), relpth)
+        self.track_for_cleanup(appenddir)
+        # Try finish to the original layer
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        result = runCmd('devtool finish %s meta-selftest' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
+        result = runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains the following unexpected changes after finish:\n%s' % (recipe, result.output.strip()))
+        appendfile = os.path.join(appenddir, os.path.splitext(os.path.basename(oldrecipefile))[0] + '.bbappend')
+        self.assertTrue(os.path.exists(appendfile), 'bbappend %s should have been created but wasn\'t' % appendfile)
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
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5a5995f..9c09533 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1,6 +1,6 @@
 # Development tool - standard commands plugin
 #
-# Copyright (C) 2014-2015 Intel Corporation
+# Copyright (C) 2014-2016 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -1394,6 +1394,106 @@ def reset(args, config, basepath, workspace):
     return 0
 
 
+def _get_layer(layername, d):
+    """Determine the base layer path for the specified layer name/path"""
+    layerdirs = d.getVar('BBLAYERS', True).split()
+    layers = {os.path.basename(p): p for p in layerdirs}
+    # Provide some shortcuts
+    if layername.lower() in ['oe-core', 'openembedded-core']:
+        layerdir = layers.get('meta', None)
+    else:
+        layerdir = layers.get(layername, None)
+    if layerdir:
+        layerdir = os.path.abspath(layerdir)
+    return layerdir or layername
+
+def finish(args, config, basepath, workspace):
+    """Entry point for the devtool 'finish' subcommand"""
+    import bb
+    import oe.recipeutils
+
+    check_workspace_recipe(workspace, args.recipename)
+
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
+            return 1
+
+        destlayerdir = _get_layer(args.destination, tinfoil.config_data)
+        origlayerdir = oe.recipeutils.find_layerdir(rd.getVar('FILE', True))
+
+        if not os.path.isdir(destlayerdir):
+            raise DevtoolError('Unable to find layer or directory matching "%s"' % args.destination)
+
+        if os.path.abspath(destlayerdir) == config.workspace_path:
+            raise DevtoolError('"%s" specifies the workspace layer - that is not a valid destination' % args.destination)
+
+        # If it's an upgrade, grab the original path
+        origpath = None
+        origfilelist = None
+        append = workspace[args.recipename]['bbappend']
+        with open(append, 'r') as f:
+            for line in f:
+                if line.startswith('# original_path:'):
+                    origpath = line.split(':')[1].strip()
+                elif line.startswith('# original_files:'):
+                    origfilelist = line.split(':')[1].split()
+
+        if origlayerdir == config.workspace_path:
+            # Recipe file itself is in workspace, update it there first
+            appendlayerdir = None
+            origrelpath = None
+            if origpath:
+                origlayerpath = oe.recipeutils.find_layerdir(origpath)
+                if origlayerpath:
+                    origrelpath = os.path.relpath(origpath, origlayerpath)
+            destpath = oe.recipeutils.get_bbfile_path(rd, destlayerdir, origrelpath)
+            if not destpath:
+                raise DevtoolError("Unable to determine destination layer path - check that %s specifies an actual layer and %s/conf/layer.conf specifies BBFILES. You may also need to specify a more complete path." % (args.destination, destlayerdir))
+        elif destlayerdir == origlayerdir:
+            # Same layer, update the original recipe
+            appendlayerdir = None
+            destpath = None
+        else:
+            # Create/update a bbappend in the specified layer
+            appendlayerdir = destlayerdir
+            destpath = None
+
+        # Remove any old files in the case of an upgrade
+        if origpath and origfilelist and oe.recipeutils.find_layerdir(origpath) == oe.recipeutils.find_layerdir(destlayerdir):
+            for fn in origfilelist:
+                fnp = os.path.join(origpath, fn)
+                try:
+                    os.remove(fnp)
+                except FileNotFoundError:
+                    pass
+
+        # Actually update the recipe / bbappend
+        _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, initial_rev=args.initial_rev)
+
+        if origlayerdir == config.workspace_path and destpath:
+            # Recipe file itself is in the workspace - need to move it and any
+            # associated files to the specified layer
+            logger.info('Moving recipe file to %s' % destpath)
+            recipedir = os.path.dirname(rd.getVar('FILE', True))
+            for root, _, files in os.walk(recipedir):
+                for fn in files:
+                    srcpath = os.path.join(root, fn)
+                    relpth = os.path.relpath(os.path.dirname(srcpath), recipedir)
+                    destdir = os.path.abspath(os.path.join(destpath, relpth))
+                    bb.utils.mkdirhier(destdir)
+                    shutil.move(srcpath, os.path.join(destdir, fn))
+
+    finally:
+        tinfoil.shutdown()
+
+    # Everything else has succeeded, we can now reset
+    _reset([args.recipename], no_clean=False, config=config, basepath=basepath, workspace=workspace)
+
+    return 0
+
+
 def get_default_srctree(config, recipename=''):
     """Get the default srctree path"""
     srctreeparent = config.get('General', 'default_source_parent_dir', config.workspace_path)
@@ -1481,3 +1581,12 @@ def register_commands(subparsers, context):
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_reset.set_defaults(func=reset)
+
+    parser_finish = subparsers.add_parser('finish', help='Finish working on a recipe in your workspace',
+                                         description='Pushes any committed changes to the specified recipe to the specified layer and removes it from your workspace. Roughly equivalent to an update-recipe followed by reset, except the update-recipe step will do the "right thing" depending on the recipe and the destination layer specified.',
+                                         group='working', order=-100)
+    parser_finish.add_argument('recipename', help='Recipe to finish')
+    parser_finish.add_argument('destination', help='Layer/path to put recipe into. Can be the name of a layer configured in your bblayers.conf, the path to the base of a layer, or a partial path inside a layer. %(prog)s will attempt to complete the path based on the layer\'s structure.')
+    parser_finish.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
+    parser_finish.add_argument('--initial-rev', help='Override starting revision for patches')
+    parser_finish.set_defaults(func=finish)
-- 
2.5.5


