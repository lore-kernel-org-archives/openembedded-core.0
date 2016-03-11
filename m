Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 54C2E75D4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:31:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 11 Mar 2016 08:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,321,1455004800"; d="scan'208";a="908097065"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.162])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 08:31:32 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 10:28:24 -0600
Message-Id: <1457713704-4221-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] scripts/oe-selftest: Add search expression matching to run/list options
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
X-List-Received-Date: Fri, 11 Mar 2016 16:31:35 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

The oe-selftest script required an exact matching for the parameters
passed to its run-tests-by and list-tests-by options. Many tests
can be retrieved here and filtering is a must.

This patch add this filtering functionality by enabling the use
of wildcards such as "*".

[Yocto #8916]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 108 +++++++++++++++++++++-------------------------------
 1 file changed, 44 insertions(+), 64 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index de98a6c..4c92f6d 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -243,93 +243,73 @@ def get_all_tests():
         testlist += get_tests_from_module(tmod)
     return testlist
 
-
-def create_testsuite_by(criteria, keyword):
-    # Create a testsuite based on 'keyword'
-    # criteria: name, class, module, id, tag
-    # keyword: a list of tests, classes, modules, ids, tags
-    # NOTE: globing would be nice?
-
-    ts = set()
-    all_tests = get_all_tests()
-
-    if criteria == 'name':
-        for tc in all_tests:
-            if tc.tcname in keyword:
-                ts.add(tc.fullpath)
-
-    elif criteria == 'class':
-        for tc in all_tests:
-            if tc.tcclass in keyword:
-                ts.add(tc.fullpath)
-
-    elif criteria == 'module':
-        for tc in all_tests:
-            if tc.tcmodule in keyword:
-                ts.add(tc.fullpath)
-    elif criteria == 'id':
-        for tc in all_tests:
-            if str(tc.tcid) in keyword:
-                ts.add(tc.fullpath)
-    elif criteria == 'tag':
-        for tc in all_tests:
-            # tc can have multiple tags (as list or tuple) otherwise as str
-            if isinstance(tc.tctag, (list, tuple)):
-                for tag in tc.tctag:
-                    if str(tag) in keyword:
-                        ts.add(tc.fullpath)
-            elif tc.tctag in keyword:
-                ts.add(tc.fullpath)
-
-    return sorted(list(ts))
-
-
 def get_testsuite_by(criteria, keyword):
     # Get a testsuite based on 'keyword'
     # criteria: name, class, module, id, tag
     # keyword: a list of tests, classes, modules, ids, tags
-    # NOTE: globing would be nice?
-    ts = set()
+
+    import re
+    import fnmatch
+
+    ts = []
     all_tests = get_all_tests()
 
+    def get_matches(values):
+        # Get a items and return the ones that match with keyword(s)
+        # values: the list of items (names, modules, classes...)
+        result = []
+        remaining = values[:]
+        for key in keyword:
+            if key in remaining:
+                # Regular matching of exact item
+                result.append(key)
+                remaining.remove(key)
+            else:
+                # Wildcard matching
+                pattern = re.compile(fnmatch.translate(r"%s" % key))
+                added = [ x for x in remaining if pattern.match(x) ]
+                result.extend(added)
+                remaining = [ x for x in remaining if not x in added ]
+
+        return result
+
     if criteria == 'name':
-        for tc in all_tests:
-            if tc.tcname in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+        names = get_matches([ tc.tcname for tc in all_tests ])
+        ts = [ tc for tc in all_tests if tc.tcname in names ]
 
     elif criteria == 'class':
-        for tc in all_tests:
-            if tc.tcclass in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+        classes = get_matches([ tc.tcclass for tc in all_tests ])
+        ts = [ tc for tc in all_tests if tc.tcclass in classes ]
 
     elif criteria == 'module':
-        for tc in all_tests:
-            if tc.tcmodule in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+        modules = get_matches([ tc.tcmodule for tc in all_tests ])
+        ts = [ tc for tc in all_tests if tc.tcmodule in modules ]
+
     elif criteria == 'id':
-        for tc in all_tests:
-            if str(tc.tcid) in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+        ids = get_matches([ str(tc.tcid) for tc in all_tests ])
+        ts = [ tc for tc in all_tests if str(tc.tcid) in ids ]
+
     elif criteria == 'tag':
+        values = set()
         for tc in all_tests:
             # tc can have multiple tags (as list or tuple) otherwise as str
             if isinstance(tc.tctag, (list, tuple)):
-                for tag in tc.tctag:
-                    if str(tag) in keyword:
-                        ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
-            elif str(tc.tctag) in keyword:
-                ts.add((tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule))
+                values |= { str(tag) for tag in tc.tctag }
+            else:
+                values.add(str(tc.tctag))
+
+        tags = get_matches(list(values))
+        ts = [ tc for tc in all_tests if str(tc.tctag) in tags ]
 
-    return sorted(list(ts))
+    return ts
 
 
 def list_testsuite_by(criteria, keyword):
     # Get a testsuite based on 'keyword'
     # criteria: name, class, module, id, tag
     # keyword: a list of tests, classes, modules, ids, tags
-    # NOTE: globing would be nice?
 
-    ts = get_testsuite_by(criteria, keyword)
+    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])
 
     print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
     print '_' * 150
@@ -459,7 +439,7 @@ def main():
         else:
             criteria = args.run_tests_by[0]
             keyword = args.run_tests_by[1:]
-            ts = create_testsuite_by(criteria, keyword)
+            ts = sorted([ tc.fullpath for tc in get_testsuite_by(criteria, keyword) ])
 
     if args.list_tests_by and len(args.list_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
-- 
1.9.1


