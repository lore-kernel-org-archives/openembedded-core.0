Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F0E49605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 20:17:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 May 2016 13:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,325,1459839600"; d="scan'208";a="704636391"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.17.76])
	by FMSMGA003.fm.intel.com with ESMTP; 17 May 2016 13:16:45 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 15:18:15 -0500
Message-Id: <1463516295-25980-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH] scripts/oe-selftest: Improve listing by reducing unneeded spacing
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
X-List-Received-Date: Tue, 17 May 2016 20:17:03 -0000

The --list-tests option assumes a terminal of 150 characters wide,
which is clearly wrong. The output for this command is messy and
hard to understand for lower widths. Every command should look
good in a 80 characters terminal.

Unfortunately, this can't be done at the moment. The bad naming of
testcases have made the test names incredibly long.

This patch reduces spacing between columns and shows the tests
names in a concise and understandable way. The format is even the
same one required for running a testcase. Once the testcase naming
improves, this output will look even better.

[Yocto #9534]
---
 scripts/oe-selftest | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 5e23ef0..61845d5 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -338,14 +338,14 @@ def list_tests():
 
     ts = get_all_tests()
 
-    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
-    print '_' * 150
+    print '%-4s\t%-10s\t%-60s' % ('id', 'tag', 'test')
+    print '_' * 80
     for t in ts:
         if isinstance(t.tctag, (tuple, list)):
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, ', '.join(t.tctag), t.tcname, t.tcclass, t.tcmodule)
+            print '%-4s\t%-10s\t%-60s' % (t.tcid, ', '.join(t.tctag), '.'.join([t.tcmodule, t.tcclass, t.tcname]))
         else:
-            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, t.tctag, t.tcname, t.tcclass, t.tcmodule)
-    print '_' * 150
+            print '%-4s\t%-10s\t%-60s' % (t.tcid, t.tctag, '.'.join([t.tcmodule, t.tcclass, t.tcname]))
+    print '_' * 80
     print 'Total found:\t %s' % len(ts)
 
 
-- 
2.4.11


