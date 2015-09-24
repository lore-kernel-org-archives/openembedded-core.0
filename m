Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 67D4C77022
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:53:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 04:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="796374468"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 04:53:19 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:53:06 +0300
Message-Id: <1443095587-13852-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3 09/10] devtool: better support for local source files
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
X-List-Received-Date: Thu, 24 Sep 2015 11:53:20 -0000

* extract: Copy all local source files (i.e.  non-compressed/non-arcived
  SRC_URI files that have file:// URI prefix) - excluding patches - to
  the srctree repository. The files will be placed in a subdirectory
  called 'oe-local-files'. The oe-local-files directory is not committed
  to the Git repository, but, marked to be ignored by a .gitignore file.
  The developer can manually add and commit the files to Git if the
  changes to them need to be tracked.

  Before this patch, local source files (were copied (and committed) to
  the srctree repository only in some special cases (basically when
  S=WORKDIR) when doing devtool-extract. For most of the packages local
  files were not copied at all.

* update-recipe: This patch causes the local files to be 'synced' from
  the srctree (i.e. from the 'oe-local-files' subdirectory) to the
  layer.  Being 'synced' means that in addition to copying modified
  files over the original sources, devtool will also handle removing and
  adding local source files and updating the recipe accordingly.  We
  don't want to create patches against the local source files but rather
  update them directly.  Thus, 'oe-local-file' directory is ignored in
  patch generation when doing update-recipe, even if committed to Git.
  This functionality is only enabled if the 'oe-local-files' directory
  is present in srctree.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py |  73 +++++++++
 scripts/lib/devtool/__init__.py   |  10 +-
 scripts/lib/devtool/standard.py   | 314 ++++++++++++++++++++++++++------------
 3 files changed, 299 insertions(+), 98 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index a893ed3..59f0fae 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -738,6 +738,79 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
 
+    @testcase(1173)
+    def test_devtool_update_recipe_local_files(self):
+        """Check that local source files are copied over instead of patched"""
+        workspacedir = self._get_workspace_dir()
+        testrecipe = 'makedevs'
+        recipefile = get_bb_var('FILE', testrecipe)
+        # Setup srctree for modifying the recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be
+        # building it)
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Edit / commit local source
+        runCmd('echo "/* Foobar */" >> oe-local-files/makedevs.c', cwd=tempdir)
+        runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
+        runCmd('echo "Bar" > new-file', cwd=tempdir)
+        runCmd('git add new-file', cwd=tempdir)
+        runCmd('git commit -m "Add new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
+                                     os.path.dirname(recipefile))
+        runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           (' M', '.*/makedevs/makedevs.c$'),
+                           ('??', '.*/makedevs/new-local$'),
+                           ('??', '.*/makedevs/0001-Add-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
+    @testcase(1174)
+    def test_devtool_update_recipe_local_files_2(self):
+        """Check local source files support when oe-local-files is in Git"""
+        workspacedir = self._get_workspace_dir()
+        testrecipe = 'lzo'
+        recipefile = get_bb_var('FILE', testrecipe)
+        # Setup srctree for modifying the recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Add oe-local-files to Git
+        runCmd('rm oe-local-files/.gitignore', cwd=tempdir)
+        runCmd('git add oe-local-files', cwd=tempdir)
+        runCmd('git commit -m "Add local sources"', cwd=tempdir)
+        # Edit / commit local sources
+        runCmd('echo "# Foobar" >> oe-local-files/acinclude.m4', cwd=tempdir)
+        runCmd('git commit -am "Edit existing file"', cwd=tempdir)
+        runCmd('git rm oe-local-files/run-ptest', cwd=tempdir)
+        runCmd('git commit -m"Remove file"', cwd=tempdir)
+        runCmd('echo "Foo" > oe-local-files/new-local', cwd=tempdir)
+        runCmd('git add oe-local-files/new-local', cwd=tempdir)
+        runCmd('git commit -m "Add new local file"', cwd=tempdir)
+        runCmd('echo "Gar" > new-file', cwd=tempdir)
+        runCmd('git add new-file', cwd=tempdir)
+        runCmd('git commit -m "Add new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
+                                     os.path.dirname(recipefile))
+        # Checkout unmodified file to working copy -> devtool should still pick
+        # the modified version from HEAD
+        runCmd('git checkout HEAD^ -- oe-local-files/acinclude.m4', cwd=tempdir)
+        runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           (' M', '.*/acinclude.m4$'),
+                           (' D', '.*/run-ptest$'),
+                           ('??', '.*/new-local$'),
+                           ('??', '.*/0001-Add-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+
     @testcase(1163)
     def test_devtool_extract(self):
         workspacedir = self._get_workspace_dir()
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index f815ef2..54792c2 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -179,11 +179,17 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base'):
     if not os.path.exists(os.path.join(repodir, '.git')):
         bb.process.run('git init', cwd=repodir)
         bb.process.run('git add .', cwd=repodir)
-        if version:
+        commit_cmd = ['git', 'commit', '-q']
+        stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
+        if not stdout:
+            commit_cmd.append('--allow-empty')
+            commitmsg = "Initial empty commit with no upstream sources"
+        elif version:
             commitmsg = "Initial commit from upstream at version %s" % version
         else:
             commitmsg = "Initial commit from upstream"
-        bb.process.run('git commit -q -m "%s"' % commitmsg, cwd=repodir)
+        commit_cmd += ['-m', commitmsg]
+        bb.process.run(commit_cmd, cwd=repodir)
 
     bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
     bb.process.run('git tag -f %s' % basetag, cwd=repodir)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index efa6fd1..6b85c8c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -181,6 +181,36 @@ def _move_file(src, dst):
         bb.utils.mkdirhier(dst_d)
     shutil.move(src, dst)
 
+def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
+    """List contents of a git treeish"""
+    import bb
+    cmd = ['git', 'ls-tree', '-z', treeish]
+    if recursive:
+        cmd.append('-r')
+    out, _ = bb.process.run(cmd, cwd=repodir)
+    ret = {}
+    for line in out.split('\0'):
+        if line:
+            split = line.split(None, 4)
+            ret[split[3]] = split[0:3]
+    return ret
+
+def _git_exclude_path(srctree, path):
+    """Return pathspec (list of paths) that excludes certain path"""
+    # NOTE: "Filtering out" files/paths in this way is not entirely reliable -
+    # we don't catch files that are deleted, for example. A more reliable way
+    # to implement this would be to use "negative pathspecs" which were
+    # introduced in Git v1.9.0. Revisit this when/if the required Git version
+    # becomes greater than that.
+    path = os.path.normpath(path)
+    recurse = True if len(path.split(os.path.sep)) > 1 else False
+    git_files = _git_ls_tree(srctree, 'HEAD', recurse).keys()
+    if path in git_files:
+        git_files.remove(path)
+        return git_files
+    else:
+        return ['.']
+
 def _ls_tree(directory):
     """Recursive listing of files in a directory"""
     ret = []
@@ -326,10 +356,25 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             logger.info('Doing kernel checkout...')
             task_executor.exec_func('do_kernel_checkout', False)
         srcsubdir = crd.getVar('S', True)
+
+        # Move local source files into separate subdir
+        recipe_patches = [os.path.basename(patch) for patch in
+                          oe.recipeutils.get_recipe_patches(crd)]
+        local_files = oe.recipeutils.get_recipe_local_files(crd)
+        local_files = [fname for fname in local_files if
+                       os.path.exists(os.path.join(workdir, fname))]
+        if local_files:
+            for fname in local_files:
+                _move_file(os.path.join(workdir, fname),
+                           os.path.join(tempdir, 'oe-local-files', fname))
+            with open(os.path.join(tempdir, 'oe-local-files', '.gitignore'),
+                      'w') as f:
+                f.write('# Ignore local files, by default. Remove this file '
+                        'if you want to commit the directory to Git\n*\n')
+
         if srcsubdir == workdir:
-            # Find non-patch sources that were "unpacked" to srctree directory
-            recipe_patches = [os.path.basename(patch) for patch in
-                              oe.recipeutils.get_recipe_patches(crd)]
+            # Find non-patch non-local sources that were "unpacked" to srctree
+            # directory
             src_files = [fname for fname in _ls_tree(workdir) if
                          os.path.basename(fname) not in recipe_patches]
             # Force separate S so that patch files can be left out from srctree
@@ -352,12 +397,12 @@ def _extract_source(srctree, keep_temp, devbranch, d):
                 haspatches = True
             else:
                 os.rmdir(patchdir)
-
+        # Make sure that srcsubdir exists
+        bb.utils.mkdirhier(srcsubdir)
         if not os.path.exists(srcsubdir) or not os.listdir(srcsubdir):
-            raise DevtoolError("no source unpacked to S, either the %s "
-                               "recipe doesn't use any source or the "
-                               "correct source directory could not be "
-                               "determined" % pn)
+            logger.warning("no source unpacked to S, either the %s recipe "
+                           "doesn't use any source or the correct source "
+                           "directory could not be determined" % pn)
 
         setup_git_repo(srcsubdir, crd.getVar('PV', True), devbranch)
 
@@ -376,6 +421,12 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             if haspatches:
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
+        # Move oe-local-files directory to srctree
+        if os.path.exists(os.path.join(tempdir, 'oe-local-files')):
+            logger.info('Adding local source files to srctree...')
+            shutil.move(os.path.join(tempdir, 'oe-local-files'), srcsubdir)
+
+
         shutil.move(srcsubdir, srctree)
     finally:
         bb.logger.setLevel(origlevel)
@@ -560,39 +611,40 @@ def _get_patchset_revs(args, srctree, recipe_path):
 
     return initial_rev, update_rev
 
-def _remove_patch_entries(srcuri, patchlist):
-    """Remove patch entries from SRC_URI"""
-    remaining = patchlist[:]
+def _remove_file_entries(srcuri, filelist):
+    """Remove file:// entries from SRC_URI"""
+    remaining = filelist[:]
     entries = []
-    for patch in patchlist:
-        patchfile = os.path.basename(patch)
+    for fname in filelist:
+        basename = os.path.basename(fname)
         for i in xrange(len(srcuri)):
-            if srcuri[i].startswith('file://') and os.path.basename(srcuri[i].split(';')[0]) == patchfile:
+            if (srcuri[i].startswith('file://') and
+                    os.path.basename(srcuri[i].split(';')[0]) == basename):
                 entries.append(srcuri[i])
-                remaining.remove(patch)
+                remaining.remove(fname)
                 srcuri.pop(i)
                 break
     return entries, remaining
 
-def _remove_patch_files(args, patches, destpath):
+def _remove_source_files(args, files, destpath):
     """Unlink existing patch files"""
-    for patchfile in patches:
+    for path in files:
         if args.append:
             if not destpath:
                 raise Exception('destpath should be set here')
-            patchfile = os.path.join(destpath, os.path.basename(patchfile))
+            path = os.path.join(destpath, os.path.basename(path))
 
-        if os.path.exists(patchfile):
-            logger.info('Removing patch %s' % patchfile)
+        if os.path.exists(path):
+            logger.info('Removing file %s' % path)
             # FIXME "git rm" here would be nice if the file in question is
             #       tracked
             # FIXME there's a chance that this file is referred to by
             #       another recipe, in which case deleting wouldn't be the
             #       right thing to do
-            os.remove(patchfile)
+            os.remove(path)
             # Remove directory if empty
             try:
-                os.rmdir(os.path.dirname(patchfile))
+                os.rmdir(os.path.dirname(path))
             except OSError as ose:
                 if ose.errno != errno.ENOTEMPTY:
                     raise
@@ -616,8 +668,9 @@ def _export_patches(srctree, rd, start_rev, destdir):
     existing_patches = dict((os.path.basename(path), path) for path in
                             oe.recipeutils.get_recipe_patches(rd))
 
-    # Generate patches from Git
-    GitApplyTree.extractPatches(srctree, start_rev, destdir)
+    # Generate patches from Git, exclude local files directory
+    patch_pathspec = _git_exclude_path(srctree, 'oe-local-files')
+    GitApplyTree.extractPatches(srctree, start_rev, destdir, patch_pathspec)
 
     new_patches = sorted(os.listdir(destdir))
     for new_patch in new_patches:
@@ -642,6 +695,52 @@ def _export_patches(srctree, rd, start_rev, destdir):
     return (updated, added, existing_patches)
 
 
+def _export_local_files(srctree, rd, destdir):
+    """Copy local files from srctree to given location.
+       Returns three-tuple of dicts:
+         1. updated - files that already exist in SRCURI
+         2. added - new files files that don't exist in SRCURI
+         3  removed - files that exist in SRCURI but not in exported files
+      In each dict the key is the 'basepath' of the URI and value is the
+      absolute path to the existing file in recipe space (if any).
+    """
+    import oe.recipeutils
+
+    # Find out local files (SRC_URI files that exist in the "recipe space").
+    # Local files that reside in srctree are not included in patch generation.
+    # Instead they are directly copied over the original source files (in
+    # recipe space).
+    existing_files = oe.recipeutils.get_recipe_local_files(rd)
+    new_set = None
+    updated = OrderedDict()
+    added = OrderedDict()
+    removed = OrderedDict()
+    git_files = _git_ls_tree(srctree)
+    if 'oe-local-files' in git_files:
+        # If tracked by Git, take the files from srctree HEAD. First get
+        # the tree object of the directory
+        tmp_index = os.path.join(srctree, '.git', 'index.tmp.devtool')
+        tree = git_files['oe-local-files'][2]
+        bb.process.run(['git', 'checkout', tree, '--', '.'], cwd=srctree,
+                        env=dict(os.environ, GIT_WORK_TREE=destdir,
+                                 GIT_INDEX_FILE=tmp_index))
+        new_set = _git_ls_tree(srctree, tree, True).keys()
+    elif os.path.isdir(os.path.join(srctree, 'oe-local-files')):
+        # If not tracked by Git, just copy from working copy
+        new_set = _ls_tree(os.path.join(srctree, 'oe-local-files'))
+        bb.process.run(['cp', '-ax',
+                        os.path.join(srctree, 'oe-local-files', '.'), destdir])
+    if new_set is not None:
+        for fname in new_set:
+            if fname in existing_files:
+                updated[fname] = existing_files.pop(fname)
+            elif fname != '.gitignore':
+                added[fname] = None
+
+        removed = existing_files
+    return (updated, added, removed)
+
+
 def _update_recipe_srcrev(args, srctree, rd, config_data):
     """Implement the 'srcrev' mode of update-recipe"""
     import bb
@@ -661,43 +760,63 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
         raise DevtoolError('Invalid hash returned by git: %s' % stdout)
 
     destpath = None
-    removepatches = []
+    remove_files = []
     patchfields = {}
     patchfields['SRCREV'] = srcrev
     orig_src_uri = rd.getVar('SRC_URI', False) or ''
-    if not args.no_remove:
-        # Find list of existing patches in recipe file
-        existing_patches = oe.recipeutils.get_recipe_patches(rd)
-
-        old_srcrev = (rd.getVar('SRCREV', False) or '')
-        tempdir = tempfile.mkdtemp(prefix='devtool')
-        try:
+    srcuri = orig_src_uri.split()
+    tempdir = tempfile.mkdtemp(prefix='devtool')
+    update_srcuri = False
+    try:
+        local_files_dir = tempfile.mkdtemp(dir=tempdir)
+        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir)
+        if not args.no_remove:
+            # Find list of existing patches in recipe file
+            patches_dir = tempfile.mkdtemp(dir=tempdir)
+            old_srcrev = (rd.getVar('SRCREV', False) or '')
             upd_p, new_p, del_p = _export_patches(srctree, rd, old_srcrev,
-                                                  tempdir)
-            # Remove "overlapping" patches
-            removepatches = upd_p.values()
-        finally:
-            shutil.rmtree(tempdir)
-
-        if removepatches:
-            srcuri = orig_src_uri.split()
-            removedentries, _ = _remove_patch_entries(srcuri, removepatches)
-            if removedentries:
-                patchfields['SRC_URI'] = ' '.join(srcuri)
+                                                  patches_dir)
 
-    if args.append:
-        _, destpath = oe.recipeutils.bbappend_recipe(
-                rd, args.append, None, wildcardver=args.wildcard_version,
-                extralines=patchfields)
-    else:
-        oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
+            # Remove deleted local files and "overlapping" patches
+            remove_files = del_f.values() + upd_p.values()
+            if remove_files:
+                removedentries = _remove_file_entries(srcuri, remove_files)[0]
+                update_srcuri = True
 
+        if args.append:
+            files = dict((os.path.join(local_files_dir, key), val) for
+                          key, val in upd_f.items() + new_f.items())
+            removevalues = {}
+            if update_srcuri:
+                removevalues  = {'SRC_URI': removedentries}
+                patchfields['SRC_URI'] = '\\\n    '.join(srcuri)
+            _, destpath = oe.recipeutils.bbappend_recipe(
+                    rd, args.append, files, wildcardver=args.wildcard_version,
+                    extralines=patchfields, removevalues=removevalues)
+        else:
+            files_dir = os.path.join(os.path.dirname(recipefile),
+                                     rd.getVar('BPN', True))
+            for basepath, path in upd_f.iteritems():
+                logger.info('Updating file %s' % basepath)
+                _move_file(os.path.join(local_files_dir, basepath), path)
+                update_srcuri= True
+            for basepath, path in new_f.iteritems():
+                logger.info('Adding new file %s' % basepath)
+                _move_file(os.path.join(local_files_dir, basepath),
+                           os.path.join(files_dir, basepath))
+                srcuri.append('file://%s' % basepath)
+                update_srcuri = True
+            if update_srcuri:
+                patchfields['SRC_URI'] = ' '.join(srcuri)
+            oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
+    finally:
+        shutil.rmtree(tempdir)
     if not 'git://' in orig_src_uri:
         logger.info('You will need to update SRC_URI within the recipe to '
                     'point to a git repository where you have pushed your '
                     'changes')
 
-    _remove_patch_files(args, removepatches, destpath)
+    _remove_source_files(args, remove_files, destpath)
 
 def _update_recipe_patch(args, config, srctree, rd, config_data):
     """Implement the 'patch' mode of update-recipe"""
@@ -716,83 +835,86 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
 
-    # Find list of existing patches in recipe file
-    existing_patches = oe.recipeutils.get_recipe_patches(rd)
+    tempdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        local_files_dir = tempfile.mkdtemp(dir=tempdir)
+        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir)
 
-    removepatches = []
-    seqpatch_re = re.compile('^([0-9]{4}-)?(.+)')
-    if not args.no_remove:
-        # Get all patches from source tree and check if any should be removed
-        tempdir = tempfile.mkdtemp(prefix='devtool')
-        try:
+        remove_files = []
+        if not args.no_remove:
             # Get all patches from source tree and check if any should be removed
+            all_patches_dir = tempfile.mkdtemp(dir=tempdir)
             upd_p, new_p, del_p = _export_patches(srctree, rd, initial_rev,
-                                                  tempdir)
-            # Remove deleted patches
-            removepatches = del_p.values()
-        finally:
-            shutil.rmtree(tempdir)
+                                                  all_patches_dir)
+            # Remove deleted local files and  patches
+            remove_files = del_f.values() + del_p.values()
 
-    # Get updated patches from source tree
-    tempdir = tempfile.mkdtemp(prefix='devtool')
-    try:
+        # Get updated patches from source tree
+        patches_dir = tempfile.mkdtemp(dir=tempdir)
         upd_p, new_p, del_p = _export_patches(srctree, rd, update_rev,
-                                              tempdir)
-
-        # Match up and replace existing patches with corresponding new patches
-        updatepatches = False
+                                              patches_dir)
+        updatefiles = False
         updaterecipe = False
         destpath = None
+        srcuri = (rd.getVar('SRC_URI', False) or '').split()
         if args.append:
-            patchfiles = dict((os.path.join(tempdir, key), val) for
-                              key, val in upd_p.items() + new_p.items())
-
-            if patchfiles or removepatches:
+            files = dict((os.path.join(local_files_dir, key), val) for
+                         key, val in upd_f.items() + new_f.items())
+            files.update(dict((os.path.join(patches_dir, key), val) for
+                              key, val in upd_p.items() + new_p.items()))
+            if files or remove_files:
                 removevalues = None
-                if removepatches:
-                    srcuri = (rd.getVar('SRC_URI', False) or '').split()
-                    removedentries, remaining = _remove_patch_entries(
-                                                    srcuri, removepatches)
+                if remove_files:
+                    removedentries, remaining = _remove_file_entries(
+                                                    srcuri, remove_files)
                     if removedentries or remaining:
                         remaining = ['file://' + os.path.basename(item) for
                                      item in remaining]
                         removevalues = {'SRC_URI': removedentries + remaining}
                 _, destpath = oe.recipeutils.bbappend_recipe(
-                                rd, args.append, patchfiles,
+                                rd, args.append, files,
                                 removevalues=removevalues)
             else:
-                logger.info('No patches needed updating')
+                logger.info('No patches or local source files needed updating')
         else:
+            # Update existing files
+            for basepath, path in upd_f.iteritems():
+                logger.info('Updating file %s' % basepath)
+                _move_file(os.path.join(local_files_dir, basepath), path)
+                updatefiles = True
             for basepath, path in upd_p.iteritems():
                 logger.info('Updating patch %s' % basepath)
-                shutil.move(os.path.join(tempdir, basepath), path)
-                updatepatches = True
-            srcuri = (rd.getVar('SRC_URI', False) or '').split()
-            patchdir = os.path.join(os.path.dirname(recipefile),
-                                    rd.getVar('BPN', True))
-            bb.utils.mkdirhier(patchdir)
+                _move_file(os.path.join(patches_dir, basepath), path)
+                updatefiles = True
+            # Add any new files
+            files_dir = os.path.join(os.path.dirname(recipefile),
+                                     rd.getVar('BPN', True))
+            for basepath, path in new_f.iteritems():
+                logger.info('Adding new file %s' % basepath)
+                _move_file(os.path.join(local_files_dir, basepath),
+                           os.path.join(files_dir, basepath))
+                srcuri.append('file://%s' % basepath)
+                updaterecipe = True
             for basepath, path in new_p.iteritems():
                 logger.info('Adding new patch %s' % basepath)
-                bb.utils.mkdirhier(patchdir)
-                shutil.move(os.path.join(tempdir, basepath),
-                            os.path.join(patchdir, basepath))
+                _move_file(os.path.join(patches_dir, basepath),
+                           os.path.join(files_dir, basepath))
                 srcuri.append('file://%s' % basepath)
                 updaterecipe = True
-            if removepatches:
-                removedentries, _ = _remove_patch_entries(srcuri, removepatches)
-                if removedentries:
-                    updaterecipe = True
+            # Update recipe, if needed
+            if _remove_file_entries(srcuri, remove_files)[0]:
+                updaterecipe = True
             if updaterecipe:
                 logger.info('Updating recipe %s' % os.path.basename(recipefile))
                 oe.recipeutils.patch_recipe(rd, recipefile,
                                             {'SRC_URI': ' '.join(srcuri)})
-            elif not updatepatches:
+            elif not updatefiles:
                 # Neither patches nor recipe were updated
-                logger.info('No patches need updating')
+                logger.info('No patches or files need updating')
     finally:
         shutil.rmtree(tempdir)
 
-    _remove_patch_files(args, removepatches, destpath)
+    _remove_source_files(args, remove_files, destpath)
 
 def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
-- 
2.1.4


