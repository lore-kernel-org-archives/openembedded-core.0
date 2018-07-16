Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 645AA71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:33:27 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id s13-v6so10444520wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=O8oW2/2mSfro9k7pK7JGLR5oBsTzZSizKggHTmmOmVQ=;
	b=WrQVSUzPGX6V5IqpQ9p4zw66eOFnni2s25b9IKgIUEk+7RkQfadkoK6ZBnlPGRrgDD
	wEDakC/s/bHKaUmoRIiWZ606YzBEuN/pWXUdBwGlyNCwdzt1y1tuwpFKoecGnP2Aovxw
	R7apheg+Hl7H18e3uBOQ56gIWTJtqCXeQkdwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=O8oW2/2mSfro9k7pK7JGLR5oBsTzZSizKggHTmmOmVQ=;
	b=c9BxbaiXcFXdNnmVKZjE8FMS+NXTz6QjzBA4kconRXXQzNh/npuK+Di19Y1vB+xAaS
	WA77Rl+y6jFUDrB21LvbqJcxfD/5ujpfdjtZrXVpzLlkkZJm1QFqJdyKsgf23eIbawPK
	v5iCdufZ0C4HN1xMOH1kSHd4ZvRVD1rfQRvJqx6YslzQ2yNqm9DbgTBGC2HAxKY1o5Vm
	M/hXzYjmifZ1H3WL5Vlfelx8q8gKRsrdJKFopfVVsy4WY2KMnBpCVikUTEBeR7+YOZPI
	SVWvZo05ttrnhJRm9NX+YVvLnR1G0ROMKzMDLYGiRo+wQYN7JujWQcnpWtnhk1dEF+aE
	m9KQ==
X-Gm-Message-State: AOUpUlEHKbhyCfs/s5utSkjZn0LRd2CTUDs/KSs3P9mxAaLucQxS14vU
	qMLRlKmvHqK5agbHO8foVtjM3ROBxME=
X-Google-Smtp-Source: AAOMgpehi+URLe3B/fiF+e3G3r8Qc1ZcwBjDX/DCo3kIO72jDCxQehn/evFk8Pm2oUmvZ9afjCVqyw==
X-Received: by 2002:a1c:ee9a:: with SMTP id
	j26-v6mr9900981wmi.116.1531758807491; 
	Mon, 16 Jul 2018 09:33:27 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j65-v6sm13571188wmd.39.2018.07.16.09.33.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 09:33:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:33:20 +0100
Message-Id: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] oeqa: Add selftest parallelisation support
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
X-List-Received-Date: Mon, 16 Jul 2018 16:33:27 -0000

This allows oe-selftest to take a -j option which specifies how much test
parallelisation to use. Currently this is "module" based with each module
being split and run in a separate build directory. Further splitting could
be done but this seems a good compromise between test setup and parallelism.

You need python-testtools and python-subunit installed to use this but only
when the -j option is specified.

See notes posted to the openedmbedded-architecture list for more details
about the design choices here.

Some of this functionality may make more sense in the oeqa core ultimately.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py               |  10 +-
 meta/lib/oeqa/core/runner.py                |  24 +-
 meta/lib/oeqa/core/utils/concurrencytest.py | 254 ++++++++++++++++++++
 meta/lib/oeqa/selftest/context.py           |   8 +-
 4 files changed, 288 insertions(+), 8 deletions(-)
 create mode 100644 meta/lib/oeqa/core/utils/concurrencytest.py

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 10481b44b61..8cdfbf834f3 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -58,14 +58,20 @@ class OETestContext(object):
                 modules_required, filters)
         self.suites = self.loader.discover()
 
-    def runTests(self, skips=[]):
+    def runTests(self, processes=None, skips=[]):
         self.runner = self.runnerClass(self, descriptions=False, verbosity=2, buffer=True)
 
         # Dinamically skip those tests specified though arguments
         self.skipTests(skips)
 
         self._run_start_time = time.time()
-        result = self.runner.run(self.suites)
+        if processes:
+            from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
+
+            concurrent_suite = ConcurrentTestSuite(self.suites, processes)
+            result = self.runner.run(concurrent_suite)
+        else:
+            result = self.runner.run(self.suites)
         self._run_end_time = time.time()
 
         return result
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 219102c6b0f..6adbe3827b4 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -43,11 +43,17 @@ class OETestResult(_TestResult):
         super(OETestResult, self).__init__(*args, **kwargs)
 
         self.successes = []
+        self.starttime = {}
+        self.endtime = {}
+        self.progressinfo = {}
 
         self.tc = tc
         self._tc_map_results()
 
     def startTest(self, test):
+        # May have been set by concurrencytest
+        if test.id() not in self.starttime:
+            self.starttime[test.id()] = time.time()
         super(OETestResult, self).startTest(test)
 
     def _tc_map_results(self):
@@ -57,6 +63,12 @@ class OETestResult(_TestResult):
         self.tc._results['expectedFailures'] = self.expectedFailures
         self.tc._results['successes'] = self.successes
 
+    def stopTest(self, test):
+        self.endtime[test.id()] = time.time()
+        super(OETestResult, self).stopTest(test)
+        if test.id() in self.progressinfo:
+            print(self.progressinfo[test.id()])
+
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
         self.tc.logger.info("SUMMARY:")
@@ -141,12 +153,16 @@ class OETestResult(_TestResult):
                     if hasattr(d, 'oeid'):
                         oeid = d.oeid
 
+            t = ""
+            if case.id() in self.starttime and case.id() in self.endtime:
+                t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
+
             if fail:
-                self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
-                    oeid, desc))
+                self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(),
+                    oeid, desc, t))
             else:
-                self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
-                    oeid, 'UNKNOWN'))
+                self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(),
+                    oeid, 'UNKNOWN', t))
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
new file mode 100644
index 00000000000..850586516a4
--- /dev/null
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -0,0 +1,254 @@
+#!/usr/bin/env python3
+#
+# Modified for use in OE by Richard Purdie, 2018
+#
+# Modified by: Corey Goldberg, 2013
+#   License: GPLv2+
+#
+# Original code from:
+#   Bazaar (bzrlib.tests.__init__.py, v2.6, copied Jun 01 2013)
+#   Copyright (C) 2005-2011 Canonical Ltd
+#   License: GPLv2+
+
+import os
+import sys
+import traceback
+import unittest
+import subprocess
+import testtools
+import threading
+import time
+import io
+
+from queue import Queue
+from itertools import cycle
+from subunit import ProtocolTestCase, TestProtocolClient
+from subunit.test_results import AutoTimingTestResultDecorator
+from testtools import ThreadsafeForwardingResult, iterate_tests
+
+import bb.utils
+import oe.path
+
+_all__ = [
+    'ConcurrentTestSuite',
+    'fork_for_tests',
+    'partition_tests',
+]
+
+#
+# Patch the version from testtools to allow access to _test_start and allow
+# computation of timing information and threading progress
+#
+class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
+
+    def __init__(self, target, semaphore, threadnum, totalinprocess, totaltests):
+        super(BBThreadsafeForwardingResult, self).__init__(target, semaphore)
+        self.threadnum = threadnum
+        self.totalinprocess = totalinprocess
+        self.totaltests = totaltests
+
+    def _add_result_with_semaphore(self, method, test, *args, **kwargs):
+        self.semaphore.acquire()
+        try:
+            self.result.starttime[test.id()] = self._test_start.timestamp()
+            self.result.threadprogress[self.threadnum].append(test.id())
+            totalprogress = sum(len(x) for x in self.result.threadprogress.values())
+            self.result.progressinfo[test.id()] = "%s: %s/%s %s/%s (%ss) (%s)" % (
+                    self.threadnum,
+                    len(self.result.threadprogress[self.threadnum]),
+                    self.totalinprocess,
+                    totalprogress,
+                    self.totaltests,
+                    "{0:.2f}".format(time.time()-self._test_start.timestamp()),
+                    test.id())
+        finally:
+            self.semaphore.release()
+        super(BBThreadsafeForwardingResult, self)._add_result_with_semaphore(method, test, *args, **kwargs)
+
+#
+# A dummy structure to add to io.StringIO so that the .buffer object
+# is available and accepts writes. This allows unittest with buffer=True
+# to interact ok with subunit which wants to access sys.stdout.buffer.
+#
+class dummybuf(object):
+   def __init__(self, parent):
+       self.p = parent
+   def write(self, data):
+       self.p.write(data.decode("utf-8"))
+
+#
+# Taken from testtools.ConncurrencyTestSuite but modified for OE use
+#
+class ConcurrentTestSuite(unittest.TestSuite):
+
+    def __init__(self, suite, processes):
+        super(ConcurrentTestSuite, self).__init__([suite])
+        self.processes = processes
+
+    def run(self, result):
+        tests, totaltests = fork_for_tests(self.processes, self)
+        try:
+            threads = {}
+            queue = Queue()
+            semaphore = threading.Semaphore(1)
+            result.threadprogress = {}
+            for i, (test, testnum) in enumerate(tests):
+                result.threadprogress[i] = []
+                process_result = BBThreadsafeForwardingResult(result, semaphore, i, testnum, totaltests)
+                # Force buffering of stdout/stderr so the console doesn't get corrupted by test output
+                # as per default in parent code
+                process_result.buffer = True
+                # We have to add a buffer object to stdout to keep subunit happy
+                process_result._stderr_buffer = io.StringIO()
+                process_result._stderr_buffer.buffer = dummybuf(process_result._stderr_buffer)
+                process_result._stdout_buffer = io.StringIO()
+                process_result._stdout_buffer.buffer = dummybuf(process_result._stdout_buffer)
+                reader_thread = threading.Thread(
+                    target=self._run_test, args=(test, process_result, queue))
+                threads[test] = reader_thread, process_result
+                reader_thread.start()
+            while threads:
+                finished_test = queue.get()
+                threads[finished_test][0].join()
+                del threads[finished_test]
+        except:
+            for thread, process_result in threads.values():
+                process_result.stop()
+            raise
+
+    def _run_test(self, test, process_result, queue):
+        try:
+            try:
+                test.run(process_result)
+            except Exception:
+                # The run logic itself failed
+                case = testtools.ErrorHolder(
+                    "broken-runner",
+                    error=sys.exc_info())
+                case.run(process_result)
+        finally:
+            queue.put(test)
+
+def removebuilddir(d):
+    delay = 5
+    while delay and os.path.exists(d + "/bitbake.lock"):
+        time.sleep(1)
+        delay = delay - 1
+    bb.utils.prunedir(d)
+
+def fork_for_tests(concurrency_num, suite):
+    result = []
+    test_blocks = partition_tests(suite, concurrency_num)
+    # Clear the tests from the original suite so it doesn't keep them alive
+    suite._tests[:] = []
+    totaltests = sum(len(x) for x in test_blocks)
+    for process_tests in test_blocks:
+        numtests = len(process_tests)
+        process_suite = unittest.TestSuite(process_tests)
+        # Also clear each split list so new suite has only reference
+        process_tests[:] = []
+        c2pread, c2pwrite = os.pipe()
+        # Clear buffers before fork to avoid duplicate output
+        sys.stdout.flush()
+        sys.stderr.flush()
+        pid = os.fork()
+        if pid == 0:
+            ourpid = os.getpid()
+            try:
+                newbuilddir = None
+                stream = os.fdopen(c2pwrite, 'wb', 1)
+                os.close(c2pread)
+
+                # Create a new separate BUILDDIR for each group of tests
+                if 'BUILDDIR' in os.environ:
+                    builddir = os.environ['BUILDDIR']
+                    newbuilddir = builddir + "-st-" + str(ourpid)
+                    selftestdir = os.path.abspath(builddir + "/../meta-selftest")
+                    newselftestdir = newbuilddir + "/meta-selftest"
+
+                    bb.utils.mkdirhier(newbuilddir)
+                    oe.path.copytree(builddir + "/conf", newbuilddir + "/conf")
+                    oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
+                    oe.path.copytree(selftestdir, newselftestdir)
+
+                    for e in os.environ:
+                        if builddir in os.environ[e]:
+                            os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
+
+                    subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
+
+                    # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
+                    subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
+
+                    os.chdir(newbuilddir)
+
+                    for t in process_suite:
+                        if not hasattr(t, "tc"):
+                            continue
+                        cp = t.tc.config_paths
+                        for p in cp:
+                            if selftestdir in cp[p] and newselftestdir not in cp[p]:
+                                cp[p] = cp[p].replace(selftestdir, newselftestdir)
+                            if builddir in cp[p] and newbuilddir not in cp[p]:
+                                cp[p] = cp[p].replace(builddir, newbuilddir)
+
+                # Leave stderr and stdout open so we can see test noise
+                # Close stdin so that the child goes away if it decides to
+                # read from stdin (otherwise its a roulette to see what
+                # child actually gets keystrokes for pdb etc).
+                newsi = os.open(os.devnull, os.O_RDWR)
+                os.dup2(newsi, sys.stdin.fileno())
+
+                subunit_client = TestProtocolClient(stream)
+                # Force buffering of stdout/stderr so the console doesn't get corrupted by test output
+                # as per default in parent code
+                subunit_client.buffer = True
+                subunit_result = AutoTimingTestResultDecorator(subunit_client)
+                process_suite.run(subunit_result)
+                if ourpid != os.getpid():
+                    os._exit(0)
+                if newbuilddir:
+                    removebuilddir(newbuilddir)
+            except:
+                # Don't do anything with process children
+                if ourpid != os.getpid():
+                    os._exit(1)
+                # Try and report traceback on stream, but exit with error
+                # even if stream couldn't be created or something else
+                # goes wrong.  The traceback is formatted to a string and
+                # written in one go to avoid interleaving lines from
+                # multiple failing children.
+                try:
+                    stream.write(traceback.format_exc().encode('utf-8'))
+                except:
+                    sys.stderr.write(traceback.format_exc())
+                finally:
+                    if newbuilddir:
+                        removebuilddir(newbuilddir)
+                    os._exit(1)
+            os._exit(0)
+        else:
+            os.close(c2pwrite)
+            stream = os.fdopen(c2pread, 'rb', 1)
+            test = ProtocolTestCase(stream)
+            result.append((test, numtests))
+    return result, totaltests
+
+def partition_tests(suite, count):
+    # Keep tests from the same class together but allow tests from modules
+    # to go to different processes to aid parallelisation.
+    modules = {}
+    for test in iterate_tests(suite):
+        m = test.__module__ + "." + test.__class__.__name__
+        if m not in modules:
+            modules[m] = []
+        modules[m].append(test)
+
+    # Simply divide the test blocks between the available processes
+    partitions = [list() for _ in range(count)]
+    for partition, m in zip(cycle(partitions), modules):
+        partition.extend(modules[m])
+
+    # No point in empty threads so drop them
+    return [p for p in partitions if p]
+
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 9e90d3c2565..c937b8171c9 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -25,14 +25,14 @@ class OESelftestTestContext(OETestContext):
         self.custommachine = None
         self.config_paths = config_paths
 
-    def runTests(self, machine=None, skips=[]):
+    def runTests(self, processes=None, machine=None, skips=[]):
         if machine:
             self.custommachine = machine
             if machine == 'random':
                 self.custommachine = choice(self.machines)
             self.logger.info('Run tests with custom MACHINE set to: %s' % \
                     self.custommachine)
-        return super(OESelftestTestContext, self).runTests(skips)
+        return super(OESelftestTestContext, self).runTests(processes, skips)
 
     def listTests(self, display_type, machine=None):
         return super(OESelftestTestContext, self).listTests(display_type)
@@ -68,6 +68,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 action="store_true", default=False,
                 help='List all available tests.')
 
+        parser.add_argument('-j', '--num-processes', dest='processes', action='store',
+                type=int, help="number of processes to execute in parallel with")
+
         parser.add_argument('--machine', required=False, choices=['random', 'all'],
                             help='Run tests on different machines (random/all).')
         
@@ -137,6 +140,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 self.tc_kwargs['init']['config_paths']['bblayers_backup'])
 
         self.tc_kwargs['run']['skips'] = args.skips
+        self.tc_kwargs['run']['processes'] = args.processes
 
     def _pre_run(self):
         def _check_required_env_variables(vars):
-- 
2.17.1


