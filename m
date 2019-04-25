Return-Path: <AMardegan@luxoft.com>
Received: from mx01.luxoft.com (mx01.luxoft.com [109.166.244.56])
	by mail.openembedded.org (Postfix) with ESMTP id 62B5960125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 08:03:29 +0000 (UTC)
X-AuditID: ac1e1338-fc9ff7000001616c-9f-5cc169d1685b
Received: from ORO-EDGE-03.luxoft.com (oro-edge-03.luxoft.com [172.30.19.23])
	(using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mx01.luxoft.com (Symantec Messaging Gateway) with SMTP id
	A4.E5.24940.1D961CC5; Thu, 25 Apr 2019 11:03:29 +0300 (EEST)
Received: from oro-exch-01.luxoft.com (172.25.192.30) by
	oro-edge-03.luxoft.com (172.30.19.23) with Microsoft SMTP Server (TLS)
	id 14.3.408.0; Thu, 25 Apr 2019 11:03:28 +0300
Received: from oro-exch-01.luxoft.com (172.25.192.30) by
	oro-exch-01.luxoft.com (172.25.192.30) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id
	15.1.1466.3; Thu, 25 Apr 2019 11:03:28 +0300
Received: from oro-exch-01.luxoft.com ([fe80::1da3:c392:32fa:ad13]) by
	oro-exch-01.luxoft.com ([fe80::1da3:c392:32fa:ad13%13]) with mapi id
	15.01.1466.003; Thu, 25 Apr 2019 11:03:28 +0300
From: "Mardegan, Alberto" <AMardegan@luxoft.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] oeqa/core/runner: dump stdout and stderr of each test
	case
Thread-Index: AQHU+z1djruylqAh8Em67SFU4hHg3w==
Date: Thu, 25 Apr 2019 08:03:28 +0000
Message-ID: <20190425080311.3295-1-amardegan@luxoft.com>
References: <43646bdfb4aaa197d156f5ee8f195ad3128d74e5.camel@linuxfoundation.org>
In-Reply-To: <43646bdfb4aaa197d156f5ee8f195ad3128d74e5.camel@linuxfoundation.org>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.19.68]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRk5YXPdi5sEYg7Of5Szu/HzH7sDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujPN/3QvOq1SsP/2UuYHxnnQXIweHhICJxMtehS5GLg4hgc1M
	Ehs2vmeGcDYxSmxbsZINwvnCKPH47mZ2CGc/o8TmuTdZuxg5OdgEDCT+7l4LZosIREssnTGT
	HcRmFtCSWNpylAnEFhbwlvi68AQryDoRgSCJ9ceZIcr1JDb/PMgGYrMIqEocWd8EZvMKWEi0
	PV0CNkZIIEBi4t0GsPGcAoES/b/bwGoYBWQlJuxexAixSlzi1pP5YKskBAQkluw5zwxhi0q8
	fPyPFcJWkOh82gh1mp7EjalT2CBsbYllC18zQ+wVlDg58wkLxF5FieXf5jNNYJSYhWTFLCTt
	s5C0z0LSvoCRZRWjaH5Rvm5xbrqugbFeTmlFflqJXnJ+7iZGSGxZ7GA8fTDlECMTB6dUA6Pi
	VY/PmhG/Npkfim044XV74+Ncv8KrH3fNuil/fK3i1CU2VdlPSr/q+O/uW5px7sKZx6YLlG/+
	rKl812BwUznS47jP088aUx4nGf79VKS9c4bx162nGT6rGqffYbpptTiW/3b6p++RvL/qb/HX
	7lxX4yV4/cC5hLczo6VnmNwxmO/3rvPoB6cpSizFGYmGWsxFxYkA65X/Kl0CAAA=
Subject: [PATCH] oeqa/core/runner: dump stdout and stderr of each test case
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
X-List-Received-Date: Thu, 25 Apr 2019 08:03:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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
---
 meta/classes/testimage.bbclass |  3 ++-
 meta/lib/oeqa/core/runner.py   | 20 ++++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index ff1c53b93e..9bb5a5cb0b 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -316,7 +316,8 @@ def testimage_main(d):
     configuration =3D get_testimage_configuration(d, 'runtime', machine)
     results.logDetails(get_testimage_json_result_dir(d),
                        configuration,
-                       get_testimage_result_id(configuration))
+                       get_testimage_result_id(configuration),
+                       dump_streams=3Dd.getVar('TESTREPORT_FULLLOGS'))
     results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, =
forcelog=3DTrue)
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index df88b85f1c..478b7b6683 100644
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

         self.tc =3D tc

+        # stdout and stderr for each test case
+        self.logged_output =3D {}
+
     def startTest(self, test):
         # May have been set by concurrencytest
         if test.id() not in self.starttime:
@@ -53,6 +57,9 @@ class OETestResult(_TestResult):

     def stopTest(self, test):
         self.endtime[test.id()] =3D time.time()
+        if self.buffer:
+            self.logged_output[test.id()] =3D (
+                    sys.stdout.getvalue(), sys.stderr.getvalue())
         super(OETestResult, self).stopTest(test)
         if test.id() in self.progressinfo:
             self.tc.logger.info(self.progressinfo[test.id()])
@@ -118,7 +125,8 @@ class OETestResult(_TestResult):
         self.successes.append((test, None))
         super(OETestResult, self).addSuccess(test)

-    def logDetails(self, json_file_dir=3DNone, configuration=3DNone, resul=
t_id=3DNone):
+    def logDetails(self, json_file_dir=3DNone, configuration=3DNone, resul=
t_id=3DNone,
+            dump_streams=3DFalse):
         self.tc.logger.info("RESULTS:")

         result =3D {}
@@ -144,10 +152,14 @@ class OETestResult(_TestResult):
             if status not in logs:
                 logs[status] =3D []
             logs[status].append("RESULTS - %s - Testcase %s: %s%s" % (case=
.id(), oeid, status, t))
+            report =3D {'status': status}
             if log:
-                result[case.id()] =3D {'status': status, 'log': log}
-            else:
-                result[case.id()] =3D {'status': status}
+                report['log'] =3D log
+            if dump_streams and case.id() in self.logged_output:
+                (stdout, stderr) =3D self.logged_output[case.id()]
+                report['stdout'] =3D stdout
+                report['stderr'] =3D stderr
+            result[case.id()] =3D report

         for i in ['PASSED', 'SKIPPED', 'EXPECTEDFAIL', 'ERROR', 'FAILED', =
'UNKNOWN']:
             if i not in logs:
--
2.17.1

________________________________

This e-mail and any attachment(s) are intended only for the recipient(s) na=
med above and others who have been specifically authorized to receive them.=
 They may contain confidential information. If you are not the intended rec=
ipient, please do not read this email or its attachment(s). Furthermore, yo=
u are hereby notified that any dissemination, distribution or copying of th=
is e-mail and any attachment(s) is strictly prohibited. If you have receive=
d this e-mail in error, please immediately notify the sender by replying to=
 this e-mail and then delete this e-mail and any attachment(s) or copies th=
ereof from your system. Thank you.

