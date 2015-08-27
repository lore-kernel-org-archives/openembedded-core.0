Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D764275794
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:49:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 04:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="549519152"
Received: from njackson-mobl1.amr.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.25.89])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2015 04:49:54 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 14:49:49 +0300
Message-Id: <1440676190-2167-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] devtool: extract: correct initial rev for kernel packages
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
X-List-Received-Date: Thu, 27 Aug 2015 11:49:55 -0000

Change handling of kernel packages so that the "initial rev" is parsed
correctly. Also, the devtool-specific git tags (devtool-base and
devtoo-patched) are now generated for kernel packages as well.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 00d0b2c..3725d87 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -300,6 +300,10 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         task_executor.exec_func('do_fetch', False)
         logger.info('Unpacking...')
         task_executor.exec_func('do_unpack', False)
+        if bb.data.inherits_class('kernel-yocto', d):
+            # Extra step for kernel to populate the source directory
+            logger.info('Doing kernel checkout...')
+            task_executor.exec_func('do_kernel_checkout', False)
         srcsubdir = crd.getVar('S', True)
         if srcsubdir == workdir:
             # Find non-patch sources that were "unpacked" to srctree directory
@@ -329,26 +333,21 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             else:
                 os.rmdir(patchdir)
 
-        if bb.data.inherits_class('kernel-yocto', d):
-            (stdout, _) = bb.process.run('git --git-dir="%s" rev-parse HEAD' % crd.expand('${WORKDIR}/git'), cwd=srcsubdir)
-            initial_rev = stdout.rstrip()
-        else:
-            if not os.listdir(srcsubdir):
-                raise DevtoolError("no source unpacked to S, perhaps the %s "
-                                   "recipe doesn't use any source?" % pn)
+        if not os.listdir(srcsubdir):
+            raise DevtoolError("no source unpacked to S, perhaps the %s "
+                               "recipe doesn't use any source?" % pn)
 
-            if not os.path.exists(os.path.join(srcsubdir, '.git')):
-                bb.process.run('git init', cwd=srcsubdir)
-                bb.process.run('git add .', cwd=srcsubdir)
-                bb.process.run('git commit -q -m "Initial commit from upstream at version %s"' % crd.getVar('PV', True), cwd=srcsubdir)
+        if not os.path.exists(os.path.join(srcsubdir, '.git')):
+            bb.process.run('git init', cwd=srcsubdir)
+            bb.process.run('git add .', cwd=srcsubdir)
+            bb.process.run('git commit -q -m "Initial commit from upstream at version %s"' % crd.getVar('PV', True), cwd=srcsubdir)
 
-            (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
-            initial_rev = stdout.rstrip()
-
-            bb.process.run('git checkout -b %s' % devbranch, cwd=srcsubdir)
-            bb.process.run('git tag -f devtool-base', cwd=srcsubdir)
+        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
+        initial_rev = stdout.rstrip()
 
-            crd.setVar('PATCHTOOL', 'git')
+        bb.process.run('git checkout -b %s' % devbranch, cwd=srcsubdir)
+        bb.process.run('git tag -f devtool-base', cwd=srcsubdir)
+        crd.setVar('PATCHTOOL', 'git')
 
         logger.info('Patching...')
         task_executor.exec_func('do_patch', False)
-- 
2.1.4


