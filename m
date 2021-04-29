Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: pIZxv921OOJzVGtCKdLOdv4yAGoUhW0oe99I0PqIl2F/QhaUB7RnvCbMurnUo8zm07EDglBsff
 JfExRksRbc0w==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258314"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258314"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:31 -0700
IronPort-SDR: QYAljkXIfLw60IPgmhiXDLa77SxIcStGzfuHGF4jnN6TKLyQ9RkjEf6oG9qSYBIPBtf2G4J1Tm
 uK9lKVvHC62w==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883662"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/10] meta/lib/oeqa/core/tests/cases/timeout.py: add a testcase for the previous fix
Date: Thu, 29 Apr 2021 12:41:04 +0800
Message-Id: <4665008247cd4bd28da8c8b56c8c604e2e24d2cb.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is the sequence that didn't properly operate:

- a test case that skips and isn't executed
- a second test case that is skipped via a dependency decorator, and sets a timeout
- a third test case that takes longer than the timeout from the second
test case

Without the fix, the timeout is not cleared, and the third test case is
erroneously aborted. With the fix, the timeout is cleared and the third
test case is able to complete.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54ef07a9aa1af8f41cfb9a4802929c918efc43c8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/core/tests/cases/timeout.py   | 13 +++++++++++++
 meta/lib/oeqa/core/tests/test_decorators.py |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/core/tests/cases/timeout.py b/meta/lib/oeqa/core/tests/cases/timeout.py
index 5dfecc7b7c..69cf969a67 100644
--- a/meta/lib/oeqa/core/tests/cases/timeout.py
+++ b/meta/lib/oeqa/core/tests/cases/timeout.py
@@ -8,6 +8,7 @@ from time import sleep
 
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator.oetimeout import OETimeout
+from oeqa.core.decorator.depends import OETestDepends
 
 class TimeoutTest(OETestCase):
 
@@ -19,3 +20,15 @@ class TimeoutTest(OETestCase):
     def testTimeoutFail(self):
         sleep(2)
         self.assertTrue(True, msg='How is this possible?')
+
+
+    def testTimeoutSkip(self):
+        self.skipTest("This test needs to be skipped, so that testTimeoutDepends()'s OETestDepends kicks in")
+
+    @OETestDepends(["timeout.TimeoutTest.testTimeoutSkip"])
+    @OETimeout(3)
+    def testTimeoutDepends(self):
+        self.assertTrue(False, msg='How is this possible?')
+
+    def testTimeoutUnrelated(self):
+        sleep(6)
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index b798bf7d33..5095f39948 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -133,5 +133,11 @@ class TestTimeoutDecorator(TestBase):
         msg = "OETestTimeout didn't restore SIGALRM"
         self.assertIs(alarm_signal, signal.getsignal(signal.SIGALRM), msg=msg)
 
+    def test_timeout_cancel(self):
+        tests = ['timeout.TimeoutTest.testTimeoutSkip', 'timeout.TimeoutTest.testTimeoutDepends', 'timeout.TimeoutTest.testTimeoutUnrelated']
+        msg = 'Unrelated test failed to complete'
+        tc = self._testLoader(modules=self.modules, tests=tests)
+        self.assertTrue(tc.runTests().wasSuccessful(), msg=msg)
+
 if __name__ == '__main__':
     unittest.main()
-- 
2.30.2

