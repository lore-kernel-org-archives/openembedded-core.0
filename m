Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 814B7771A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316027"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:00 -0700
Message-Id: <c002c75fd1bbc0f24695fad100d799f68be13beb.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 12/20] oeqa.selftest.oescripts: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:22 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/oescripts.conf |  6 ++++++
 meta/lib/oeqa/selftest/oescripts.py        | 31 ++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 8 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/oescripts.conf

diff --git a/meta/lib/oeqa/selftest/conf/oescripts.conf b/meta/lib/oeqa/selftest/conf/oescripts.conf
new file mode 100644
index 0000000..815c45e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/oescripts.conf
@@ -0,0 +1,6 @@
+[TestScripts]
+cleanup_workdir_package = gzip
+cleanup_workdir_old_version = 1.3.12
+
+[BuildhistoryDiffTests]
+buildhistory_diff_target = xcursor-transparent-theme
diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index 31cd508..5c734b50 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -9,27 +9,39 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class TestScripts(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     @testcase(300)
     def test_cleanup_workdir(self):
-        path = os.path.dirname(get_bb_var('WORKDIR', 'gzip'))
-        old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta/recipes-extended/gzip/gzip_1.3.12.bb')
-        old_version = '1.3.12'
-        bitbake("-ccleansstate gzip")
+        package = self.config.get('TestScripts', 'cleanup_workdir_package')
+        old_version = self.config.get(
+                    'TestScripts', 'cleanup_workdir_old_version')
+        path = os.path.dirname(get_bb_var('WORKDIR', package))
+        old_version_recipe = os.path.join(
+                                 get_bb_var('COREBASE'),
+                                 'meta/recipes-extended/%s/%s_%s.bb'
+                                 % (package, package, old_version))
+        bitbake("-ccleansstate %s" % package)
         bitbake("-ccleansstate -b %s" % old_version_recipe)
         if os.path.exists(get_bb_var('WORKDIR', "-b %s" % old_version_recipe)):
             shutil.rmtree(get_bb_var('WORKDIR', "-b %s" % old_version_recipe))
-        if os.path.exists(get_bb_var('WORKDIR', 'gzip')):
-            shutil.rmtree(get_bb_var('WORKDIR', 'gzip'))
+        if os.path.exists(get_bb_var('WORKDIR', package)):
+            shutil.rmtree(get_bb_var('WORKDIR', package))
 
         if os.path.exists(path):
             initial_contents = os.listdir(path)
         else:
             initial_contents = []
 
-        bitbake('gzip')
+        bitbake(package)
         intermediary_contents = os.listdir(path)
         bitbake("-b %s" % old_version_recipe)
         runCmd('cleanup-workdir')
@@ -45,8 +57,11 @@ class BuildhistoryDiffTests(BuildhistoryBase):
 
     @testcase(295)
     def test_buildhistory_diff(self):
+        # Get test configurations from configuration file
+        configlocal = conffile(__file__)
+        target = configlocal.get(
+               'BuildhistoryDiffTests', 'buildhistory_diff_target')
         self.add_command_to_tearDown('cleanup-workdir')
-        target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True)
         result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
-- 
1.8.3.1


