Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C731757A0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:50:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 07:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663502"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:44 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:30 +0300
Message-Id: <1433343032-4559-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 5/7] devtool: update-recipe: update local files directly
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
X-List-Received-Date: Wed, 03 Jun 2015 14:51:00 -0000

Non-remote source files (i.e. SRC_URI files that use the file:// URI
prefix and thus reside in the "recipe space" in the local copy of the
metadata) are imported into srctree (with devtool extract) in the case
S=WORKDIR. If these files are local (i.e. they reside in the "recipe
space" and not behind a remote URL) we don't want create a patch against
them, but, rather copy our modified version over the original source.

NOTE: if new files are created, they are represented as patches, rather
than copied over the orignal source.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 44 +++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 48 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 08ed2eb..6aaf5a5 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -672,6 +672,50 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
 
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
+        runCmd('echo "/* New comment */" >> makedevs.c', cwd=tempdir)
+        runCmd('git commit -am "My change"', cwd=tempdir)
+        runCmd('echo "Foo" > new-file', cwd=tempdir)
+        runCmd('git add new-file', cwd=tempdir)
+        runCmd('git commit -m "Add new file"', cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
+                                     os.path.dirname(recipefile))
+        runCmd('devtool update-recipe %s' % testrecipe)
+        result = runCmd('git status . --porcelain',
+                        cwd=os.path.dirname(recipefile))
+        status = result.output.splitlines()
+        self.assertEqual(len(status), 3,
+                         'Less/more files modified than expected. '
+                         'Entire status:\n%s' % result.output)
+        for line in status:
+            if line.endswith('makedevs.c'):
+                self.assertEqual(line[:3], ' M ',
+                                 'Unexpected status in line: %s' % line)
+            elif line.endswith('0001-Add-new-file.patch'):
+                self.assertEqual(line[:3], '?? ',
+                                 'Unexpected status in line: %s' % line)
+            elif re.search('%s_[^_]*.bb$' % testrecipe, line):
+                self.assertEqual(line[:3], ' M ',
+                                 'Unexpected status in line: %s' % line)
+            else:
+                raise AssertionError('Unexpected modified file in status: %s' %
+                                     line)
+
     def test_devtool_extract(self):
         workspacedir = self._get_workspace_dir()
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c5b32d8..75cc495 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -187,6 +187,16 @@ def _parse_recipe(config, tinfoil, pn, appends):
                                        tinfoil.config_data)
 
 
+def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
+    """List contents of a git treeish"""
+    import bb
+    cmd = ['git', 'ls-tree', '-z', 'HEAD']
+    if recursive:
+        cmd.append('-r')
+    out, _ = bb.process.run(cmd, cwd=repodir)
+    return [line.split(None, 4)[3] for line in out.split('\0') if line]
+
+
 def _ls_tree(directory):
     """Recursive listing of files in a directory"""
     ret = []
@@ -571,6 +581,35 @@ def update_recipe(args, config, basepath, workspace):
         logger.error('Invalid hash returned by git: %s' % stdout)
         return 1
 
+    # Find out local files (SRC_URI files that exist in the "recipe space").
+    # Local files that reside in srctree are not included in patch generation.
+    # Instead they are directly copied over the original source files (in
+    # recipe space).
+    #
+    # NOTE: "Filtering out" of local files in this way is not entirely reliable
+    # - we don't catch files that are deleted, for example. A more reliable way
+    # to implement this would be to use "negative pathspecs" which were
+    # introduced in Git v1.9.0.  Revisit this when/if the required Git version
+    # becomes greater than that.
+    local_files = oe.recipeutils.get_recipe_local_files(rd)
+    tempdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        # Copy local files from srctree HEAD to "recipe space"
+        # Local files might be "all over the place", need recursive ls-tree
+        git_files = set(_git_ls_tree(srctree, recursive=True))
+        copy_files = git_files.intersection(set(local_files.keys()))
+        patch_include_paths = git_files.difference(set(local_files.keys()))
+        bb.process.run(['git', 'checkout', 'HEAD', '--'] + list(copy_files),
+                        cwd=srctree,
+                        env=dict(os.environ, GIT_WORK_TREE=tempdir))
+        for fname in _ls_tree(tempdir):
+            logger.info('Updating file %s' % fname)
+            shutil.copy2(os.path.join(tempdir, fname),
+                         local_files[fname])
+    finally:
+        shutil.rmtree(tempdir)
+
+    # Update recipe and patches
     removepatches = []
     destpath = None
     if mode == 'srcrev':
@@ -585,7 +624,8 @@ def update_recipe(args, config, basepath, workspace):
             old_srcrev = (rd.getVar('SRCREV', False) or '')
             tempdir = tempfile.mkdtemp(prefix='devtool')
             try:
-                GitApplyTree.extractPatches(srctree, old_srcrev, tempdir)
+                GitApplyTree.extractPatches(srctree, old_srcrev, tempdir,
+                                            patch_include_paths)
                 newpatches = os.listdir(tempdir)
                 for patch in existing_patches:
                     patchfile = os.path.basename(patch)
@@ -645,7 +685,8 @@ def update_recipe(args, config, basepath, workspace):
             # Get all patches from source tree and check if any should be removed
             tempdir = tempfile.mkdtemp(prefix='devtool')
             try:
-                GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
+                GitApplyTree.extractPatches(srctree, initial_rev, tempdir,
+                                            patch_include_paths)
                 newpatches = os.listdir(tempdir)
                 for patch in existing_patches:
                     # If it's a git sequence named patch, the numbers might not match up
@@ -667,7 +708,8 @@ def update_recipe(args, config, basepath, workspace):
         # Get updated patches from source tree
         tempdir = tempfile.mkdtemp(prefix='devtool')
         try:
-            GitApplyTree.extractPatches(srctree, update_rev, tempdir)
+            GitApplyTree.extractPatches(srctree, update_rev, tempdir,
+                                        patch_include_paths)
 
             # Match up and replace existing patches with corresponding new patches
             updatepatches = False
-- 
2.1.4


