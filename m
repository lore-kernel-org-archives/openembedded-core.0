Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29A0C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:54:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22789.1784811248723317078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ApFU/7jc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49571fea44eso3758055e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784811247; x=1785416047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDOdHJRVkdOfK+lfTIIHcT323WR0sXbMlZdWQegy0DI=;
        b=ApFU/7jcYIeYZnYf5KnmE+//WqQqvFbAEOYOqmtDWfJ670sNF5iV20H5wa8P7QkTXF
         HgJNjgfiU4I7KIJgtRYTsTpQ9xSn74oZG4WVx8sDUq7qeVOjwz+uEjwK5hPFgoHyzS2v
         iMYRk/HwxjQ/pjtD0+VJ+ErS7e6WA9EHfP/x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811247; x=1785416047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IDOdHJRVkdOfK+lfTIIHcT323WR0sXbMlZdWQegy0DI=;
        b=Y9r1O3pPm9Okrr5Dyou7doQOpB3cTOy9aBXgCoYpnPo38/ZQjL0IGuU6Pinl/z1Kgy
         hRkm/2UPUp8m6KePakua7/cVSZpL15I6PzgVCwhpMqtj5aw7kjbAhjfNqiTCLP29oJtL
         gb4YKBLCbosqOSK9+DIbOU1hA4Bk0HS0c5CIffPYecu3DuAYJLvSEx7BwdFTqq4Kms7x
         2xpZ6AHG5tHYu9QUn+rL9VHP0fvvZtMj+Y/OvHwfS0is8SHwTh7ui4HQnCXjhpOmenHm
         PVNmpHaIpMi5dtmd0U3JGPmCurKi0UNqKsiDiO/WbQvL4JGltsj0M0b6QfNJO/BYTEO9
         THEQ==
X-Gm-Message-State: AOJu0YwfB/vxKLSSg0/9yy5x8oPQxlzY+kOeFZb1lqbGZXLK0p3LyVB+
	ndenie2zPi9KV/4oXrh94u+SE0+JNwvFCZwVG9NLB3CO7dgwd42fhrC0uM/Loc1Pfw/CJegSqfd
	+235Zljw=
X-Gm-Gg: AR+sD11711HELDszy9qBo76vmE6amYYy0igDk/moUapvhHk76rDozQIUGa5TJxoSlnu
	K5OarlBklSjTW1e/UFXy64OJ9GaYMfR8Hpe1qc8ax7hi7ndAlqFwLJsFNnQ/X1jgDRx4HfG+foX
	ci2tHwRIwZihzFxp9cM1Vz4josm9TTBcA9KLeuIX7nSRILN+2NSKAEaEmUJcO5Cmyguzozg8kVq
	oC0+pOZZWNV02suQVuMVEQhryQK9FbAlyJb3icvffK0Noq8q8hKt8SOk6k3nttpFyaPbalni9qC
	vM9itkI+lGksDOmlyEY+Wimw681Ff0V3YdZV6ESit+rA30L9yIA1lYstaDeeNxctZVY2DcXI9AZ
	X/Mo5VMqyI803Q6kT1k9tQSjJs5xz4iEe2C3VEMsB6Rs/4kyvI/8IrZ8kxvvWNWpGw6TsQJ7wDw
	1NWI2lvr0q5nKgiizbASSeThkZZUb5efg=
X-Received: by 2002:a05:600c:4f12:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-49573ccd035mr39554365e9.9.1784811246410;
        Thu, 23 Jul 2026 05:54:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2205:d253:2df6:b9d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab41aa2sm124440655e9.1.2026.07.23.05.54.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:54:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] resulttool: Add support for ptests results for both musl and glibc
Date: Thu, 23 Jul 2026 13:54:04 +0100
Message-ID: <20260723125404.705795-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241834

The code currently assumed a DISTRO has one libc and can't handle the case
where there are ptest results for both. Add in TCLIBC to the result data
to allow them to be differentiated and add support in the reporting to
see the difference between them.

We need to carefully handle the case where there is no TCLIBC data in the
results as the code currently assumes all data is present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass         |  1 +
 scripts/lib/resulttool/report.py              | 50 ++++++++++++-------
 scripts/lib/resulttool/resultutils.py         | 11 +++-
 .../template/test_report_full_text.txt        | 10 ++--
 4 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index b89ac2862e3..5f0ec0b3a05 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -159,6 +159,7 @@ def get_testimage_configuration(d, test_type, machine):
                     'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
                     'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
                     'STARTTIME': d.getVar("DATETIME"),
+                    'TCLIBC': d.getVar("TCLIBC"),
                     'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
                     'LAYERS': get_layers(d.getVar("BBLAYERS"))}
     return configuration
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 1c100b00ab3..ba9965aa0a9 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -24,22 +24,24 @@ class ResultsTextReport(object):
                              'skipped': ['SKIPPED', 'skipped', 'UNSUPPORTED', 'UNTESTED', 'UNRESOLVED']}
 
 
-    def handle_ptest_result(self, k, status, result, machine):
-        if machine not in self.ptests:
-            self.ptests[machine] = {}
+    def handle_ptest_result(self, k, status, result, machine, libc):
+        if libc not in self.ptests:
+            self.ptests[libc] = {}
+        if machine not in self.ptests[libc]:
+            self.ptests[libc][machine] = {}
 
         if k == 'ptestresult.sections':
             # Ensure tests without any test results still show up on the report
             for suite in result['ptestresult.sections']:
-                if suite not in self.ptests[machine]:
-                    self.ptests[machine][suite] = {
+                if suite not in self.ptests[libc][machine]:
+                    self.ptests[libc][machine][suite] = {
                             'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-',
                             'failed_testcases': [], "testcases": set(),
                             }
                 if 'duration' in result['ptestresult.sections'][suite]:
-                    self.ptests[machine][suite]['duration'] = result['ptestresult.sections'][suite]['duration']
+                    self.ptests[libc][machine][suite]['duration'] = result['ptestresult.sections'][suite]['duration']
                 if 'timeout' in result['ptestresult.sections'][suite]:
-                    self.ptests[machine][suite]['duration'] += " T"
+                    self.ptests[libc][machine][suite]['duration'] += " T"
             return True
 
         # process test result
@@ -57,21 +59,21 @@ class ResultsTextReport(object):
             except ValueError:
                 pass
 
-        if suite not in self.ptests[machine]:
-            self.ptests[machine][suite] = {
+        if suite not in self.ptests[libc][machine]:
+            self.ptests[libc][machine][suite] = {
                     'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-',
                     'failed_testcases': [], "testcases": set(),
                     }
 
         # do not process duplicate results
-        if test in self.ptests[machine][suite]["testcases"]:
+        if test in self.ptests[libc][machine][suite]["testcases"]:
             print("Warning duplicate ptest result '{}.{}' for {}".format(suite, test, machine))
             return False
 
         for tk in self.result_types:
             if status in self.result_types[tk]:
-                self.ptests[machine][suite][tk] += 1
-        self.ptests[machine][suite]["testcases"].add(test)
+                self.ptests[libc][machine][suite][tk] += 1
+        self.ptests[libc][machine][suite]["testcases"].add(test)
         return True
 
     def handle_ltptest_result(self, k, status, result, machine):
@@ -136,13 +138,13 @@ class ResultsTextReport(object):
             if status in self.result_types[tk]:
                 self.ltpposixtests[machine][suite][tk] += 1
 
-    def get_aggregated_test_result(self, logger, testresult, machine):
+    def get_aggregated_test_result(self, logger, testresult, machine, libc):
         test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
         result = testresult.get('result', [])
         for k in result:
             test_status = result[k].get('status', [])
             if k.startswith("ptestresult."):
-                if not self.handle_ptest_result(k, test_status, result, machine):
+                if not self.handle_ptest_result(k, test_status, result, machine, libc):
                     continue
             elif k.startswith("ltpresult."):
                 self.handle_ltptest_result(k, test_status, result, machine)
@@ -166,6 +168,7 @@ class ResultsTextReport(object):
         havefailed = False
         reportvalues = []
         machines = []
+        libcs = set()
         cols = ['passed', 'failed', 'skipped']
         maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 ,'ltptest': 0, 'ltpposixtest': 0}
         for line in test_count_reports:
@@ -192,10 +195,13 @@ class ResultsTextReport(object):
         for k in cols:
             reporttotalvalues[k] = '%s' % sum([line[k] for line in test_count_reports])
         reporttotalvalues['count'] = '%s' % len(test_count_reports)
-        for (machine, report) in self.ptests.items():
-            for ptest in self.ptests[machine]:
-                if len(ptest) > maxlen['ptest']:
-                    maxlen['ptest'] = len(ptest)
+        for libc in self.ptests:
+            libcs.add(libc)
+            print(str(libc))
+            for machine in self.ptests[libc]:
+                for ptest in self.ptests[libc][machine]:
+                    if len(ptest) > maxlen['ptest']:
+                        maxlen['ptest'] = len(ptest)
         for (machine, report) in self.ltptests.items():
             for ltptest in self.ltptests[machine]:
                 if len(ltptest) > maxlen['ltptest']:
@@ -208,6 +214,7 @@ class ResultsTextReport(object):
                                  reporttotalvalues=reporttotalvalues,
                                  havefailed=havefailed,
                                  machines=machines,
+                                 libcs=list(libcs),
                                  ptests=self.ptests,
                                  ltptests=self.ltptests,
                                  ltpposixtests=self.ltpposixtests,
@@ -268,6 +275,11 @@ class ResultsTextReport(object):
                 skip = False
                 result = testresults[testsuite][resultid]
                 machine = result['configuration']['MACHINE']
+                try:
+                    libc = result['configuration']['TCLIBC']
+                except KeyError:
+                    # We don't have libc in old test results, not much we can do
+                    libc = 'unknown'
 
                 # Check to see if there is already results for these kinds of tests for the machine
                 for key in result['result'].keys():
@@ -280,7 +292,7 @@ class ResultsTextReport(object):
                 if skip:
                     break
 
-                test_count_report = self.get_aggregated_test_result(logger, result, machine)
+                test_count_report = self.get_aggregated_test_result(logger, result, machine, libc)
                 test_count_report['machine'] = machine
                 test_count_report['testseries'] = result['configuration']['TESTSERIES']
                 test_count_report['result_id'] = resultid
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index b8fc79a6acd..53980f8007a 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -28,7 +28,7 @@ flatten_map = {
 }
 regression_map = {
     "oeselftest": ['TEST_TYPE', 'MACHINE'],
-    "runtime": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'IMAGE_PKGTYPE', 'DISTRO'],
+    "runtime": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'IMAGE_PKGTYPE', 'DISTRO', 'TCLIBC'],
     "sdk": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE'],
     "sdkext": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE'],
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'IMAGE_BASENAME', 'MACHINE']
@@ -87,7 +87,14 @@ def append_resultsdata(results, f, configmap=store_map, configvars=extra_configv
         testtype = data[res]["configuration"].get("TEST_TYPE")
         if testtype not in configmap:
             raise ValueError("Unknown test type %s" % testtype)
-        testpath = "/".join(data[res]["configuration"].get(i) for i in configmap[testtype])
+        paths = []
+        for i in configmap[testtype]:
+            try:
+                paths.append(data[res]["configuration"].get(i))
+            # Some variables may not exist in older data
+            except KeyError:
+                continue
+        testpath = "/".join(paths)
         if testpath not in results:
             results[testpath] = {}
         results[testpath][res] = data[res]
diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index 2efba2ef6f2..a39878a3e11 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -11,21 +11,23 @@ Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
 {{ 'Total'.ljust(maxlen['testseries']) }} | {{ reporttotalvalues['count'].ljust(maxlen['result_id']) }} | {{ reporttotalvalues['passed'].ljust(maxlen['passed']) }} | {{ reporttotalvalues['failed'].ljust(maxlen['failed']) }} | {{ reporttotalvalues['skipped'].ljust(maxlen['skipped']) }}
 --------------------------------------------------------------------------------------------------------------
 
+{% for libc in libcs %}
 {% for machine in machines %}
-{% if ptests[machine] %}
+{% if ptests[libc][machine] %}
 ==============================================================================================================
-{{ machine }} PTest Result Summary
+{{ machine }} PTest Result Summary (Libc: {{ libc }})
 ==============================================================================================================
 --------------------------------------------------------------------------------------------------------------
 {{ 'Recipe'.ljust(maxlen['ptest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
 --------------------------------------------------------------------------------------------------------------
-{% for ptest in ptests[machine] |sort %}
-{{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[machine][ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[machine][ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[machine][ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[machine][ptest]['duration']|string) }}
+{% for ptest in ptests[libc][machine] |sort %}
+{{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[libc][machine][ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[libc][machine][ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[libc][machine][ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[libc][machine][ptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
 
 {% endif %}
 {% endfor %}
+{% endfor %}
 
 {% for machine in machines %}
 {% if ltptests[machine] %}

