Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F1BD177236
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:31:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 11 Aug 2016 06:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,505,1464678000"; d="scan'208";a="747340875"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2016 06:31:54 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:31:52 +0300
Message-Id: <1470922312-28013-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] oeqa.buildperf: use oe.path.remove()
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
X-List-Received-Date: Thu, 11 Aug 2016 13:31:54 -0000

Drop the self-baked force_rm() method.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py        | 15 ++++-----------
 meta/lib/oeqa/buildperf/basic_tests.py |  5 +++--
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 527563b..2af4d25 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -21,6 +21,7 @@ import time
 import traceback
 from datetime import datetime, timedelta
 
+import oe.path
 from oeqa.utils.commands import runCmd, get_bb_vars
 from oeqa.utils.git import GitError, GitRepo
 
@@ -296,29 +297,21 @@ class BuildPerfTest(object):
         shutil.move(self.bb_vars['BUILDSTATS_BASE'],
                     os.path.join(self.out_dir, 'buildstats-' + self.name))
 
-    @staticmethod
-    def force_rm(path):
-        """Equivalent of 'rm -rf'"""
-        if os.path.isfile(path) or os.path.islink(path):
-            os.unlink(path)
-        elif os.path.isdir(path):
-            shutil.rmtree(path)
-
     def rm_tmp(self):
         """Cleanup temporary/intermediate files and directories"""
         log.debug("Removing temporary and cache files")
         for name in ['bitbake.lock', 'conf/sanity_info',
                      self.bb_vars['TMPDIR']]:
-            self.force_rm(name)
+            oe.path.remove(name, recurse=True)
 
     def rm_sstate(self):
         """Remove sstate directory"""
         log.debug("Removing sstate-cache")
-        self.force_rm(self.bb_vars['SSTATE_DIR'])
+        oe.path.remove(self.bb_vars['SSTATE_DIR'], recurse=True)
 
     def rm_cache(self):
         """Drop bitbake caches"""
-        self.force_rm(self.bb_vars['PERSISTENT_DIR'])
+        oe.path.remove(self.bb_vars['PERSISTENT_DIR'], recurse=True)
 
     @staticmethod
     def sync():
diff --git a/meta/lib/oeqa/buildperf/basic_tests.py b/meta/lib/oeqa/buildperf/basic_tests.py
index ada5aba..81b2b5f 100644
--- a/meta/lib/oeqa/buildperf/basic_tests.py
+++ b/meta/lib/oeqa/buildperf/basic_tests.py
@@ -13,6 +13,7 @@
 import os
 import shutil
 
+import oe.path
 from . import BuildPerfTest, perf_test_case
 from oeqa.utils.commands import get_bb_vars
 
@@ -95,11 +96,11 @@ class Test3(BuildPerfTest):
     def _run(self):
         # Drop all caches and parse
         self.rm_cache()
-        self.force_rm(os.path.join(self.bb_vars['TMPDIR'], 'cache'))
+        oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'), True)
         self.measure_cmd_resources(['bitbake', '-p'], 'parse_1',
                                    'bitbake -p (no caches)')
         # Drop tmp/cache
-        self.force_rm(os.path.join(self.bb_vars['TMPDIR'], 'cache'))
+        oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'), True)
         self.measure_cmd_resources(['bitbake', '-p'], 'parse_2',
                                    'bitbake -p (no tmp/cache)')
         # Parse with fully cached data
-- 
2.6.6


