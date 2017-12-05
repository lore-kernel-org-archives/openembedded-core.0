Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F18F27875A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:58 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356187"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:17 +1300
Message-Id: <854119e59af55a565f24d5d069dc29eb48d00dab.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/12] devtool: support extracting multiple source trees
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:59 -0000

If you have multiple source trees being extracted to the work directory
within a recipe (e.g. you have two tarballs referred to in SRC_URI) and
one isn't being extracted into the other, then devtool failed to extract
all the sources because it only took the source tree that S pointed
into. To fix this, we need to take a look at the work directory after
do_unpack and see if there are any additional subdirectories; if so we
need to put the main source tree in a subdirectory and put the
additional subdirectories next to it. We also ensure that symlinks from
the work directory get created at the end of do_unpack to point to
these (so that references in the recipe continue to work).

In addition to multiple source trees at the work directory level, this
patch also handles multiple nested git trees (where you have multiple
git URLs in SRC_URI with one or more inside another). These caused a
different problem, where changes in sub-repos are not fully captured at
the top level - we need to handle each repo separately.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/devtool-source.bbclass     |  57 ++++-
 meta/lib/oe/recipeutils.py              |   4 +-
 meta/lib/oe/utils.py                    |  24 +++
 meta/lib/oeqa/selftest/cases/devtool.py |   2 +-
 scripts/devtool                         |  61 ++++--
 scripts/lib/devtool/__init__.py         |  14 ++
 scripts/lib/devtool/standard.py         | 370 +++++++++++++++++++++++---------
 7 files changed, 396 insertions(+), 136 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 540a602..30c9bdb 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -69,7 +69,7 @@ python devtool_post_unpack() {
     import shutil
     sys.path.insert(0, os.path.join(d.getVar('COREBASE'), 'scripts', 'lib'))
     import scriptutils
-    from devtool import setup_git_repo
+    from devtool import setup_git_repo, find_git_repos
 
     tempdir = d.getVar('DEVTOOL_TEMPDIR')
     workdir = d.getVar('WORKDIR')
@@ -95,8 +95,26 @@ python devtool_post_unpack() {
                         oe.recipeutils.get_recipe_patches(d)]
     local_files = oe.recipeutils.get_recipe_local_files(d)
 
-    # Ignore local files with subdir={BP}
+    excludeitems = recipe_patches + list(local_files.keys())
+    pthvars = ['RECIPE_SYSROOT', 'RECIPE_SYSROOT_NATIVE', 'S']
+    for pthvar in pthvars:
+        relp = os.path.relpath(d.getVar(pthvar), d.getVar('WORKDIR'))
+        if not relp.startswith('..'):
+            excludeitems.append(relp.split(os.sep)[0])
+    extradirs = []
     srcabspath = os.path.abspath(srcsubdir)
+    if srcabspath != os.path.abspath(workdir):
+        for pth in os.listdir(workdir):
+            if pth in excludeitems:
+                continue
+            wpth = os.path.join(workdir, pth)
+            if os.path.isdir(wpth) and os.listdir(wpth):
+                extradirs.append(wpth)
+
+    repos = find_git_repos(srcabspath)
+    extradirs.extend(repos)
+
+    # Ignore local files with subdir={BP}
     local_files = [fname for fname in local_files if
                     os.path.exists(os.path.join(workdir, fname)) and
                     (srcabspath == workdir or not
@@ -145,11 +163,20 @@ python devtool_post_unpack() {
 
     (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
     initial_rev = stdout.rstrip()
+
+    initial_revs = {}
+    for extradir in extradirs:
+        setup_git_repo(extradir, d.getVar('PV'), devbranch, d=d)
+        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=extradir)
+        initial_revs[extradir] = stdout.rstrip()
+
     with open(os.path.join(tempdir, 'initial_rev'), 'w') as f:
         f.write(initial_rev)
 
     with open(os.path.join(tempdir, 'srcsubdir'), 'w') as f:
-        f.write(srcsubdir)
+        f.write('%s\n' % srcsubdir)
+        for extradir in extradirs:
+            f.write('%s=%s\n' % (extradir, initial_revs[extradir]))
 }
 
 python devtool_pre_patch() {
@@ -160,18 +187,25 @@ python devtool_pre_patch() {
 python devtool_post_patch() {
     import shutil
     tempdir = d.getVar('DEVTOOL_TEMPDIR')
+
+    srcdirs = []
     with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
-        srcsubdir = f.read()
+        for line in f:
+            line = line.rstrip()
+            if line:
+                srcdirs.append(line.split('=')[0])
+    srcsubdir = srcdirs[0]
+
     with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
         initial_rev = f.read()
 
-    def rm_patches():
-        patches_dir = os.path.join(srcsubdir, 'patches')
+    def rm_patches(pth):
+        patches_dir = os.path.join(pth, 'patches')
         if os.path.exists(patches_dir):
             shutil.rmtree(patches_dir)
         # Restore any "patches" directory that was actually part of the source tree
         try:
-            bb.process.run('git checkout -- patches', cwd=srcsubdir)
+            bb.process.run('git checkout -- patches', cwd=pth)
         except bb.process.ExecutionError:
             pass
 
@@ -194,7 +228,7 @@ python devtool_post_patch() {
             localdata = bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', ':'.join(no_overrides))
             bb.build.exec_func('do_patch', localdata)
-            rm_patches()
+            rm_patches(srcsubdir)
             # Now we need to reconcile the dev branch with the no-overrides one
             # (otherwise we'd likely be left with identical commits that have different hashes)
             bb.process.run('git checkout %s' % devbranch, cwd=srcsubdir)
@@ -212,12 +246,15 @@ python devtool_post_patch() {
                 # Run do_patch function with the override applied
                 localdata.appendVar('OVERRIDES', ':%s' % override)
                 bb.build.exec_func('do_patch', localdata)
-                rm_patches()
+                rm_patches(srcsubdir)
                 # Now we need to reconcile the new branch with the no-overrides one
                 # (otherwise we'd likely be left with identical commits that have different hashes)
                 bb.process.run('git rebase devtool-no-overrides', cwd=srcsubdir)
         bb.process.run('git checkout %s' % devbranch, cwd=srcsubdir)
-    bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
+    for srcdir in srcdirs:
+        bb.process.run('git tag -f devtool-patched', cwd=srcdir)
+        if srcdir != srcsubdir:
+            rm_patches(srcdir)
 }
 
 python devtool_post_configure() {
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 4928727..f4a40c2 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -445,10 +445,10 @@ def get_recipe_patches(d):
     """Get a list of the patches included in SRC_URI within a recipe."""
     import oe.patch
     patches = oe.patch.src_patches(d, expand=False)
-    patchfiles = []
+    patchfiles = OrderedDict()
     for patch in patches:
         _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
-        patchfiles.append(local)
+        patchfiles[local] = parm
     return patchfiles
 
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 1897c5f..9670dd7 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -368,3 +368,27 @@ class ImageQAFailed(bb.build.FuncFailed):
             msg = msg + ' (%s)' % self.description
 
         return msg
+
+def is_path_under(path1, possible_parent):
+    """
+    Return True if a path is underneath another, False otherwise.
+    Multiple paths to test can be specified (as a list or tuple) in
+    which case all specified test paths must be under the parent to
+    return True.
+    """
+    def abs_path_trailing(pth):
+        pth_abs = os.path.abspath(pth)
+        if not pth_abs.endswith(os.sep):
+            pth_abs += os.sep
+        return pth_abs
+
+    possible_parent_abs = abs_path_trailing(possible_parent)
+    if isinstance(path1, str):
+        testpaths = [path1]
+    else:
+        testpaths = path1
+    for path in testpaths:
+        path_abs = abs_path_trailing(path)
+        if not path_abs.startswith(possible_parent_abs):
+            return False
+    return True
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 43280cd..b3063de 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -7,7 +7,7 @@ import fnmatch
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, CommandError
 from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
 from oeqa.core.decorator.oeid import OETestID
 
diff --git a/scripts/devtool b/scripts/devtool
index a651d8f..bccbb92 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -25,6 +25,8 @@ import re
 import configparser
 import subprocess
 import logging
+import json
+from collections import OrderedDict
 
 basepath = ''
 workspace = {}
@@ -109,31 +111,58 @@ def read_workspace():
     if not context.fixed_setup:
         _enable_workspace_layer(config.workspace_path, config, basepath)
 
+    def process_inline_json(strvalue, in_value):
+        if strvalue.count('{') == strvalue.count('}') and strvalue.count('[') == strvalue.count(']'):
+            pnvalues[in_value] = json.loads(strvalue, object_pairs_hook=OrderedDict)
+            return True
+        return False
+
     logger.debug('Reading workspace in %s' % config.workspace_path)
     externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-([^ =]+))? *= *"([^"]*)"$')
     for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
         with open(fn, 'r') as f:
             pnvalues = {}
+            in_value = None
+            strvalue = ''
             for line in f:
-                res = externalsrc_re.match(line.rstrip())
-                if res:
-                    pn = res.group(2) or os.path.splitext(os.path.basename(fn))[0].split('_')[0]
-                    # Find the recipe file within the workspace, if any
-                    bbfile = os.path.basename(fn).replace('.bbappend', '.bb').replace('%', '*')
-                    recipefile = glob.glob(os.path.join(config.workspace_path,
-                                                        'recipes',
-                                                        pn,
-                                                        bbfile))
-                    if recipefile:
-                        recipefile = recipefile[0]
-                    pnvalues['srctree'] = res.group(3)
-                    pnvalues['bbappend'] = fn
-                    pnvalues['recipefile'] = recipefile
-                elif line.startswith('# srctreebase: '):
-                    pnvalues['srctreebase'] = line.split(':', 1)[1].strip()
+                if in_value:
+                    if not line.startswith('#'):
+                        logger.error('Syntax error in %s - invalid in-line json' % fn)
+                        sys.exit(1)
+                    strvalue += line[1:]
+                    if process_inline_json(strvalue, in_value):
+                        in_value = None
+                else:
+                    res = externalsrc_re.match(line.rstrip())
+                    if res:
+                        pn = res.group(2) or os.path.splitext(os.path.basename(fn))[0].split('_')[0]
+                        # Find the recipe file within the workspace, if any
+                        bbfile = os.path.basename(fn).replace('.bbappend', '.bb').replace('%', '*')
+                        recipefile = glob.glob(os.path.join(config.workspace_path,
+                                                            'recipes',
+                                                            pn,
+                                                            bbfile))
+                        if recipefile:
+                            recipefile = recipefile[0]
+                        pnvalues['srctree'] = res.group(3)
+                        pnvalues['bbappend'] = fn
+                        pnvalues['recipefile'] = recipefile
+                    elif line.startswith('# srctreebase: '):
+                        pnvalues['srctreebase'] = line.split(':', 1)[1].strip()
+                    elif line.startswith('# srctreetop: '):
+                        pnvalues['srctreetop'] = line.split(':', 1)[1].strip()
+                    elif line.startswith('# extradirs: '):
+                        strvalue = line.split(':', 1)[1].strip()
+                        in_value = 'extradirs'
+                        if process_inline_json(strvalue, in_value):
+                            in_value = None
             if pnvalues:
                 if not pnvalues.get('srctreebase', None):
                     pnvalues['srctreebase'] = pnvalues['srctree']
+                if not 'srctreetop' in pnvalues:
+                    pnvalues['srctreetop'] = pnvalues['srctreebase']
+                if not 'extradirs' in pnvalues:
+                    pnvalues['extradirs'] = []
                 logger.debug('Found recipe %s' % pnvalues)
                 workspace[pn] = pnvalues
 
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 07d774d..5cdf07a 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -223,6 +223,20 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
     bb.process.run('git tag -f %s' % basetag, cwd=repodir)
 
+def find_git_repos(pth, toplevel=False):
+    """
+    Find git repositories under a path
+    """
+    repos = []
+    if toplevel and os.path.isdir(os.path.join(pth, '.git')):
+        repos.append(pth)
+    for root, dirs, _ in os.walk(pth):
+        for dfn in dirs:
+            dfp = os.path.join(root, dfn)
+            if os.path.isdir(os.path.join(dfp, '.git')) and dfp not in repos:
+                repos.append(dfp)
+    return repos
+
 def recipe_to_append(recipefile, config, wildcard=False):
     """
     Convert a recipe file to a bbappend file path within the workspace.
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ae48406..cadd038 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -29,8 +29,9 @@ import scriptutils
 import errno
 import glob
 import filecmp
+import json
 from collections import OrderedDict, namedtuple
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, check_prerelease_version, check_git_repo_dirty, check_git_repo_op, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, check_prerelease_version, check_git_repo_dirty, check_git_repo_op, find_git_repos, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -464,7 +465,7 @@ def sync(args, config, basepath, workspace):
     return 0
 
 
-ExtractSourceResult = namedtuple('ExtractSourceResult', ['initial_rev', 'srcsubdir'])
+ExtractSourceResult = namedtuple('ExtractSourceResult', ['initial_rev', 'srcsubdir', 'extradirs'])
 
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
     """Extract sources of a recipe"""
@@ -576,15 +577,27 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         if not res:
             raise DevtoolError('Extracting source for %s failed' % pn)
 
+        tempworkdir = os.path.join(tempdir, 'workdir')
+        extra_revs = OrderedDict()
+        extradirs = []
         try:
             with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
                 initial_rev = f.read()
 
             with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
-                srcsubdir = f.read()
+                srcsubdir = f.readline().rstrip()
+                for line in f:
+                    line = line.rstrip()
+                    if '=' in line:
+                        linesplit = line.rstrip().split('=', 1)
+                        extradir = linesplit[0]
+                        extradirs.append(extradir)
+                        extra_revs[os.path.relpath(extradir, tempworkdir)] = linesplit[1]
+
         except FileNotFoundError as e:
             raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
-        srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
+
+        srcsubdir_rel = os.path.relpath(srcsubdir, tempworkdir)
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
@@ -613,6 +626,19 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                 logger.info('Adding local source files to srctree...')
                 shutil.move(tempdir_localdir, srcsubdir)
 
+            if extra_revs:
+                logger.warn('This recipe fetches more than one source tree. Each source tree will be tracked in a separate git repository.')
+                if not oe.utils.is_path_under(extradirs, srcsubdir):
+                    # There's more than one source directory at the top level, we're going to need to create the parent
+                    os.mkdir(srctree)
+                    for extradir in extradirs:
+                        shutil.move(extradir, srctree)
+                    # Write a file to record which one is the main src in case we need to re-modify the same tree later
+                    with open(os.path.join(srctree, '.devtool'), 'w') as f:
+                        data = OrderedDict()
+                        data['srcsubdir'] = os.path.basename(srcsubdir)
+                        data['extradirs'] = extra_revs
+                        json.dump(data, f, indent='    ')
             shutil.move(srcsubdir, srctree)
 
             if os.path.abspath(d.getVar('S')) == os.path.abspath(d.getVar('WORKDIR')):
@@ -640,7 +666,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
-            shutil.copy2(os.path.join(tempdir, '.config'), srctree)
+            shutil.copy2(os.path.join(tempdir, '.config'), os.path.join(srctree, srcsubdir_rel))
 
     finally:
         if appendbackup:
@@ -651,7 +677,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             logger.info('Preserving temporary directory %s' % tempdir)
         else:
             shutil.rmtree(tempdir)
-    return ExtractSourceResult(initial_rev, srcsubdir_rel)
+    return ExtractSourceResult(initial_rev, srcsubdir_rel, extra_revs)
 
 def _add_md5(config, recipename, filename):
     """Record checksum of a file (or recursively for a directory) to the md5-file of the workspace"""
@@ -704,6 +730,27 @@ def _check_preserve(config, recipename):
                     tf.write(line)
     os.rename(newfile, origfile)
 
+def _get_initial_rev(srctree):
+    """
+    Given a source tree, get the initial revision and determine if it was prepared by devtool
+    """
+    initial_rev = None
+    try:
+        (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=srctree)
+    except bb.process.ExecutionError:
+        stdout = ''
+    if stdout:
+        was_devtool = True
+    for line in stdout.splitlines():
+        if line.startswith('*'):
+            (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
+            initial_rev = stdout.rstrip()
+    if not initial_rev:
+        # Otherwise, just grab the head revision
+        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
+        initial_rev = stdout.rstrip()
+    return initial_rev, was_devtool
+
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
@@ -751,29 +798,40 @@ def modify(args, config, basepath, workspace):
         commits = []
         check_commits = False
         torev = 'HEAD'
+        extradirs = OrderedDict()
+        srctreetop = None
+        extra_revs = {}
         if not args.no_extract:
             ret = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
             initial_rev = ret.initial_rev
+            extradirs = ret.extradirs
+            if extradirs and not oe.utils.is_path_under(extradirs.keys(), ret.srcsubdir):
+                # Multiple source trees, we need to be inside the main one
+                srctreetop = srctree
+                srctree = os.path.join(srctree, ret.srcsubdir)
             logger.info('Source tree extracted to %s' % srctree)
             check_commits = True
         else:
+            devtoolfile = os.path.join(srctree, '.devtool')
+            if os.path.exists(devtoolfile):
+                with open(devtoolfile, 'r') as f:
+                    cfg = json.load(f, object_pairs_hook=OrderedDict)
+                srcsubdir = cfg.get('srcsubdir', '')
+                if srcsubdir:
+                    srctreetop = srctree
+                    srctree = os.path.abspath(os.path.join(srctree, srcsubdir))
+                extradirs.update(cfg.get('extradirs', {}))
+            else:
+                # Find any extra source trees
+                extradirpaths = find_git_repos(srctree)
+                for extradirpath in extradirpaths:
+                    extradirs[os.path.relpath(extradirpath, srctree)], _ = _get_initial_rev(extradirpath)
+
             if os.path.exists(os.path.join(srctree, '.git')):
                 # Check if it's a tree previously extracted by us
-                try:
-                    (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=srctree)
-                except bb.process.ExecutionError:
-                    stdout = ''
-                if stdout:
-                    check_commits = True
+                initial_rev, check_commits = _get_initial_rev(srctree)
+                if check_commits:
                     torev = 'devtool-patched'
-                for line in stdout.splitlines():
-                    if line.startswith('*'):
-                        (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
-                        initial_rev = stdout.rstrip()
-                if not initial_rev:
-                    # Otherwise, just grab the head revision
-                    (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
-                    initial_rev = stdout.rstrip()
 
         if initial_rev:
             # Get list of commits since this revision
@@ -807,6 +865,23 @@ def modify(args, config, basepath, workspace):
         # Need to grab this here in case the source is within a subdirectory
         srctreebase = srctree
 
+        if extradirs:
+            extradirentries = []
+            for extradir, extrarev in extradirs.items():
+                extradirentry = OrderedDict()
+                if srctreetop:
+                    # Several source trees at the top level
+                    extradirentry['path'] = os.path.join(srctreetop, extradir)
+                else:
+                    # All of the extra source trees are under the main one, so chop off
+                    # the top level subdirectory
+                    extradirentry['path'] = os.path.join(srctree, os.sep.join(extradir.split(os.sep)[1:]))
+                extradirentry['initial_rev'] = extrarev
+                # Get list of commits since this revision
+                (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % extrarev, cwd=extradirentry['path'])
+                extradirentry['commits'] = stdout.split()
+                extradirentries.append(extradirentry)
+
         # Check that recipe isn't using a shared workdir
         s = os.path.abspath(rd.getVar('S'))
         workdir = os.path.abspath(rd.getVar('WORKDIR'))
@@ -842,6 +917,23 @@ def modify(args, config, basepath, workspace):
                         '    cp ${B}/.config ${S}/.config.baseline\n'
                         '    ln -sfT ${B}/.config ${S}/.config.new\n'
                         '}\n')
+
+            if extradirs:
+                f.write('\n# srctreetop: %s\n' % srctreetop)
+                extradir_json = json.dumps(extradirentries, indent='    ')
+                prefix = '# extradirs:'
+                for line in extradir_json.splitlines():
+                    f.write('%s %s\n' % (prefix, line))
+                    prefix = '#'
+                f.write('\ndo_unpack[postfuncs] += "devtool_symlink_srctrees"\n')
+                f.write('devtool_symlink_srctrees () {\n')
+                # We could have done a loop in the function itself, but given there's
+                # usually only going to be a small number, there's not much point
+                for extradiritem in extradirentries:
+                    if not oe.utils.is_path_under(extradiritem['path'], srctree):
+                        f.write('    ln -sf %s ${WORKDIR}/\n' % extradiritem['path'])
+                f.write('}\n')
+
             if initial_rev:
                 f.write('\n# initial_rev: %s\n' % initial_rev)
                 for commit in commits:
@@ -1056,7 +1148,7 @@ def rename(args, config, basepath, workspace):
     return 0
 
 
-def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
+def _get_patchset_revs(recipename, workspace, srctree, initial_rev=None):
     """Get initial and update rev of a recipe. These are the start point of the
     whole patchset and start point for the patches to be re-generated/updated.
     """
@@ -1067,10 +1159,15 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
                                cwd=srctree)
     branchname = stdout.rstrip()
 
+    append = workspace[recipename]['bbappend']
+    if not os.path.exists(append):
+        raise DevtoolError('unable to find workspace bbappend for recipe %s' %
+                           recipename)
+
     # Parse initial rev from recipe if not specified
     commits = []
     patches = []
-    with open(recipe_path, 'r') as f:
+    with open(append, 'r') as f:
         for line in f:
             if line.startswith('# initial_rev:'):
                 if not initial_rev:
@@ -1080,6 +1177,15 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
             elif line.startswith('# patches_%s:' % branchname):
                 patches = line.split(':')[-1].strip().split(',')
 
+    if srctree != workspace[recipename]['srctree']:
+        # Extra dir
+        for extradirentry in workspace[recipename]['extradirs']:
+            if srctree == extradirentry['path']:
+                commits = extradirentry['commits']
+                break
+        else:
+            raise Exception('Failed to find extradir entry for %s' % srctree)
+
     update_rev = initial_rev
     changed_revs = None
     if initial_rev:
@@ -1160,7 +1266,7 @@ def _remove_source_files(append, files, destpath, no_report_remove=False, dry_ru
                         raise
 
 
-def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
+def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None, origsrcdir=None):
     """Export patches from srctree to given location.
        Returns three-tuple of dicts:
          1. updated - patches that already exist in SRCURI
@@ -1175,9 +1281,21 @@ def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
     added = OrderedDict()
     seqpatch_re = re.compile('^([0-9]{4}-)?(.+)')
 
+    patches = oe.recipeutils.get_recipe_patches(rd)
+    if origsrcdir:
+        if not origsrcdir.endswith(os.sep):
+            origsrcdir = origsrcdir + os.sep
+        s = rd.getVar('S')
+        for patch, parms in list(patches.items()):
+            patchdir = os.path.abspath(os.path.join(s, parms.get('patchdir', '.')))
+            if not patchdir.endswith(os.sep):
+                patchdir = patchdir + os.sep
+            if not patchdir.startswith(origsrcdir):
+                del patches[patch]
+
     existing_patches = dict((os.path.basename(path), path) for path in
-                            oe.recipeutils.get_recipe_patches(rd))
-    logger.debug('Existing patches: %s' % existing_patches)
+                            patches)
+    logger.debug('Existing patches (for %s): %s' % (srctree, existing_patches))
 
     # Generate patches from Git, exclude local files directory
     patch_pathspec = _git_exclude_path(srctree, 'oe-local-files')
@@ -1370,6 +1488,11 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     recipedir = os.path.basename(recipefile)
     logger.info('Updating SRCREV in recipe %s%s' % (recipedir, dry_run_suffix))
 
+    # Work out what the extracted path would have been (so we can use it
+    # to filter patches when there are extra source directories)
+    s = rd.getVar('S')
+    origsrcdir = os.path.abspath(os.path.join(s, os.path.relpath(srctree, workspace[recipename]['srctree'])))
+
     # Get HEAD revision
     try:
         stdout, _ = bb.process.run('git rev-parse HEAD', cwd=srctree)
@@ -1398,7 +1521,8 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
             patches_dir = tempfile.mkdtemp(dir=tempdir)
             old_srcrev = rd.getVar('SRCREV') or ''
             upd_p, new_p, del_p = _export_patches(srctree, rd, old_srcrev,
-                                                  patches_dir)
+                                                  patches_dir,
+                                                  origsrcdir=origsrcdir)
             logger.debug('Patches: update %s, new %s, delete %s' % (dict(upd_p), dict(new_p), dict(del_p)))
 
             # Remove deleted local files and "overlapping" patches
@@ -1444,6 +1568,10 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
             if update_srcuri:
                 patchfields['SRC_URI'] = ' '.join(srcuri)
             ret = oe.recipeutils.patch_recipe(rd, recipefile, patchfields, redirect_output=dry_run_outdir)
+            # Set the values into the datastore for the benefit of the next
+            # call (if extradirs are set)
+            for var, value in patchfields.items():
+                rd.setVar(var, value)
     finally:
         shutil.rmtree(tempdir)
     if not 'git://' in orig_src_uri:
@@ -1461,12 +1589,8 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
 
     recipefile = rd.getVar('FILE')
     recipedir = os.path.dirname(recipefile)
-    append = workspace[recipename]['bbappend']
-    if not os.path.exists(append):
-        raise DevtoolError('unable to find workspace bbappend for recipe %s' %
-                           recipename)
 
-    initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev)
+    initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(recipename, workspace, srctree, initial_rev)
     if not initial_rev:
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
@@ -1476,6 +1600,17 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     if not dl_dir.endswith('/'):
         dl_dir += '/'
 
+    # Work out what the extracted path would have been (so we can use it
+    # to filter patches when there are extra source directories)
+    s = rd.getVar('S')
+    origsrcdir = os.path.abspath(os.path.join(s, os.path.relpath(srctree, workspace[recipename]['srctree'])))
+    # Determine patchdir for any new patches
+    patchdir = os.path.relpath(origsrcdir, s)
+    if patchdir != '.':
+        patchsuffix = ';patchdir=%s' % patchdir
+    else:
+        patchsuffix = ''
+
     dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
@@ -1494,14 +1629,16 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
             # Get all patches from source tree and check if any should be removed
             all_patches_dir = tempfile.mkdtemp(dir=tempdir)
             _, _, del_p = _export_patches(srctree, rd, initial_rev,
-                                          all_patches_dir)
+                                          all_patches_dir,
+                                          origsrcdir=origsrcdir)
             # Remove deleted local files and  patches
             remove_files = list(del_f.values()) + list(del_p.values())
 
         # Get updated patches from source tree
         patches_dir = tempfile.mkdtemp(dir=tempdir)
         upd_p, new_p, _ = _export_patches(srctree, rd, update_rev,
-                                          patches_dir, changed_revs)
+                                          patches_dir, changed_revs,
+                                          origsrcdir=origsrcdir)
         logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
         if filter_patches:
             new_p = {}
@@ -1531,7 +1668,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                                 removevalues=removevalues,
                                 redirect_output=dry_run_outdir)
             else:
-                logger.info('No patches or local source files needed updating')
+                return False, None, []
         else:
             # Update existing files
             files_dir = _determine_files_dir(rd)
@@ -1553,7 +1690,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                     # replace the entry in SRC_URI with our local version
                     logger.info('Replacing remote patch %s with updated local version' % basepath)
                     path = os.path.join(files_dir, basepath)
-                    _replace_srcuri_entry(srcuri, basepath, 'file://%s' % basepath)
+                    _replace_srcuri_entry(srcuri, basepath, 'file://%s%s' % (basepath, patchsuffix))
                     updaterecipe = True
                 else:
                     logger.info('Updating patch %s%s' % (basepath, dry_run_suffix))
@@ -1575,7 +1712,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                            os.path.join(files_dir, basepath),
                            dry_run_outdir=dry_run_outdir,
                            base_outdir=recipedir)
-                srcuri.append('file://%s' % basepath)
+                srcuri.append('file://%s%s' % (basepath, patchsuffix))
                 updaterecipe = True
             # Update recipe, if needed
             if _remove_file_entries(srcuri, remove_files)[0]:
@@ -1586,9 +1723,11 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                 ret = oe.recipeutils.patch_recipe(rd, recipefile,
                                                   {'SRC_URI': ' '.join(srcuri)},
                                                   redirect_output=dry_run_outdir)
+                # Set the value into the datastore for the benefit of the next
+                # call (if extradirs are set)
+                rd.setVar('SRC_URI', ' '.join(srcuri))
             elif not updatefiles:
                 # Neither patches nor recipe were updated
-                logger.info('No patches or files need updating')
                 return False, None, []
     finally:
         shutil.rmtree(tempdir)
@@ -1619,70 +1758,82 @@ def _guess_recipe_update_mode(srctree, rdata):
     return 'patch'
 
 def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False, dry_run_outdir=None, no_overrides=False):
-    srctree = workspace[recipename]['srctree']
-    if mode == 'auto':
-        mode = _guess_recipe_update_mode(srctree, rd)
+    main_srctree = workspace[recipename]['srctree']
 
-    override_branches = []
-    mainbranch = None
-    startbranch = None
-    if not no_overrides:
-        stdout, _ = bb.process.run('git branch', cwd=srctree)
-        other_branches = []
-        for line in stdout.splitlines():
-            branchname = line[2:]
-            if line.startswith('* '):
-                startbranch = branchname
-            if branchname.startswith(override_branch_prefix):
-                override_branches.append(branchname)
-            else:
-                other_branches.append(branchname)
+    appendfile = workspace[recipename]['bbappend']
+    srctrees = OrderedDict([(main_srctree, initial_rev)])
+    for extradirentry in workspace[recipename]['extradirs']:
+        srctrees[extradirentry['path']] = extradirentry['initial_rev']
+
+    logger.debug('Considering source trees: %s' % srctrees)
 
+    if mode == 'auto':
+        mode = _guess_recipe_update_mode(main_srctree, rd)
+
+    crd = bb.data.createCopy(rd)
+    for srctree, src_initial_rev in srctrees.items():
+        override_branches = []
+        mainbranch = None
+        startbranch = None
+        if not no_overrides:
+            stdout, _ = bb.process.run('git branch', cwd=srctree)
+            other_branches = []
+            for line in stdout.splitlines():
+                branchname = line[2:]
+                if line.startswith('* '):
+                    startbranch = branchname
+                if branchname.startswith(override_branch_prefix):
+                    override_branches.append(branchname)
+                else:
+                    other_branches.append(branchname)
+
+            if override_branches:
+                logger.debug('_update_recipe: override branches: %s' % override_branches)
+                logger.debug('_update_recipe: other branches: %s' % other_branches)
+                if startbranch.startswith(override_branch_prefix):
+                    if len(other_branches) == 1:
+                        mainbranch = other_branches[1]
+                    else:
+                        raise DevtoolError('Unable to determine main branch - please check out the main branch in source tree first')
+                else:
+                    mainbranch = startbranch
+
+        checkedout = None
+        anyupdated = False
+        appendfile = None
+        allremoved = []
         if override_branches:
-            logger.debug('_update_recipe: override branches: %s' % override_branches)
-            logger.debug('_update_recipe: other branches: %s' % other_branches)
-            if startbranch.startswith(override_branch_prefix):
-                if len(other_branches) == 1:
-                    mainbranch = other_branches[1]
+            logger.info('Handling main branch (%s)...' % mainbranch)
+            if startbranch != mainbranch:
+                bb.process.run('git checkout %s' % mainbranch, cwd=srctree)
+            checkedout = mainbranch
+        try:
+            branchlist = [mainbranch] + override_branches
+            for branch in branchlist:
+                if branch != mainbranch:
+                    logger.info('Handling branch %s...' % branch)
+                    override = branch[len(override_branch_prefix):]
+                    crd.setVar('OVERRIDES', '%s:%s' % rd.getVar('OVERRIDES') + override)
+                    bb.process.run('git checkout %s' % branch, cwd=srctree)
+                    checkedout = branch
+
+                if mode == 'srcrev':
+                    updated, appendf, removed = _update_recipe_srcrev(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir)
+                elif mode == 'patch':
+                    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, src_initial_rev, dry_run_outdir)
                 else:
-                    raise DevtoolError('Unable to determine main branch - please check out the main branch in source tree first')
-            else:
-                mainbranch = startbranch
+                    raise DevtoolError('update_recipe: invalid mode %s' % mode)
+                if updated:
+                    anyupdated = True
+                if appendf:
+                    appendfile = appendf
+                allremoved.extend(removed)
+        finally:
+            if startbranch and checkedout != startbranch:
+                bb.process.run('git checkout %s' % startbranch, cwd=srctree)
 
-    checkedout = None
-    anyupdated = False
-    appendfile = None
-    allremoved = []
-    if override_branches:
-        logger.info('Handling main branch (%s)...' % mainbranch)
-        if startbranch != mainbranch:
-            bb.process.run('git checkout %s' % mainbranch, cwd=srctree)
-        checkedout = mainbranch
-    try:
-        branchlist = [mainbranch] + override_branches
-        for branch in branchlist:
-            crd = bb.data.createCopy(rd)
-            if branch != mainbranch:
-                logger.info('Handling branch %s...' % branch)
-                override = branch[len(override_branch_prefix):]
-                crd.appendVar('OVERRIDES', ':%s' % override)
-                bb.process.run('git checkout %s' % branch, cwd=srctree)
-                checkedout = branch
-
-            if mode == 'srcrev':
-                updated, appendf, removed = _update_recipe_srcrev(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir)
-            elif mode == 'patch':
-                updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir)
-            else:
-                raise DevtoolError('update_recipe: invalid mode %s' % mode)
-            if updated:
-                anyupdated = True
-            if appendf:
-                appendfile = appendf
-            allremoved.extend(removed)
-    finally:
-        if startbranch and checkedout != startbranch:
-            bb.process.run('git checkout %s' % startbranch, cwd=srctree)
+    if not anyupdated:
+        logger.info('No patches or files need updating')
 
     return anyupdated, appendfile, allremoved
 
@@ -1808,16 +1959,16 @@ def _reset(recipes, no_clean, config, basepath, workspace):
         # We don't automatically create this dir next to appends, but the user can
         preservedir(os.path.join(config.workspace_path, 'appends', pn))
 
-        srctreebase = workspace[pn]['srctreebase']
-        if os.path.isdir(srctreebase):
-            if os.listdir(srctreebase):
+        srctreetop = workspace[pn]['srctreetop']
+        if os.path.isdir(srctreetop):
+            if os.listdir(srctreetop):
                 # We don't want to risk wiping out any work in progress
                 logger.info('Leaving source tree %s as-is; if you no '
                             'longer need it then please delete it manually'
-                            % srctreebase)
+                            % srctreetop)
             else:
                 # This is unlikely, but if it's empty we can just remove it
-                os.rmdir(srctreebase)
+                os.rmdir(srctreetop)
 
         clean_preferred_provider(pn, config.workspace_path)
 
@@ -1868,12 +2019,17 @@ def finish(args, config, basepath, workspace):
 
     srctree = workspace[args.recipename]['srctree']
     check_git_repo_op(srctree, [corebasedir])
-    dirty = check_git_repo_dirty(srctree)
-    if dirty:
-        if args.force:
-            logger.warning('Source tree is not clean, continuing as requested by -f/--force')
-        else:
-            raise DevtoolError('Source tree is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % dirty)
+    srctrees = [srctree]
+    for extradirentry in workspace[args.recipename]['extradirs']:
+        srctrees.append(extradirentry['path'])
+    for pth in srctrees:
+        dirty = check_git_repo_dirty(pth)
+        if dirty:
+            if args.force:
+                logger.warning('Source tree %s is not clean, continuing as requested by -f/--force' % pth)
+            else:
+                raise DevtoolError('Source tree %s is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % (pth, dirty))
+
 
     no_clean = False
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
-- 
2.9.5


