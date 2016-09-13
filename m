Return-Path: <jing.j.wang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1362E77214
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:21:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 12 Sep 2016 18:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,326,1470726000"; d="scan'208";a="760043785"
Received: from iot.sh.intel.com ([10.239.52.75])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2016 18:21:01 -0700
From: jwang <jing.j.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 09:17:35 +0800
Message-Id: <1473729455-32649-4-git-send-email-jing.j.wang@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
References: <1473729455-32649-1-git-send-email-jing.j.wang@intel.com>
Subject: [PATCH 4/4] meta: modify runexported script to inherit the features from baserunner
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
X-List-Received-Date: Tue, 13 Sep 2016 01:21:01 -0000

From: zjh <junhuix.zhang@intel.com>

Signed-off-by: zjh <junhuix.zhang@intel.com>
---
 meta/classes/testexport.bbclass |  2 ++
 meta/lib/base/baserunner.py     | 21 ++++++++++++++++++++-
 meta/lib/oeqa/runexported.py    | 12 +++++++++++-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 15fa470..c65ad55 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -128,6 +128,8 @@ def exportTests(d,tc):
         for f in files:
             shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
 
+    # copy base*
+    shutil.copytree(os.path.join(meta_layer, "lib", "base"), os.path.join(exportpath, "base"))
     # Create tar file for common parts of testexport
     create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR", True))
 
diff --git a/meta/lib/base/baserunner.py b/meta/lib/base/baserunner.py
index d59872f..9b38f1b 100755
--- a/meta/lib/base/baserunner.py
+++ b/meta/lib/base/baserunner.py
@@ -57,9 +57,28 @@ class TestRunnerBase(object):
     def configure(self, options=FakeOptions()):
         '''configure before testing'''
         self.test_options = options
-        self.runner = unittest.TextTestRunner(stream=sys.stderr, \
+        if options.xunit:
+            try:
+                from xmlrunner import XMLTestRunner
+            except ImportError:
+                raise Exception("unittest-xml-reporting not installed")
+            self.runner = XMLTestRunner(stream=sys.stderr, \
+                                        verbosity=2, output=options.xunit)
+        else:
+            self.runner = unittest.TextTestRunner(stream=sys.stderr, \
                                                   verbosity=2)
 
+        if options.manifest:
+            fbname, fext = os.path.splitext(os.path.basename(options.manifest))
+            assert fbname == "manifest" or fext == ".manifest", \
+                  "Please specify file name like xxx.manifest or manifest.xxx"
+            self.tclist = self.get_tc_from_manifest(options.manifest)
+
+        if options.tests:
+            tcs = [t[0:-3] if t.endswith(".py") else t[0:-1] \
+                               if t.endswith("/") else t for t in options.tests]
+            self.tclist.extend([tc.replace("/", ".") for tc in tcs])
+
     def result(self):
         '''output test result '''
         return self.test_result
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 5886739..18e9543 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -69,6 +69,9 @@ class MyDataDict(dict):
     def getVar(self, key, unused = None):
         return self.get(key, "")
 
+class RunExportTestContext(ExportTestContext):
+    _configure_in_init = False
+
 def main():
 
     parser = argparse.ArgumentParser()
@@ -81,6 +84,12 @@ def main():
             specified in the json if that directory actually exists or it will error out.")
     parser.add_argument("-l", "--log-dir", dest="log_dir", help="This sets the path for TEST_LOG_DIR. If not specified \
             the current dir is used. This is used for usually creating a ssh log file and a scp test file.")
+    parser.add_argument("-f", "--manifest", dest="manifest",
+                        help="The test list file"),
+    parser.add_argument("-x", "--xunit", dest="xunit",
+                        help="Output result path of in xUnit XML format"),
+    parser.add_argument("-e", "--tests", dest="tests", action="append",
+                        help="Run tests by dot separated module path"),
     parser.add_argument("json", help="The json file exported by the build system", default="testdata.json", nargs='?')
 
     args = parser.parse_args()
@@ -114,7 +123,8 @@ def main():
         setattr(target, key, loaded["target"][key])
 
     target.exportStart()
-    tc = ExportTestContext(d, target, True)
+    tc = RunExportTestContext(d, target, True)
+    tc.configure(args)
     tc.loadTests()
     tc.runTests()
 
-- 
2.1.4


