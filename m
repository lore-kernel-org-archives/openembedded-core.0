Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABFE96FF72
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:37:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 24 Jan 2016 11:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="640686691"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2016 11:37:53 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 96DCF2C8001;
	Sun, 24 Jan 2016 12:25:47 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:42 +0200
Message-Id: <1453664991-31706-4-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Cc: Lucian Musat <george.l.musat@intel.com>
Subject: [PATCH 04/13] oeqa/runexported: Add option to run arbitrary tests.
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
X-List-Received-Date: Sun, 24 Jan 2016 19:37:54 -0000

From: Lucian Musat <george.l.musat@intel.com>

You can now overwrite the default TEST_SUITES from the
json file and can choose the tests you want to run.
Also you can display the list of tests.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index dba0d7a..d273d2f 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -86,6 +86,8 @@ def main():
             specified in the json if that directory actually exists or it will error out.")
     parser.add_argument("-l", "--log-dir", dest="log_dir", help="This sets the path for TEST_LOG_DIR. If not specified \
             the current dir is used. This is used for usually creating a ssh log file and a scp test file.")
+    parser.add_argument("--list-tests", dest="list_tests", help="This lists the current TEST_SUITES that will be run.", action='store_true')
+    parser.add_argument("-r","--run-tests", dest="run_tests", help="Overwrite TEST_SUITES from the json file with custom list of tests.", nargs = '*')
     parser.add_argument("json", help="The json file exported by the build system", default="testdata.json", nargs='?')
 
     args = parser.parse_args()
@@ -129,8 +131,15 @@ def main():
         if key != "d" and key != "target" and key != "host_dumper":
             setattr(tc, key, loaded[key])
 
-    target.exportStart()
-    runTests(tc)
+    if args.run_tests:
+        tc.testslist = args.run_tests
+
+    if args.list_tests:
+        for test in tc.testslist:
+            print test
+    else:
+        target.exportStart()
+        runTests(tc)
 
     return 0
 
-- 
2.5.0


