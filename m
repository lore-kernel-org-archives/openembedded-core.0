Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1CD78512
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:33 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401186"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:25 +1300
Message-Id: <75d99de26f786dd62d3e04cc8cc438fd66ca421b.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 24/24] devtool: implement conditional patch handling
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:33 -0000

If you have a recipe that uses overrides to conditionally extend
SRC_URI to add additional patches, then you will often need to update
those patches if you're making other changes to the source tree (for
example if you're upgrading the underlying source). Make this possible
with devtool by creating devtool-override-* branches for each override
that conditionally appends/prepends SRC_URI, and have devtool
update-recipe / finish check each branch out in turn and update the
corresponding patches.

A current example of a recipe that does this is the quota recipe - it
applies an additional patch if musl is the selected C library (i.e.
libc-musl is in OVERRIDES).

Note that use of this functionality does require some care - in
particular, updates to patches that appear on the main branch (named
"devtool" by default) should be made there and not only on one of the
specific devtool-override-* branches that are created for each override.
The recommended procedure is to make the changes you want to make to the
main branch first, then check out and rebase each devtool-override-*
branch, testing each one by activating the corresponding configuration,
and then finally run devtool finish.

Fixes [YOCTO #11516].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/devtool-source.bbclass |  56 ++++++++++++
 scripts/lib/devtool/standard.py     | 176 +++++++++++++++++++++++++++++++-----
 scripts/lib/devtool/upgrade.py      |   3 +-
 3 files changed, 209 insertions(+), 26 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 8f5bc86..56882a4 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -152,9 +152,65 @@ python devtool_pre_patch() {
 }
 
 python devtool_post_patch() {
+    import shutil
     tempdir = d.getVar('DEVTOOL_TEMPDIR')
     with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
         srcsubdir = f.read()
+    with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
+        initial_rev = f.read()
+
+    def rm_patches():
+        patches_dir = os.path.join(srcsubdir, 'patches')
+        if os.path.exists(patches_dir):
+            shutil.rmtree(patches_dir)
+        # Restore any "patches" directory that was actually part of the source tree
+        try:
+            bb.process.run('git checkout -- patches', cwd=srcsubdir)
+        except bb.process.ExecutionError:
+            pass
+
+    extra_overrides = d.getVar('DEVTOOL_EXTRA_OVERRIDES')
+    if extra_overrides:
+        extra_override_list = extra_overrides.split(':')
+        devbranch = d.getVar('DEVTOOL_DEVBRANCH')
+        default_overrides = d.getVar('OVERRIDES').split(':')
+        no_overrides = []
+        # First, we may have some overrides that are referred to in the recipe set in
+        # our configuration, so we need to make a branch that excludes those
+        for override in default_overrides:
+            if override not in extra_override_list:
+                no_overrides.append(override)
+        if default_overrides != no_overrides:
+            # Some overrides are active in the current configuration, so
+            # we need to create a branch where none of the overrides are active
+            bb.process.run('git checkout %s -b devtool-no-overrides' % initial_rev, cwd=srcsubdir)
+            # Run do_patch function with the override applied
+            localdata = bb.data.createCopy(d)
+            localdata.setVar('OVERRIDES', ':'.join(no_overrides))
+            bb.build.exec_func('do_patch', localdata)
+            rm_patches()
+            # Now we need to reconcile the dev branch with the no-overrides one
+            # (otherwise we'd likely be left with identical commits that have different hashes)
+            bb.process.run('git checkout %s' % devbranch, cwd=srcsubdir)
+            bb.process.run('git rebase devtool-no-overrides', cwd=srcsubdir)
+        else:
+            bb.process.run('git checkout %s -b devtool-no-overrides' % devbranch, cwd=srcsubdir)
+
+        for override in extra_override_list:
+            localdata = bb.data.createCopy(d)
+            if override in default_overrides:
+                bb.process.run('git branch devtool-override-%s %s' % (override, devbranch), cwd=srcsubdir)
+            else:
+                # Reset back to the initial commit on a new branch
+                bb.process.run('git checkout %s -b devtool-override-%s' % (initial_rev, override), cwd=srcsubdir)
+                # Run do_patch function with the override applied
+                localdata.appendVar('OVERRIDES', ':%s' % override)
+                bb.build.exec_func('do_patch', localdata)
+                rm_patches()
+                # Now we need to reconcile the new branch with the no-overrides one
+                # (otherwise we'd likely be left with identical commits that have different hashes)
+                bb.process.run('git rebase devtool-no-overrides', cwd=srcsubdir)
+        bb.process.run('git checkout %s' % devbranch, cwd=srcsubdir)
     bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
 }
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d55d504..26187a0 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -35,6 +35,8 @@ from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
 
+override_branch_prefix = 'devtool-override-'
+
 
 def add(args, config, basepath, workspace):
     """Entry point for the devtool 'add' subcommand"""
@@ -425,7 +427,7 @@ def extract(args, config, basepath, workspace):
     """Entry point for the devtool 'extract' subcommand"""
     import bb
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     if not tinfoil:
         # Error already shown
         return 1
@@ -435,7 +437,7 @@ def extract(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
         logger.info('Source tree extracted to %s' % srctree)
 
         if initial_rev:
@@ -449,7 +451,7 @@ def sync(args, config, basepath, workspace):
     """Entry point for the devtool 'sync' subcommand"""
     import bb
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     if not tinfoil:
         # Error already shown
         return 1
@@ -459,7 +461,7 @@ def sync(args, config, basepath, workspace):
             return 1
 
         srctree = os.path.abspath(args.srctree)
-        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, True, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+        initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, True, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=True)
         logger.info('Source tree %s synchronized' % srctree)
 
         if initial_rev:
@@ -470,7 +472,7 @@ def sync(args, config, basepath, workspace):
         tinfoil.shutdown()
 
 
-def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil):
+def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
     """Extract sources of a recipe"""
     import oe.recipeutils
     import oe.patch
@@ -500,6 +502,16 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         bb.utils.mkdirhier(srctree)
         os.rmdir(srctree)
 
+    extra_overrides = []
+    if not no_overrides:
+        history = d.varhistory.variable('SRC_URI')
+        for event in history:
+            if not 'flag' in event:
+                if event['op'].startswith(('_append[', '_prepend[')):
+                    extra_overrides.append(event['op'].split('[')[1].split(']')[0])
+        if extra_overrides:
+            logger.info('SRC_URI contains some conditional appends/prepends - will create branches to represent these')
+
     initial_rev = None
 
     appendexisted = False
@@ -542,6 +554,8 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             if not is_kernel_yocto:
                 f.write('PATCHTOOL = "git"\n')
                 f.write('PATCH_COMMIT_FUNCTIONS = "1"\n')
+            if extra_overrides:
+                f.write('DEVTOOL_EXTRA_OVERRIDES = "%s"\n' % ':'.join(extra_overrides))
             f.write('inherit devtool-source\n')
             f.write('###--- _extract_source\n')
 
@@ -702,12 +716,13 @@ def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
     import oe.recipeutils
+    import oe.patch
 
     if args.recipename in workspace:
         raise DevtoolError("recipe %s is already in your workspace" %
                            args.recipename)
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
         rd = parse_recipe(config, tinfoil, args.recipename, True)
         if not rd:
@@ -742,14 +757,16 @@ def modify(args, config, basepath, workspace):
 
         initial_rev = None
         commits = []
+        check_commits = False
         if not args.no_extract:
-            initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+            initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
             # Get list of commits since this revision
             (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
             commits = stdout.split()
+            check_commits = True
         else:
             if os.path.exists(os.path.join(srctree, '.git')):
                 # Check if it's a tree previously extracted by us
@@ -757,6 +774,8 @@ def modify(args, config, basepath, workspace):
                     (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=srctree)
                 except bb.process.ExecutionError:
                     stdout = ''
+                if stdout:
+                    check_commits = True
                 for line in stdout.splitlines():
                     if line.startswith('*'):
                         (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
@@ -766,6 +785,30 @@ def modify(args, config, basepath, workspace):
                     (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
                     initial_rev = stdout.rstrip()
 
+        branch_patches = {}
+        if check_commits:
+            # Check if there are override branches
+            (stdout, _) = bb.process.run('git branch', cwd=srctree)
+            branches = []
+            for line in stdout.rstrip().splitlines():
+                branchname = line[2:].rstrip()
+                if branchname.startswith(override_branch_prefix):
+                    branches.append(branchname)
+            if branches:
+                logger.warn('SRC_URI is conditionally overridden in this recipe, thus several %s* branches have been created, one for each override that makes changes to SRC_URI. It is recommended that you make changes to the %s branch first, then checkout and rebase each %s* branch and update any unique patches there (duplicates on those branches will be ignored by devtool finish/update-recipe)' % (override_branch_prefix, args.branch, override_branch_prefix))
+            branches.insert(0, args.branch)
+            seen_patches = []
+            for branch in branches:
+                branch_patches[branch] = []
+                (stdout, _) = bb.process.run('git log devtool-base..%s' % branch, cwd=srctree)
+                for line in stdout.splitlines():
+                    line = line.strip()
+                    if line.startswith(oe.patch.GitApplyTree.patch_line_prefix):
+                        origpatch = line[len(oe.patch.GitApplyTree.patch_line_prefix):].split(':', 1)[-1].strip()
+                        if not origpatch in seen_patches:
+                            seen_patches.append(origpatch)
+                            branch_patches[branch].append(origpatch)
+
         # Need to grab this here in case the source is within a subdirectory
         srctreebase = srctree
 
@@ -808,6 +851,11 @@ def modify(args, config, basepath, workspace):
                 f.write('\n# initial_rev: %s\n' % initial_rev)
                 for commit in commits:
                     f.write('# commit: %s\n' % commit)
+            if branch_patches:
+                for branch in branch_patches:
+                    if branch == args.branch:
+                        continue
+                    f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
@@ -1019,8 +1067,14 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
     """
     import bb
 
+    # Get current branch
+    stdout, _ = bb.process.run('git rev-parse --abbrev-ref HEAD',
+                               cwd=srctree)
+    branchname = stdout.rstrip()
+
     # Parse initial rev from recipe if not specified
     commits = []
+    patches = []
     with open(recipe_path, 'r') as f:
         for line in f:
             if line.startswith('# initial_rev:'):
@@ -1028,6 +1082,8 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
                     initial_rev = line.split(':')[-1].strip()
             elif line.startswith('# commit:'):
                 commits.append(line.split(':')[-1].strip())
+            elif line.startswith('# patches_%s:' % branchname):
+                patches = line.split(':')[-1].strip().split(',')
 
     update_rev = initial_rev
     changed_revs = None
@@ -1054,7 +1110,7 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
                     if rev in newcommits:
                         changed_revs.append(rev)
 
-    return initial_rev, update_rev, changed_revs
+    return initial_rev, update_rev, changed_revs, patches
 
 def _remove_file_entries(srcuri, filelist):
     """Remove file:// entries from SRC_URI"""
@@ -1126,6 +1182,7 @@ def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
 
     existing_patches = dict((os.path.basename(path), path) for path in
                             oe.recipeutils.get_recipe_patches(rd))
+    logger.debug('Existing patches: %s' % existing_patches)
 
     # Generate patches from Git, exclude local files directory
     patch_pathspec = _git_exclude_path(srctree, 'oe-local-files')
@@ -1414,7 +1471,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
                            recipename)
 
-    initial_rev, update_rev, changed_revs = _get_patchset_revs(srctree, append, initial_rev)
+    initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev)
     if not initial_rev:
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
@@ -1429,22 +1486,32 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
-        srctreebase = workspace[recipename]['srctreebase']
-        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
+        if filter_patches:
+            upd_f = {}
+            new_f = {}
+            del_f = {}
+        else:
+            srctreebase = workspace[recipename]['srctreebase']
+            upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
 
         remove_files = []
         if not no_remove:
             # Get all patches from source tree and check if any should be removed
             all_patches_dir = tempfile.mkdtemp(dir=tempdir)
-            upd_p, new_p, del_p = _export_patches(srctree, rd, initial_rev,
-                                                  all_patches_dir)
+            _, _, del_p = _export_patches(srctree, rd, initial_rev,
+                                          all_patches_dir)
             # Remove deleted local files and  patches
             remove_files = list(del_f.values()) + list(del_p.values())
 
         # Get updated patches from source tree
         patches_dir = tempfile.mkdtemp(dir=tempdir)
-        upd_p, new_p, del_p = _export_patches(srctree, rd, update_rev,
-                                              patches_dir, changed_revs)
+        upd_p, new_p, _ = _export_patches(srctree, rd, update_rev,
+                                          patches_dir, changed_revs)
+        logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
+        if filter_patches:
+            new_p = {}
+            upd_p = {k:v for k,v in upd_p.items() if k in filter_patches}
+            remove_files = [f for f in remove_files if f in filter_patches]
         updatefiles = False
         updaterecipe = False
         destpath = None
@@ -1556,18 +1623,73 @@ def _guess_recipe_update_mode(srctree, rdata):
 
     return 'patch'
 
-def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False, dry_run_outdir=None):
+def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False, dry_run_outdir=None, no_overrides=False):
     srctree = workspace[recipename]['srctree']
     if mode == 'auto':
         mode = _guess_recipe_update_mode(srctree, rd)
 
-    if mode == 'srcrev':
-        updated, appendfile, removed = _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir)
-    elif mode == 'patch':
-        updated, appendfile, removed = _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir)
-    else:
-        raise DevtoolError('update_recipe: invalid mode %s' % mode)
-    return updated, appendfile, removed
+    override_branches = []
+    mainbranch = None
+    startbranch = None
+    if not no_overrides:
+        stdout, _ = bb.process.run('git branch', cwd=srctree)
+        other_branches = []
+        for line in stdout.splitlines():
+            branchname = line[2:]
+            if line.startswith('* '):
+                startbranch = branchname
+            if branchname.startswith(override_branch_prefix):
+                override_branches.append(branchname)
+            else:
+                other_branches.append(branchname)
+
+        if override_branches:
+            logger.debug('_update_recipe: override branches: %s' % override_branches)
+            logger.debug('_update_recipe: other branches: %s' % other_branches)
+            if startbranch.startswith(override_branch_prefix):
+                if len(other_branches) == 1:
+                    mainbranch = other_branches[1]
+                else:
+                    raise DevtoolError('Unable to determine main branch - please check out the main branch in source tree first')
+            else:
+                mainbranch = startbranch
+
+    checkedout = None
+    anyupdated = False
+    appendfile = None
+    allremoved = []
+    if override_branches:
+        logger.info('Handling main branch (%s)...' % mainbranch)
+        if startbranch != mainbranch:
+            bb.process.run('git checkout %s' % mainbranch, cwd=srctree)
+        checkedout = mainbranch
+    try:
+        branchlist = [mainbranch] + override_branches
+        for branch in branchlist:
+            crd = bb.data.createCopy(rd)
+            if branch != mainbranch:
+                logger.info('Handling branch %s...' % branch)
+                override = branch[len(override_branch_prefix):]
+                crd.appendVar('OVERRIDES', ':%s' % override)
+                bb.process.run('git checkout %s' % branch, cwd=srctree)
+                checkedout = branch
+
+            if mode == 'srcrev':
+                updated, appendf, removed = _update_recipe_srcrev(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir)
+            elif mode == 'patch':
+                updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir)
+            else:
+                raise DevtoolError('update_recipe: invalid mode %s' % mode)
+            if updated:
+                anyupdated = True
+            if appendf:
+                appendfile = appendf
+            allremoved.extend(removed)
+    finally:
+        if startbranch and checkedout != startbranch:
+            bb.process.run('git checkout %s' % startbranch, cwd=srctree)
+
+    return anyupdated, appendfile, allremoved
 
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
@@ -1593,7 +1715,7 @@ def update_recipe(args, config, basepath, workspace):
         if args.dry_run:
             dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
             dry_run_outdir = dry_run_output.name
-        updated, _, _ = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev, dry_run_outdir=dry_run_outdir)
+        updated, _, _ = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides)
 
         if updated:
             rf = rd.getVar('FILE')
@@ -1816,7 +1938,7 @@ def finish(args, config, basepath, workspace):
         if args.dry_run:
             dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
             dry_run_outdir = dry_run_output.name
-        updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir)
+        updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides)
         removed = [os.path.relpath(pth, recipedir) for pth in removed]
 
         # Remove any old files in the case of an upgrade
@@ -1959,6 +2081,7 @@ def register_commands(subparsers, context):
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
+    parser_modify.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
     parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
@@ -1968,6 +2091,7 @@ def register_commands(subparsers, context):
     parser_extract.add_argument('recipename', help='Name of recipe to extract the source for')
     parser_extract.add_argument('srctree', help='Path to where to extract the source tree')
     parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (default "%(default)s")')
+    parser_extract.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_extract.set_defaults(func=extract, fixed_setup=context.fixed_setup)
 
@@ -1999,6 +2123,7 @@ def register_commands(subparsers, context):
     parser_update_recipe.add_argument('--append', '-a', help='Write changes to a bbappend in the specified layer instead of the recipe', metavar='LAYERDIR')
     parser_update_recipe.add_argument('--wildcard-version', '-w', help='In conjunction with -a/--append, use a wildcard to make the bbappend apply to any recipe version', action='store_true')
     parser_update_recipe.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
+    parser_update_recipe.add_argument('--no-overrides', '-O', action="store_true", help='Do not handle other override branches (if they exist)')
     parser_update_recipe.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
     parser_update_recipe.set_defaults(func=update_recipe)
 
@@ -2023,5 +2148,6 @@ def register_commands(subparsers, context):
     parser_finish.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_finish.add_argument('--initial-rev', help='Override starting revision for patches')
     parser_finish.add_argument('--force', '-f', action="store_true", help='Force continuing even if there are uncommitted changes in the source tree repository')
+    parser_finish.add_argument('--no-overrides', '-O', action="store_true", help='Do not handle other override branches (if they exist)')
     parser_finish.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
     parser_finish.set_defaults(func=finish)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 3cb523c..f6141bf 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -474,7 +474,7 @@ def upgrade(args, config, basepath, workspace):
         rf = None
         try:
             logger.info('Extracting current version source...')
-            rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
+            rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
@@ -513,6 +513,7 @@ def register_commands(subparsers, context):
     parser_upgrade.add_argument('--srcbranch', '-B', help='Branch in source repository containing the revision to use (if fetching from an SCM such as git)')
     parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for new development branch to checkout (default "%(default)s")')
     parser_upgrade.add_argument('--no-patch', action="store_true", help='Do not apply patches from the recipe to the new source code')
+    parser_upgrade.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     group = parser_upgrade.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
-- 
2.9.5


