Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AB302781F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279860"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:58 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:44 -0500
Message-Id: <387ad1e9bb3f15defa9536ceeb93b6ed181db69c.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 29/30] oeqa/selftest/context: Enable support for threaded runs
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an option to specify how many threads will be used for
execution, default to 1.

If the thread_num are greater than 1 the OESelftestContextThreaded
will be used, this is due to compatibility reasons.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/context.py | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 697ea0b4933..e54c871596d 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -11,11 +11,12 @@ from shutil import copyfile
 import tempfile
 from random import choice
 
-import oeqa
+from argparse_oe import int_positive
 
-from oeqa.core.context import OETestContext, OETestContextExecutor
+import oeqa
+from oeqa.core.context import OETestContext, OETestContextExecutor 
 from oeqa.core.exception import OEQAPreRun
-
+from oeqa.core.threaded import OETestContextThreaded
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
 class OESelftestTestContext(OETestContext):
@@ -38,14 +39,19 @@ class OESelftestTestContext(OETestContext):
     def listTests(self, display_type, machine=None):
         return super(OESelftestTestContext, self).listTests(display_type)
 
+class OESelftestTestContextThreaded(OESelftestTestContext, OETestContextThreaded):
+    pass
+
 class OESelftestTestContextExecutor(OETestContextExecutor):
-    _context_class = OESelftestTestContext
+    _context_class = OESelftestTestContextThreaded
     _script_executor = 'oe-selftest'
 
     name = 'oe-selftest'
     help = 'oe-selftest test component'
     description = 'Executes selftest tests'
 
+    DEFAULT_THREADS = 1
+
     def register_commands(self, logger, parser):
         group = parser.add_mutually_exclusive_group(required=True)
 
@@ -66,6 +72,11 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 action="store_true", default=False,
                 help='List all available tests.')
 
+        parser.add_argument('-t', '--thread-num', required=False, action='store',
+                dest="thread_num", default=self.DEFAULT_THREADS, type=int_positive,
+                help='Number of threads to use for execute selftests,'\
+                       ' default: %d' % self.DEFAULT_THREADS)
+
         parser.add_argument('--machine', required=False, choices=['random', 'all'],
                             help='Run tests on different machines (random/all).')
         
@@ -137,6 +148,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc_kwargs['init']['config_paths']['base_builddir'] = \
                 tempfile.mkdtemp(prefix='build-selftest-', dir=builddir)
 
+        self.tc_kwargs['load']['process_num'] = args.thread_num
+
     def _pre_run(self):
         def _check_required_env_variables(vars):
             for var in vars:
@@ -199,6 +212,11 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.module_paths = self._get_cases_paths(
                 self.tc_kwargs['init']['td']['BBPATH'].split(':'))
 
+        if self.tc_kwargs['load']['process_num'] == 1:
+            self._context_class = OESelftestTestContext
+            # OESelftestTestContext class doesn't expect process_num
+            del self.tc_kwargs['load']['process_num']
+
         self.tc = self._context_class(**self.tc_kwargs['init'])
         self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
 
-- 
2.11.0


