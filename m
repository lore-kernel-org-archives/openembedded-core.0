Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9677D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 13so4114494pfw.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9OOy9dzNTfI9duH0hlf5rUqVraeVaHcFFOu3LVR3VfY=;
	b=S7zkYakd6WVNyZ24YmpoiYRVqEqtSrnr+5N7qW+Pnc0y7Qd8JbJjrX9jeLBn9VpPvW
	Dbb5imX6oJXJwL7+8QsD0y+CRt37B6YnCPHAJsVvrp1mjZePnzpVOWrWFOZNkNlyiM1x
	0FDopGFQNFRg8lA26LkbsaGyNEb3zSCS0ewO8zfGn1/Zjm2LmED9+CXd/Kr/nXx1MoEJ
	IZM3qhGY5wYlAAuF3VXQYYgAaj13ycHdAcrYZglqzlG7mFG9VQS5O9IlfH+MD4WmqjSt
	UmcIhhBsITcsoTk7K+ussrWuBqv9N78lAu23S2u9j/HhmqF4QXdcrIkTphgTaGxKk3U5
	A8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9OOy9dzNTfI9duH0hlf5rUqVraeVaHcFFOu3LVR3VfY=;
	b=Fz88fk8+Ul/y+roJnep+V9sp8LwP4DYgLCBUubVYdK0ABZyYFgZUJ0XN9bg1COExAh
	Fhy9ZRF5zxF12ejO4I1VssuC9EgEeZvfFBN1baS3MOriwFb2RW1FBO1/+cHrmxgIwZJ/
	IpzbuIIt86lrUC+J9lAEHhh9P1qve+K6Q0KMI3HLpxWZRIkCdREJOzCkJ45PfpytBeMS
	M3+8G4sfTFgR4jvSHzWNhvUklox8p8iy9n1L/QdOT7DrtTwYkPeAqmToP0n5teQ2LXIw
	SojBp9iaKfnyqyP30MAOBOX7QOeGrqCG2aQ+C7pQJd2M+bwn4bBlQ1b0XGrmJF1OGZJ2
	AHug==
X-Gm-Message-State: APjAAAVEi8Pr/P2KBi4xWKn0opLDUjTRCafBW4MoCTOc2iRUXrodY/FS
	qbsL2Hv8LBmTa3XojV/6SflKdwRT
X-Google-Smtp-Source: APXvYqyNPUniJdpPDtI+ni7voqPbA4weuWPGH5kk3T7bm66ACC4j7VjmmHayBxkptEiVxIWsNXBPVQ==
X-Received: by 2002:a65:43c3:: with SMTP id n3mr19017621pgp.375.1556983667230; 
	Sat, 04 May 2019 08:27:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:57 -0700
Message-Id: <fd57b34d7c8a120273d65cd361be208fbdaeff50.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 21/43] oeqa/core/runner: dump stdout and stderr of each test case
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
X-List-Received-Date: Sat, 04 May 2019 15:27:46 -0000

From: "Mardegan, Alberto" <AMardegan@luxoft.com>

Some CI pipelines might perform further processing of the test output
(for instance, to plot some metrics into a chart). However, Since `thud`
we switched away from the XML-based jUnit reporting, and at the same
time we lost the ability of collecting the stdout and stderr of the
various tests.

We now restore this functionality by adding `stdout` and `stderr` keys
to the JSON reports. This behavior is off by default; in order to enable
it, one must set the `TESTREPORT_FULLLOGS` variable in the bitbake
configuration.

Signed-off-by: Alberto Mardegan <amardegan@luxoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/testimage.bbclass |  3 ++-
 meta/lib/oeqa/core/runner.py   | 20 ++++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index ff1c53b..9bb5a5c 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -316,7 +316,8 @@ def testimage_main(d):
     configuration = get_testimage_configuration(d, 'runtime', machine)
     results.logDetails(get_testimage_json_result_dir(d),
                        configuration,
-                       get_testimage_result_id(configuration))
+                       get_testimage_result_id(configuration),
+                       dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
     results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index df88b85..478b7b6 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -7,6 +7,7 @@ import unittest
 import logging
 import re
 import json
+import sys
 
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
@@ -45,6 +46,9 @@ class OETestResult(_TestResult):
 
         self.tc = tc
 
+        # stdout and stderr for each test case
+        self.logged_output = {}
+
     def startTest(self, test):
         # May have been set by concurrencytest
         if test.id() not in self.starttime:
@@ -53,6 +57,9 @@ class OETestResult(_TestResult):
 
     def stopTest(self, test):
         self.endtime[test.id()] = time.time()
+        if self.buffer:
+            self.logged_output[test.id()] = (
+                    sys.stdout.getvalue(), sys.stderr.getvalue())
         super(OETestResult, self).stopTest(test)
         if test.id() in self.progressinfo:
             self.tc.logger.info(self.progressinfo[test.id()])
@@ -118,7 +125,8 @@ class OETestResult(_TestResult):
         self.successes.append((test, None))
         super(OETestResult, self).addSuccess(test)
 
-    def logDetails(self, json_file_dir=None, configuration=None, result_id=None):
+    def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
+            dump_streams=False):
         self.tc.logger.info("RESULTS:")
 
         result = {}
@@ -144,10 +152,14 @@ class OETestResult(_TestResult):
             if status not in logs:
                 logs[status] = []
             logs[status].append("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
+            report = {'status': status}
             if log:
-                result[case.id()] = {'status': status, 'log': log}
-            else:
-                result[case.id()] = {'status': status}
+                report['log'] = log
+            if dump_streams and case.id() in self.logged_output:
+                (stdout, stderr) = self.logged_output[case.id()]
+                report['stdout'] = stdout
+                report['stderr'] = stderr
+            result[case.id()] = report
 
         for i in ['PASSED', 'SKIPPED', 'EXPECTEDFAIL', 'ERROR', 'FAILED', 'UNKNOWN']:
             if i not in logs:
-- 
2.7.4


