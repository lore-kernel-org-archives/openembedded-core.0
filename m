Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22F37757A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:51:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 07:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663514"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:46 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:31 +0300
Message-Id: <1433343032-4559-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 6/7] devtool: extract: always import local files to srctree
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

Import all non-compressed/non-arcived non-remote source files (i.e.
local files from the SRC_URI) - excluding patches - to the srctree
repository. The files will be placed in a subdirectory called
'local-files'. However, in case S=WORKDIR, the files are imported into
root ot srctree (and not under 'local-files'), just like before.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 46 +++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 58 ++++++++++++++++++++++++++++++---------
 2 files changed, 91 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 6aaf5a5..c1623c2 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -716,6 +716,52 @@ class DevtoolTests(DevtoolBase):
                 raise AssertionError('Unexpected modified file in status: %s' %
                                      line)
 
+    def test_devtool_update_recipe_local_files_2(self):
+        """Check handling of local source files for recipes where
+        S != WORKDIR"""
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
+        # Edit / commit local source
+        runCmd('echo "# New comment" >> local-files/acinclude.m4', cwd=tempdir)
+        runCmd('git commit -am "Edit existing file"', cwd=tempdir)
+        runCmd('echo "Foo" > local-files/new-local', cwd=tempdir)
+        runCmd('git add local-files/new-local', cwd=tempdir)
+        runCmd('git commit -m "Add new local file"', cwd=tempdir)
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
+            if line.endswith('acinclude.m4'):
+                self.assertEqual(line[:3], ' M ',
+                                 'Unexpected status in line: %s' % line)
+            elif line.endswith('Add-new-file.patch'):
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
index 75cc495..44948fd 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -303,10 +303,11 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         logger.info('Unpacking...')
         exec_task_func('do_unpack', False)
         srcsubdir = crd.getVar('S', True)
+
+        recipe_patches = [os.path.basename(patch) for patch in
+                          oe.recipeutils.get_recipe_patches(crd)]
         if srcsubdir == workdir:
             # Find non-patch sources that were "unpacked" to srctree directory
-            recipe_patches = [os.path.basename(patch) for patch in
-                              oe.recipeutils.get_recipe_patches(crd)]
             src_files = [fname for fname in _ls_tree(workdir) if
                          os.path.basename(fname) not in recipe_patches]
             # Force separate S so that patch files can be left out from srctree
@@ -357,6 +358,23 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
         bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
 
+        # Add unpacked local files (in case of S=WORKDIR these were already
+        # moved to S) into srctree
+        local_files = oe.recipeutils.get_recipe_local_files(crd)
+        local_files = [fname for fname in local_files if
+                        os.path.basename(fname) not in recipe_patches and
+                        os.path.exists(os.path.join(workdir, fname))]
+        if local_files:
+            logger.info('Adding local files...')
+            for fname in local_files:
+                localf_subdir = os.path.join(srcsubdir, 'local-files',
+                                             os.path.dirname(fname))
+                bb.utils.mkdirhier(localf_subdir)
+                shutil.move(os.path.join(workdir, fname), localf_subdir)
+            bb.process.run(['git', 'add', 'local-files'], cwd=srcsubdir)
+            bb.process.run(['git', 'commit', '-q', '-m', 'Add local files'],
+                            cwd=srcsubdir)
+
         if os.path.exists(patchdir):
             shutil.rmtree(patchdir)
             if haspatches:
@@ -595,17 +613,31 @@ def update_recipe(args, config, basepath, workspace):
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
         # Copy local files from srctree HEAD to "recipe space"
-        # Local files might be "all over the place", need recursive ls-tree
-        git_files = set(_git_ls_tree(srctree, recursive=True))
-        copy_files = git_files.intersection(set(local_files.keys()))
-        patch_include_paths = git_files.difference(set(local_files.keys()))
-        bb.process.run(['git', 'checkout', 'HEAD', '--'] + list(copy_files),
-                        cwd=srctree,
-                        env=dict(os.environ, GIT_WORK_TREE=tempdir))
-        for fname in _ls_tree(tempdir):
-            logger.info('Updating file %s' % fname)
-            shutil.copy2(os.path.join(tempdir, fname),
-                         local_files[fname])
+        if os.path.isdir(os.path.join(srctree, 'local-files')):
+            # Local files are in 'local-files' only list root of git repo
+            git_files = set(_git_ls_tree(srctree))
+            patch_include_paths = git_files.difference(set(['local-files']))
+            bb.process.run(['git', 'checkout', 'HEAD', '--', 'local-files'],
+                            cwd=srctree,
+                            env=dict(os.environ, GIT_WORK_TREE=tempdir))
+            local_src_dir = os.path.join(tempdir, 'local-files')
+        else:
+            # Local files might be "all over the place", need recursive ls-tree
+            git_files = set(_git_ls_tree(srctree, recursive=True))
+            copy_files = git_files.intersection(set(local_files.keys()))
+            patch_include_paths = git_files.difference(set(local_files.keys()))
+            bb.process.run(['git', 'checkout', 'HEAD', '--'] + list(copy_files),
+                            cwd=srctree,
+                            env=dict(os.environ, GIT_WORK_TREE=tempdir))
+            local_src_dir = tempdir
+
+        for fname in _ls_tree(local_src_dir):
+            if fname in local_files:
+                logger.info('Updating file %s' % fname)
+                shutil.copy2(os.path.join(local_src_dir, fname),
+                             local_files[fname])
+            else:
+                logger.warning('File %s not in SRC_URI, skipping it' % fname)
     finally:
         shutil.rmtree(tempdir)
 
-- 
2.1.4


