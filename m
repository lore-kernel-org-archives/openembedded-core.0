Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED5687725C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 11:35:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 04:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,510,1464678000"; d="scan'208";a="1039970250"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 12 Aug 2016 04:35:56 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 14:35:54 +0300
Message-Id: <1471001754-20753-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1471001754-20753-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1471001754-20753-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2] oeqa.buildperf: use oe.path.remove()
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
X-List-Received-Date: Fri, 12 Aug 2016 11:35:57 -0000

Drop the self-baked force_rm() method.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py       | 15 ++++-----------
 meta/lib/oeqa/buildperf/test_basic.py |  5 +++--
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index af169e1..e1b196e 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -23,6 +23,7 @@ import unittest
 from datetime import datetime, timedelta
 from functools import partial
 
+import oe.path
 from oeqa.utils.commands import CommandError, runCmd, get_bb_vars
 from oeqa.utils.git import GitError, GitRepo
 
@@ -293,29 +294,21 @@ class BuildPerfTestCase(unittest.TestCase):
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
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index b8bec6d..9310f3d 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -13,6 +13,7 @@
 import os
 import shutil
 
+import oe.path
 from oeqa.buildperf import BuildPerfTestCase
 from oeqa.utils.commands import get_bb_vars
 
@@ -85,11 +86,11 @@ class Test3(BuildPerfTestCase):
         """Parsing time metrics (bitbake -p)"""
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


