Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.86.1603837773595116587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xudO/Htw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id r10so1518317plx.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oRY8kz06KgxJg+jXVvW0dWC4vqI7Qua7Ct4vtbisIvg=;
        b=xudO/HtwEHakkqLxLeMeV5YOWa4ya3vNU6uAE5duX+RqFptreBU5KzZ5bQ8BmpOawY
         Cc8KxpZ2cGKEWFaEoHSHYYpxR4T5V4wrHzki34vQFy08QKU4OepX+DMv7uHXsSwRhZw2
         uSUGtJ9WgGN2JnF2yCnWZrfm3vhRrtbhquvEh4LWdHdcqngxdci+n6AjDMBOOxbFJiEC
         IBx2nlvl2zLQbDKRkKFOgmEO9vxpeX1h+K3uUisirTMk7NP6kA6lye+3FjutLY2/FNc6
         UcaOCCgV22TvpaHKoWzvQ6KgBKlK2ePH7PG6yZh9s6rsP6c9JHyHqD8ppEX1hQYxs9Bf
         IcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oRY8kz06KgxJg+jXVvW0dWC4vqI7Qua7Ct4vtbisIvg=;
        b=nQxTHL9a3zum/mNqwffX6VwAARGg321GFjud4zU62SOMmPcyXotNTQPWBN99gqUhyN
         F2xD5h8OcTC7fxm6tdEeEw2toND+ewkMR2FKuxRLjg3yXpdmnOK0VT7kSA26N6+sTSGq
         SOVa4CJG5mtmTXJqb3PbmJ8LwT/tO9Few+JqLJLQxC92xJzuWYsxgAqFzOFt6HR6r1dW
         pXEhmmAbqYtJBPq5jtI5jI2Tdq6ys8E57wLd/v3Q6H66kToM7qeQBs/F7itLKlfhVTS3
         xLxCYqgG9DLwlEWLdOdJhb2xPMhe54o/jjDJ9PEojI3m87FGuuIpN6aW1UkVff1gpzZx
         oP3w==
X-Gm-Message-State: AOAM530l+lpDKECMvsxca5jhgsT1EnvBX4921ofQQmKZNx49FaW+D1Tz
	kOf9H7f5Fhi94N5V2moNpOBLOi4QGBZ5aFYP
X-Google-Smtp-Source: ABdhPJypqi8nkJHG8Znh9Ate6pPUkZijXrA45mFG+w2+7jnRcAEwOdyjooihmzSaK1j3jhPoEICQ8Q==
X-Received: by 2002:a17:902:7fc5:b029:d3:f0da:ade with SMTP id t5-20020a1709027fc5b02900d3f0da0ademr4463906plb.63.1603837772631;
        Tue, 27 Oct 2020 15:29:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/16] oeqa: Add sync call to command execution
Date: Tue, 27 Oct 2020 12:29:05 -1000
Message-Id: <ed912771ea98c42f61bf927b1ca708650b0bed4c.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We previously put a sync call into devtool to try and combat the bitbake
timeout issues on the autobuilder. It isn't enough as the timeouts occur
mid test. They are also occurring on non-devtool tests.

Add in sync calls around command execution instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ceca5ed121e2b54415a7ab3a217882e4ea86923a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 16 ++++++++--------
 meta/lib/oeqa/utils/commands.py        |  8 +++++++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index a5ef1ea95f..fa6113d7fa 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -64,12 +64,12 @@ class RunCmdTests(OESelftestTestCase):
                                 runCmd, "echo foobar >&2; false", shell=True, assert_error=False)
 
     def test_output(self):
-        result = runCmd("echo stdout; echo stderr >&2", shell=True)
+        result = runCmd("echo stdout; echo stderr >&2", shell=True, sync=False)
         self.assertEqual("stdout\nstderr", result.output)
         self.assertEqual("", result.error)
 
     def test_output_split(self):
-        result = runCmd("echo stdout; echo stderr >&2", shell=True, stderr=subprocess.PIPE)
+        result = runCmd("echo stdout; echo stderr >&2", shell=True, stderr=subprocess.PIPE, sync=False)
         self.assertEqual("stdout", result.output)
         self.assertEqual("stderr", result.error)
 
@@ -77,7 +77,7 @@ class RunCmdTests(OESelftestTestCase):
         numthreads = threading.active_count()
         start = time.time()
         # Killing a hanging process only works when not using a shell?!
-        result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True)
+        result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True, sync=False)
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
@@ -87,7 +87,7 @@ class RunCmdTests(OESelftestTestCase):
         numthreads = threading.active_count()
         start = time.time()
         # Killing a hanging process only works when not using a shell?!
-        result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True, stderr=subprocess.PIPE)
+        result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True, stderr=subprocess.PIPE, sync=False)
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
@@ -95,7 +95,7 @@ class RunCmdTests(OESelftestTestCase):
 
     def test_stdin(self):
         numthreads = threading.active_count()
-        result = runCmd("cat", data=b"hello world", timeout=self.TIMEOUT)
+        result = runCmd("cat", data=b"hello world", timeout=self.TIMEOUT, sync=False)
         self.assertEqual("hello world", result.output)
         self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
         self.assertEqual(numthreads, 1)
@@ -103,7 +103,7 @@ class RunCmdTests(OESelftestTestCase):
     def test_stdin_timeout(self):
         numthreads = threading.active_count()
         start = time.time()
-        result = runCmd(['sleep', '60'], data=b"hello world", timeout=self.TIMEOUT, ignore_status=True)
+        result = runCmd(['sleep', '60'], data=b"hello world", timeout=self.TIMEOUT, ignore_status=True, sync=False)
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
@@ -111,12 +111,12 @@ class RunCmdTests(OESelftestTestCase):
 
     def test_log(self):
         log = MemLogger()
-        result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log)
+        result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log, sync=False)
         self.assertEqual(["Running: echo stdout; echo stderr >&2", "stdout", "stderr"], log.info_msgs)
         self.assertEqual([], log.error_msgs)
 
     def test_log_split(self):
         log = MemLogger()
-        result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log, stderr=subprocess.PIPE)
+        result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log, stderr=subprocess.PIPE, sync=False)
         self.assertEqual(["Running: echo stdout; echo stderr >&2", "stdout"], log.info_msgs)
         self.assertEqual(["stderr"], log.error_msgs)
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f7f8c16bf0..8059cbce3e 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -167,7 +167,7 @@ class Result(object):
     pass
 
 
-def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
+def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=True,
           native_sysroot=None, limit_exc_output=0, output_log=None, **options):
     result = Result()
 
@@ -184,6 +184,12 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
     cmd = Command(command, timeout=timeout, output_log=output_log, **options)
     cmd.run()
 
+    # tests can be heavy on IO and if bitbake can't write out its caches, we see timeouts.
+    # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
+    # hit here rather than in bitbake shutdown.
+    if sync:
+        os.system("sync")
+
     result.command = command
     result.status = cmd.status
     result.output = cmd.output
-- 
2.17.1

