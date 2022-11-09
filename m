Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4339C43217
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1512.1668022312434952713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 573701FB;
	Wed,  9 Nov 2022 11:31:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 906233F703;
	Wed,  9 Nov 2022 11:31:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 14/15] oeqa/selftest/wic: use skipIfNotArch instead of custom decorator
Date: Wed,  9 Nov 2022 19:31:34 +0000
Message-Id: <20221109193135.291048-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173047

There's now a shared decorator for architecture skipping, so use that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 57 ++++++++++-------------------
 1 file changed, 19 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 8abe6918f3f..ca1abb970a3 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -15,33 +15,14 @@ import hashlib
=20
 from glob import glob
 from shutil import rmtree, copy
-from functools import wraps, lru_cache
 from tempfile import NamedTemporaryFile
=20
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotArch
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu
=20
=20
-@lru_cache()
-def get_host_arch():
-    return get_bb_var('HOST_ARCH')
-
-
-def only_for_arch(archs):
-    """Decorator for wrapping test cases that can be run only for specif=
ic target
-    architectures. A list of compatible architectures is passed in `arch=
s`.
-    """
-    def wrapper(func):
-        @wraps(func)
-        def wrapped_f(*args, **kwargs):
-            arch =3D get_host_arch()
-            if archs and arch not in archs:
-                raise unittest.SkipTest("Testcase arch dependency not me=
t: %s" % arch)
-            return func(*args, **kwargs)
-        return wrapped_f
-    return wrapper
-
 def extract_files(debugfs_output):
     """
     extract file names from the output of debugfs -R 'ls -p',
@@ -171,14 +152,14 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join (self.resultdir, "wict=
estdisk-*.direct"))))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID b=
oot"""
         cmd =3D "wic create directdisk-gpt --image-name core-image-minim=
al -o %s" % self.resultdir
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "direc=
tdisk-*.direct"))))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         config =3D 'INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"\n=
'\
@@ -192,21 +173,21 @@ class Wic(WicTestCase):
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "HYBRI=
D_ISO_IMG-*.direct"))))
         self.assertEqual(1, len(glob(os.path.join (self.resultdir, "HYBR=
ID_ISO_IMG-*.iso"))))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         cmd =3D "wic create qemux86-directdisk -e core-image-minimal -o =
%s" % self.resultdir
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "qemux=
86-directdisk-*direct"))))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd =3D "wic create mkefidisk -e core-image-minimal -o %s" % sel=
f.resultdir
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "mkefi=
disk-*direct"))))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         config =3D 'DEPENDS:pn-core-image-minimal +=3D "syslinux"\n'
@@ -217,7 +198,7 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "direc=
tdisk-bootloader-config-*direct"))))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         config =3D 'MACHINE_FEATURES:append =3D " efi"\n'
@@ -248,7 +229,7 @@ class Wic(WicTestCase):
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdima=
ge-bootpart-*direct"))))
=20
     # TODO this doesn't have to be x86-specific
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_default_output_dir(self):
         """Test default output location"""
         for fname in glob("directdisk-*.direct"):
@@ -261,7 +242,7 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob("directdisk-*.direct")))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         bb_vars =3D get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATI=
VE'],
@@ -353,7 +334,7 @@ class Wic(WicTestCase):
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*.direct"))))
=20
     # TODO this doesn't have to be x86-specific
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         runCmd("wic create directdisk-multi-rootfs "
@@ -364,7 +345,7 @@ class Wic(WicTestCase):
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "direc=
tdisk-multi-rootfs*.direct"))))
=20
     # TODO this doesn't have to be x86-specific
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bb_vars =3D get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATI=
VE'],
@@ -818,7 +799,7 @@ class Wic2(WicTestCase):
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wicte=
stdisk-*direct"))))
=20
     # TODO this test could also work on aarch64
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D "wic-image-mi=
nimal"\n'\
@@ -838,7 +819,7 @@ class Wic2(WicTestCase):
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
=20
     # TODO this should work on aarch64
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
@@ -859,7 +840,7 @@ class Wic2(WicTestCase):
             self.assertEqual(1, status, 'Failed to run command "%s": %s'=
 % (cmd, output))
             self.assertEqual(output, 'UUID=3D2c71ef06-a81d-4735-9d3a-379=
b69c6bdba\t/media\text4\tdefaults\t0\t0')
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
     def test_qemu_efi(self):
         """Test core-image-minimal efi image under qemu"""
@@ -1044,7 +1025,7 @@ class Wic2(WicTestCase):
             self.assertGreaterEqual(size, 204800)
=20
     # TODO this test could also work on aarch64
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
@@ -1111,7 +1092,7 @@ class Wic2(WicTestCase):
         result =3D runCmd("wic ls %s -n %s | awk -F ' ' '{print $1 \" \"=
 $5}' | grep '^2' | wc -w" % (image_path, sysroot))
         self.assertEqual('1', result.output)
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
     def test_biosplusefi_plugin_qemu(self):
         """Test biosplusefi plugin in qemu"""
@@ -1144,7 +1125,7 @@ class Wic2(WicTestCase):
             self.assertEqual(1, status, 'Failed to run command "%s": %s'=
 % (cmd, output))
             self.assertEqual(output, '*')
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_biosplusefi_plugin(self):
         """Test biosplusefi plugin"""
         # Wic generation below may fail depending on the order of the un=
ittests
@@ -1171,7 +1152,7 @@ class Wic2(WicTestCase):
             self.assertEqual(1, len(out))
=20
     # TODO this test could also work on aarch64
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
     def test_efi_plugin_unified_kernel_image_qemu(self):
         """Test efi plugin's Unified Kernel Image feature in qemu"""
@@ -1289,7 +1270,7 @@ class Wic2(WicTestCase):
             out =3D glob(os.path.join(self.resultdir, "%s-*direct" % wks=
name))
             self.assertEqual(1, len(out))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
     def test_expand_mbr_image(self):
         """Test wic write --expand command for mbr image"""
--=20
2.34.1


