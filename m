Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 67F5771B04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735111"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:47:47 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:07 -0500
Message-Id: <c6c438145d347ad9919dd6af428c21cb83cf2229.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 07/17] oeqa/core/threaded: Add new module with OETestLoaderThreaded
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
X-List-Received-Date: Wed, 10 May 2017 19:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The threded module will implement Thread support into the OEQA
framework.

The OETestLoaderThreaded overrides discover to return a list of
suites every suite will be run by a separate Thread.

Some design considerations are:

- All the tests of a certain module needs to be run at one thread
  because unittest framework needs to keep track of setUp{Module,
Class,} and tearDown{Module, Class,}.

- Tests that depends on other needs to be run at the same thread
because OEQA framework look at the status of dependant test to
decide if skip or not, this constraint can be change in the future
but a sync mechanishm is needed to implement between the Threads.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 91 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 meta/lib/oeqa/core/threaded.py

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
new file mode 100644
index 0000000..e6f2140
--- /dev/null
+++ b/meta/lib/oeqa/core/threaded.py
@@ -0,0 +1,91 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import multiprocessing
+
+from unittest.suite import TestSuite
+from oeqa.core.loader import OETestLoader
+
+class OETestLoaderThreaded(OETestLoader):
+    def __init__(self, tc, module_paths, modules, tests, modules_required,
+            filters, process_num=0, *args, **kwargs):
+        super(OETestLoaderThreaded, self).__init__(tc, module_paths, modules,
+                tests, modules_required, filters, *args, **kwargs)
+
+        self.process_num = process_num
+
+    def discover(self):
+        suite = super(OETestLoaderThreaded, self).discover()
+
+        if self.process_num <= 0:
+            self.process_num = min(multiprocessing.cpu_count(),
+                    len(suite._tests))
+
+        suites = []
+        for _ in range(self.process_num):
+            suites.append(self.suiteClass())
+
+        def _search_for_module_idx(suites, case):
+            """
+                Cases in the same module needs to be run
+                in the same thread because PyUnit keeps track
+                of setUp{Module, Class,} and tearDown{Module, Class,}.
+            """
+
+            for idx in range(self.process_num):
+                suite = suites[idx]
+                for c in suite._tests:
+                    if case.__module__ == c.__module__:
+                        return idx
+
+            return -1
+
+        def _search_for_depend_idx(suites, depends):
+            """
+                Dependency cases needs to be run in the same
+                thread, because OEQA framework look at the state
+                of dependant test to figure out if skip or not.
+            """
+
+            for idx in range(self.process_num):
+                suite = suites[idx]
+
+                for case in suite._tests:
+                    if case.id() in depends:
+                        return idx
+            return -1
+
+        def _get_best_idx(suites):
+            sizes = [len(suite._tests) for suite in suites]
+            return sizes.index(min(sizes))
+
+        def _fill_suites(suite):
+            idx = -1
+            for case in suite:
+                if isinstance(case, TestSuite):
+                    _fill_suites(case)
+                else:
+                    idx = _search_for_module_idx(suites, case)
+
+                    depends = {}
+                    if 'depends' in self.tc._registry:
+                        depends = self.tc._registry['depends']
+
+                    if idx == -1 and case.id() in depends:
+                        case_depends = depends[case.id()] 
+                        idx = _search_for_depend_idx(suites, case_depends)
+
+                    if idx == -1:
+                        idx = _get_best_idx(suites)
+
+                    suites[idx].addTest(case)
+        _fill_suites(suite)
+
+        suites_tmp = suites
+        suites = []
+        for suite in suites_tmp:
+            if len(suite._tests) > 0:
+                suites.append(suite)
+
+        return suites
+
-- 
2.1.4


