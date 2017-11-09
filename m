Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 62B11783D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:55:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA9BtqxP007425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 9 Nov 2017 11:55:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eClR2-00030Z-GO; Thu, 09 Nov 2017 11:55:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 11:55:46 +0000
Message-Id: <1510228551-11516-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/7] oeqa/runqemu: Only show stdout/stderr upon test failure
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
X-List-Received-Date: Thu, 09 Nov 2017 11:55:55 -0000

In general we don't need to see the output of runqemu however if it fails
we do. Use the buffer option that already exists in TestResult but allow
us to trigger it on a per test basis.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py            | 8 ++++++++
 meta/lib/oeqa/selftest/cases/runqemu.py | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index f6539e6..2d756da 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -45,6 +45,14 @@ class OETestResult(_TestResult):
         self.tc = tc
         self._tc_map_results()
 
+    def startTest(self, test):
+        # Allow us to trigger the testcase buffer mode on a per test basis
+        # so stdout/stderr are only printed upon failure. Enables debugging
+        # but clean output
+        if hasattr(test, "buffer"):
+            self.buffer = True
+        super(OETestResult, self).startTest(test)
+
     def _tc_map_results(self):
         self.tc._results['failures'] = self.failures
         self.tc._results['errors'] = self.errors
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 1991be7..1a8d121 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -14,6 +14,8 @@ class RunqemuTests(OESelftestTestCase):
 
     image_is_ready = False
     deploy_dir_image = ''
+    # We only want to print runqemu stdout/stderr if there is a test case failure
+    buffer = True
 
     def setUpLocal(self):
         super(RunqemuTests, self).setUpLocal()
-- 
2.7.4


