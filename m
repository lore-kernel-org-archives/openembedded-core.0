Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 905C760588
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 15:44:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Jan 2016 07:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,521,1444719600"; d="scan'208";a="627793204"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2016 07:44:59 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 3FA446A4002;
	Mon,  4 Jan 2016 08:32:57 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 17:47:59 +0200
Message-Id: <1451922479-13033-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oe-selftest: New option --list-tests
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
X-List-Received-Date: Mon, 04 Jan 2016 15:44:59 -0000

This option will list all available tests in a comprehensive manner.

Fix for [YOCTO #8868]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/oe-selftest | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 08a5af3..113daf6 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -82,6 +82,8 @@ def get_args_parser():
                        help='run-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
     group.add_argument('--list-tests-by', required=False, dest='list_tests_by', default=False, nargs='*',
                        help='list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
+    group.add_argument('--list-tests', required=False,  action="store_true", dest="list_tests", default=False,
+                       help='List all available tests.')
     group.add_argument('--list-tags', required=False, dest='list_tags', default=False, action="store_true",
                        help='List all tags that have been set to test cases.')
     return parser
@@ -333,6 +335,22 @@ def list_testsuite_by(criteria, keyword):
     print 'Total found:\t %s' % len(ts)
 
 
+def list_tests():
+    # List all available oe-selftest tests
+
+    ts = get_all_tests()
+
+    print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module')
+    print '_' * 150
+    for t in ts:
+        if isinstance(t.tctag, (tuple, list)):
+            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, ', '.join(t.tctag), t.tcname, t.tcclass, t.tcmodule)
+        else:
+            print '%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % (t.tcid, t.tctag, t.tcname, t.tcclass, t.tcmodule)
+    print '_' * 150
+    print 'Total found:\t %s' % len(ts)
+
+
 def list_tags():
     # Get all tags set to test cases
     # This is useful when setting tags to test cases
@@ -380,6 +398,9 @@ def main():
             keyword = args.list_tests_by[1:]
             list_testsuite_by(criteria, keyword)
 
+    if args.list_tests:
+        list_tests()
+
     if args.list_tags:
         list_tags()
 
-- 
2.1.0


