Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5697FC9A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 19:21:55 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id x21so7568125iol.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 11:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XHBkRFPM6Zf9PN+G25NYN+UpwMc0rJZaeVd9iQ3tEaE=;
	b=dW+X1sGH5mIF6mW6T8t4L6lkzBBTf0SE0ZaaHehYvoY/XBU/NpzFrUP53sXuz2nGNJ
	VZdKRxb8G6ykuHqx1qC23SIP3fNx0XetQ8qfE/pGkvktvCk0eDECb+yT3uwoP3DslBVo
	2ry6ElD6uOpY6hhY5QEKJvAQyIsZP18fXtk0RZ3gSrizICIx+HrorAdx9ILPbEannjvl
	/b0ZclKQMCDHkek1VM/PajKV4QWHs6B/OlF3FafHQcgvU154EG6NbbaNLrmqMzeLeRCp
	525tkcu8FiMFzVQh0pL/x+efITsMttiRleF/uY8aMJGf1d6sXw8v1pOZC1fd374tE+t2
	vK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XHBkRFPM6Zf9PN+G25NYN+UpwMc0rJZaeVd9iQ3tEaE=;
	b=YoIU5vwa/3VsGoelwzB+wrO7k+u1zWtekhvyf+X+haBwJJRClfYKI4urId6SJ8bdDV
	PTyEIQVaxfeMKOKtrL1RtNyQWDz5C5B4IGWHED/Hjk8wQ75njP0yAKNekqoFQtjtkyDj
	NBq4rMAlAIrOffVQnjSFWGryDqc5+fu+AFjKwnEVuQQSd7/TPRT2+vEHBJrdLkoOvMIV
	xHYQ+/TGkl+T+8U1LaqxE1XqmgijCOafOCTP6W9BthG4YWAAg9XwZumEjvwB7JvzfXQV
	nK6g7/FrtdV/oQPiGegdgjG5jFMCB/2mO780eYxN8bol8NUBur3fgk6BBJe0u4WwK7Ha
	Xj/g==
X-Gm-Message-State: APjAAAVQeQLwP4HXq03BMaAS8TbksAZR9pOWYTUGq1LM/JRqZGlnetDY
	FRSNHJEm9VnbJdGrxYoSMY+rX5zzFN8=
X-Google-Smtp-Source: APXvYqwqcD+cQqmk8ZN0bdvL4VTw2bZKlR4iqfpKzIkR2YW8FtmLlFvIt5GXfQcZ9ADbWERemNEE/g==
X-Received: by 2002:a5d:8789:: with SMTP id f9mr12277180ion.237.1573240916423; 
	Fri, 08 Nov 2019 11:21:56 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 16sm578957ilz.44.2019.11.08.11.21.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Nov 2019 11:21:55 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2019 13:21:53 -0600
Message-Id: <20191108192153.2133662-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: Fix subTest result reporting
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
X-List-Received-Date: Fri, 08 Nov 2019 19:21:56 -0000
Content-Transfer-Encoding: 8bit

Fixes the way that subTest results are reported so that each subTest is
reported independently, with it's own status. The base test case is also
reported, but only if it actually had a status.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/core/runner.py                | 44 +++++++++++++++++----
 meta/lib/oeqa/core/utils/concurrencytest.py |  3 ++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index f656e1a9c5f..ee9db6f7951 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -40,6 +40,7 @@ class OETestResult(_TestResult):
         super(OETestResult, self).__init__(*args, **kwargs)
 
         self.successes = []
+        self.subtests = {}
         self.starttime = {}
         self.endtime = {}
         self.progressinfo = {}
@@ -145,6 +146,13 @@ class OETestResult(_TestResult):
                 else:
                     self.extraresults[k] = v
 
+    def addSubTest(self, test, subtest, err, details=None):
+        self.extractExtraResults(test, details=details)
+        self.subtests.setdefault(test, list()).append(subtest)
+        if err is None:
+            self.successes.append((subtest, None))
+        return super(OETestResult, self).addSubTest(test, subtest, err)
+
     def addError(self, test, *args, details = None):
         self.extractExtraResults(test, details = details)
         return super(OETestResult, self).addError(test, *args)
@@ -169,18 +177,18 @@ class OETestResult(_TestResult):
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
             dump_streams=False):
-        self.tc.logger.info("RESULTS:")
-
-        result = self.extraresults
-        logs = {}
-        if hasattr(self.tc, "extraresults"):
-            result.update(self.tc.extraresults)
 
-        for case_name in self.tc._registry['cases']:
-            case = self.tc._registry['cases'][case_name]
+        def logCaseDetails(case, required):
+            nonlocal self
+            nonlocal result
+            nonlocal dump_streams
+            nonlocal logs
 
             (status, log) = self._getTestResultDetails(case)
 
+            if status == "UNKNOWN" and not required:
+                return
+
             t = ""
             if case.id() in self.starttime and case.id() in self.endtime:
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
@@ -197,6 +205,26 @@ class OETestResult(_TestResult):
                 report['stderr'] = stderr
             result[case.id()] = report
 
+        self.tc.logger.info("RESULTS:")
+
+        result = self.extraresults
+        logs = {}
+        if hasattr(self.tc, "extraresults"):
+            result.update(self.tc.extraresults)
+
+        for case_name in self.tc._registry['cases']:
+            case = self.tc._registry['cases'][case_name]
+
+            if case in self.subtests:
+                for subtest in self.subtests[case]:
+                    logCaseDetails(subtest, True)
+
+                # The base case may not have any reported details. If it comes
+                # up as unknown, don't report anything.
+                logCaseDetails(case, False)
+            else:
+                logCaseDetails(case, True)
+
         for i in ['PASSED', 'SKIPPED', 'EXPECTEDFAIL', 'ERROR', 'FAILED', 'UNKNOWN']:
             if i not in logs:
                 continue
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 0f7b3dcc113..ae68fd50902 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -81,6 +81,9 @@ class ProxyTestResult:
     def _addResult(self, method, test, *args, exception = False, **kwargs):
         return method(test, *args, **kwargs)
 
+    def addSubTest(self, test, subtest, outcome, **kwargs):
+        self._addResult(self.result.addSubTest, test, subtest, outcome, exception = (outcome is not None), **kwargs)
+
     def addError(self, test, err = None, **kwargs):
         self._addResult(self.result.addError, test, err, exception = True, **kwargs)
 
-- 
2.23.0


