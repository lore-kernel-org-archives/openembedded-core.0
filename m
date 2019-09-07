Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id CFB207F493
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:55:28 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y22so6369332pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=hPFdh4JhA3eLaFIrxTWIA5dUAUEFjXNB+slSm/HGbl8=;
	b=CJOti0/MY8dbJl1ZssCB21mTF9YNaqtL3zH2VmMII7uqles0gRgVcjNPX7tuWIIlof
	SIgmXz7BFWKBqruQfM4Tv6aHNrKJ2WWdW/opxg2CfMHd187Ae19pal1lImo5rx/h/VhB
	GcxDWPS1AJytnAnHdxMGbk8c9XriMMRoanLixao39KMB1QNsfai/z+a/U+WA/Tv01F8w
	9ksJb4UiRJF+Cwfu3ZGXhzbagbYpILxkRopLFnRNrLXcu44bep8vNmmEY0bod08Kh6C2
	ZO0oonvTCWXI5mAzvXkGJyLEIjtUKu03bEzGqbvWwY9fdNXweYulAdfMNwoqbbOKfkxA
	cn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=hPFdh4JhA3eLaFIrxTWIA5dUAUEFjXNB+slSm/HGbl8=;
	b=kvpYfnapxiF6EQXeXtwiORYKhqas2v0XNwtcR5WMOfGkohIO4fIETFFVnQ9FGNPwM9
	q5WU9MMAQf2HBEdBmgsW9VpwGBZ7ckN0Bv/ujg5JI6Op5t29QQ6y0M3G3dID/6hzUXM8
	qK5yqY2Pz4E/y966nCRHb5y9yHlXlRYBKgVbO4n+qAbKCu4/z51WhG3j+76bs6+ydvFE
	aBSOQxjVrviubd2t5uoWsiM1SwpkC7klypEhEtTpE1fuaZzLDy+acM0TaVygNk5A6Gpu
	TYsSEnb85KYqvpqnN+VzVaU02lD4+xL5OyeDHkOJ9MV5Wec2V+SIEJ6pmvxKD5DTDW6t
	3hsw==
X-Gm-Message-State: APjAAAUzfT6vEbyCbX0qkB2moVv4QxTmR4Ilfaba6rC2TUz+ZWiJp49G
	HcGllLsaQ/OyeNVZH0zgUzB29kvkVS5z2w==
X-Google-Smtp-Source: APXvYqx3x3VstJiVjPiuHL+NSiS8agz1IwXPXZr93OIJ+P2t+44JuQFTHor+Y/hNv3nMiNEhFnRfNg==
X-Received: by 2002:a65:65c5:: with SMTP id y5mr12326993pgv.342.1567860929452; 
	Sat, 07 Sep 2019 05:55:29 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	q20sm14789096pfg.85.2019.09.07.05.55.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:55:28 -0700 (PDT)
Date: Sat, 07 Sep 2019 12:55:06 +0000
Message-Id: <20190907125506.17536-3-nathan@nathanrossi.com>
In-Reply-To: <20190907125506.17536-1-nathan@nathanrossi.com>
References: <20190907125506.17536-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/7] oeqa/selftest: Use extraresults on self instead of self.tc
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
X-List-Received-Date: Sat, 07 Sep 2019 12:55:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

In order to take advantage of multiprocess execution of tests the
extraresults must be passed through the TestResult. With changes to how
oeqa/core handles test cases the extraresults attribute of the testcase
is passed to the TestResult, with passing across process boundaries
handled automatically.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/binutils.py     | 13 ++-----------
 meta/lib/oeqa/selftest/cases/gcc.py          | 14 +++-----------
 meta/lib/oeqa/selftest/cases/glibc.py        | 13 ++-----------
 meta/lib/oeqa/selftest/cases/reproducible.py | 13 +++++--------
 4 files changed, 12 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 7f887959e4..759cd9b8ff 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -16,15 +16,6 @@ def parse_values(content):
 
 @OETestTag("machine")
 class BinutilsCrossSelfTest(OESelftestTestCase):
-    @classmethod
-    def setUpClass(cls):
-        super().setUpClass()
-        if not hasattr(cls.tc, "extraresults"):
-            cls.tc.extraresults = {}
-
-        if "ptestresult.sections" not in cls.tc.extraresults:
-            cls.tc.extraresults["ptestresult.sections"] = {}
-
     def test_binutils(self):
         self.run_binutils("binutils")
 
@@ -46,7 +37,7 @@ class BinutilsCrossSelfTest(OESelftestTestCase):
         bitbake("{0} -c check".format(recipe))
 
         ptestsuite = "binutils-{}".format(suite) if suite != "binutils" else suite
-        self.tc.extraresults["ptestresult.sections"][ptestsuite] = {}
+        self.extraresults = {"ptestresult.sections" : {ptestsuite : {}}}
 
         sumspath = os.path.join(builddir, suite, "{0}.sum".format(suite))
         if not os.path.exists(sumspath):
@@ -54,5 +45,5 @@ class BinutilsCrossSelfTest(OESelftestTestCase):
 
         with open(sumspath, "r") as f:
             for test, result in parse_values(f):
-                self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
 
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index ef85df5e36..d0f0ca06e7 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -13,15 +13,6 @@ def parse_values(content):
 
 @OETestTag("machine")
 class GccSelfTest(OESelftestTestCase):
-    @classmethod
-    def setUpClass(cls):
-        super().setUpClass()
-        if not hasattr(cls.tc, "extraresults"):
-            cls.tc.extraresults = {}
-
-        if "ptestresult.sections" not in cls.tc.extraresults:
-            cls.tc.extraresults["ptestresult.sections"] = {}
-
     def gcc_runtime_check_skip(self, suite):
         targets = get_bb_var("RUNTIMETARGET", "gcc-runtime").split()
         if suite not in targets:
@@ -71,6 +62,7 @@ class GccSelfTest(OESelftestTestCase):
         bb_vars = get_bb_vars(["B", "TARGET_SYS"], recipe)
         builddir, target_sys = bb_vars["B"], bb_vars["TARGET_SYS"]
 
+        self.extraresults = {"ptestresult.sections" : {}}
         for suite in suites:
             sumspath = os.path.join(builddir, "gcc", "testsuite", suite, "{0}.sum".format(suite))
             if not os.path.exists(sumspath): # check in target dirs
@@ -80,10 +72,10 @@ class GccSelfTest(OESelftestTestCase):
 
             ptestsuite = "gcc-{}".format(suite) if suite != "gcc" else suite
             ptestsuite = ptestsuite + "-user" if ssh is None else ptestsuite
-            self.tc.extraresults["ptestresult.sections"][ptestsuite] = {}
+            self.extraresults["ptestresult.sections"][ptestsuite] = {}
             with open(sumspath, "r") as f:
                 for test, result in parse_values(f):
-                    self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                    self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
 
 class GccSelfTestSystemEmulated(GccSelfTest):
     default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 4d0c13131b..e13de87014 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -15,15 +15,6 @@ def parse_values(content):
 
 @OETestTag("machine")
 class GlibcSelfTest(OESelftestTestCase):
-    @classmethod
-    def setUpClass(cls):
-        super().setUpClass()
-        if not hasattr(cls.tc, "extraresults"):
-            cls.tc.extraresults = {}
-
-        if "ptestresult.sections" not in cls.tc.extraresults:
-            cls.tc.extraresults["ptestresult.sections"] = {}
-
     def test_glibc(self):
         self.glibc_run_check()
 
@@ -44,10 +35,10 @@ class GlibcSelfTest(OESelftestTestCase):
         builddir = get_bb_var("B", "glibc-testsuite")
 
         ptestsuite = "glibc-user" if ssh is None else "glibc"
-        self.tc.extraresults["ptestresult.sections"][ptestsuite] = {}
+        self.extraresults = {"ptestresult.sections" : {ptestsuite : {}}}
         with open(os.path.join(builddir, "tests.sum"), "r") as f:
             for test, result in parse_values(f):
-                self.tc.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
+                self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
 
 class GlibcSelfTestSystemEmulated(GlibcSelfTest):
     default_installed_packages = [
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ffb405af20..eee09d3fb2 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -82,15 +82,12 @@ class ReproducibleTests(OESelftestTestCase):
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
 
-        if not hasattr(self.tc, "extraresults"):
-            self.tc.extraresults = {}
-        self.extras = self.tc.extraresults
-
-        self.extras.setdefault('reproducible.rawlogs', {})['log'] = ''
-        self.extras.setdefault('reproducible', {}).setdefault('files', {})
+        self.extrasresults = {}
+        self.extrasresults.setdefault('reproducible.rawlogs', {})['log'] = ''
+        self.extrasresults.setdefault('reproducible', {}).setdefault('files', {})
 
     def append_to_log(self, msg):
-        self.extras['reproducible.rawlogs']['log'] += msg
+        self.extrasresults['reproducible.rawlogs']['log'] += msg
 
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
         result = PackageCompareResults()
@@ -117,7 +114,7 @@ class ReproducibleTests(OESelftestTestCase):
         return result
 
     def write_package_list(self, package_class, name, packages):
-        self.extras['reproducible']['files'].setdefault(package_class, {})[name] = [
+        self.extrasresults['reproducible']['files'].setdefault(package_class, {})[name] = [
                 {'reference': p.reference, 'test': p.test} for p in packages]
 
     def test_reproducible_builds(self):
---
2.23.0.rc1

