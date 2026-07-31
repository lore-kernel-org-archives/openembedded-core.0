Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25FEC55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 02:20:01 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2680.1785464395483200023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 19:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=l2P1AsTa;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=U+EQueg5;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hB8sj0lYKzMlLd;
	Fri, 31 Jul 2026 04:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785464393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=utiC77YnMsPTxF6fPsQaXfnPE1nVINuWyUjH+qjxpBc=;
	b=l2P1AsTaAOeVKLIvc75tPx3uvZK0b9lMdGxYGQOB3rIywdclnYPIPOiQcRKLwqlsMBaGYA
	fv77Cl4v5inD0b+8C6OJb9lf9zDh+bg/KNmjsbcJLrPvLeD4T/PaYZOsoXOH7wruwV1c5j
	xeB5tiwwjNSXz5J/H688kfhrMAkF9WJCN5T1Uie9H6Vh6OTTt0DAnHFN1PplhZa/Yqb4Jt
	Iwl3nCzb0hM9n58/1YKa46Q+MMEUgzGYttyeEFTDYbJ38AkuYtjjGzr8oHHczsZBpKA/Eq
	Ajjjpe9bu/tS1uPZ+Uor8KsGG2DDapZq83a4f1BJsWAlpV7xGS33hVg6S2K59w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=U+EQueg5;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785464391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=utiC77YnMsPTxF6fPsQaXfnPE1nVINuWyUjH+qjxpBc=;
	b=U+EQueg5D+XfNYEP5+i1wo5sn0D7MZ4wm8aWITdKW7OArSQ3ydhdidTERmm1GLGlqPvf2A
	Nb0bX0krv8hbqvZwEO3sqtuwn9P0HDx74xuonTmjHygenk4DkLO6/7q5uNbCra+uZCRtwj
	xKyHCCrGAuUbi468wmWkxpUayBzU+uL5ULmzbfLnAtNNhUu709frGEmiYEVv4rHQyIIJRg
	PPSt+FaRoiQuMc9X5fk3KmmET0+jHM05HSFCGtrwUBY4B55jlMR9biP+SR/kTgT7IIbEr5
	nKnsmATHuxGBeEYRm8sQ+YCjcKf4l88OR8PEMfHZ8v4Okm0ILn+eCfL4wMIlVg==
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	adrian.freihofer@siemens.com,
	Ryan Eatmon <reatmon@ti.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: [wrynose][PATCH] oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
Date: Fri, 31 Jul 2026 04:19:06 +0200
Message-ID: <20260731021948.108106-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2d18fd426cb80d40295
X-MBO-RS-META: u4o638k4qz3gh4dx7oq1cimai3uc3uya
X-Rspamd-Queue-Id: 4hB8sj0lYKzMlLd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 02:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242389

From: Ryan Eatmon <reatmon@ti.com>

The recent changes to fixing KERNEL_DTBVENDORED support and then adding
the same mapping for FIT_CONF_DEFAULT_DTB exposed that we were missing
tests for these two cases.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de2e11e63624f86583875163e66f63ea7457c121)
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
OE wrynose backport required the following modifications:
- Replace self._get_machine_or_skip() and
  FitImageTestCase._config_add_machine_settings()
  with manually generated beagle config. Beagle is
  valid since it does have 'ti' vendor prefix.
- Drop self._gen_atf_tee_dummy_images() which is
  unnecessary for the test.
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 55 +++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/sel=
ftest/cases/fitimage.py
index e8435fb43c1..b35dda6674a 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -183,6 +183,16 @@ class FitImageTestCase(OESelftestTestCase):
                 pass
         return a_comment
=20
+    @staticmethod
+    def _apply_dtbvendored(bb_vars,dtb):
+        """ This is (and should remain) the same logic that is in kernel=
-fit-image.bbclass
+        """
+        if bb_vars.get('KERNEL_DTBVENDORED') !=3D "1":
+            mapped_name =3D os.path.basename(dtb)
+        else:
+            mapped_name =3D dtb.replace('/', '_')
+        return mapped_name
+
     @staticmethod
     def _get_dtb_files(bb_vars):
         """Return a list of devicetree names
@@ -195,7 +205,7 @@ class FitImageTestCase(OESelftestTestCase):
         all_dtbs =3D []
         dtb_symlinks =3D []
         if kernel_devicetree:
-            all_dtbs +=3D [os.path.basename(dtb) for dtb in kernel_devic=
etree.split()]
+            all_dtbs +=3D [FitImageTestCase._apply_dtbvendored(bb_vars, =
dtb) for dtb in kernel_devicetree.split()]
         # Support only the test recipe which provides 1 devicetree and 1=
 devicetree overlay
         pref_prov_dtb =3D bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
         if pref_prov_dtb =3D=3D "bbb-dtbs-as-ext":
@@ -437,6 +447,7 @@ class KernelFitImageBase(FitImageTestCase):
             'INITRAMFS_IMAGE',
             'KERNEL_DEPLOYSUBDIR',
             'KERNEL_DEVICETREE',
+            'KERNEL_DTBVENDORED',
             'KERNEL_FIT_LINK_NAME',
             'MACHINE',
             'PREFERRED_PROVIDER_virtual/dtb',
@@ -653,7 +664,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_conf_default_dtb =3D bb_vars.get('FIT_CONF_DEFAULT_DTB')
         if fit_conf_default_dtb:
             fit_conf_prefix =3D bb_vars.get('FIT_CONF_PREFIX', "conf-")
-            its_field_check.append('default =3D "' + fit_conf_prefix + f=
it_conf_default_dtb + '";')
+            its_field_check.append('default =3D "' + fit_conf_prefix + s=
elf._apply_dtbvendored(bb_vars, fit_conf_default_dtb) + '";')
=20
         # configuration nodes (one per DTB and also one per symlink)
         dtb_files, dtb_symlinks =3D FitImageTestCase._get_dtb_files(bb_v=
ars)
@@ -1142,6 +1153,46 @@ FIT_HASH_ALG =3D "sha256"
         self._gen_signing_key(bb_vars)
         self._test_fitimage(bb_vars)
=20
+    def test_vendored_dtb_without_kernel_dtbvendored(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are =
created correctly with KERNEL_DTBVENDORED turned off.
+        Expected:    1) its and FIT image are built successfully
+                     2) Dumping the FIT image indicates the devicetree o=
verlay
+        """
+
+        config =3D """
+MACHINE:forcevariable =3D "beaglebone-yocto"
+UBOOT_MACHINE =3D "am335x_evm_defconfig"
+UBOOT_ARCH =3D "arm"
+UBOOT_DTB_BINARY =3D "u-boot.dtb"
+KERNEL_DTBVENDORED =3D "0"
+"""
+        config =3D self._config_add_kernel_classes(config)
+        config =3D self._config_add_uboot_env(config)
+        self.write_config(config)
+        bb_vars =3D self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
+    def test_vendored_dtb_with_kernel_dtbvendored(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are =
created correctly with KERNEL_DTBVENDORED turned on.
+        Expected:    1) its and FIT image are built successfully
+                     2) Dumping the FIT image indicates the devicetree o=
verlay
+        """
+
+        config =3D """
+MACHINE:forcevariable =3D "beaglebone-yocto"
+UBOOT_MACHINE =3D "am335x_evm_defconfig"
+UBOOT_ARCH =3D "arm"
+UBOOT_DTB_BINARY =3D "u-boot.dtb"
+KERNEL_DTBVENDORED =3D "1"
+"""
+        config =3D self._config_add_kernel_classes(config)
+        config =3D self._config_add_uboot_env(config)
+        self.write_config(config)
+        bb_vars =3D self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
=20
--=20
2.53.0


