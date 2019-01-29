Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2E17C2A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:43:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z5so23023575wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=n0KjOqiZ3eMFADjKXFsOvLLv3hJsGzlMHzFMe6PjTgc=;
	b=XpI4IfyxGqPdE4Alee3UKTAtklAkABMUueg0OqM0E+iwTFKpc5i1UQiuShuH8kdqI4
	M8hjQSZLxeeEteh3neI/tYu/Y6VXRcaisaC/S+Jqb59Cwo4UlfcvTIpdKOuEHSt/t49q
	F+dyBp1ZkUeIneBKgSotqbJ3zBWz1S75e9HRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n0KjOqiZ3eMFADjKXFsOvLLv3hJsGzlMHzFMe6PjTgc=;
	b=lhbRp4KdQOI+pt7F4SQeA+T0oRbW8iCVT/7e/NbGSw4VIHQNjwOibKAVOpb/2zEPVo
	N/tBho6goaBGwAS00PoQ2gFMjIA1aBWtVPkYx0/mIPc9gKhSh6sqNyrpMKoVQTgG+5Z4
	0filjTkegVCsWB0UubehFIEAlWESM1sEIW5mZf9DneW4iuUy2TKd40sGtZDLvYvi+LQI
	ABTXpNmYwd1wPA/lJXvlHeSbPe32tFIg6QQov8FgoL3r4A4sbYLFNOu6UniniJshIJqS
	OYOu7DKzGyM1SJ0CUKMDuoLdQs/zzdf3791V8LjKBUrn/Tz//+IWnwTGDKzzaguSEERd
	KscQ==
X-Gm-Message-State: AJcUukdaiuSh3LzvkF5Hhw4itXFzMd5qVicRUz4Og/EvY2OnDLvDBi/T
	FiEv4CD8DlLQojLxDtq0WlmmIkiefBA=
X-Google-Smtp-Source: ALg8bN56Xix9iJHPtZ+nwD+9GUmzYetmQccAK+DCNDo16dRRN1BiYQRjZLnPSq1QINYBJHScX3UXDQ==
X-Received: by 2002:adf:f984:: with SMTP id f4mr27092317wrr.234.1548783795589; 
	Tue, 29 Jan 2019 09:43:15 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n9sm94381894wrx.80.2019.01.29.09.43.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:43:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 17:43:07 +0000
Message-Id: <20190129174312.29224-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
References: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/7] oeqa/utils/logparser: Simplify ptest log parsing code
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
X-List-Received-Date: Tue, 29 Jan 2019 17:43:15 -0000
Content-Transfer-Encoding: 8bit

logparser is only used by ptest. Its slightly overcomplicated as it was
intended to be reusable but wasn't. Simplify it as a dedicated parser is
likely to me more readable and maintainable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py |  7 +---
 meta/lib/oeqa/utils/logparser.py     | 62 +++++-----------------------
 2 files changed, 11 insertions(+), 58 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 7d8849308d7..ebef3f9eac3 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -12,12 +12,7 @@ class PtestRunnerTest(OERuntimeTestCase):
 
     # a ptest log parser
     def parse_ptest(self, logfile):
-        parser = Lparser(test_0_pass_regex="^PASS:(.+)",
-                         test_0_fail_regex="^FAIL:(.+)",
-                         test_0_skip_regex="^SKIP:(.+)",
-                         section_0_begin_regex="^BEGIN: .*/(.+)/ptest",
-                         section_0_end_regex="^END: .*/(.+)/ptest")
-        parser.init()
+        parser = Lparser()
         result = Result()
 
         with open(logfile, errors='replace') as f:
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 0670627c3c0..328baeefaf6 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -5,66 +5,24 @@ import os
 import re
 from . import ftools
 
-
 # A parser that can be used to identify weather a line is a test result or a section statement.
 class Lparser(object):
 
-    def __init__(self, test_0_pass_regex, test_0_fail_regex, test_0_skip_regex, section_0_begin_regex=None, section_0_end_regex=None, **kwargs):
-        # Initialize the arguments dictionary
-        if kwargs:
-            self.args = kwargs
-        else:
-            self.args = {}
-
-        # Add the default args to the dictionary
-        self.args['test_0_pass_regex'] = test_0_pass_regex
-        self.args['test_0_fail_regex'] = test_0_fail_regex
-        self.args['test_0_skip_regex'] = test_0_skip_regex
-        if section_0_begin_regex:
-            self.args['section_0_begin_regex'] = section_0_begin_regex
-        if section_0_end_regex:
-            self.args['section_0_end_regex'] = section_0_end_regex
-
-        self.test_possible_status = ['pass', 'fail', 'error', 'skip']
-        self.section_possible_status = ['begin', 'end']
-
-        self.initialized = False
+    def __init__(self, **kwargs):
 
-
-    # Initialize the parser with the current configuration
-    def init(self):
-
-        # extra arguments can be added by the user to define new test and section categories. They must follow a pre-defined pattern: <type>_<category_name>_<status>_regex
-        self.test_argument_pattern = "^test_(.+?)_(%s)_regex" % '|'.join(map(str, self.test_possible_status))
-        self.section_argument_pattern = "^section_(.+?)_(%s)_regex" % '|'.join(map(str, self.section_possible_status))
-
-        # Initialize the test and section regex dictionaries
         self.test_regex = {}
-        self.section_regex ={}
-
-        for arg, value in self.args.items():
-            if not value:
-                raise Exception('The value of provided argument %s is %s. Should have a valid value.' % (key, value))
-            is_test =  re.search(self.test_argument_pattern, arg)
-            is_section = re.search(self.section_argument_pattern, arg)
-            if is_test:
-                if not is_test.group(1) in self.test_regex:
-                    self.test_regex[is_test.group(1)] = {}
-                self.test_regex[is_test.group(1)][is_test.group(2)] = re.compile(value)
-            elif is_section:
-                if not is_section.group(1) in self.section_regex:
-                    self.section_regex[is_section.group(1)] = {}
-                self.section_regex[is_section.group(1)][is_section.group(2)] = re.compile(value)
-            else:
-                # TODO: Make these call a traceback instead of a simple exception..
-                raise Exception("The provided argument name does not correspond to any valid type. Please give one of the following types:\nfor tests: %s\nfor sections: %s" % (self.test_argument_pattern, self.section_argument_pattern))
-
-        self.initialized = True
+        self.test_regex[0] = {}
+        self.test_regex[0]['pass'] = re.compile(r"^PASS:(.+)")
+        self.test_regex[0]['fail'] = re.compile(r"^FAIL:(.+)")
+        self.test_regex[0]['skip'] = re.compile(r"^SKIP:(.+)")
+
+        self.section_regex = {}
+        self.section_regex[0] = {}
+        self.section_regex[0]['begin'] = re.compile(r"^BEGIN: .*/(.+)/ptest")
+        self.section_regex[0]['end'] = re.compile(r"^END: .*/(.+)/ptest")
 
     # Parse a line and return a tuple containing the type of result (test/section) and its category, status and name
     def parse_line(self, line):
-        if not self.initialized:
-            raise Exception("The parser is not initialized..")
 
         for test_category, test_status_list in self.test_regex.items():
             for test_status, status_regex in test_status_list.items():
-- 
2.19.1


