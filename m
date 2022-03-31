Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F28C4167B
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.663.1648751360113174708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B421139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D16843F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/23] oeqa/selftest/wic: add more arch-specific annotations
Date: Thu, 31 Mar 2022 19:29:00 +0100
Message-Id: <20220331182915.22128-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163849

Some tests which are marked as x86-specific will actually work on
aarch64 (e.g. use EFI), whilst some other tests really are x86-specific
(e.g. use syslinux).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index eb376e1e2c5..325fb7776a8 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -203,7 +203,7 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdis=
k-*direct")))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd =3D "wic create mkefidisk -e core-image-minimal -o %s" % sel=
f.resultdir
@@ -221,7 +221,7 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootlo=
ader-config-*direct")))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         config =3D 'MACHINE_FEATURES:append =3D " efi"\n'
@@ -251,6 +251,7 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-=
*direct")))
=20
+    # TODO this doesn't have to be x86-specific
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_default_output_dir(self):
         """Test default output location"""
@@ -355,6 +356,7 @@ class Wic(WicTestCase):
                                    "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.dir=
ect")))
=20
+    # TODO this doesn't have to be x86-specific
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
@@ -365,6 +367,7 @@ class Wic(WicTestCase):
                         "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-=
rootfs*.direct")))
=20
+    # TODO this doesn't have to be x86-specific
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
@@ -818,7 +821,7 @@ class Wic2(WicTestCase):
                                       self.resultdir))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*dire=
ct")))
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D "wic-image-mi=
nimal"\n'\
@@ -838,6 +841,7 @@ class Wic2(WicTestCase):
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
=20
+    # TODO this should work on aarch64
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
@@ -1041,7 +1045,7 @@ class Wic2(WicTestCase):
             size =3D int(size[:-3])
             self.assertGreaterEqual(size, 204800)
=20
-    @only_for_arch(['i586', 'i686', 'x86_64'])
+    @only_for_arch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
         # build ext4 and then use it for a wic image
@@ -1166,6 +1170,7 @@ class Wic2(WicTestCase):
             out =3D glob(self.resultdir + "%s-*.direct" % wksname)
             self.assertEqual(1, len(out))
=20
+    # TODO this test could also work on aarch64
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_efi_plugin_unified_kernel_image_qemu(self):
         """Test efi plugin's Unified Kernel Image feature in qemu"""
@@ -1375,6 +1380,7 @@ class Wic2(WicTestCase):
             out =3D glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
=20
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_expand_mbr_image(self):
         """Test wic write --expand command for mbr image"""
         # build an image
--=20
2.25.1


