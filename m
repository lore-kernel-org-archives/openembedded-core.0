Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABF177C2A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:43:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v13so23030550wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zLHWoW5+t6/grlrXNZEGcAvi5H5f0B4ltkh9Ny5Cw9k=;
	b=UsgB940eiPMg8gxheLCKtv3ygC+KXIOr8Qh+55Wgqm2HKiXhNWOwjHuifFby5HD3T+
	3b/Oul0133FagTFNb85gyGH+qNu0HoYsD2zaxgtCuENCK1Ogf3+pVv5X1zhP2ZqhMXV0
	M1vEyOVcVYyLQ8FWXBshL18nziouZe+IJZvGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zLHWoW5+t6/grlrXNZEGcAvi5H5f0B4ltkh9Ny5Cw9k=;
	b=NxqOnEY7MsAEShj2LWR4zT2r+Wlas/MiJTHqGGVsXWr52iX9FOWqvNyLaTo/PJJeRP
	mqLztfR61WcSl7kWyPy3DIA/fAQUfmFbSkSsRYo0EU4OMJkK0sWJbGUwll19nroesChU
	esMFN4k2gcRls9i3HTwvbkUmPCbLqOXyD2jU1GGUqUJnfeI/55FXFfvqcjWfWLDLlF5y
	tKqpYLLEmJ4ztb3lhwTJmFwrnXFSUozUEJpIe2D1G3hZtDOPFNbD1Z71TQNF1qablC+r
	l6SOoRD64tG1N6lEm4eB4rGy1cuynWGuQFG5nbTXHvsdqHydRxms3N4aR92Z4jQqVjPy
	APJA==
X-Gm-Message-State: AJcUukdqb269t/xsPEfHlX+clGSKMccvQ55jh79Gp0+aiXSs3HPa+GCq
	Cle/qaxJ6Ps/ZQFLTgp3RYhLpSRsSIo=
X-Google-Smtp-Source: ALg8bN7bAWq2k+jjc0iT/kBTgXCXRjv5M9h9FUY9jUn49UWD59qx44tlOaJ16Cmx8hd0MUK5jMEseg==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr26833641wrq.16.1548783801969; 
	Tue, 29 Jan 2019 09:43:21 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n9sm94381894wrx.80.2019.01.29.09.43.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:43:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 17:43:12 +0000
Message-Id: <20190129174312.29224-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
References: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 7/7] oeqa/logparser: Various misc cleanups
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
X-List-Received-Date: Tue, 29 Jan 2019 17:43:22 -0000
Content-Transfer-Encoding: 8bit

Get rid of further unneeded code complications:

* value mappings we could just direct use
* ftools when we can write files easily ourself
* test result status filtering we don't use
* variable overwriting module imports

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 13 +++++--------
 meta/lib/oeqa/utils/logparser.py     | 21 ++++++++-------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 2843953b38c..6ae951356d8 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -1,6 +1,6 @@
 import unittest
 import pprint
-import re
+import datetime
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
@@ -21,8 +21,6 @@ class PtestRunnerTest(OERuntimeTestCase):
         if status != 0:
             self.skipTest("No -ptest packages are installed in the image")
 
-        import datetime
-
         test_log_dir = self.td.get('TEST_LOG_DIR', '')
         # The TEST_LOG_DIR maybe NULL when testimage is added after
         # testdata.json is generated.
@@ -30,9 +28,9 @@ class PtestRunnerTest(OERuntimeTestCase):
             test_log_dir = os.path.join(self.td.get('WORKDIR', ''), 'testimage')
         # Don't use self.td.get('DATETIME'), it's from testdata.json, not
         # up-to-date, and may cause "File exists" when re-reun.
-        datetime = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+        timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
         ptest_log_dir_link = os.path.join(test_log_dir, 'ptest_log')
-        ptest_log_dir = '%s.%s' % (ptest_log_dir_link, datetime)
+        ptest_log_dir = '%s.%s' % (ptest_log_dir_link, timestamp)
         ptest_runner_log = os.path.join(ptest_log_dir, 'ptest-runner.log')
 
         status, output = self.target.run('ptest-runner', 0)
@@ -51,7 +49,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         # Parse and save results
         parser = PtestParser()
         results, sections = parser.parse(ptest_runner_log)
-        parser.results_as_files(ptest_log_dir, test_status = ['pass','fail', 'skip'])
+        parser.results_as_files(ptest_log_dir)
         if os.path.exists(ptest_log_dir_link):
             # Remove the old link to create a new one
             os.remove(ptest_log_dir_link)
@@ -60,12 +58,11 @@ class PtestRunnerTest(OERuntimeTestCase):
         extras['ptestresult.sections'] = sections
 
         trans = str.maketrans("()", "__")
-        resmap = {'pass': 'PASSED', 'skip': 'SKIPPED', 'fail': 'FAILED'}
         for section in results:
             for test in results[section]:
                 result = results[section][test]
                 testname = "ptestresult." + (section or "No-section") + "." + "_".join(test.translate(trans).split())
-                extras[testname] = {'status': resmap[result]}
+                extras[testname] = {'status': result}
 
         failed_tests = {}
         for section in results:
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 8585c195c44..32fde14a7de 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -3,7 +3,6 @@
 import sys
 import os
 import re
-from . import ftools
 
 # A parser that can be used to identify weather a line is a test result or a section statement.
 class PtestParser(object):
@@ -13,9 +12,9 @@ class PtestParser(object):
 
     def parse(self, logfile):
         test_regex = {}
-        test_regex['pass'] = re.compile(r"^PASS:(.+)")
-        test_regex['fail'] = re.compile(r"^FAIL:(.+)")
-        test_regex['skip'] = re.compile(r"^SKIP:(.+)")
+        test_regex['PASSED'] = re.compile(r"^PASS:(.+)")
+        test_regex['FAILED'] = re.compile(r"^FAIL:(.+)")
+        test_regex['SKIPPED'] = re.compile(r"^SKIP:(.+)")
 
         section_regex = {}
         section_regex['begin'] = re.compile(r"^BEGIN: .*/(.+)/ptest")
@@ -72,9 +71,7 @@ class PtestParser(object):
         return self.results, self.sections
 
     # Log the results as files. The file name is the section name and the contents are the tests in that section.
-    def results_as_files(self, target_dir, test_status):
-        if not type(test_status) == type([]):
-            raise Exception("test_status should be a list. Got " + str(test_status) + " instead.")
+    def results_as_files(self, target_dir):
         if not os.path.exists(target_dir):
             raise Exception("Target directory does not exist: %s" % target_dir)
 
@@ -84,10 +81,8 @@ class PtestParser(object):
                 prefix = section
             section_file = os.path.join(target_dir, prefix)
             # purge the file contents if it exists
-            open(section_file, 'w').close()
-            for test_name in sorted(self.results[section]):
-                status = self.results[section][test_name]
-                # we log only the tests with status in the test_status list
-                if status in test_status:
-                    ftools.append_file(section_file, status + ": " + test_name)
+            with open(section_file, 'w') as f:
+                for test_name in sorted(self.results[section]):
+                    status = self.results[section][test_name]
+                    f.write(status + ": " + test_name + "\n")
 
-- 
2.19.1


