Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 26A337F4C6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:55:44 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i18so5077057pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=cVjpw6Shu3fz7tAU03F7k7LMv1FsWcb1xYeZvzwtVHc=;
	b=Q1iEdgW4stjscUnO7rLfV0ZMR9jrmPfT2x1KYFdO0DDTcZ/VYtfuTfxgl4ofvt3RGx
	e4/4x283pELH5eRwEJQaJ/PEuvEkvz3JsqLjX8nPrVgCUIh3NkWoDMzoNhHvGoMdpF3L
	fo2skN4+46raqGdYtzLc0oVAGM6RiR+sMlJdwGDGsH15LJLBM63UP1ITUjYLhOULKjKZ
	M2ldJ5ZKBXARRH++Mo3l0+l4t7axGAM4o8rrg2VJtQc3QFDPz0M27grM6b4gldNr8t17
	424vuj7By16nR54aITtH6Tr4jf1HnHQsVM1D3VVc36bEcJBSiWA4AWi1In9Esaca7ROh
	mREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=cVjpw6Shu3fz7tAU03F7k7LMv1FsWcb1xYeZvzwtVHc=;
	b=VzC8aIMavBwSxchWpQ0pbNOA3pFJ73zPelv4CgDIgfvjr1lRK1nXLW8jMpkZbjyxxO
	id9JVNQYRBH3XjRqOyRaI5xAvM6BfGIxuT3RCCO69nn9vNQHx0/KG7WppvAExmibdH6O
	jan+PlSLKCGCUB9yPQN8V20w6DXBD7C7BUHh5LC9bLEPCNDTFdOg8W17CtcLvVVpsCkD
	9u6FmXGZVoLnavuMSlkqPiPtoApWOqGcUH4Ylz/g3MZgr+aL9Tfo7lSkVoTpLe25CYQH
	ZdX4YifaUGDJdGLzf1WXboEIBol7uFBg99I/M+h7FF/RbKNEAIDQTgNMhM5GKJvOjdun
	CMAA==
X-Gm-Message-State: APjAAAV6D7gP/9BCypKqB8+QKhJd7eNXHkblX0lTJgDaxTz5Kd5Ua/qE
	vGY6Aga+zQ955qPZ2lavBvHoJ4CSIWY0eg==
X-Google-Smtp-Source: APXvYqxRhstvCOJBYqwrHFZHz0DuS7rFjLh61RPv+yRet7YfFLtBF+NfvG7jhIWyED1aFks31sADlQ==
X-Received: by 2002:a17:90a:7788:: with SMTP id
	v8mr15418694pjk.132.1567860945709; 
	Sat, 07 Sep 2019 05:55:45 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	t9sm8477025pgj.89.2019.09.07.05.55.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:55:45 -0700 (PDT)
Date: Sat, 07 Sep 2019 12:55:06 +0000
Message-Id: <20190907125506.17536-6-nathan@nathanrossi.com>
In-Reply-To: <20190907125506.17536-1-nathan@nathanrossi.com>
References: <20190907125506.17536-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 6/7] oeqa/selftest/cases/gcc.py: Split into classes for parallelism
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
X-List-Received-Date: Sat, 07 Sep 2019 12:55:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Split the gcc selftest cases into multiple classes one for each test.
This is done in order to make it easy to execute multiple gcc tests in
parallel when using oe-selftest with the '-j' arg.

Additionally tag the user tests with "toolchain-user" and the system
emulation (qemu system) tests with "toolchain-system".

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 99 ++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index d0f0ca06e7..6eafa41720 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -11,34 +11,13 @@ def parse_values(content):
                 yield i[len(v) + 2:].strip(), v
                 break
 
-@OETestTag("machine")
-class GccSelfTest(OESelftestTestCase):
-    def gcc_runtime_check_skip(self, suite):
+class GccSelfTestBase(OESelftestTestCase):
+    def check_skip(self, suite):
         targets = get_bb_var("RUNTIMETARGET", "gcc-runtime").split()
         if suite not in targets:
             self.skipTest("Target does not use {0}".format(suite))
 
-    def test_cross_gcc(self):
-        self.gcc_run_check("gcc", "g++")
-
-    def test_libatomic(self):
-        self.gcc_run_check("libatomic")
-
-    def test_libgomp(self):
-        self.gcc_run_check("libgomp")
-
-    def test_libstdcxx(self):
-        self.gcc_run_check("libstdc++-v3")
-
-    def test_libssp(self):
-        self.gcc_runtime_check_skip("libssp")
-        self.gcc_run_check("libssp")
-
-    def test_libitm(self):
-        self.gcc_runtime_check_skip("libitm")
-        self.gcc_run_check("libitm")
-
-    def gcc_run_check(self, *suites, ssh = None):
+    def run_check(self, *suites, ssh = None):
         targets = set()
         for s in suites:
             if s in ["gcc", "g++"]:
@@ -77,11 +56,9 @@ class GccSelfTest(OESelftestTestCase):
                 for test, result in parse_values(f):
                     self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
 
-class GccSelfTestSystemEmulated(GccSelfTest):
-    default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
-
-    def gcc_run_check(self, *args, **kwargs):
+    def run_check_emulated(self, *args, **kwargs):
         # build core-image-minimal with required packages
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-openssh"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(self.default_installed_packages)))
@@ -94,5 +71,69 @@ class GccSelfTestSystemEmulated(GccSelfTest):
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
 
-            return super().gcc_run_check(*args, **kwargs, ssh = qemu.ip)
+            return self.run_check(*args, **kwargs, ssh = qemu.ip)
+
+@OETestTag("machine", "toolchain-user")
+class GccCrossSelfTest(GccSelfTestBase):
+    def test_cross_gcc(self):
+        self.run_check("gcc", "g++")
+
+@OETestTag("machine", "toolchain-user")
+class GccLibAtomicSelfTest(GccSelfTestBase):
+    def test_libatomic(self):
+        self.run_check("libatomic")
+
+@OETestTag("machine", "toolchain-user")
+class GccLibGompSelfTest(GccSelfTestBase):
+    def test_libgomp(self):
+        self.run_check("libgomp")
+
+@OETestTag("machine", "toolchain-user")
+class GccLibStdCxxSelfTest(GccSelfTestBase):
+    def test_libstdcxx(self):
+        self.run_check("libstdc++-v3")
+
+@OETestTag("machine", "toolchain-user")
+class GccLibSspSelfTest(GccSelfTestBase):
+    def test_libssp(self):
+        self.check_skip("libssp")
+        self.run_check("libssp")
+
+@OETestTag("machine", "toolchain-user")
+class GccLibItmSelfTest(GccSelfTestBase):
+    def test_libitm(self):
+        self.check_skip("libitm")
+        self.run_check("libitm")
+
+@OETestTag("machine", "toolchain-system")
+class GccCrossSelfTestSystemEmulated(GccSelfTestBase):
+    def test_cross_gcc(self):
+        self.run_check_emulated("gcc", "g++")
+
+@OETestTag("machine", "toolchain-system")
+class GccLibAtomicSelfTestSystemEmulated(GccSelfTestBase):
+    def test_libatomic(self):
+        self.run_check_emulated("libatomic")
+
+@OETestTag("machine", "toolchain-system")
+class GccLibGompSelfTestSystemEmulated(GccSelfTestBase):
+    def test_libgomp(self):
+        self.run_check_emulated("libgomp")
+
+@OETestTag("machine", "toolchain-system")
+class GccLibStdCxxSelfTestSystemEmulated(GccSelfTestBase):
+    def test_libstdcxx(self):
+        self.run_check_emulated("libstdc++-v3")
+
+@OETestTag("machine", "toolchain-system")
+class GccLibSspSelfTestSystemEmulated(GccSelfTestBase):
+    def test_libssp(self):
+        self.check_skip("libssp")
+        self.run_check_emulated("libssp")
+
+@OETestTag("machine", "toolchain-system")
+class GccLibItmSelfTestSystemEmulated(GccSelfTestBase):
+    def test_libitm(self):
+        self.check_skip("libitm")
+        self.run_check_emulated("libitm")
 
---
2.23.0.rc1

