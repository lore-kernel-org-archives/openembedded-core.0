Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC0A7C2AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:43:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x10so23030400wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2T+qgvj1GWylwSoSJqhDiy2hLx818uYQ+4qFVE17g3Y=;
	b=KAkeOImmxGj4fhtq0vGjAw0RrU/qw1eSRqk4d7aFJd7JcDdVGhZ5So0QQxUY3hU0Lb
	9Q+sEzLHjZNdOSDiSg5094prB9PkOXAZfzXz/3ymZny1hb0zChLpmr/iUwp3HfVBq8yA
	TCK//PjD5fp5Uy+MBj7Uj/SXJoP4vLMjcD+XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2T+qgvj1GWylwSoSJqhDiy2hLx818uYQ+4qFVE17g3Y=;
	b=WTtQEtLnAF0zS13vHRjtegIWbyFHkn2m+BGP3S3TMp9ZeRPcLsuLXeypvKM1TzocUx
	tEd0qC/NG0Nl1HgUTzOuSEWn2p3SK3PBAUq2C/oKQrOuDt5mmmURvHrg7z3x8jjSYY1A
	3S+Z6BIvejt7nmrbcqm/dsoJkXvNok8GC89wYkuCJ1HTQXhkkG7vmGquIZdolt2elnGN
	Fgs0vk5wovnRNrB+8n7PUyy2+PfnIrNOo3SK8AR0XcdpmuxB7xhqtsBkd5RDP5QFZRjx
	NqP9+eIm8fI1cb6i131wo2WsXOS0g8CySJYDEg/8CwD7nbIAeH8Yt2T4NtqnWkUAz8jh
	jtRg==
X-Gm-Message-State: AHQUAubNVr1ZhS/IIYf7ncvhG33q3XoQvvqiFKysvGDeXLTurFpd7uox
	/odAq9UL5X2ozf4N4xXqD2wIuYp9FUg=
X-Google-Smtp-Source: AHgI3IZIcDo1/fUt/aEo5Ce68sJ8MUKZqJFPb73i2cOUD/pD2hXTdgDLs/Lz6SGgUFpB+onWWOL2FQ==
X-Received: by 2002:adf:a58a:: with SMTP id g10mr1086132wrc.3.1548783800731;
	Tue, 29 Jan 2019 09:43:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n9sm94381894wrx.80.2019.01.29.09.43.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:43:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 17:43:11 +0000
Message-Id: <20190129174312.29224-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
References: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/7] oeqa/logparser: Improve results handling
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
X-List-Received-Date: Tue, 29 Jan 2019 17:43:20 -0000
Content-Transfer-Encoding: 8bit

Merge the results handling into the ptest log parser as a seperate
method.

Drop the weird "pass.skip.fail." prefix to the results filename, its
just bizarre.

Drop the code turning a list into a regex then searching the regex for
an item, "x in y" is perfectly capable.

Use a dict, sort the keys as needed and drop the list sorting code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 14 +++++----
 meta/lib/oeqa/utils/logparser.py     | 45 +++++++---------------------
 2 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 3cfd7af7e2e..2843953b38c 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -49,8 +49,9 @@ class PtestRunnerTest(OERuntimeTestCase):
         extras['ptestresult.rawlogs'] = {'log': output}
 
         # Parse and save results
-        parse_result, sections = PtestParser().parse(ptest_runner_log)
-        parse_result.log_as_files(ptest_log_dir, test_status = ['pass','fail', 'skip'])
+        parser = PtestParser()
+        results, sections = parser.parse(ptest_runner_log)
+        parser.results_as_files(ptest_log_dir, test_status = ['pass','fail', 'skip'])
         if os.path.exists(ptest_log_dir_link):
             # Remove the old link to create a new one
             os.remove(ptest_log_dir_link)
@@ -60,14 +61,15 @@ class PtestRunnerTest(OERuntimeTestCase):
 
         trans = str.maketrans("()", "__")
         resmap = {'pass': 'PASSED', 'skip': 'SKIPPED', 'fail': 'FAILED'}
-        for section in parse_result.result_dict:
-            for test, result in parse_result.result_dict[section]:
+        for section in results:
+            for test in results[section]:
+                result = results[section][test]
                 testname = "ptestresult." + (section or "No-section") + "." + "_".join(test.translate(trans).split())
                 extras[testname] = {'status': resmap[result]}
 
         failed_tests = {}
-        for section in parse_result.result_dict:
-            failed_testcases = [ "_".join(test.translate(trans).split()) for test, result in parse_result.result_dict[section] if result == 'fail' ]
+        for section in results:
+            failed_testcases = [ "_".join(test.translate(trans).split()) for test in results[section] if results[section][test] == 'fail' ]
             if failed_testcases:
                 failed_tests[section] = failed_testcases
 
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index dddea14fc98..8585c195c44 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -8,7 +8,7 @@ from . import ftools
 # A parser that can be used to identify weather a line is a test result or a section statement.
 class PtestParser(object):
     def __init__(self):
-        self.results = Result()
+        self.results = {}
         self.sections = {}
 
     def parse(self, logfile):
@@ -65,52 +65,29 @@ class PtestParser(object):
                 for t in test_regex:
                     result = test_regex[t].search(line)
                     if result:
-                        self.results.store(current_section['name'], result.group(1), t)
+                        if current_section['name'] not in self.results:
+                            self.results[current_section['name']] = {}
+                        self.results[current_section['name']][result.group(1)] = t
 
-        self.results.sort_tests()
         return self.results, self.sections
 
-class Result(object):
-
-    def __init__(self):
-        self.result_dict = {}
-
-    def store(self, section, test, status):
-        if not section in self.result_dict:
-            self.result_dict[section] = []
-
-        self.result_dict[section].append((test, status))
-
-    # sort tests by the test name(the first element of the tuple), for each section. This can be helpful when using git to diff for changes by making sure they are always in the same order.
-    def sort_tests(self):
-        for package in self.result_dict:
-            sorted_results = sorted(self.result_dict[package], key=lambda tup: tup[0])
-            self.result_dict[package] = sorted_results
-
     # Log the results as files. The file name is the section name and the contents are the tests in that section.
-    def log_as_files(self, target_dir, test_status):
-        status_regex = re.compile('|'.join(map(str, test_status)))
+    def results_as_files(self, target_dir, test_status):
         if not type(test_status) == type([]):
             raise Exception("test_status should be a list. Got " + str(test_status) + " instead.")
         if not os.path.exists(target_dir):
             raise Exception("Target directory does not exist: %s" % target_dir)
 
-        for section, test_results in self.result_dict.items():
-            prefix = ''
-            for x in test_status:
-                prefix +=x+'.'
+        for section in self.results:
+            prefix = 'No-section'
             if section:
-                prefix += section
+                prefix = section
             section_file = os.path.join(target_dir, prefix)
             # purge the file contents if it exists
             open(section_file, 'w').close()
-            for test_result in test_results:
-                (test_name, status) = test_result
+            for test_name in sorted(self.results[section]):
+                status = self.results[section][test_name]
                 # we log only the tests with status in the test_status list
-                match_status = status_regex.search(status)
-                if match_status:
+                if status in test_status:
                     ftools.append_file(section_file, status + ": " + test_name)
 
-    # Not yet implemented!
-    def log_to_lava(self):
-        pass
-- 
2.19.1


