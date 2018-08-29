Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C867778E72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 02:51:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7T2prlv009131
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 19:51:53 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 19:51:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 10:56:31 +0800
Message-ID: <cbce3d80ef660852e08a4bd3dfcf3fbc75e6ed23.1535511291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535511291.git.Qi.Chen@windriver.com>
References: <cover.1535511291.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa/sdk: fixes related to hasPackage semantics
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
X-List-Received-Date: Wed, 29 Aug 2018 02:51:52 -0000
Content-Type: text/plain

The current _hasPackage does a regex match when checking for the
existence of packages. This will sometimes result in unexpected
result. For example, the condition hasTargetPackage('gcc') is likely
to be always true as it matches libgcc1.

For most of the time, we should do exact match instead of regex match.
So change _hasPackage function to do that. For the current sdk test
cases, the only place that needs regex match is '^gcc-'. This is because
there's no easy way to get multilib tune arch (e.g. i686) from testdata.json
file.

Besides, packagegroup-cross-canadian-xxx and gcc-xxx should be check in
host manifest instead of the target one. So fix to use hasHostPackage.

Also, as we are doing exact match, there's no need to use r'gtk\+3',
just 'gtk+3' is enough.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py |  4 ++--
 meta/lib/oeqa/sdk/cases/buildlzip.py       |  4 ++--
 meta/lib/oeqa/sdk/cases/gcc.py             |  4 ++--
 meta/lib/oeqa/sdk/context.py               | 21 ++++++++++++++-------
 4 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 3714825..050d1b3 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -8,8 +8,8 @@ class GalculatorTest(OESDKTestCase):
 
     @classmethod
     def setUpClass(self):
-        if not (self.tc.hasTargetPackage(r"gtk\+3", multilib=True) or\
-                self.tc.hasTargetPackage(r"libgtk-3.0", multilib=True)):
+        if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
+                self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
         if not (self.tc.hasHostPackage("nativesdk-gettext-dev")):
             raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index 3a89ce8..b28cc3a 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -17,8 +17,8 @@ class BuildLzipTest(OESDKTestCase):
 
         machine = self.td.get("MACHINE")
 
-        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
-                self.tc.hasTargetPackage("gcc")):
+        if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
+                self.tc.hasHostPackage("^gcc-", regex=True)):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
     def test_lzip(self):
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index d11f4b6..b32b01f 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -18,8 +18,8 @@ class GccCompileTest(OESDKTestCase):
 
     def setUp(self):
         machine = self.td.get("MACHINE")
-        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s" % machine) or
-                self.tc.hasTargetPackage("gcc")):
+        if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
+                self.tc.hasHostPackage("^gcc-", regex=True)):
             raise unittest.SkipTest("GccCompileTest class: SDK doesn't contain a cross-canadian toolchain")
 
     def test_gcc_compile(self):
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index ec8972d..adc4166 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -20,23 +20,30 @@ class OESDKTestContext(OETestContext):
         self.target_pkg_manifest = target_pkg_manifest
         self.host_pkg_manifest = host_pkg_manifest
 
-    def _hasPackage(self, manifest, pkg):
-        for host_pkg in manifest.keys():
-            if re.search(pkg, host_pkg):
+    def _hasPackage(self, manifest, pkg, regex=False):
+        if regex:
+            # do regex match
+            pat = re.compile(pkg)
+            for p in manifest.keys():
+                if pat.search(p):
+                    return True
+        else:
+            # do exact match
+            if pkg in manifest.keys():
                 return True
         return False
 
-    def hasHostPackage(self, pkg):
-        return self._hasPackage(self.host_pkg_manifest, pkg)
+    def hasHostPackage(self, pkg, regex=False):
+        return self._hasPackage(self.host_pkg_manifest, pkg, regex=regex)
 
-    def hasTargetPackage(self, pkg, multilib=False):
+    def hasTargetPackage(self, pkg, multilib=False, regex=False):
         if multilib:
             # match multilib according to sdk_env
             mls = self.td.get('MULTILIB_VARIANTS', '').split()
             for ml in mls:
                 if ('ml'+ml) in self.sdk_env:
                     pkg = ml + '-' + pkg
-        return self._hasPackage(self.target_pkg_manifest, pkg)
+        return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
 class OESDKTestContextExecutor(OETestContextExecutor):
     _context_class = OESDKTestContext
-- 
1.9.1


