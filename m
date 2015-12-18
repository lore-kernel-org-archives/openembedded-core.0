Return-Path: <costin.c.constantin@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 506CF731C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Dec 2015 04:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="863931662"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2015 04:28:39 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 1008F6A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:39 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:40:56 +0200
Message-Id: <5ed1a41995e990a7cbd43a240a7df7ab9b6d2bda.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 04/12] oeqa/runexported: Add option to run arbitrary tests.
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:38 -0000

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


