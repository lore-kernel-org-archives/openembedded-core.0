Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A85F178B2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:39:50 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id h20-v6so9248371wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=RhkQW9c2wzf4hEdSaOxejMyKKq7ATOTHsJjOE9cYDds=;
	b=Y2pIcEGslCKx70SDcMuNuVQ3SQYvGJa564SFyWf7kL6bxBq6ZJp8IUtXSWnkQwW5BH
	QiqAXl34EoWu3iMfI6WegKjoFxAKuqKUTsNy9L+GJ+n+93IcxBcwYGKuNJ9ROaCg/kXG
	eoqrdrHdLRF9hRkEoif+i9snUd9pN7XS0JRLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RhkQW9c2wzf4hEdSaOxejMyKKq7ATOTHsJjOE9cYDds=;
	b=hMsgDUsqNaG+MBiCGK6FTLzdkXoGNFfEtmGdh8SomWdkcTRZiy0b4A2lCaNeQEUKYD
	VHUHlCec5v6LzbX2J1P1a0//O2POGpWpqTpfqN8CoeSniBJqKOjZMkSvsq2YwrF43nxQ
	+UTM24cyORXOiqlopPdLMOXpBI5NN//plS1L8/zcelxaUuBDSUXjFJdZ8QqjQd6VVscV
	/qqiPUfkT4EymR172HPttOcWF/Ot9YDkDQHBjSBRum/ubx3SZwdOMzO+O6k11uRGseg/
	rSPQnEsKbTUvWolY6/ZyVn4rmD+MAhhEI9qL8mhA0H2nz0Xj1222re/NFKhnXyEe35mP
	JIbg==
X-Gm-Message-State: AOUpUlFwg3mvObET2uWkrPPrIRN72/5zlfDZTnrmqEYQX6Matc2iZ5SC
	p+nyaDoanNXRyqawAA5U7bvMyhZh+FrioA==
X-Google-Smtp-Source: AAOMgpdItBw58cO/KOWGUEIpRJQ69OSQWosOOGtR0dzepsyDkuG30CHOqC5pltVYGY5cDLrMjJw7hQ==
X-Received: by 2002:a1c:3e8e:: with SMTP id
	l136-v6mr1113101wma.45.1532083190892; 
	Fri, 20 Jul 2018 03:39:50 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:39 +0100
Message-Id: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/10] utils: Add multiprocess_launch API and testcase
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
X-List-Received-Date: Fri, 20 Jul 2018 10:39:50 -0000

The current methods of spawning processes for parallel execution have
issues around collection of results or exceptions.

Take the code from package_ipk/deb, make it generic, add a results
collection mechanism, fix the exception handling and for it into a
standard library function.

Also add a test case which tests both the success and failure modes
of operation to stop this functionality regressiing again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py                        | 70 +++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 46 +++++++++++++-
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 6aed6dc993b..77c1939b8ab 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -1,4 +1,6 @@
 import subprocess
+import multiprocessing
+import traceback
 
 def read_file(filename):
     try:
@@ -280,6 +282,74 @@ def multiprocess_exec(commands, function):
 
     return results
 
+# For each item in items, call the function 'target' with item as the first 
+# argument, extraargs as the other arguments and handle any exceptions in the
+# parent thread
+def multiprocess_launch(target, items, d, extraargs=None):
+
+    class ProcessLauch(multiprocessing.Process):
+        def __init__(self, *args, **kwargs):
+            multiprocessing.Process.__init__(self, *args, **kwargs)
+            self._pconn, self._cconn = multiprocessing.Pipe()
+            self._exception = None
+            self._result = None
+
+        def run(self):
+            try:
+                ret = self._target(*self._args, **self._kwargs)
+                self._cconn.send((None, ret))
+            except Exception as e:
+                tb = traceback.format_exc()
+                self._cconn.send((e, tb))
+
+        def update(self):
+            if self._pconn.poll():
+                (e, tb) = self._pconn.recv()
+                if e is not None:
+                    self._exception = (e, tb)
+                else:
+                    self._result = tb
+
+        @property
+        def exception(self):
+            self.update()
+            return self._exception
+
+        @property
+        def result(self):
+            self.update()
+            return self._result
+
+    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
+    launched = []
+    errors = []
+    results = []
+    items = list(items)
+    while (items and not errors) or launched:
+        if not errors and items and len(launched) < max_process:
+            args = (items.pop(),)
+            if extraargs is not None:
+                args = args + extraargs
+            p = ProcessLauch(target=target, args=args)
+            p.start()
+            launched.append(p)
+        for q in launched:
+            # The finished processes are joined when calling is_alive()
+            if not q.is_alive():
+                if q.exception:
+                    errors.append(q.exception)
+                if q.result:
+                    results.append(q.result)
+                launched.remove(q)
+    # Paranoia doesn't hurt
+    for p in launched:
+        p.join()
+    if errors:
+        for (e, tb) in errors:
+            bb.error(str(tb))
+        bb.fatal("Fatal errors occurred in subprocesses, tracebacks printed above")
+    return results
+
 def squashspaces(string):
     import re
     return re.sub("\s+", " ", string).strip()
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index 9fb6c1576e0..275aeda74eb 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -1,5 +1,8 @@
+import sys
 from unittest.case import TestCase
-from oe.utils import packages_filter_out_system, trim_version
+from contextlib import contextmanager
+from io import StringIO
+from oe.utils import packages_filter_out_system, trim_version, multiprocess_launch
 
 class TestPackagesFilterOutSystem(TestCase):
     def test_filter(self):
@@ -49,3 +52,44 @@ class TestTrimVersion(TestCase):
         self.assertEqual(trim_version("1.2.3", 2), "1.2")
         self.assertEqual(trim_version("1.2.3", 3), "1.2.3")
         self.assertEqual(trim_version("1.2.3", 4), "1.2.3")
+
+
+class TestMultiprocessLaunch(TestCase):
+
+    def test_multiprocesslaunch(self):
+        import bb
+
+        def testfunction(item, d):
+            if item == "2" or item == "1":
+                raise KeyError("Invalid number %s" % item)
+            return "Found %s" % item
+
+        def dummyerror(msg):
+            print("ERROR: %s" % msg)
+
+        @contextmanager
+        def captured_output():
+            new_out, new_err = StringIO(), StringIO()
+            old_out, old_err = sys.stdout, sys.stderr
+            try:
+                sys.stdout, sys.stderr = new_out, new_err
+                yield sys.stdout, sys.stderr
+            finally:
+                sys.stdout, sys.stderr = old_out, old_err
+
+        d = bb.data_smart.DataSmart()
+        bb.error = dummyerror
+
+        # Assert the function returns the right results
+        result = multiprocess_launch(testfunction, ["3", "4", "5", "6"], d, extraargs=(d,))
+        self.assertIn("Found 3", result)
+        self.assertIn("Found 4", result)
+        self.assertIn("Found 5", result)
+        self.assertIn("Found 6", result)
+        self.assertEqual(len(result), 4)
+
+        # Assert the function prints exceptions
+        with captured_output() as (out, err):
+            self.assertRaises(bb.BBHandledException, multiprocess_launch, testfunction, ["1", "2", "3", "4", "5", "6"], d, extraargs=(d,))
+        self.assertIn("KeyError: 'Invalid number 1'", out.getvalue())
+        self.assertIn("KeyError: 'Invalid number 2'", out.getvalue())
-- 
2.17.1


