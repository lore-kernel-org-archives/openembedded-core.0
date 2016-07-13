Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF046067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 19:53:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 12:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,358,1464678000"; d="scan'208";a="1016300822"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2016 12:53:29 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 11:47:09 +0000
Message-Id: <e2d4f9a2d3c8a8df9e825e53213fb014007f6210.1468410357.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1468410357.git.mariano.lopez@linux.intel.com>
References: <cover.1468410357.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oetest.py: Fix problem when there is more than one json file for package extraction
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
X-List-Received-Date: Wed, 13 Jul 2016 19:53:40 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This allow to have more than one test to have json file in order
to install packages in the DUT without using a package manager.

[YOCTO #9926]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4a740fb..e63ca56 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -441,12 +441,9 @@ class RuntimeTestContext(TestContext):
 
     def extract_packages(self):
         """
-        Find and extract packages that will be needed during runtime.
+        Find packages that will be needed during runtime.
         """
 
-        needed_packages = {}
-        extracted_path = self.d.getVar("TEST_EXTRACTED_DIR", True)
-        packaged_path = self.d.getVar("TEST_PACKAGED_DIR", True)
         modules = self.getTestModules()
         bbpaths = self.d.getVar("BBPATH", True).split(":")
 
@@ -454,6 +451,15 @@ class RuntimeTestContext(TestContext):
             json_file = self._getJsonFile(module)
             if json_file:
                 needed_packages = self._getNeededPackages(json_file)
+                self._perform_package_extraction(needed_packages)
+
+    def _perform_package_extraction(self, needed_packages):
+        """
+        Extract packages that will be needed during runtime.
+        """
+
+        extracted_path = self.d.getVar("TEST_EXTRACTED_DIR", True)
+        packaged_path = self.d.getVar("TEST_PACKAGED_DIR", True)
 
         for key,value in needed_packages.items():
             packages = ()
-- 
2.6.6


