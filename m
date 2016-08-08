Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17A4C771AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316012"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:50 -0700
Message-Id: <641b48f0e45b2ddef3fdaf3ecc186f71aa964742.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 02/20] oeqa.selftest._sstatetests_noauto: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:20 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/_sstatetests_noauto.py        | 9 +++++++--
 meta/lib/oeqa/selftest/conf/_sstatetests_noauto.conf | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/_sstatetests_noauto.conf

diff --git a/meta/lib/oeqa/selftest/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
index fc9ae7e..f35811e 100644
--- a/meta/lib/oeqa/selftest/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
@@ -8,6 +8,7 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.selftest.sstate import SStateBase
+from oeqa.utils.readconfig import conffile
 
 
 class RebuildFromSState(SStateBase):
@@ -15,6 +16,8 @@ class RebuildFromSState(SStateBase):
     @classmethod
     def setUpClass(self):
         self.builddir = os.path.join(os.environ.get('BUILDDIR'))
+        # Get test configurations from configuration file
+        self.config = conffile(__file__)
 
     def get_dep_targets(self, primary_targets):
         found_targets = []
@@ -89,7 +92,9 @@ class RebuildFromSState(SStateBase):
         self.assertFalse(failed_cleansstate, msg="The following recipes have failed cleansstate(all others have passed both cleansstate and rebuild from sstate tests): %s" % ' '.join(map(str, failed_cleansstate)))
 
     def test_sstate_relocation(self):
-        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=True, rebuild_dependencies=True)
+        image = self.config.get('RebuildFromSState', 'sstate_relocation_image')
+        self.run_test_sstate_rebuild([image], relocate=True, rebuild_dependencies=True)
 
     def test_sstate_rebuild(self):
-        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=False, rebuild_dependencies=True)
+        image = self.config.get('RebuildFromSState', 'sstate_rebuild_image')
+        self.run_test_sstate_rebuild([image], relocate=False, rebuild_dependencies=True)
diff --git a/meta/lib/oeqa/selftest/conf/_sstatetests_noauto.conf b/meta/lib/oeqa/selftest/conf/_sstatetests_noauto.conf
new file mode 100644
index 0000000..41854a0
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/_sstatetests_noauto.conf
@@ -0,0 +1,3 @@
+[RebuildFromSState]
+sstate_relocation_image = core-image-sato-sdk
+sstate_rebuild_image = core-image-sato-sdk
-- 
1.8.3.1


