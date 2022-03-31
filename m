Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55B3C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.703.1648751366006022797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9BD3139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BE313F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/23] oeqa/selftest: tag tests that use runqemu
Date: Thu, 31 Mar 2022 19:29:08 +0100
Message-Id: <20220331182915.22128-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163857

There may be environments or machines which don't have working runqemu,
so tag all of the tests which use runqemu() so that they can be skipped.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py       | 3 ++-
 meta/lib/oeqa/selftest/cases/gcc.py           | 7 +++++++
 meta/lib/oeqa/selftest/cases/glibc.py         | 1 +
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 3 +++
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 6 +++++-
 meta/lib/oeqa/selftest/cases/runqemu.py       | 2 ++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 9 +++++----
 meta/lib/oeqa/selftest/cases/wic.py           | 7 +++++++
 8 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index 9c69585a88c..ba5dca0359e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -9,10 +9,10 @@ import tempfile
 import glob
 import fnmatch
=20
-import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp=
_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
+from oeqa.core.decorator import OETestTag
=20
 oldmetapath =3D None
=20
@@ -1351,6 +1351,7 @@ class DevtoolExtractTests(DevtoolBase):
         matches2 =3D glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that=
 should have been cleaned' % testrecipe2)
=20
+    @OETestTag("runqemu")
     def test_devtool_deploy_target(self):
         # NOTE: Whilst this test would seemingly be better placed as a r=
untime test,
         # unfortunately the runtime tests run under bitbake and you can'=
t run
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest=
/cases/gcc.py
index 9308724ce5e..b9ea03ae62d 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -114,37 +114,44 @@ class GccLibItmSelfTest(GccSelfTestBase):
         self.run_check("libitm")
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GccCrossSelfTestSystemEmulated(GccSelfTestBase):
     def test_cross_gcc(self):
         self.run_check_emulated("gcc")
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GxxCrossSelfTestSystemEmulated(GccSelfTestBase):
     def test_cross_gxx(self):
         self.run_check_emulated("g++")
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GccLibAtomicSelfTestSystemEmulated(GccSelfTestBase):
     def test_libatomic(self):
         self.run_check_emulated("libatomic")
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GccLibGompSelfTestSystemEmulated(GccSelfTestBase):
     def test_libgomp(self):
         self.run_check_emulated("libgomp")
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GccLibStdCxxSelfTestSystemEmulated(GccSelfTestBase):
     def test_libstdcxx(self):
         self.run_check_emulated("libstdc++-v3")
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GccLibSspSelfTestSystemEmulated(GccSelfTestBase):
     def test_libssp(self):
         self.check_skip("libssp")
         self.run_check_emulated("libssp")
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GccLibItmSelfTestSystemEmulated(GccSelfTestBase):
     def test_libitm(self):
         self.check_skip("libitm")
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selfte=
st/cases/glibc.py
index 4c149ab7023..6fc98e9cb47 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -83,6 +83,7 @@ class GlibcSelfTest(GlibcSelfTestBase):
         self.run_check()
=20
 @OETestTag("toolchain-system")
+@OETestTag("runqemu")
 class GlibcSelfTestSystemEmulated(GlibcSelfTestBase):
     def test_glibc(self):
         self.run_check_emulated()
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeq=
a/selftest/cases/imagefeatures.py
index d36d45c5516..6b94ace4eba 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -3,6 +3,7 @@
 #
=20
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.sshcontrol import SSHControl
 import glob
@@ -14,6 +15,7 @@ class ImageFeatures(OESelftestTestCase):
     test_user =3D 'tester'
     root_user =3D 'root'
=20
+    @OETestTag("runqemu")
     def test_non_root_user_can_connect_via_ssh_without_password(self):
         """
         Summary: Check if non root user can connect via ssh without pass=
word
@@ -39,6 +41,7 @@ class ImageFeatures(OESelftestTestCase):
                 status, output =3D ssh.run("true")
                 self.assertEqual(status, 0, 'ssh to user %s failed with =
%s' % (user, output))
=20
+    @OETestTag("runqemu")
     def test_all_users_can_connect_via_ssh_without_password(self):
         """
         Summary:     Check if all users can connect via ssh without pass=
word
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/se=
lftest/cases/overlayfs.py
index 56ae48ce64b..472746a64f4 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -3,7 +3,8 @@
 #
=20
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+from oeqa.utils.commands import bitbake, runqemu
+from oeqa.core.decorator import OETestTag
=20
 def getline_qemu(out, line):
     for l in out.split('\n'):
@@ -185,6 +186,7 @@ EOT
             line =3D getline_qemu(output, "upperdir=3D/mnt/overlay/upper=
/usr/share/another-overlay-mount")
             self.assertTrue(line and line.startswith("overlay"), msg=3Do=
utput)
=20
+    @OETestTag("runqemu")
     def test_correct_image_fstab(self):
         """
         Summary:   Check that we can create an image when all parameters=
 are
@@ -203,6 +205,7 @@ EOT
=20
         self._test_correct_image('base-files', base_files_append)
=20
+    @OETestTag("runqemu")
     def test_correct_image_unit(self):
         """
         Summary:   Check that we can create an image when all parameters=
 are
@@ -238,6 +241,7 @@ EOT
=20
         self._test_correct_image('systemd-machine-units', systemd_machin=
e_unit_append)
=20
+@OETestTag("runqemu")
 class OverlayFSEtcRunTimeTests(OESelftestTestCase):
     """overlayfs-etc class tests"""
=20
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/self=
test/cases/runqemu.py
index da22f77b276..c1d277a095a 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -12,6 +12,7 @@ from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
=20
+@OETestTag("runqemu")
 class RunqemuTests(OESelftestTestCase):
     """Runqemu test class"""
=20
@@ -149,6 +150,7 @@ SYSLINUX_TIMEOUT =3D "10"
 # bootup various filesystem types, including live image(iso and hddimg)
 # where live image was not supported on all qemu architecture.
 @OETestTag("machine")
+@OETestTag("runqemu")
 class QemuTest(OESelftestTestCase):
=20
     @classmethod
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa=
/selftest/cases/runtime_test.py
index 642f0eb6375..7b7371b6e07 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -4,16 +4,15 @@
=20
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu
-from oeqa.utils.sshcontrol import SSHControl
+from oeqa.core.decorator import OETestTag
 import os
-import re
 import tempfile
-import shutil
 import oe.lsb
 from oeqa.core.decorator.data import skipIfNotQemu
=20
 class TestExport(OESelftestTestCase):
=20
+    @OETestTag("runqemu")
     def test_testexport_basic(self):
         """
         Summary: Check basic testexport functionality with only ping tes=
t enabled.
@@ -106,6 +105,7 @@ class TestExport(OESelftestTestCase):
             self.assertEqual(0, result.status, "Couldn't run tar from SD=
K")
=20
=20
+@OETestTag("runqemu")
 class TestImage(OESelftestTestCase):
=20
     def test_testimage_install(self):
@@ -240,6 +240,7 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
=20
+@OETestTag("runqemu")
 class Postinst(OESelftestTestCase):
=20
     def init_manager_loop(self, init_manager):
@@ -357,6 +358,7 @@ class Postinst(OESelftestTestCase):
                 self.assertFalse(os.path.isfile(os.path.join(hosttestdir=
, "rootfs-after-failure")),
                                     "rootfs-after-failure file was creat=
ed")
=20
+@OETestTag("runqemu")
 class SystemTap(OESelftestTestCase):
         """
         Summary:        The purpose of this test case is to verify nativ=
e crosstap
@@ -433,4 +435,3 @@ IMAGE_INSTALL:append =3D " systemtap-runtime"
                 cmd =3D "crosstap -r root@192.168.7.2 -s %s/process/ sys=
calls_by_pid.stp" % systemtap_examples
                 result =3D runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_b=
y_pid returned a non 0 status:%s' % result.output)
-
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 325fb7776a8..2eb80ac1941 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -19,6 +19,7 @@ from functools import wraps, lru_cache
 from tempfile import NamedTemporaryFile
=20
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator import OETestTag
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu
=20
=20
@@ -843,6 +844,7 @@ class Wic2(WicTestCase):
=20
     # TODO this should work on aarch64
     @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
         config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D "wic-image-mi=
nimal"\n'\
@@ -863,6 +865,7 @@ class Wic2(WicTestCase):
             self.assertEqual(output, 'UUID=3D2c71ef06-a81d-4735-9d3a-379=
b69c6bdba\t/media\text4\tdefaults\t0\t0')
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
     def test_qemu_efi(self):
         """Test core-image-minimal efi image under qemu"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "mkefidisk.wks=
"\n'
@@ -1046,6 +1049,7 @@ class Wic2(WicTestCase):
             self.assertGreaterEqual(size, 204800)
=20
     @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
+    @OETestTag("runqemu")
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
         # build ext4 and then use it for a wic image
@@ -1113,6 +1117,7 @@ class Wic2(WicTestCase):
         self.assertEqual('1', result.output)
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
     def test_biosplusefi_plugin_qemu(self):
         """Test biosplusefi plugin in qemu"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_biosplus=
efi_plugin.wks"\nMACHINE_FEATURES:append =3D " efi"\n'
@@ -1172,6 +1177,7 @@ class Wic2(WicTestCase):
=20
     # TODO this test could also work on aarch64
     @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
     def test_efi_plugin_unified_kernel_image_qemu(self):
         """Test efi plugin's Unified Kernel Image feature in qemu"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\n'\
@@ -1381,6 +1387,7 @@ class Wic2(WicTestCase):
             self.assertEqual(1, len(out))
=20
     @only_for_arch(['i586', 'i686', 'x86_64'])
+    @OETestTag("runqemu")
     def test_expand_mbr_image(self):
         """Test wic write --expand command for mbr image"""
         # build an image
--=20
2.25.1


