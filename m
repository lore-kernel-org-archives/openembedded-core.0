Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE5227732D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:00:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 07:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; d="scan'208";a="1101886350"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2017 07:00:08 -0800
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id 251A26A4080;
	Fri, 24 Feb 2017 07:00:08 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 07:00:07 -0800
Message-Id: <1487948407-18563-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v2] oeqa/sdk/cases:Adds validation for SDK compatibility tests
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
X-List-Received-Date: Fri, 24 Feb 2017 15:00:08 -0000

Added validation for SDK compatibility tests with eSDK.
buildcvs, buildiptables, gcc, perl, python and buildgalculator based on target manifest file.
Running with: $ bitbake <image> -c testsdkext
[YOCTO #9090]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildcvs.py        | 8 ++++----
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 4 +++-
 meta/lib/oeqa/sdk/cases/buildiptables.py   | 8 ++++----
 meta/lib/oeqa/sdk/cases/gcc.py             | 6 ++++--
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildcvs.py b/meta/lib/oeqa/sdk/cases/buildcvs.py
index 1ffd8cb..4b6a79d 100644
--- a/meta/lib/oeqa/sdk/cases/buildcvs.py
+++ b/meta/lib/oeqa/sdk/cases/buildcvs.py
@@ -15,10 +15,10 @@ class BuildCvsTest(OESDKTestCase):
         self.project.download_archive()
 
         machine = self.td.get("MACHINE")
-        if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or 
-                self.tc.hasHostPackage("gcc-runtime") or
-                self.tc.hasHostPackage("libgcc") or
-                self.tc.hasHostPackage("gcc-sanitizers")):
+        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or 
+                self.tc.hasTargetPackage("gcc-runtime") or
+                self.tc.hasTargetPackage("libgcc") or
+                self.tc.hasTargetPackage("gcc-sanitizers")):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
     def test_cvs(self):
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 42e8ddb..76874ad 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -9,7 +9,9 @@ class GalculatorTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
         if not (self.tc.hasTargetPackage("gtk+3") or\
-                self.tc.hasTargetPackage("libgtk-3.0")):
+                self.tc.hasTargetPackage("libgtk-3.0") or
+                self.tc.hasTargetPackage("gtk+") or
+                self.tc.hasTargetPackage("matchbox-config-gtk")):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
 
     def test_galculator(self):
diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildiptables.py
index 621fb55..d7a0e6a 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildiptables.py
@@ -17,10 +17,10 @@ class BuildIptablesTest(OESDKTestCase):
 
         machine = self.td.get("MACHINE")
 
-        if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
-                self.tc.hasHostPackage("gcc-runtime") or
-                self.tc.hasHostPackage("libgcc") or
-                self.tc.hasHostPackage("gcc-sanitizers")):
+        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
+                self.tc.hasTargetPackage("gcc-runtime") or
+                self.tc.hasTargetPackage("libgcc") or
+                self.tc.hasTargetPackage("gcc-sanitizers")):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
     def test_iptables(self):
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index d869247..a183cfc 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -18,8 +18,10 @@ class GccCompileTest(OESDKTestCase):
 
     def setUp(self):
         machine = self.td.get("MACHINE")
-        if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
-                self.tc.hasHostPackage("gcc-runtime")):
+        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
+                self.tc.hasTargetPackage("gcc-runtime") or
+                self.tc.hasTargetPackage("libgcc") or 
+                self.tc.hasTargetPackage("gcc-sanitizers")):
             raise unittest.SkipTest("GccCompileTest class: SDK doesn't contain a cross-canadian toolchain")
 
     def test_gcc_compile(self):
-- 
1.8.3.1


