Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8765B73ACD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 12:42:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2015 05:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,436,1422950400"; d="scan'208";a="683084542"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2015 05:42:09 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 1EFD66A408F;
	Fri, 20 Mar 2015 05:41:50 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 14:39:36 +0200
Message-Id: <1426855176-10363-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/runtime: Added a new auto rpm test
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
X-List-Received-Date: Fri, 20 Mar 2015 12:42:12 -0000

The test tries to query the rpm list with a non-root user

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index b17e8b4..0529992 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -47,6 +47,16 @@ class RpmInstallRemoveTest(oeRuntimeTest):
         (status,output) = self.target.run('rpm -e rpm-doc')
         self.assertEqual(status, 0, msg="Failed to remove rpm-doc package: %s" % output)
 
+    @testcase(1096)
+    @skipUnlessPassed('test_ssh')
+    def test_rpm_query_nonroot(self):
+        (status, output) = self.target.run('useradd test1')
+        self.assertTrue(status == 0, msg="Failed to create new user")
+        (status, output) = self.target.run('sudo -u test1 id')
+        self.assertTrue('(test1)' in output, msg="Failed to execute as new user")
+        (status, output) = self.target.run('sudo -u test1 rpm -qa')
+        self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa" % status)
+
     @classmethod
     def tearDownClass(self):
         oeRuntimeTest.tc.target.run('rm -f /tmp/rpm-doc.rpm')
-- 
2.1.0


