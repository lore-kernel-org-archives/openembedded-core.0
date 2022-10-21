Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969C4C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 09:01:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8011.1666342875497416963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 02:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eJHakAfw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7293d3371c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29L8tlmU026029
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=NKbHHWVCB7wCd+Pm1+5c4vx9buZS2WtDz1XqTWSMaWU=;
 b=eJHakAfwq1IO6n4EiAUsZyNDSOim052m5VKGbz4O8eA90fDqdqGzuG/+P8V3fgbyGgjx
 fsMAFN5OyK0ixfmg7w4ux4xHV9bVCT/CVmmIoD8cF/nRLefm05qvz4uGqSE6ymUWZ5ww
 jiKkEa/n45b+4WIGreYEiWmow64ZdVRacs9nm7xwuYEyQyJMgWCAJTPgOsVt3QBW8ikA
 vKWUnuO0H8fJd7BmEl/nzuw/V1/jxiGGM/eemQwIsx6LVaNYpviIkPxsTyqddpdbXQXW
 hM3jURryPwdSngqiMwdm8Rw3JBXS0vLYWOgN6IN1NkKZTlZXH/k8hXyBytviIeMzhXyj PQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kavuu1a30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:01:14 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 21 Oct 2022 02:01:13 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 21 Oct 2022 02:01:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-psutil: fix failures for running psutil.tests
Date: Fri, 21 Oct 2022 17:01:12 +0800
Message-ID: <20221021090112.2373113-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fH9yWc38ZfAUNjnTOwl8GeanmzEEfURr
X-Proofpoint-GUID: fH9yWc38ZfAUNjnTOwl8GeanmzEEfURr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_03,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172010

From: Changqing Li <changqing.li@windriver.com>

* Add RDEPENDS for package python3-psutil-tests to fix following error:
$ python3 -m psutil.tests
Traceback (most recent call last):
  File "/usr/lib/python3.10/runpy.py", line 187, in _run_module_as_main
    mod_name, mod_spec, code = _get_module_details(mod_name, _Error)
  File "/usr/lib/python3.10/runpy.py", line 146, in _get_module_details
    return _get_module_details(pkg_main_name, error)
  File "/usr/lib/python3.10/runpy.py", line 110, in _get_module_details
    __import__(pkg_name)
  File "/usr/lib/python3.10/site-packages/psutil/tests/__init__.py", line 35, in <module>
    import unittest
ModuleNotFoundError: No module named 'unittest'

* Skip some test cases not suitable for OE

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-fix-failure-test-cases.patch         | 195 ++++++++++++++++++
 .../python/python3-psutil_5.9.2.bb            |  10 +
 2 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch

diff --git a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
new file mode 100644
index 0000000000..d5e5fe99d1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
@@ -0,0 +1,195 @@
+From f6b9fda0942dfa7298d7bd3e1bc5d7bb64cf99ec Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 23 Feb 2022 11:54:40 +0800
+Subject: [PATCH] fix failure test cases
+
+The test cases is not robust enough. skip some cases that is
+not suitable for all conditions.
+
+* test_io_counters failed when kernel config CONFIG_TASKSTATS
+  and CONFIG_TASK_IO_ACCOUNTING are not enable in OE
+* test_setup_script failed since oe don't install setup.py
+* test_used failed since oe use git source for free, so the version
+  is 3.3.17-dirty
+* test_weird_environ failed since gcc not installed
+* test_debug failed since it is designed to run when PSUTIL_DEBUG is set
+* test_against_findmnt/test_comparisons/test_disk_partitions_mocked/
+  test_disk_partitions is not suitable for Linux nfs boot
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ psutil/tests/test_contracts.py | 1 +
+ psutil/tests/test_linux.py     | 8 ++++++--
+ psutil/tests/test_misc.py      | 4 ++++
+ psutil/tests/test_process.py   | 5 +++++
+ psutil/tests/test_system.py    | 1 +
+ psutil/tests/test_unicode.py   | 4 +++-
+ 6 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/psutil/tests/test_contracts.py b/psutil/tests/test_contracts.py
+index 0d90066..8502f0c 100755
+--- a/psutil/tests/test_contracts.py
++++ b/psutil/tests/test_contracts.py
+@@ -172,6 +172,7 @@ class TestAvailProcessAPIs(PsutilTestCase):
+     def test_rlimit(self):
+         self.assertEqual(hasattr(psutil.Process, "rlimit"), LINUX or FREEBSD)
+ 
++    @unittest.skip("broken on OE since kernel config maye not be enabled")
+     def test_io_counters(self):
+         hasit = hasattr(psutil.Process, "io_counters")
+         self.assertEqual(hasit, False if MACOS or SUNOS else True)
+diff --git a/psutil/tests/test_linux.py b/psutil/tests/test_linux.py
+index 41645e3..3bcec0b 100755
+--- a/psutil/tests/test_linux.py
++++ b/psutil/tests/test_linux.py
+@@ -201,8 +201,9 @@ def get_free_version_info():
+     out = sh(["free", "-V"]).strip()
+     if 'UNKNOWN' in out:
+         raise unittest.SkipTest("can't determine free version")
+-    return tuple(map(int, out.split()[-1].split('.')))
+-
++    vlist = out.split()[-1].split('.')
++    vlist[:] = [n.split('-')[0] for n in vlist]
++    return tuple(map(int, vlist))
+ 
+ @contextlib.contextmanager
+ def mock_open_content(for_path, content):
+@@ -1296,6 +1297,7 @@ class TestRootFsDeviceFinder(PsutilTestCase):
+         finder.ask_sys_class_block()
+ 
+     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
++    @unittest.skip("Broken for oe")
+     def test_comparisons(self):
+         finder = RootFsDeviceFinder()
+         self.assertIsNotNone(finder.find())
+@@ -1318,11 +1320,13 @@ class TestRootFsDeviceFinder(PsutilTestCase):
+ 
+     @unittest.skipIf(not which("findmnt"), "findmnt utility not available")
+     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
++    @unittest.skip("Broken for oe")
+     def test_against_findmnt(self):
+         psutil_value = RootFsDeviceFinder().find()
+         findmnt_value = sh("findmnt -o SOURCE -rn /")
+         self.assertEqual(psutil_value, findmnt_value)
+ 
++    @unittest.skip("Broken for oe")
+     def test_disk_partitions_mocked(self):
+         with mock.patch(
+                 'psutil._pslinux.cext.disk_partitions',
+diff --git a/psutil/tests/test_misc.py b/psutil/tests/test_misc.py
+index e22789c..050df01 100755
+--- a/psutil/tests/test_misc.py
++++ b/psutil/tests/test_misc.py
+@@ -190,6 +190,8 @@ class TestSpecialMethods(PsutilTestCase):
+ # ===================================================================
+ 
+ 
++PSUTIL_DEBUG = bool(os.getenv('PSUTIL_DEBUG', 0))
++
+ class TestMisc(PsutilTestCase):
+ 
+     def test__all__(self):
+@@ -252,6 +254,7 @@ class TestMisc(PsutilTestCase):
+ 
+     # XXX: https://github.com/pypa/setuptools/pull/2896
+     @unittest.skipIf(APPVEYOR, "temporarily disabled due to setuptools bug")
++    @unittest.skip("OE run this test outof source tree")
+     def test_setup_script(self):
+         setup_py = os.path.join(ROOT_DIR, 'setup.py')
+         if CI_TESTING and not os.path.exists(setup_py):
+@@ -425,6 +428,7 @@ class TestCommonModule(PsutilTestCase):
+         with mock.patch('psutil._common.stat.S_ISREG', return_value=False):
+             assert not isfile_strict(this_file)
+ 
++    @unittest.skipIf(not PSUTIL_DEBUG, "env PSUTIL_DEBUG not set")
+     def test_debug(self):
+         if PY3:
+             from io import StringIO
+diff --git a/psutil/tests/test_process.py b/psutil/tests/test_process.py
+index eb17e23..b75cc92 100755
+--- a/psutil/tests/test_process.py
++++ b/psutil/tests/test_process.py
+@@ -37,6 +37,7 @@ from psutil._compat import PY3
+ from psutil._compat import FileNotFoundError
+ from psutil._compat import long
+ from psutil._compat import super
++from psutil._compat import which
+ from psutil.tests import APPVEYOR
+ from psutil.tests import CI_TESTING
+ from psutil.tests import GITHUB_ACTIONS
+@@ -726,6 +727,7 @@ class TestProcess(PsutilTestCase):
+             self.assertEqual(' '.join(p.cmdline()), ' '.join(cmdline))
+ 
+     @unittest.skipIf(PYPY, "broken on PYPY")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_long_cmdline(self):
+         testfn = self.get_testfn()
+         create_exe(testfn)
+@@ -740,6 +742,7 @@ class TestProcess(PsutilTestCase):
+         assert pyexe.startswith(name), (pyexe, name)
+ 
+     @unittest.skipIf(PYPY, "unreliable on PYPY")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_long_name(self):
+         testfn = self.get_testfn(suffix="0123456789" * 2)
+         create_exe(testfn)
+@@ -750,6 +753,7 @@ class TestProcess(PsutilTestCase):
+     @unittest.skipIf(SUNOS, "broken on SUNOS")
+     @unittest.skipIf(AIX, "broken on AIX")
+     @unittest.skipIf(PYPY, "broken on PYPY")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_prog_w_funky_name(self):
+         # Test that name(), exe() and cmdline() correctly handle programs
+         # with funky chars such as spaces and ")", see:
+@@ -1426,6 +1430,7 @@ class TestProcess(PsutilTestCase):
+ 
+     @unittest.skipIf(not HAS_ENVIRON, "not supported")
+     @unittest.skipIf(not POSIX, "POSIX only")
++    @unittest.skipIf(not which("gcc"), "gcc not installed")
+     def test_weird_environ(self):
+         # environment variables can contain values without an equals sign
+         code = textwrap.dedent("""
+diff --git a/psutil/tests/test_system.py b/psutil/tests/test_system.py
+index e130c93..fc755bf 100755
+--- a/psutil/tests/test_system.py
++++ b/psutil/tests/test_system.py
+@@ -579,6 +579,7 @@ class TestDiskAPIs(PsutilTestCase):
+     def test_disk_usage_bytes(self):
+         psutil.disk_usage(b'.')
+ 
++    @unittest.skip("Broken for oe")
+     def test_disk_partitions(self):
+         def check_ntuple(nt):
+             self.assertIsInstance(nt.device, str)
+diff --git a/psutil/tests/test_unicode.py b/psutil/tests/test_unicode.py
+index 3fa3f01..2b2e76c 100755
+--- a/psutil/tests/test_unicode.py
++++ b/psutil/tests/test_unicode.py
+@@ -87,6 +87,7 @@ from psutil import POSIX
+ from psutil import WINDOWS
+ from psutil._compat import PY3
+ from psutil._compat import u
++from psutil._compat import which
+ from psutil.tests import APPVEYOR
+ from psutil.tests import ASCII_FS
+ from psutil.tests import CI_TESTING
+@@ -156,7 +157,7 @@ def try_unicode(suffix):
+ # FS APIs
+ # ===================================================================
+ 
+-
++@unittest.skipIf(not which("gcc"), "gcc not installed")
+ class BaseUnicodeTest(PsutilTestCase):
+     funky_suffix = None
+ 
+@@ -169,6 +170,7 @@ class BaseUnicodeTest(PsutilTestCase):
+ @serialrun
+ @unittest.skipIf(ASCII_FS, "ASCII fs")
+ @unittest.skipIf(PYPY and not PY3, "too much trouble on PYPY2")
++@unittest.skipIf(not which("gcc"), "gcc not installed")
+ class TestFSAPIs(BaseUnicodeTest):
+     """Test FS APIs with a funky, valid, UTF8 path name."""
+ 
diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb b/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
index 5b31014657..acb92965d7 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "feb861a10b6c3bb00701063b37e4afc754f8217f0f09c42280586bd6ac
 
 inherit pypi setuptools3
 
+SRC_URI += "file://0001-fix-failure-test-cases.patch"
+
 PACKAGES =+ "${PN}-tests"
 
 FILES:${PN}-tests += " \
@@ -24,4 +26,12 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-resource \
 "
 
+RDEPENDS:${PN}-tests += " \
+    ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-mmap \
+    ${PYTHON_PN}-multiprocessing \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


