Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E723F71B4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:30 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172560"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:32 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:09 -0600
Message-Id: <7d36095976b23065ec033dec6f3ea0a899bb3b08.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 04/32] oeqa/core/decorator: Add support for OETestDepends
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OETestDepends decorator could be used over test cases to
define some dependency between them.

At loading time sorting the tests to grauntee that a test case
executes before also raise an exception if found a circular
dependency between test cases.

At before test case run reviews if the dependency if meet, in the
case of don't it skips the test case run.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/depends.py | 94 +++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 meta/lib/oeqa/core/decorator/depends.py

diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
new file mode 100644
index 0000000..195711c
--- /dev/null
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -0,0 +1,94 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from unittest import SkipTest
+
+from oeqa.core.exception import OEQADependency
+
+from . import OETestDiscover, registerDecorator
+
+def _add_depends(registry, case, depends):
+    module_name = case.__module__
+    class_name = case.__class__.__name__
+
+    case_id = case.id()
+
+    for depend in depends:
+        dparts = depend.split('.')
+
+        if len(dparts) == 1:
+            depend_id = ".".join((module_name, class_name, dparts[0]))
+        elif len(dparts) == 2:
+            depend_id = ".".join((module_name, dparts[0], dparts[1]))
+        else:
+            depend_id = depend
+
+        if not case_id in registry:
+            registry[case_id] = []
+        if not depend_id in registry[case_id]:
+            registry[case_id].append(depend_id)
+
+def _validate_test_case_depends(cases, depends):
+    for case in depends:
+        if not case in cases:
+            continue
+        for dep in depends[case]:
+            if not dep in cases:
+                raise OEQADependency("TestCase %s depends on %s and isn't available"\
+                       ", cases available %s." % (case, dep, str(cases.keys())))
+
+def _order_test_case_by_depends(cases, depends):
+    def _dep_resolve(graph, node, resolved, seen):
+        seen.append(node)
+        for edge in graph[node]:
+            if edge not in resolved:
+                if edge in seen:
+                    raise OEQADependency("Test cases %s and %s have a circular" \
+                                       " dependency." % (node, edge))
+                _dep_resolve(graph, edge, resolved, seen)
+        resolved.append(node)
+
+    dep_graph = {}
+    dep_graph['__root__'] = cases.keys()
+    for case in cases:
+        if case in depends:
+            dep_graph[case] = depends[case]
+        else:
+            dep_graph[case] = []
+
+    cases_ordered = []
+    _dep_resolve(dep_graph, '__root__', cases_ordered, [])
+    cases_ordered.remove('__root__')
+
+    return [cases[case_id] for case_id in cases_ordered]
+
+def _skipTestDependency(case, depends):
+    results = case.tc._results
+    skipReasons = ['errors', 'failures', 'skipped']
+
+    for reason in skipReasons:
+        for test, _ in results[reason]:
+            if test.id() in depends:
+                raise SkipTest("Test case %s depends on %s and was in %s." \
+                        % (case.id(), test.id(), reason))
+
+@registerDecorator
+class OETestDepends(OETestDiscover):
+    attrs = ('depends',)
+
+    def bind(self, registry, case):
+        super(OETestDepends, self).bind(registry, case)
+        if not registry.get('depends'):
+            registry['depends'] = {}
+        _add_depends(registry['depends'], case, self.depends)
+
+    @staticmethod
+    def discover(registry):
+        if registry.get('depends'):
+            _validate_test_case_depends(registry['cases'], registry['depends'])
+            return _order_test_case_by_depends(registry['cases'], registry['depends'])
+        else:
+            return [registry['cases'][case_id] for case_id in registry['cases']]
+
+    def setUpDecorator(self):
+        _skipTestDependency(self.case, self.depends)
-- 
2.1.4


