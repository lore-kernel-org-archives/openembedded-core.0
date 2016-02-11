Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 712437002B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900462011"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:28 +1300
Message-Id: <e2d166d598ecb71397e3626551a38c250c498e95.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/11] devtool: commit for extra tasks that modify source when extracting
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:17 -0000

When extracting source for a recipe, if there are additional custom
tasks run that make changes to the source, create a commit in the
generated git branch so they are contained. This is particularly
useful for tasks that come before do_patch since otherwise the changes
might get incorporated in the first applied patch, but otherwise it
helps avoid the tree being dirty at any point.

Fixes [YOCTO #7626].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py            |  3 +++
 scripts/lib/devtool/standard.py | 48 ++++++++++++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 4e77168..2464efd 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -264,6 +264,7 @@ class PatchTree(PatchSet):
 
 class GitApplyTree(PatchTree):
     patch_line_prefix = '%% original patch'
+    ignore_commit_prefix = '%% ignore'
 
     def __init__(self, dir, d):
         PatchTree.__init__(self, dir, d)
@@ -384,6 +385,8 @@ class GitApplyTree(PatchTree):
                             if line.startswith(GitApplyTree.patch_line_prefix):
                                 outfile = line.split()[-1].strip()
                                 continue
+                            if line.startswith(GitApplyTree.ignore_commit_prefix):
+                                continue
                             patchlines.append(line)
                     if not outfile:
                         outfile = os.path.basename(srcfile)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 390d98f..262ba09 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -393,6 +393,38 @@ class BbTaskExecutor(object):
             self.executed.append(func)
 
 
+class PatchTaskExecutor(BbTaskExecutor):
+    def __init__(self, rdata):
+        self.check_git = False
+        super(PatchTaskExecutor, self).__init__(rdata)
+
+    def exec_func(self, func, report):
+        from oe.patch import GitApplyTree
+        srcsubdir = self.rdata.getVar('S', True)
+        haspatches = False
+        if func == 'do_patch':
+            patchdir = os.path.join(srcsubdir, 'patches')
+            if os.path.exists(patchdir):
+                if os.listdir(patchdir):
+                    haspatches = True
+                else:
+                    os.rmdir(patchdir)
+
+        super(PatchTaskExecutor, self).exec_func(func, report)
+        if self.check_git and os.path.exists(srcsubdir):
+            if func == 'do_patch':
+                if os.path.exists(patchdir):
+                    shutil.rmtree(patchdir)
+                    if haspatches:
+                        stdout, _ = bb.process.run('git status --porcelain patches', cwd=srcsubdir)
+                        if stdout:
+                            bb.process.run('git checkout patches', cwd=srcsubdir)
+
+            stdout, _ = bb.process.run('git status --porcelain', cwd=srcsubdir)
+            if stdout:
+                bb.process.run('git add .; git commit -a -m "Committing changes from %s\n\n%s"' % (func, GitApplyTree.ignore_commit_prefix + ' - from %s' % func), cwd=srcsubdir)
+
+
 def _prep_extract_operation(config, basepath, recipename):
     """HACK: Ugly workaround for making sure that requirements are met when
        trying to extract a package. Returns the tinfoil instance to be used."""
@@ -477,7 +509,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             # We don't want to move the source to STAGING_KERNEL_DIR here
             crd.setVar('STAGING_KERNEL_DIR', '${S}')
 
-        task_executor = BbTaskExecutor(crd)
+        task_executor = PatchTaskExecutor(crd)
 
         crd.setVar('EXTERNALSRC_forcevariable', '')
 
@@ -491,6 +523,8 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             task_executor.exec_func('do_kernel_checkout', False)
         srcsubdir = crd.getVar('S', True)
 
+        task_executor.check_git = True
+
         # Move local source files into separate subdir
         recipe_patches = [os.path.basename(patch) for patch in
                           oe.recipeutils.get_recipe_patches(crd)]
@@ -524,13 +558,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
 
         scriptutils.git_convert_standalone_clone(srcsubdir)
 
-        patchdir = os.path.join(srcsubdir, 'patches')
-        haspatches = False
-        if os.path.exists(patchdir):
-            if os.listdir(patchdir):
-                haspatches = True
-            else:
-                os.rmdir(patchdir)
         # Make sure that srcsubdir exists
         bb.utils.mkdirhier(srcsubdir)
         if not os.path.exists(srcsubdir) or not os.listdir(srcsubdir):
@@ -550,11 +577,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
 
         bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
 
-        if os.path.exists(patchdir):
-            shutil.rmtree(patchdir)
-            if haspatches:
-                bb.process.run('git checkout patches', cwd=srcsubdir)
-
         if bb.data.inherits_class('kernel-yocto', d):
             # Store generate and store kernel config
             logger.info('Generating kernel config')
-- 
2.5.0


