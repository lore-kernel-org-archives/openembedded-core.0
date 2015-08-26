Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7B3176DDA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:49:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2015 08:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="548961133"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2015 08:49:48 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 07:43:23 +0000
Message-Id: <8664014de25c7f4d9903bea81eaeddce1e7219df.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 1/2] devtool: upgrade feature
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
X-List-Received-Date: Wed, 26 Aug 2015 15:49:49 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Upgrades a recipe to a particular version and downloads the source code
into srctree. User can avoid patching the source code. These are the
general steps of the upgrade function:
   * Extract current recipe source code into srctree and create branch
   * Extract upgrade recipe source code into srctree and rebase with
     previous branch. This step also creates a temporal recipe (created
     using recipetool), containing the correct checksums.
   * Creates the new recipe under the workspace

[YOCTO #7642]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/standard.py |   4 +-
 scripts/lib/devtool/upgrade.py  | 314 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/devtool/upgrade.py

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ea21877..cd5a3ed 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -205,6 +205,8 @@ def extract(args, config, basepath, workspace):
 
     srctree = os.path.abspath(args.srctree)
     initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
+    logger.info('Source tree extracted to %s' % srctree)
+
     if initial_rev:
         return 0
     else:
@@ -360,7 +362,6 @@ def _extract_source(srctree, keep_temp, devbranch, d):
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
         shutil.move(srcsubdir, srctree)
-        logger.info('Source tree extracted to %s' % srctree)
     finally:
         bb.logger.setLevel(origlevel)
 
@@ -439,6 +440,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = _extract_source(args.srctree, False, args.branch, rd)
         if not initial_rev:
             return 1
+        logger.info('Source tree extracted to %s' % srctree)
         # Get list of commits since this revision
         (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=args.srctree)
         commits = stdout.split()
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
new file mode 100644
index 0000000..9bef984
--- /dev/null
+++ b/scripts/lib/devtool/upgrade.py
@@ -0,0 +1,314 @@
+# Development tool - upgrade command plugin
+#
+# Copyright (C) 2014-2015 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# Created a new recipe under workspace/recipes/<recipename> and place the
+# source code into <srctree>.
+# The upgrade feature executes the following steps:
+#     * Extract current recipe source code into srctree and create branch
+#     * Extract upgrade recipe source code into srctree and rebase with 
+#       previous branch. This step also creates a temporal recipe (created
+#       using recipetool), containing the correct checksums.
+#     * Creates the new recipe under the workspace
+"""Devtool upgrade plugin"""
+
+import os
+import sys
+import re
+import shutil
+import tempfile
+import logging
+import argparse
+import scriptutils
+import errno
+from devtool import standard
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    """Plugin initialization"""
+    pass
+
+def _extract_upgrade_source(args, devbranch, config, basepath, d, recipepostfix='tmp'):
+    """Extract sources of a recipe with PV given on args.version
+
+    On the target source tree folder, a new branch (<devbranch>_<args.version>)
+    and tag (<devbranch>-base_<args.version>) will be created. In case patches
+    are applied, another tag is created (<devbranch>-patched_<args.version>).
+
+    Returns: 1) The (git) initial revision ID
+             2) The full path of a temporal recipe containing the correct checksums
+    """
+    import oe.recipeutils
+
+    initial_rev = None
+    srctree = os.path.abspath(args.srctree)
+
+    pn = d.getVar('PN', True)
+
+    standard._check_compatible_recipe(pn, d)
+
+    recipepath = os.path.join(config.workspace_path, 'recipes', pn)
+    bb.utils.mkdirhier(recipepath)
+    recipefile = os.path.join(recipepath, "%s-%s.bb" % (pn,recipepostfix))
+    tmpsrcbasetree = tempfile.mkdtemp(prefix='devtool')
+
+    # Change PV and get URL
+    crd = d.createCopy()
+    pv = d.getVar('PV', True)
+    crd.setVar('PV', args.version)
+    src_uri = crd.getVar('SRC_URI', True)
+    if src_uri:
+        url = src_uri.split()[0]
+
+    # Generate recipe and fetch new source
+    try:
+        cmdopts = "-o %s -x %s -V %s" % (recipefile, tmpsrcbasetree, args.version)
+        cmd = 'recipetool create "%s" %s' % (url, cmdopts)
+        stdout, _ = exec_build_env_command(config.init_path, basepath, cmd)
+    except bb.process.ExecutionError as e:
+        raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+
+    tmpsrctree = os.path.join(tmpsrcbasetree, pn + '-' + args.version)
+
+    try:
+        # branch from devtool-base (original source code without patches) before copying new source code
+        bb.process.run('git checkout -b %s devtool-base' % devbranch, cwd=srctree)
+        bb.process.run('git tag -f devtool-base_%s' % args.version, cwd=srctree)
+
+        # Copy tmpsrctree  into srctree
+        src_files = standard._ls_tree(tmpsrctree)
+        for path in src_files:
+            tgt_dir = os.path.join(srctree, os.path.dirname(path))
+            bb.utils.mkdirhier(tgt_dir)
+            tgt_path = os.path.join(srctree, path)
+            os.rename(os.path.join(tmpsrctree, path), tgt_path)
+
+        # Track modified and untracked files
+        (stdout,_) = bb.process.run('git ls-files --modified --others --exclude-standard', cwd=srctree)
+        add_files = stdout.splitlines()
+        for add_file in add_files:
+            bb.process.run('git add "%s"' % add_file, cwd=srctree)
+
+        if len(add_files):
+            bb.process.run('git commit -q -m "Initial commit from upstream at version %s"' % args.version, cwd=srctree)
+        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
+        initial_rev = stdout.rstrip()
+
+        if args.no_patch:
+            patches = oe.recipeutils.get_recipe_patches(crd)
+            if len(patches):
+                logger.warn('By user choice, the following (%s_%s) patches will NOT be applied into' %(pn,pv))
+                for patch in patches:
+                    logger.warn("\t%s" % os.path.basename(patch))
+        else:
+            try:
+                bb.process.run('git rebase devtool-patched', cwd=srctree)
+            except bb.process.ExecutionError as e:
+                # this is the only case where we do not propagate the error
+                # user will have the change to correct merges
+                logger.error('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+            bb.process.run('git tag -f devtool-patched_%s' % args.version, cwd=srctree)
+    except bb.process.ExecutionError as e:
+        raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+    finally:
+        if args.keep_temp:
+            logger.info('Preserving temporary directory %s' % tmpsrcbasetree)
+        else:
+            shutil.rmtree(tmpsrcbasetree)
+    return initial_rev, recipefile
+
+def _create_upgrade_recipe(args, config, recipetmp, config_data, d):
+    """Creates the new recipe under workspace
+
+    Returns the full path on the new created recipe
+    """
+    import oe.recipeutils
+
+    def _get_checksums(recipefile):
+        import re
+        checksums = {}
+        with open(recipefile) as rf:
+            for line in rf:
+                for cs in ['md5sum', 'sha256sum']:
+                    m = re.match("^SRC_URI\[%s\].*=.*\"(.*)\"" % cs, line)
+                    if m:
+                        checksums[cs] = m.group(1)
+        return checksums
+
+    def _replace_checksums(recipefile, checksums):
+        import re
+        with open(recipefile + ".tmp", "w+") as tmprf:
+            with open(recipefile) as rf:
+                for line in rf:
+                    m = None
+                    for cs in ['md5sum', 'sha256sum']:
+                        m = re.match("^SRC_URI\[%s\].*=.*\"(.*)\"" % cs, line)
+                        if m:
+                            if cs in checksums:
+                                oldcheck = m.group(1)
+                                newcheck = checksums[cs]
+                                line = line.replace(oldcheck, newcheck)
+                            break
+                    tmprf.write(line)
+
+        os.rename(recipefile + ".tmp", recipefile)
+
+    def _rename_patch_dirs(recipefolder, oldpv, newpv):
+        for root, dirs, files in os.walk(recipefolder):
+            for olddir in dirs:
+                if olddir.find(oldpv) != -1:
+                    newdir = olddir.replace(oldpv, newpv)
+                    bb.process.run('mv %s %s' % (olddir, newdir))
+
+    def _remove_patch_dirs(recipefolder):
+        for root, dirs, files in os.walk(recipefolder):
+            for d in dirs:
+                shutil.rmtree(os.path.join(root,d))
+
+    def _recipe_contains(recipefile, var):
+        import re
+        found = False
+        with open(recipefile) as rf:
+            for line in rf:
+                if re.match("^%s.*=.*" % var, line):
+                    found = True
+                    break
+        return found
+
+    if not os.path.exists(recipetmp):
+        raise DevtoolError("Temporal recipe %s does not exist" % recipetmp)
+
+    # Copy current recipe into workspace
+    pn = d.getVar('PN', True)
+    recipepath = os.path.join(config.workspace_path, 'recipes', pn)
+    oe.recipeutils.copy_recipe_files(d, recipepath)
+
+    # Rename recipe
+    pv = d.getVar('PV', True)
+    recipename = "%s_%s.bb" % (pn, pv)
+    newrecipename = "%s_%s.bb" % (pn, args.version)
+    if os.path.isfile(os.path.join(recipepath, recipename)):
+        bb.process.run('mv %s %s' % (recipename, newrecipename), cwd=recipepath)
+    else:
+        # Check if it is a git recipe
+        recipename = newrecipename = "%s_git.bb" % pn
+        if not os.path.isfile(os.path.join(recipepath, recipename)):
+            raise DevtoolError("Original recipe not found on workspace")
+
+    # Rename folders
+    _rename_patch_dirs(recipepath, pv, args.version)
+
+    # Update PV, just in case it is present
+    if _recipe_contains(os.path.join(recipepath, newrecipename), 'PV'):
+        oe.recipeutils.patch_recipe(d, os.path.join(recipepath, newrecipename), {'PV':args.version})
+
+    # Update checksums
+    checksums = _get_checksums(os.path.join(recipepath, recipetmp))
+    _replace_checksums(os.path.join(recipepath, newrecipename), checksums)
+
+    # Remove recipe created by the recipe-tool
+    bb.process.run('rm %s' % recipetmp)
+
+    return os.path.join(recipepath,newrecipename)
+
+def upgrade(args, config, basepath, workspace):
+    """Entry point for the devtool 'upgrade' subcommand"""
+    import bb
+    import oe.recipeutils
+
+    if args.recipename in workspace:
+        raise DevtoolError("recipe %s is already in your workspace" %
+                            args.recipename)
+    if not args.version:
+        raise DevtoolError("Provide a version through the parameter --version/-V")
+
+    reason = oe.recipeutils.validate_pn(args.recipename)
+    if reason:
+        raise DevtoolError(reason)
+
+    tinfoil = setup_tinfoil()
+
+    rd = standard._parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
+        return 1
+
+    pn = rd.getVar('PV', True)
+    if pn == args.version:
+        raise DevtoolError("Current and upgrade versions are the same %s" % pn)
+
+    srctree = os.path.abspath(args.srctree)
+
+    try:
+        # Extract source from current recipe
+        initial_rev_base = standard._extract_source(srctree, False, args.branch, rd)
+
+        # We need to shutdown tinfoil temporally because recipetool will be used
+        tinfoil.shutdown()
+
+        # Extract new source code
+        branch_upgrade = "%s_%s" % (args.branch, args.version)
+        initial_rev_upgrade, recipe_file_tmp = _extract_upgrade_source(args, branch_upgrade, config, basepath, rd)
+        # Start again tinfoil
+        tinfoil = setup_tinfoil()
+
+        recipe_file = _create_upgrade_recipe(args, config, recipe_file_tmp, tinfoil.config_data, rd)
+
+    except DevtoolError as e:
+        logger.error(e)
+        # remove workspace recipe and srctree
+        pn = rd.getVar('PN', True)
+        recipespath = os.path.join(config.workspace_path, 'recipes')
+        recipepath = os.path.join(recipespath, pn)
+        if os.path.exists(recipepath):
+            shutil.rmtree(recipepath)
+            if not len(os.listdir(recipespath)):
+                os.rmdir(recipespath)
+        # remove srctree
+        if os.path.exists(srctree):
+            shutil.rmtree(srctree)
+        raise DevtoolError(e)
+
+    appendpath = os.path.join(config.workspace_path, 'appends')
+    if not os.path.exists(appendpath):
+        os.makedirs(appendpath)
+
+    recipe_file_base = os.path.basename(os.path.splitext(recipe_file)[0])
+    appendfile = os.path.join(appendpath, '%s.bbappend' % recipe_file_base)
+    with open(appendfile, 'w') as f:
+        f.write('inherit externalsrc\n')
+        f.write('EXTERNALSRC = "%s"\n' % srctree)
+        f.write('EXTERNALSRC_BUILD = "%s"\n' % srctree)
+        f.write('\n# initial_rev: %s\n' % initial_rev_upgrade)
+
+    standard._add_md5(config, args.recipename, appendfile)
+    logger.info('Source tree extracted to %s' % srctree)
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_upgrade = subparsers.add_parser('upgrade', help='Upgrade an existing recipe',
+                                       description='Upgrades an existing recipe',
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_upgrade.add_argument('recipename', help='Name for recipe to extract the source for')
+    parser_upgrade.add_argument('srctree', help='Path to where to extract the source tree')
+    parser_upgrade.add_argument('--version', '-V', help='Version to upgrade (PV)')
+    parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_upgrade.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_upgrade.add_argument('--no-patch', action="store_true", help='Do not patch the new source code')
+    parser_upgrade.set_defaults(func=upgrade)
-- 
1.8.4.5


