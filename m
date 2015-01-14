Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EAA78721E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 15:14:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2015 07:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="440480863"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2015 07:01:47 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 129896A408F;
	Wed, 14 Jan 2015 07:14:34 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jan 2015 17:14:16 +0200
Message-Id: <1421248456-2542-2-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1421248456-2542-1-git-send-email-george.l.musat@intel.com>
References: <1421248456-2542-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 2/2] oeqa/ptest: Fixed complementary package install detection and added ptest-runner exit code check
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
X-List-Received-Date: Wed, 14 Jan 2015 15:14:43 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/_ptest.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 01ecfe3..ccfbaa9 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -104,12 +104,15 @@ class PtestRunnerTest(oeRuntimeTest):
     @skipUnlessPassed('test_ssh')
     def test_ptestrunner(self):
         self.add_smart_channel()
-        cond = oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest")
-        if not cond:
+        (runnerstatus, result) = self.target.run('which ptest-runner', 0)
+        cond = oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest") and (runnerstatus != 0)
+        if cond:
             self.install_packages(self.install_complementary("*-ptest"))
             self.install_packages(['ptest-runner'])
 
-        self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
+        (runnerstatus, result) = self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
+        #exit code is !=0 even if ptest-runner executes because some ptest tests fail.
+        self.assertTrue(runnerstatus != 127, msg="Cannot execute ptest-runner!")
         self.target.copy_from('/tmp/ptest.log', self.ptest_log)
         shutil.copyfile(self.ptest_log, "ptest.log")
 
-- 
2.1.0


