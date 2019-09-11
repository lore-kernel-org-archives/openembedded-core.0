Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 67C377EC92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 14:13:38 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b13so13726720pfo.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=pyjBwg+onwWuN24ujFy0oAIDS/0NGBXcSR0W0Xxk1qU=;
	b=eMa1V2A9lt3znBx29escYONXcRSYmNJUDuGM9+967wBF/81cvweKAnwHnYcK3J3NNR
	AkAO/W8PXw0IEi7MkrAbzq8UhY37gVlzJCGbA7a88ZBgIp0IorGA8nRGzbhmboGZRreg
	mJRzo2nht+h1VXV3IpHqcOoXS5wWFrlpV01lnhO90B00HPpyQsiCoFQCdgSgtZunKrge
	7TXsNzPmV+ea2g6tiEQuPVgTCzDNz/Ho/a4JtmMq1ALGgz55iC2Pz7Z6d31YLPP9szU9
	Oz+ZVYvmmF4mhhDm33RpUbWwyE47aIER3iKDTxTJ/mw2UO6uRYofhkiPynDWBCF1u4Qc
	KXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=pyjBwg+onwWuN24ujFy0oAIDS/0NGBXcSR0W0Xxk1qU=;
	b=FlWRIbFx0V7pi/6fWFCb5YtrNkwu9+6lHnN9I+9lzbifezvCMcm08QiYQKQ0OB4LCs
	iyRN8ZIZ5Of6gjVLGsGkQjiQr2XjE8NF4NKZT3H4u0KaWuga3hfrGxcX5ChB0SdukKLT
	1RGWHGeYgjDpHpuqug8guOI9un54FGYDZ/wiFp0sWbN0UxHvjV9YgN+AN/4am433zdSl
	UYSpVwt+YdkSrJsbgYJZPQGUkcwcAEWGCEI5EiPLRZLNY1RWDvQ6zW9bK7UYiZ4aM1Mj
	abd95G/cnRXmUuEHy94GEGXOx28XDDKbkl37c3YcjhGwo+qjbJ1n5CJcFrKyv4nUTV76
	7mvw==
X-Gm-Message-State: APjAAAUtuPG6mdXahEUthwyF/F3h/nGy5M+KnbfJ3rZyxSOC6a8CM+h1
	gu2DC2KojMmSUP4FdlFLp7AW0OrpCZbg4w==
X-Google-Smtp-Source: APXvYqx5BBTWC5GEif+WNA3nTd0JIl9ZpNm2rOa0CChD7qSeMSJ82136Ffy4UL4xr4lJrqAr+Bn3dw==
X-Received: by 2002:a65:5348:: with SMTP id w8mr32998681pgr.176.1568211218895; 
	Wed, 11 Sep 2019 07:13:38 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	w11sm17691176pga.52.2019.09.11.07.13.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 07:13:38 -0700 (PDT)
Date: Wed, 11 Sep 2019 14:13:07 +0000
Message-Id: <20190911141307.28014-4-nathan@nathanrossi.com>
In-Reply-To: <20190911141307.28014-1-nathan@nathanrossi.com>
References: <20190911141307.28014-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 4/4] oeqa/selftest: Rework toolchain tests to use OEPTestResultTestCase
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
X-List-Received-Date: Wed, 11 Sep 2019 14:13:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Use OEPTestResultTestCase to collect results and add logfile collection
and compression.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Fixed up missing logpath setting for gcc.py.
---
 meta/lib/oeqa/selftest/cases/binutils.py | 11 ++++++-----
 meta/lib/oeqa/selftest/cases/gcc.py      |  9 +++++----
 meta/lib/oeqa/selftest/cases/glibc.py    |  7 ++++---
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 9bc752040f..821f52f5a8 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -4,6 +4,7 @@ import sys
 import re
 import logging
 from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 
@@ -15,7 +16,7 @@ def parse_values(content):
                 break
 
 @OETestTag("toolchain-user", "toolchain-system")
-class BinutilsCrossSelfTest(OESelftestTestCase):
+class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
     def test_binutils(self):
         self.run_binutils("binutils")
 
@@ -36,14 +37,14 @@ class BinutilsCrossSelfTest(OESelftestTestCase):
 
         bitbake("{0} -c check".format(recipe))
 
-        ptestsuite = "binutils-{}".format(suite) if suite != "binutils" else suite
-        self.extraresults = {"ptestresult.sections" : {ptestsuite : {}}}
-
         sumspath = os.path.join(builddir, suite, "{0}.sum".format(suite))
         if not os.path.exists(sumspath):
             sumspath = os.path.join(builddir, suite, "testsuite", "{0}.sum".format(suite))
+        logpath = os.path.splitext(sumspath)[0] + ".log"
 
+        ptestsuite = "binutils-{}".format(suite) if suite != "binutils" else suite
+        self.ptest_section(ptestsuite, logfile = logpath)
         with open(sumspath, "r") as f:
             for test, result in parse_values(f):
-                self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                self.ptest_result(ptestsuite, test, result)
 
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 2c25b5904c..5a917b9c44 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: MIT
 import os
 from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
 
@@ -11,7 +12,7 @@ def parse_values(content):
                 yield i[len(v) + 2:].strip(), v
                 break
 
-class GccSelfTestBase(OESelftestTestCase):
+class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
     def check_skip(self, suite):
         targets = get_bb_var("RUNTIMETARGET", "gcc-runtime").split()
         if suite not in targets:
@@ -41,20 +42,20 @@ class GccSelfTestBase(OESelftestTestCase):
         bb_vars = get_bb_vars(["B", "TARGET_SYS"], recipe)
         builddir, target_sys = bb_vars["B"], bb_vars["TARGET_SYS"]
 
-        self.extraresults = {"ptestresult.sections" : {}}
         for suite in suites:
             sumspath = os.path.join(builddir, "gcc", "testsuite", suite, "{0}.sum".format(suite))
             if not os.path.exists(sumspath): # check in target dirs
                 sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite))
             if not os.path.exists(sumspath): # handle libstdc++-v3 -> libstdc++
                 sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite.split("-")[0]))
+            logpath = os.path.splitext(sumspath)[0] + ".log"
 
             ptestsuite = "gcc-{}".format(suite) if suite != "gcc" else suite
             ptestsuite = ptestsuite + "-user" if ssh is None else ptestsuite
-            self.extraresults["ptestresult.sections"][ptestsuite] = {}
+            self.ptest_section(ptestsuite, logfile = logpath)
             with open(sumspath, "r") as f:
                 for test, result in parse_values(f):
-                    self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                    self.ptest_result(ptestsuite, test, result)
 
     def run_check_emulated(self, *args, **kwargs):
         # build core-image-minimal with required packages
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 2e42485dd6..c687f6ef93 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -2,6 +2,7 @@
 import os
 import contextlib
 from oeqa.core.decorator import OETestTag
+from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
 from oeqa.utils.nfs import unfs_server
@@ -13,7 +14,7 @@ def parse_values(content):
                 yield i[len(v) + 2:].strip(), v
                 break
 
-class GlibcSelfTestBase(OESelftestTestCase):
+class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
     def run_check(self, ssh = None):
         # configure ssh target
         features = []
@@ -31,10 +32,10 @@ class GlibcSelfTestBase(OESelftestTestCase):
         builddir = get_bb_var("B", "glibc-testsuite")
 
         ptestsuite = "glibc-user" if ssh is None else "glibc"
-        self.extraresults = {"ptestresult.sections" : {ptestsuite : {}}}
+        self.ptest_section(ptestsuite)
         with open(os.path.join(builddir, "tests.sum"), "r") as f:
             for test, result in parse_values(f):
-                self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                self.ptest_result(ptestsuite, test, result)
 
     def run_check_emulated(self):
         with contextlib.ExitStack() as s:
---
2.23.0.rc1

