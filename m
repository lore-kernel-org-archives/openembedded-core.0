Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2713771C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:20:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2016 08:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496584"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:19:02 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:58 -0600
Message-Id: <14c90c3b7369d1194d34ae8121c92f2d6b78aa6e.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 30/30] oeqa: Fix files handling on runtime tests.
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
X-List-Received-Date: Thu, 08 Dec 2016 16:20:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Common files was move to oeqa/files from oeqa/runtime/files
because the same files are used across Runtime,SDK,eSDK tests.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testexport.bbclass | 5 +++++
 meta/lib/oeqa/oetest.py         | 1 +
 meta/lib/oeqa/runtime/gcc.py    | 4 ++--
 meta/lib/oeqa/runtime/perl.py   | 2 +-
 meta/lib/oeqa/runtime/python.py | 2 +-
 5 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 5147020..a3ccd63 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -87,6 +87,7 @@ def exportTests(d,tc):
     #   - the contents of oeqa/utils and oeqa/runtime/files
     #   - oeqa/oetest.py and oeqa/runexport.py (this will get copied to exportpath not exportpath/oeqa)
     #   - __init__.py files
+    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/files"))
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
     # copy test modules, this should cover tests in other layers too
@@ -124,6 +125,10 @@ def exportTests(d,tc):
         for f in files:
             if f.endswith(".py"):
                 shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/utils"))
+    # copy oeqa/files/*
+    for root, dirs, files in os.walk(os.path.join(oeqadir, "files")):
+        for f in files:
+            shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/files"))
     # copy oeqa/runtime/files/*
     for root, dirs, files in os.walk(os.path.join(oeqadir, "runtime/files")):
         for f in files:
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index f9e9025..48bcafc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -201,6 +201,7 @@ class TestContext(object):
         self.testsrequired = self._get_test_suites_required()
 
         self.filesdir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "runtime/files")
+        self.corefilesdir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
         self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
         self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
 
diff --git a/meta/lib/oeqa/runtime/gcc.py b/meta/lib/oeqa/runtime/gcc.py
index d90cd17..6edb89f 100644
--- a/meta/lib/oeqa/runtime/gcc.py
+++ b/meta/lib/oeqa/runtime/gcc.py
@@ -12,9 +12,9 @@ class GccCompileTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.c"), "/tmp/test.c")
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.c"), "/tmp/test.c")
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "testmakefile"), "/tmp/testmakefile")
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.cpp"), "/tmp/test.cpp")
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.cpp"), "/tmp/test.cpp")
 
     @testcase(203)
     def test_gcc_compile(self):
diff --git a/meta/lib/oeqa/runtime/perl.py b/meta/lib/oeqa/runtime/perl.py
index e044d0a..6bf98f1 100644
--- a/meta/lib/oeqa/runtime/perl.py
+++ b/meta/lib/oeqa/runtime/perl.py
@@ -12,7 +12,7 @@ class PerlTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.pl"), "/tmp/test.pl")
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.pl"), "/tmp/test.pl")
 
     @testcase(1141)
     def test_perl_exists(self):
diff --git a/meta/lib/oeqa/runtime/python.py b/meta/lib/oeqa/runtime/python.py
index 29a231c..93e822c 100644
--- a/meta/lib/oeqa/runtime/python.py
+++ b/meta/lib/oeqa/runtime/python.py
@@ -12,7 +12,7 @@ class PythonTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.py"), "/tmp/test.py")
+        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.py"), "/tmp/test.py")
 
     @testcase(1145)
     def test_python_exists(self):
-- 
2.1.4


