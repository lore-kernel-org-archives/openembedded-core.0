Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 364427D672
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 01:22:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 18:22:42 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 15 May 2019 18:22:41 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 09:22:28 +0800
Message-Id: <1557969749-80524-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2 v2] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
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
X-List-Received-Date: Thu, 16 May 2019 01:22:41 -0000

Convert manual testcase bsps-hw.bsps-hw.rpm_-__install_dependency_package
from oeqa/manual/bsp-hw.json to runtime automated test.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index d8cabd3..f71125f 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -135,3 +135,33 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         # Check that there's enough of them
         self.assertGreaterEqual(int(output), 80,
                                    'Cound not find sufficient amount of rpm entries in /var/log/messages, found {} entries'.format(output))
+
+    @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
+    def test_rpm_install_dependency(self):
+        rpmdir = os.path.join(self.tc.td['DEPLOY_DIR'], 'rpm', 'noarch')
+        rpm_tests = {'run-postinsts-dev': '', 'run-postinsts': ''}
+        rpm_pattern = 'run-postinsts-*.noarch.rpm'
+        for f in fnmatch.filter(os.listdir(rpmdir), rpm_pattern):
+            if 'run-postinsts-dev' not in f and 'run-postinsts-dbg' not in f:
+                rpm_tests['run-postinsts'] = f
+                continue
+            if 'run-postinsts-dev' in f:
+                rpm_tests['run-postinsts-dev'] = f
+                continue
+        rpm_dest_dir = '/tmp'
+        for rpm in rpm_tests:
+            self.tc.target.copyTo(os.path.join(rpmdir, rpm_tests[rpm]), os.path.join(rpm_dest_dir, rpm_tests[rpm]))
+        # remove existing rpm before testing install with dependency
+        self.tc.target.run('rpm -e %s' % 'run-postinsts-dev')
+        self.tc.target.run('rpm -e %s' % 'run-postinsts')
+        status, output = self.tc.target.run('rpm -ivh %s' % os.path.join(rpm_dest_dir, rpm_tests['run-postinsts-dev']))
+        self.assertTrue(status == 1, 'rpm installed should have failed but it was getting %s' % status)
+        self.assertTrue('error: Failed dependencies:' in output,
+                        'rpm installed should have failed with error but it was getting: %s' % output)
+        # reinstall rpm with dependency
+        status, output = self.tc.target.run('rpm -ivh %s' % os.path.join(rpm_dest_dir, rpm_tests['run-postinsts']))
+        self.assertTrue(status == 0, 'rpm (%s) installed with error: %s (%s)' % (rpm_tests['run-postinsts'], status, output))
+        status, output = self.tc.target.run('rpm -ivh %s' % os.path.join(rpm_dest_dir, rpm_tests['run-postinsts-dev']))
+        self.assertTrue(status == 0, 'rpm (%s) installed with error: %s (%s)' % (rpm_tests['run-postinsts-dev'], status, output))
+        for rpm in rpm_tests:
+            self.tc.target.run('rm -f %s' % os.path.join(rpm_dest_dir, rpm_tests[rpm]))
-- 
2.7.4


