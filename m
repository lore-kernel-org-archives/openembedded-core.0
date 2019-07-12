Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D20C77F095
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 08:43:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6C8hBiD013423
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 01:43:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 01:43:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2019 16:55:28 +0800
Message-ID: <696a7f0f869fe79136d5ffa0ea08d54e152d1b40.1562921582.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562921582.git.Qi.Chen@windriver.com>
References: <cover.1562921582.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] rpm.py: move test_rpm_query_nonroot test case to RpmBasicTest
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
X-List-Received-Date: Fri, 12 Jul 2019 08:43:10 -0000
Content-Type: text/plain

The test_rpm_query_nonroot test case was in RpmInstallRemoveTest.
But it should logically belong to RpmBasicTest. So move it there.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 59 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 2b45d34..8e18b42 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -30,35 +30,6 @@ class RpmBasicTest(OERuntimeTestCase):
         msg = 'status and output: %s and %s' % (status, output)
         self.assertEqual(status, 0, msg=msg)
 
-class RpmInstallRemoveTest(OERuntimeTestCase):
-
-    @classmethod
-    def setUpClass(cls):
-        pkgarch = cls.td['TUNE_PKGARCH'].replace('-', '_')
-        rpmdir = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm', pkgarch)
-        # Pick base-passwd-doc as a test file to get installed, because it's small
-        # and it will always be built for standard targets
-        rpm_doc = 'base-passwd-doc-*.%s.rpm' % pkgarch
-        if not os.path.exists(rpmdir):
-            return
-        for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
-            cls.test_file = os.path.join(rpmdir, f)
-        cls.dst = '/tmp/base-passwd-doc.rpm'
-
-    @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
-    def test_rpm_install(self):
-        self.tc.target.copyTo(self.test_file, self.dst)
-        status, output = self.target.run('rpm -ivh /tmp/base-passwd-doc.rpm')
-        msg = 'Failed to install base-passwd-doc package: %s' % output
-        self.assertEqual(status, 0, msg=msg)
-        self.tc.target.run('rm -f %s' % self.dst)
-
-    @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_install'])
-    def test_rpm_remove(self):
-        status,output = self.target.run('rpm -e base-passwd-doc')
-        msg = 'Failed to remove base-passwd-doc package: %s' % output
-        self.assertEqual(status, 0, msg=msg)
-
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
     def test_rpm_query_nonroot(self):
 
@@ -105,6 +76,36 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         finally:
             unset_up_test_user(tuser)
 
+
+class RpmInstallRemoveTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        pkgarch = cls.td['TUNE_PKGARCH'].replace('-', '_')
+        rpmdir = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm', pkgarch)
+        # Pick base-passwd-doc as a test file to get installed, because it's small
+        # and it will always be built for standard targets
+        rpm_doc = 'base-passwd-doc-*.%s.rpm' % pkgarch
+        if not os.path.exists(rpmdir):
+            return
+        for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
+            cls.test_file = os.path.join(rpmdir, f)
+        cls.dst = '/tmp/base-passwd-doc.rpm'
+
+    @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
+    def test_rpm_install(self):
+        self.tc.target.copyTo(self.test_file, self.dst)
+        status, output = self.target.run('rpm -ivh /tmp/base-passwd-doc.rpm')
+        msg = 'Failed to install base-passwd-doc package: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        self.tc.target.run('rm -f %s' % self.dst)
+
+    @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_install'])
+    def test_rpm_remove(self):
+        status,output = self.target.run('rpm -e base-passwd-doc')
+        msg = 'Failed to remove base-passwd-doc package: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
     @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_remove'])
     def test_check_rpm_install_removal_log_file_size(self):
         """
-- 
1.9.1


