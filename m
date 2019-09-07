Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4F01B7F493
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:55:24 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q21so6334202pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=sYbN8xLSIGj34oZG/rZ04la2vqBAIlAmRjGbbkY30hY=;
	b=ARqyA8YY05nNHoBu1XH+2t1/OtN31QdcRzqSze2F0umpzH20toKwrJbKeA9EeG2ok3
	nWQjL3aHzGmBV6sI0qjybXWhigW9hPajERqYMV1QwaTeDuu2gKYw4P01acS+CqawXXmm
	aWPN71fvR3J4+fB2RVMaF0tJDBkE6pr83ksMHjL8hW6F4TER78HUtN8Qq9gPUi0K6A86
	x/c9yiJxRpnsu9IpJB5Vg9784Gc0b7phk+aJ1+vtAyfWFIdOyYOYnnnj4i0FMIXWt00T
	oM0P4VkB8tGg6vatMS3txF3cO7EcJlrAFKOH48WWYCf/Br4T9NG+KvyGXgkShGGS2HNY
	hbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=sYbN8xLSIGj34oZG/rZ04la2vqBAIlAmRjGbbkY30hY=;
	b=htSFjI/svBXE7jmLVD1eTiVvOVLwG3XDJxsu+/24fgTBT86fzdlr1RX62QaqETqUxa
	ObHaGOX1IvHa9mIzGU2Do07/SNBCNJ9GrEceVUr6TtIf0CCxjAPy0vL9zd74X5dLQwfI
	MYDMK8jyfmUAf7cvnMeiaVV6ZhJ/ik47Kaol3YrGWMW5x+ScQOp/5oMkrNdDustcIEg8
	00yxplM6hfzwSdXoMUubPdQCma5Ht196uMkvNHaw1ptv2xnBBI2zzHdh160bemEu0fGR
	PHVM6E6h6szrJbH3K+zV8pCR8xseS/xjwrDrQTXxXcgj1+wYihDmYZ3pl6VGoVicd0+j
	xM6g==
X-Gm-Message-State: APjAAAWQQZT3EmiUYaKERIwvP55K20y7CIYUxWDZ5pAkkY/N+agQmnmt
	428u0A1bcb+daYymfTHiTyE/GNBPgmNJkA==
X-Google-Smtp-Source: APXvYqzB9msoTLrn9+h6S6iXqhKWMzCnSSCYYJjfWzP8n9WAWLQ37YJrsgawExwNgfR2CKp4503nlw==
X-Received: by 2002:a65:5a8c:: with SMTP id c12mr12227146pgt.73.1567860924102; 
	Sat, 07 Sep 2019 05:55:24 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	g11sm7935151pgu.11.2019.09.07.05.55.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:55:22 -0700 (PDT)
Date: Sat, 07 Sep 2019 12:55:06 +0000
Message-Id: <20190907125506.17536-2-nathan@nathanrossi.com>
In-Reply-To: <20190907125506.17536-1-nathan@nathanrossi.com>
References: <20190907125506.17536-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/7] oeqa/core: Implement proper extra result collection and serialization
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
X-List-Received-Date: Sat, 07 Sep 2019 12:55:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Implement handling of extra result (e.g. ptestresult) collection with
the addition of a "extraresults" extraction function in OETestResult. In
order to be able to serialize and deserialize the extraresults data,
allow OETestResult add* calls to take a details kwarg. The subunit
module can handle cross-process transfer of binary data for the details
kwarg. With a TestResult proxy class to sit inbetween to encode and
decode to and from json.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/core/runner.py                | 41 +++++++++++++++++--
 meta/lib/oeqa/core/utils/concurrencytest.py | 61 ++++++++++++++++++++++++++++-
 2 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 63a8bae93f..f656e1a9c5 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -43,6 +43,7 @@ class OETestResult(_TestResult):
         self.starttime = {}
         self.endtime = {}
         self.progressinfo = {}
+        self.extraresults = {}
 
         # Inject into tc so that TestDepends decorator can see results
         tc.results = self
@@ -129,19 +130,51 @@ class OETestResult(_TestResult):
 
         return 'UNKNOWN', None
 
-    def addSuccess(self, test):
+    def extractExtraResults(self, test, details = None):
+        extraresults = None
+        if details is not None and "extraresults" in details:
+            extraresults = details.get("extraresults", {})
+        elif hasattr(test, "extraresults"):
+            extraresults = test.extraresults
+
+        if extraresults is not None:
+            for k, v in extraresults.items():
+                # handle updating already existing entries (e.g. ptestresults.sections)
+                if k in self.extraresults:
+                    self.extraresults[k].update(v)
+                else:
+                    self.extraresults[k] = v
+
+    def addError(self, test, *args, details = None):
+        self.extractExtraResults(test, details = details)
+        return super(OETestResult, self).addError(test, *args)
+
+    def addFailure(self, test, *args, details = None):
+        self.extractExtraResults(test, details = details)
+        return super(OETestResult, self).addFailure(test, *args)
+
+    def addSuccess(self, test, details = None):
         #Added so we can keep track of successes too
         self.successes.append((test, None))
-        super(OETestResult, self).addSuccess(test)
+        self.extractExtraResults(test, details = details)
+        return super(OETestResult, self).addSuccess(test)
+
+    def addExpectedFailure(self, test, *args, details = None):
+        self.extractExtraResults(test, details = details)
+        return super(OETestResult, self).addExpectedFailure(test, *args)
+
+    def addUnexpectedSuccess(self, test, details = None):
+        self.extractExtraResults(test, details = details)
+        return super(OETestResult, self).addUnexpectedSuccess(test)
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
             dump_streams=False):
         self.tc.logger.info("RESULTS:")
 
-        result = {}
+        result = self.extraresults
         logs = {}
         if hasattr(self.tc, "extraresults"):
-            result = self.tc.extraresults
+            result.update(self.tc.extraresults)
 
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 6bf7718863..fa6fa34b0e 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -21,6 +21,7 @@ import testtools
 import threading
 import time
 import io
+import json
 import subunit
 
 from queue import Queue
@@ -28,6 +29,8 @@ from itertools import cycle
 from subunit import ProtocolTestCase, TestProtocolClient
 from subunit.test_results import AutoTimingTestResultDecorator
 from testtools import ThreadsafeForwardingResult, iterate_tests
+from testtools.content import Content
+from testtools.content_type import ContentType
 from oeqa.utils.commands import get_test_layer
 
 import bb.utils
@@ -70,6 +73,58 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
             self.semaphore.release()
         super(BBThreadsafeForwardingResult, self)._add_result_with_semaphore(method, test, *args, **kwargs)
 
+class ProxyTestResult:
+    # a very basic TestResult proxy, in order to modify add* calls
+    def __init__(self, target):
+        self.result = target
+
+    def _addResult(self, method, test, *args, **kwargs):
+        return method(test, *args, **kwargs)
+
+    def addError(self, test, *args, **kwargs):
+        self._addResult(self.result.addError, test, *args, **kwargs)
+
+    def addFailure(self, test, *args, **kwargs):
+        self._addResult(self.result.addFailure, test, *args, **kwargs)
+
+    def addSuccess(self, test, *args, **kwargs):
+        self._addResult(self.result.addSuccess, test, *args, **kwargs)
+
+    def addExpectedFailure(self, test, *args, **kwargs):
+        self._addResult(self.result.addExpectedFailure, test, *args, **kwargs)
+
+    def addUnexpectedSuccess(self, test, *args, **kwargs):
+        self._addResult(self.result.addUnexpectedSuccess, test, *args, **kwargs)
+
+    def __getattr__(self, attr):
+        return getattr(self.result, attr)
+
+class ExtraResultsDecoderTestResult(ProxyTestResult):
+    def _addResult(self, method, test, *args, **kwargs):
+        if "details" in kwargs and "extraresults" in kwargs["details"]:
+            if isinstance(kwargs["details"]["extraresults"], Content):
+                kwargs = kwargs.copy()
+                kwargs["details"] = kwargs["details"].copy()
+                extraresults = kwargs["details"]["extraresults"]
+                data = bytearray()
+                for b in extraresults.iter_bytes():
+                    data += b
+                extraresults = json.loads(data.decode())
+                kwargs["details"]["extraresults"] = extraresults
+        return method(test, *args, **kwargs)
+
+class ExtraResultsEncoderTestResult(ProxyTestResult):
+    def _addResult(self, method, test, *args, **kwargs):
+        if hasattr(test, "extraresults"):
+            extras = lambda : [json.dumps(test.extraresults).encode()]
+            kwargs = kwargs.copy()
+            if "details" not in kwargs:
+                kwargs["details"] = {}
+            else:
+                kwargs["details"] = kwargs["details"].copy()
+            kwargs["details"]["extraresults"] = Content(ContentType("application", "json", {'charset': 'utf8'}), extras)
+        return method(test, *args, **kwargs)
+
 #
 # We have to patch subunit since it doesn't understand how to handle addError
 # outside of a running test case. This can happen if classSetUp() fails
@@ -116,7 +171,9 @@ class ConcurrentTestSuite(unittest.TestSuite):
             result.threadprogress = {}
             for i, (test, testnum) in enumerate(tests):
                 result.threadprogress[i] = []
-                process_result = BBThreadsafeForwardingResult(result, semaphore, i, testnum, totaltests)
+                process_result = BBThreadsafeForwardingResult(
+                        ExtraResultsDecoderTestResult(result),
+                        semaphore, i, testnum, totaltests)
                 # Force buffering of stdout/stderr so the console doesn't get corrupted by test output
                 # as per default in parent code
                 process_result.buffer = True
@@ -231,7 +288,7 @@ def fork_for_tests(concurrency_num, suite):
                 # as per default in parent code
                 subunit_client.buffer = True
                 subunit_result = AutoTimingTestResultDecorator(subunit_client)
-                process_suite.run(subunit_result)
+                process_suite.run(ExtraResultsEncoderTestResult(subunit_result))
                 if ourpid != os.getpid():
                     os._exit(0)
                 if newbuilddir:
---
2.23.0.rc1

