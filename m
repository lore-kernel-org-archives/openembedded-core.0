Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id F19AD7F0DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:22 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id w26so864609pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=xdeMkijaa9cWIyjZSg8aw6+/DAHFnjq/6tMspM0Eyxc=;
	b=EtnLdzX5OeDs66PjSHIYfNmSdk63GyxuEc0jcB/KyS8eAEadnMvgrfMB9LaHoZXZTq
	fLHXn3s1E6+kZl0nP+g04nTE0eX0EH7crryohhkVHb3+oUbv3rXwclDOM+RES7w+Ny1r
	FQepJACgtrFZoU4dHORoqFwpsSMPmnKa9HorfPy0n97fHGfHdXzFT/x3S4SHzXx3l4QY
	LOMCbd0MzV/MUGp1WIW7Sf4vSmtdJySOd71GedLyLHeq0aPwo5DJcRrMiEbSKqnCj5lf
	Gm81JWlT7aRvRnNYs21xTpEFhhF2aZlcJpq6lrTWWRGUV2MivjpyTH8iU/iaxZroGMBg
	ktRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=xdeMkijaa9cWIyjZSg8aw6+/DAHFnjq/6tMspM0Eyxc=;
	b=bcuhRzenae8nr9hZmXsyDksofOrECfCE49Cnzu8pUcko+pmiZPxuLkUNyaxiVh/MRX
	J3Q7R91e19yXKAor1v5arIHBSYHlFKD6Db4waY8iJ8dbUHPlculIVtD8GVjs2vxnor8Z
	P8PdovZRObFno7/kapPfxb+XorBCGqVaKKiQUVmCybsbmm3bfEqMFGG9q/So4tMlCTd4
	c9n/7I/idwT+Xq6YVfaGi7mz161lpTEb7TRhuFsUy3x22rt2f88rcx1wbJBQuZ1VZLsA
	bW6UYpB/gFeMesDZPuC5Xnj7sxnkKqNreNbYRcMfdSXh+X6G+6G/FZ5t5+/+AghAkK/O
	E2oA==
X-Gm-Message-State: APjAAAW8VeFYpLr9iHOY069LL21tmKvL0wst61iaaLsqaoOiZr5snsY3
	zF/ArNyhhMlCwq/ehZrv4vp46A==
X-Google-Smtp-Source: APXvYqxrL3yhV2yLsqxMm9bsCqOchHWDXpamwSPLorkN6rwTyEkBLugK5h7GOSnm3DhpM3boSJ6WMg==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
	o20mr2346132pjq.143.1566968844186; 
	Tue, 27 Aug 2019 22:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	s4sm858873pjp.15.2019.08.27.22.07.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:23 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-8-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 8/11] oeqa/selftest/gcc: Create selftest case for gcc test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:23 -0000
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
 meta/lib/oeqa/selftest/cases/gcc.py | 107 ++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/gcc.py

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
new file mode 100644
index 0000000000..c36637d066
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: MIT
+import os
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
+class GccSelfTest(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+
+    def gcc_runtime_check_skip(self, suite):
+        targets = get_bb_var("RUNTIMETARGET", "gcc-runtime").split()
+        if suite not in targets:
+            self.skipTest("Target does not use {0}".format(suite))
+
+    def test_cross_gcc(self):
+        self.gcc_cross_run_check("gcc")
+
+    def test_cross_gxx(self):
+        self.gcc_cross_run_check("g++")
+
+    def test_gcc_runtime_libatomic(self):
+        self.gcc_runtime_run_check("libatomic")
+
+    def test_gcc_runtime_libgomp(self):
+        self.gcc_runtime_run_check("libgomp")
+
+    def test_gcc_runtime_libstdcxx(self):
+        self.gcc_runtime_run_check("libstdc++-v3")
+
+    def test_gcc_runtime_libssp(self):
+        self.gcc_runtime_check_skip("libssp")
+        self.gcc_runtime_run_check("libssp")
+
+    def test_gcc_runtime_libitm(self):
+        self.gcc_runtime_check_skip("libitm")
+        self.gcc_runtime_run_check("libitm")
+
+    def gcc_cross_run_check(self, suite):
+        return self.gcc_run_check("gcc-cross-{0}".format(get_bb_var("TUNE_ARCH")), suite)
+
+    def gcc_runtime_run_check(self, suite):
+        return self.gcc_run_check("gcc-runtime", suite, target_prefix = "check-target-")
+
+    def gcc_run_check(self, recipe, suite, target_prefix = "check-", ssh = None):
+        target = target_prefix + suite.replace("gcc", "gcc").replace("g++", "c++")
+
+        # configure ssh target
+        features = []
+        features.append('MAKE_CHECK_TARGETS = "{0}"'.format(target))
+        if ssh is not None:
+            features.append('BUILD_TEST_TARGET = "ssh"')
+            features.append('BUILD_TEST_HOST = "{0}"'.format(ssh))
+            features.append('BUILD_TEST_HOST_USER = "root"')
+            features.append('BUILD_TEST_HOST_PORT = "22"')
+        self.write_config("\n".join(features))
+
+        bitbake("{0} -c check".format(recipe))
+
+        bb_vars = get_bb_vars(["TUNE_ARCH", "B", "TARGET_SYS"], recipe)
+        tune_arch, builddir, target_sys = bb_vars["TUNE_ARCH"], bb_vars["B"], bb_vars["TARGET_SYS"]
+
+        sumspath = os.path.join(builddir, "gcc", "testsuite", suite, "{0}.sum".format(suite))
+        if not os.path.exists(sumspath): # check in target dirs
+            sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite))
+        if not os.path.exists(sumspath): # handle libstdc++-v3 -> libstdc++
+            sumspath = os.path.join(builddir, target_sys, suite, "testsuite", "{0}.sum".format(suite.split("-")[0]))
+
+        failed = 0
+        with open(sumspath, "r") as f:
+            for test, result in parse_values(f):
+                self.tc.extraresults["{}.{}.{}".format(type(self).__name__, suite, test)] = {"status" : result}
+                if result == "FAIL":
+                    self.logger.info("failed: '{}'".format(test))
+                    failed += 1
+        self.assertEqual(failed, 0)
+
+class GccSelfTestSystemEmulated(GccSelfTest):
+    default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+
+    def gcc_run_check(self, *args, **kwargs):
+        tune_arch = get_bb_var("TUNE_ARCH")
+
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

