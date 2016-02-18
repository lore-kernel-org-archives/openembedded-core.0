Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DA2C0731DD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 14:18:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 18 Feb 2016 06:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,465,1449561600"; d="scan'208";a="918493632"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2016 06:18:57 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 16:18:54 +0200
Message-Id: <1455805135-20814-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1455805135-20814-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1455805135-20814-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 1/2] devtool: sync: update kernel config
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
X-List-Received-Date: Thu, 18 Feb 2016 14:18:57 -0000

Copy kernel config is copied to the source directory at a later phase in
_extract_source() so that it gets copied when devtool sync is done, too.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d12cc2e..a540a9b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -577,12 +577,12 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
 
         bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
 
+        kconfig = None
         if bb.data.inherits_class('kernel-yocto', d):
             # Store generate and store kernel config
             logger.info('Generating kernel config')
             task_executor.exec_func('do_configure', False)
             kconfig = os.path.join(crd.getVar('B', True), '.config')
-            shutil.copy2(kconfig, srcsubdir)
 
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
@@ -614,6 +614,10 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
 
             shutil.move(srcsubdir, srctree)
 
+        if kconfig:
+            logger.info('Copying kernel config to srctree')
+            shutil.copy2(kconfig, srctree)
+
     finally:
         bb.logger.setLevel(origlevel)
 
-- 
2.6.2


