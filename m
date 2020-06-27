Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.12463.1593276627132679958
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 09:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G7l3FcHm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id a6so12415047wrm.4
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vz0Sa4A98L9RGHabHa7Eh3CZ8VcFQMSogBYGGCy1yIM=;
        b=G7l3FcHma9l05lejxNqlUNH943qfZhENZClWtf3mTP8zJH1YJA5JevY6Dn4vcwLQyF
         PMKaHMCad144sEqQ6pGA3reNXWrS3Jr3MSYFt/wDATzRR+rU8DUFN4M74+BVXz37oXsj
         QOqvH1Q4enHz78vUOADGmkPrcsZ9rNzLqFGLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vz0Sa4A98L9RGHabHa7Eh3CZ8VcFQMSogBYGGCy1yIM=;
        b=NF5q4k42hJ3Bl83FB9s670BP90yuWl78ZZe09jnQOS3/j0j/0HFSh+uHlXB7MTeXj0
         fdiC1vvCIQnjhUWa2m18qd8eIAGwzV/Rg9IBNu32kdLieGXqGM+G2goPwrmYKLuoqSja
         4G17tCn+ijM4tj/3jzEGpl786/zNxkc+W/X2WoxGRenBH7fFjY8991vp/3bQyeOXIOgr
         dvYhtos8DRiKHGKy1EmZeWWcWE0vzFy+TrG/eq0SIoKspl7AxK5B652BxxBCvtUC2tw2
         ozDZptLNt6NU2Q7uPiusnd10mSPEAIOP1wb3hR0VcDxA86MZJrP5ae4IEOonV0d55T0E
         kANA==
X-Gm-Message-State: AOAM533wCQ71AJobo/jkRAaZJQldvaix+8q6YJ6bw+c9LMjnqQqh6Idn
	3sW7156IicjRKKGtJeWOqz6TeuqAi4WkNg==
X-Google-Smtp-Source: ABdhPJyw8CwxeV7y8HuAcKXQcEm53tpP6THpxtBj11SATnCfP9AHIERE8D2TqtmE5HgPaFuUo6Or4w==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr9665824wrn.9.1593276624972;
        Sat, 27 Jun 2020 09:50:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e4sm15327367wrt.97.2020.06.27.09.50.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 09:50:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Clean up separate builddir in success case when non-threaded
Date: Sat, 27 Jun 2020 17:50:22 +0100
Message-Id: <20200627165022.711136-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If oe-selftest is run without -j, the separate build directory "build-st"
isn't cleaned up afterwards. Mirror the behaviour of the -j option to
handle this the same way, only preserve upon failure.

To do this, the remove function needs to be moved to the selftest
context module so that it can be accessed without requiring the
testtools and subunit modules the -j option requires.

A dummy wrapper class is used to wrap the tests and clean up afterwards.

[YOCTO #13953]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 23 +++----------
 meta/lib/oeqa/selftest/context.py           | 36 +++++++++++++++++++--
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 01c39830f92..b2eb68fb024 100644
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
index 494e9dbd1ec..23f7d71bdbc 100644
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
2.25.1

