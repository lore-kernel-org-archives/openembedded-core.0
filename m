Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2B66C6057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326950"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:05 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:13 +0000
Message-Id: <9b4f2532f912af124b553a6f33ebcf9c2fc1704a.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 04/10] oetest.py: Add json file support to specify packages needed in runtime tests
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
X-List-Received-Date: Tue, 24 May 2016 20:49:04 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds the functionality to use a json file to
specify the packages needed for a particular test.

The content of the json file is a dictionary with
dictionaries inside, using the test name as the hash.

The json file must have the same name as the class
module name and must be in the same path.

[YOCTO #7850]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 8ad3715..7abd850 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -385,6 +385,43 @@ class RuntimeTestContext(TestContext):
         if oeTest.hasPackage("procps"):
             oeRuntimeTest.pscmd = "ps -ef"
 
+    def _getJsonFile(self, module):
+        """
+        Returns the path of the JSON file for a module, empty if doesn't exitst.
+        """
+
+        module_file = module.filename
+        json_file = "%s.json" % module_file.rsplit(".", 1)[0]
+        if os.path.isfile(module_file) and os.path.isfile(json_file):
+            return json_file
+        else:
+            return ""
+
+    def _getNeededPackages(self, json_file, test=None):
+        """
+        Returns a dict with needed packages based on a JSON file.
+
+
+        If a test is specified it will return the dict just for that test.
+        """
+
+        import json
+
+        needed_packages = {}
+
+        with open(json_file) as f:
+            test_packages = json.load(f)
+        for key,value in test_packages.items():
+            needed_packages[key] = value
+
+        if test:
+            if test in needed_packages:
+                needed_packages = needed_packages[test]
+            else:
+                needed_packages = {}
+
+        return needed_packages
+
 class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d, target)
-- 
2.6.6


