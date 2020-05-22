Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.135.1590187120812454519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 15:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yg4trVJ9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id a13so4991197pls.8
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 15:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=rUeTXnY3i4SAeMtLXL4/OjgSlfpvP3mH4wTwTffkzCg=;
        b=yg4trVJ95Ye91dIccKY0PKxF9n/00DNDnY4qLvou/TUmQTUX1USf0hc3yfYjNXTq2F
         Vc8KVNkPQz5Im9eYmisooa3zy+eSOoikMhIimv7nmz5gABf0zvGgcKYdxJ88B78RSApx
         hOBBHCZT5tWzgFMHnh6PMcL6ehE6f6X3UJV/PY2aM1ay9cazq+dzwFVQs7qgqIU9kLC8
         9OyTyjkPqRQxqd0bXyVVSe037/gC+T5vrPYzO9UQ2qMLk2Ff771HvBMtbJsGrowB/QQ4
         Yi1XGFvbqJmV2pVqAOx+HOyY53P0vtyQ84kUNd34qkIE2oRKL3hiSH3tD1PDqYYaQuQR
         V4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=rUeTXnY3i4SAeMtLXL4/OjgSlfpvP3mH4wTwTffkzCg=;
        b=lMIMXWE9w6TIb1amm3c33k7NJkfu9kw5uckmlxAiFnfhOEMz3EDb6nxdoaosNq3I/E
         qjKWBahAuSqaZu8r4377r2R2mFc6hxkeBIaHc513lCbjMArP1xlC621p01uTiI7WArj4
         uxbCL7jbCqpYvzTXoKGwwgueoEjYXPnC/15BsUq8+0kAO+eQsBkFBP8Zdp7ERNN6fgC2
         k9VSOovrN2r1RDlO05QXN5UuJHt49xPZybSf79jQIz8vYOx5T3uWw5Bt2DfVc4/84yY1
         QjwaAgPlWiw9Y3DZaO1U0vOa6JN4QAAVGuxLQjU3kL3E0jeyK41lD4wCao+AuNRxQjtP
         DK0g==
X-Gm-Message-State: AOAM532oprtl6vvWTN9tHEDA1/9jigV2RoLAB3fq/ZKjWkoU1Nt/KJ5E
	Q5io3th1Eh/kb1009gTOtGQ6UT5YdkA=
X-Google-Smtp-Source: ABdhPJxaVf13GRBGEAqspCThfdRXxQ7IhauEkqc/BdB6duanr4TfLw77nKHuL2W9wi1+8/HZ4Ki+kA==
X-Received: by 2002:a17:90a:8807:: with SMTP id s7mr7270212pjn.157.1590187119738;
        Fri, 22 May 2020 15:38:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id lj8sm7492159pjb.1.2020.05.22.15.38.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 15:38:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/concurrencytest: don't delete build directory for failed tests
Date: Fri, 22 May 2020 12:38:18 -1000
Message-Id: <20200522223818.23305-1-steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index fac59f765a..01c39830f9 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -77,14 +77,17 @@ class ProxyTestResult:
     # a very basic TestResult proxy, in order to modify add* calls
     def __init__(self, target):
         self.result = target
+        self.failed_tests = 0
 
     def _addResult(self, method, test, *args, exception = False, **kwargs):
         return method(test, *args, **kwargs)
 
     def addError(self, test, err = None, **kwargs):
+        self.failed_tests += 1
         self._addResult(self.result.addError, test, err, exception = True, **kwargs)
 
     def addFailure(self, test, err = None, **kwargs):
+        self.failed_tests += 1
         self._addResult(self.result.addFailure, test, err, exception = True, **kwargs)
 
     def addSuccess(self, test, **kwargs):
@@ -96,6 +99,9 @@ class ProxyTestResult:
     def addUnexpectedSuccess(self, test, **kwargs):
         self._addResult(self.result.addUnexpectedSuccess, test, **kwargs)
 
+    def wasSuccessful(self):
+        return self.failed_tests == 0
+
     def __getattr__(self, attr):
         return getattr(self.result, attr)
 
@@ -287,10 +293,10 @@ def fork_for_tests(concurrency_num, suite):
                 # as per default in parent code
                 subunit_client.buffer = True
                 subunit_result = AutoTimingTestResultDecorator(subunit_client)
-                process_suite.run(ExtraResultsEncoderTestResult(subunit_result))
+                unittest_result = process_suite.run(ExtraResultsEncoderTestResult(subunit_result))
                 if ourpid != os.getpid():
                     os._exit(0)
-                if newbuilddir:
+                if newbuilddir and unittest_result.wasSuccessful():
                     removebuilddir(newbuilddir)
             except:
                 # Don't do anything with process children
-- 
2.17.1

