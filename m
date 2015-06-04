Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A063E75803
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:32:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 09:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,553,1427785200"; d="scan'208";a="705387115"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2015 09:32:02 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 19:31:46 +0300
Message-Id: <1433435514-28677-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 02/10] devtool: refactor bb task execution into a separate class
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
X-List-Received-Date: Thu, 04 Jun 2015 16:32:04 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 50 ++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1e99413..aed76ea 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -213,6 +213,32 @@ def extract(args, config, basepath, workspace):
     else:
         return -1
 
+class BbTaskExecutor(object):
+    """Class for executing bitbake tasks for a recipe
+
+    FIXME: This is very awkward. Unfortunately it's not currently easy to
+    properly execute tasks outside of bitbake itself, until then this has to
+    suffice if we are to handle e.g. linux-yocto's extra tasks
+    """
+
+    def __init__(self, rdata):
+        self.rdata = rdata
+        self.executed = []
+
+    def exec_func(self, func, report):
+        """Run bitbake task function"""
+        if not func in self.executed:
+            deps = self.rdata.getVarFlag(func, 'deps')
+            if deps:
+                for taskdepfunc in deps:
+                    self.exec_func(taskdepfunc, True)
+            if report:
+                logger.info('Executing %s...' % func)
+            fn = self.rdata.getVar('FILE', True)
+            localdata = bb.build._task_data(fn, func, self.rdata)
+            bb.build.exec_func(func, localdata)
+            self.executed.append(func)
+
 
 def _extract_source(srctree, keep_temp, devbranch, d):
     """Extract sources of a recipe"""
@@ -270,28 +296,12 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             # We don't want to move the source to STAGING_KERNEL_DIR here
             crd.setVar('STAGING_KERNEL_DIR', '${S}')
 
-        # FIXME: This is very awkward. Unfortunately it's not currently easy to properly
-        # execute tasks outside of bitbake itself, until then this has to suffice if we
-        # are to handle e.g. linux-yocto's extra tasks
-        executed = []
-        def exec_task_func(func, report):
-            """Run specific bitbake task for a recipe"""
-            if not func in executed:
-                deps = crd.getVarFlag(func, 'deps')
-                if deps:
-                    for taskdepfunc in deps:
-                        exec_task_func(taskdepfunc, True)
-                if report:
-                    logger.info('Executing %s...' % func)
-                fn = d.getVar('FILE', True)
-                localdata = bb.build._task_data(fn, func, crd)
-                bb.build.exec_func(func, localdata)
-                executed.append(func)
+        task_executor = BbTaskExecutor(crd)
 
         logger.info('Fetching %s...' % pn)
-        exec_task_func('do_fetch', False)
+        task_executor.exec_func('do_fetch', False)
         logger.info('Unpacking...')
-        exec_task_func('do_unpack', False)
+        task_executor.exec_func('do_unpack', False)
         srcsubdir = crd.getVar('S', True)
         if srcsubdir == workdir:
             # Find non-patch sources that were "unpacked" to srctree directory
@@ -343,7 +353,7 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             crd.setVar('PATCHTOOL', 'git')
 
         logger.info('Patching...')
-        exec_task_func('do_patch', False)
+        task_executor.exec_func('do_patch', False)
 
         bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
 
-- 
2.1.4


