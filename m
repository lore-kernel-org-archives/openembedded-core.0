Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA436FF6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326961"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:07 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:15 +0000
Message-Id: <f9c014b98db152d2fb0924a590dcd80101c77b35.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 06/10] oetest.py: Add support to copy unextracted packages for runtime testing
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
X-List-Received-Date: Tue, 24 May 2016 20:49:06 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Sometimes is needed to have a package without extraction when
running a test. This patch adds the functionality.

[YOCTO #8536]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 8dd494a..a50f9d8 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -409,6 +409,7 @@ class RuntimeTestContext(TestContext):
 
         needed_packages = {}
         extracted_path = self.d.getVar("TEST_EXTRACTED_DIR", True)
+        packaged_path = self.d.getVar("TEST_PACKAGED_DIR", True)
         modules = self.getTestModules()
         bbpaths = self.d.getVar("BBPATH", True).split(":")
 
@@ -433,6 +434,8 @@ class RuntimeTestContext(TestContext):
                 extract = package.get("extract", True)
                 if extract:
                     dst_dir = os.path.join(extracted_path, pkg)
+                else:
+                    dst_dir = os.path.join(packaged_path)
 
                 # Extract package and copy it to TEST_EXTRACTED_DIR
                 if extract and not os.path.exists(dst_dir):
@@ -440,6 +443,10 @@ class RuntimeTestContext(TestContext):
                     shutil.copytree(pkg_dir, dst_dir)
                     shutil.rmtree(pkg_dir)
 
+                # Copy package to TEST_PACKAGED_DIR
+                elif not extract:
+                    self._copy_package(pkg)
+
     def _getJsonFile(self, module):
         """
         Returns the path of the JSON file for a module, empty if doesn't exitst.
@@ -492,6 +499,21 @@ class RuntimeTestContext(TestContext):
 
         return extract_dir
 
+    def _copy_package(self, pkg):
+        """
+        Copy the RPM, DEB or IPK package to dst_dir
+        """
+
+        from oeqa.utils.package_manager import get_package_manager
+
+        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR", True), pkg)
+        dst_dir = self.d.getVar("TEST_PACKAGED_DIR", True)
+        pm = get_package_manager(self.d, pkg_path)
+        pkg_info = pm.package_info(pkg)
+        file_path = pkg_info[pkg]["filepath"]
+        shutil.copy2(file_path, dst_dir)
+        shutil.rmtree(pkg_path)
+
 class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d, target)
-- 
2.6.6


