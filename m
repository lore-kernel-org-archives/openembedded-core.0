Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id C713B7F2B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:58:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p3so9458315pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=qRKwrdEmqk9aJ/8Yt6nI496DKxnRc/S0dWyrePV+pJs=;
	b=bDi+TaKeBUr40iMtyBVwFbg1Xgx78VqfWFVGTiwRoO2+B7cLilXZAXghTVr8MpLTvr
	57FwFNvD8jU2FT3IZ2asIwlhBkgqkFnsOPfEuSRiKU0hFuVu8nMsgZU49Hs/pdxNaUdP
	+X3IWhwOugzbjExAdSP2RHpHTX1w5fo9i5zGe+VhC8J12WtusDbTgN+moEG3/R3L2F9R
	VNVefuj9v9R2popS7l7XmJNx6NryXfFHUBmIirFxFskIuPwkXXQpQT+1Hl231K89kD3H
	RY8Qy85hbIr61//Jtzbu8PJkM9+PdiiDT9h0c/yzanWfBXUA0vCAfCAQtX7v6kGbId9k
	Bo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=qRKwrdEmqk9aJ/8Yt6nI496DKxnRc/S0dWyrePV+pJs=;
	b=oT0Bj88rJUUbHEE4Rh/kujdruweW+J/vO05mEhy1xKBeZ0L4ldum0r/PSp3mWa/MCR
	7EswU9hLDeQ3xg6rAwWOopqaZsQtAs89paypmSxIjWIyTtwYozxgb60biIfX2u15t9Df
	YpcLgS+KCanYsCZI7g4U34jWag4w0QqTxc4/3Du2CDaT+/hlYxXMyvZThSnRGDmDm8Wu
	mRAztyY8sYSnoqcWaVp4DvcreH/3AjHG18WVtpITTTIfJrpMsVpK183LY1wrYYz5Nkvw
	Np+3nTexhl985W666LF8D+xASqTKuO/WFtlMF/cLDktqCAyl+fkLUVqbOK9bXCwzESF4
	h/zA==
X-Gm-Message-State: APjAAAX9YDAunWRsTvDnS867/UJlEx71ZQ5BBfRsH5ffQZX6Wwlzw6Hi
	uD+lW9R/sareTvay8BK5PgC7wq0YhLH/QQ==
X-Google-Smtp-Source: APXvYqwpyRyzUWixCzMIxiQHcJL34uVyY3c5kOrJB9wWjm3XdhhKJXD6p8ME2+usRUqCKiGgeume6A==
X-Received: by 2002:a62:5f83:: with SMTP id
	t125mr12647190pfb.125.1567529891504; 
	Tue, 03 Sep 2019 09:58:11 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	s5sm97889pjo.26.2019.09.03.09.58.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:58:10 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-10-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 10/12] oeqa/selftest/binutils: Create selftest case for binutils test suite
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
X-List-Received-Date: Tue, 03 Sep 2019 16:58:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Create a oeqa selftest test case to execute the binutils test suites and
report the results. The results are populated into the extraresults
variable of the test case which are written to testresults.json for
resulttool to analyse.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Update to use binutils-cross-testsuite and CHECK_TARGETS
- Drop gold and libiberty test cases (and result parsing code)
- Populate test results as ptestresults
- Mark tests with 'machine' tag
---
 meta/lib/oeqa/selftest/cases/binutils.py | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/binutils.py

diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
new file mode 100644
index 0000000000..4edee09390
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: MIT
+import os
+import sys
+import re
+import logging
+from oeqa.core.decorator import OETestTag
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+
+def parse_values(content):
+    for i in content:
+        for v in ["PASS", "FAIL", "XPASS", "XFAIL", "UNRESOLVED", "UNSUPPORTED", "UNTESTED", "ERROR", "WARNING"]:
+            if i.startswith(v + ": "):
+                yield i[len(v) + 2:].strip(), v
+                break
+
+@OETestTag("machine")
+class BinutilsCrossSelfTest(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+
+        if "ptestresult.sections" not in cls.tc.extraresults:
+            cls.tc.extraresults["ptestresult.sections"] = {}
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
+    def run_binutils(self, suite):
+        features = []
+        features.append('CHECK_TARGETS = "{0}"'.format(suite))
+        self.write_config("\n".join(features))
+
+        recipe = "binutils-cross-testsuite"
+        bb_vars = get_bb_vars(["B", "TARGET_SYS", "T"], recipe)
+        builddir, target_sys, tdir = bb_vars["B"], bb_vars["TARGET_SYS"], bb_vars["T"]
+
+        bitbake("{0} -c check".format(recipe))
+
+        ptestsuite = "binutils-{}".format(suite) if suite != "binutils" else suite
+        self.tc.extraresults["ptestresult.sections"][ptestsuite] = {}
+
+        sumspath = os.path.join(builddir, suite, "{0}.sum".format(suite))
+        if not os.path.exists(sumspath):
+            sumspath = os.path.join(builddir, suite, "testsuite", "{0}.sum".format(suite))
+
+        failed = 0
+        with open(sumspath, "r") as f:
+            for test, result in parse_values(f):
+                self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                if result == "FAIL":
+                    self.logger.info("failed: '{}'".format(test))
+                    failed += 1
+
+        self.assertEqual(failed, 0)
+
---
2.23.0.rc1

