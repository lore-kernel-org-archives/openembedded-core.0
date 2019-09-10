Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id BF6FC7F2A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:41:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r12so11493225pfh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=Khff3Sds8glK5cF6FrbfCd5MOXHrT78zjaIJsCRGxcU=;
	b=NgrcWN3OhO41uqNS2KwepSi5JsqX6359lFebjORWMdo4orVWsOlOUwPw/zUamdLkYJ
	SUv0g7ltFrUuA07g/dtxiwaBaz7Bv4FIkzcB/3RI0iqGDSZ6QKjYMtL3O4yKS+fPh9vu
	BoNqvH/cF0aOww/rj2mH79Vc34Yq6mmhsrzEM9PP59kSp0y2hSOLnz1BtVeqFeL09Fb2
	gKXDcXNj2ZoFMIz8bvbflmZ2rY0pBDiIMz2kqd+yOW5EeFvAAmKSxs+g8wp9hoMqC907
	ZgmdS265lnWhYbOoP6fWLdY8Uq2fFLMrZVfFnRu/aJhSsSdwyIxyO5lhaoB4Nrg0IuuF
	qDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=Khff3Sds8glK5cF6FrbfCd5MOXHrT78zjaIJsCRGxcU=;
	b=bdxAd1OG1U0FwlOG0rs4S7AAUxIOB9QlqbMhH1Ja82rCLi+sYaSUjwI711gXUW5TDl
	99aSr0W0sNKIiTJD3w5arIl9gbG/uWcHoZQ/kPMWMyz2Q+NQhcceJfZ6QU8VcPvNBxyD
	+qxcQ7iU+jfsRYzFejEh44RGObFv6MYCOdps6YV4wzuBpgSU+fFTW0qIkV5t3Dd11qQX
	GQiYPcvLJKWfqWxrIIJSHwXzOkKbg2BnPW8ADTPfION0r3mW5Pz1sB0MkW8Zp6OfXu0t
	OfaOomcMeYmXnUzuLFYFpMdRsdT6H7mTvX/i7c/R95SWab21GuDWyyGCHn70MD4EApP+
	+Bsw==
X-Gm-Message-State: APjAAAXLNUnn6NQf0z8Ztq/gy5BR5vHVT9M4DRVBF3uUtBn4lhJmOIhO
	h7bjtM+pnYDqbpK212VOmlwrAg==
X-Google-Smtp-Source: APXvYqy9aNDtjpNqZw4RWfmjKMHlg6rY6VG+H+4ooWKJNQ/mGTT21chve9M8CFKyWB3rKtKOdK06XA==
X-Received: by 2002:a63:1c22:: with SMTP id c34mr27567066pgc.56.1568119270585; 
	Tue, 10 Sep 2019 05:41:10 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	n128sm19289532pfn.46.2019.09.10.05.41.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 05:41:09 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:40:59 +0000
Message-Id: <20190910124059.3908-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/6] resulttool: Handle multiple series containing ptestresults
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
X-List-Received-Date: Tue, 10 Sep 2019 12:41:09 -0000
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

