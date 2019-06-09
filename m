Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7527E53F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s11so3793013pfm.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hs0AxDlqK77NcP4Rllfxwz9qRBGPcm3mxtk3SXC2ruI=;
	b=XfYMIcD5geeH4MuPxGm7Pp0nfFF53oFfA95xBSYPkPjSp8Gx9508qUoLukj0jvO7mT
	UYIwWc25B1NqgEpcAhdDu4Tipk2mrlEv7XUBcPciecvaCpLFNq4uZDSArk4Rix7AdYZO
	rymv6mTbjrc5pELxKZCgNijAbrlQ0qjB5TccdA8RXgxFGQoQJCSjrkm3TD3j5FHyTVx4
	Y/pZ6IoXxr5WHCKHXqACSme+vyNEpwr/bjEbIKOQ1klHNSlejrTSZrkqNIHKMb/kD2Ta
	ky37WMOxPspuhe0mvH8eQyouvMpAdKTgNnsQV+HrEJVYnnPR6fwqBGfsKoui3POGaD25
	c9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hs0AxDlqK77NcP4Rllfxwz9qRBGPcm3mxtk3SXC2ruI=;
	b=YjVby9iFm7e741dL2ufwrhQliXEWyCE3gPL1qNoD1ZLfhjNChpo/SBMpA3YPmnV7Ni
	7g5aOM+8WH7U/mC9ibHBuO3ejiF+Gg0sEO7aEkZUOROlG7sNEOz0/pXVMog50BaQ3M61
	mrIEcfSstTXvLKe3nV8JswLYT7TXOwTErsbLeO+F5qFsbo4+SBpoHsgZHGMmr0EpZf0v
	q2Kumg2f4U3tGZBhDG2qKLCd12crBS/fS/4u6ukF1usq84AabpG0XHOFRPUzKWYTuyYN
	nqqisrN5gFHC/ueBYUZ7g4uc5cibMYcuYVrYOf9G/QJZACr7R4bEHx8X5sJZjA1hInm9
	RckQ==
X-Gm-Message-State: APjAAAXpqOCEQ6r1VOIWuuv7/zF3XB33MNHCPajNqfhVEFzuw8EPhgHt
	1+h8vqP1gzN/LOhEvkiBZT8TUlod
X-Google-Smtp-Source: APXvYqxLHBMNK1wsuLzFh048fn+dqL2xwDyofcOeJfH0ilPXEKJ56Lf6QqkSvhVlnuNwUTpJzPjlbg==
X-Received: by 2002:a63:4710:: with SMTP id u16mr11953233pga.447.1560092063069;
	Sun, 09 Jun 2019 07:54:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:54 -0700
Message-Id: <21a5bbad64d06e996cc87518f7a6ec173cb67098.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 19/27] resulttool: modify to be multi-machine
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:22 -0000

From: Jon Mason <jdmason@kudzu.us>

Currently, the code will sum all of the different machine results into a
single report of the tests results.  This can lead to confusion as to
which machine may be experiencing issues.  Modify the code to store the
results in a per machine basis and report them accordingly.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py    |   2 +-
 scripts/lib/resulttool/report.py                   | 104 +++++++++++----------
 .../resulttool/template/test_report_full_text.txt  |  44 +++++----
 3 files changed, 82 insertions(+), 68 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 10eb9c1..dac5c46 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -56,7 +56,7 @@ class ResultToolTests(OESelftestTestCase):
                                   'test4': {'status': 'ERROR'},
                                   'test5': {'status': 'SKIPPED'}}}
         report = ResultsTextReport()
-        result_report = report.get_aggregated_test_result(None, result_data)
+        result_report = report.get_aggregated_test_result(None, result_data, 'DummyMachine')
         self.assertTrue(result_report['passed'] == 2, msg="Passed count not correct:%s" % result_report['passed'])
         self.assertTrue(result_report['failed'] == 2, msg="Failed count not correct:%s" % result_report['failed'])
         self.assertTrue(result_report['skipped'] == 1, msg="Skipped count not correct:%s" % result_report['skipped'])
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index cb6b1cf..a48c59f 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -24,16 +24,19 @@ class ResultsTextReport(object):
                              'skipped': ['SKIPPED', 'skipped']}
 
 
-    def handle_ptest_result(self, k, status, result):
+    def handle_ptest_result(self, k, status, result, machine):
+        if machine not in self.ptests:
+            self.ptests[machine] = {}
+
         if k == 'ptestresult.sections':
             # Ensure tests without any test results still show up on the report
             for suite in result['ptestresult.sections']:
-                if suite not in self.ptests:
-                    self.ptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                if suite not in self.ptests[machine]:
+                    self.ptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
                 if 'duration' in result['ptestresult.sections'][suite]:
-                    self.ptests[suite]['duration'] = result['ptestresult.sections'][suite]['duration']
+                    self.ptests[machine][suite]['duration'] = result['ptestresult.sections'][suite]['duration']
                 if 'timeout' in result['ptestresult.sections'][suite]:
-                    self.ptests[suite]['duration'] += " T"
+                    self.ptests[machine][suite]['duration'] += " T"
             return
         try:
             _, suite, test = k.split(".", 2)
@@ -47,22 +50,25 @@ class ResultsTextReport(object):
                     suite = suite + "." + suite1
             except ValueError:
                 pass
-        if suite not in self.ptests:
-            self.ptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+        if suite not in self.ptests[machine]:
+            self.ptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
         for tk in self.result_types:
             if status in self.result_types[tk]:
-                self.ptests[suite][tk] += 1
+                self.ptests[machine][suite][tk] += 1
+
+    def handle_ltptest_result(self, k, status, result, machine):
+        if machine not in self.ltptests:
+            self.ltptests[machine] = {}
 
-    def handle_ltptest_result(self, k, status, result):
         if k == 'ltpresult.sections':
             # Ensure tests without any test results still show up on the report
             for suite in result['ltpresult.sections']:
-                if suite not in self.ltptests:
-                    self.ltptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                if suite not in self.ltptests[machine]:
+                    self.ltptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
                 if 'duration' in result['ltpresult.sections'][suite]:
-                    self.ltptests[suite]['duration'] = result['ltpresult.sections'][suite]['duration']
+                    self.ltptests[machine][suite]['duration'] = result['ltpresult.sections'][suite]['duration']
                 if 'timeout' in result['ltpresult.sections'][suite]:
-                    self.ltptests[suite]['duration'] += " T"
+                    self.ltptests[machine][suite]['duration'] += " T"
             return
         try:
             _, suite, test = k.split(".", 2)
@@ -77,20 +83,23 @@ class ResultsTextReport(object):
                     suite = suite + "." + suite1
             except ValueError:
                 pass
-        if suite not in self.ltptests:
-            self.ltptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+        if suite not in self.ltptests[machine]:
+            self.ltptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
         for tk in self.result_types:
             if status in self.result_types[tk]:
-                self.ltptests[suite][tk] += 1
+                self.ltptests[machine][suite][tk] += 1
+
+    def handle_ltpposixtest_result(self, k, status, result, machine):
+        if machine not in self.ltpposixtests:
+            self.ltpposixtests[machine] = {}
 
-    def handle_ltpposixtest_result(self, k, status, result):
         if k == 'ltpposixresult.sections':
             # Ensure tests without any test results still show up on the report
             for suite in result['ltpposixresult.sections']:
-                if suite not in self.ltpposixtests:
-                    self.ltpposixtests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                if suite not in self.ltpposixtests[machine]:
+                    self.ltpposixtests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
                 if 'duration' in result['ltpposixresult.sections'][suite]:
-                    self.ltpposixtests[suite]['duration'] = result['ltpposixresult.sections'][suite]['duration']
+                    self.ltpposixtests[machine][suite]['duration'] = result['ltpposixresult.sections'][suite]['duration']
             return
         try:
             _, suite, test = k.split(".", 2)
@@ -104,19 +113,13 @@ class ResultsTextReport(object):
                     suite = suite + "." + suite1
             except ValueError:
                 pass
-        if suite not in self.ltpposixtests:
-            self.ltpposixtests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+        if suite not in self.ltpposixtests[machine]:
+            self.ltpposixtests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
         for tk in self.result_types:
             if status in self.result_types[tk]:
-                self.ltpposixtests[suite][tk] += 1
+                self.ltpposixtests[machine][suite][tk] += 1
 
-    def get_aggregated_test_result(self, logger, testresult):
-        test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
-    def get_aggregated_test_result(self, logger, testresult):
-        test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
-    def get_aggregated_test_result(self, logger, testresult):
-        test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
-    def get_aggregated_test_result(self, logger, testresult):
+    def get_aggregated_test_result(self, logger, testresult, machine):
         test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
         result = testresult.get('result', [])
         for k in result:
@@ -127,11 +130,11 @@ class ResultsTextReport(object):
             if test_status in self.result_types['failed']:
                 test_count_report['failed_testcases'].append(k)
             if k.startswith("ptestresult."):
-                self.handle_ptest_result(k, test_status, result)
+                self.handle_ptest_result(k, test_status, result, machine)
             if k.startswith("ltpresult."):
-                self.handle_ltptest_result(k, test_status, result)
+                self.handle_ltptest_result(k, test_status, result, machine)
             if k.startswith("ltpposixresult."):
-                self.handle_ltpposixtest_result(k, test_status, result)
+                self.handle_ltpposixtest_result(k, test_status, result, machine)
         return test_count_report
 
     def print_test_report(self, template_file_name, test_count_reports):
@@ -141,10 +144,8 @@ class ResultsTextReport(object):
         env = Environment(loader=file_loader, trim_blocks=True)
         template = env.get_template(template_file_name)
         havefailed = False
-        haveptest = bool(self.ptests)
-        haveltp = bool(self.ltptests)
-        haveltpposix = bool(self.ltpposixtests)
         reportvalues = []
+        machines = []
         cols = ['passed', 'failed', 'skipped']
         maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 ,'ltptest': 0, 'ltpposixtest': 0}
         for line in test_count_reports:
@@ -162,21 +163,24 @@ class ResultsTextReport(object):
             reportvalues.append(vals)
             if line['failed_testcases']:
                 havefailed = True
-        for ptest in self.ptests:
-            if len(ptest) > maxlen['ptest']:
-                maxlen['ptest'] = len(ptest)
-        for ltptest in self.ltptests:
-            if len(ltptest) > maxlen['ltptest']:
-                maxlen['ltptest'] = len(ltptest)
-        for ltpposixtest in self.ltpposixtests:
-            if len(ltpposixtest) > maxlen['ltpposixtest']:
-                maxlen['ltpposixtest'] = len(ltpposixtest)
+            if line['machine'] not in machines:
+                machines.append(line['machine'])
+        for (machine, report) in self.ptests.items():
+            for ptest in self.ptests[machine]:
+                if len(ptest) > maxlen['ptest']:
+                    maxlen['ptest'] = len(ptest)
+        for (machine, report) in self.ltptests.items():
+            for ltptest in self.ltptests[machine]:
+                if len(ltptest) > maxlen['ltptest']:
+                    maxlen['ltptest'] = len(ltptest)
+        for (machine, report) in self.ltpposixtests.items():
+            for ltpposixtest in self.ltpposixtests[machine]:
+                if len(ltpposixtest) > maxlen['ltpposixtest']:
+                    maxlen['ltpposixtest'] = len(ltpposixtest)
         output = template.render(reportvalues=reportvalues,
                                  havefailed=havefailed,
-                                 haveptest=haveptest,
+                                 machines=machines,
                                  ptests=self.ptests,
-                                 haveltp=haveltp,
-                                 haveltpposix=haveltpposix,
                                  ltptests=self.ltptests,
                                  ltpposixtests=self.ltpposixtests,
                                  maxlen=maxlen)
@@ -200,7 +204,9 @@ class ResultsTextReport(object):
         for testsuite in testresults:
             for resultid in testresults[testsuite]:
                 result = testresults[testsuite][resultid]
-                test_count_report = self.get_aggregated_test_result(logger, result)
+                machine = result['configuration']['MACHINE']
+                test_count_report = self.get_aggregated_test_result(logger, result, machine)
+                test_count_report['machine'] = machine
                 test_count_report['testseries'] = result['configuration']['TESTSERIES']
                 test_count_report['result_id'] = resultid
                 test_count_reports.append(test_count_report)
diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index d2725b8..6a5a081 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -9,54 +9,62 @@ Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
 
-{% if haveptest %}
+
+{% for machine in machines %}
+{% if ptests[machine] %}
 ==============================================================================================================
-PTest Result Summary
+{{ machine }} PTest Result Summary
 ==============================================================================================================
 --------------------------------------------------------------------------------------------------------------
 {{ 'Recipe'.ljust(maxlen['ptest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
 --------------------------------------------------------------------------------------------------------------
-{% for ptest in ptests |sort %}
-{{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[ptest]['duration']|string) }}
+{% for ptest in ptests[machine] |sort %}
+{{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[machine][ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[machine][ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[machine][ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[machine][ptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-
 {% else %}
-There was no ptest data
+There was no ptest data for {{ machine }}
 {% endif %}
 
-{% if haveltp %}
+{% endfor %}
+
+
+{% for machine in machines %}
+{% if ltptests[machine] %}
 ==============================================================================================================
-Ltp Test Result Summary
+{{ machine }} Ltp Test Result Summary
 ==============================================================================================================
 --------------------------------------------------------------------------------------------------------------
 {{ 'Recipe'.ljust(maxlen['ltptest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
 --------------------------------------------------------------------------------------------------------------
-{% for ltptest in ltptests |sort %}
-{{ ltptest.ljust(maxlen['ltptest']) }} | {{ (ltptests[ltptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltptests[ltptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltptests[ltptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltptests[ltptest]['duration']|string) }}
+{% for ltptest in ltptests[machine] |sort %}
+{{ ltptest.ljust(maxlen['ltptest']) }} | {{ (ltptests[machine][ltptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltptests[machine][ltptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltptests[machine][ltptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltptests[machine][ltptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-
 {% else %}
-There was no LTP Test data
+There was no LTP Test data for {{ machine }}
 {% endif %}
 
-{% if haveltpposix %}
+{% endfor %}
+
+
+{% for machine in machines %}
+{% if ltpposixtests[machine] %}
 ==============================================================================================================
-Ltp Posix Result Summary
+{{ machine }} Ltp Posix Result Summary
 ==============================================================================================================
 --------------------------------------------------------------------------------------------------------------
 {{ 'Recipe'.ljust(maxlen['ltpposixtest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
 --------------------------------------------------------------------------------------------------------------
-{% for ltpposixtest in ltpposixtests |sort %}
-{{ ltpposixtest.ljust(maxlen['ltpposixtest']) }} | {{ (ltpposixtests[ltpposixtest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltpposixtests[ltpposixtest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltpposixtests[ltpposixtest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltpposixtests[ltpposixtest]['duration']|string) }}
+{% for ltpposixtest in ltpposixtests[machine] |sort %}
+{{ ltpposixtest.ljust(maxlen['ltpposixtest']) }} | {{ (ltpposixtests[machine][ltpposixtest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltpposixtests[machine][ltpposixtest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltpposixtests[machine][ltpposixtest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltpposixtests[machine][ltpposixtest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-
 {% else %}
-There was no LTP Posix Test data
+There was no LTP Posix Test data for {{ machine }}
 {% endif %}
 
+{% endfor %}
 
 
 ==============================================================================================================
-- 
2.7.4


