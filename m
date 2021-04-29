Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: lt/xX4uGBchd1XAx7khr6IXnR4oMEkruCCUFjh5XbH8Rur6uLUZrj68ByNPt/02/8zfVwImx2L
 lgQc/1yWm/oQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258308"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258308"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:29 -0700
IronPort-SDR: cyNIWAOzSne3t80dTDyxuMfupA9qfdm+JCt+WR76kAhugXjJo/5GWihI1/2GwqZvcCKB+Kun/f
 vFBltTo1Mlag==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883651"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/10] oeqa: tear down oeqa decorators if one of them raises an exception in setup
Date: Thu, 29 Apr 2021 12:41:03 +0800
Message-Id: <be45a8271c06ffbb5d97afd33bb15b1143b6cf8d.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Some of the decorators need proper cleanup, such as OETimeout
which sets a signal handler that needs to be cleared via teardown.
If this is not done then the signal gets called later with unpredictable effects.

This can be seen if there's a test that is skipped via a decorator and sets a timeout
at the same time: the timeout isn't cleared, and is invoked later in a
completely unrelated context. The test case for this is added in the
next commit.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f42a08e1aabf1ca57e0c09d69fb69cc717c7f156)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/core/case.py                | 9 +++++++--
 meta/lib/oeqa/core/decorator/oetimeout.py | 5 +++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index aae451fef2..bc4446a938 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -43,8 +43,13 @@ class OETestCase(unittest.TestCase):
         clss.tearDownClassMethod()
 
     def _oeSetUp(self):
-        for d in self.decorators:
-            d.setUpDecorator()
+        try:
+            for d in self.decorators:
+                d.setUpDecorator()
+        except:
+            for d in self.decorators:
+                d.tearDownDecorator()
+            raise
         self.setUpMethod()
 
     def _oeTearDown(self):
diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index df90d1c798..5e6873ad48 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -24,5 +24,6 @@ class OETimeout(OETestDecorator):
 
     def tearDownDecorator(self):
         signal.alarm(0)
-        signal.signal(signal.SIGALRM, self.alarmSignal)
-        self.logger.debug("Removed SIGALRM handler")
+        if hasattr(self, 'alarmSignal'):
+            signal.signal(signal.SIGALRM, self.alarmSignal)
+            self.logger.debug("Removed SIGALRM handler")
-- 
2.30.2

