Return-Path: <jiajie.hu@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C480B71A6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:58:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 28 Nov 2016 18:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,714,1473145200"; d="scan'208";a="1074826063"
Received: from jiajiehu.sh.intel.com ([10.239.160.136])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2016 18:58:28 -0800
From: Jiajie Hu <jiajie.hu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 10:59:09 +0800
Message-Id: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] devtool: execute associated functions while preparing the source tree
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
X-List-Received-Date: Tue, 29 Nov 2016 02:58:29 -0000

Execute prefuncs and postfuncs associated with the task while preparing
the source tree. If any changes are made to the source tree by these
prefuncs or postfuncs, a separate commit will be created so that the
changes won't get incorporated with other patches.

Signed-off-by: Jiajie Hu <jiajie.hu@intel.com>
---
 scripts/lib/devtool/standard.py | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e4d2a57..8302112 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -424,8 +424,7 @@ class BbTaskExecutor(object):
         self.rdata = rdata
         self.executed = []
 
-    def exec_func(self, func, report):
-        """Run bitbake task function"""
+    def _exec_func(self, func, report):
         if not func in self.executed:
             deps = self.rdata.getVarFlag(func, 'deps', False)
             if deps:
@@ -435,12 +434,25 @@ class BbTaskExecutor(object):
                 logger.info('Executing %s...' % func)
             fn = self.rdata.getVar('FILE', True)
             localdata = bb.build._task_data(fn, func, self.rdata)
+            prefuncs = localdata.getVarFlag(func, 'prefuncs', True)
+            postfuncs = localdata.getVarFlag(func, 'postfuncs', True)
             try:
+                for prefunc in (prefuncs or '').split():
+                    bb.build.exec_func(prefunc, localdata)
+                    yield prefunc
                 bb.build.exec_func(func, localdata)
+                for postfunc in (postfuncs or '').split():
+                    bb.build.exec_func(postfunc, localdata)
+                    yield postfunc
             except bb.build.FuncFailed as e:
                 raise DevtoolError(str(e))
             self.executed.append(func)
 
+    def exec_func(self, func, report):
+        """Run bitbake task function"""
+        for step in self._exec_func(func, report):
+            pass
+
 
 class PatchTaskExecutor(BbTaskExecutor):
     def __init__(self, rdata):
@@ -462,7 +474,12 @@ class PatchTaskExecutor(BbTaskExecutor):
                 else:
                     os.rmdir(patchdir)
 
-        super(PatchTaskExecutor, self).exec_func(func, report)
+        for step in super(PatchTaskExecutor, self)._exec_func(func, report):
+            if self.check_git and os.path.exists(srcsubdir):
+                stdout, _ = bb.process.run('git status --porcelain', cwd=srcsubdir)
+                if stdout:
+                    bb.process.run('git add .; git %s commit -a -m "Committing changes from %s\n\n%s"' % (' '.join(self.useroptions), step, GitApplyTree.ignore_commit_prefix + ' - from %s' % step), cwd=srcsubdir)
+
         if self.check_git and os.path.exists(srcsubdir):
             if func == 'do_patch':
                 if os.path.exists(patchdir):
-- 
1.9.1


