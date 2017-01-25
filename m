Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9C071DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 17:07:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jan 2017 09:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,284,1477983600"; d="scan'208";a="1117733296"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2017 09:07:37 -0800
Received: from fjpedraz-MOBL3.zpn.intel.com (fjpedraz-mobl3.zpn.intel.com
	[10.219.128.40])
	by linux.intel.com (Postfix) with ESMTP id 41D916A4080;
	Wed, 25 Jan 2017 09:06:40 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 11:07:34 -0600
Message-Id: <1485364054-29919-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v1] oeqa/sdk: Updates sanity tests for minimal eSDK
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
X-List-Received-Date: Wed, 25 Jan 2017 17:07:48 -0000

Updates sanity tests to cope with minimal eSDK installer
1. Skips the validation of sanity if packagegroup-cross-canadian is in
host package.
2. Skips if SDK does not include toolchain at cases/devtool.py

This should fix [YOCTO #10794]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildcvs.py      | 5 +++++
 meta/lib/oeqa/sdk/cases/buildiptables.py | 7 +++++++
 meta/lib/oeqa/sdkext/cases/devtool.py    | 7 +++++++
 3 files changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/buildcvs.py b/meta/lib/oeqa/sdk/cases/buildcvs.py
index 6222a8e..8cbbca1 100644
--- a/meta/lib/oeqa/sdk/cases/buildcvs.py
+++ b/meta/lib/oeqa/sdk/cases/buildcvs.py
@@ -1,3 +1,4 @@
+import unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
@@ -13,6 +14,10 @@ class BuildCvsTest(OESDKTestCase):
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
+        machine = self.td.get("MACHINE")
+        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
+            raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
+
     def test_cvs(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildiptables.py
index 532b5de..0bd00d1 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildiptables.py
@@ -1,6 +1,8 @@
+import unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
+
 class BuildIptablesTest(OESDKTestCase):
     td_vars = ['DATETIME']
 
@@ -13,6 +15,11 @@ class BuildIptablesTest(OESDKTestCase):
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
+        machine = self.td.get("MACHINE")
+
+        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
+            raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
+
     def test_iptables(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index da0050c..eda0d81 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -7,6 +7,7 @@ import subprocess
 from oeqa.sdkext.case import OESDKExtTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotDataVar
 
 class DevtoolTest(OESDKExtTestCase):
     @classmethod
@@ -51,21 +52,25 @@ class DevtoolTest(OESDKExtTestCase):
     
     @OETestID(1473)
     @OETestDepends(['test_devtool_location'])
+    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
     
     @OETestID(1474)
     @OETestDepends(['test_devtool_location'])
+    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_esdk_package(self):
         self._test_devtool_build_package(self.myapp_dst)
 
     @OETestID(1479)
     @OETestDepends(['test_devtool_location'])
+    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
     
     @OETestID(1482)
     @OETestDepends(['test_devtool_location'])
+    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "bbexample"
@@ -80,6 +85,7 @@ class DevtoolTest(OESDKExtTestCase):
 
     @OETestID(1484)
     @OETestDepends(['test_devtool_location'])
+    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_kernelmodule(self):
         docfile = 'https://github.com/umlaeute/v4l2loopback.git'
         recipe = 'v4l2loopback-driver'
@@ -94,6 +100,7 @@ class DevtoolTest(OESDKExtTestCase):
 
     @OETestID(1478)
     @OETestDepends(['test_devtool_location'])
+    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_recipes_for_nodejs(self):
         package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
         self._run('devtool add %s ' % package_nodejs)
-- 
2.5.0


