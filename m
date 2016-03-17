Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C23C86FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:33:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 17 Mar 2016 03:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,349,1455004800"; d="scan'208";a="68168274"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2016 03:33:20 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 925F46A4002;
	Thu, 17 Mar 2016 04:21:04 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:37:28 +0200
Message-Id: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/3] oe-selftest: Updated --list-tests and --list-tests-by
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
X-List-Received-Date: Thu, 17 Mar 2016 10:33:28 -0000

The output table is now able to adjust it's size so the
content is nicely aligned.

fix for [YOCTO #9243]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/oe-selftest | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 9444244..ada71d2 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -32,6 +32,7 @@ import logging
 import argparse
 import subprocess
 import time as t
+from tabulate import tabulate
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -309,19 +310,22 @@ def list_testsuite_by(criteria, keyword):
     # criteria: name, class, module, id, tag
     # keyword: a list of tests, classes, modules, ids, tags
 
-    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])
+    ts = sorted([(tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword)])
+    test_list = []
 
-    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
-    print '_' * 150
     for t in ts:
         if isinstance(t[1], (tuple, list)):
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t[0], ', '.join(t[1]), t[2], t[3], t[4])
+            test_list.append((t[0], ', '.join(t[1]), t[2], t[3], t[4]))
         else:
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % t
-    print '_' * 150
+            test_list.append(t)
+
+    header = ['ID', 'TAG(s)', 'NAME', 'CLASS', 'MODULE']
+    print ''
+    print tabulate(test_list, header)
+    print '_' * 30
     print 'Filtering by:\t %s' % criteria
     print 'Looking for:\t %s' % ', '.join(str(x) for x in keyword)
-    print 'Total found:\t %s' % len(ts)
+    print 'Total found:\t %s\n' % len(ts)
 
 
 def list_tests():
@@ -329,15 +333,19 @@ def list_tests():
 
     ts = get_all_tests()
 
-    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
-    print '_' * 150
+    test_list = []
+
     for t in ts:
         if isinstance(t.tctag, (tuple, list)):
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, ', '.join(t.tctag), t.tcname, t.tcclass, t.tcmodule)
+            test_list.append((t.tcid, ', '.join(t.tctag), t.tcname, t.tcclass, t.tcmodule))
         else:
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, t.tctag, t.tcname, t.tcclass, t.tcmodule)
-    print '_' * 150
-    print 'Total found:\t %s' % len(ts)
+            test_list.append((t.tcid, t.tctag, t.tcname, t.tcclass, t.tcmodule))
+
+    header = ['ID', 'TAG(s)', 'NAME', 'CLASS', 'MODULE']
+    print ''
+    print tabulate(test_list, header)
+    print '_' * 30
+    print 'Total found:\t %s\n' % len(ts)
 
 
 def list_tags():
-- 
2.1.0


