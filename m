Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADC96011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 20:29:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2016 13:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="840575372"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga003.jf.intel.com with ESMTP; 04 Jul 2016 13:29:21 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 12:23:16 +0000
Message-Id: <b95ab7aa97a4eee3d6d1d2576cd3d1be2404a7d2.1467634829.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1467634829.git.mariano.lopez@linux.intel.com>
References: <cover.1467634829.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1467634829.git.mariano.lopez@linux.intel.com>
References: <cover.1467634829.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/1] oetest.py: Add command line parameter support for tag in testexport
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
X-List-Received-Date: Mon, 04 Jul 2016 20:29:20 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This allows to use a command line argument to change the
tag used to filter test instead of rebuilding the tests.

[YOCTO #8532]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py      | 16 +++++++++++++---
 meta/lib/oeqa/runexported.py |  6 +++++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4a740fb..a63fd9b 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -397,8 +397,6 @@ class RuntimeTestContext(TestContext):
     def __init__(self, d, target, exported=False):
         super(RuntimeTestContext, self).__init__(d, exported)
 
-        self.tagexp =  d.getVar("TEST_SUITES_TAGS", True)
-
         self.target = target
 
         self.pkgmanifest = {}
@@ -592,6 +590,8 @@ class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d, target)
 
+        self.tagexp = d.getVar("TEST_SUITES_TAGS", True)
+
         self.host_dumper = host_dumper
 
         self.sigterm = False
@@ -612,8 +612,18 @@ class ImageTestContext(RuntimeTestContext):
         super(ImageTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
 
 class ExportTestContext(RuntimeTestContext):
-    def __init__(self, d, target, exported=False):
+    def __init__(self, d, target, exported=False, parsedArgs={}):
+        """
+        This class is used when exporting tests and when are executed outside OE environment.
+
+        parsedArgs can contain the following:
+            - tag:      Filter test by tag.
+        """
         super(ExportTestContext, self).__init__(d, target, exported)
+
+        tag = parsedArgs.get("tag", None)
+        self.tagexp = tag if tag != None else d.getVar("TEST_SUITES_TAGS", True)
+
         self.sigterm = None
 
     def install_uninstall_packages(self, test_id, install=True):
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 5886739..ae46225 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -81,6 +81,7 @@ def main():
             specified in the json if that directory actually exists or it will error out.")
     parser.add_argument("-l", "--log-dir", dest="log_dir", help="This sets the path for TEST_LOG_DIR. If not specified \
             the current dir is used. This is used for usually creating a ssh log file and a scp test file.")
+    parser.add_argument("-a", "--tag", dest="tag", help="Only run test with specified tag.")
     parser.add_argument("json", help="The json file exported by the build system", default="testdata.json", nargs='?')
 
     args = parser.parse_args()
@@ -107,6 +108,9 @@ def main():
         if not os.path.isdir(d["DEPLOY_DIR"]):
             print("WARNING: The path to DEPLOY_DIR does not exist: %s" % d["DEPLOY_DIR"])
 
+    parsedArgs = {}
+    parsedArgs["tag"] = args.tag
+
     extract_sdk(d)
 
     target = FakeTarget(d)
@@ -114,7 +118,7 @@ def main():
         setattr(target, key, loaded["target"][key])
 
     target.exportStart()
-    tc = ExportTestContext(d, target, True)
+    tc = ExportTestContext(d, target, True, parsedArgs)
     tc.loadTests()
     tc.runTests()
 
-- 
2.6.6


