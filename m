Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1268960762
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 00:14:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2016 17:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,303,1470726000"; d="scan'208";a="1053381545"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2016 17:14:46 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 19:16:04 -0500
Message-Id: <20160909001604.32600-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V2] oeqa: Remove linux user utilized for rpm test.
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
X-List-Received-Date: Fri, 09 Sep 2016 00:14:50 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

When trying to re-test smart rpm tests. A fail arises
due to a linux user previously created upon the image.
We've added a few lines to delete such user and his home dir
when finishing test.

[YOCTO #9204]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 4d03ecb..7f514ca 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -51,12 +51,32 @@ class RpmInstallRemoveTest(oeRuntimeTest):
     @testcase(1096)
     @skipUnlessPassed('test_ssh')
     def test_rpm_query_nonroot(self):
-        (status, output) = self.target.run('useradd test1')
-        self.assertTrue(status == 0, msg="Failed to create new user: " + output)
-        (status, output) = self.target.run('su -c id test1')
-        self.assertTrue('(test1)' in output, msg="Failed to execute as new user")
-        (status, output) = self.target.run('su -c "rpm -qa" test1 ')
-        self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa: %s" % (status, output))
+
+        def set_up_test_user(u):
+            (status, output) = self.target.run("id -u %s" % u)
+            if status == 0:
+                pass
+            else:
+                (status, output) = self.target.run("useradd %s" % u)
+                self.assertTrue(status == 0, msg="Failed to create new user: " + output)
+
+        def exec_as_test_user(u):
+            (status, output) = self.target.run("su -c id %s" % u)
+            self.assertTrue("({0})".format(u) in output, msg="Failed to execute as new user")
+            (status, output) = self.target.run("su -c \"rpm -qa\" %s " % u)
+            self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa: %s" % (status, output))
+
+        def unset_up_test_user(u):
+            (status, output) = self.target.run("userdel -r %s" % u)
+            self.assertTrue(status == 0, msg="Failed to erase user: %s" % output)
+
+        tuser = 'test1'
+
+        try:
+            set_up_test_user(tuser)
+            exec_as_test_user(tuser)
+        finally:
+            unset_up_test_user(tuser)
 
     @testcase(195)
     @skipUnlessPassed('test_rpm_install')
-- 
2.9.3


