Return-Path: <junhuix.zhang@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCCA75D2F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 09:28:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2015 02:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,399,1432623600"; d="scan'208";a="722301257"
Received: from dddd.sh.intel.com ([10.239.52.71])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2015 02:28:06 -0700
From: zjh <junhuix.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jul 2015 17:32:35 +0800
Message-Id: <1435915955-2095-1-git-send-email-junhuix.zhang@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 2/2] testimage.bbclass: add support for test suites manifest files 7848
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
X-List-Received-Date: Fri, 03 Jul 2015 09:28:12 -0000

Signed-off-by: zjh <junhuix.zhang@intel.com>
---
 meta/classes/testimage.bbclass | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 5d74fe4..2c66b5d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -66,15 +66,37 @@ do_testsdk[nostamp] = "1"
 do_testsdk[depends] += "${TESTIMAGEDEPENDS}"
 do_testsdk[lockfiles] += "${TESTIMAGELOCK}"
 
+# get testcase list from specified file
+# if path is a relative path, then relative to build/conf/
+def read_testlist(d, fpath):
+    if not os.path.isabs(fpath):
+        builddir = d.getVar("TOPDIR", True)
+        fpath = os.path.join(builddir, "conf", fpath)
+    if not os.path.exists(fpath):
+        bb.fatal("No such manifest file: ", fpath)
+    tcs = []
+    for line in open(fpath).readlines():
+        line = line.strip()
+        if line and not line.startswith("#"):
+            tcs.append(line)
+    return " ".join(tcs)
+
 def get_tests_list(d, type="runtime"):
-    testsuites = d.getVar("TEST_SUITES", True).split()
+    testsuites = []
+    testslist = []
+    manifests = d.getVar("TEST_SUITES_MANIFEST", True)
+    if manifests is not None:
+        manifests = manifests.split()
+        for manifest in manifests:
+            testsuites.extend(read_testlist(d, manifest).split())
+    else:
+        testsuites = d.getVar("TEST_SUITES", True).split()
     if type == "sdk":
         testsuites = (d.getVar("TEST_SUITES_SDK", True) or "auto").split()
     bbpath = d.getVar("BBPATH", True).split(':')
 
     # This relies on lib/ under each directory in BBPATH being added to sys.path
     # (as done by default in base.bbclass)
-    testslist = []
     for testname in testsuites:
         if testname != "auto":
             if testname.startswith("oeqa."):
-- 
1.9.1


