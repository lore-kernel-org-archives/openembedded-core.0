Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC557C29C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:43:16 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r10so23035850wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xKvdUbMvONyPbsbry1eYFvr/jLwIV02Uf+44bcEZaBo=;
	b=V4rJ8BznEy3Huri1USG2NAuDYagQZw74qjypraRqFvdeRTqVxAj3KZubA7syxM3f4n
	yelr71DwJKweHZJFAOxyYpYveBztLe/zpquYzNkXg8XoNe7JQT4G9xggXAPREjNSRQBj
	34HzqQpl4PJJ8UcP2oBKDvdfB3B4WLYjo04lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xKvdUbMvONyPbsbry1eYFvr/jLwIV02Uf+44bcEZaBo=;
	b=eiAQZ1BKoZBqzn84RlnwCAjnsdEsY0TSwvOOvpbThLROdEJ/d6eiTY09rXeUqkUr8W
	QTDkAbH7sh08APXHBHUKpgdSok5Q74KfuSdG3tZHph6e0JIdmLcO1xMb4WJjZARpNuJO
	Yc9bXU2LmS+4gCg6kU4CEscyCMcmLCyA1OoTSDI6h8onetNpjyjR70rsjnG5VYKa5Dhh
	VwXlDiMKRHCr6b/kjjZdnKHB6brfLUOWFdDP0ociIggkjruHRoXJWQv8SI2Qt9008A0D
	L/z0yrJR8jIH+rQtnjp5wh3TvrHut0NGxSZy4/u3ZUloR6JiEDlxegPI5L88MKpPGKJi
	bgzQ==
X-Gm-Message-State: AHQUAuY0rLvNCHi4wwwi5IE9cOljhHJRVGQ8wl6eG5qbOMUJpWTBDlV+
	B0/aoPWobNlKOMviyhltEQbj09TjbFE=
X-Google-Smtp-Source: AHgI3IZONs0+Hvc09sa9kfVeDb9f37L9KdVmVLiLW8teWXZiAyI2u/9D2koH0bHRWHb/WJqnFbTTJw==
X-Received: by 2002:adf:f649:: with SMTP id x9mr13714196wrp.247.1548783796936; 
	Tue, 29 Jan 2019 09:43:16 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n9sm94381894wrx.80.2019.01.29.09.43.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:43:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 17:43:08 +0000
Message-Id: <20190129174312.29224-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
References: <20190129174312.29224-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/7] oeqa/logparser: Further simplification/clarification
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
X-List-Received-Date: Tue, 29 Jan 2019 17:43:16 -0000
Content-Transfer-Encoding: 8bit

Rename the paster to be ptest specific and apply some further cleanups
to the code to simplify and clarify what its doing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ptest.py |  6 ++---
 meta/lib/oeqa/utils/logparser.py     | 36 +++++++++++++---------------
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index ebef3f9eac3..1ce22a09e7d 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -6,13 +6,13 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
-from oeqa.utils.logparser import Lparser, Result
+from oeqa.utils.logparser import PtestParser, Result
 
 class PtestRunnerTest(OERuntimeTestCase):
 
     # a ptest log parser
     def parse_ptest(self, logfile):
-        parser = Lparser()
+        parser = PtestParser()
         result = Result()
 
         with open(logfile, errors='replace') as f:
@@ -20,7 +20,7 @@ class PtestRunnerTest(OERuntimeTestCase):
                 result_tuple = parser.parse_line(line)
                 if not result_tuple:
                     continue
-                result_tuple = line_type, category, status, name = parser.parse_line(line)
+                line_type, category, status, name = result_tuple
 
                 if line_type == 'section' and status == 'begin':
                     current_section = name
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 328baeefaf6..0807093fda6 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -6,35 +6,31 @@ import re
 from . import ftools
 
 # A parser that can be used to identify weather a line is a test result or a section statement.
-class Lparser(object):
+class PtestParser(object):
 
-    def __init__(self, **kwargs):
+    def __init__(self):
 
         self.test_regex = {}
-        self.test_regex[0] = {}
-        self.test_regex[0]['pass'] = re.compile(r"^PASS:(.+)")
-        self.test_regex[0]['fail'] = re.compile(r"^FAIL:(.+)")
-        self.test_regex[0]['skip'] = re.compile(r"^SKIP:(.+)")
+        self.test_regex['pass'] = re.compile(r"^PASS:(.+)")
+        self.test_regex['fail'] = re.compile(r"^FAIL:(.+)")
+        self.test_regex['skip'] = re.compile(r"^SKIP:(.+)")
 
         self.section_regex = {}
-        self.section_regex[0] = {}
-        self.section_regex[0]['begin'] = re.compile(r"^BEGIN: .*/(.+)/ptest")
-        self.section_regex[0]['end'] = re.compile(r"^END: .*/(.+)/ptest")
+        self.section_regex['begin'] = re.compile(r"^BEGIN: .*/(.+)/ptest")
+        self.section_regex['end'] = re.compile(r"^END: .*/(.+)/ptest")
 
     # Parse a line and return a tuple containing the type of result (test/section) and its category, status and name
     def parse_line(self, line):
 
-        for test_category, test_status_list in self.test_regex.items():
-            for test_status, status_regex in test_status_list.items():
-                test_name = status_regex.search(line)
-                if test_name:
-                    return ['test', test_category, test_status, test_name.group(1)]
-
-        for section_category, section_status_list in self.section_regex.items():
-            for section_status, status_regex in section_status_list.items():
-                section_name = status_regex.search(line)
-                if section_name:
-                    return ['section', section_category, section_status, section_name.group(1)]
+        for test_status, status_regex in test_status_list.items():
+            test_name = status_regex.search(line)
+            if test_name:
+                return ['test', test_category, test_status, test_name.group(1)]
+
+        for section_status, status_regex in section_status_list.items():
+            section_name = status_regex.search(line)
+            if section_name:
+                return ['section', section_category, section_status, section_name.group(1)]
         return None
 
 
-- 
2.19.1


