Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.5629.1617633912788074481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d4Tu1zZh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id x7so11117461wrw.10
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9sTSdHtWaUzvJOLOY435AIwN8mmMqDucRbP6WXJcMA=;
        b=d4Tu1zZhpsVoSDgtMh6hyE+fZJRR4icK89rPwk+d1HxAXlLzOx+LiNc9hDG+KW9g/c
         oNmIy6bN/Nx5BA3cPIchqOFS3J0YNL6R0eckUtLxCp9WFp/1q17XSf8H+jpVaY/cxnHa
         Hq+H0Fa0cr7p4x/QG+9YwJ6dBhihY8u5BUx8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9sTSdHtWaUzvJOLOY435AIwN8mmMqDucRbP6WXJcMA=;
        b=TUl1lsHel3+YCSC00uq/hRC6ZgTScBoVHl8FvYzR19rb6LourA+mq1DVaOgRuCC7B8
         sHddvSZVV6X4jRWlW0zfK6K86KdqcvMDvY1g3fDmavO+bS+4cTcAs7KS6RdcaUdHMlrd
         vM403D3UL813hzlkf23D2nYMFqoF94ZIDmOfAn+T89XyqzgY7XaJ87hhbeW9vm8M9NTv
         Q4px5B/GUKy5LL4gD167g/3u2tpC8VWWjIHIWSp+eFlRcUpMt9jO21UifPtsMz638E8m
         XY/boV1V6D9P8BrdP5LpEdkS67cr49kDcGZO7dF8FE/yXqL7e+CFwvkfDDcOuARTDX0W
         NVAQ==
X-Gm-Message-State: AOAM531/27pYbz8Mt4qZ6uwAGRmRkkM5PWSKR2/bdJGwA53vH8EMJ8K8
	Shxvm6v/u2aQc06HrwVTOncpcnx6jvBIqg==
X-Google-Smtp-Source: ABdhPJxEteuVFmJWbF94AYcqIsccJ9b0DonnIsI2151V64U++3KR7pS54qexBCOD3o5/Xujg0Hg8EQ==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr10469588wrw.3.1617633911052;
        Mon, 05 Apr 2021 07:45:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1d45:30a1:7018:4816])
        by smtp.gmail.com with ESMTPSA id n5sm6750847wrp.50.2021.04.05.07.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:45:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] oeqa/concurrencytest: Rename variables to improve the code
Date: Mon,  5 Apr 2021 15:45:07 +0100
Message-Id: <20210405144510.967151-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each time I look at this code I get confused about what the different
variables represent. Rename a few of them to better indicate what they
represent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index b2eb68fb024..347dc896020 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -190,13 +190,13 @@ class ConcurrentTestSuite(unittest.TestSuite):
         self.removefunc = removefunc
 
     def run(self, result):
-        tests, totaltests = fork_for_tests(self.processes, self)
+        testservers, totaltests = fork_for_tests(self.processes, self)
         try:
             threads = {}
             queue = Queue()
             semaphore = threading.Semaphore(1)
             result.threadprogress = {}
-            for i, (test, testnum) in enumerate(tests):
+            for i, (testserver, testnum) in enumerate(testservers):
                 result.threadprogress[i] = []
                 process_result = BBThreadsafeForwardingResult(
                         ExtraResultsDecoderTestResult(result),
@@ -210,8 +210,8 @@ class ConcurrentTestSuite(unittest.TestSuite):
                 process_result._stdout_buffer = io.StringIO()
                 process_result._stdout_buffer.buffer = dummybuf(process_result._stdout_buffer)
                 reader_thread = threading.Thread(
-                    target=self._run_test, args=(test, process_result, queue))
-                threads[test] = reader_thread, process_result
+                    target=self._run_test, args=(testserver, process_result, queue))
+                threads[testserver] = reader_thread, process_result
                 reader_thread.start()
             while threads:
                 finished_test = queue.get()
@@ -222,13 +222,13 @@ class ConcurrentTestSuite(unittest.TestSuite):
                 process_result.stop()
             raise
         finally:
-            for test in tests:
-                test[0]._stream.close()
+            for testserver in testservers:
+                testserver[0]._stream.close()
 
-    def _run_test(self, test, process_result, queue):
+    def _run_test(self, testserver, process_result, queue):
         try:
             try:
-                test.run(process_result)
+                testserver.run(process_result)
             except Exception:
                 # The run logic itself failed
                 case = testtools.ErrorHolder(
@@ -236,10 +236,10 @@ class ConcurrentTestSuite(unittest.TestSuite):
                     error=sys.exc_info())
                 case.run(process_result)
         finally:
-            queue.put(test)
+            queue.put(testserver)
 
 def fork_for_tests(concurrency_num, suite):
-    result = []
+    testservers = []
     if 'BUILDDIR' in os.environ:
         selftestdir = get_test_layer()
 
@@ -306,9 +306,9 @@ def fork_for_tests(concurrency_num, suite):
         else:
             os.close(c2pwrite)
             stream = os.fdopen(c2pread, 'rb', 1)
-            test = ProtocolTestCase(stream)
-            result.append((test, numtests))
-    return result, totaltests
+            testserver = ProtocolTestCase(stream)
+            testservers.append((testserver, numtests))
+    return testservers, totaltests
 
 def partition_tests(suite, count):
     # Keep tests from the same class together but allow tests from modules
-- 
2.30.2

