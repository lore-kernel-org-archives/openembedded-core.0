Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C22A7601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:34:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jul 2016 06:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="988827326"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2016 06:34:12 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 05:28:11 +0000
Message-Id: <932369064295b6f68c10ed6753e2adefedc294b3.1467610017.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1467610017.git.mariano.lopez@linux.intel.com>
References: <cover.1467610017.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oetest.py: Add command line parameter support for tag in testexport
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
X-List-Received-Date: Mon, 04 Jul 2016 13:34:12 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This allows to use a command line argument to change the
tag used to filter test instead of rebuilding the tests.

[YOCTO #8532]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py      | 10 +++++++---
 meta/lib/oeqa/runexported.py |  6 +++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4a740fb..339f34d 100644
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
@@ -612,8 +612,12 @@ class ImageTestContext(RuntimeTestContext):
         super(ImageTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
 
 class ExportTestContext(RuntimeTestContext):
-    def __init__(self, d, target, exported=False):
+    def __init__(self, d, target, exported=False, *args, **kwargs):
         super(ExportTestContext, self).__init__(d, target, exported)
+
+        tag = kwargs.get("tag", None)
+        self.tagexp = tag if tag != None else d.getVar("TEST_SUITES_TAGS", True)
+
         self.sigterm = None
 
     def install_uninstall_packages(self, test_id, install=True):
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 5886739..b603d2f 100755
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
 
+    kwargs = {}
+    kwargs["tag"] = args.tag
+
     extract_sdk(d)
 
     target = FakeTarget(d)
@@ -114,7 +118,7 @@ def main():
         setattr(target, key, loaded["target"][key])
 
     target.exportStart()
-    tc = ExportTestContext(d, target, True)
+    tc = ExportTestContext(d, target, True, **kwargs)
     tc.loadTests()
     tc.runTests()
 
-- 
2.6.6


