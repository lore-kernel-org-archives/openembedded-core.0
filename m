Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6530F731B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:40:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 00:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,445,1444719600"; d="scan'208";a="843854152"
Received: from lleszczu-mobl.igk.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.252.17.67])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 00:39:50 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 10:39:43 +0200
Message-Id: <1450427985-12504-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/5] devtool: extract: cleanup srctree
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
X-List-Received-Date: Fri, 18 Dec 2015 08:40:18 -0000

Some bitbake tasks, notably do_kernel_metadata et al. dirty the
sourcetree. Run git clean in order to get rid of the confusing and
possibly outdated extra files.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 43fce11..f817671 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -458,10 +458,21 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
         if bb.data.inherits_class('kernel-yocto', d):
-            # Store generate and store kernel config
             logger.info('Generating kernel config')
             task_executor.exec_func('do_configure', False)
             kconfig = os.path.join(crd.getVar('B', True), '.config')
+        else:
+            kconfig = None
+
+        # Clean source tree in case it has been dirtied by some bitbake task
+        stdout, _ = bb.process.run('git status --porcelain --ignored',
+                                   cwd=srcsubdir)
+        if stdout:
+            logger.info('Source tree is dirty, cleaning up')
+            bb.process.run('git clean -fdx', cwd=srcsubdir)
+
+        if kconfig:
+            # Store kernel config in srctree
             shutil.copy2(kconfig, srcsubdir)
 
 
-- 
2.1.4


