Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4D6778312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 19:07:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBJJ7TPq007520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:07:29 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 19 Dec 2017 11:07:28 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Dec 2017 11:07:28 -0800
Message-ID: <20171219190728.133823-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] testsdk: add ability to search for multilib packages
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
X-List-Received-Date: Tue, 19 Dec 2017 19:07:29 -0000
Content-Type: text/plain

We search for packages related to the sdk environment
being used for a test.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py |  7 ++++---
 meta/lib/oeqa/sdk/context.py               | 15 +++++++++++++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 780afcc..8518b15 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -8,9 +8,10 @@ class GalculatorTest(OESDKTestCase):
 
     @classmethod
     def setUpClass(self):
-        if not (self.tc.hasTargetPackage("gtk\+3") or\
-                self.tc.hasTargetPackage("libgtk-3.0")):
-            raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
+        # search for the multilib package per sdk_env
+        if not (self.tc.hasPrefixedTargetPackage("gtk\+3") or
+                self.tc.hasPrefixedTargetPackage("libgtk-3.0")):
+            raise unittest.SkipTest("GalculatorTest class: SDK doesn't support gtk+3")
 
     def test_galculator(self):
         dl_dir = self.td.get('DL_DIR', None)
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index b3d7c75..291be1e 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -22,8 +22,9 @@ class OESDKTestContext(OETestContextThreaded):
         self.host_pkg_manifest = host_pkg_manifest
 
     def _hasPackage(self, manifest, pkg):
-        for host_pkg in manifest.keys():
-            if re.search(pkg, host_pkg):
+        pat = re.compile(pkg)
+        for s in manifest.keys():
+            if pat.search(s):
                 return True
         return False
 
@@ -33,6 +34,16 @@ class OESDKTestContext(OETestContextThreaded):
     def hasTargetPackage(self, pkg):
         return self._hasPackage(self.target_pkg_manifest, pkg)
 
+    def hasPrefixedTargetPackage(self, pkg):
+        # extract multilib from environment script name
+        try:
+            p = re.match(".*(lib.?[36][24]-)linux-?", self.sdk_env).group(1) + pkg
+        except:
+            p = pkg
+
+        # bb.warn("Searching for multilib pkg %s" % (p))
+        return self.hasTargetPackage(p)
+
 class OESDKTestContextExecutor(OETestContextExecutor):
     _context_class = OESDKTestContext
 
-- 
2.7.4


