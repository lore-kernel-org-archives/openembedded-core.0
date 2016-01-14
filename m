Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C223D731EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 22:25:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2016 14:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,296,1449561600"; d="scan'208";a="881619263"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.151])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2016 14:25:24 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: poky@yoctoproject.org
Date: Thu, 14 Jan 2016 16:27:03 -0600
Message-Id: <a0064e7a8877fa00724ac15263fd51ee04545bb2.1452808373.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452808370.git.anibal.limon@linux.intel.com>
References: <cover.1452808370.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1452808370.git.anibal.limon@linux.intel.com>
References: <cover.1452808370.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org,
	georgex.l.musat@intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 2/3] ptests: Update references to new ptest-runner2.
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
X-List-Received-Date: Thu, 14 Jan 2016 22:25:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

classes/ptest.bbclass: Now recommends ptest-runner2 instead of
			ptest-runner.
oeqa/runtime/_ptest.py: Now validate if ptest-runner2 is installed.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/ptest.bbclass      | 2 +-
 meta/lib/oeqa/runtime/_ptest.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index fa3561e..c84ca97 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -12,7 +12,7 @@ PTEST_ENABLED_class-nativesdk = ""
 PTEST_ENABLED_class-cross-canadian = ""
 RDEPENDS_${PN}-ptest_class-native = ""
 RDEPENDS_${PN}-ptest_class-nativesdk = ""
-RRECOMMENDS_${PN}-ptest += "ptest-runner"
+RRECOMMENDS_${PN}-ptest += "ptest-runner2"
 
 PACKAGES =+ "${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}"
 
diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 0621028..d1e51a4 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -105,10 +105,10 @@ class PtestRunnerTest(oeRuntimeTest):
     def test_ptestrunner(self):
         self.add_smart_channel()
         (runnerstatus, result) = self.target.run('which ptest-runner', 0)
-        cond = oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest") and (runnerstatus != 0)
+        cond = oeRuntimeTest.hasPackage("ptest-runner2") and oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest") and (runnerstatus != 0)
         if cond:
             self.install_packages(self.install_complementary("*-ptest"))
-            self.install_packages(['ptest-runner'])
+            self.install_packages(['ptest-runner2'])
 
         (runnerstatus, result) = self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
         #exit code is !=0 even if ptest-runner executes because some ptest tests fail.
-- 
2.1.4


