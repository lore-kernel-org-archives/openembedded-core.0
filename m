Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B9C987309A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 21:03:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 06 Jul 2017 14:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,319,1496127600"; d="scan'208";a="1169411942"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2017 14:03:10 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:03:07 -0700
Message-Id: <10ab7f62538cf461e911f81df8e8e1ec28944f5a.1499373694.git.jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1499373694.git.jose.perez.carranza@linux.intel.com>
References: <cover.1499373694.git.jose.perez.carranza@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/runtime: Replace buildiptables for buildlzip on runtime tests
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
X-List-Received-Date: Thu, 06 Jul 2017 21:03:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Buildiptables test cases are conflicting with images built with “musl”
as standard C library, in order to avoid those issues lzip package was
selected to be used on the tests as this does not have any "musl"
dependency.

This patch is applicable for testimage tests

[YOCTO # 11713]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/{buildiptables.py => buildlzip.py} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/lib/oeqa/runtime/cases/{buildiptables.py => buildlzip.py} (89%)

diff --git a/meta/lib/oeqa/runtime/cases/buildiptables.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
similarity index 89%
rename from meta/lib/oeqa/runtime/cases/buildiptables.py
rename to meta/lib/oeqa/runtime/cases/buildlzip.py
index 002b16c4835..ca3fead2e49 100644
--- a/meta/lib/oeqa/runtime/cases/buildiptables.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -5,12 +5,12 @@ from oeqa.core.decorator.data import skipIfNotFeature
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
-class BuildIptablesTest(OERuntimeTestCase):
+class BuildLzipTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
         uri = 'http://downloads.yoctoproject.org/mirror/sources'
-        uri = '%s/iptables-1.4.13.tar.bz2' % uri
+        uri = '%s/lzip-1.19.tar.gz' % uri
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
@@ -24,7 +24,7 @@ class BuildIptablesTest(OERuntimeTestCase):
     @skipIfNotFeature('tools-sdk',
                       'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_iptables(self):
+    def test_lzip(self):
         self.project.run_configure()
         self.project.run_make()
         self.project.run_install()
-- 
2.12.0


