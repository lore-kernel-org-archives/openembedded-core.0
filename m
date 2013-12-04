Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id ED7E66CE97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:15:51 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Dec 2013 05:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,824,1378882800"; d="scan'208";a="394023367"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2013 05:15:32 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id CCA306A4010;
	Wed,  4 Dec 2013 05:15:29 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:16:01 +0200
Message-Id: <1386162961-8114-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/selftest: add tests for PR service
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
X-List-Received-Date: Wed, 04 Dec 2013 13:15:52 -0000

From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/selftest/prservice.py | 113 ++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/prservice.py

diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
new file mode 100644
index 0000000..789c05f
--- /dev/null
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -0,0 +1,113 @@
+import unittest
+import os
+import logging
+import re
+import shutil
+import datetime
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+
+class BitbakePrTests(oeSelfTest):
+
+    def get_pr_version(self, package_name):
+        pkgdata_dir = get_bb_var('PKGDATA_DIR')
+        package_data_file = os.path.join(pkgdata_dir, 'runtime', package_name)
+        package_data = ftools.read_file(package_data_file)
+        find_pr = re.search("PKGR: r[0-9]+\.([0-9]+)", package_data)
+        self.assertTrue(find_pr)
+        return int(find_pr.group(1))
+
+    def get_task_stamp(self, package_name, recipe_task):
+        stampdata = get_bb_var('STAMP', target=package_name).split('/')
+        prefix = stampdata[-1]
+        package_stamps_path = "/".join(stampdata[:-1])
+        stamps = []
+        for stamp in os.listdir(package_stamps_path):
+            find_stamp = re.match("%s\.%s\.([a-z0-9]{32})" % (prefix, recipe_task), stamp)
+            if find_stamp:
+                stamps.append(find_stamp.group(1))
+        self.assertFalse(len(stamps) == 0, msg="Cound not find stamp for task %s for recipe %s" % (recipe_task, package_name))
+        self.assertFalse(len(stamps) > 1, msg="Found multiple %s stamps for the %s recipe in the %s directory." % (recipe_task, package_name, package_stamps_path))
+        return str(stamps[0])
+
+    def increment_package_pr(self, package_name):
+        inc_data = "do_package_append() {\nbb.build.exec_func('do_test_prserv', d)\n}\ndo_test_prserv() {\necho \"The current date is: %s\"\n}" % datetime.datetime.now()
+        self.write_recipeinc(package_name, inc_data)
+        bitbake("-ccleansstate %s" % package_name)
+        res = bitbake(package_name, ignore_status=True)
+        self.delete_recipeinc(package_name)
+        self.assertEqual(res.status, 0, msg=res.output)
+        self.assertTrue("NOTE: Started PRServer with DBfile" in res.output, msg=res.output)
+
+    def config_pr_tests(self, package_name, package_type='rpm', pr_socket='localhost:0'):
+        config_package_data = 'PACKAGE_CLASSES = "package_%s"' % package_type
+        self.write_config(config_package_data)
+        config_server_data = 'PRSERV_HOST = "%s"' % pr_socket
+        self.append_config(config_server_data)
+
+    def run_test_pr_service(self, package_name, package_type='rpm', track_task='do_package', pr_socket='localhost:0'):
+        self.config_pr_tests(package_name, package_type, pr_socket)
+
+        self.increment_package_pr(package_name)
+        pr_1 = self.get_pr_version(package_name)
+        stamp_1 = self.get_task_stamp(package_name, track_task)
+
+        self.increment_package_pr(package_name)
+        pr_2 = self.get_pr_version(package_name)
+        stamp_2 = self.get_task_stamp(package_name, track_task)
+
+        bitbake("-ccleansstate %s" % package_name)
+        self.assertTrue(pr_2 - pr_1 == 1)
+        self.assertTrue(stamp_1 != stamp_2)
+
+    def run_test_pr_export_import(self, package_name, replace_current_db=True):
+        self.config_pr_tests(package_name)
+
+        self.increment_package_pr(package_name)
+        pr_1 = self.get_pr_version(package_name)
+
+        exported_db_path = os.path.join(self.builddir, 'export.inc')
+        export_result = runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
+        self.assertEqual(export_result.status, 0, msg="PR Service database export failed: %s" % export_result.output)
+
+        if replace_current_db:
+            current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
+            self.assertTrue(os.path.exists(current_db_path), msg="Path to current PR Service database is invalid: %s" % current_db_path)
+            os.remove(current_db_path)
+
+        import_result = runCmd("bitbake-prserv-tool import %s" % exported_db_path, ignore_status=True)
+        os.remove(exported_db_path)
+        self.assertEqual(import_result.status, 0, msg="PR Service database import failed: %s" % import_result.output)
+
+        self.increment_package_pr(package_name)
+        pr_2 = self.get_pr_version(package_name)
+
+        bitbake("-ccleansstate %s" % package_name)
+        self.assertTrue(pr_2 - pr_1 == 1)
+
+
+    def test_import_export_replace_db(self):
+        self.run_test_pr_export_import('m4')
+
+    def test_import_export_override_db(self):
+        self.run_test_pr_export_import('m4', replace_current_db=False)
+
+    def test_pr_service_rpm_arch_dep(self):
+        self.run_test_pr_service('m4', 'rpm', 'do_package')
+
+    def test_pr_service_deb_arch_dep(self):
+        self.run_test_pr_service('m4', 'deb', 'do_package')
+
+    def test_pr_service_ipk_arch_dep(self):
+        self.run_test_pr_service('m4', 'ipk', 'do_package')
+
+    def test_pr_service_rpm_arch_indep(self):
+        self.run_test_pr_service('xcursor-transparent-theme', 'rpm', 'do_package')
+
+    def test_pr_service_deb_arch_indep(self):
+        self.run_test_pr_service('xcursor-transparent-theme', 'deb', 'do_package')
+
+    def test_pr_service_ipk_arch_indep(self):
+        self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
-- 
1.8.3.1


