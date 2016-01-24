Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6169C770C4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:38:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 24 Jan 2016 11:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="733465930"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 24 Jan 2016 11:38:05 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 37C782C8001;
	Sun, 24 Jan 2016 12:25:57 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:47 +0200
Message-Id: <1453664991-31706-9-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Cc: Lucian Musat <george.l.musat@intel.com>
Subject: [PATCH 09/13] oeqa/runexported: Add parameter support for machine arch.
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
X-List-Received-Date: Sun, 24 Jan 2016 19:38:04 -0000

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


