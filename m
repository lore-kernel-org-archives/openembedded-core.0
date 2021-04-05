Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.5782.1617633913032477412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V1EwEum5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so5740613wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HJVMrUj5uV+F7Qyafld6kahRHplNZtR2pccvaff1sS8=;
        b=V1EwEum5q7FsqrBGFaamwRs6oDs1HDd32AAoLtSk2x9T0QLhhtqWczkgm/rTAidIOO
         rM9RJk4c2qW30rgPh0XWChHiwXDQhnysP1nVRSMu+7R4unj3Q4nM1hJtD9mFp8fI+ceR
         avsQivC0KGLtdVZSZmGfn0Jl+JxovXnTnQI9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HJVMrUj5uV+F7Qyafld6kahRHplNZtR2pccvaff1sS8=;
        b=lbTyaFuHli+T3uSyz3wekvU8lWyRmdpZU8mH7+e6sz0KlwvDvSvxXWOk8w8cpc3XmM
         FqcpwUV9xqGAYda4bl3Htz+jXRmPBgAsJTTcOghFsfMl+jwSNtTo8woaEgPJA7fF2Exz
         N4eOxTfodCyQtefIULKXqEiCL+umpvxOwV5XDfPhHiSq+dWnXG8PboBdB8XNk/dsiEk7
         /8i8bvRfKFfnSlvAJeufZ8IFtr+nh6xfJt3L4JCBLG3P8KnVD8vJAVSSwvPL1uyrNpvv
         wfifKwZf1DSqhYpCh4beLPuxJx0fyiNYkDB1Md875aHM1xbaRKdGGMmO9UAw7xupo/tf
         A7TA==
X-Gm-Message-State: AOAM532j7x/Mc4OTmJy3OLJNbDOkIDc0W+fhaqYuCh0O2FaVRS4QL37u
	uN8lIRkhv2S07un2GTpgromanVvCkqmllA==
X-Google-Smtp-Source: ABdhPJw7WfFhzsnFiGQd7p23GrHPzCHZvtk2y1klTOWdrzCCfEOs1rpS2WMAceDJH5dLz5XsnW2PqQ==
X-Received: by 2002:a1c:1b4b:: with SMTP id b72mr9638231wmb.17.1617633911360;
        Mon, 05 Apr 2021 07:45:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1d45:30a1:7018:4816])
        by smtp.gmail.com with ESMTPSA id n5sm6750847wrp.50.2021.04.05.07.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:45:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] oeqa/concurrencytest: Fix display of test stdout/stderr
Date: Mon,  5 Apr 2021 15:45:08 +0100
Message-Id: <20210405144510.967151-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405144510.967151-1-richard.purdie@linuxfoundation.org>
References: <20210405144510.967151-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If oe-selftest is run with -j, the output to stdout/stderr is being
lost at present. Capture this and display it upon test failure. We
have code that previously tried to enable this but it wasn't functioning
correctly. This should give more usable error reports on the autobuilder.

This code will mix stdout and stderr as the output is streamed from the test
server without markup. This is most in keeping with subunit/testools though
and the easiest way to handle the various challenges here as far as I can
see.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 33 +++++++++++----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 347dc896020..161a2f6e904 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -48,11 +48,15 @@ _all__ = [
 #
 class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
 
-    def __init__(self, target, semaphore, threadnum, totalinprocess, totaltests):
+    def __init__(self, target, semaphore, threadnum, totalinprocess, totaltests, output, finalresult):
         super(BBThreadsafeForwardingResult, self).__init__(target, semaphore)
         self.threadnum = threadnum
         self.totalinprocess = totalinprocess
         self.totaltests = totaltests
+        self.buffer = True
+        self.outputbuf = output
+        self.finalresult = finalresult
+        self.finalresult.buffer = True
 
     def _add_result_with_semaphore(self, method, test, *args, **kwargs):
         self.semaphore.acquire()
@@ -71,6 +75,8 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
                     test.id())
         finally:
             self.semaphore.release()
+        self.finalresult._stderr_buffer = io.StringIO(initial_value=self.outputbuf.getvalue().decode("utf-8"))
+        self.finalresult._stdout_buffer = io.StringIO()
         super(BBThreadsafeForwardingResult, self)._add_result_with_semaphore(method, test, *args, **kwargs)
 
 class ProxyTestResult:
@@ -196,19 +202,11 @@ class ConcurrentTestSuite(unittest.TestSuite):
             queue = Queue()
             semaphore = threading.Semaphore(1)
             result.threadprogress = {}
-            for i, (testserver, testnum) in enumerate(testservers):
+            for i, (testserver, testnum, output) in enumerate(testservers):
                 result.threadprogress[i] = []
                 process_result = BBThreadsafeForwardingResult(
                         ExtraResultsDecoderTestResult(result),
-                        semaphore, i, testnum, totaltests)
-                # Force buffering of stdout/stderr so the console doesn't get corrupted by test output
-                # as per default in parent code
-                process_result.buffer = True
-                # We have to add a buffer object to stdout to keep subunit happy
-                process_result._stderr_buffer = io.StringIO()
-                process_result._stderr_buffer.buffer = dummybuf(process_result._stderr_buffer)
-                process_result._stdout_buffer = io.StringIO()
-                process_result._stdout_buffer.buffer = dummybuf(process_result._stdout_buffer)
+                        semaphore, i, testnum, totaltests, output, result)
                 reader_thread = threading.Thread(
                     target=self._run_test, args=(testserver, process_result, queue))
                 threads[testserver] = reader_thread, process_result
@@ -273,10 +271,11 @@ def fork_for_tests(concurrency_num, suite):
                 newsi = os.open(os.devnull, os.O_RDWR)
                 os.dup2(newsi, sys.stdin.fileno())
 
+                # Send stdout/stderr over the stream
+                os.dup2(c2pwrite, sys.stdout.fileno())
+                os.dup2(c2pwrite, sys.stderr.fileno())
+
                 subunit_client = TestProtocolClient(stream)
-                # Force buffering of stdout/stderr so the console doesn't get corrupted by test output
-                # as per default in parent code
-                subunit_client.buffer = True
                 subunit_result = AutoTimingTestResultDecorator(subunit_client)
                 unittest_result = process_suite.run(ExtraResultsEncoderTestResult(subunit_result))
                 if ourpid != os.getpid():
@@ -306,8 +305,10 @@ def fork_for_tests(concurrency_num, suite):
         else:
             os.close(c2pwrite)
             stream = os.fdopen(c2pread, 'rb', 1)
-            testserver = ProtocolTestCase(stream)
-            testservers.append((testserver, numtests))
+            # Collect stdout/stderr into an io buffer
+            output = io.BytesIO()
+            testserver = ProtocolTestCase(stream, passthrough=output)
+            testservers.append((testserver, numtests, output))
     return testservers, totaltests
 
 def partition_tests(suite, count):
-- 
2.30.2

