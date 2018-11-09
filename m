Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EFA1C6C221
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y3-v6so2091520wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BcVczMlrUFPbTmlO1PZ1++KvGa1xpnSDb9RJTGP/dr0=;
	b=C7rZAfnBXvWhOxCehlWIyZfQA1YUINaVj7D6L+lBbmi7/8AiH4ufsFItjRieQ/nCBt
	6ymXTH+LnTpDnUCl6htEvT2XtgARkqkqGghpidQkfI1gNCl+HQ3sSZyXWj/eU290jrNs
	WB+yLfhsbF9Z9PfgQuYghTWZ7u++fUHcwKA3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BcVczMlrUFPbTmlO1PZ1++KvGa1xpnSDb9RJTGP/dr0=;
	b=l4sbbNbQbGs4LCviPn8yXOqD7tms/fdmfg9HTE9Bf/BsQmDEaTG4RZac//9hJVKvCE
	JpD1Z+vXNjUeAiOq2M1LBiA648lfr21ct73+5EmSlpI/scbB+tSIsR4sq69Z+p/mC2X3
	jYsqPeJGz1AR9jx+sigVLYfVUoaX9lyEUpM9k8QAOj4CGwVO2VCTghKXtq96Em5pDaJ2
	bISzbyv2NbfAvNzQWIoOISUzXVRsWG7z0h8JKW5AWluOEfqHYIWXunKbBxFN70cgp74l
	EztkFfGWPEbOnnpWaVWd/JLeEVRlE3hVqZO9Jw0HaIWX0NQAkKIagL7Iipn4PK5eaCwc
	A5fQ==
X-Gm-Message-State: AGRZ1gKl2b4BlxQNmZeBuIslJUPogD0mk1M3YzMspawzwtGmHl5xlQ/W
	pwqIKkdlhtgKuZmkshsqdDJyzMWmQXE=
X-Google-Smtp-Source: AJdET5fus70bvXyFnvkZK9AEGk450zgiqZUUJTXO8soawJ7BPeDhDfPCwYgVq7cllX0Lorm9MGTBCw==
X-Received: by 2002:adf:9363:: with SMTP id
	90-v6mr1212896wro.204.1541773764939; 
	Fri, 09 Nov 2018 06:29:24 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:10 +0000
Message-Id: <20181109142912.23102-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/12] oeqa/runtime/cases: Improve dependencies of kernel/gcc/build tests
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:25 -0000

Mark up these tests as needing a compiler, make and kernel source code
as appropriate, the image feature requirements can then be retired.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/buildcpio.py      |  9 +++++----
 .../lib/oeqa/runtime/cases/buildgalculator.py |  9 +++++----
 meta/lib/oeqa/runtime/cases/buildlzip.py      | 12 +++++-------
 meta/lib/oeqa/runtime/cases/gcc.py            | 19 ++++++++-----------
 meta/lib/oeqa/runtime/cases/kernelmodule.py   |  8 ++++++--
 meta/lib/oeqa/runtime/cases/stap.py           |  4 ++--
 6 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 79b22d04dd0..a61d1e03043 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -1,7 +1,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
@@ -13,17 +13,18 @@ class BuildCpioTest(OERuntimeTestCase):
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
-        cls.project.download_archive()
 
     @classmethod
     def tearDownClass(cls):
         cls.project.clean()
 
     @OETestID(205)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['gcc'])
+    @OEHasPackage(['make'])
+    @OEHasPackage(['autoconf'])
     def test_cpio(self):
+        self.project.download_archive()
         self.project.run_configure()
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index 7c9d4a392bb..a0a00320835 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -1,7 +1,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
@@ -13,16 +13,17 @@ class GalculatorTest(OERuntimeTestCase):
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
-        cls.project.download_archive()
 
     @classmethod
     def tearDownClass(cls):
         cls.project.clean()
 
     @OETestID(1526)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['gcc'])
+    @OEHasPackage(['make'])
+    @OEHasPackage(['autoconf'])
     def test_galculator(self):
+        self.project.download_archive()
         self.project.run_configure()
         self.project.run_make()
diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index ca3fead2e49..5b455a07906 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -1,7 +1,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
@@ -14,21 +14,19 @@ class BuildLzipTest(OERuntimeTestCase):
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
-        cls.project.download_archive()
 
     @classmethod
     def tearDownClass(cls):
         cls.project.clean()
 
     @OETestID(206)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['gcc'])
+    @OEHasPackage(['make'])
+    @OEHasPackage(['autoconf'])
     def test_lzip(self):
+        self.project.download_archive()
         self.project.run_configure()
         self.project.run_make()
         self.project.run_install()
 
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
diff --git a/meta/lib/oeqa/runtime/cases/gcc.py b/meta/lib/oeqa/runtime/cases/gcc.py
index 911083156fb..8265c59f239 100644
--- a/meta/lib/oeqa/runtime/cases/gcc.py
+++ b/meta/lib/oeqa/runtime/cases/gcc.py
@@ -3,12 +3,12 @@ import os
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class GccCompileTest(OERuntimeTestCase):
 
     @classmethod
-    def setUpClass(cls):
+    def setUp(cls):
         dst = '/tmp/'
         src = os.path.join(cls.tc.files_dir, 'test.c')
         cls.tc.target.copyTo(src, dst)
@@ -20,14 +20,13 @@ class GccCompileTest(OERuntimeTestCase):
         cls.tc.target.copyTo(src, dst)
 
     @classmethod
-    def tearDownClass(cls):
+    def tearDown(cls):
         files = '/tmp/test.c /tmp/test.o /tmp/test /tmp/testmakefile'
         cls.tc.target.run('rm %s' % files)
 
     @OETestID(203)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['gcc'])
     def test_gcc_compile(self):
         status, output = self.target.run('gcc /tmp/test.c -o /tmp/test -lm')
         msg = 'gcc compile failed, output: %s' % output
@@ -38,9 +37,8 @@ class GccCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
     @OETestID(200)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['g++'])
     def test_gpp_compile(self):
         status, output = self.target.run('g++ /tmp/test.c -o /tmp/test -lm')
         msg = 'g++ compile failed, output: %s' % output
@@ -51,9 +49,8 @@ class GccCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
     @OETestID(1142)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['g++'])
     def test_gpp2_compile(self):
         status, output = self.target.run('g++ /tmp/test.cpp -o /tmp/test -lm')
         msg = 'g++ compile failed, output: %s' % output
@@ -64,9 +61,9 @@ class GccCompileTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
 
     @OETestID(204)
-    @skipIfNotFeature('tools-sdk',
-                      'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['gcc'])
+    @OEHasPackage(['make'])
     def test_make(self):
         status, output = self.target.run('cd /tmp; make -f testmakefile')
         msg = 'running make failed, output %s' % output
diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
index de1a5aa4457..27a2c35b711 100644
--- a/meta/lib/oeqa/runtime/cases/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
@@ -4,11 +4,12 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class KernelModuleTest(OERuntimeTestCase):
 
     @classmethod
-    def setUpClass(cls):
+    def setUp(cls):
         src = os.path.join(cls.tc.runtime_files_dir, 'hellomod.c')
         dst = '/tmp/hellomod.c'
         cls.tc.target.copyTo(src, dst)
@@ -18,7 +19,7 @@ class KernelModuleTest(OERuntimeTestCase):
         cls.tc.target.copyTo(src, dst)
 
     @classmethod
-    def tearDownClass(cls):
+    def tearDown(cls):
         files = '/tmp/Makefile /tmp/hellomod.c'
         cls.tc.target.run('rm %s' % files)
 
@@ -26,6 +27,9 @@ class KernelModuleTest(OERuntimeTestCase):
     @skipIfNotFeature('tools-sdk',
                       'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['gcc.GccCompileTest.test_gcc_compile'])
+    @OEHasPackage(['kernel-devsrc'])
+    @OEHasPackage(['make'])
+    @OEHasPackage(['gcc'])
     def test_kernel_module(self):
         cmds = [
             'cd /usr/src/kernel && make scripts prepare',
diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 747c1d95177..c492caffd67 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -9,13 +9,13 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class StapTest(OERuntimeTestCase):
 
     @classmethod
-    def setUpClass(cls):
+    def setUp(cls):
         src = os.path.join(cls.tc.runtime_files_dir, 'hello.stp')
         dst = '/tmp/hello.stp'
         cls.tc.target.copyTo(src, dst)
 
     @classmethod
-    def tearDownClass(cls):
+    def tearDown(cls):
         files = '/tmp/hello.stp'
         cls.tc.target.run('rm %s' % files)
 
-- 
2.17.1


