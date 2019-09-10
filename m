Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6E06A7F395
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 12:41:35 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id bd8so8542835plb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=eQB133spgqAcqh5zgtph+y3OpkLGAUWt5ri8O/7e0AU=;
	b=E/f3NNrWAuuu3OsWXebseqgRjTnK2R5J468VnJ2DE8RfTsVp3QJrVsy3PeJ0SpNdQq
	CUsdpMTuDS1jDT0RSdp2fbppsNn/0EoESjcXiZbDC8qEjCvmW3GAbTUdQkyab0d5/OCx
	LjCq38mjkyOq79P+jvRYmoGklbHM4Bz2ivALY3dMDIRqjy86qVIBxzc98u8iparQZerh
	wDUv/C4bLG0dGHYpYMusUl5YBf6szxAGFaZQY+N0fg4OfXw0oopEWrivmEFmq3wKYyVs
	H6axRJiA8PI9utPhZpYUI1tCr08Jj9TLRvdbvV36F8PeNBrfs/Ztizt8U9Adu3ZE9NAS
	VPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=eQB133spgqAcqh5zgtph+y3OpkLGAUWt5ri8O/7e0AU=;
	b=WkXn6LCfdMgMo6t+WYqvK4ClgTTnfOte4PqDXrC/CS6aRjNJRRsNsJsuZkqoWFwgeq
	yftI9XInHIvEM0ujUer3ECLenC9pgBwPnyjX/Mv9ygi7FDW7jo2lPXKFwR+vgChR5jen
	YGevI2ZaoZGXKW9tve4GFofqWTO/VKlahsnpqPXfvsV67wdFUyi98v84uwN8yPji3eCV
	xdsN0Vkth72ZnRR/I6v5CzdKZXfjZ0lafw8JMqK6gehFal777T9QLecKgwjlG6jl2BfH
	uHMqDgbQx1if9jIu+2s4OLBIKFz2mNSBMaH/f34CkNWk91erGHD3YwW5vxy5xLj8UYVo
	4nPQ==
X-Gm-Message-State: APjAAAX1wMrWLjfhbVx6Zv84B+KPQY4m6OSVS4HDM24RsPshJGJ/3F98
	ORdgb32E5BKeSTmVuZLyhKrrqQ==
X-Google-Smtp-Source: APXvYqw/+jCNY3MokqDE9+3z0Q8BE4oqUkfKv8eGrLobtAIsXGReHu6QR1SFjzQzsquVKDIoMhblfQ==
X-Received: by 2002:a17:902:74c3:: with SMTP id
	f3mr31470481plt.325.1568119296222; 
	Tue, 10 Sep 2019 05:41:36 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	d18sm20624082pgi.40.2019.09.10.05.41.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 05:41:35 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:40:59 +0000
Message-Id: <20190910124059.3908-6-nathan@nathanrossi.com>
In-Reply-To: <20190910124059.3908-1-nathan@nathanrossi.com>
References: <20190910124059.3908-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 6/6] oeqa/selftest: Rework toolchain tests to use OEPTestResultTestCase
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
X-List-Received-Date: Tue, 10 Sep 2019 12:41:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Use OEPTestResultTestCase to collect results and add logfile collection
and compression.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/binutils.py | 11 ++++++-----
 meta/lib/oeqa/selftest/cases/gcc.py      |  8 ++++----
 meta/lib/oeqa/selftest/cases/glibc.py    |  7 ++++---
 3 files changed, 14 insertions(+), 12 deletions(-)

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
index 2c25b5904c..6daa8d9e15 100644
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
@@ -41,7 +42,6 @@ class GccSelfTestBase(OESelftestTestCase):
         bb_vars = get_bb_vars(["B", "TARGET_SYS"], recipe)
         builddir, target_sys = bb_vars["B"], bb_vars["TARGET_SYS"]
 
-        self.extraresults = {"ptestresult.sections" : {}}
         for suite in suites:
             sumspath = os.path.join(builddir, "gcc", "testsuite", suite, "{0}.sum".format(suite))
             if not os.path.exists(sumspath): # check in target dirs
@@ -51,10 +51,10 @@ class GccSelfTestBase(OESelftestTestCase):
 
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

