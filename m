Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09B3F73119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 20:04:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 13:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,305,1496127600"; d="scan'208";a="1167686147"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2017 13:04:17 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 13:04:15 -0700
Message-Id: <20170703200415.8736-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com^C--confirm=always>
References: <20170703162641.42332-1-jose.perez.carranza@linux.intel.com^C--confirm=always>
MIME-Version: 1.0
Subject: [PATCH v2] oeqa/sdk: Replace buildiptables for buildlzip tests
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
X-List-Received-Date: Mon, 03 Jul 2017 20:04:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Buildiptables test cases are conflicting with images built with “musl”
as standard C library, in order to avoid those issues lzip package was
selected to be used on the tests as this does not have any "musl"
dependency.

[YOCTO #11713]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} (84%)

diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
similarity index 84%
rename from meta/lib/oeqa/sdk/cases/buildiptables.py
rename to meta/lib/oeqa/sdk/cases/buildlzip.py
index 419c7ebd09b..3a89ce86276 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -3,15 +3,15 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
 
-class BuildIptablesTest(OESDKTestCase):
+class BuildLzipTest(OESDKTestCase):
     td_vars = ['DATETIME']
 
     @classmethod
     def setUpClass(self):
         dl_dir = self.td.get('DL_DIR', None)
 
-        self.project = SDKBuildProject(self.tc.sdk_dir + "/iptables/", self.tc.sdk_env, 
-                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2",
+        self.project = SDKBuildProject(self.tc.sdk_dir + "/lzip/", self.tc.sdk_env,
+                        "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz",
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
@@ -21,7 +21,7 @@ class BuildIptablesTest(OESDKTestCase):
                 self.tc.hasTargetPackage("gcc")):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
-    def test_iptables(self):
+    def test_lzip(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
 
-- 
2.12.0


