Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5AFA771C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316029"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:02 -0700
Message-Id: <6016fc39e4f876a552050807ef92e4c23798d7d7.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 14/20] oeqa.selftest.prservice: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:23 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/prservice.conf | 21 +++++++++
 meta/lib/oeqa/selftest/prservice.py        | 71 ++++++++++++++++++++++++++----
 2 files changed, 83 insertions(+), 9 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/prservice.conf

diff --git a/meta/lib/oeqa/selftest/conf/prservice.conf b/meta/lib/oeqa/selftest/conf/prservice.conf
new file mode 100644
index 0000000..2d5f315
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/prservice.conf
@@ -0,0 +1,21 @@
+[BitbakePrTests]
+import_export_replace_db_package = m4
+import_export_override_db_package = m4
+pr_service_rpm_arch_dep_package = m4
+pr_service_rpm_arch_dep_package_type = rpm
+pr_service_rpm_arch_dep_track_task = do_package
+pr_service_deb_arch_dep_package = m4
+pr_service_deb_arch_dep_package_type = deb
+pr_service_deb_arch_dep_track_task = do_package
+pr_service_ipk_arch_dep_package = m4
+pr_service_ipk_arch_dep_package_type = ipk
+pr_service_ipk_arch_dep_track_task = do_package
+pr_service_rpm_arch_indep_package = xcursor-transparent-theme
+pr_service_rpm_arch_indep_package_type = rpm
+pr_service_rpm_arch_indep_track_task = do_package
+pr_service_deb_arch_indep_package = xcursor-transparent-theme
+pr_service_deb_arch_indep_package_type = deb
+pr_service_deb_arch_indep_track_task = do_package
+pr_service_ipk_arch_indep_package = xcursor-transparent-theme
+pr_service_ipk_arch_indep_package_type = ipk
+pr_service_ipk_arch_indep_track_task = do_package
diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 1b9a510..af8ffec 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -10,9 +10,16 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.decorators import testcase
 from oeqa.utils.network import get_free_port
+from oeqa.utils.readconfig import conffile
+
 
 class BitbakePrTests(oeSelfTest):
- 
+
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     def get_pr_version(self, package_name):
         pkgdata_dir = get_bb_var('PKGDATA_DIR')
         package_data_file = os.path.join(pkgdata_dir, 'runtime', package_name)
@@ -91,35 +98,81 @@ class BitbakePrTests(oeSelfTest):
 
     @testcase(930)
     def test_import_export_replace_db(self):
-        self.run_test_pr_export_import('m4')
+        package = self.config.get(
+                'BitbakePrTests', 'import_export_replace_db_package')
+        self.run_test_pr_export_import(package)
 
     @testcase(931)
     def test_import_export_override_db(self):
-        self.run_test_pr_export_import('m4', replace_current_db=False)
+        package = self.config.get(
+                'BitbakePrTests', 'import_export_override_db_package')
+        self.run_test_pr_export_import(package, replace_current_db=False)
 
     @testcase(932)
     def test_pr_service_rpm_arch_dep(self):
-        self.run_test_pr_service('m4', 'rpm', 'do_package')
+        # Test configuration is taken from conf file
+        package = self.config.get(
+                'BitbakePrTests', 'pr_service_rpm_arch_dep_package')
+        package_type = self.config.get(
+                     'BitbakePrTests', 'pr_service_rpm_arch_dep_package_type')
+        track_task = self.config.get(
+                   'BitbakePrTests', 'pr_service_rpm_arch_dep_track_task')
+        self.run_test_pr_service(package, package_type, track_task)
 
     @testcase(934)
     def test_pr_service_deb_arch_dep(self):
-        self.run_test_pr_service('m4', 'deb', 'do_package')
+        # Get test configurations from configuration file
+        package = self.config.get(
+                'BitbakePrTests', 'pr_service_deb_arch_dep_package')
+        package_type = self.config.get(
+                     'BitbakePrTests', 'pr_service_deb_arch_dep_package_type')
+        track_task = self.config.get(
+                   'BitbakePrTests', 'pr_service_deb_arch_dep_track_task')
+        self.run_test_pr_service(package, package_type, track_task)
 
     @testcase(933)
     def test_pr_service_ipk_arch_dep(self):
-        self.run_test_pr_service('m4', 'ipk', 'do_package')
+        # Get test configurations from configuration file
+        package = self.config.get(
+                'BitbakePrTests', 'pr_service_ipk_arch_dep_package')
+        package_type = self.config.get(
+                     'BitbakePrTests', 'pr_service_ipk_arch_dep_package_type')
+        track_task = self.config.get(
+                   'BitbakePrTests', 'pr_service_ipk_arch_dep_track_task')
+        self.run_test_pr_service(package, package_type, track_task)
 
     @testcase(935)
     def test_pr_service_rpm_arch_indep(self):
-        self.run_test_pr_service('xcursor-transparent-theme', 'rpm', 'do_package')
+        # Get test configurations from configuration file
+        package = self.config.get(
+                'BitbakePrTests', 'pr_service_rpm_arch_indep_package')
+        package_type = self.config.get(
+                    'BitbakePrTests', 'pr_service_rpm_arch_indep_package_type')
+        track_task = self.config.get(
+                   'BitbakePrTests', 'pr_service_rpm_arch_indep_track_task')
+        self.run_test_pr_service(package, package_type, track_task)
 
     @testcase(937)
     def test_pr_service_deb_arch_indep(self):
-        self.run_test_pr_service('xcursor-transparent-theme', 'deb', 'do_package')
+        # Get test configurations from configuration file
+        package = self.config.get(
+                'BitbakePrTests', 'pr_service_deb_arch_indep_package')
+        package_type = self.config.get(
+                    'BitbakePrTests', 'pr_service_deb_arch_indep_package_type')
+        track_task = self.config.get(
+                   'BitbakePrTests', 'pr_service_deb_arch_indep_track_task')
+        self.run_test_pr_service(package, package_type, track_task)
 
     @testcase(936)
     def test_pr_service_ipk_arch_indep(self):
-        self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
+        # Get test configurations from configuration file
+        package = self.config.get(
+                'BitbakePrTests', 'pr_service_ipk_arch_indep_package')
+        package_type = self.config.get(
+                    'BitbakePrTests', 'pr_service_ipk_arch_indep_package_type')
+        track_task = self.config.get(
+                   'BitbakePrTests', 'pr_service_ipk_arch_indep_track_task')
+        self.run_test_pr_service(package, package_type, track_task)
 
     @testcase(1419)
     def test_stopping_prservice_message(self):
-- 
1.8.3.1


