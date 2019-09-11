Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id E64C87D1E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 14:13:23 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i1so4901425pfa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=Khff3Sds8glK5cF6FrbfCd5MOXHrT78zjaIJsCRGxcU=;
	b=iykPZJsRNQLGJOlo/Q9fkQXmOHD9wqujtRXrh91flLCG2DAQE+hU+Qy8FL7efEeMvC
	TnbIjEvzQrR3NKUJ6S4GRWkGUtu1FLtWvjIhScKQkairtPPyuLquZxZmAq235Oi8wgta
	3WXALWa1uv1Sdp38IIXT4UA4gh60WVniePP1Y1lOFJsO+alrnwhmvoia4hGainrmnj5Z
	1RQkImFfIMdf/xYnmLkT/yfT3I6qsaBbCsLTLxyqgE45H808HGlwPg8IRmCzFNvBt51w
	padUYUK9m6DASHrKrXs4CTiShvmJB5Y1VT6B/b9l30MdtKZNLyonRSvrkbqV3Z9bawW1
	xgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=Khff3Sds8glK5cF6FrbfCd5MOXHrT78zjaIJsCRGxcU=;
	b=S6b9yIl9py29I5v9jsp9iDW5oovyNa6PugXp1J+3E1cqm7BFDDzLfXnUDGt8lBvGEn
	sxXym+Y5W4r2Phg8E16xV4W6NKDfk3cz2GkuPDp5EJ2dMsBEu+hysNIrFqxbf1kzsJMH
	oyUqpndkQcot5KMlnuVxR4gh9/er+hXKd7sJ9ErvLxPLGy4yxO4Ukd7YPIN929vTAVeF
	4MZxxtKhD9IWmyByr330aUk/mB4duh9ut/XubTe7zgXDHbdvcys3eKWylEQ9h8jznzWq
	5dZ7QNOSchkQfJWjvy0sxCh1YUKJx3eY44K45sTdygQ0AB0JzocMaEZO6b1WDzH6adt/
	UWwQ==
X-Gm-Message-State: APjAAAW6tQwCppjuvkTAESlDdftU8dMt0iNOj9jmeZ+DG3R3FFezlJOU
	8UI3my8lOyuvWbDovRqobovs1Lgn6LyhNA==
X-Google-Smtp-Source: APXvYqxkrcqErd+WdyyMG5EqhLw+EV3lagkCAWVz9+/ebX2mHDi7W2gcuuGU879ynm8vd0RCeekTbQ==
X-Received: by 2002:a17:90b:f02:: with SMTP id
	br2mr5737729pjb.67.1568211204311; 
	Wed, 11 Sep 2019 07:13:24 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	v66sm26372916pfv.79.2019.09.11.07.13.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 07:13:23 -0700 (PDT)
Date: Wed, 11 Sep 2019 14:13:07 +0000
Message-Id: <20190911141307.28014-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 1/4] resulttool: Handle multiple series containing ptestresults
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
X-List-Received-Date: Wed, 11 Sep 2019 14:13:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Handle multiple results series having ptestresults content. The contents
are merged on a per-result basis where duplicates are ignored (with a
warning message printed). The 'ptestresults.sections' collection is also
merged on a per-suite basis.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 scripts/lib/resulttool/report.py | 44 +++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 8b03717d29..883b52517b 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -32,16 +32,22 @@ class ResultsTextReport(object):
             # Ensure tests without any test results still show up on the report
             for suite in result['ptestresult.sections']:
                 if suite not in self.ptests[machine]:
-                    self.ptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+                    self.ptests[machine][suite] = {
+                            'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-',
+                            'failed_testcases': [], "testcases": set(),
+                            }
                 if 'duration' in result['ptestresult.sections'][suite]:
                     self.ptests[machine][suite]['duration'] = result['ptestresult.sections'][suite]['duration']
                 if 'timeout' in result['ptestresult.sections'][suite]:
                     self.ptests[machine][suite]['duration'] += " T"
-            return
+            return True
+
+        # process test result
         try:
             _, suite, test = k.split(".", 2)
         except ValueError:
-            return
+            return True
+
         # Handle 'glib-2.0'
         if 'ptestresult.sections' in result and suite not in result['ptestresult.sections']:
             try:
@@ -50,11 +56,23 @@ class ResultsTextReport(object):
                     suite = suite + "." + suite1
             except ValueError:
                 pass
+
         if suite not in self.ptests[machine]:
-            self.ptests[machine][suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+            self.ptests[machine][suite] = {
+                    'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-',
+                    'failed_testcases': [], "testcases": set(),
+                    }
+
+        # do not process duplicate results
+        if test in self.ptests[machine][suite]["testcases"]:
+            print("Warning duplicate ptest result '{}.{}' for {}".format(suite, test, machine))
+            return False
+
         for tk in self.result_types:
             if status in self.result_types[tk]:
                 self.ptests[machine][suite][tk] += 1
+        self.ptests[machine][suite]["testcases"].add(test)
+        return True
 
     def handle_ltptest_result(self, k, status, result, machine):
         if machine not in self.ltptests:
@@ -124,17 +142,20 @@ class ResultsTextReport(object):
         result = testresult.get('result', [])
         for k in result:
             test_status = result[k].get('status', [])
+            if k.startswith("ptestresult."):
+                if not self.handle_ptest_result(k, test_status, result, machine):
+                    continue
+            elif k.startswith("ltpresult."):
+                self.handle_ltptest_result(k, test_status, result, machine)
+            elif k.startswith("ltpposixresult."):
+                self.handle_ltpposixtest_result(k, test_status, result, machine)
+
+            # process result if it was not skipped by a handler
             for tk in self.result_types:
                 if test_status in self.result_types[tk]:
                     test_count_report[tk] += 1
             if test_status in self.result_types['failed']:
                 test_count_report['failed_testcases'].append(k)
-            if k.startswith("ptestresult."):
-                self.handle_ptest_result(k, test_status, result, machine)
-            if k.startswith("ltpresult."):
-                self.handle_ltptest_result(k, test_status, result, machine)
-            if k.startswith("ltpposixresult."):
-                self.handle_ltpposixtest_result(k, test_status, result, machine)
         return test_count_report
 
     def print_test_report(self, template_file_name, test_count_reports):
@@ -210,8 +231,7 @@ class ResultsTextReport(object):
                 # Check to see if there is already results for these kinds of tests for the machine
                 for key in result['result'].keys():
                     testtype = str(key).split('.')[0]
-                    if ((machine in self.ptests and testtype == "ptestresult" and self.ptests[machine]) or
-                        (machine in self.ltptests and testtype == "ltpiresult" and self.ltptests[machine]) or
+                    if ((machine in self.ltptests and testtype == "ltpiresult" and self.ltptests[machine]) or
                         (machine in self.ltpposixtests and testtype == "ltpposixresult" and self.ltpposixtests[machine])):
                         print("Already have test results for %s on %s, skipping %s" %(str(key).split('.')[0], machine, resultid))
                         skip = True
---
2.23.0.rc1

