Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3CED6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 13:54:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Dec 2015 05:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="853118354"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2015 05:54:27 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 15:54:24 +0200
Message-Id: <1449150865-7496-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449150865-7496-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1449150865-7496-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] devtool: extract: copy kernel config to srctree
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
X-List-Received-Date: Thu, 03 Dec 2015 13:54:43 -0000

This makes the correct kernel config to be used when building kernel
from srctree (extrernalsrc). If no kernel config is present in the
builddir 'do_configure' task copies .config from the srctree.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 68d6eb9..a4f3da4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -457,6 +457,14 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
             if haspatches:
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
+        if bb.data.inherits_class('kernel-yocto', d):
+            # Store generate and store kernel config
+            logger.info('Generating kernel config')
+            task_executor.exec_func('do_configure', False)
+            kconfig = os.path.join(d.getVar('B', True), '.config')
+            shutil.copy2(kconfig, srcsubdir)
+
+
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
 
-- 
2.1.4


