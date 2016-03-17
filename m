Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4782E6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:33:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2016 03:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,349,1455004800"; d="scan'208";a="765976445"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 17 Mar 2016 03:33:22 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id C54976A4002;
	Thu, 17 Mar 2016 04:21:06 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:37:30 +0200
Message-Id: <1458211050-21152-3-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 3/3] oe-selftest: Fixed --list-tests-by tag option
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
X-List-Received-Date: Thu, 17 Mar 2016 10:33:22 -0000

Commit 35be67951305950ba797dc2efddbc7d88fc0556a broke the
--list-tests-by tag option.
This patch fixes that.

Having a module in lib/oeqa/selftest named testmodule:
class TestClass(oeSelfTest):
    @tag(feature='tag1')
    def test_func1(self):
        pass
    @tag(feature=('tag1', 'tag2'))
    def test_func2(self):
        pass
    @tag(feature=('tag2', 'tag3'))
    def test_func3(self):
        pass
    @tag(feature=('tag1', 'tag2', 'tag3'))
    def test_func4(self):
        pass

$ oe-selftest --list-tests-by tag tag1
 ID  TAG(s)            NAME        CLASS      MODULE
----  ----------------  ----------  ---------  --------
      tag1              test_func1  TestClass  testmodule
      tag1, tag2        test_func2  TestClass  testmodule
      tag1, tag2, tag3  test_func4  TestClass  testmodule
______________________________
Filtering by:	 tag
Looking for:	 tag1
Total found:	 3

$  oe-selftest --list-tests-by tag tag1 tag2
  ID  TAG(s)            NAME        CLASS      MODULE
----  ----------------  ----------  ---------  --------
      tag1              test_func1  TestClass  testmodule
      tag1, tag2        test_func2  TestClass  testmodule
      tag1, tag2, tag3  test_func4  TestClass  testmodule
      tag2, tag3        test_func3  TestClass  testmodule
______________________________
Filtering by:	 tag
Looking for:	 tag1, tag2
Total found:	 4

$ oe-selftest --list-tests-by tag tag*
  ID  TAG(s)            NAME        CLASS      MODULE
----  ----------------  ----------  ---------  --------
      tag1              test_func1  TestClass  testmodule
      tag1, tag2        test_func2  TestClass  testmodule
      tag1, tag2, tag3  test_func4  TestClass  testmodule
      tag2, tag3        test_func3  TestClass  testmodule
______________________________
Filtering by:	 tag
Looking for:	 tag*
Total found:	 4

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/oe-selftest | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index ada71d2..d06e097 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -33,6 +33,8 @@ import argparse
 import subprocess
 import time as t
 from tabulate import tabulate
+import re
+import fnmatch
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -198,7 +200,7 @@ class Tc:
         self.tcclass = tcclass
         self.tcmodule = tcmodule
         self.tcid = tcid
-        # A test case can have multiple tags (as list or as tuples) otherwise str suffice
+        # A test case can have multiple tags (as tuples) otherwise str will suffice
         self.tctag = tctag
         self.fullpath = '.'.join(['oeqa', 'selftest', tcmodule, tcclass, tcname])
 
@@ -244,19 +246,17 @@ def get_all_tests():
         testlist += get_tests_from_module(tmod)
     return testlist
 
+
 def get_testsuite_by(criteria, keyword):
     # Get a testsuite based on 'keyword'
     # criteria: name, class, module, id, tag
     # keyword: a list of tests, classes, modules, ids, tags
 
-    import re
-    import fnmatch
-
     ts = []
     all_tests = get_all_tests()
 
     def get_matches(values):
-        # Get a items and return the ones that match with keyword(s)
+        # Get an items and return the ones that match with keyword(s)
         # values: the list of items (names, modules, classes...)
         result = []
         remaining = values[:]
@@ -268,9 +268,9 @@ def get_testsuite_by(criteria, keyword):
             else:
                 # Wildcard matching
                 pattern = re.compile(fnmatch.translate(r"%s" % key))
-                added = [ x for x in remaining if pattern.match(x) ]
+                added = [x for x in remaining if pattern.match(x)]
                 result.extend(added)
-                remaining = [ x for x in remaining if not x in added ]
+                remaining = [x for x in remaining if x not in added]
 
         return result
 
@@ -293,14 +293,23 @@ def get_testsuite_by(criteria, keyword):
     elif criteria == 'tag':
         values = set()
         for tc in all_tests:
-            # tc can have multiple tags (as list or tuple) otherwise as str
-            if isinstance(tc.tctag, (list, tuple)):
+            # tc can have multiple tags (as tuple) otherwise str will suffice
+            if isinstance(tc.tctag, tuple):
                 values |= { str(tag) for tag in tc.tctag }
             else:
                 values.add(str(tc.tctag))
 
         tags = get_matches(list(values))
-        ts = [ tc for tc in all_tests if str(tc.tctag) in tags ]
+
+        for tc in all_tests:
+            for tag in tags:
+                if isinstance(tc.tctag, tuple) and tag in tc.tctag:
+                    ts.append(tc)
+                elif tag == tc.tctag:
+                    ts.append(tc)
+
+        # Remove duplicates from the list
+        ts = list(set(ts))
 
     return ts
 
-- 
2.1.0


