Return-Path: <georgex.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C63977018E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 09:06:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2014 02:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,729,1400050800"; d="scan'208";a="575293468"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2014 02:06:02 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 7592C6A408F;
	Fri, 25 Jul 2014 02:05:24 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 12:02:30 +0300
Message-Id: <1406278950-15959-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oeqa/rutime: Added testcase decorators for automated runtime tests. Also added LogResults decorator for oeTest class in oetest.py
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
X-List-Received-Date: Fri, 25 Jul 2014 09:06:35 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/oetest.py                |  2 ++
 meta/lib/oeqa/runtime/buildcvs.py      |  1 +
 meta/lib/oeqa/runtime/buildiptables.py |  1 +
 meta/lib/oeqa/runtime/buildsudoku.py   |  1 +
 meta/lib/oeqa/runtime/connman.py       |  2 +-
 meta/lib/oeqa/runtime/date.py          |  1 +
 meta/lib/oeqa/runtime/df.py            |  1 +
 meta/lib/oeqa/runtime/dmesg.py         |  1 +
 meta/lib/oeqa/runtime/gcc.py           |  3 +++
 meta/lib/oeqa/runtime/kernelmodule.py  |  1 +
 meta/lib/oeqa/runtime/ldd.py           |  1 +
 meta/lib/oeqa/runtime/logrotate.py     |  1 +
 meta/lib/oeqa/runtime/multilib.py      |  1 +
 meta/lib/oeqa/runtime/pam.py           |  1 +
 meta/lib/oeqa/runtime/perl.py          |  1 +
 meta/lib/oeqa/runtime/python.py        |  1 +
 meta/lib/oeqa/runtime/rpm.py           |  3 +++
 meta/lib/oeqa/runtime/scanelf.py       |  2 ++
 meta/lib/oeqa/runtime/scp.py           |  3 ++-
 meta/lib/oeqa/runtime/skeletoninit.py  |  1 +
 meta/lib/oeqa/runtime/smart.py         | 11 +++++++++++
 meta/lib/oeqa/runtime/ssh.py           |  1 +
 meta/lib/oeqa/runtime/syslog.py        |  2 ++
 meta/lib/oeqa/runtime/systemd.py       |  4 ++++
 meta/lib/oeqa/runtime/vnc.py           |  1 +
 meta/lib/oeqa/runtime/x32lib.py        |  1 +
 meta/lib/oeqa/runtime/xorg.py          |  1 +
 27 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index ecb8e53..dcbd498 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -10,6 +10,7 @@
 import os, re, mmap
 import unittest
 import inspect
+from oeqa.utils.decorators import LogResults
 
 def loadTests(tc):
 
@@ -35,6 +36,7 @@ def runTests(tc):
 
     return result
 
+@LogResults
 class oeTest(unittest.TestCase):
 
     longMessage = True
diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
index 6201ed1..fe6cbfb 100644
--- a/meta/lib/oeqa/runtime/buildcvs.py
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -14,6 +14,7 @@ class BuildCvsTest(oeRuntimeTest):
                         "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
         self.project.download_archive()
 
+    @testcase(205)
     @skipUnlessPassed("test_ssh")
     def test_cvs(self):
         self.assertEqual(self.project.run_configure(), 0,
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index c77b114..09e252d 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -14,6 +14,7 @@ class BuildIptablesTest(oeRuntimeTest):
                         "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
         self.project.download_archive()
 
+    @testcase(206)
     @skipUnlessPassed("test_ssh")
     def test_iptables(self):
         self.assertEqual(self.project.run_configure(), 0,
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
index f51af92..802b060 100644
--- a/meta/lib/oeqa/runtime/buildsudoku.py
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -14,6 +14,7 @@ class SudokuTest(oeRuntimeTest):
                         "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
         self.project.download_archive()
 
+    @testcase(207)
     @skipUnlessPassed("test_ssh")
     def test_sudoku(self):
         self.assertEqual(self.project.run_configure(), 0,
diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index c036882..cc537f7 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -21,7 +21,7 @@ class ConnmanTest(oeRuntimeTest):
         (status, output) = self.target.run('/usr/sbin/connmand --help')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
-
+    @testcase(221)
     @skipUnlessPassed('test_connmand_help')
     def test_connmand_running(self):
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
index a208e29..97e8ee4 100644
--- a/meta/lib/oeqa/runtime/date.py
+++ b/meta/lib/oeqa/runtime/date.py
@@ -4,6 +4,7 @@ import re
 
 class DateTest(oeRuntimeTest):
 
+    @testcase(211)
     @skipUnlessPassed("test_ssh")
     def test_date(self):
         (status, output) = self.target.run('date +"%Y-%m-%d %T"')
diff --git a/meta/lib/oeqa/runtime/df.py b/meta/lib/oeqa/runtime/df.py
index b6da350..09569d5 100644
--- a/meta/lib/oeqa/runtime/df.py
+++ b/meta/lib/oeqa/runtime/df.py
@@ -5,6 +5,7 @@ from oeqa.utils.decorators import *
 
 class DfTest(oeRuntimeTest):
 
+    @testcase(234)
     @skipUnlessPassed("test_ssh")
     def test_df(self):
         (status,output) = self.target.run("df / | sed -n '2p' | awk '{print $4}'")
diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
index 64247ea..43e16c3 100644
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ b/meta/lib/oeqa/runtime/dmesg.py
@@ -5,6 +5,7 @@ from oeqa.utils.decorators import *
 
 class DmesgTest(oeRuntimeTest):
 
+    @testcase(215)
     @skipUnlessPassed('test_ssh')
     def test_dmesg(self):
         (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -iv "dma timeout" | grep -i error')
diff --git a/meta/lib/oeqa/runtime/gcc.py b/meta/lib/oeqa/runtime/gcc.py
index b63badd..08b3cf1 100644
--- a/meta/lib/oeqa/runtime/gcc.py
+++ b/meta/lib/oeqa/runtime/gcc.py
@@ -15,18 +15,21 @@ class GccCompileTest(oeRuntimeTest):
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.c"), "/tmp/test.c")
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "testmakefile"), "/tmp/testmakefile")
 
+    @testcase(203)
     def test_gcc_compile(self):
         (status, output) = self.target.run('gcc /tmp/test.c -o /tmp/test -lm')
         self.assertEqual(status, 0, msg="gcc compile failed, output: %s" % output)
         (status, output) = self.target.run('/tmp/test')
         self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
 
+    @testcase(200)
     def test_gpp_compile(self):
         (status, output) = self.target.run('g++ /tmp/test.c -o /tmp/test -lm')
         self.assertEqual(status, 0, msg="g++ compile failed, output: %s" % output)
         (status, output) = self.target.run('/tmp/test')
         self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
 
+    @testcase(204)
     def test_make(self):
         (status, output) = self.target.run('cd /tmp; make -f testmakefile')
         self.assertEqual(status, 0, msg="running make failed, output %s" % output)
diff --git a/meta/lib/oeqa/runtime/kernelmodule.py b/meta/lib/oeqa/runtime/kernelmodule.py
index cbc5742..2e81720 100644
--- a/meta/lib/oeqa/runtime/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/kernelmodule.py
@@ -14,6 +14,7 @@ class KernelModuleTest(oeRuntimeTest):
         self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod.c"), "/tmp/hellomod.c")
         self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod_makefile"), "/tmp/Makefile")
 
+    @testcase('316')
     @skipUnlessPassed('test_ssh')
     @skipUnlessPassed('test_gcc_compile')
     def test_kernel_module(self):
diff --git a/meta/lib/oeqa/runtime/ldd.py b/meta/lib/oeqa/runtime/ldd.py
index 079130f..bce56c4 100644
--- a/meta/lib/oeqa/runtime/ldd.py
+++ b/meta/lib/oeqa/runtime/ldd.py
@@ -13,6 +13,7 @@ class LddTest(oeRuntimeTest):
         (status, output) = self.target.run('which ldd')
         self.assertEqual(status, 0, msg = "ldd does not exist in PATH: which ldd: %s" % output)
 
+    @testcase(239)
     @skipUnlessPassed('test_ldd_exists')
     def test_ldd_rtldlist_check(self):
         (status, output) = self.target.run('for i in $(which ldd | xargs cat | grep "^RTLDLIST"|cut -d\'=\' -f2|tr -d \'"\'); do test -f $i && echo $i && break; done')
diff --git a/meta/lib/oeqa/runtime/logrotate.py b/meta/lib/oeqa/runtime/logrotate.py
index 80489a3..86d791c 100644
--- a/meta/lib/oeqa/runtime/logrotate.py
+++ b/meta/lib/oeqa/runtime/logrotate.py
@@ -19,6 +19,7 @@ class LogrotateTest(oeRuntimeTest):
         (status, output) = self.target.run("sed -i 's#wtmp {#wtmp {\\n    olddir /home/root/logrotate_dir#' /etc/logrotate.conf")
         self.assertEqual(status, 0, msg = "Could not write to logrotate.conf file. Status and output: %s and %s)" % (status, output))
 
+    @testcase(289)
     @skipUnlessPassed("test_1_logrotate_setup")
     def test_2_logrotate(self):
         (status, output) = self.target.run('logrotate -f /etc/logrotate.conf')
diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index 13a3b54..ab0a6cc 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -10,6 +10,7 @@ def setUpModule():
 
 class MultilibTest(oeRuntimeTest):
 
+    @testcase('279')
     @skipUnlessPassed('test_ssh')
     def test_file_connman(self):
         self.assertTrue(oeRuntimeTest.hasPackage('connman-gnome'), msg="This test assumes connman-gnome is installed")
diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime/pam.py
index c26e6ea..ae50f79 100644
--- a/meta/lib/oeqa/runtime/pam.py
+++ b/meta/lib/oeqa/runtime/pam.py
@@ -12,6 +12,7 @@ def setUpModule():
 
 class PamBasicTest(oeRuntimeTest):
 
+    @testcase(287)
     @skipUnlessPassed('test_ssh')
     def test_pam(self):
         (status, output) = self.target.run('login --help')
diff --git a/meta/lib/oeqa/runtime/perl.py b/meta/lib/oeqa/runtime/perl.py
index c9bb684..65da028 100644
--- a/meta/lib/oeqa/runtime/perl.py
+++ b/meta/lib/oeqa/runtime/perl.py
@@ -18,6 +18,7 @@ class PerlTest(oeRuntimeTest):
         (status, output) = self.target.run('which perl')
         self.assertEqual(status, 0, msg="Perl binary not in PATH or not on target.")
 
+    @testcase(208)
     def test_perl_works(self):
         (status, output) = self.target.run('perl /tmp/test.pl')
         self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
diff --git a/meta/lib/oeqa/runtime/python.py b/meta/lib/oeqa/runtime/python.py
index c037ab2..0387b9a 100644
--- a/meta/lib/oeqa/runtime/python.py
+++ b/meta/lib/oeqa/runtime/python.py
@@ -18,6 +18,7 @@ class PythonTest(oeRuntimeTest):
         (status, output) = self.target.run('which python')
         self.assertEqual(status, 0, msg="Python binary not in PATH or not on target.")
 
+    @testcase(965)
     def test_python_stdout(self):
         (status, output) = self.target.run('python /tmp/test.py')
         self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 084d22f..b17e8b4 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -18,6 +18,7 @@ class RpmBasicTest(oeRuntimeTest):
         (status, output) = self.target.run('rpm --help')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
+    @testcase(191)
     @skipUnlessPassed('test_rpm_help')
     def test_rpm_query(self):
         (status, output) = self.target.run('rpm -q rpm')
@@ -34,11 +35,13 @@ class RpmInstallRemoveTest(oeRuntimeTest):
             testrpmfile = f
         oeRuntimeTest.tc.target.copy_to(os.path.join(rpmdir,testrpmfile), "/tmp/rpm-doc.rpm")
 
+    @testcase(192)
     @skipUnlessPassed('test_rpm_help')
     def test_rpm_install(self):
         (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
         self.assertEqual(status, 0, msg="Failed to install rpm-doc package: %s" % output)
 
+    @testcase(194)
     @skipUnlessPassed('test_rpm_install')
     def test_rpm_remove(self):
         (status,output) = self.target.run('rpm -e rpm-doc')
diff --git a/meta/lib/oeqa/runtime/scanelf.py b/meta/lib/oeqa/runtime/scanelf.py
index b9abf24..43a024a 100644
--- a/meta/lib/oeqa/runtime/scanelf.py
+++ b/meta/lib/oeqa/runtime/scanelf.py
@@ -11,6 +11,7 @@ class ScanelfTest(oeRuntimeTest):
     def setUp(self):
         self.scancmd = 'scanelf --quiet --recursive --mount --ldpath --path'
 
+    @testcase(966)
     @skipUnlessPassed('test_ssh')
     def test_scanelf_textrel(self):
         # print TEXTREL information
@@ -18,6 +19,7 @@ class ScanelfTest(oeRuntimeTest):
         (status, output) = self.target.run(self.scancmd)
         self.assertEqual(output.strip(), "", "\n".join([self.scancmd, output]))
 
+    @testcase(967)
     @skipUnlessPassed('test_ssh')
     def test_scanelf_rpath(self):
         # print RPATH information
diff --git a/meta/lib/oeqa/runtime/scp.py b/meta/lib/oeqa/runtime/scp.py
index 03095bf..48e87d2 100644
--- a/meta/lib/oeqa/runtime/scp.py
+++ b/meta/lib/oeqa/runtime/scp.py
@@ -1,6 +1,6 @@
 import os
 from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import skipUnlessPassed
+from oeqa.utils.decorators import skipUnlessPassed, testcase
 
 def setUpModule():
     if not (oeRuntimeTest.hasPackage("dropbear") or oeRuntimeTest.hasPackage("openssh-sshd")):
@@ -8,6 +8,7 @@ def setUpModule():
 
 class ScpTest(oeRuntimeTest):
 
+    @testcase(220)
     @skipUnlessPassed('test_ssh')
     def test_scp_file(self):
         test_log_dir = oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True)
diff --git a/meta/lib/oeqa/runtime/skeletoninit.py b/meta/lib/oeqa/runtime/skeletoninit.py
index ddcad20..7c7f402 100644
--- a/meta/lib/oeqa/runtime/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/skeletoninit.py
@@ -20,6 +20,7 @@ class SkeletonBasicTest(oeRuntimeTest):
         (status, output) =  self.target.run('ls /usr/sbin/skeleton-test')
         self.assertEqual(status, 0, msg = "skeleton-test not found. Output:\n%s" % output)
 
+    @testcase(284)
     @skipUnlessPassed('test_skeleton_availability')
     @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
     def test_skeleton_script(self):
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 3130373..3b49314 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -25,6 +25,7 @@ class SmartTest(oeRuntimeTest):
 
 class SmartBasicTest(SmartTest):
 
+    @testcase(716)
     @skipUnlessPassed('test_ssh')
     def test_smart_help(self):
         self.smart('--help')
@@ -32,15 +33,19 @@ class SmartBasicTest(SmartTest):
     def test_smart_version(self):
         self.smart('--version')
 
+    @testcase(721)
     def test_smart_info(self):
         self.smart('info python-smartpm')
 
+    @testcase(421)
     def test_smart_query(self):
         self.smart('query python-smartpm')
 
+    @testcase(720)
     def test_smart_search(self):
         self.smart('search python-smartpm')
 
+    @testcase(722)
     def test_smart_stats(self):
         self.smart('stats')
 
@@ -58,6 +63,7 @@ class SmartRepoTest(SmartTest):
     def test_smart_channel(self):
         self.smart('channel', 1)
 
+    @testcase(719)
     def test_smart_channel_add(self):
         image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
         deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
@@ -76,6 +82,7 @@ class SmartRepoTest(SmartTest):
     def test_smart_channel_show(self):
         self.smart('channel --show')
 
+    @testcase(717)
     def test_smart_channel_rpmsys(self):
         self.smart('channel --show rpmsys')
         self.smart('channel --disable rpmsys')
@@ -86,17 +93,20 @@ class SmartRepoTest(SmartTest):
         self.smart('remove -y psplash-default')
         self.smart('install -y psplash-default')
 
+    @testcase(728)
     @skipUnlessPassed('test_smart_install')
     def test_smart_install_dependency(self):
         self.smart('remove -y psplash')
         self.smart('install -y psplash-default')
 
+    @testcase(723)
     @skipUnlessPassed('test_smart_channel_add')
     def test_smart_install_from_disk(self):
         self.smart('remove -y psplash-default')
         self.smart('download psplash-default')
         self.smart('install -y ./psplash-default*')
 
+    @testcase(725)
     @skipUnlessPassed('test_smart_channel_add')
     def test_smart_install_from_http(self):
         output = self.smart('download --urls psplash-default')
@@ -105,6 +115,7 @@ class SmartRepoTest(SmartTest):
         self.smart('remove -y psplash-default')
         self.smart('install -y %s' % url.group(0))
 
+    @testcase(729)
     @skipUnlessPassed('test_smart_install')
     def test_smart_reinstall(self):
         self.smart('reinstall -y psplash-default')
diff --git a/meta/lib/oeqa/runtime/ssh.py b/meta/lib/oeqa/runtime/ssh.py
index e648660..0e76d5d 100644
--- a/meta/lib/oeqa/runtime/ssh.py
+++ b/meta/lib/oeqa/runtime/ssh.py
@@ -10,6 +10,7 @@ def setUpModule():
 
 class SshTest(oeRuntimeTest):
 
+    @testcase(224)
     @skipUnlessPassed('test_ping')
     def test_ssh(self):
         (status, output) = self.target.run('uname -a')
diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index b95b361..7fa018e 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -13,6 +13,7 @@ class SyslogTest(oeRuntimeTest):
         (status,output) = self.target.run('/sbin/syslogd --help')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
+    @testcase(201)
     @skipUnlessPassed("test_syslog_help")
     def test_syslog_running(self):
         (status,output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [s]yslogd')
@@ -33,6 +34,7 @@ class SyslogTestConfig(oeRuntimeTest):
         else:
             (status,output) = self.target.run('systemctl restart syslog.service')
 
+    @testcase(202)
     @skipUnlessPassed("test_syslog_restart")
     @skipUnlessPassed("test_syslog_logger")
     @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 6de84f8..1451698 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -28,6 +28,7 @@ class SystemdBasicTests(SystemdTest):
     def test_systemd_basic(self):
         self.systemctl('--version')
 
+    @testcase(551)
     @skipUnlessPassed('test_system_basic')
     def test_systemd_list(self):
         self.systemctl('list-unit-files')
@@ -51,6 +52,7 @@ class SystemdBasicTests(SystemdTest):
                 return (False, output)
             time.sleep(10)
 
+    @testcase(550)
     @skipUnlessPassed('test_systemd_basic')
     def test_systemd_failed(self):
         settled, output = self.settle()
@@ -69,6 +71,7 @@ class SystemdServiceTests(SystemdTest):
     def test_systemd_status(self):
         self.systemctl('status --full', 'avahi-daemon.service')
 
+    @testcase(695)
     @skipUnlessPassed('test_systemd_status')
     def test_systemd_stop_start(self):
         self.systemctl('stop', 'avahi-daemon.service')
@@ -76,6 +79,7 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('start','avahi-daemon.service')
         self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
 
+    @testcase(696)
     @skipUnlessPassed('test_systemd_basic')
     def test_systemd_disable_enable(self):
         self.systemctl('disable', 'avahi-daemon.service')
diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
index 1b4652b..f31deff 100644
--- a/meta/lib/oeqa/runtime/vnc.py
+++ b/meta/lib/oeqa/runtime/vnc.py
@@ -7,6 +7,7 @@ def setUpModule():
 
 class VNCTest(oeRuntimeTest):
 
+    @testcase(213)
     @skipUnlessPassed('test_ssh')
     def test_vnc(self):
         (status, output) = self.target.run('x11vnc -display :0 -bg -o x11vnc.log')
diff --git a/meta/lib/oeqa/runtime/x32lib.py b/meta/lib/oeqa/runtime/x32lib.py
index 6bad201..ce5e214 100644
--- a/meta/lib/oeqa/runtime/x32lib.py
+++ b/meta/lib/oeqa/runtime/x32lib.py
@@ -10,6 +10,7 @@ def setUpModule():
 
 class X32libTest(oeRuntimeTest):
 
+    @testcase(281)
     @skipUnlessPassed("test_ssh")
     def test_x32_file(self):
         status1 = self.target.run("readelf -h /bin/ls | grep Class | grep ELF32")[0]
diff --git a/meta/lib/oeqa/runtime/xorg.py b/meta/lib/oeqa/runtime/xorg.py
index 12dccd8..7aa61ad 100644
--- a/meta/lib/oeqa/runtime/xorg.py
+++ b/meta/lib/oeqa/runtime/xorg.py
@@ -14,6 +14,7 @@ class XorgTest(oeRuntimeTest):
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' |  grep -v xinit | grep [X]org')
         self.assertEqual(status, 0, msg="Xorg does not appear to be running %s" % self.target.run(oeRuntimeTest.pscmd)[1])
 
+    @testcase(972)
     @skipUnlessPassed('test_ssh')
     def test_xorg_error(self):
         (status, output) = self.target.run('cat /var/log/Xorg.0.log | grep -v "(EE) error," | grep -v "PreInit" | grep -v "evdev:" | grep -v "glx" | grep "(EE)"')
-- 
1.9.1


