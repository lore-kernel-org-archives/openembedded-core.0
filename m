Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47B1273DA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 09:16:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2015 02:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="487591088"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2015 02:16:19 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 12:16:10 +0300
Message-Id: <1430385372-6975-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] devtool: update-recipe: update local files directly
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

Source files that are directly referenced in the SRC_URI are imported
into srctree (with devtool extract) in the case S=WORKDIR. If these
files are local (i.e. they reside in the "recipe space" and not behind a
remote URL) we don't want create a patch against them, but, rather copy
our modified version over the original source.

NOTE: if new files are created, they are represented as patches, rather
than copied over the orignal source.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 48 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4b4a0a0..8a2783b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -146,6 +146,16 @@ def _parse_recipe(config, tinfoil, pn, appends):
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
@@ -514,6 +524,35 @@ def update_recipe(args, config, basepath, workspace):
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
+        for fname in _ls_tree(local_src_dir):
+            logger.info('Updating file %s' % fname)
+            shutil.copy2(os.path.join(local_src_dir, fname),
+                         local_files[fname])
+    finally:
+        shutil.rmtree(tempdir)
+
+    # Update recipe and patches
     if mode == 'srcrev':
         logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
         patchfields = {}
@@ -526,7 +565,8 @@ def update_recipe(args, config, basepath, workspace):
             tempdir = tempfile.mkdtemp(prefix='devtool')
             removepatches = []
             try:
-                GitApplyTree.extractPatches(srctree, old_srcrev, tempdir)
+                GitApplyTree.extractPatches(srctree, old_srcrev, tempdir,
+                                            patch_include_paths)
                 newpatches = os.listdir(tempdir)
                 for patch in existing_patches:
                     patchfile = os.path.basename(patch)
@@ -581,7 +621,8 @@ def update_recipe(args, config, basepath, workspace):
             # Get all patches from source tree and check if any should be removed
             tempdir = tempfile.mkdtemp(prefix='devtool')
             try:
-                GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
+                GitApplyTree.extractPatches(srctree, initial_rev, tempdir,
+                                            patch_include_paths)
                 newpatches = os.listdir(tempdir)
                 for patch in existing_patches:
                     patchfile = os.path.basename(patch)
@@ -593,7 +634,8 @@ def update_recipe(args, config, basepath, workspace):
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


