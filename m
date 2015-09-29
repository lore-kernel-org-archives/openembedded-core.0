Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC4A76710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:49:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Sep 2015 07:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,608,1437462000"; d="scan'208";a="815357893"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2015 07:49:46 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 84E4E6A4083;
	Tue, 29 Sep 2015 07:48:50 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 17:47:42 +0300
Message-Id: <1443538062-11876-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runexported: Replaced optionparser with argparse.
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
X-List-Received-Date: Tue, 29 Sep 2015 14:49:47 -0000

Also added the default json file name as default for
the first positional argument.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 0daedd0..dba0d7a 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -21,7 +21,7 @@
 import sys
 import os
 import time
-from optparse import OptionParser
+import argparse
 
 try:
     import simplejson as json
@@ -76,40 +76,38 @@ class TestContext(object):
 
 def main():
 
-    usage = "usage: %prog [options] <json file>"
-    parser = OptionParser(usage=usage)
-    parser.add_option("-t", "--target-ip", dest="ip", help="The IP address of the target machine. Use this to \
+    parser = argparse.ArgumentParser()
+    parser.add_argument("-t", "--target-ip", dest="ip", help="The IP address of the target machine. Use this to \
             overwrite the value determined from TEST_TARGET_IP at build time")
-    parser.add_option("-s", "--server-ip", dest="server_ip", help="The IP address of this machine. Use this to \
+    parser.add_argument("-s", "--server-ip", dest="server_ip", help="The IP address of this machine. Use this to \
             overwrite the value determined from TEST_SERVER_IP at build time.")
-    parser.add_option("-d", "--deploy-dir", dest="deploy_dir", help="Full path to the package feeds, that this \
+    parser.add_argument("-d", "--deploy-dir", dest="deploy_dir", help="Full path to the package feeds, that this \
             the contents of what used to be DEPLOY_DIR on the build machine. If not specified it will use the value \
             specified in the json if that directory actually exists or it will error out.")
-    parser.add_option("-l", "--log-dir", dest="log_dir", help="This sets the path for TEST_LOG_DIR. If not specified \
+    parser.add_argument("-l", "--log-dir", dest="log_dir", help="This sets the path for TEST_LOG_DIR. If not specified \
             the current dir is used. This is used for usually creating a ssh log file and a scp test file.")
+    parser.add_argument("json", help="The json file exported by the build system", default="testdata.json", nargs='?')
 
-    (options, args) = parser.parse_args()
-    if len(args) != 1:
-        parser.error("Incorrect number of arguments. The one and only argument should be a json file exported by the build system")
+    args = parser.parse_args()
 
-    with open(args[0], "r") as f:
+    with open(args.json, "r") as f:
         loaded = json.load(f)
 
-    if options.ip:
-        loaded["target"]["ip"] = options.ip
-    if options.server_ip:
-        loaded["target"]["server_ip"] = options.server_ip
+    if args.ip:
+        loaded["target"]["ip"] = args.ip
+    if args.server_ip:
+        loaded["target"]["server_ip"] = args.server_ip
 
     d = MyDataDict()
     for key in loaded["d"].keys():
         d[key] = loaded["d"][key]
 
-    if options.log_dir:
-        d["TEST_LOG_DIR"] = options.log_dir
+    if args.log_dir:
+        d["TEST_LOG_DIR"] = args.log_dir
     else:
         d["TEST_LOG_DIR"] = os.path.abspath(os.path.dirname(__file__))
-    if options.deploy_dir:
-        d["DEPLOY_DIR"] = options.deploy_dir
+    if args.deploy_dir:
+        d["DEPLOY_DIR"] = args.deploy_dir
     else:
         if not os.path.isdir(d["DEPLOY_DIR"]):
             print("WARNING: The path to DEPLOY_DIR does not exist: %s" % d["DEPLOY_DIR"])
-- 
2.1.4


