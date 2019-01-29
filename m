Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id E0FCA7C2AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:43:17 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v13so23030330wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fUTWb11wLReOoDdV9WFhHwzQPKiWZ2tT7DxRxPdOtGY=;
	b=Lu4+MEkuFkk43WyuQR1Rrq+n1ugKWz6UbNJDnAo57qCLRLRNv46kxMjsSWxJ27lu7c
	YlozdZ3zL4Lyuol4SjjuRhtrgN0BnYI/3nzpVQ8+0BStlwzGDkczVyKtpM5YltT84tEG
	kn7HXTkeLq4e1AQrbKvxwJsvyK2bUUHNfYwIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fUTWb11wLReOoDdV9WFhHwzQPKiWZ2tT7DxRxPdOtGY=;
	b=mDiV2q5ICPwT+ZK4wzQXVGqgltaZtpgRoxyYYYcZ/TqXVZ+MOxNkDojiuKDLf0xvik
	M0cl1dlXGFYk47lQ9bcRuyD8XEjrkxlWIrjDCy1bhlvZtHoXfIEBRBInqVugYUi9OFzS
	FhMHI9ZMt1dGUOKvillJ+5ZICs7XyfeSghq/ynsCjc3FqKfuziy8FwmV966ZqLuLhXMe
	6sDVEvmw9FJOLJRBRFJ8hP2A54u3erUGvOGYCZuqlg4SkgGYCywa91eYfd/O+T06AGIw
	98MCOQtPJkrErc/4v/iVUFgGMsqUkYWEoXOi5LA7y+HFOxjlg7nHpnuHNeY6QIClCnwp
	Qciw==
X-Gm-Message-State: AJcUukcnsBdeP9gTpHq4iPG28GZXHQmJV52MFctcoj6PKZUsEN5MeNnr
	k+69gtVy2X8lFv7Cxrvv732+e+2GheA=
X-Google-Smtp-Source: ALg8bN6BclE6z/M0OExZcPQFuVliC26Jbh5qgrdUsUpWJ6pGCSl6ppX6d4uIJOZbxoOG1wb3BMfSzw==
X-Received: by 2002:adf:ee89:: with SMTP id b9mr27817020wro.246.1548783798192; 
	Tue, 29 Jan 2019 09:43:18 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n9sm94381894wrx.80.2019.01.29.09.43.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:43:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 17:43:09 +0000
Message-Id: <20190129174312.29224-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
References: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/7] oeqa/logparser: Reform the ptest results parser
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
X-List-Received-Date: Tue, 29 Jan 2019 17:43:18 -0000
Content-Transfer-Encoding: 8bit

Now we have a dedicated ptest parser, merge in the remaining ptest
specific pieces to further clarify and simplify the code, moving to
a point where we can consider extending/enhancing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 40 ++-----------------
 meta/lib/oeqa/utils/logparser.py     | 58 ++++++++++++++++------------
 2 files changed, 36 insertions(+), 62 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 1ce22a09e7d..ae54a01669a 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -1,50 +1,16 @@
 import unittest
 import pprint
+import re
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
-from oeqa.utils.logparser import PtestParser, Result
+from oeqa.utils.logparser import PtestParser
 
 class PtestRunnerTest(OERuntimeTestCase):
 
-    # a ptest log parser
-    def parse_ptest(self, logfile):
-        parser = PtestParser()
-        result = Result()
-
-        with open(logfile, errors='replace') as f:
-            for line in f:
-                result_tuple = parser.parse_line(line)
-                if not result_tuple:
-                    continue
-                line_type, category, status, name = result_tuple
-
-                if line_type == 'section' and status == 'begin':
-                    current_section = name
-                    continue
-
-                if line_type == 'section' and status == 'end':
-                    current_section = None
-                    continue
-
-                if line_type == 'test' and status == 'pass':
-                    result.store(current_section, name, status)
-                    continue
-
-                if line_type == 'test' and status == 'fail':
-                    result.store(current_section, name, status)
-                    continue
-
-                if line_type == 'test' and status == 'skip':
-                    result.store(current_section, name, status)
-                    continue
-
-        result.sort_tests()
-        return result
-
     @OETestID(1600)
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
@@ -83,7 +49,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         extras['ptestresult.rawlogs'] = {'log': output}
 
         # Parse and save results
-        parse_result = self.parse_ptest(ptest_runner_log)
+        parse_result = PtestParser().parse(ptest_runner_log)
         parse_result.log_as_files(ptest_log_dir, test_status = ['pass','fail', 'skip'])
         if os.path.exists(ptest_log_dir_link):
             # Remove the old link to create a new one
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 0807093fda6..f8d1c036306 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -7,32 +7,40 @@ from . import ftools
 
 # A parser that can be used to identify weather a line is a test result or a section statement.
 class PtestParser(object):
-
     def __init__(self):
-
-        self.test_regex = {}
-        self.test_regex['pass'] = re.compile(r"^PASS:(.+)")
-        self.test_regex['fail'] = re.compile(r"^FAIL:(.+)")
-        self.test_regex['skip'] = re.compile(r"^SKIP:(.+)")
-
-        self.section_regex = {}
-        self.section_regex['begin'] = re.compile(r"^BEGIN: .*/(.+)/ptest")
-        self.section_regex['end'] = re.compile(r"^END: .*/(.+)/ptest")
-
-    # Parse a line and return a tuple containing the type of result (test/section) and its category, status and name
-    def parse_line(self, line):
-
-        for test_status, status_regex in test_status_list.items():
-            test_name = status_regex.search(line)
-            if test_name:
-                return ['test', test_category, test_status, test_name.group(1)]
-
-        for section_status, status_regex in section_status_list.items():
-            section_name = status_regex.search(line)
-            if section_name:
-                return ['section', section_category, section_status, section_name.group(1)]
-        return None
-
+        self.results = Result()
+
+    def parse(self, logfile):
+        test_regex = {}
+        test_regex['pass'] = re.compile(r"^PASS:(.+)")
+        test_regex['fail'] = re.compile(r"^FAIL:(.+)")
+        test_regex['skip'] = re.compile(r"^SKIP:(.+)")
+
+        section_regex = {}
+        section_regex['begin'] = re.compile(r"^BEGIN: .*/(.+)/ptest")
+        section_regex['end'] = re.compile(r"^END: .*/(.+)/ptest")
+
+        with open(logfile, errors='replace') as f:
+            for line in f:
+                result = section_regex['begin'].search(line)
+                if result:
+                    current_section = result.group(1)
+                    continue
+
+                result = section_regex['end'].search(line)
+                if result:
+                    if current_section != result.group(1):
+                        bb.warn("Ptest log section mismatch %s vs. %s" % (current_section, result.group(1)))
+                    current_section = None
+                    continue
+
+                for t in test_regex:
+                    result = test_regex[t].search(line)
+                    if result:
+                        self.results.store(current_section, result.group(1), t)
+
+        self.results.sort_tests()
+        return self.results
 
 class Result(object):
 
-- 
2.19.1


