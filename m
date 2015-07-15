Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EF99D734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:39:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2015 07:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="524767585"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2015 07:39:30 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id DB2C56A4083;
	Wed, 15 Jul 2015 07:38:47 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 17:39:52 +0300
Message-Id: <1436971192-4828-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime: Added a new automated rpm test.
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
X-List-Received-Date: Wed, 15 Jul 2015 14:39:30 -0000

testcase 195: Check rpm install/removal log file size

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 4ca193b..32aae24 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -58,6 +58,43 @@ class RpmInstallRemoveTest(oeRuntimeTest):
         (status, output) = self.target.run('sudo -u test1 rpm -qa')
         self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa" % status)
 
+    @testcase(195)
+    @skipUnlessPassed('test_rpm_install')
+    def test_check_rpm_install_removal_log_file_size(self):
+        """
+        Summary:     Check rpm install/removal log file size
+        Expected:    There should be some method to keep rpm log in a small size .
+        Product:     BSPs
+        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+        db_files_cmd = 'ls /var/lib/rpm/__db.*'
+        get_log_size_cmd = "du /var/lib/rpm/log/log.* | awk '{print $1}'"
+
+        # Make sure that some database files are under /var/lib/rpm as '__db.xxx'
+        (status, output) = self.target.run(db_files_cmd)
+        self.assertEqual(0, status, 'Failed to find database files under /var/lib/rpm/ as __db.xxx')
+
+        # Remove the package just in case
+        self.target.run('rpm -e rpm-doc')
+
+        # Install/Remove a package 10 times
+        for i in range(10):
+            (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
+            self.assertEqual(0, status, "Failed to install rpm-doc package. Reason: {}".format(output))
+
+            (status, output) = self.target.run('rpm -e rpm-doc')
+            self.assertEqual(0, status, "Failed to remove rpm-doc package. Reason: {}".format(output))
+
+        # Get the size of log file
+        (status, output) = self.target.run(get_log_size_cmd)
+        self.assertEqual(0, status, 'Failed to get the final size of the log file.')
+
+        # Compare each log size
+        for log_file_size in output:
+            self.assertLessEqual(int(log_file_size), 11264,
+                                   'Log file size is greater that expected (~10MB), found {} bytes'.format(log_file_size))
+
     @classmethod
     def tearDownClass(self):
         oeRuntimeTest.tc.target.run('rm -f /tmp/rpm-doc.rpm')
-- 
2.1.4


