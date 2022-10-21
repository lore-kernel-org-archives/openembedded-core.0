Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BD3C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 09:19:06 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.7971.1666343937003178597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 02:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CLSd83rl;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id a25so2965351ljk.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzsTN+YhL/QgkUs5DamExdARxilAaPZo9YBify+aVCw=;
        b=CLSd83rllhLCiatyD2hhJ8CeL1ETZZs6GyVovkN/oJiGWm5XMZLAskR1drNf27Tvtu
         yMhZfBMGbYxxcdvd3QfxOO9mSpzWXEQYLPgJvahC2spGBza6WJmNPCicHX24canuS/os
         bdLSsksVLS0aeX3n3T1L6K00vuzkyUqExLrjp8Q9uE3ajc77kj7eovz+kDv8i3qNUbkK
         gnud8PxnGb2sqtaNK3KNB8pTHZ61wushIirrZDf1jLcg94Q358l0/MtJVC7mkW9ulXsG
         7ZpSBOIKUW2jW+IoonlFR6Wq+RE9RpffT3wPReb2xAlgZTaSdQamIpcZ9lQP8R1/90JX
         JAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzsTN+YhL/QgkUs5DamExdARxilAaPZo9YBify+aVCw=;
        b=VDclBH6IWzK/wucjrVmgWgQR4Pp6NP5EdhnUl+Xsoa3rFXardjXLzLLCUWljQoFOwA
         5jCE26SqRYwQ7pMzyprIF78WZlblDPCiZb8hQHs0eEp6vaWrSNA6WKJ/CB0nkDZ3Pz8u
         riywBs7O+POpPTIz3cCIxw15t905fNjx7Hadfv+LHoiXsAbbEBhr954vYs6iZfbsc2ev
         Ch/+rCH+/WUW9RHuAn24lFqFjIxqUiPPPDYgx5mlXOJpToYxy8QTeO2jZAnLZ2rQ9t2T
         J7Y4TnkphGFaVhqnkvnIInK+NBKXsoryKhG0ogndKjl9G5IpfK5JdNYQpocjglgeeQRi
         fF2g==
X-Gm-Message-State: ACrzQf05Dh+CHW1FFTcM2AZFk3mOqUiqXN9G0qewJdPK0Zm8bXFW0pZU
	GTWtZcKxKsufV+A+WYBY+PDBCLekFEjiUi0G2fI=
X-Google-Smtp-Source: AMsMyM7BamYnQ9BkPpo6oqaybbdTRPNkY0dZPpb1QrtKDMmqh4AtCWwTnQizT40CoSW112FF7OV6/BsIWtsZQ4t1BkM=
X-Received: by 2002:a2e:b606:0:b0:26f:c276:c9d6 with SMTP id
 r6-20020a2eb606000000b0026fc276c9d6mr6671144ljn.31.1666343934983; Fri, 21 Oct
 2022 02:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221021090112.2373113-1-changqing.li@windriver.com> <17200AA16F7D89F2.17514@lists.openembedded.org>
In-Reply-To: <17200AA16F7D89F2.17514@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 11:18:43 +0200
Message-ID: <CANNYZj85tT57+kjq1WADCJQ8Xf8Y9Y4KdR9q9BHdR8eBOBsxzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-psutil: fix failures for running psutil.tests
To: alex.kanavin@gmail.com
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172012

So if you would like this patch to be merged you need to do two things:
- enable ptest and add the component to ptest images
- take the patches that were submitted upstream and add them with
'Submitted' status, instead of this mono-patch

Alex

On Fri, 21 Oct 2022 at 11:12, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Please explain why oe-core should carry this (with all the maintenance
> and rebase burden that brings) if the component is not ptest-enabled
> and is not otherwise using those tests.
>
> Besides, these fixes should go upstream first, which I already did for you:
> https://github.com/giampaolo/psutil/pull/2097
>
> Alex
>
> On Fri, 21 Oct 2022 at 11:01, Changqing Li <changqing.li@windriver.com> wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > * Add RDEPENDS for package python3-psutil-tests to fix following error:
> > $ python3 -m psutil.tests
> > Traceback (most recent call last):
> >   File "/usr/lib/python3.10/runpy.py", line 187, in _run_module_as_main
> >     mod_name, mod_spec, code = _get_module_details(mod_name, _Error)
> >   File "/usr/lib/python3.10/runpy.py", line 146, in _get_module_details
> >     return _get_module_details(pkg_main_name, error)
> >   File "/usr/lib/python3.10/runpy.py", line 110, in _get_module_details
> >     __import__(pkg_name)
> >   File "/usr/lib/python3.10/site-packages/psutil/tests/__init__.py", line 35, in <module>
> >     import unittest
> > ModuleNotFoundError: No module named 'unittest'
> >
> > * Skip some test cases not suitable for OE
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  .../0001-fix-failure-test-cases.patch         | 195 ++++++++++++++++++
> >  .../python/python3-psutil_5.9.2.bb            |  10 +
> >  2 files changed, 205 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
> > new file mode 100644
> > index 0000000000..d5e5fe99d1
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
> > @@ -0,0 +1,195 @@
> > +From f6b9fda0942dfa7298d7bd3e1bc5d7bb64cf99ec Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Wed, 23 Feb 2022 11:54:40 +0800
> > +Subject: [PATCH] fix failure test cases
> > +
> > +The test cases is not robust enough. skip some cases that is
> > +not suitable for all conditions.
> > +
> > +* test_io_counters failed when kernel config CONFIG_TASKSTATS
> > +  and CONFIG_TASK_IO_ACCOUNTING are not enable in OE
> > +* test_setup_script failed since oe don't install setup.py
> > +* test_used failed since oe use git source for free, so the version
> > +  is 3.3.17-dirty
> > +* test_weird_environ failed since gcc not installed
> > +* test_debug failed since it is designed to run when PSUTIL_DEBUG is set
> > +* test_against_findmnt/test_comparisons/test_disk_partitions_mocked/
> > +  test_disk_partitions is not suitable for Linux nfs boot
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +
> > +---
> > + psutil/tests/test_contracts.py | 1 +
> > + psutil/tests/test_linux.py     | 8 ++++++--
> > + psutil/tests/test_misc.py      | 4 ++++
> > + psutil/tests/test_process.py   | 5 +++++
> > + psutil/tests/test_system.py    | 1 +
> > + psutil/tests/test_unicode.py   | 4 +++-
> > + 6 files changed, 20 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/psutil/tests/test_contracts.py b/psutil/tests/test_contracts.py
> > +index 0d90066..8502f0c 100755
> > +--- a/psutil/tests/test_contracts.py
> > ++++ b/psutil/tests/test_contracts.py
> > +@@ -172,6 +172,7 @@ class TestAvailProcessAPIs(PsutilTestCase):
> > +     def test_rlimit(self):
> > +         self.assertEqual(hasattr(psutil.Process, "rlimit"), LINUX or FREEBSD)
> > +
> > ++    @unittest.skip("broken on OE since kernel config maye not be enabled")
> > +     def test_io_counters(self):
> > +         hasit = hasattr(psutil.Process, "io_counters")
> > +         self.assertEqual(hasit, False if MACOS or SUNOS else True)
> > +diff --git a/psutil/tests/test_linux.py b/psutil/tests/test_linux.py
> > +index 41645e3..3bcec0b 100755
> > +--- a/psutil/tests/test_linux.py
> > ++++ b/psutil/tests/test_linux.py
> > +@@ -201,8 +201,9 @@ def get_free_version_info():
> > +     out = sh(["free", "-V"]).strip()
> > +     if 'UNKNOWN' in out:
> > +         raise unittest.SkipTest("can't determine free version")
> > +-    return tuple(map(int, out.split()[-1].split('.')))
> > +-
> > ++    vlist = out.split()[-1].split('.')
> > ++    vlist[:] = [n.split('-')[0] for n in vlist]
> > ++    return tuple(map(int, vlist))
> > +
> > + @contextlib.contextmanager
> > + def mock_open_content(for_path, content):
> > +@@ -1296,6 +1297,7 @@ class TestRootFsDeviceFinder(PsutilTestCase):
> > +         finder.ask_sys_class_block()
> > +
> > +     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
> > ++    @unittest.skip("Broken for oe")
> > +     def test_comparisons(self):
> > +         finder = RootFsDeviceFinder()
> > +         self.assertIsNotNone(finder.find())
> > +@@ -1318,11 +1320,13 @@ class TestRootFsDeviceFinder(PsutilTestCase):
> > +
> > +     @unittest.skipIf(not which("findmnt"), "findmnt utility not available")
> > +     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
> > ++    @unittest.skip("Broken for oe")
> > +     def test_against_findmnt(self):
> > +         psutil_value = RootFsDeviceFinder().find()
> > +         findmnt_value = sh("findmnt -o SOURCE -rn /")
> > +         self.assertEqual(psutil_value, findmnt_value)
> > +
> > ++    @unittest.skip("Broken for oe")
> > +     def test_disk_partitions_mocked(self):
> > +         with mock.patch(
> > +                 'psutil._pslinux.cext.disk_partitions',
> > +diff --git a/psutil/tests/test_misc.py b/psutil/tests/test_misc.py
> > +index e22789c..050df01 100755
> > +--- a/psutil/tests/test_misc.py
> > ++++ b/psutil/tests/test_misc.py
> > +@@ -190,6 +190,8 @@ class TestSpecialMethods(PsutilTestCase):
> > + # ===================================================================
> > +
> > +
> > ++PSUTIL_DEBUG = bool(os.getenv('PSUTIL_DEBUG', 0))
> > ++
> > + class TestMisc(PsutilTestCase):
> > +
> > +     def test__all__(self):
> > +@@ -252,6 +254,7 @@ class TestMisc(PsutilTestCase):
> > +
> > +     # XXX: https://github.com/pypa/setuptools/pull/2896
> > +     @unittest.skipIf(APPVEYOR, "temporarily disabled due to setuptools bug")
> > ++    @unittest.skip("OE run this test outof source tree")
> > +     def test_setup_script(self):
> > +         setup_py = os.path.join(ROOT_DIR, 'setup.py')
> > +         if CI_TESTING and not os.path.exists(setup_py):
> > +@@ -425,6 +428,7 @@ class TestCommonModule(PsutilTestCase):
> > +         with mock.patch('psutil._common.stat.S_ISREG', return_value=False):
> > +             assert not isfile_strict(this_file)
> > +
> > ++    @unittest.skipIf(not PSUTIL_DEBUG, "env PSUTIL_DEBUG not set")
> > +     def test_debug(self):
> > +         if PY3:
> > +             from io import StringIO
> > +diff --git a/psutil/tests/test_process.py b/psutil/tests/test_process.py
> > +index eb17e23..b75cc92 100755
> > +--- a/psutil/tests/test_process.py
> > ++++ b/psutil/tests/test_process.py
> > +@@ -37,6 +37,7 @@ from psutil._compat import PY3
> > + from psutil._compat import FileNotFoundError
> > + from psutil._compat import long
> > + from psutil._compat import super
> > ++from psutil._compat import which
> > + from psutil.tests import APPVEYOR
> > + from psutil.tests import CI_TESTING
> > + from psutil.tests import GITHUB_ACTIONS
> > +@@ -726,6 +727,7 @@ class TestProcess(PsutilTestCase):
> > +             self.assertEqual(' '.join(p.cmdline()), ' '.join(cmdline))
> > +
> > +     @unittest.skipIf(PYPY, "broken on PYPY")
> > ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
> > +     def test_long_cmdline(self):
> > +         testfn = self.get_testfn()
> > +         create_exe(testfn)
> > +@@ -740,6 +742,7 @@ class TestProcess(PsutilTestCase):
> > +         assert pyexe.startswith(name), (pyexe, name)
> > +
> > +     @unittest.skipIf(PYPY, "unreliable on PYPY")
> > ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
> > +     def test_long_name(self):
> > +         testfn = self.get_testfn(suffix="0123456789" * 2)
> > +         create_exe(testfn)
> > +@@ -750,6 +753,7 @@ class TestProcess(PsutilTestCase):
> > +     @unittest.skipIf(SUNOS, "broken on SUNOS")
> > +     @unittest.skipIf(AIX, "broken on AIX")
> > +     @unittest.skipIf(PYPY, "broken on PYPY")
> > ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
> > +     def test_prog_w_funky_name(self):
> > +         # Test that name(), exe() and cmdline() correctly handle programs
> > +         # with funky chars such as spaces and ")", see:
> > +@@ -1426,6 +1430,7 @@ class TestProcess(PsutilTestCase):
> > +
> > +     @unittest.skipIf(not HAS_ENVIRON, "not supported")
> > +     @unittest.skipIf(not POSIX, "POSIX only")
> > ++    @unittest.skipIf(not which("gcc"), "gcc not installed")
> > +     def test_weird_environ(self):
> > +         # environment variables can contain values without an equals sign
> > +         code = textwrap.dedent("""
> > +diff --git a/psutil/tests/test_system.py b/psutil/tests/test_system.py
> > +index e130c93..fc755bf 100755
> > +--- a/psutil/tests/test_system.py
> > ++++ b/psutil/tests/test_system.py
> > +@@ -579,6 +579,7 @@ class TestDiskAPIs(PsutilTestCase):
> > +     def test_disk_usage_bytes(self):
> > +         psutil.disk_usage(b'.')
> > +
> > ++    @unittest.skip("Broken for oe")
> > +     def test_disk_partitions(self):
> > +         def check_ntuple(nt):
> > +             self.assertIsInstance(nt.device, str)
> > +diff --git a/psutil/tests/test_unicode.py b/psutil/tests/test_unicode.py
> > +index 3fa3f01..2b2e76c 100755
> > +--- a/psutil/tests/test_unicode.py
> > ++++ b/psutil/tests/test_unicode.py
> > +@@ -87,6 +87,7 @@ from psutil import POSIX
> > + from psutil import WINDOWS
> > + from psutil._compat import PY3
> > + from psutil._compat import u
> > ++from psutil._compat import which
> > + from psutil.tests import APPVEYOR
> > + from psutil.tests import ASCII_FS
> > + from psutil.tests import CI_TESTING
> > +@@ -156,7 +157,7 @@ def try_unicode(suffix):
> > + # FS APIs
> > + # ===================================================================
> > +
> > +-
> > ++@unittest.skipIf(not which("gcc"), "gcc not installed")
> > + class BaseUnicodeTest(PsutilTestCase):
> > +     funky_suffix = None
> > +
> > +@@ -169,6 +170,7 @@ class BaseUnicodeTest(PsutilTestCase):
> > + @serialrun
> > + @unittest.skipIf(ASCII_FS, "ASCII fs")
> > + @unittest.skipIf(PYPY and not PY3, "too much trouble on PYPY2")
> > ++@unittest.skipIf(not which("gcc"), "gcc not installed")
> > + class TestFSAPIs(BaseUnicodeTest):
> > +     """Test FS APIs with a funky, valid, UTF8 path name."""
> > +
> > diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb b/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
> > index 5b31014657..acb92965d7 100644
> > --- a/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
> > +++ b/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
> > @@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "feb861a10b6c3bb00701063b37e4afc754f8217f0f09c42280586bd6ac
> >
> >  inherit pypi setuptools3
> >
> > +SRC_URI += "file://0001-fix-failure-test-cases.patch"
> > +
> >  PACKAGES =+ "${PN}-tests"
> >
> >  FILES:${PN}-tests += " \
> > @@ -24,4 +26,12 @@ RDEPENDS:${PN} += " \
> >      ${PYTHON_PN}-resource \
> >  "
> >
> > +RDEPENDS:${PN}-tests += " \
> > +    ${PYTHON_PN}-unittest \
> > +    ${PYTHON_PN}-json \
> > +    ${PYTHON_PN}-unixadmin \
> > +    ${PYTHON_PN}-mmap \
> > +    ${PYTHON_PN}-multiprocessing \
> > +"
> > +
> >  BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172011): https://lists.openembedded.org/g/openembedded-core/message/172011
> Mute This Topic: https://lists.openembedded.org/mt/94472197/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

