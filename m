Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4CE731CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 04:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="874234805"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2015 04:28:49 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id A3C326A408D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:48 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:41:01 +0200
Message-Id: <0347743a02f033142a1193483a4df4b9db30a548.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 09/12] oeqa/runexported: Add parameter support for machine arch.
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:47 -0000

From: Lucian Musat <george.l.musat@intel.com>

Added support to change machine architecture on the fly and
support for future TestNeedsBin decorator for tests that need
binaries.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/runexported.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index b8d621c..3a6bad7 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -22,6 +22,9 @@ import sys
 import os
 import time
 import argparse
+import re
+
+from oeqa.utils.testsexport import get_dest_folder
 
 try:
     import simplejson as json
@@ -88,10 +91,13 @@ def main():
             the current dir is used. This is used for usually creating a ssh log file and a scp test file.")
     parser.add_argument("--list-tests", dest="list_tests", help="This lists the current TEST_SUITES that will be run.", action='store_true')
     parser.add_argument("-r","--run-tests", dest="run_tests", help="Overwrite TEST_SUITES from the json file with custom list of tests.", nargs = '*')
+    parser.add_argument("-m","--machine", dest="machine", help="Overwrite MACHINE from the json file ")
     parser.add_argument("json", help="The json file exported by the build system", default="testdata.json", nargs='?')
 
     args = parser.parse_args()
 
+    os.environ["bin_dir"] = os.path.join(os.getcwd(), "binaries") # exporting bin_dir path
+
     if os.path.isdir("extralayers"):
         extrapaths = [x[0] for x in os.walk('extralayers')]
         for path in extrapaths:
@@ -137,6 +143,22 @@ def main():
         if key != "d" and key != "target" and key != "host_dumper":
             setattr(tc, key, loaded[key])
 
+    if args.machine:
+        d['MACHINE'] = args.machine
+        bin_dir = os.getenv("bin_dir")
+        found = False
+        if os.path.exists(bin_dir):
+            for item in os.listdir(bin_dir):
+                if not re.search("native", item) and os.path.exists(os.path.join(bin_dir, item, "mapping.cfg")):
+                    with open(os.path.join(bin_dir, item, "mapping.cfg"), "r") as mapping_file:
+                        mapping = eval(mapping_file.read())
+                        if args.machine in mapping.keys():
+                            d['TARGET_SYS'] = mapping[args.machine][0]
+                            d['TUNE_FEATURES'] = mapping[args.machine][1]
+                            found = True
+        if not found:
+            print("WARNING: Cannot find binaries for provided machine %s." % args.machine)
+
     if args.run_tests:
         tc.testslist = args.run_tests
 
-- 
2.5.0


