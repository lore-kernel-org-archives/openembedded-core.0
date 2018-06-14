Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE54789EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 04:50:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5E4o82H025500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 21:50:24 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 21:49:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2018 12:52:32 +0800
Message-ID: <0273521858960b5e6bc63bd83284115dc97a566f.1528951773.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528951773.git.Qi.Chen@windriver.com>
References: <cover.1528951773.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa/runtime/cases/rpm.py: change to use base-passwd-doc
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
X-List-Received-Date: Thu, 14 Jun 2018 04:50:33 -0000
Content-Type: text/plain

The test cases assume that rpm-doc is built out, as it says it its
comment. This is not always true. And it sometimes results in
following error.

  |     cls.tc.target.copyTo(test_file, dst)
  | UnboundLocalError: local variable 'test_file' referenced before assignment

Change to use base-passwd-doc, as this package is more likely to be
built out than rpm-doc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 58df28b..1e5e463 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -39,31 +39,31 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
 
         pkgarch = cls.td['TUNE_PKGARCH'].replace('-', '_')
         rpmdir = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm', pkgarch)
-        # Pick rpm-doc as a test file to get installed, because it's small
+        # Pick base-passwd-doc as a test file to get installed, because it's small
         # and it will always be built for standard targets
-        rpm_doc = 'rpm-doc-*.%s.rpm' % pkgarch
+        rpm_doc = 'base-passwd-doc-*.%s.rpm' % pkgarch
         for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
             test_file = os.path.join(rpmdir, f)
-        dst = '/tmp/rpm-doc.rpm'
+        dst = '/tmp/base-passwd-doc.rpm'
         cls.tc.target.copyTo(test_file, dst)
 
     @classmethod
     def tearDownClass(cls):
-        dst = '/tmp/rpm-doc.rpm'
+        dst = '/tmp/base-passwd-doc.rpm'
         cls.tc.target.run('rm -f %s' % dst)
 
     @OETestID(192)
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
     def test_rpm_install(self):
-        status, output = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
-        msg = 'Failed to install rpm-doc package: %s' % output
+        status, output = self.target.run('rpm -ivh /tmp/base-passwd-doc.rpm')
+        msg = 'Failed to install base-passwd-doc package: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
     @OETestID(194)
     @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_install'])
     def test_rpm_remove(self):
-        status,output = self.target.run('rpm -e rpm-doc')
-        msg = 'Failed to remove rpm-doc package: %s' % output
+        status,output = self.target.run('rpm -e base-passwd-doc')
+        msg = 'Failed to remove base-passwd-doc package: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
     @OETestID(1096)
@@ -119,16 +119,16 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         self.assertEqual(0, status, msg=msg)
 
         # Remove the package just in case
-        self.target.run('rpm -e rpm-doc')
+        self.target.run('rpm -e base-passwd-doc')
 
         # Install/Remove a package 10 times
         for i in range(10):
-            status, output = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
-            msg = 'Failed to install rpm-doc package. Reason: {}'.format(output)
+            status, output = self.target.run('rpm -ivh /tmp/base-passwd-doc.rpm')
+            msg = 'Failed to install base-passwd-doc package. Reason: {}'.format(output)
             self.assertEqual(0, status, msg=msg)
 
-            status, output = self.target.run('rpm -e rpm-doc')
-            msg = 'Failed to remove rpm-doc package. Reason: {}'.format(output)
+            status, output = self.target.run('rpm -e base-passwd-doc')
+            msg = 'Failed to remove base-passwd-doc package. Reason: {}'.format(output)
             self.assertEqual(0, status, msg=msg)
 
         # if using systemd this should ensure all entries are flushed to /var
-- 
1.9.1


