Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.112.1618940048340229030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 10:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ffq1I/cK;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id d21so25984136edv.9
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 10:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rEJ8PxCByWU2zf56Hhg7YpuppE/WLgUxgmUR2aqB9HA=;
        b=ffq1I/cKvX9UJV9GVGR3tz7h4XQdeR/K33JvZdvhtYvH0CWY0ScFIqNzxXyALnaTdA
         ybyxxRee4PHsZ/7vcyY9tEEn/AoMq9ejxYgO9ny0E3rz1K7t2+WOHmrolRxJI7kJg4sm
         eV8OvDb7XcyoEaGgykYeLx5edi8CMY+xmDgqt+Dd65pkW0NOLBLo70ImydWEJHVne9iP
         0ANc/GOjsjrU+uDyiJpaYvGTyrpvE/JqCOzsRT5M2IcMsINfTQnG1mAg2oQTAV3brQ2k
         xhPMtSvKLc8gEZtMEWwjG7C/28p6IxaD5qezKLPY61KvHAkHQ/WLz0HdQu6VNgJXaxD8
         MK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rEJ8PxCByWU2zf56Hhg7YpuppE/WLgUxgmUR2aqB9HA=;
        b=nN3SRvFx9ExXnz5I9nF6OKNX/ztCHFHhHxtZV38jnJk5bc80/tAP2CaTMtI+p53ynh
         uFG6J0d+XrE+rDgJIMUCTvmfEeTKy7Cr+i4IdZRNHIoqPbdAhXCRfpFgaTeWwoA6PxG6
         R22ns6hCPy/PHSgH+4Vp7hVxeb5eECDfXwICeNFVlCU1jHvVXJfRE/7H2k+ckrI3iNyY
         TV7Qo3fEymDRSZrCicIWTN4UVaMdP97zlZugog8/p4Gl7lwt5Z7o5/3Q24Ere2XMb8R2
         x4wWMSmmKaDx4QkYEdDNDtR9f77NR9wdknMxKE6dYCStfUKa7r2C4Hn25vMYskfsnRHf
         UEIw==
X-Gm-Message-State: AOAM532g1qh624Ccz6OeFtj48736kL7GrPHfKU15iymTAO91hq4ficpV
	eBk7iZILJNjzJ27iVieRfEr+gvAFeBcxCQ==
X-Google-Smtp-Source: ABdhPJwCLTc21ovkWqRDhedHIc5MPy2a4qFbBK563aUwlrjxJPvPbNzmVXtSgTdNC9Y87eeXwKnMPQ==
X-Received: by 2002:a05:6402:3514:: with SMTP id b20mr2716309edd.348.1618939987103;
        Tue, 20 Apr 2021 10:33:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n17sm5693963eds.72.2021.04.20.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:33:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] meta/lib/oeqa/core/tests/cases/timeout.py: add a testcase for the previous fix
Date: Tue, 20 Apr 2021 19:32:59 +0200
Message-Id: <20210420173259.619447-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420173259.619447-1-alex.kanavin@gmail.com>
References: <20210420173259.619447-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the sequence that didn't properly operate:

- a test case that skips and isn't executed
- a second test case that is skipped via a dependency decorator, and sets a timeout
- a third test case that takes longer than the timeout from the second
test case

Without the fix, the timeout is not cleared, and the third test case is
erroneously aborted. With the fix, the timeout is cleared and the third
test case is able to complete.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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

