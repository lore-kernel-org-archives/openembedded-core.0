Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.13423.1619796890553120810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nxC4BNky;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d124so5960118pfa.13
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hkoMaNYxKUQmr7Bacu4JEyjnenwQIuGWovB4NOQZklg=;
        b=nxC4BNkyMuJrnvaAN6zXg/hEm/NWT92ow9Up/ODd1YPLBzeYt981j6IX7ujgivuD7u
         r9/kjH6yU6fBYDrDKtGQALYvdE59pxdUhEfgZlwwsR50wLlLvb3I2a4IvRrkjL7GMVRT
         4b6X/fzwRlbKRsSV3Txe8ccFgz/DWvrbCOMSuSWfJmnSGmGLTYZE6J3RzFv3Ko/BtWIB
         m+58/3NrPPKTAVzcam8qzaSY73xIfsHu0JrdIms3jeu34vt85Qb0CTaNHVEI8CfERAcX
         +vTtrBfwrrxZ6KHqjuQ+iNwfGgM8a2a8soMNueVywedlv/0zkM/s0JGHsqghV5ejFhKn
         g6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hkoMaNYxKUQmr7Bacu4JEyjnenwQIuGWovB4NOQZklg=;
        b=eop+kqrGgAFgQ7/5c68CtNxJlmLJeBvEvX88cQesaoScJ/fWNzLqIrkizs2gbhQr6U
         ZW0Vu0E8oTc5Inf3pVx3jLT51lFrtLzkd+QrGJCWDqQC3jfJEeKCc1pB2V1Op+OJgBLM
         JG/c8AOIgqO7qJDulhL1gRK+UU/U6FZdYQi80C/YjB56pO56sNSlYEpv0je/sI7CZuM2
         DXS3KuDJ+1UrkGZ/8NtZzTwcK2GOuT8LuvbVqydb2LFs815f/6whbqHala8wTYwyUF8u
         UQqU3lzvleA6nflttfvVUkzRVAl/35EXo6iVl/XzkTo6ArZEP5q75tU2ZASZdAXinrBs
         jbuw==
X-Gm-Message-State: AOAM531ywqnGmIKOnHoR/YLUz0G4IGEpdPntPv/53OavqW9aWmQNMBh3
	agjXypSC6yYc2QnMyZUNDmc+AaySibnsChAD
X-Google-Smtp-Source: ABdhPJxD4++2Ur6I0WYPzKf629nvGymf43VjD7HKuj/eIBEcXF289bsAuehmktFwyblsiV8PjwWSbA==
X-Received: by 2002:aa7:9f1b:0:b029:27a:264a:57d8 with SMTP id g27-20020aa79f1b0000b029027a264a57d8mr5643141pfr.20.1619796889608;
        Fri, 30 Apr 2021 08:34:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.34.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:34:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] meta/lib/oeqa/core/tests/cases/timeout.py: add a testcase for the previous fix
Date: Fri, 30 Apr 2021 05:33:44 -1000
Message-Id: <79d216817c16237a9d660fc7956bf782ff60c65a.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

