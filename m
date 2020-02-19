Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 24EB5613D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 18:38:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s10so1793336wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=60RacdOwaV9a8hamrwh7cVXHoeM+I+nR87SHgwmE/QU=;
	b=cUM0QAp+8CZ5rPUHD2yaWf6Mjp1SwEv+qEfxPIFZd60UXvT9O5U7Au1oytQKMk8fqJ
	SZzBkYi/WSsJ9NOV7aiTtc3zEeCfkLlCbzbtPzTPbzhwg6RsAXoKm0zQ96z4FFRrroZs
	G4awfahP8nKOOjGxFxmCmn9HYOjYmusuxbYs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=60RacdOwaV9a8hamrwh7cVXHoeM+I+nR87SHgwmE/QU=;
	b=az/SxpVO3KMJ4lr19V3WlQ2KoIHJewBYBQrfIF9AEiaPll5C8UtoRLw0h5wNEzlyZb
	QoIWEZdEDuacFZ5WakCQD61vVEzVc3NAyNofTWKrw2wdLpxBd85ePJMJVBhRDIlV60ri
	ZVLH+yqmDeyzGHMOXlVksE61Xtq6A3aM678WSR5szWmcmVjUoTTpRAThb0MpN/Q3qlPA
	ziAFgLNCq9kTqHPHXCLf9gTwuxpRIt0AGXPYNLipLm3EZ2S//SZs2BhNgQVwrmn71gyb
	cg69AjXNKfGERFQzUi0rdROCbJ1Y1skRjhLynyM7G2xcKkwxyAkbI7nvBpsJvfVgTtS5
	GKew==
X-Gm-Message-State: APjAAAVRY2hygqc0iZtoG90F3yIt5tY8p92KMyLJaBoGaUuWPvfsETkp
	MOgVH/PkCnUz4RojB61LkwOaqbCBwB0=
X-Google-Smtp-Source: APXvYqzcup8QEsI31TJdx7DwpLNrLegyk6Kqe2+J5fE/fYOHgdB/6TKPo88RCpLnpVQAPg3i1o4m5g==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr11446505wmh.22.1582137500174; 
	Wed, 19 Feb 2020 10:38:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b21sm856697wmd.37.2020.02.19.10.38.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 10:38:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 18:38:16 +0000
Message-Id: <20200219183817.130495-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219183817.130495-1-richard.purdie@linuxfoundation.org>
References: <20200219183817.130495-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] oeqa/selftest: Startardise seperate builddir for concurrent and non-concurrent selftest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2020 18:38:20 -0000
Content-Transfer-Encoding: 8bit

Currently oe-selftest reuses the current build directory and the concurrent
version run with -j does not.

Standardise and use a separate new build directory in both cases. This will lead
to simpler code and more reliable user run tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py               | 12 +++--
 meta/lib/oeqa/core/utils/concurrencytest.py | 35 ++-------------
 meta/lib/oeqa/selftest/context.py           | 50 +++++++++++++++++++++
 3 files changed, 58 insertions(+), 39 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 14fc6a54f4b..16320af1157 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -72,6 +72,9 @@ class OETestContext(object):
                 modules_required, **kwargs)
         self.suites = self.loader.discover()
 
+    def prepareSuite(self, suites, processes):
+        return suites
+
     def runTests(self, processes=None, skips=[]):
         self.runner = self.runnerClass(self, descriptions=False, verbosity=2)
 
@@ -79,14 +82,9 @@ class OETestContext(object):
         self.skipTests(skips)
 
         self._run_start_time = time.time()
-        if processes:
-            from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
-
-            concurrent_suite = ConcurrentTestSuite(self.suites, processes)
-            result = self.runner.run(concurrent_suite)
-        else:
+        if not processes:
             self.runner.buffer = True
-            result = self.runner.run(self.suites)
+        result = self.runner.run(self.prepareSuite(self.suites, processes))
         self._run_end_time = time.time()
 
         return result
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 0d9c01e6d45..fac59f765ac 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -177,9 +177,10 @@ class dummybuf(object):
 #
 class ConcurrentTestSuite(unittest.TestSuite):
 
-    def __init__(self, suite, processes):
+    def __init__(self, suite, processes, setupfunc):
         super(ConcurrentTestSuite, self).__init__([suite])
         self.processes = processes
+        self.setupfunc = setupfunc
 
     def run(self, result):
         tests, totaltests = fork_for_tests(self.processes, self)
@@ -272,37 +273,7 @@ def fork_for_tests(concurrency_num, suite):
                 stream = os.fdopen(c2pwrite, 'wb', 1)
                 os.close(c2pread)
 
-                # Create a new separate BUILDDIR for each group of tests
-                if 'BUILDDIR' in os.environ:
-                    builddir = os.environ['BUILDDIR']
-                    newbuilddir = builddir + "-st-" + str(ourpid)
-                    newselftestdir = newbuilddir + "/meta-selftest"
-
-                    bb.utils.mkdirhier(newbuilddir)
-                    oe.path.copytree(builddir + "/conf", newbuilddir + "/conf")
-                    oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
-                    oe.path.copytree(selftestdir, newselftestdir)
-
-                    for e in os.environ:
-                        if builddir in os.environ[e]:
-                            os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
-
-                    subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-
-                    # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
-                    subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
-
-                    os.chdir(newbuilddir)
-
-                    for t in process_suite:
-                        if not hasattr(t, "tc"):
-                            continue
-                        cp = t.tc.config_paths
-                        for p in cp:
-                            if selftestdir in cp[p] and newselftestdir not in cp[p]:
-                                cp[p] = cp[p].replace(selftestdir, newselftestdir)
-                            if builddir in cp[p] and newbuilddir not in cp[p]:
-                                cp[p] = cp[p].replace(builddir, newbuilddir)
+                (builddir, newbuilddir) = suite.setupfunc("-st-" + str(ourpid), selftestdir, process_suite)
 
                 # Leave stderr and stdout open so we can see test noise
                 # Close stdin so that the child goes away if it decides to
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 3d3b19c6e80..2cb6c763852 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -10,11 +10,13 @@ import glob
 import sys
 import importlib
 import signal
+import subprocess
 from shutil import copyfile
 from random import choice
 
 import oeqa
 import oe
+import bb.utils
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
@@ -29,6 +31,54 @@ class OESelftestTestContext(OETestContext):
         self.custommachine = None
         self.config_paths = config_paths
 
+    def setup_builddir(self, suffix, selftestdir, suite):
+        builddir = os.environ['BUILDDIR']
+        if not selftestdir:
+            selftestdir = get_test_layer()
+        newbuilddir = builddir + suffix
+        newselftestdir = newbuilddir + "/meta-selftest"
+
+        if os.path.exists(newbuilddir):
+            self.logger.error("Build directory %s already exists, aborting")
+            sys.exit(1)
+
+        bb.utils.mkdirhier(newbuilddir)
+        oe.path.copytree(builddir + "/conf", newbuilddir + "/conf")
+        oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
+        oe.path.copytree(selftestdir, newselftestdir)
+
+        for e in os.environ:
+            if builddir in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
+
+        subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
+
+        # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
+        subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
+
+        os.chdir(newbuilddir)
+
+        for t in suite:
+            if not hasattr(t, "tc"):
+                continue
+            cp = t.tc.config_paths
+            for p in cp:
+                if selftestdir in cp[p] and newselftestdir not in cp[p]:
+                    cp[p] = cp[p].replace(selftestdir, newselftestdir)
+                if builddir in cp[p] and newbuilddir not in cp[p]:
+                    cp[p] = cp[p].replace(builddir, newbuilddir)
+
+        return (builddir, newbuilddir)
+
+    def prepareSuite(self, suites, processes):
+        if processes:
+            from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
+
+            return ConcurrentTestSuite(suites, processes, self.setup_builddir)
+        else:
+            self.setup_builddir("-st", None, suites)
+            return suites
+
     def runTests(self, processes=None, machine=None, skips=[]):
         if machine:
             self.custommachine = machine
-- 
2.25.0


