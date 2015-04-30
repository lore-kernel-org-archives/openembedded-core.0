Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47BBC73DA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 09:16:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2015 02:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="487591094"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2015 02:16:20 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 12:16:11 +0300
Message-Id: <1430385372-6975-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] devtool: extract: always import local files to srctree
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
X-List-Received-Date: Thu, 30 Apr 2015 09:16:21 -0000

Import all non-compressed/non-arcived local files from the SRC_URI
(excluding patches) to the srctree repository. The files will be placed
in 'local-files' subdirectory. However, in case S=WORKDIR, the files are
imported into root ot srctree (and not under 'local-files', as before.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 56 ++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8a2783b..1e81919 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -253,10 +253,11 @@ def _extract_source(srctree, keep_temp, devbranch, d):
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
@@ -312,6 +313,23 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
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
@@ -538,17 +556,31 @@ def update_recipe(args, config, basepath, workspace):
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
         for fname in _ls_tree(local_src_dir):
-            logger.info('Updating file %s' % fname)
-            shutil.copy2(os.path.join(local_src_dir, fname),
-                         local_files[fname])
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


