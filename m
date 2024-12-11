Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE351E7717F
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 02:35:21 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.1956.1733884518864803607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 18:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 11 Dec
 2024 10:35:15 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 11 Dec 2024 10:35:15 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 3/3] oe-selftest: fitimage: add testcases to test ATF and TEE
Date: Wed, 11 Dec 2024 10:35:15 +0800
Message-ID: <20241211023515.2108415-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211023515.2108415-1-jamin_lin@aspeedtech.com>
References: <20241211023515.2108415-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 02:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208571

Add "test_uboot_atf_tee_fit_image" test caste to check u-boot FIT image and
Image Tree Source(ITS) are built and the ITS has the correct fields.

Add "test_sign_standalone_uboot_atf_tee_fit_image" test case to check if u-=
boot
FIT image and Image Tree Source (ITS) are created and signed correctly for =
the
scenario where only the u-boot proper fitImage is being created and signed.

Currently, ATF and TEE(optee-os) recipes are placed in meta-arm layer.
OpenEmbedded-Core is a basic and core meta layer. To avoid OpenEmbedded-cor=
e
depends meta-arm, both test cases are used dummy images for testing.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 288 +++++++++++++++++++++++
 1 file changed, 288 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selft=
est/cases/fitimage.py
index 0b5f4602fb..fc9d224f50 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -852,3 +852,291 @@ FIT_HASH_ALG =3D "sha256"
         # Verify the signature
         uboot_tools_sysroot_native =3D self._setup_uboot_tools_native()
         self._verify_fit_image_signature(uboot_tools_sysroot_native, fitim=
age_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
+
+
+    def test_uboot_atf_tee_fit_image(self):
+        """
+        Summary:     Check if U-boot FIT image and Image Tree Source
+                     (its) are built and the Image Tree Source has the
+                     correct fields.
+        Expected:    1. Create atf and tee dummy images
+                     2. Both u-boot-fitImage and u-boot-its can be built
+                     3. The os, load address, entrypoint address and
+                        default values of U-boot, ATF and TEE images are
+                        correct in the Image Tree Source. Not all the
+                        fields are tested, only the key fields that wont
+                        vary between different architectures.
+                Product:     oe-core
+                Author:      Jamin Lin <jamin_lin@aspeedtech.com>
+        """
+        config =3D """
+# We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
+MACHINE =3D "qemuarm"
+UBOOT_MACHINE =3D "am57xx_evm_defconfig"
+SPL_BINARY =3D "MLO"
+
+# Enable creation of the U-Boot fitImage
+UBOOT_FITIMAGE_ENABLE =3D "1"
+
+# (U-boot) fitImage properties
+UBOOT_LOADADDRESS =3D "0x80080000"
+UBOOT_ENTRYPOINT =3D "0x80080000"
+UBOOT_FIT_DESC =3D "A model description"
+
+# Enable creation of the TEE fitImage
+UBOOT_FIT_TEE =3D "1"
+
+# TEE fitImage properties
+UBOOT_FIT_TEE_IMAGE =3D "${TOPDIR}/tee-dummy.bin"
+UBOOT_FIT_TEE_LOADADDRESS =3D "0x80180000"
+UBOOT_FIT_TEE_ENTRYPOINT =3D "0x80180000"
+
+# Enable creation of the ATF fitImage
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE =3D "1"
+
+# ATF fitImage properties
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE =3D "${TOPDIR}/atf-dummy.bin"
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS =3D "0x80280000"
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT =3D "0x80280000"
+"""
+        self.write_config(config)
+
+        # Create an ATF dummy image
+        atf_dummy_image =3D os.path.join(self.builddir, "atf-dummy.bin")
+        cmd =3D 'dd if=3D/dev/random of=3D%s bs=3D1k count=3D64' % (atf_du=
mmy_image)
+        result =3D runCmd(cmd)
+        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status),=
 result.output)
+
+        # Create a TEE dummy image
+        tee_dummy_image =3D os.path.join(self.builddir, "tee-dummy.bin")
+        cmd =3D 'dd if=3D/dev/random of=3D%s bs=3D1k count=3D64' % (tee_du=
mmy_image)
+        result =3D runCmd(cmd)
+        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status),=
 result.output)
+
+        # The U-Boot fitImage is created as part of the U-Boot recipe
+        bitbake("virtual/bootloader")
+
+        deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
+        machine =3D get_bb_var('MACHINE')
+        fitimage_its_path =3D os.path.join(deploy_dir_image,
+            "u-boot-its-%s" % (machine,))
+        fitimage_path =3D os.path.join(deploy_dir_image,
+            "u-boot-fitImage-%s" % (machine,))
+
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't=
 exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (f=
itimage_path))
+
+        # Check that the os, load address, entrypoint address and default
+        # values for u-boot, ATF and TEE in Image Tree Source are as expec=
ted.
+        # The order of fields in the below array is important. Not all the
+        # fields are tested, only the key fields that wont vary between
+        # different architectures.
+        its_field_check =3D [
+            'description =3D "A model description";',
+            'os =3D "u-boot";',
+            'load =3D <0x80080000>;',
+            'entry =3D <0x80080000>;',
+            'description =3D "Trusted Execution Environment";',
+            'os =3D "tee";',
+            'load =3D <0x80180000>;',
+            'entry =3D <0x80180000>;',
+            'description =3D "ARM Trusted Firmware";',
+            'os =3D "arm-trusted-firmware";',
+            'load =3D <0x80280000>;',
+            'entry =3D <0x80280000>;',
+            'default =3D "conf";',
+            'loadables =3D "atf", "tee", "uboot";',
+            'fdt =3D "fdt";'
+        ]
+
+        with open(fitimage_its_path) as its_file:
+            field_index =3D 0
+            for line in its_file:
+                if field_index =3D=3D len(its_field_check):
+                    break
+                if its_field_check[field_index] in line:
+                    field_index +=3D1
+
+        if field_index !=3D len(its_field_check): # if its equal, the test=
 passed
+            self.assertTrue(field_index =3D=3D len(its_field_check),
+                "Fields in Image Tree Source File %s did not match, error =
in finding %s"
+                % (fitimage_its_path, its_field_check[field_index]))
+
+
+    def test_sign_standalone_uboot_atf_tee_fit_image(self):
+        """
+        Summary:     Check if U-Boot FIT image and Image Tree Source (its)=
 are
+                     created and signed correctly for the scenario where o=
nly
+                     the U-Boot proper fitImage is being created and signe=
d.
+        Expected:    1. Create atf and tee dummy images
+                     2. U-Boot its and FIT image are built successfully
+                     3. Scanning the its file indicates signing is enabled
+                        as requested by SPL_SIGN_ENABLE (using keys genera=
ted
+                        via UBOOT_FIT_GENERATE_KEYS)
+                     4. Dumping the FIT image indicates signature values
+                        are present
+                     5. Examination of the do_uboot_assemble_fitimage
+                     runfile/logfile indicate that UBOOT_MKIMAGE, UBOOT_MK=
IMAGE_SIGN
+                     and SPL_MKIMAGE_SIGN_ARGS are working as expected.
+                Product:     oe-core
+                Author:      Jamin Lin <jamin_lin@aspeedtech.com>
+        """
+        a_comment =3D "a smart cascaded U-Boot ATF TEE comment"
+        config =3D """
+# There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
+# least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
+MACHINE =3D "qemuarm"
+UBOOT_MACHINE =3D "am57xx_evm_defconfig"
+SPL_BINARY =3D "MLO"
+
+# The kernel-fitimage class is a dependency even if we're only
+# creating/signing the U-Boot fitImage
+KERNEL_CLASSES =3D " kernel-fitimage"
+
+# Enable creation and signing of the U-Boot fitImage
+UBOOT_FITIMAGE_ENABLE =3D "1"
+SPL_SIGN_ENABLE =3D "1"
+SPL_SIGN_KEYNAME =3D "spl-oe-selftest"
+SPL_SIGN_KEYDIR =3D "${TOPDIR}/signing-keys"
+UBOOT_DTB_BINARY =3D "u-boot.dtb"
+UBOOT_ARCH =3D "arm"
+SPL_MKIMAGE_DTCOPTS =3D "-I dts -O dtb -p 2000"
+SPL_MKIMAGE_SIGN_ARGS =3D "-c '%s'"
+UBOOT_EXTLINUX =3D "0"
+UBOOT_FIT_GENERATE_KEYS =3D "1"
+UBOOT_FIT_HASH_ALG =3D "sha256"
+
+# (U-boot) fitImage properties
+UBOOT_LOADADDRESS =3D "0x80080000"
+UBOOT_ENTRYPOINT =3D "0x80080000"
+UBOOT_FIT_DESC =3D "A model description"
+
+# Enable creation of the TEE fitImage
+UBOOT_FIT_TEE =3D "1"
+
+# TEE fitImage properties
+UBOOT_FIT_TEE_IMAGE =3D "${TOPDIR}/tee-dummy.bin"
+UBOOT_FIT_TEE_LOADADDRESS =3D "0x80180000"
+UBOOT_FIT_TEE_ENTRYPOINT =3D "0x80180000"
+
+# Enable creation of the ATF fitImage
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE =3D "1"
+
+# ATF fitImage properties
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE =3D "${TOPDIR}/atf-dummy.bin"
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS =3D "0x80280000"
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT =3D "0x80280000"
+""" % a_comment
+
+        self.write_config(config)
+
+        # Create an ATF dummy image
+        atf_dummy_image =3D os.path.join(self.builddir, "atf-dummy.bin")
+        cmd =3D 'dd if=3D/dev/random of=3D%s bs=3D1k count=3D64' % (atf_du=
mmy_image)
+        result =3D runCmd(cmd)
+        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status),=
 result.output)
+
+        # Create a TEE dummy image
+        tee_dummy_image =3D os.path.join(self.builddir, "tee-dummy.bin")
+        cmd =3D 'dd if=3D/dev/random of=3D%s bs=3D1k count=3D64' % (tee_du=
mmy_image)
+        result =3D runCmd(cmd)
+        self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status),=
 result.output)
+
+        # The U-Boot fitImage is created as part of the U-Boot recipe
+        bitbake("virtual/bootloader")
+
+        deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
+        machine =3D get_bb_var('MACHINE')
+        fitimage_its_path =3D os.path.join(deploy_dir_image,
+            "u-boot-its-%s" % (machine,))
+        fitimage_path =3D os.path.join(deploy_dir_image,
+            "u-boot-fitImage-%s" % (machine,))
+
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't=
 exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (f=
itimage_path))
+
+        req_itspaths =3D [
+            ['/', 'images', 'uboot'],
+            ['/', 'images', 'uboot', 'signature'],
+            ['/', 'images', 'fdt'],
+            ['/', 'images', 'fdt', 'signature'],
+            ['/', 'images', 'tee'],
+            ['/', 'images', 'tee', 'signature'],
+            ['/', 'images', 'atf'],
+            ['/', 'images', 'atf', 'signature'],
+        ]
+
+        itspath =3D []
+        itspaths =3D []
+        linect =3D 0
+        sigs =3D {}
+        with open(fitimage_its_path) as its_file:
+            linect +=3D 1
+            for line in its_file:
+                line =3D line.strip()
+                if line.endswith('};'):
+                    itspath.pop()
+                elif line.endswith('{'):
+                    itspath.append(line[:-1].strip())
+                    itspaths.append(itspath[:])
+                elif itspath and itspath[-1] =3D=3D 'signature':
+                    itsdotpath =3D '.'.join(itspath)
+                    if not itsdotpath in sigs:
+                        sigs[itsdotpath] =3D {}
+                    if not '=3D' in line or not line.endswith(';'):
+                        self.fail('Unexpected formatting in %s sigs sectio=
n line %d:%s' % (fitimage_its_path, linect, line))
+                    key, value =3D line.split('=3D', 1)
+                    sigs[itsdotpath][key.rstrip()] =3D value.lstrip().rstr=
ip(';')
+
+        for reqpath in req_itspaths:
+            if not reqpath in itspaths:
+                self.fail('Missing section in its file: %s' % reqpath)
+
+        reqsigvalues_image =3D {
+            'algo': '"sha256,rsa2048"',
+            'key-name-hint': '"spl-oe-selftest"',
+        }
+
+        for itspath, values in sigs.items():
+            reqsigvalues =3D reqsigvalues_image
+            for reqkey, reqvalue in reqsigvalues.items():
+                value =3D values.get(reqkey, None)
+                if value is None:
+                    self.fail('Missing key "%s" in its file signature sect=
ion %s' % (reqkey, itspath))
+                self.assertEqual(value, reqvalue)
+
+        # Dump the image to see if it really got signed
+        uboot_tools_sysroot_native =3D self._setup_uboot_tools_native()
+        dumpimage_path =3D os.path.join(uboot_tools_sysroot_native, 'usr',=
 'bin', 'dumpimage')
+        result =3D runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+        in_signed =3D None
+        signed_sections =3D {}
+        for line in result.output.splitlines():
+            if line.startswith((' Image')):
+                in_signed =3D re.search(r'\((.*)\)', line).groups()[0]
+            elif re.match(' \w', line):
+                in_signed =3D None
+            elif in_signed:
+                if not in_signed in signed_sections:
+                    signed_sections[in_signed] =3D {}
+                key, value =3D line.split(':', 1)
+                signed_sections[in_signed][key.strip()] =3D value.strip()
+        self.assertIn('uboot', signed_sections)
+        self.assertIn('fdt', signed_sections)
+        self.assertIn('tee', signed_sections)
+        self.assertIn('atf', signed_sections)
+        for signed_section, values in signed_sections.items():
+            value =3D values.get('Sign algo', None)
+            self.assertEqual(value, 'sha256,rsa2048:spl-oe-selftest', 'Sig=
nature algorithm for %s not expected value' % signed_section)
+            value =3D values.get('Sign value', None)
+            self.assertEqual(len(value), 512, 'Signature value for section=
 %s not expected length' % signed_section)
+
+        # Check for SPL_MKIMAGE_SIGN_ARGS
+        # Looks like mkimage supports to add a comment but does not suppor=
t to read it back.
+        found_comments =3D FitImageTests._find_string_in_bin_file(fitimage=
_path, a_comment)
+        self.assertEqual(found_comments, 4, "Expected 4 signed and comment=
ed section in the fitImage.")
+
+        # Verify the signature
+        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitim=
age_path,
+                                         os.path.join(deploy_dir_image, 'u=
-boot-spl.dtb'))
+
--=20
2.25.1


