Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E66CD77253
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567512"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:57 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:19 -0600
Message-Id: <8b8b059cb3261b77dc8cfca0f1db16148c55e09f.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 48/55] oeqa/runtime/cases: Migrate runtime tests.
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:58 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This migrates current runtime test suite to be used with the new framework.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../{runtime_cases => runtime/cases}/_ptest.py     |   0
 .../{runtime_cases => runtime/cases}/_qemutiny.py  |   0
 meta/lib/oeqa/runtime/cases/buildcvs.py            |  35 ++++
 meta/lib/oeqa/runtime/cases/buildgalculator.py     |  31 ++++
 meta/lib/oeqa/runtime/cases/buildiptables.py       |  39 +++++
 meta/lib/oeqa/runtime/cases/connman.py             |  30 ++++
 meta/lib/oeqa/runtime/cases/date.py                |  38 +++++
 meta/lib/oeqa/runtime/cases/df.py                  |  13 ++
 meta/lib/oeqa/runtime/cases/gcc.py                 |  76 +++++++++
 meta/lib/oeqa/runtime/cases/kernelmodule.py        |  40 +++++
 meta/lib/oeqa/runtime/cases/ldd.py                 |  25 +++
 meta/lib/oeqa/runtime/cases/logrotate.py           |  42 +++++
 meta/lib/oeqa/runtime/cases/multilib.py            |  41 +++++
 meta/lib/oeqa/runtime/cases/pam.py                 |  33 ++++
 .../{runtime_cases => runtime/cases}/parselogs.py  | 187 ++++++++++++---------
 meta/lib/oeqa/runtime/cases/perl.py                |  37 ++++
 meta/lib/oeqa/runtime/cases/ping.py                |  24 +++
 meta/lib/oeqa/runtime/cases/python.py              |  43 +++++
 meta/lib/oeqa/runtime/cases/rpm.py                 | 141 ++++++++++++++++
 meta/lib/oeqa/runtime/cases/scanelf.py             |  26 +++
 meta/lib/oeqa/runtime/cases/scp.py                 |  33 ++++
 meta/lib/oeqa/runtime/cases/skeletoninit.py        |  33 ++++
 .../oeqa/{runtime_cases => runtime/cases}/smart.py |   0
 meta/lib/oeqa/runtime/cases/ssh.py                 |  15 ++
 meta/lib/oeqa/runtime/cases/syslog.py              |  57 +++++++
 .../{runtime_cases => runtime/cases}/systemd.py    | 151 +++++++++--------
 meta/lib/oeqa/runtime/cases/x32lib.py              |  19 +++
 meta/lib/oeqa/runtime/cases/xorg.py                |  17 ++
 meta/lib/oeqa/runtime_cases/buildcvs.py            |  32 ----
 meta/lib/oeqa/runtime_cases/buildgalculator.py     |  26 ---
 meta/lib/oeqa/runtime_cases/buildiptables.py       |  33 ----
 meta/lib/oeqa/runtime_cases/connman.py             |  31 ----
 meta/lib/oeqa/runtime_cases/date.py                |  31 ----
 meta/lib/oeqa/runtime_cases/df.py                  |  12 --
 meta/lib/oeqa/runtime_cases/gcc.py                 |  47 ------
 meta/lib/oeqa/runtime_cases/kernelmodule.py        |  34 ----
 meta/lib/oeqa/runtime_cases/ldd.py                 |  21 ---
 meta/lib/oeqa/runtime_cases/logrotate.py           |  30 ----
 meta/lib/oeqa/runtime_cases/multilib.py            |  42 -----
 meta/lib/oeqa/runtime_cases/pam.py                 |  25 ---
 meta/lib/oeqa/runtime_cases/perl.py                |  30 ----
 meta/lib/oeqa/runtime_cases/ping.py                |  22 ---
 meta/lib/oeqa/runtime_cases/python.py              |  35 ----
 meta/lib/oeqa/runtime_cases/rpm.py                 | 120 -------------
 meta/lib/oeqa/runtime_cases/scanelf.py             |  28 ---
 meta/lib/oeqa/runtime_cases/scp.py                 |  22 ---
 meta/lib/oeqa/runtime_cases/skeletoninit.py        |  29 ----
 meta/lib/oeqa/runtime_cases/ssh.py                 |  19 ---
 meta/lib/oeqa/runtime_cases/syslog.py              |  52 ------
 meta/lib/oeqa/runtime_cases/x32lib.py              |  18 --
 meta/lib/oeqa/runtime_cases/xorg.py                |  16 --
 51 files changed, 1075 insertions(+), 906 deletions(-)
 rename meta/lib/oeqa/{runtime_cases => runtime/cases}/_ptest.py (100%)
 rename meta/lib/oeqa/{runtime_cases => runtime/cases}/_qemutiny.py (100%)
 create mode 100644 meta/lib/oeqa/runtime/cases/buildcvs.py
 create mode 100644 meta/lib/oeqa/runtime/cases/buildgalculator.py
 create mode 100644 meta/lib/oeqa/runtime/cases/buildiptables.py
 create mode 100644 meta/lib/oeqa/runtime/cases/connman.py
 create mode 100644 meta/lib/oeqa/runtime/cases/date.py
 create mode 100644 meta/lib/oeqa/runtime/cases/df.py
 create mode 100644 meta/lib/oeqa/runtime/cases/gcc.py
 create mode 100644 meta/lib/oeqa/runtime/cases/kernelmodule.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ldd.py
 create mode 100644 meta/lib/oeqa/runtime/cases/logrotate.py
 create mode 100644 meta/lib/oeqa/runtime/cases/multilib.py
 create mode 100644 meta/lib/oeqa/runtime/cases/pam.py
 rename meta/lib/oeqa/{runtime_cases => runtime/cases}/parselogs.py (64%)
 create mode 100644 meta/lib/oeqa/runtime/cases/perl.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ping.py
 create mode 100644 meta/lib/oeqa/runtime/cases/python.py
 create mode 100644 meta/lib/oeqa/runtime/cases/rpm.py
 create mode 100644 meta/lib/oeqa/runtime/cases/scanelf.py
 create mode 100644 meta/lib/oeqa/runtime/cases/scp.py
 create mode 100644 meta/lib/oeqa/runtime/cases/skeletoninit.py
 rename meta/lib/oeqa/{runtime_cases => runtime/cases}/smart.py (100%)
 create mode 100644 meta/lib/oeqa/runtime/cases/ssh.py
 create mode 100644 meta/lib/oeqa/runtime/cases/syslog.py
 rename meta/lib/oeqa/{runtime_cases => runtime/cases}/systemd.py (51%)
 create mode 100644 meta/lib/oeqa/runtime/cases/x32lib.py
 create mode 100644 meta/lib/oeqa/runtime/cases/xorg.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/buildcvs.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/buildgalculator.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/buildiptables.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/connman.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/date.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/df.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/gcc.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/kernelmodule.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/ldd.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/logrotate.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/multilib.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/pam.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/perl.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/ping.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/python.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/rpm.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/scanelf.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/scp.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/skeletoninit.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/ssh.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/syslog.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/x32lib.py
 delete mode 100644 meta/lib/oeqa/runtime_cases/xorg.py

diff --git a/meta/lib/oeqa/runtime_cases/_ptest.py b/meta/lib/oeqa/runtime/cases/_ptest.py
similarity index 100%
rename from meta/lib/oeqa/runtime_cases/_ptest.py
rename to meta/lib/oeqa/runtime/cases/_ptest.py
diff --git a/meta/lib/oeqa/runtime_cases/_qemutiny.py b/meta/lib/oeqa/runtime/cases/_qemutiny.py
similarity index 100%
rename from meta/lib/oeqa/runtime_cases/_qemutiny.py
rename to meta/lib/oeqa/runtime/cases/_qemutiny.py
diff --git a/meta/lib/oeqa/runtime/cases/buildcvs.py b/meta/lib/oeqa/runtime/cases/buildcvs.py
new file mode 100644
index 0000000..341eb49
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/buildcvs.py
@@ -0,0 +1,35 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
+
+class BuildCvsTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        uri = 'http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13'
+        uri = '%s/cvs-1.12.13.tar.bz2' % uri
+        cls.project = TargetBuildProject(cls.tc.target,
+                                         uri,
+                                         dl_dir = cls.tc.td['DL_DIR'])
+        cls.project.download_archive()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.project.clean()
+
+    @OETestID(205)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_cvs(self):
+        self.assertEqual(self.project.run_configure(), 0,
+                        msg="Running configure failed")
+
+        self.assertEqual(self.project.run_make(), 0,
+                        msg="Running make failed")
+
+        self.assertEqual(self.project.run_install(), 0,
+                        msg="Running make install failed")
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
new file mode 100644
index 0000000..0bd76f9
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -0,0 +1,31 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
+
+class GalculatorTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        uri = 'http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2'
+        cls.project = TargetBuildProject(cls.tc.target,
+                                         uri,
+                                         dl_dir = cls.tc.td['DL_DIR'])
+        cls.project.download_archive()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.project.clean()
+
+    @OETestID(1526)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_galculator(self):
+        self.assertEqual(self.project.run_configure(), 0,
+                        msg="Running configure failed")
+
+        self.assertEqual(self.project.run_make(), 0,
+                        msg="Running make failed")
diff --git a/meta/lib/oeqa/runtime/cases/buildiptables.py b/meta/lib/oeqa/runtime/cases/buildiptables.py
new file mode 100644
index 0000000..bae8039
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/buildiptables.py
@@ -0,0 +1,39 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
+
+class BuildIptablesTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        uri = 'http://downloads.yoctoproject.org/mirror/sources'
+        uri = '%s/iptables-1.4.13.tar.bz2' % uri
+        cls.project = TargetBuildProject(cls.tc.target,
+                                         uri,
+                                         dl_dir = cls.tc.td['DL_DIR'])
+        cls.project.download_archive()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.project.clean()
+
+    @OETestID(206)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_iptables(self):
+        self.assertEqual(self.project.run_configure(), 0,
+                        msg="Running configure failed")
+
+        self.assertEqual(self.project.run_make(), 0,
+                        msg="Running make failed")
+
+        self.assertEqual(self.project.run_install(), 0,
+                        msg="Running make install failed")
+
+    @classmethod
+    def tearDownClass(self):
+        self.project.clean()
diff --git a/meta/lib/oeqa/runtime/cases/connman.py b/meta/lib/oeqa/runtime/cases/connman.py
new file mode 100644
index 0000000..8b47108
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/connman.py
@@ -0,0 +1,30 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class ConnmanTest(OERuntimeTestCase):
+
+    def service_status(self, service):
+        if oeRuntimeTest.hasFeature("systemd"):
+            (_, output) = self.target.run('systemctl status -l %s' % service)
+            return output
+        else:
+            return "Unable to get status or logs for %s" % service
+
+    @OETestID(961)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["connman"])
+    def test_connmand_help(self):
+        (status, output) = self.target.run('/usr/sbin/connmand --help')
+        msg = 'Failed to get connman help. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(221)
+    @OETestDepends(['connman.ConnmanTest.test_connmand_help'])
+    def test_connmand_running(self):
+        cmd = '%s | grep [c]onnmand' % self.tc.target_cmds['ps']
+        (status, output) = self.target.run(cmd)
+        if status != 0:
+            self.logger.info(self.service_status("connman"))
+            self.fail("No connmand process running")
diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
new file mode 100644
index 0000000..ece7338
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -0,0 +1,38 @@
+import re
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+
+class DateTest(OERuntimeTestCase):
+
+    def setUp(self):
+        if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
+            self.logger.debug('Stopping systemd-timesyncd daemon')
+            self.target.run('systemctl stop systemd-timesyncd')
+
+    def tearDown(self):
+        if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
+            self.logger.debug('Starting systemd-timesyncd daemon')
+            self.target.run('systemctl start systemd-timesyncd')
+
+    @OETestID(211)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_date(self):
+        (status, output) = self.target.run('date +"%Y-%m-%d %T"')
+        msg = 'Failed to get initial date, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        oldDate = output
+
+        sampleDate = '"2016-08-09 10:00:00"'
+        (status, output) = self.target.run("date -s %s" % sampleDate)
+        self.assertEqual(status, 0, msg='Date set failed, output: %s' % output)
+
+        (status, output) = self.target.run("date -R")
+        p = re.match('Tue, 09 Aug 2016 10:00:.. \+0000', output)
+        msg = 'The date was not set correctly, output: %s' % output
+        self.assertTrue(p, msg=msg)
+
+        (status, output) = self.target.run('date -s "%s"' % oldDate)
+        msg = 'Failed to reset date, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
new file mode 100644
index 0000000..aecc32d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -0,0 +1,13 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+
+class DfTest(OERuntimeTestCase):
+
+    @OETestID(234)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_df(self):
+        cmd = "df / | sed -n '2p' | awk '{print $4}'"
+        (status,output) = self.target.run(cmd)
+        msg = 'Not enough space on image. Current size is %s' % output
+        self.assertTrue(int(output)>5120, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/gcc.py b/meta/lib/oeqa/runtime/cases/gcc.py
new file mode 100644
index 0000000..064fa49
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/gcc.py
@@ -0,0 +1,76 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class GccCompileTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        dst = '/tmp/'
+        src = os.path.join(cls.tc.files_dir, 'test.c')
+        #dst = '/tmp/test.c'
+        cls.tc.target.copyTo(src, dst)
+
+        src = os.path.join(cls.tc.runtime_files_dir, 'testmakefile')
+        #dst = '/tmp/testmakefile'
+        cls.tc.target.copyTo(src, dst)
+
+        src = os.path.join(cls.tc.files_dir, 'test.cpp')
+        #dst = '/tmp/test.cpp'
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        files = '/tmp/test.c /tmp/test.o /tmp/test /tmp/testmakefile'
+        cls.tc.target.run('rm %s' % files)
+
+    @OETestID(203)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_gcc_compile(self):
+        status, output = self.target.run('gcc /tmp/test.c -o /tmp/test -lm')
+        msg = 'gcc compile failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('/tmp/test')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(200)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_gpp_compile(self):
+        status, output = self.target.run('g++ /tmp/test.c -o /tmp/test -lm')
+        msg = 'g++ compile failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('/tmp/test')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(1142)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_gpp2_compile(self):
+        status, output = self.target.run('g++ /tmp/test.cpp -o /tmp/test -lm')
+        msg = 'g++ compile failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('/tmp/test')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(204)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_make(self):
+        status, output = self.target.run('cd /tmp; make -f testmakefile')
+        msg = 'running make failed, output %s' % output
+        self.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
new file mode 100644
index 0000000..11ad7b7
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
@@ -0,0 +1,40 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class KernelModuleTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        src = os.path.join(cls.tc.runtime_files_dir, 'hellomod.c')
+        dst = '/tmp/hellomod.c'
+        cls.tc.target.copyTo(src, dst)
+
+        src = os.path.join(cls.tc.runtime_files_dir, 'hellomod_makefile')
+        dst = '/tmp/Makefile'
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        files = '/tmp/Makefile /tmp/hellomod.c'
+        cls.tc.target.run('rm %s' % files)
+
+    @OETestID(1541)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['gcc.GccCompileTest.test_gcc_compile'])
+    def test_kernel_module(self):
+        cmds = [
+            'cd /usr/src/kernel && make scripts',
+            'cd /tmp && make',
+            'cd /tmp && insmod hellomod.ko',
+            'lsmod | grep hellomod',
+            'dmesg | grep Hello',
+            'rmmod hellomod', 'dmesg | grep "Cleaning up hellomod"'
+            ]
+        for cmd in cmds:
+            status, output = self.target.run(cmd, 900)
+            self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
diff --git a/meta/lib/oeqa/runtime/cases/ldd.py b/meta/lib/oeqa/runtime/cases/ldd.py
new file mode 100644
index 0000000..c6d92fd
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ldd.py
@@ -0,0 +1,25 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class LddTest(OERuntimeTestCase):
+
+    @OETestID(962)
+    @skipIfNotFeature('tools-sdk',
+                      'Test requires tools-sdk to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_ldd_exists(self):
+        status, output = self.target.run('which ldd')
+        msg = 'ldd does not exist in PATH: which ldd: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(239)
+    @OETestDepends(['ldd.LddTest.test_ldd_exists'])
+    def test_ldd_rtldlist_check(self):
+        cmd = ('for i in $(which ldd | xargs cat | grep "^RTLDLIST"| '
+              'cut -d\'=\' -f2|tr -d \'"\'); '
+              'do test -f $i && echo $i && break; done')
+        status, output = self.target.run(cmd)
+        msg = "ldd path not correct or RTLDLIST files don't exist."
+        self.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
new file mode 100644
index 0000000..992fef2
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -0,0 +1,42 @@
+# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=289 testcase
+# Note that the image under test must have logrotate installed
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class LogrotateTest(OERuntimeTestCase):
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.tc.target.run('rm -rf $HOME/logrotate_dir')
+
+    @OETestID(1544)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['logrotate'])
+    def test_1_logrotate_setup(self):
+        status, output = self.target.run('mkdir $HOME/logrotate_dir')
+        msg = 'Could not create logrotate_dir. Output: %s' % output
+        self.assertEqual(status, 0, msg = msg)
+
+        cmd = ('sed -i "s#wtmp {#wtmp {\\n    olddir $HOME/logrotate_dir#"'
+               ' /etc/logrotate.conf')
+        status, output = self.target.run(cmd)
+        msg = ('Could not write to logrotate.conf file. Status and output: '
+               ' %s and %s' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+    @OETestID(1542)
+    @OETestDepends(['logrotate.LogrotateTest.test_1_logrotate_setup'])
+    def test_2_logrotate(self):
+        status, output = self.target.run('logrotate -f /etc/logrotate.conf')
+        msg = ('logrotate service could not be reloaded. Status and output: '
+                '%s and %s' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+        _, output = self.target.run('ls -la $HOME/logrotate_dir/ | wc -l')
+        msg = ('new logfile could not be created. List of files within log '
+               'directory: %s' % (
+                self.target.run('ls -la $HOME/logrotate_dir')[1]))
+        self.assertTrue(int(output)>=3, msg = msg)
diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
new file mode 100644
index 0000000..8f6d2b2
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -0,0 +1,41 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotInDataVar
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class MultilibTest(OERuntimeTestCase):
+
+    def archtest(self, binary, arch):
+        """
+        Check that ``binary`` has the ELF class ``arch`` (e.g. ELF32/ELF64).
+        """
+
+        status, output = self.target.run('readelf -h %s' % binary)
+        self.assertEqual(status, 0, 'Failed to readelf %s' % binary)
+
+        l = [l.split()[1] for l in output.split('\n') if "Class:" in l]
+        if l:
+            theclass = l[0]
+        else:
+            self.fail('Cannot parse readelf. Output:\n%s' % output)
+
+        msg = "%s isn't %s (is %s)" % (binary, arch, theclass)
+        self.assertEqual(theclass, arch, msg=msg)
+
+    @skipIfNotInDataVar('MULTILIBS', 'multilib:lib32',
+                        "This isn't a multilib:lib32 image")
+    @OETestID(201)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_check_multilib_libc(self):
+        """
+        Check that a multilib image has both 32-bit and 64-bit libc in.
+        """
+        self.archtest("/lib/libc.so.6", "ELF32")
+        self.archtest("/lib64/libc.so.6", "ELF64")
+
+    @OETestID(279)
+    @OETestDepends(['multilib.MultilibTest.test_check_multilib_libc'])
+    @OEHasPackage(['lib32-connman'])
+    def test_file_connman(self):
+        self.archtest("/usr/sbin/connmand", "ELF32")
diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
new file mode 100644
index 0000000..3654cdc
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -0,0 +1,33 @@
+# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=287 testcase
+# Note that the image under test must have "pam" in DISTRO_FEATURES
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class PamBasicTest(OERuntimeTestCase):
+
+    @OETestID(1543)
+    @skipIfNotFeature('pam', 'Test requires pam to be in DISTRO_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_pam(self):
+        status, output = self.target.run('login --help')
+        msg = ('login command does not work as expected. '
+               'Status and output:%s and %s' % (status, output))
+        self.assertEqual(status, 1, msg = msg)
+
+        status, output = self.target.run('passwd --help')
+        msg = ('passwd command does not work as expected. '
+               'Status and output:%s and %s' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+        status, output = self.target.run('su --help')
+        msg = ('su command does not work as expected. '
+               'Status and output:%s and %s' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
+
+        status, output = self.target.run('useradd --help')
+        msg = ('useradd command does not work as expected. '
+               'Status and output:%s and %s' % (status, output))
+        self.assertEqual(status, 0, msg = msg)
diff --git a/meta/lib/oeqa/runtime_cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
similarity index 64%
rename from meta/lib/oeqa/runtime_cases/parselogs.py
rename to meta/lib/oeqa/runtime/cases/parselogs.py
index cc2d061..a53a360 100644
--- a/meta/lib/oeqa/runtime_cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -1,8 +1,12 @@
 import os
-import unittest
-import subprocess
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
+
+from subprocess import check_output
+from shutil import rmtree
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfDataVar
+from oeqa.runtime.decorator.package import OEHasPackage
 
 #in the future these lists could be moved outside of module
 errors = ["error", "cannot", "can\'t", "failed"]
@@ -168,144 +172,173 @@ ignore_errors = {
 
 log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]
 
-class ParseLogsTest(oeRuntimeTest):
+class ParseLogsTest(OERuntimeTestCase):
 
     @classmethod
-    def setUpClass(self):
-        self.errors = errors
+    def setUpClass(cls):
+        cls.errors = errors
 
         # When systemd is enabled we need to notice errors on
         # circular dependencies in units.
-        if self.hasFeature("systemd"):
-            self.errors.extend([
+        if 'systemd' in cls.td.get('DISTRO_FEATURES', ''):
+            cls.errors.extend([
                 'Found ordering cycle on',
                 'Breaking ordering cycle by deleting job',
                 'deleted to break ordering cycle',
                 'Ordering cycle found, skipping',
                 ])
 
-        self.ignore_errors = ignore_errors
-        self.log_locations = log_locations
-        self.msg = ""
-        (is_lsb, location) = oeRuntimeTest.tc.target.run("which LSB_Test.sh")
+        cls.ignore_errors = ignore_errors
+        cls.log_locations = log_locations
+        cls.msg = ''
+        is_lsb, _ = cls.tc.target.run("which LSB_Test.sh")
         if is_lsb == 0:
-            for machine in self.ignore_errors:
-                self.ignore_errors[machine] = self.ignore_errors[machine] + video_related
+            for machine in cls.ignore_errors:
+                cls.ignore_errors[machine] = cls.ignore_errors[machine] \
+                                             + video_related
 
     def getMachine(self):
-        return oeRuntimeTest.tc.d.getVar("MACHINE")
+        return self.td.get('MACHINE', '')
 
     def getWorkdir(self):
-        return oeRuntimeTest.tc.d.getVar("WORKDIR")
+        return self.td.get('WORKDIR', '')
 
-    #get some information on the CPU of the machine to display at the beginning of the output. This info might be useful in some cases.
+    # Get some information on the CPU of the machine to display at the
+    # beginning of the output. This info might be useful in some cases.
     def getHardwareInfo(self):
         hwi = ""
-        (status, cpu_name) = self.target.run("cat /proc/cpuinfo | grep \"model name\" | head -n1 | awk 'BEGIN{FS=\":\"}{print $2}'")
-        (status, cpu_physical_cores) = self.target.run("cat /proc/cpuinfo | grep \"cpu cores\" | head -n1 | awk {'print $4'}")
-        (status, cpu_logical_cores) = self.target.run("cat /proc/cpuinfo | grep \"processor\" | wc -l")
-        (status, cpu_arch) = self.target.run("uname -m")
-        hwi += "Machine information: \n"
-        hwi += "*******************************\n"
-        hwi += "Machine name: "+self.getMachine()+"\n"
-        hwi += "CPU: "+str(cpu_name)+"\n"
-        hwi += "Arch: "+str(cpu_arch)+"\n"
-        hwi += "Physical cores: "+str(cpu_physical_cores)+"\n"
-        hwi += "Logical cores: "+str(cpu_logical_cores)+"\n"
-        hwi += "*******************************\n"
+        cmd = ('cat /proc/cpuinfo | grep "model name" | head -n1 | '
+               " awk 'BEGIN{FS=\":\"}{print $2}'")
+        _, cpu_name = self.target.run(cmd)
+
+        cmd = ('cat /proc/cpuinfo | grep "cpu cores" | head -n1 | '
+               "awk {'print $4'}")
+        _, cpu_physical_cores = self.target.run(cmd)
+
+        cmd = 'cat /proc/cpuinfo | grep "processor" | wc -l'
+        _, cpu_logical_cores = self.target.run(cmd)
+
+        _, cpu_arch = self.target.run('uname -m')
+
+        hwi += 'Machine information: \n'
+        hwi += '*******************************\n'
+        hwi += 'Machine name: ' + self.getMachine() + '\n'
+        hwi += 'CPU: ' + str(cpu_name) + '\n'
+        hwi += 'Arch: ' + str(cpu_arch)+ '\n'
+        hwi += 'Physical cores: ' + str(cpu_physical_cores) + '\n'
+        hwi += 'Logical cores: ' + str(cpu_logical_cores) + '\n'
+        hwi += '*******************************\n'
+
         return hwi
 
-    #go through the log locations provided and if it's a folder create a list with all the .log files in it, if it's a file just add
-    #it to that list
+    # Go through the log locations provided and if it's a folder
+    # create a list with all the .log files in it, if it's a file
+    # just add it to that list.
     def getLogList(self, log_locations):
         logs = []
         for location in log_locations:
-            (status, output) = self.target.run("test -f "+str(location))
-            if (status == 0):
+            status, _ = self.target.run('test -f ' + str(location))
+            if status == 0:
                 logs.append(str(location))
             else:
-                (status, output) = self.target.run("test -d "+str(location))
-                if (status == 0):
-                    (status, output) = self.target.run("find "+str(location)+"/*.log -maxdepth 1 -type f")
-                    if (status == 0):
+                status, _ = self.target.run('test -d ' + str(location))
+                if status == 0:
+                    cmd = 'find ' + str(location) + '/*.log -maxdepth 1 -type f'
+                    status, output = self.target.run(cmd)
+                    if status == 0:
                         output = output.splitlines()
                         for logfile in output:
-                            logs.append(os.path.join(location,str(logfile)))
+                            logs.append(os.path.join(location, str(logfile)))
         return logs
 
-    #copy the log files to be parsed locally
+    # Copy the log files to be parsed locally
     def transfer_logs(self, log_list):
         workdir = self.getWorkdir()
         self.target_logs = workdir + '/' + 'target_logs'
         target_logs = self.target_logs
-        if not os.path.exists(target_logs):
-            os.makedirs(target_logs)
-        bb.utils.remove(self.target_logs + "/*")
+        if os.path.exists(target_logs):
+            rmtree(self.target_logs)
+        os.makedirs(target_logs)
         for f in log_list:
-            self.target.copy_from(f, target_logs)
+            self.target.copyFrom(str(f), target_logs)
 
-    #get the local list of logs
+    # Get the local list of logs
     def get_local_log_list(self, log_locations):
         self.transfer_logs(self.getLogList(log_locations))
-        logs = [ os.path.join(self.target_logs, f) for f in os.listdir(self.target_logs) if os.path.isfile(os.path.join(self.target_logs, f)) ]
+        list_dir = os.listdir(self.target_logs)
+        dir_files = [os.path.join(self.target_logs, f) for f in list_dir]
+        logs = [f for f in dir_files if os.path.isfile(f)]
         return logs
 
-    #build the grep command to be used with filters and exclusions
+    # Build the grep command to be used with filters and exclusions
     def build_grepcmd(self, errors, ignore_errors, log):
-        grepcmd = "grep "
-        grepcmd +="-Ei \""
+        grepcmd = 'grep '
+        grepcmd += '-Ei "'
         for error in errors:
-            grepcmd += error+"|"
+            grepcmd += error + '|'
         grepcmd = grepcmd[:-1]
-        grepcmd += "\" "+str(log)+" | grep -Eiv \'"
+        grepcmd += '" ' + str(log) + " | grep -Eiv \'"
+
         try:
             errorlist = ignore_errors[self.getMachine()]
         except KeyError:
-            self.msg += "No ignore list found for this machine, using default\n"
+            self.msg += 'No ignore list found for this machine, using default\n'
             errorlist = ignore_errors['default']
+
         for ignore_error in errorlist:
-            ignore_error = ignore_error.replace("(", "\(")
-            ignore_error = ignore_error.replace(")", "\)")
-            ignore_error = ignore_error.replace("'", ".")
-            ignore_error = ignore_error.replace("?", "\?")
-            ignore_error = ignore_error.replace("[", "\[")
-            ignore_error = ignore_error.replace("]", "\]")
-            ignore_error = ignore_error.replace("*", "\*")
-            ignore_error = ignore_error.replace("0-9", "[0-9]")
-            grepcmd += ignore_error+"|"
+            ignore_error = ignore_error.replace('(', '\(')
+            ignore_error = ignore_error.replace(')', '\)')
+            ignore_error = ignore_error.replace("'", '.')
+            ignore_error = ignore_error.replace('?', '\?')
+            ignore_error = ignore_error.replace('[', '\[')
+            ignore_error = ignore_error.replace(']', '\]')
+            ignore_error = ignore_error.replace('*', '\*')
+            ignore_error = ignore_error.replace('0-9', '[0-9]')
+            grepcmd += ignore_error + '|'
         grepcmd = grepcmd[:-1]
         grepcmd += "\'"
+
         return grepcmd
 
-    #grep only the errors so that their context could be collected. Default context is 10 lines before and after the error itself
-    def parse_logs(self, errors, ignore_errors, logs, lines_before = 10, lines_after = 10):
+    # Grep only the errors so that their context could be collected.
+    # Default context is 10 lines before and after the error itself
+    def parse_logs(self, errors, ignore_errors, logs,
+                   lines_before = 10, lines_after = 10):
         results = {}
         rez = []
         grep_output = ''
+
         for log in logs:
             result = None
             thegrep = self.build_grepcmd(errors, ignore_errors, log)
+
             try:
-                result = subprocess.check_output(thegrep, shell=True).decode("utf-8")
+                result = check_output(thegrep, shell=True).decode('utf-8')
             except:
                 pass
-            if (result is not None):
+
+            if result is not None:
                 results[log.replace('target_logs/','')] = {}
                 rez = result.splitlines()
+
                 for xrez in rez:
                     try:
-                        grep_output = subprocess.check_output(['grep', '-F', xrez, '-B', str(lines_before), '-A', str(lines_after), log]).decode("utf-8")
+                        cmd = ['grep', '-F', xrez, '-B', str(lines_before)]
+                        cmd += ['-A', str(lines_after), log]
+                        grep_output = check_output(cmd).decode('utf-8')
                     except:
                         pass
                     results[log.replace('target_logs/','')][xrez]=grep_output
+
         return results
 
-    #get the output of dmesg and write it in a file. This file is added to log_locations.
+    # Get the output of dmesg and write it in a file.
+    # This file is added to log_locations.
     def write_dmesg(self):
-        (status, dmesg) = self.target.run("dmesg > /tmp/dmesg_output.log")
+        (status, dmesg) = self.target.run('dmesg > /tmp/dmesg_output.log')
 
-    @testcase(1059)
-    @skipUnlessPassed('test_ssh')
+    @OETestID(1059)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_parselogs(self):
         self.write_dmesg()
         log_list = self.get_local_log_list(self.log_locations)
@@ -313,13 +346,13 @@ class ParseLogsTest(oeRuntimeTest):
         print(self.getHardwareInfo())
         errcount = 0
         for log in result:
-            self.msg += "Log: "+log+"\n"
-            self.msg += "-----------------------\n"
+            self.msg += 'Log: ' + log + '\n'
+            self.msg += '-----------------------\n'
             for error in result[log]:
                 errcount += 1
-                self.msg += "Central error: "+str(error)+"\n"
-                self.msg +=  "***********************\n"
-                self.msg +=  result[str(log)][str(error)]+"\n"
-                self.msg +=  "***********************\n"
-        self.msg += "%s errors found in logs." % errcount
+                self.msg += 'Central error: ' + str(error) + '\n'
+                self.msg +=  '***********************\n'
+                self.msg +=  result[str(log)][str(error)] + '\n'
+                self.msg +=  '***********************\n'
+        self.msg += '%s errors found in logs.' % errcount
         self.assertEqual(errcount, 0, msg=self.msg)
diff --git a/meta/lib/oeqa/runtime/cases/perl.py b/meta/lib/oeqa/runtime/cases/perl.py
new file mode 100644
index 0000000..d0b7e8e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/perl.py
@@ -0,0 +1,37 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class PerlTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        src = os.path.join(cls.tc.files_dir, 'test.pl')
+        dst = '/tmp/test.pl'
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        dst = '/tmp/test.pl'
+        cls.tc.target.run('rm %s' % dst)
+
+    @OETestID(1141)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['perl'])
+    def test_perl_exists(self):
+        status, output = self.target.run('which perl')
+        msg = 'Perl binary not in PATH or not on target.'
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(208)
+    @OETestDepends(['perl.PerlTest.test_perl_exists'])
+    def test_perl_works(self):
+        status, output = self.target.run('perl /tmp/test.pl')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "the value of a is 0.01", msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
new file mode 100644
index 0000000..02f580a
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -0,0 +1,24 @@
+from subprocess import Popen, PIPE
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.oetimeout import OETimeout
+
+class PingTest(OERuntimeTestCase):
+
+    @OETimeout(30)
+    @OETestID(964)
+    def test_ping(self):
+        output = ''
+        count = 0
+        while count < 5:
+            cmd = 'ping -c 1 %s' % self.target.ip
+            proc = Popen(cmd, shell=True, stdout=PIPE)
+            output += proc.communicate()[0].decode('utf-8')
+            if proc.poll() == 0:
+                count += 1
+            else:
+                count = 0
+        msg = ('Expected 5 consecutive, got %d.\n'
+               'ping output is:\n%s' % (count,output))
+        self.assertEqual(count, 5, msg = msg)
diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
new file mode 100644
index 0000000..bf3e179
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -0,0 +1,43 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class PythonTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        src = os.path.join(cls.tc.files_dir, 'test.py')
+        dst = '/tmp/test.py'
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        dst = '/tmp/test.py'
+        cls.tc.target.run('rm %s' % dst)
+
+    @OETestID(1145)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['python-core'])
+    def test_python_exists(self):
+        status, output = self.target.run('which python')
+        msg = 'Python binary not in PATH or not on target.'
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(965)
+    @OETestDepends(['python.PythonTest.test_python_exists'])
+    def test_python_stdout(self):
+        status, output = self.target.run('python /tmp/test.py')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "the value of a is 0.01", msg=msg)
+
+    @OETestID(1146)
+    @OETestDepends(['python.PythonTest.test_python_stdout'])
+    def test_python_testfile(self):
+        status, output = self.target.run('ls /tmp/testfile.python')
+        self.assertEqual(status, 0, msg='Python test file generate failed.')
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
new file mode 100644
index 0000000..532fbf8
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -0,0 +1,141 @@
+import os
+import fnmatch
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfDataVar
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.utils.path import findFile
+
+class RpmBasicTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        if cls.tc.td['PACKAGE_CLASSES'].split()[0] != 'package_rpm':
+            cls.skipTest('Tests require image to be build from rpm')
+
+    @OETestID(960)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_rpm_help(self):
+        status, output = self.target.run('rpm --help')
+        msg = 'status and output: %s and %s' % (status, output)
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(191)
+    @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
+    def test_rpm_query(self):
+        status, output = self.target.run('rpm -q rpm')
+        msg = 'status and output: %s and %s' % (status, output)
+        self.assertEqual(status, 0, msg=msg)
+
+class RpmInstallRemoveTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        if cls.tc.td['PACKAGE_CLASSES'].split()[0] != 'package_rpm':
+            cls.skipTest('Tests require image to be build from rpm')
+
+        pkgarch = cls.td['TUNE_PKGARCH'].replace('-', '_')
+        rpmdir = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm', pkgarch)
+        # Pick rpm-doc as a test file to get installed, because it's small
+        # and it will always be built for standard targets
+        rpm_doc = 'rpm-doc-*.%s.rpm' % pkgarch
+        for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
+            test_file = os.path.join(rpmdir, f)
+        dst = '/tmp/rpm-doc.rpm'
+        cls.tc.target.copyTo(test_file, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        dst = '/tmp/rpm-doc.rpm'
+        cls.tc.target.run('rm -f %s' % dst)
+
+    @OETestID(192)
+    @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
+    def test_rpm_install(self):
+        status, output = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
+        msg = 'Failed to install rpm-doc package: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(194)
+    @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_install'])
+    def test_rpm_remove(self):
+        status,output = self.target.run('rpm -e rpm-doc')
+        msg = 'Failed to remove rpm-doc package: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(1096)
+    @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
+    def test_rpm_query_nonroot(self):
+
+        def set_up_test_user(u):
+            status, output = self.target.run('id -u %s' % u)
+            if status:
+                status, output = self.target.run('useradd %s' % u)
+                msg = 'Failed to create new user: %s' % output
+                self.assertTrue(status == 0, msg=msg)
+
+        def exec_as_test_user(u):
+            status, output = self.target.run('su -c id %s' % u)
+            msg = 'Failed to execute as new user'
+            self.assertTrue("({0})".format(u) in output, msg=msg)
+
+            status, output = self.target.run('su -c "rpm -qa" %s ' % u)
+            msg = 'status: %s. Cannot run rpm -qa: %s' % (status, output)
+            self.assertEqual(status, 0, msg=msg)
+
+        def unset_up_test_user(u):
+            status, output = self.target.run('userdel -r %s' % u)
+            msg = 'Failed to erase user: %s' % output
+            self.assertTrue(status == 0, msg=msg)
+
+        tuser = 'test1'
+
+        try:
+            set_up_test_user(tuser)
+            exec_as_test_user(tuser)
+        finally:
+            unset_up_test_user(tuser)
+
+    @OETestID(195)
+    @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_remove'])
+    def test_check_rpm_install_removal_log_file_size(self):
+        """
+        Summary:     Check rpm install/removal log file size
+        Expected:    There should be some method to keep rpm log in a small size .
+        Product:     BSPs
+        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+        db_files_cmd = 'ls /var/lib/rpm/__db.*'
+        get_log_size_cmd = "du /var/lib/rpm/log/log.* | awk '{print $1}'"
+
+        # Make sure that some database files are under /var/lib/rpm as '__db.xxx'
+        status, output = self.target.run(db_files_cmd)
+        msg =  'Failed to find database files under /var/lib/rpm/ as __db.xxx'
+        self.assertEqual(0, status, msg=msg)
+
+        # Remove the package just in case
+        self.target.run('rpm -e rpm-doc')
+
+        # Install/Remove a package 10 times
+        for i in range(10):
+            status, output = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
+            msg = 'Failed to install rpm-doc package. Reason: {}'.format(output)
+            self.assertEqual(0, status, msg=msg)
+
+            status, output = self.target.run('rpm -e rpm-doc')
+            msg = 'Failed to remove rpm-doc package. Reason: {}'.format(output)
+            self.assertEqual(0, status, msg=msg)
+
+        # Get the size of log file
+        status, output = self.target.run(get_log_size_cmd)
+        msg = 'Failed to get the final size of the log file.'
+        self.assertEqual(0, status, msg=msg)
+
+        # Compare each log size
+        for log_file_size in output:
+            msg = ('Log file size is greater that expected (~10MB), '
+                    'found {} bytes'.format(log_file_size))
+            self.assertLessEqual(int(log_file_size), 11264, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/scanelf.py b/meta/lib/oeqa/runtime/cases/scanelf.py
new file mode 100644
index 0000000..3ba1f78
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/scanelf.py
@@ -0,0 +1,26 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class ScanelfTest(OERuntimeTestCase):
+    scancmd = 'scanelf --quiet --recursive --mount --ldpath --path'
+
+    @OETestID(966)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['pax-utils'])
+    def test_scanelf_textrel(self):
+        # print TEXTREL information
+        cmd = '%s --textrel' % self.scancmd
+        status, output = self.target.run(cmd)
+        msg = '\n'.join([cmd, output])
+        self.assertEqual(output.strip(), '', msg=msg)
+
+    @OETestID(967)
+    @OETestDepends(['scanelf.ScanelfTest.test_scanelf_textrel'])
+    def test_scanelf_rpath(self):
+        # print RPATH information
+        cmd = '%s --textrel --rpath' % self.scancmd
+        status, output = self.target.run(cmd)
+        msg = '\n'.join([cmd, output])
+        self.assertEqual(output.strip(), '', msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
new file mode 100644
index 0000000..f488a61
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -0,0 +1,33 @@
+import os
+from tempfile import mkstemp
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+
+class ScpTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        cls.tmp_fd, cls.tmp_path = mkstemp()
+        with os.fdopen(cls.tmp_fd, 'w') as f:
+            f.seek(2 ** 22 -1)
+            f.write(os.linesep)
+
+    @classmethod
+    def tearDownClass(cls):
+        os.remove(cls.tmp_path)
+
+    @OETestID(220)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_scp_file(self):
+        dst = '/tmp/test_scp_file'
+
+        (status, output) = self.target.copyTo(self.tmp_path, dst)
+        msg = 'File could not be copied. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        (status, output) = self.target.run('ls -la %s' % dst)
+        self.assertEqual(status, 0, msg = 'SCP test failed')
+
+        self.target.run('rm %s' % dst)
diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
new file mode 100644
index 0000000..e2dbbb7
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -0,0 +1,33 @@
+# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=284
+# testcase. Image under test must have meta-skeleton layer in bblayers and
+# IMAGE_INSTALL_append = " service" in local.conf
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfDataVar
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class SkeletonBasicTest(OERuntimeTestCase):
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['service'])
+    @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
+                   'Not appropiate for systemd image')
+    def test_skeleton_availability(self):
+        status, output = self.target.run('ls /etc/init.d/skeleton')
+        msg = 'skeleton init script not found. Output:\n%s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output =  self.target.run('ls /usr/sbin/skeleton-test')
+        msg = 'skeleton-test not found. Output:\n%s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(284)
+    @OETestDepends(['skeletoninit.SkeletonBasicTest.test_skeleton_availability'])
+    def test_skeleton_script(self):
+        output1 = self.target.run("/etc/init.d/skeleton start")[1]
+        cmd = '%s | grep [s]keleton-test' % self.tc.target_cmds['ps']
+        status, output2 = self.target.run(cmd)
+        cmd = ('Skeleton script could not be started:'
+               '\n%s\n%s' % (output1, output2))
+        self.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime_cases/smart.py b/meta/lib/oeqa/runtime/cases/smart.py
similarity index 100%
rename from meta/lib/oeqa/runtime_cases/smart.py
rename to meta/lib/oeqa/runtime/cases/smart.py
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
new file mode 100644
index 0000000..eca1679
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -0,0 +1,15 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+
+class SSHTest(OERuntimeTestCase):
+
+    @OETestID(224)
+    @OETestDepends(['ping.PingTest.test_ping'])
+    def test_ssh(self):
+        (status, output) = self.target.run('uname -a')
+        self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
+        (status, output) = self.target.run('cat /etc/masterimage')
+        msg = "This isn't the right image  - /etc/masterimage " \
+              "shouldn't be here %s" % output
+        self.assertEqual(status, 1, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/syslog.py b/meta/lib/oeqa/runtime/cases/syslog.py
new file mode 100644
index 0000000..1016e67
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/syslog.py
@@ -0,0 +1,57 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfDataVar
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class SyslogTest(OERuntimeTestCase):
+
+    @OETestID(201)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["busybox-syslog", "sysklogd"])
+    def test_syslog_running(self):
+        cmd = '%s  | grep -i [s]yslogd' % self.tc.target_cmds['ps']
+        status, output = self.target.run(cmd)
+        msg = "No syslogd process; ps output: %s" % output
+        self.assertEqual(status, 0, msg=msg)
+
+class SyslogTestConfig(OERuntimeTestCase):
+
+    @OETestID(1149)
+    @OETestDepends(['syslog.SyslogTest.test_syslog_running'])
+    def test_syslog_logger(self):
+        status, output = self.target.run('logger foobar')
+        msg = "Can't log into syslog. Output: %s " % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('grep foobar /var/log/messages')
+        if status != 0:
+            if self.tc.td.get("VIRTUAL-RUNTIME_init_manager") == "systemd":
+                status, output = self.target.run('journalctl -o cat | grep foobar')
+            else:
+                status, output = self.target.run('logread | grep foobar')
+        msg = ('Test log string not found in /var/log/messages or logread.'
+               ' Output: %s ' % output)
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestID(202)
+    @OETestDepends(['syslog.SyslogTestConfig.test_syslog_logger'])
+    @OEHasPackage(["!sysklogd", "busybox"])
+    @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
+                   'Not appropiate for systemd image')
+    def test_syslog_startup_config(self):
+        cmd = 'echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf'
+        self.target.run(cmd)
+        status, output = self.target.run('/etc/init.d/syslog restart')
+        msg = ('Could not restart syslog service. Status and output:'
+               ' %s and %s' % (status,output))
+        self.assertEqual(status, 0, msg)
+
+        cmd = 'logger foobar && grep foobar /var/log/test'
+        status,output = self.target.run(cmd)
+        msg = 'Test log string not found. Output: %s ' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        cmd = "sed -i 's#LOGFILE=/var/log/test##' /etc/syslog-startup.conf"
+        self.target.run(cmd)
+        self.target.run('/etc/init.d/syslog restart')
diff --git a/meta/lib/oeqa/runtime_cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
similarity index 51%
rename from meta/lib/oeqa/runtime_cases/systemd.py
rename to meta/lib/oeqa/runtime/cases/systemd.py
index 52feb1b..db69384 100644
--- a/meta/lib/oeqa/runtime_cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -1,28 +1,27 @@
-import unittest
 import re
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
+import time
 
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("systemd"):
-            skipModule("target doesn't have systemd in DISTRO_FEATURES")
-    if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"):
-            skipModule("systemd is not the init manager for this image")
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfDataVar, skipIfNotDataVar
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.decorator.data import skipIfNotFeature
 
+class SystemdTest(OERuntimeTestCase):
 
-class SystemdTest(oeRuntimeTest):
-
-    def systemctl(self, action = '', target = '', expected = 0, verbose = False):
+    def systemctl(self, action='', target='', expected=0, verbose=False):
         command = 'systemctl %s %s' % (action, target)
         status, output = self.target.run(command)
         message = '\n'.join([command, output])
         if status != expected and verbose:
-            message += self.target.run('systemctl status --full %s' % target)[1]
+            cmd = 'systemctl status --full %s' % target
+            message += self.target.run(cmd)[1]
         self.assertEqual(status, expected, message)
         return output
 
     #TODO: use pyjournalctl instead
-    def journalctl(self, args='',l_match_units=[]):
+    def journalctl(self, args='',l_match_units=None):
         """
         Request for the journalctl output to the current target system
 
@@ -36,31 +35,23 @@ class SystemdTest(oeRuntimeTest):
         -ValueError, on a journalctl call with filtering by l_match_units that
         returned no entries
         """
-        query_units=""
-        if len(l_match_units):
+
+        query_units=''
+        if l_match_units:
             query_units = ['_SYSTEMD_UNIT='+unit for unit in l_match_units]
-            query_units = " ".join(query_units)
+            query_units = ' '.join(query_units)
         command = 'journalctl %s %s' %(args, query_units)
         status, output = self.target.run(command)
         if status:
-            raise AssertionError("Command '%s' returned non-zero exit \
-                    code %d:\n%s" % (command, status, output))
+            raise AssertionError("Command '%s' returned non-zero exit "
+                    'code %d:\n%s' % (command, status, output))
         if len(output) == 1 and "-- No entries --" in output:
-            raise ValueError("List of units to match: %s, returned no entries"
+            raise ValueError('List of units to match: %s, returned no entries'
                     % l_match_units)
         return output
 
 class SystemdBasicTests(SystemdTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_systemd_basic(self):
-        self.systemctl('--version')
-
-    @testcase(551)
-    @skipUnlessPassed('test_systemd_basic')
-    def test_systemd_list(self):
-        self.systemctl('list-unit-files')
-
     def settle(self):
         """
         Block until systemd has finished activating any units being activated,
@@ -70,7 +61,6 @@ class SystemdBasicTests(SystemdTest):
         activating, or (False, message string) if there are still units
         activating (generally, failing units that restart).
         """
-        import time
         endtime = time.time() + (60 * 2)
         while True:
             status, output = self.target.run('systemctl --state=activating')
@@ -80,55 +70,65 @@ class SystemdBasicTests(SystemdTest):
                 return (False, output)
             time.sleep(10)
 
-    @testcase(550)
-    @skipUnlessPassed('test_systemd_basic')
+    @skipIfNotFeature('systemd',
+                      'Test requires systemd to be in DISTRO_FEATURES')
+    @skipIfNotDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
+                      'systemd is not the init manager for this image')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_systemd_basic(self):
+        self.systemctl('--version')
+
+    @OETestID(551)
+    @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
+    def test_systemd_list(self):
+        self.systemctl('list-unit-files')
+
+    @OETestID(550)
+    @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     def test_systemd_failed(self):
         settled, output = self.settle()
-        self.assertTrue(settled, msg="Timed out waiting for systemd to settle:\n" + output)
+        msg = "Timed out waiting for systemd to settle:\n%s" % output
+        self.assertTrue(settled, msg=msg)
 
         output = self.systemctl('list-units', '--failed')
-        match = re.search("0 loaded units listed", output)
+        match = re.search('0 loaded units listed', output)
         if not match:
             output += self.systemctl('status --full --failed')
-        self.assertTrue(match, msg="Some systemd units failed:\n%s" % output)
+        self.assertTrue(match, msg='Some systemd units failed:\n%s' % output)
 
 
 class SystemdServiceTests(SystemdTest):
 
-    def check_for_avahi(self):
-        if not self.hasPackage('avahi-daemon'):
-            raise unittest.SkipTest("Testcase dependency not met: need avahi-daemon installed on target")
-
-    @skipUnlessPassed('test_systemd_basic')
+    @OEHasPackage(['avahi-daemon'])
+    @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     def test_systemd_status(self):
-        self.check_for_avahi()
         self.systemctl('status --full', 'avahi-daemon.service')
 
-    @testcase(695)
-    @skipUnlessPassed('test_systemd_status')
+    @OETestID(695)
+    @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
     def test_systemd_stop_start(self):
-        self.check_for_avahi()
         self.systemctl('stop', 'avahi-daemon.service')
-        self.systemctl('is-active', 'avahi-daemon.service', expected=3, verbose=True)
+        self.systemctl('is-active', 'avahi-daemon.service',
+                       expected=3, verbose=True)
         self.systemctl('start','avahi-daemon.service')
         self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
 
-    @testcase(696)
-    @skipUnlessPassed('test_systemd_basic')
+    @OETestID(696)
+    @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
     def test_systemd_disable_enable(self):
-        self.check_for_avahi()
         self.systemctl('disable', 'avahi-daemon.service')
         self.systemctl('is-enabled', 'avahi-daemon.service', expected=1)
         self.systemctl('enable', 'avahi-daemon.service')
         self.systemctl('is-enabled', 'avahi-daemon.service')
 
 class SystemdJournalTests(SystemdTest):
-    @skipUnlessPassed('test_ssh')
+
+    @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     def test_systemd_journal(self):
-        (status, output) = self.target.run('journalctl')
+        status, output = self.target.run('journalctl')
         self.assertEqual(status, 0, output)
 
-    @skipUnlessPassed('test_systemd_basic')
+    @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     def test_systemd_boot_time(self, systemd_TimeoutStartSec=90):
         """
         Get the target boot time from journalctl and log it
@@ -138,41 +138,44 @@ class SystemdJournalTests(SystemdTest):
         unit start timeout to compare against
         """
 
-        # the expression chain that uniquely identifies the time boot message
-        expr_items=["Startup finished","kernel", "userspace","\.$"]
+        # The expression chain that uniquely identifies the time boot message.
+        expr_items=['Startup finished', 'kernel', 'userspace','\.$']
         try:
-            output = self.journalctl(args="-o cat --reverse")
+            output = self.journalctl(args='-o cat --reverse')
         except AssertionError:
-            self.fail("Error occurred while calling journalctl")
+            self.fail('Error occurred while calling journalctl')
         if not len(output):
-            self.fail("Error, unable to get startup time from systemd journal")
+            self.fail('Error, unable to get startup time from systemd journal')
 
-        # check for the regular expression items that match the startup time
+        # Check for the regular expression items that match the startup time.
         for line in output.split('\n'):
-            check_match = "".join(re.findall(".*".join(expr_items), line))
-            if check_match: break
-        # put the startup time in the test log
+            check_match = ''.join(re.findall('.*'.join(expr_items), line))
+            if check_match:
+                break
+        # Put the startup time in the test log
         if check_match:
-            print("%s" % check_match)
+            self.tc.logger.info('%s' % check_match)
         else:
-            self.skipTest("Error at obtaining the boot time from journalctl")
+            self.skipTest('Error at obtaining the boot time from journalctl')
         boot_time_sec = 0
 
-        # get the numeric values from the string and convert them to seconds
-        # same data will be placed in list and string for manipulation
-        l_boot_time = check_match.split(" ")[-2:]
-        s_boot_time = " ".join(l_boot_time)
+        # Get the numeric values from the string and convert them to seconds
+        # same data will be placed in list and string for manipulation.
+        l_boot_time = check_match.split(' ')[-2:]
+        s_boot_time = ' '.join(l_boot_time)
         try:
-            # Obtain the minutes it took to boot
+            # Obtain the minutes it took to boot.
             if l_boot_time[0].endswith('min') and l_boot_time[0][0].isdigit():
-                boot_time_min = s_boot_time.split("min")[0]
-                # convert to seconds and accumulate it
+                boot_time_min = s_boot_time.split('min')[0]
+                # Convert to seconds and accumulate it.
                 boot_time_sec += int(boot_time_min) * 60
-            # Obtain the seconds it took to boot and accumulate
-            boot_time_sec += float(l_boot_time[1].split("s")[0])
+            # Obtain the seconds it took to boot and accumulate.
+            boot_time_sec += float(l_boot_time[1].split('s')[0])
         except ValueError:
-            self.skipTest("Error when parsing time from boot string")
-        #Assert the target boot time against systemd's unit start timeout
+            self.skipTest('Error when parsing time from boot string')
+
+        # Assert the target boot time against systemd's unit start timeout.
         if boot_time_sec > systemd_TimeoutStartSec:
-            print("Target boot time %s exceeds systemd's TimeoutStartSec %s"\
-                    %(boot_time_sec, systemd_TimeoutStartSec))
+            msg = ("Target boot time %s exceeds systemd's TimeoutStartSec %s"
+                    % (boot_time_sec, systemd_TimeoutStartSec))
+            self.tc.logger.info(msg)
diff --git a/meta/lib/oeqa/runtime/cases/x32lib.py b/meta/lib/oeqa/runtime/cases/x32lib.py
new file mode 100644
index 0000000..8da0154
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/x32lib.py
@@ -0,0 +1,19 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotInDataVar
+
+class X32libTest(OERuntimeTestCase):
+
+    @skipIfNotInDataVar('DEFAULTTUNE', 'x86-64-x32',
+                        'DEFAULTTUNE is not set to x86-64-x32')
+    @OETestID(281)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_x32_file(self):
+        cmd = 'readelf -h /bin/ls | grep Class | grep ELF32'
+        status1 = self.target.run(cmd)[0]
+        cmd = 'readelf -h /bin/ls | grep Machine | grep X86-64'
+        status2 = self.target.run(cmd)[0]
+        msg = ("/bin/ls isn't an X86-64 ELF32 binary. readelf says: %s" % 
+                self.target.run("readelf -h /bin/ls")[1])
+        self.assertTrue(status1 == 0 and status2 == 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
new file mode 100644
index 0000000..2124813
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -0,0 +1,17 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotFeature
+
+class XorgTest(OERuntimeTestCase):
+
+    @OETestID(1151)
+    @skipIfNotFeature('x11-base',
+                      'Test requires x11 to be in IMAGE_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_xorg_running(self):
+        cmd ='%s | grep -v xinit | grep [X]org' % self.tc.target_cmds['ps']
+        status, output = self.target.run(cmd)
+        msg = ('Xorg does not appear to be running %s' %
+              self.target.run(self.tc.target_cmds['ps'])[1])
+        self.assertEqual(status, 0, msg=msg)
diff --git a/meta/lib/oeqa/runtime_cases/buildcvs.py b/meta/lib/oeqa/runtime_cases/buildcvs.py
deleted file mode 100644
index a5ca3a5..0000000
--- a/meta/lib/oeqa/runtime_cases/buildcvs.py
+++ /dev/null
@@ -1,32 +0,0 @@
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("tools-sdk"):
-        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
-
-class BuildCvsTest(oeRuntimeTest):
-
-    @classmethod
-    def setUpClass(self):
-        dl_dir = oeRuntimeTest.tc.d.getVar('DL_DIR', True)
-        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
-                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2",
-                        dl_dir=dl_dir)
-
-    @testcase(205)
-    @skipUnlessPassed("test_ssh")
-    def test_cvs(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
-
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
-
-        self.assertEqual(self.project.run_install(), 0,
-                        msg="Running make install failed")
-
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
diff --git a/meta/lib/oeqa/runtime_cases/buildgalculator.py b/meta/lib/oeqa/runtime_cases/buildgalculator.py
deleted file mode 100644
index 20f0a79..0000000
--- a/meta/lib/oeqa/runtime_cases/buildgalculator.py
+++ /dev/null
@@ -1,26 +0,0 @@
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("tools-sdk"):
-        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
-
-class GalculatorTest(oeRuntimeTest):
-    @testcase(1526)
-    @skipUnlessPassed("test_ssh")
-    def test_galculator(self):
-        dl_dir = oeRuntimeTest.tc.d.getVar('DL_DIR', True)
-        try:
-            project = TargetBuildProject(oeRuntimeTest.tc.target,
-                                      "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2",
-                                      dl_dir=dl_dir)
-            project.download_archive()
-
-            self.assertEqual(project.run_configure(), 0,
-                            msg="Running configure failed")
-
-            self.assertEqual(project.run_make(), 0,
-                            msg="Running make failed")
-        finally:
-            project.clean()
diff --git a/meta/lib/oeqa/runtime_cases/buildiptables.py b/meta/lib/oeqa/runtime_cases/buildiptables.py
deleted file mode 100644
index a0e82f0..0000000
--- a/meta/lib/oeqa/runtime_cases/buildiptables.py
+++ /dev/null
@@ -1,33 +0,0 @@
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("tools-sdk"):
-        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
-
-class BuildIptablesTest(oeRuntimeTest):
-
-    @classmethod
-    def setUpClass(self):
-        dl_dir = oeRuntimeTest.tc.d.getVar('DL_DIR', True)
-        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
-                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2",
-                        dl_dir=dl_dir)
-        self.project.download_archive()
-
-    @testcase(206)
-    @skipUnlessPassed("test_ssh")
-    def test_iptables(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
-
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
-
-        self.assertEqual(self.project.run_install(), 0,
-                        msg="Running make install failed")
-
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
diff --git a/meta/lib/oeqa/runtime_cases/connman.py b/meta/lib/oeqa/runtime_cases/connman.py
deleted file mode 100644
index 003fefe..0000000
--- a/meta/lib/oeqa/runtime_cases/connman.py
+++ /dev/null
@@ -1,31 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasPackage("connman"):
-        skipModule("No connman package in image")
-
-
-class ConnmanTest(oeRuntimeTest):
-
-    def service_status(self, service):
-        if oeRuntimeTest.hasFeature("systemd"):
-            (status, output) = self.target.run('systemctl status -l %s' % service)
-            return output
-        else:
-            return "Unable to get status or logs for %s" % service
-
-    @testcase(961)
-    @skipUnlessPassed('test_ssh')
-    def test_connmand_help(self):
-        (status, output) = self.target.run('/usr/sbin/connmand --help')
-        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
-
-    @testcase(221)
-    @skipUnlessPassed('test_connmand_help')
-    def test_connmand_running(self):
-        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
-        if status != 0:
-            print(self.service_status("connman"))
-            self.fail("No connmand process running")
diff --git a/meta/lib/oeqa/runtime_cases/date.py b/meta/lib/oeqa/runtime_cases/date.py
deleted file mode 100644
index 6f3516a..0000000
--- a/meta/lib/oeqa/runtime_cases/date.py
+++ /dev/null
@@ -1,31 +0,0 @@
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
-import re
-
-class DateTest(oeRuntimeTest):
-
-    def setUpLocal(self):
-        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager") == "systemd":
-            self.target.run('systemctl stop systemd-timesyncd')
-
-    def tearDownLocal(self):
-        if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager") == "systemd":
-            self.target.run('systemctl start systemd-timesyncd')
-
-    @testcase(211)
-    @skipUnlessPassed("test_ssh")
-    def test_date(self):
-        (status, output) = self.target.run('date +"%Y-%m-%d %T"')
-        self.assertEqual(status, 0, msg="Failed to get initial date, output: %s" % output)
-        oldDate = output
-
-        sampleDate = '"2016-08-09 10:00:00"'
-        (status, output) = self.target.run("date -s %s" % sampleDate)
-        self.assertEqual(status, 0, msg="Date set failed, output: %s" % output)
-
-        (status, output) = self.target.run("date -R")
-        p = re.match('Tue, 09 Aug 2016 10:00:.. \+0000', output)
-        self.assertTrue(p, msg="The date was not set correctly, output: %s" % output)
-
-        (status, output) = self.target.run('date -s "%s"' % oldDate)
-        self.assertEqual(status, 0, msg="Failed to reset date, output: %s" % output)
diff --git a/meta/lib/oeqa/runtime_cases/df.py b/meta/lib/oeqa/runtime_cases/df.py
deleted file mode 100644
index 09569d5..0000000
--- a/meta/lib/oeqa/runtime_cases/df.py
+++ /dev/null
@@ -1,12 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
-
-
-class DfTest(oeRuntimeTest):
-
-    @testcase(234)
-    @skipUnlessPassed("test_ssh")
-    def test_df(self):
-        (status,output) = self.target.run("df / | sed -n '2p' | awk '{print $4}'")
-        self.assertTrue(int(output)>5120, msg="Not enough space on image. Current size is %s" % output)
diff --git a/meta/lib/oeqa/runtime_cases/gcc.py b/meta/lib/oeqa/runtime_cases/gcc.py
deleted file mode 100644
index 6edb89f..0000000
--- a/meta/lib/oeqa/runtime_cases/gcc.py
+++ /dev/null
@@ -1,47 +0,0 @@
-import unittest
-import os
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("tools-sdk"):
-        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
-
-
-class GccCompileTest(oeRuntimeTest):
-
-    @classmethod
-    def setUpClass(self):
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.c"), "/tmp/test.c")
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "testmakefile"), "/tmp/testmakefile")
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.cpp"), "/tmp/test.cpp")
-
-    @testcase(203)
-    def test_gcc_compile(self):
-        (status, output) = self.target.run('gcc /tmp/test.c -o /tmp/test -lm')
-        self.assertEqual(status, 0, msg="gcc compile failed, output: %s" % output)
-        (status, output) = self.target.run('/tmp/test')
-        self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
-
-    @testcase(200)
-    def test_gpp_compile(self):
-        (status, output) = self.target.run('g++ /tmp/test.c -o /tmp/test -lm')
-        self.assertEqual(status, 0, msg="g++ compile failed, output: %s" % output)
-        (status, output) = self.target.run('/tmp/test')
-        self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
-
-    @testcase(1142)
-    def test_gpp2_compile(self):
-        (status, output) = self.target.run('g++ /tmp/test.cpp -o /tmp/test -lm')
-        self.assertEqual(status, 0, msg="g++ compile failed, output: %s" % output)
-        (status, output) = self.target.run('/tmp/test')
-        self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
-
-    @testcase(204)
-    def test_make(self):
-        (status, output) = self.target.run('cd /tmp; make -f testmakefile')
-        self.assertEqual(status, 0, msg="running make failed, output %s" % output)
-
-    @classmethod
-    def tearDownClass(self):
-        oeRuntimeTest.tc.target.run("rm /tmp/test.c /tmp/test.o /tmp/test /tmp/testmakefile")
diff --git a/meta/lib/oeqa/runtime_cases/kernelmodule.py b/meta/lib/oeqa/runtime_cases/kernelmodule.py
deleted file mode 100644
index 2ac1bc9..0000000
--- a/meta/lib/oeqa/runtime_cases/kernelmodule.py
+++ /dev/null
@@ -1,34 +0,0 @@
-import unittest
-import os
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("tools-sdk"):
-        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
-
-
-class KernelModuleTest(oeRuntimeTest):
-
-    def setUpLocal(self):
-        self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod.c"), "/tmp/hellomod.c")
-        self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod_makefile"), "/tmp/Makefile")
-
-    @testcase('1541')
-    @skipUnlessPassed('test_ssh')
-    @skipUnlessPassed('test_gcc_compile')
-    def test_kernel_module(self):
-        cmds = [
-            'cd /usr/src/kernel && make scripts',
-            'cd /tmp && make',
-            'cd /tmp && insmod hellomod.ko',
-            'lsmod | grep hellomod',
-            'dmesg | grep Hello',
-            'rmmod hellomod', 'dmesg | grep "Cleaning up hellomod"'
-            ]
-        for cmd in cmds:
-            (status, output) = self.target.run(cmd, 900)
-            self.assertEqual(status, 0, msg="\n".join([cmd, output]))
-
-    def tearDownLocal(self):
-        self.target.run('rm -f /tmp/Makefile /tmp/hellomod.c')
diff --git a/meta/lib/oeqa/runtime_cases/ldd.py b/meta/lib/oeqa/runtime_cases/ldd.py
deleted file mode 100644
index 47b3885..0000000
--- a/meta/lib/oeqa/runtime_cases/ldd.py
+++ /dev/null
@@ -1,21 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("tools-sdk"):
-        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
-
-class LddTest(oeRuntimeTest):
-
-    @testcase(962)
-    @skipUnlessPassed('test_ssh')
-    def test_ldd_exists(self):
-        (status, output) = self.target.run('which ldd')
-        self.assertEqual(status, 0, msg = "ldd does not exist in PATH: which ldd: %s" % output)
-
-    @testcase(239)
-    @skipUnlessPassed('test_ldd_exists')
-    def test_ldd_rtldlist_check(self):
-        (status, output) = self.target.run('for i in $(which ldd | xargs cat | grep "^RTLDLIST"|cut -d\'=\' -f2|tr -d \'"\'); do test -f $i && echo $i && break; done')
-        self.assertEqual(status, 0, msg = "ldd path not correct or RTLDLIST files don't exist. ")
diff --git a/meta/lib/oeqa/runtime_cases/logrotate.py b/meta/lib/oeqa/runtime_cases/logrotate.py
deleted file mode 100644
index 063280b5..0000000
--- a/meta/lib/oeqa/runtime_cases/logrotate.py
+++ /dev/null
@@ -1,30 +0,0 @@
-# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=289 testcase
-# Note that the image under test must have logrotate installed
-
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasPackage("logrotate"):
-        skipModule("No logrotate package in image")
-
-
-class LogrotateTest(oeRuntimeTest):
-
-    @testcase(1544)
-    @skipUnlessPassed("test_ssh")
-    def test_1_logrotate_setup(self):
-        (status, output) = self.target.run('mkdir $HOME/logrotate_dir')
-        self.assertEqual(status, 0, msg = "Could not create logrotate_dir. Output: %s" % output)
-        (status, output) = self.target.run("sed -i \"s#wtmp {#wtmp {\\n    olddir $HOME/logrotate_dir#\" /etc/logrotate.conf")
-        self.assertEqual(status, 0, msg = "Could not write to logrotate.conf file. Status and output: %s and %s)" % (status, output))
-
-    @testcase(1542)
-    @skipUnlessPassed("test_1_logrotate_setup")
-    def test_2_logrotate(self):
-        (status, output) = self.target.run('logrotate -f /etc/logrotate.conf')
-        self.assertEqual(status, 0, msg = "logrotate service could not be reloaded. Status and output: %s and %s" % (status, output))
-        output = self.target.run('ls -la $HOME/logrotate_dir/ | wc -l')[1]
-        self.assertTrue(int(output)>=3, msg = "new logfile could not be created. List of files within log directory: %s" %(self.target.run('ls -la $HOME/logrotate_dir')[1]))
-        self.target.run('rm -rf $HOME/logrotate_dir')
diff --git a/meta/lib/oeqa/runtime_cases/multilib.py b/meta/lib/oeqa/runtime_cases/multilib.py
deleted file mode 100644
index 5cce24f..0000000
--- a/meta/lib/oeqa/runtime_cases/multilib.py
+++ /dev/null
@@ -1,42 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    multilibs = oeRuntimeTest.tc.d.getVar("MULTILIBS") or ""
-    if "multilib:lib32" not in multilibs:
-        skipModule("this isn't a multilib:lib32 image")
-
-
-class MultilibTest(oeRuntimeTest):
-
-    def archtest(self, binary, arch):
-        """
-        Check that ``binary`` has the ELF class ``arch`` (e.g. ELF32/ELF64).
-        """
-
-        (status, output) = self.target.run("readelf -h %s" % binary)
-        self.assertEqual(status, 0, "Failed to readelf %s" % binary)
-
-        l = [l.split()[1] for l in output.split('\n') if "Class:" in l]
-        if l:
-            theclass = l[0]
-        else:
-            self.fail("Cannot parse readelf output\n" + s)
-
-        self.assertEqual(theclass, arch, msg="%s isn't %s (is %s)" % (binary, arch, theclass))
-
-    @skipUnlessPassed('test_ssh')
-    def test_check_multilib_libc(self):
-        """
-        Check that a multilib image has both 32-bit and 64-bit libc in.
-        """
-        self.archtest("/lib/libc.so.6", "ELF32")
-        self.archtest("/lib64/libc.so.6", "ELF64")
-
-    @testcase('279')
-    @skipUnlessPassed('test_check_multilib_libc')
-    def test_file_connman(self):
-        self.assertTrue(oeRuntimeTest.hasPackage('lib32-connman'), msg="This test assumes lib32-connman is installed")
-
-        self.archtest("/usr/sbin/connmand", "ELF32")
diff --git a/meta/lib/oeqa/runtime_cases/pam.py b/meta/lib/oeqa/runtime_cases/pam.py
deleted file mode 100644
index b7f2dfa..0000000
--- a/meta/lib/oeqa/runtime_cases/pam.py
+++ /dev/null
@@ -1,25 +0,0 @@
-# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=287 testcase
-# Note that the image under test must have "pam" in DISTRO_FEATURES
-
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("pam"):
-        skipModule("target doesn't have 'pam' in DISTRO_FEATURES")
-
-
-class PamBasicTest(oeRuntimeTest):
-
-    @testcase(1543)
-    @skipUnlessPassed('test_ssh')
-    def test_pam(self):
-        (status, output) = self.target.run('login --help')
-        self.assertEqual(status, 1, msg = "login command does not work as expected. Status and output:%s and %s" %(status, output))
-        (status, output) = self.target.run('passwd --help')
-        self.assertEqual(status, 0, msg = "passwd command does not work as expected. Status and output:%s and %s" %(status, output))
-        (status, output) = self.target.run('su --help')
-        self.assertEqual(status, 0, msg = "su command does not work as expected. Status and output:%s and %s" %(status, output))
-        (status, output) = self.target.run('useradd --help')
-        self.assertEqual(status, 0, msg = "useradd command does not work as expected. Status and output:%s and %s" %(status, output))
diff --git a/meta/lib/oeqa/runtime_cases/perl.py b/meta/lib/oeqa/runtime_cases/perl.py
deleted file mode 100644
index 6bf98f1..0000000
--- a/meta/lib/oeqa/runtime_cases/perl.py
+++ /dev/null
@@ -1,30 +0,0 @@
-import unittest
-import os
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasPackage("perl"):
-        skipModule("No perl package in the image")
-
-
-class PerlTest(oeRuntimeTest):
-
-    @classmethod
-    def setUpClass(self):
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.pl"), "/tmp/test.pl")
-
-    @testcase(1141)
-    def test_perl_exists(self):
-        (status, output) = self.target.run('which perl')
-        self.assertEqual(status, 0, msg="Perl binary not in PATH or not on target.")
-
-    @testcase(208)
-    def test_perl_works(self):
-        (status, output) = self.target.run('perl /tmp/test.pl')
-        self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
-        self.assertEqual(output, "the value of a is 0.01", msg="Incorrect output: %s" % output)
-
-    @classmethod
-    def tearDownClass(self):
-        oeRuntimeTest.tc.target.run("rm /tmp/test.pl")
diff --git a/meta/lib/oeqa/runtime_cases/ping.py b/meta/lib/oeqa/runtime_cases/ping.py
deleted file mode 100644
index 0f27447..0000000
--- a/meta/lib/oeqa/runtime_cases/ping.py
+++ /dev/null
@@ -1,22 +0,0 @@
-import subprocess
-import unittest
-import sys
-import time
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
-
-class PingTest(oeRuntimeTest):
-
-    @testcase(964)
-    def test_ping(self):
-        output = ''
-        count = 0
-        endtime = time.time() + 60
-        while count < 5 and time.time() < endtime:
-            proc = subprocess.Popen("ping -c 1 %s" % self.target.ip, shell=True, stdout=subprocess.PIPE)
-            output += proc.communicate()[0].decode("utf-8")
-            if proc.poll() == 0:
-                count += 1
-            else:
-                count = 0
-        self.assertEqual(count, 5, msg = "Expected 5 consecutive replies, got %d.\nping output is:\n%s" % (count,output))
diff --git a/meta/lib/oeqa/runtime_cases/python.py b/meta/lib/oeqa/runtime_cases/python.py
deleted file mode 100644
index 93e822c..0000000
--- a/meta/lib/oeqa/runtime_cases/python.py
+++ /dev/null
@@ -1,35 +0,0 @@
-import unittest
-import os
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasPackage("python-core"):
-        skipModule("No python package in the image")
-
-
-class PythonTest(oeRuntimeTest):
-
-    @classmethod
-    def setUpClass(self):
-        oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.corefilesdir, "test.py"), "/tmp/test.py")
-
-    @testcase(1145)
-    def test_python_exists(self):
-        (status, output) = self.target.run('which python')
-        self.assertEqual(status, 0, msg="Python binary not in PATH or not on target.")
-
-    @testcase(965)
-    def test_python_stdout(self):
-        (status, output) = self.target.run('python /tmp/test.py')
-        self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
-        self.assertEqual(output, "the value of a is 0.01", msg="Incorrect output: %s" % output)
-
-    @testcase(1146)
-    def test_python_testfile(self):
-        (status, output) = self.target.run('ls /tmp/testfile.python')
-        self.assertEqual(status, 0, msg="Python test file generate failed.")
-
-    @classmethod
-    def tearDownClass(self):
-        oeRuntimeTest.tc.target.run("rm /tmp/test.py /tmp/testfile.python")
diff --git a/meta/lib/oeqa/runtime_cases/rpm.py b/meta/lib/oeqa/runtime_cases/rpm.py
deleted file mode 100644
index f1c4763..0000000
--- a/meta/lib/oeqa/runtime_cases/rpm.py
+++ /dev/null
@@ -1,120 +0,0 @@
-import unittest
-import os
-import fnmatch
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("package-management"):
-            skipModule("rpm module skipped: target doesn't have package-management in IMAGE_FEATURES")
-    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").split()[0]:
-            skipModule("rpm module skipped: target doesn't have rpm as primary package manager")
-
-
-class RpmBasicTest(oeRuntimeTest):
-
-    @testcase(960)
-    @skipUnlessPassed('test_ssh')
-    def test_rpm_help(self):
-        (status, output) = self.target.run('rpm --help')
-        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
-
-    @testcase(191)
-    @skipUnlessPassed('test_rpm_help')
-    def test_rpm_query(self):
-        (status, output) = self.target.run('rpm -q rpm')
-        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
-
-class RpmInstallRemoveTest(oeRuntimeTest):
-
-    @classmethod
-    def setUpClass(self):
-        pkgarch = oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH').replace("-", "_")
-        rpmdir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR'), "rpm", pkgarch)
-        # pick rpm-doc as a test file to get installed, because it's small and it will always be built for standard targets
-        for f in fnmatch.filter(os.listdir(rpmdir), "rpm-doc-*.%s.rpm" % pkgarch):
-            testrpmfile = f
-        oeRuntimeTest.tc.target.copy_to(os.path.join(rpmdir,testrpmfile), "/tmp/rpm-doc.rpm")
-
-    @testcase(192)
-    @skipUnlessPassed('test_rpm_help')
-    def test_rpm_install(self):
-        (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
-        self.assertEqual(status, 0, msg="Failed to install rpm-doc package: %s" % output)
-
-    @testcase(194)
-    @skipUnlessPassed('test_rpm_install')
-    def test_rpm_remove(self):
-        (status,output) = self.target.run('rpm -e rpm-doc')
-        self.assertEqual(status, 0, msg="Failed to remove rpm-doc package: %s" % output)
-
-    @testcase(1096)
-    @skipUnlessPassed('test_ssh')
-    def test_rpm_query_nonroot(self):
-
-        def set_up_test_user(u):
-            (status, output) = self.target.run("id -u %s" % u)
-            if status == 0:
-                pass
-            else:
-                (status, output) = self.target.run("useradd %s" % u)
-                self.assertTrue(status == 0, msg="Failed to create new user: " + output)
-
-        def exec_as_test_user(u):
-            (status, output) = self.target.run("su -c id %s" % u)
-            self.assertTrue("({0})".format(u) in output, msg="Failed to execute as new user")
-            (status, output) = self.target.run("su -c \"rpm -qa\" %s " % u)
-            self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa: %s" % (status, output))
-
-        def unset_up_test_user(u):
-            (status, output) = self.target.run("userdel -r %s" % u)
-            self.assertTrue(status == 0, msg="Failed to erase user: %s" % output)
-
-        tuser = 'test1'
-
-        try:
-            set_up_test_user(tuser)
-            exec_as_test_user(tuser)
-        finally:
-            unset_up_test_user(tuser)
-
-    @testcase(195)
-    @skipUnlessPassed('test_rpm_install')
-    def test_check_rpm_install_removal_log_file_size(self):
-        """
-        Summary:     Check rpm install/removal log file size
-        Expected:    There should be some method to keep rpm log in a small size .
-        Product:     BSPs
-        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-        db_files_cmd = 'ls /var/lib/rpm/__db.*'
-        get_log_size_cmd = "du /var/lib/rpm/log/log.* | awk '{print $1}'"
-
-        # Make sure that some database files are under /var/lib/rpm as '__db.xxx'
-        (status, output) = self.target.run(db_files_cmd)
-        self.assertEqual(0, status, 'Failed to find database files under /var/lib/rpm/ as __db.xxx')
-
-        # Remove the package just in case
-        self.target.run('rpm -e rpm-doc')
-
-        # Install/Remove a package 10 times
-        for i in range(10):
-            (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
-            self.assertEqual(0, status, "Failed to install rpm-doc package. Reason: {}".format(output))
-
-            (status, output) = self.target.run('rpm -e rpm-doc')
-            self.assertEqual(0, status, "Failed to remove rpm-doc package. Reason: {}".format(output))
-
-        # Get the size of log file
-        (status, output) = self.target.run(get_log_size_cmd)
-        self.assertEqual(0, status, 'Failed to get the final size of the log file.')
-
-        # Compare each log size
-        for log_file_size in output:
-            self.assertLessEqual(int(log_file_size), 11264,
-                                   'Log file size is greater that expected (~10MB), found {} bytes'.format(log_file_size))
-
-    @classmethod
-    def tearDownClass(self):
-        oeRuntimeTest.tc.target.run('rm -f /tmp/rpm-doc.rpm')
diff --git a/meta/lib/oeqa/runtime_cases/scanelf.py b/meta/lib/oeqa/runtime_cases/scanelf.py
deleted file mode 100644
index 67e02ff..0000000
--- a/meta/lib/oeqa/runtime_cases/scanelf.py
+++ /dev/null
@@ -1,28 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasPackage("pax-utils"):
-        skipModule("pax-utils package not installed")
-
-class ScanelfTest(oeRuntimeTest):
-
-    def setUpLocal(self):
-        self.scancmd = 'scanelf --quiet --recursive --mount --ldpath --path'
-
-    @testcase(966)
-    @skipUnlessPassed('test_ssh')
-    def test_scanelf_textrel(self):
-        # print TEXTREL information
-        self.scancmd += " --textrel"
-        (status, output) = self.target.run(self.scancmd)
-        self.assertEqual(output.strip(), "", "\n".join([self.scancmd, output]))
-
-    @testcase(967)
-    @skipUnlessPassed('test_ssh')
-    def test_scanelf_rpath(self):
-        # print RPATH information
-        self.scancmd += " --rpath"
-        (status, output) = self.target.run(self.scancmd)
-        self.assertEqual(output.strip(), "", "\n".join([self.scancmd, output]))
diff --git a/meta/lib/oeqa/runtime_cases/scp.py b/meta/lib/oeqa/runtime_cases/scp.py
deleted file mode 100644
index cf36cfa..0000000
--- a/meta/lib/oeqa/runtime_cases/scp.py
+++ /dev/null
@@ -1,22 +0,0 @@
-import os
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import skipUnlessPassed, testcase
-
-def setUpModule():
-    if not (oeRuntimeTest.hasPackage("dropbear") or oeRuntimeTest.hasPackage("openssh-sshd")):
-        skipModule("No ssh package in image")
-
-class ScpTest(oeRuntimeTest):
-
-    @testcase(220)
-    @skipUnlessPassed('test_ssh')
-    def test_scp_file(self):
-        test_log_dir = oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR")
-        test_file_path = os.path.join(test_log_dir, 'test_scp_file')
-        with open(test_file_path, 'w') as test_scp_file:
-            test_scp_file.seek(2 ** 22 - 1)
-            test_scp_file.write(os.linesep)
-        (status, output) = self.target.copy_to(test_file_path, '/tmp/test_scp_file')
-        self.assertEqual(status, 0, msg = "File could not be copied. Output: %s" % output)
-        (status, output) = self.target.run("ls -la /tmp/test_scp_file")
-        self.assertEqual(status, 0, msg = "SCP test failed")
diff --git a/meta/lib/oeqa/runtime_cases/skeletoninit.py b/meta/lib/oeqa/runtime_cases/skeletoninit.py
deleted file mode 100644
index cb0cb9b..0000000
--- a/meta/lib/oeqa/runtime_cases/skeletoninit.py
+++ /dev/null
@@ -1,29 +0,0 @@
-# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=284 testcase
-# Note that the image under test must have meta-skeleton layer in bblayers and IMAGE_INSTALL_append = " service" in local.conf
-
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasPackage("service"):
-        skipModule("No service package in image")
-
-
-class SkeletonBasicTest(oeRuntimeTest):
-
-    @skipUnlessPassed('test_ssh')
-    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False), "Not appropiate for systemd image")
-    def test_skeleton_availability(self):
-        (status, output) = self.target.run('ls /etc/init.d/skeleton')
-        self.assertEqual(status, 0, msg = "skeleton init script not found. Output:\n%s " % output)
-        (status, output) =  self.target.run('ls /usr/sbin/skeleton-test')
-        self.assertEqual(status, 0, msg = "skeleton-test not found. Output:\n%s" % output)
-
-    @testcase(284)
-    @skipUnlessPassed('test_skeleton_availability')
-    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False), "Not appropiate for systemd image")
-    def test_skeleton_script(self):
-        output1 = self.target.run("/etc/init.d/skeleton start")[1]
-        (status, output2) = self.target.run(oeRuntimeTest.pscmd + ' | grep [s]keleton-test')
-        self.assertEqual(status, 0, msg = "Skeleton script could not be started:\n%s\n%s" % (output1, output2))
diff --git a/meta/lib/oeqa/runtime_cases/ssh.py b/meta/lib/oeqa/runtime_cases/ssh.py
deleted file mode 100644
index 0e76d5d..0000000
--- a/meta/lib/oeqa/runtime_cases/ssh.py
+++ /dev/null
@@ -1,19 +0,0 @@
-import subprocess
-import unittest
-import sys
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not (oeRuntimeTest.hasPackage("dropbear") or oeRuntimeTest.hasPackage("openssh")):
-        skipModule("No ssh package in image")
-
-class SshTest(oeRuntimeTest):
-
-    @testcase(224)
-    @skipUnlessPassed('test_ping')
-    def test_ssh(self):
-        (status, output) = self.target.run('uname -a')
-        self.assertEqual(status, 0, msg="SSH Test failed: %s" % output)
-        (status, output) = self.target.run('cat /etc/masterimage')
-        self.assertEqual(status, 1, msg="This isn't the right image  - /etc/masterimage shouldn't be here %s" % output)
diff --git a/meta/lib/oeqa/runtime_cases/syslog.py b/meta/lib/oeqa/runtime_cases/syslog.py
deleted file mode 100644
index 8f55032..0000000
--- a/meta/lib/oeqa/runtime_cases/syslog.py
+++ /dev/null
@@ -1,52 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not (oeRuntimeTest.hasPackage("busybox-syslog") or oeRuntimeTest.hasPackage("sysklogd")):
-        skipModule("No syslog package in image")
-
-class SyslogTest(oeRuntimeTest):
-
-    @testcase(201)
-    def test_syslog_running(self):
-        (status,output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [s]yslogd')
-        self.assertEqual(status, 0, msg="no syslogd process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
-
-class SyslogTestConfig(oeRuntimeTest):
-
-    @testcase(1149)
-    @skipUnlessPassed("test_syslog_running")
-    def test_syslog_logger(self):
-        (status, output) = self.target.run('logger foobar')
-        self.assertEqual(status, 0, msg="Can't log into syslog. Output: %s " % output)
-
-        (status, output) = self.target.run('grep foobar /var/log/messages')
-        if status != 0:
-            if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", "") == "systemd":
-                (status, output) = self.target.run('journalctl -o cat | grep foobar')
-            else:
-                (status, output) = self.target.run('logread | grep foobar')
-        self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages or logread. Output: %s " % output)
-
-    @testcase(1150)
-    @skipUnlessPassed("test_syslog_running")
-    def test_syslog_restart(self):
-        if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False):
-            (status,output) = self.target.run('/etc/init.d/syslog restart')
-        else:
-            (status,output) = self.target.run('systemctl restart syslog.service')
-
-    @testcase(202)
-    @skipUnlessPassed("test_syslog_restart")
-    @skipUnlessPassed("test_syslog_logger")
-    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False), "Not appropiate for systemd image")
-    @unittest.skipIf(oeRuntimeTest.hasPackage("sysklogd") or not oeRuntimeTest.hasPackage("busybox"), "Non-busybox syslog")
-    def test_syslog_startup_config(self):
-        self.target.run('echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf')
-        (status,output) = self.target.run('/etc/init.d/syslog restart')
-        self.assertEqual(status, 0, msg="Could not restart syslog service. Status and output: %s and %s" % (status,output))
-        (status,output) = self.target.run('logger foobar && grep foobar /var/log/test')
-        self.assertEqual(status, 0, msg="Test log string not found. Output: %s " % output)
-        self.target.run("sed -i 's#LOGFILE=/var/log/test##' /etc/syslog-startup.conf")
-        self.target.run('/etc/init.d/syslog restart')
diff --git a/meta/lib/oeqa/runtime_cases/x32lib.py b/meta/lib/oeqa/runtime_cases/x32lib.py
deleted file mode 100644
index 2f98dbf..0000000
--- a/meta/lib/oeqa/runtime_cases/x32lib.py
+++ /dev/null
@@ -1,18 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-        #check if DEFAULTTUNE is set and it's value is: x86-64-x32
-        defaulttune = oeRuntimeTest.tc.d.getVar("DEFAULTTUNE")
-        if "x86-64-x32" not in defaulttune:
-            skipModule("DEFAULTTUNE is not set to x86-64-x32")
-
-class X32libTest(oeRuntimeTest):
-
-    @testcase(281)
-    @skipUnlessPassed("test_ssh")
-    def test_x32_file(self):
-        status1 = self.target.run("readelf -h /bin/ls | grep Class | grep ELF32")[0]
-        status2 = self.target.run("readelf -h /bin/ls | grep Machine | grep X86-64")[0]
-        self.assertTrue(status1 == 0 and status2 == 0, msg="/bin/ls isn't an X86-64 ELF32 binary. readelf says: %s" % self.target.run("readelf -h /bin/ls")[1])
diff --git a/meta/lib/oeqa/runtime_cases/xorg.py b/meta/lib/oeqa/runtime_cases/xorg.py
deleted file mode 100644
index 12bcd37..0000000
--- a/meta/lib/oeqa/runtime_cases/xorg.py
+++ /dev/null
@@ -1,16 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("x11-base"):
-            skipModule("target doesn't have x11 in IMAGE_FEATURES")
-
-
-class XorgTest(oeRuntimeTest):
-
-    @testcase(1151)
-    @skipUnlessPassed('test_ssh')
-    def test_xorg_running(self):
-        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' |  grep -v xinit | grep [X]org')
-        self.assertEqual(status, 0, msg="Xorg does not appear to be running %s" % self.target.run(oeRuntimeTest.pscmd)[1])
-- 
2.1.4


