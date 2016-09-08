Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4306E667
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 01:25:27 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 07 Sep 2016 18:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,298,1470726000"; 
   d="scan'208";a="5925935"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga005.jf.intel.com with ESMTP; 07 Sep 2016 18:25:28 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 20:26:45 -0500
Message-Id: <20160908012645.25324-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] oeqa: Remove linux user utilized for rpm test.
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
X-List-Received-Date: Thu, 08 Sep 2016 01:25:28 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

When trying to re-test smart rpm tests. A fail arises
due to a linux user previously created upon the image.
W've added a few lines to delete such user and his home dir
when finishing test.

[YOCTO #9204]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 4d03ecb..285f39b 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -51,12 +51,15 @@ class RpmInstallRemoveTest(oeRuntimeTest):
     @testcase(1096)
     @skipUnlessPassed('test_ssh')
     def test_rpm_query_nonroot(self):
-        (status, output) = self.target.run('useradd test1')
+        test_user = 'test1'
+        (status, output) = self.target.run("useradd %s" % test_user)
         self.assertTrue(status == 0, msg="Failed to create new user: " + output)
-        (status, output) = self.target.run('su -c id test1')
+        (status, output) = self.target.run("su -c id %s" % test_user)
         self.assertTrue('(test1)' in output, msg="Failed to execute as new user")
-        (status, output) = self.target.run('su -c "rpm -qa" test1 ')
+        (status, output) = self.target.run("su -c \"rpm -qa\" %s " % test_user)
         self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa: %s" % (status, output))
+        (status, output) = self.target.run("userdel -r %s" % test_user)
+        self.assertTrue(status == 0, msg="Failed to erase user: %s" % output)
 
     @testcase(195)
     @skipUnlessPassed('test_rpm_install')
-- 
2.9.3


