Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id E73A96BE2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:17 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id go14so649047plb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=d6Zv5V09WeVXP5KekjmO1Ln32Yw1eyXk3VtN7lEafoA=;
	b=btauquQF3jSCVeUaVVG6llhT6sTbSXK41nED/nseF4FD2i8FRYHmniU/gr5U8mjRjK
	tCKwJVh8RNpXaYBKBj4iku3Ob0C9D2l10Uvino8D4psXtMrfxGme0i49jfVyTegJDbhn
	uPwQ2YYjc/I6L9Hrd9RUlGqRid1YDuHSvXQx2XNKEWtBdm6mimexJEVUI8LLAXZ07Fa1
	axCYw2k8sPsOglIflHvMfQeFToMO5zvgFaqkI3euIS4K9mTFwoRaG2dLn2F8etbqKI0o
	P3WP+xeUnYEK9/k8aqWT9cZUTTVt0egprAcCtEx7FLtHidy0P2Xy7YUvUxOt6KB8Z7B3
	Z9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=d6Zv5V09WeVXP5KekjmO1Ln32Yw1eyXk3VtN7lEafoA=;
	b=VtKzhR/pU5E/Ma4ONKyeU/SnEwQNS6+c1rdQ6PlhWozjSnwzpIuHLOMT/iRmNfpEhQ
	ffuBP2/SOwR02SnCFI5A3T+YqOP1n9QhWhWHnFFsw69uXtEGC/12HDvLVJQ2SRjnVak8
	PsgMUj8icjSFgXTTbN8kNEGqUjBLlcK2WODuwNH8MnX5HnNkAfTOO+4Q2duCpQzKLF9L
	TiDLWoeuZdalcN0xnUjt24Wag2ScT7iDwTUy9enTNFRuurEHkjm5Qpac2jhfogR5/tWT
	V/55qfehwlTfF4C55obSD+mgGUYHH9ire9V8VYhMEE3/47Sw4kYnRQL4lOwB9iJtPJHC
	NCPw==
X-Gm-Message-State: APjAAAXB3pMROv3a/vm+MCotNeDSgzdF1CU3XIXnZtDQBgDdQonBN0Cb
	4x828OCxBv25skvNURfeSGJJtA==
X-Google-Smtp-Source: APXvYqz/npdY/SAvzg1N5VPBSXB1o4C9qrgcZcOQcu/kgyh9pUZWCK8RKDmzmPecSdsdXQ7JmsihyQ==
X-Received: by 2002:a17:902:e311:: with SMTP id
	cg17mr2391903plb.183.1566968838852; 
	Tue, 27 Aug 2019 22:07:18 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	d189sm1186415pfd.165.2019.08.27.22.07.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:18 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-7-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 7/11] oeqa/selftest/binutils: Create selftest case for binutils test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Create a oeqa selftest test case to execute the binutils test suites and
report the results. The results are populated into the extraresults
variable of the test case which are written to testresults.json for
resulttool to analyse.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/binutils.py | 95 ++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/binutils.py

diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
new file mode 100644
index 0000000000..5cb7e106ac
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: MIT
+import os
+import sys
+import re
+import logging
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+
+def parse_values(content, gold = False):
+    suffix = ": " if not gold else " "
+    for i in content:
+        for v in ["PASS", "FAIL", "XPASS", "XFAIL", "UNRESOLVED", "UNSUPPORTED", "UNTESTED", "ERROR", "WARNING"]:
+            if i.startswith(v + suffix):
+                name = i[len(v) + len(suffix):].strip()
+                if v == "FAIL" and gold: # clean off exit status on gold
+                    name = name.split(" (exit status:")[0]
+                yield name, v
+                break
+
+class BinutilsCrossSelfTest(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+
+    def test_binutils(self):
+        self.run_binutils("binutils")
+
+    def test_gas(self):
+        self.run_binutils("gas")
+
+    def test_ld(self):
+        self.run_binutils("ld")
+
+    def test_gold(self):
+        self.run_binutils("gold")
+
+    def test_libiberty(self):
+        self.run_binutils("libiberty")
+
+    def run_binutils(self, suite):
+        features = []
+        features.append('MAKE_CHECK_TARGETS = "check-{0}"'.format(suite))
+        self.write_config("\n".join(features))
+
+        tune_arch = get_bb_var("TUNE_ARCH")
+        recipe = "binutils-cross-{0}".format(tune_arch)
+        bb_vars = get_bb_vars(["B", "TARGET_SYS", "T"], recipe)
+        builddir, target_sys, tdir = bb_vars["B"], bb_vars["TARGET_SYS"], bb_vars["T"]
+
+        bitbake("{0} -c check".format(recipe))
+
+        failed = 0
+        def add_result(test, result):
+            nonlocal failed
+            self.tc.extraresults["binutils.{}.{}".format(suite, test)] = {"status" : result}
+            if result == "FAIL":
+                self.logger.info("failed: '{}'".format(test))
+                failed += 1
+
+        if suite in ["binutils", "gas", "ld"]:
+            sumspath = os.path.join(builddir, suite, "{0}.sum".format(suite))
+            if not os.path.exists(sumspath):
+                sumspath = os.path.join(builddir, suite, "testsuite", "{0}.sum".format(suite))
+            with open(sumspath, "r") as f:
+                for test, result in parse_values(f):
+                    add_result(test, result)
+        elif suite in ["gold"]:
+            # gold tests are not dejagnu, so no sums file
+            logspath = os.path.join(builddir, suite, "testsuite")
+            if os.path.exists(logspath):
+                for t in os.listdir(logspath):
+                    if not t.endswith(".log") or t == "test-suite.log":
+                        continue
+                    with open(os.path.join(logspath, t), "r") as f:
+                        for test, result in parse_values(f, gold = True):
+                            add_result(test, result)
+            else:
+                self.skipTest("Target does not use {0}".format(suite))
+        elif suite in ["libiberty"]:
+            # libiberty tests are not dejagnu, no sums or log files
+            logpath = os.path.join(tdir, "log.do_check")
+            if os.path.exists(logpath):
+                with open(logpath, "r") as f:
+                    logdata = f.read()
+                m = re.search(r"entering directory\s+'[^\r\n]+?libiberty/testsuite'.*?$(.*?)" +
+                    "^[^\r\n]+?leaving directory\s+'[^\r\n]+?libiberty/testsuite'.*?$",
+                    logdata, re.DOTALL | re.MULTILINE | re.IGNORECASE)
+                if m is not None:
+                    for test, result in parse_values(m.group(1).splitlines()):
+                        add_result(test, result)
+
+        self.assertEqual(failed, 0)
+
---
2.23.0.rc1

