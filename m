Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 34F7D6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:43:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2016 13:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,337,1455004800"; d="scan'208";a="764036144"
Received: from mtandon-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.55])
	by orsmga003.jf.intel.com with ESMTP; 14 Mar 2016 13:43:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 09:43:05 +1300
Message-Id: <9f1eb07236d23ea550e34f5c8791817d71245bff.1457988127.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457988127.git.paul.eggleton@linux.intel.com>
References: <cover.1457988127.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457988127.git.paul.eggleton@linux.intel.com>
References: <cover.1457988127.git.paul.eggleton@linux.intel.com>
Subject: [jethro][PATCH 1/2] devtool: extract: copy kernel config to srctree
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
X-List-Received-Date: Mon, 14 Mar 2016 20:43:37 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

This makes the correct kernel config to be used when building kernel
from srctree (extrernalsrc). If no kernel config is present in the
builddir 'do_configure' task copies .config from the srctree.

(From OE-Core master rev: 3b516332e038a587685f6e0c14a7f04990bdd6cc)

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5464d7b..c1fbfe3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -430,11 +430,12 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             if haspatches:
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
-        # Move oe-local-files directory to srctree
-        if os.path.exists(os.path.join(tempdir, 'oe-local-files')):
-            logger.info('Adding local source files to srctree...')
-            shutil.move(os.path.join(tempdir, 'oe-local-files'), srcsubdir)
-
+        if bb.data.inherits_class('kernel-yocto', d):
+            # Store generate and store kernel config
+            logger.info('Generating kernel config')
+            task_executor.exec_func('do_configure', False)
+            kconfig = os.path.join(d.getVar('B', True), '.config')
+            shutil.copy2(kconfig, srcsubdir)
 
         shutil.move(srcsubdir, srctree)
     finally:
-- 
2.5.0


