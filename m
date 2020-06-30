Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.7674.1593486328418592162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=z9snkBIx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id t6so9266695pgq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DBjpUOs0yyK7fjMF8djOKJ7nCFJDBFOvaKtZnx1sJRQ=;
        b=z9snkBIxfG4V8PBt7MJGed7+yNOa/tgINjDxGX7HnL5R+3ohYQWViPgltq5z/wAxof
         XPdYpVNENUNkmIzOqctgK8G3RROb/MH8sNcygJHiVDOWp+w9RBi2qrhrc5LxI5CLaUCU
         RZtoJPPSsyNzesBR5XxA0c8olDrB8glsJoa6bKJKrpVcOWx8N4rKS92LQobsOpWoCl+L
         ixhgYnZa4x8r5E1U3rYvRpTVQLH3SKg3HFBLQZxpnQoWAlD2+id4ylY9UL95bry4k1Ju
         ne/qcidB9C9fCsJEDhQL8Q+JlytvnWD13GPr3ktUWHjF5BtDVzDxyXo2lq97A6AvkzMm
         I8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DBjpUOs0yyK7fjMF8djOKJ7nCFJDBFOvaKtZnx1sJRQ=;
        b=pg2VKi30OFMPcl4uZRwFEOl/qR2DWMDFF1VYPVlrp83OdmoY2m4sw1kYUlvVzPdGgo
         Pg+wlF8HmTXluH+VS6V7DzWpw3hstBcV31Zjf8gzDvnXW30CklAd6VoOMcAL/No84C4O
         2OJk0OvstgaPqGvC8WFzs3i91O+6wR/7JKUmXSGe7T08J8KNGF96RrmmTzZ+X2kLLx4j
         q0keH/ciH/CS8ECRIkPwFP4aKtXT1rxtIZIWEpdpKSwBUe+Gx4K6ytxq5qv82oq5UbIu
         e+TEsoEfJTV/j8eDEAupIVsY9cNGoti2yTJ7K1/USLIrfoXn8JW5nv8S6Xb79N7QoJ4h
         2DOw==
X-Gm-Message-State: AOAM533EK8u0XHy6Mv/EEvPrHJq/SbX0Ynz1+QXb7piKa5Y4qpx3sK7f
	8+dHqf9R7nmEO+MwzabFzhCUhISqzLGMKA==
X-Google-Smtp-Source: ABdhPJzPoZg84C6P3JmkCcsxXAs08tFyAG/O64l31bCY8QnxlZVOLV4MZOPalbAu3DSM6GetPZiIhQ==
X-Received: by 2002:a62:5c02:: with SMTP id q2mr17421033pfb.232.1593486327460;
        Mon, 29 Jun 2020 20:05:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.05.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:05:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/22] oeqa/selftest: Clean up separate builddir in success case when non-threaded
Date: Mon, 29 Jun 2020 17:03:18 -1000
Message-Id: <20e7b1eeeb12f1cf4bd9934e0a5733c6bbe64372.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If oe-selftest is run without -j, the separate build directory "build-st"
isn't cleaned up afterwards. Mirror the behaviour of the -j option to
handle this the same way, only preserve upon failure.

To do this, the remove function needs to be moved to the selftest
context module so that it can be accessed without requiring the
testtools and subunit modules the -j option requires.

A dummy wrapper class is used to wrap the tests and clean up afterwards.

[YOCTO #13953]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b376ade430d40d3cfe9c18f200c764d622710e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 23 +++----------
 meta/lib/oeqa/selftest/context.py           | 36 +++++++++++++++++++--
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 01c39830f9..b2eb68fb02 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -183,10 +183,11 @@ class dummybuf(object):
 #
 class ConcurrentTestSuite(unittest.TestSuite):
 
-    def __init__(self, suite, processes, setupfunc):
+    def __init__(self, suite, processes, setupfunc, removefunc):
         super(ConcurrentTestSuite, self).__init__([suite])
         self.processes = processes
         self.setupfunc = setupfunc
+        self.removefunc = removefunc
 
     def run(self, result):
         tests, totaltests = fork_for_tests(self.processes, self)
@@ -237,22 +238,6 @@ class ConcurrentTestSuite(unittest.TestSuite):
         finally:
             queue.put(test)
 
-def removebuilddir(d):
-    delay = 5
-    while delay and os.path.exists(d + "/bitbake.lock"):
-        time.sleep(1)
-        delay = delay - 1
-    # Deleting these directories takes a lot of time, use autobuilder
-    # clobberdir if its available
-    clobberdir = os.path.expanduser("~/yocto-autobuilder-helper/janitor/clobberdir")
-    if os.path.exists(clobberdir):
-        try:
-            subprocess.check_call([clobberdir, d])
-            return
-        except subprocess.CalledProcessError:
-            pass
-    bb.utils.prunedir(d, ionice=True)
-
 def fork_for_tests(concurrency_num, suite):
     result = []
     if 'BUILDDIR' in os.environ:
@@ -297,7 +282,7 @@ def fork_for_tests(concurrency_num, suite):
                 if ourpid != os.getpid():
                     os._exit(0)
                 if newbuilddir and unittest_result.wasSuccessful():
-                    removebuilddir(newbuilddir)
+                    suite.removefunc(newbuilddir)
             except:
                 # Don't do anything with process children
                 if ourpid != os.getpid():
@@ -313,7 +298,7 @@ def fork_for_tests(concurrency_num, suite):
                     sys.stderr.write(traceback.format_exc())
                 finally:
                     if newbuilddir:
-                        removebuilddir(newbuilddir)
+                        suite.removefunc(newbuilddir)
                     stream.flush()
                     os._exit(1)
             stream.flush()
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index ba13732253..9baad58321 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -22,6 +22,37 @@ from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
 
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
+class NonConcurrentTestSuite(unittest.TestSuite):
+    def __init__(self, suite, processes, setupfunc, removefunc):
+        super().__init__([suite])
+        self.processes = processes
+        self.suite = suite
+        self.setupfunc = setupfunc
+        self.removefunc = removefunc
+
+    def run(self, result):
+        (builddir, newbuilddir) = self.setupfunc("-st", None, self.suite)
+        ret = super().run(result)
+        os.chdir(builddir)
+        if newbuilddir and ret.wasSuccessful():
+            self.removefunc(newbuilddir)
+
+def removebuilddir(d):
+    delay = 5
+    while delay and os.path.exists(d + "/bitbake.lock"):
+        time.sleep(1)
+        delay = delay - 1
+    # Deleting these directories takes a lot of time, use autobuilder
+    # clobberdir if its available
+    clobberdir = os.path.expanduser("~/yocto-autobuilder-helper/janitor/clobberdir")
+    if os.path.exists(clobberdir):
+        try:
+            subprocess.check_call([clobberdir, d])
+            return
+        except subprocess.CalledProcessError:
+            pass
+    bb.utils.prunedir(d, ionice=True)
+
 class OESelftestTestContext(OETestContext):
     def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None):
         super(OESelftestTestContext, self).__init__(td, logger)
@@ -86,10 +117,9 @@ class OESelftestTestContext(OETestContext):
         if processes:
             from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
 
-            return ConcurrentTestSuite(suites, processes, self.setup_builddir)
+            return ConcurrentTestSuite(suites, processes, self.setup_builddir, removebuilddir)
         else:
-            self.setup_builddir("-st", None, suites)
-            return suites
+            return NonConcurrentTestSuite(suites, processes, self.setup_builddir, removebuilddir)
 
     def runTests(self, processes=None, machine=None, skips=[]):
         if machine:
-- 
2.17.1

