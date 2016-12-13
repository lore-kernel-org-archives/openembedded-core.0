Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 24A2A71B23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:12 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885828"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:38 +1300
Message-Id: <bcb7d8ddd6320048c1f6f09f584cbd964bbbda5e.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/14] classes/patch: move in logic to commit for additional tasks
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:12 -0000

If PATCHTOOL is "git", and PATCH_COMMIT_FUNCTIONS is set to "1", for
additional tasks between do_unpack and do_patch, make a git commit. This
logic was previously implemented in devtool itself, but it makes more
sense for it to be implemented in the patch class since that's where the
rest of the logic is for this (or in lib/oe/patch.py). It also makes
it possible for this to work with tinfoil2.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/patch.bbclass      | 69 +++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py | 37 +---------------------
 2 files changed, 70 insertions(+), 36 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 2c1f58c..7ebae28 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -10,6 +10,75 @@ PATCH_GIT_USER_EMAIL ?= "oe.patch@oe"
 
 inherit terminal
 
+python () {
+    if d.getVar('PATCHTOOL', True) == 'git' and d.getVar('PATCH_COMMIT_FUNCTIONS', True) == '1':
+        tasks = list(filter(lambda k: d.getVarFlag(k, "task", True), d.keys()))
+        extratasks = []
+        def follow_chain(task, endtask, chain=None):
+            if not chain:
+                chain = []
+            chain.append(task)
+            for othertask in tasks:
+                if othertask == task:
+                    continue
+                if task == endtask:
+                    for ctask in chain:
+                        if ctask not in extratasks:
+                            extratasks.append(ctask)
+                else:
+                    deps = d.getVarFlag(othertask, 'deps', False)
+                    if task in deps:
+                        follow_chain(othertask, endtask, chain)
+            chain.pop()
+        follow_chain('do_unpack', 'do_patch')
+        try:
+            extratasks.remove('do_unpack')
+        except ValueError:
+            # For some recipes do_unpack doesn't exist, ignore it
+            pass
+
+        d.appendVarFlag('do_patch', 'prefuncs', ' patch_task_patch_prefunc')
+        for task in extratasks:
+            d.appendVarFlag(task, 'postfuncs', ' patch_task_postfunc')
+}
+
+python patch_task_patch_prefunc() {
+    # Prefunc for do_patch
+    func = d.getVar('BB_RUNTASK', True)
+    srcsubdir = d.getVar('S', True)
+
+    patchdir = os.path.join(srcsubdir, 'patches')
+    if os.path.exists(patchdir):
+        if os.listdir(patchdir):
+            d.setVar('PATCH_HAS_PATCHES_DIR', '1')
+        else:
+            os.rmdir(patchdir)
+}
+
+python patch_task_postfunc() {
+    # Prefunc for task functions between do_unpack and do_patch
+    import oe.patch
+    import shutil
+    func = d.getVar('BB_RUNTASK', True)
+    srcsubdir = d.getVar('S', True)
+
+    if os.path.exists(srcsubdir):
+        if func == 'do_patch':
+            haspatches = (d.getVar('PATCH_HAS_PATCHES_DIR', True) == '1')
+            patchdir = os.path.join(srcsubdir, 'patches')
+            if os.path.exists(patchdir):
+                shutil.rmtree(patchdir)
+                if haspatches:
+                    stdout, _ = bb.process.run('git status --porcelain patches', cwd=srcsubdir)
+                    if stdout:
+                        bb.process.run('git checkout patches', cwd=srcsubdir)
+        stdout, _ = bb.process.run('git status --porcelain .', cwd=srcsubdir)
+        if stdout:
+            useroptions = []
+            oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+            bb.process.run('git add .; git %s commit -a -m "Committing changes from %s\n\n%s"' % (' '.join(useroptions), func, oe.patch.GitApplyTree.ignore_commit_prefix + ' - from %s' % func), cwd=srcsubdir)
+}
+
 def src_patches(d, all=False, expand=True):
     workdir = d.getVar('WORKDIR', True)
     fetch = bb.fetch2.Fetch([], d)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 87d3f5d..06c508c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -442,41 +442,6 @@ class BbTaskExecutor(object):
             self.executed.append(func)
 
 
-class PatchTaskExecutor(BbTaskExecutor):
-    def __init__(self, rdata):
-        import oe.patch
-        self.check_git = False
-        self.useroptions = []
-        oe.patch.GitApplyTree.gitCommandUserOptions(self.useroptions, d=rdata)
-        super(PatchTaskExecutor, self).__init__(rdata)
-
-    def exec_func(self, func, report):
-        from oe.patch import GitApplyTree
-        srcsubdir = self.rdata.getVar('S', True)
-        haspatches = False
-        if func == 'do_patch':
-            patchdir = os.path.join(srcsubdir, 'patches')
-            if os.path.exists(patchdir):
-                if os.listdir(patchdir):
-                    haspatches = True
-                else:
-                    os.rmdir(patchdir)
-
-        super(PatchTaskExecutor, self).exec_func(func, report)
-        if self.check_git and os.path.exists(srcsubdir):
-            if func == 'do_patch':
-                if os.path.exists(patchdir):
-                    shutil.rmtree(patchdir)
-                    if haspatches:
-                        stdout, _ = bb.process.run('git status --porcelain patches', cwd=srcsubdir)
-                        if stdout:
-                            bb.process.run('git checkout patches', cwd=srcsubdir)
-
-            stdout, _ = bb.process.run('git status --porcelain', cwd=srcsubdir)
-            if stdout:
-                bb.process.run('git add .; git %s commit -a -m "Committing changes from %s\n\n%s"' % (' '.join(self.useroptions), func, GitApplyTree.ignore_commit_prefix + ' - from %s' % func), cwd=srcsubdir)
-
-
 def _prep_extract_operation(config, basepath, recipename, tinfoil=None):
     """HACK: Ugly workaround for making sure that requirements are met when
        trying to extract a package. Returns the tinfoil instance to be used."""
@@ -563,7 +528,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             # We don't want to move the source to STAGING_KERNEL_DIR here
             crd.setVar('STAGING_KERNEL_DIR', '${S}')
 
-        task_executor = PatchTaskExecutor(crd)
+        task_executor = BbTaskExecutor(crd)
 
         crd.setVar('EXTERNALSRC_forcevariable', '')
 
-- 
2.5.5


