Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACE67F2B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:58:15 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b24so11185803pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=+iezMvTnQVaq+i0ehknHOn6HoEEYzYMIJbd5YE43Jo0=;
	b=JWLKAoGQTsFSp035EqG25HsoAI9+eqcZvyPaCMsZ0g745hslnTDwokVAMyFBOc7Y+w
	xCVSH0CatHo4M1piNcu86vqpS8fMdkzb5BCqiNJpUE+TV6/74xV6bmSP2EmjsVTBumMM
	zJBbZSyuS6565ZfzU5whNQ+LpzxYDUXkw5STqGmh03+OSOmZuhc+JOP7BJXue9u8Zvg+
	XcsqDx1jZUWuCXjjItccLtlh2q/II2hi7kizGqkgncpe0Ig3B89Rzro3WB3m7USe641H
	j/Wxy/q5ZjkDoNyGsSSC3xjZAMZi5CpDD9s23/1S1UQVKIYuxnEP0tFd6/M0Z0oO2xOX
	l1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=+iezMvTnQVaq+i0ehknHOn6HoEEYzYMIJbd5YE43Jo0=;
	b=th8nnQdnuk++stxOuIpgZizMV7JTQ6duksnCCb3hkPNSWQHqLSsrRXD5D/m1OSGDLg
	V7gt6l5DAjx/xFCDH4WYY8RVgVpNZmpr5YX+qsX4XfaDHq+SEJkGnVy6xLKRvo4hH+Uj
	nHgk4spki0mjQSzjOhFVsTUP2hjdXxMyjwmvRFXmTlwakYMJZWCKcaRLCTItrGVhIB33
	rxD910m26pL6kmb9f2HmRyQIw22XP8a/JPerzA/yVjGMA6EKLbDkdnd43mWSciY2lC/k
	klvg3W92t4edLAopSR3czFVkA1A4RyEZF6aRVcZgJ+EMZyPYapCz2rLfpw6PueiA0uB3
	eu7w==
X-Gm-Message-State: APjAAAXIC5RtjZYhoJ+go4VBL8q3op8ln6ObtJM2gWNjUiazUEaj/PXb
	++hWjNbSRPCbeLH8sbGNaJcXaubBqePS3g==
X-Google-Smtp-Source: APXvYqxbWmD/hFI9pypsbE7dKhSphXk1iWiQADSL9u4S99fhB5D7ZBk4LeQViG7M7cH3WtcChRykhw==
X-Received: by 2002:a17:90a:804c:: with SMTP id e12mr260775pjw.3.1567529896619;
	Tue, 03 Sep 2019 09:58:16 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	j5sm15225230pgp.59.2019.09.03.09.58.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:58:15 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-11-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 11/12] oeqa/selftest/gcc: Create selftest case for gcc test suite
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
X-List-Received-Date: Tue, 03 Sep 2019 16:58:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Create a oeqa selftest test case to execute the gcc test suites and
report the results. The results are populated into the extraresults
variable of the test case which are written to testresults.json for
resulttool to analyse.

An additional subclass is created to separate the execution with qemu
linux-user and qemu system. The GccSelfTestSystemEmulated test case
handles setup of the target image as well as execution with runqemu.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changed in v2:
- Change to using only gcc-runtime recipe and associated check targets
- Remove gxx/g++ testcase, this is part of the "check-gcc" target
- Populate test results as ptestresults
- Rename BUILD_TEST_* to TOOLCHAIN_TEST_*
- Mark tests with 'machine' tag
---
 meta/lib/oeqa/selftest/cases/gcc.py | 111 ++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/gcc.py

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
new file mode 100644
index 0000000000..0ad6e21d6b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: MIT
+import os
+from oeqa.core.decorator import OETestTag
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
+
+def parse_values(content):
+    for i in content:
+        for v in ["PASS", "FAIL", "XPASS", "XFAIL", "UNRESOLVED", "UNSUPPORTED", "UNTESTED", "ERROR", "WARNING"]:
+            if i.startswith(v + ": "):
+                yield i[len(v) + 2:].strip(), v
+                break
+
+@OETestTag("machine")
+class GccSelfTest(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+
+        if "ptestresult.sections" not in cls.tc.extraresults:
+            cls.tc.extraresults["ptestresult.sections"] = {}
+
+    def gcc_runtime_check_skip(self, suite):
+        targets = get_bb_var("RUNTIMETARGET", "gcc-runtime").split()
+        if suite not in targets:
+            self.skipTest("Target does not use {0}".format(suite))
+
+    def test_cross_gcc(self):
+        self.gcc_run_check("gcc", "g++")
+
+    def test_libatomic(self):
+        self.gcc_run_check("libatomic")
+
+    def test_libgomp(self):
+        self.gcc_run_check("libgomp")
+
+    def test_libstdcxx(self):
+        self.gcc_run_check("libstdc++-v3")
+
+    def test_libssp(self):
+        self.gcc_runtime_check_skip("libssp")
+        self.gcc_run_check("libssp")
+
+    def test_libitm(self):
+        self.gcc_runtime_check_skip("libitm")
+        self.gcc_run_check("libitm")
+
+    def gcc_run_check(self, *suites, ssh = None):
+        targets = set()
+        for s in suites:
+            if s in ["gcc", "g++"]:
+                targets.add("check-gcc")
+            else:
+                targets.add("check-target-{}".format(s))
+
+        # configure ssh target
+        features = []
+        features.append('MAKE_CHECK_TARGETS = "{0}"'.format(" ".join(targets)))
+        if ssh is not None:
+            features.append('TOOLCHAIN_TEST_TARGET = "ssh"')
+            features.append('TOOLCHAIN_TEST_HOST = "{0}"'.format(ssh))
+            features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
+            features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
+        self.write_config("\n".join(features))
+
+        recipe = "gcc-runtime"
+        bitbake("{} -c check".format(recipe))
+
+        bb_vars = get_bb_vars(["B", "TARGET_SYS"], recipe)
+        builddir, target_sys = bb_vars["B"], bb_vars["TARGET_SYS"]
+
+        failed = 0
+        for suite in suites:
+            sumspath = os.path.join(builddir, "gcc", "testsuite", suite, "{0}.sum".format(suite))
+            if not os.path.exists(sumspath): # check in target dirs
+                sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite))
+            if not os.path.exists(sumspath): # handle libstdc++-v3 -> libstdc++
+                sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite.split("-")[0]))
+
+            ptestsuite = "gcc-{}".format(suite) if suite != "gcc" else suite
+            self.tc.extraresults["ptestresult.sections"][ptestsuite] = {}
+            with open(sumspath, "r") as f:
+                for test, result in parse_values(f):
+                    self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                    if result == "FAIL":
+                        self.logger.info("failed: '{}'".format(test))
+                        failed += 1
+
+        self.assertEqual(failed, 0)
+
+class GccSelfTestSystemEmulated(GccSelfTest):
+    default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+
+    def gcc_run_check(self, *args, **kwargs):
+        # build core-image-minimal with required packages
+        features = []
+        features.append('IMAGE_FEATURES += "ssh-server-openssh"')
+        features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(self.default_installed_packages)))
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+        # wrap the execution with a qemu instance
+        with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+            # validate that SSH is working
+            status, _ = qemu.run("uname")
+            self.assertEqual(status, 0)
+
+            return super().gcc_run_check(*args, **kwargs, ssh = qemu.ip)
+
---
2.23.0.rc1

