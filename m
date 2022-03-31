Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FA0C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.663.1648751360113174708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8045A139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3247C3F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/23] oeqa/selftest/wic: remove redundant asserts
Date: Thu, 31 Mar 2022 19:28:57 +0100
Message-Id: <20220331182915.22128-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163846

By default bitbake() will raise an assertion if it fails, so there's no
need to wrap it in a further assert.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 673942fc9cc..5d7f7bf6135 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -104,7 +104,7 @@ class WicTestCase(OESelftestTestCase):
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
         if image not in WicTestCase.wicenv_cache:
-            self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image=
).status)
+            bitbake('%s -c do_rootfs_wicenv' % image)
             bb_vars =3D get_bb_vars(['STAGING_DIR', 'MACHINE'], image)
             stdir =3D bb_vars['STAGING_DIR']
             machine =3D bb_vars['MACHINE']
@@ -694,7 +694,7 @@ part /etc --source rootfs --fstype=3Dext4 --change-di=
rectory=3Detc
         os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
=20
         # Get stock fstab from base-files recipe
-        self.assertEqual(0, bitbake('base-files -c do_install').status)
+        bitbake('base-files -c do_install')
         bf_fstab =3D os.path.join(get_bb_var('D', 'base-files'), 'etc/fs=
tab')
         self.assertEqual(True, os.path.exists(bf_fstab))
         bf_fstab_md5sum =3D runCmd('md5sum %s 2>/dev/null' % bf_fstab).o=
utput.split(" ")[0]
@@ -828,7 +828,7 @@ class Wic2(WicTestCase):
         config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D "wic-image-mi=
nimal"\n'\
                  'MACHINE_FEATURES:append =3D " efi"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('wic-image-minimal').status)
+        bitbake('wic-image-minimal')
         self.remove_config(config)
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
@@ -848,7 +848,7 @@ class Wic2(WicTestCase):
         config =3D 'IMAGE_FSTYPES +=3D "wic"\nWKS_FILE =3D "wic-image-mi=
nimal"\n'\
                  'MACHINE_FEATURES:append =3D " efi"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('wic-image-minimal').status)
+        bitbake('wic-image-minimal')
         self.remove_config(config)
=20
         with runqemu('wic-image-minimal', ssh=3DFalse, runqemuparams=3D'=
nographic') as qemu:
@@ -867,7 +867,7 @@ class Wic2(WicTestCase):
         """Test core-image-minimal efi image under qemu"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "mkefidisk.wks=
"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal ovmf').status)
+        bitbake('core-image-minimal ovmf')
         self.remove_config(config)
=20
         with runqemu('core-image-minimal', ssh=3DFalse,
@@ -1051,12 +1051,12 @@ class Wic2(WicTestCase):
         # build ext4 and then use it for a wic image
         config =3D 'IMAGE_FSTYPES =3D "ext4"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal').status)
+        bitbake('core-image-minimal')
         self.remove_config(config)
=20
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_rawcopy_=
plugin.wks.in"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal-mtdutils').statu=
s)
+        bitbake('core-image-minimal-mtdutils')
         self.remove_config(config)
=20
         with runqemu('core-image-minimal-mtdutils', ssh=3DFalse,
@@ -1096,7 +1096,7 @@ class Wic2(WicTestCase):
         """Test empty plugin"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_empty_pl=
ugin.wks"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal').status)
+        bitbake('core-image-minimal')
         self.remove_config(config)
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
@@ -1117,7 +1117,7 @@ class Wic2(WicTestCase):
         """Test biosplusefi plugin in qemu"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_biosplus=
efi_plugin.wks"\nMACHINE_FEATURES:append =3D " efi"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal').status)
+        bitbake('core-image-minimal')
         self.remove_config(config)
=20
         with runqemu('core-image-minimal', ssh=3DFalse,
@@ -1155,7 +1155,7 @@ class Wic2(WicTestCase):
         # The easiest way to work-around this issue is to make sure we a=
lready built an image here, hence the bitbake call
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_biosplus=
efi_plugin.wks"\nMACHINE_FEATURES:append =3D " efi"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal').status)
+        bitbake('core-image-minimal')
         self.remove_config(config)
=20
         img =3D 'core-image-minimal'
@@ -1178,7 +1178,7 @@ class Wic2(WicTestCase):
                  'WKS_FILE =3D "test_efi_plugin.wks"\n'\
                  'MACHINE_FEATURES:append =3D " efi"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal core-image-minim=
al-initramfs ovmf').status)
+        bitbake('core-image-minimal core-image-minimal-initramfs ovmf')
         self.remove_config(config)
=20
         with runqemu('core-image-minimal', ssh=3DFalse,
@@ -1382,7 +1382,7 @@ class Wic2(WicTestCase):
         # build an image
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "directdisk.wk=
s"\n'
         self.append_config(config)
-        self.assertEqual(0, bitbake('core-image-minimal').status)
+        bitbake('core-image-minimal')
=20
         # get path to the image
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
--=20
2.25.1


