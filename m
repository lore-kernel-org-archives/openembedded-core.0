Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5028AC28B2F
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 02:20:56 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.43253.1742178046759311049
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 19:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=c9XWAUEC;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4306F103D1FFE;
	Mon, 17 Mar 2025 03:20:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742178044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DjY3pGNpAk/V2EhNbZev04XfOxK61DFwEdZuZQNlmSY=;
	b=c9XWAUEC8PjLrbuwumfRvRuz2xE2wcCijEVkogBDTzoJyqtHRcpBQVJ5a7HSNCFXHd1gJG
	dmabczcRDonpv3ryJhFbr9g2fXNOc8SVYdUCZQwTObisn6kfnqO/6YNCJCW7uo4O2sEMMV
	XfqAvJmnuW792V7AA7gO+xM9Ta8NPCK3fIgHx/KRxKgKKbZbo1Get2iek14NEoUgkXt0Qy
	he5ChYh2IP8/IYXKkaOwBFBHe4IBfJMmzgo1COq6Ph7gFdbZufoWT1hKtnICH4uD1hAXtQ
	9SKAz5HUSRuqTRQlFE3tO6FBwpkUi0COqcPZGo08RrwkUHHaiVpIDOBKeBnF8g==
Message-ID: <5eec935e-a336-42ad-a117-8a9eec31b9e5@denx.de>
Date: Mon, 17 Mar 2025 03:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] oe-selftest: fitimage add more u-boot tests
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250313184926.2605982-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250313184926.2605982-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 02:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213062

On 3/13/25 7:49 PM, Adrian Freihofer wrote:
> Add a new test function which checks that the device-tree of U-Boot
> contains the public keys which are required for checking the signature
> of the kernel FIT image at run-time.
> 
> Use this new _check_kernel_dtb function in the existing
> test_sign_cascaded_uboot_fit_image test case which already creates a
> build configuration with UBOOT_SIGN_ENABLE = "1" and keys for the kernel.
> But so far there was no check that the keys for the kernel verification
> got added to U-Boot's DTB.
> This test case checks the configuration where only the configuration
> nodes of the kernel FIT image are signed.
> 
> A new test case test_sign_uboot_kernel_individual checks the
> configuration with two keys and signed image and signed configuration
> nodes.
> This test case covers the use case which recently broke with commit:
>    OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
>                 u-boot: kernel-fitimage: Fix dependency loop if
>                 UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
> and got fixed with commit
>    OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
>                 u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
>                 behavior
> 
> This patch also fixes a few more details:
> - Use the get function to access the bb_var dicts where appropriate.
> - log bb_vars if oe-selftest is called with -v
> - Simplify the code by moving all the U-Boot related variables to the
>    _fit_get_bb_vars function.
> - Do not set FIT_GENERATE_KEYS = "1" without inheriting the
>    kernel-fitimage.bbclass which handles this variable.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/lib/oeqa/selftest/cases/fitimage.py | 130 ++++++++++++++++++++---
>   1 file changed, 118 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 721628d8e73..d79c8cf321a 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -56,10 +56,10 @@ class FitImageTestCase(OESelftestTestCase):
>           # Define some variables which are usually defined by the kernel-fitimage.bbclass.
>           # But for testing purpose check if the uboot-sign.bbclass is independent from
>           # the kernel-fitimage.bbclass
> -        fit_sign_numbits = bb_vars['FIT_SIGN_NUMBITS'] or "2048"
> -        fit_key_genrsa_args = bb_vars['FIT_KEY_GENRSA_ARGS'] or "-F4"
> -        fit_key_req_args =  bb_vars['FIT_KEY_REQ_ARGS'] or "-batch -new"
> -        fit_key_sign_pkcs = bb_vars['FIT_KEY_SIGN_PKCS'] or "-x509"
> +        fit_sign_numbits = bb_vars.get('FIT_SIGN_NUMBITS') or "2048"

This change seems unrelated , maybe split it into preparatory patch ?

> +        fit_key_genrsa_args = bb_vars.get('FIT_KEY_GENRSA_ARGS') or "-F4"
> +        fit_key_req_args =  bb_vars.get('FIT_KEY_REQ_ARGS') or "-batch -new"
> +        fit_key_sign_pkcs = bb_vars.get('FIT_KEY_SIGN_PKCS') or "-x509"
>   
>           uboot_sign_keydir = bb_vars['UBOOT_SIGN_KEYDIR']
>           sign_keys = [bb_vars['UBOOT_SIGN_KEYNAME']]
> @@ -112,6 +112,22 @@ class FitImageTestCase(OESelftestTestCase):
>           self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
>           self.assertIn("Signature check OK", result.output)
>   
> +    def _verify_dtb_property(self, dtc_bindir, dtb_path, node_path, property_name, req_property, absent=False):
> +        """Verify device tree properties
> +
> +        The fdtget utility from ftc-native is called and the property is compared.

dtc-native (typo) ?

> +        """
> +        fdtget_path = os.path.join(dtc_bindir, 'fdtget')
> +        cmd = '%s %s %s %s' % (fdtget_path, dtb_path, node_path, property_name)
> +        if absent:
> +            result = runCmd(cmd, ignore_status=True)
> +            self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
> +            self.assertIn("FDT_ERR_NOTFOUND", result.output)
> +        else:
> +            result = runCmd(cmd)
> +            self.logger.debug("%s\nreturned: %s\n%s", cmd, str(result.status), result.output)
> +            self.assertEqual(req_property, result.output.strip())
> +
>       @staticmethod
>       def _find_string_in_bin_file(file_path, search_string):
>           """find strings in a binary file
> @@ -145,7 +161,7 @@ class FitImageTestCase(OESelftestTestCase):
>   
>       @staticmethod
>       def _get_dtb_files(bb_vars):
> -        kernel_devicetree = bb_vars['KERNEL_DEVICETREE'] or ""
> +        kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE') or ""

Preparatory patch change too ?

>           if kernel_devicetree:
>               return [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
>           return []
> @@ -281,7 +297,6 @@ class FitImageTestCase(OESelftestTestCase):
>                       key = key.strip()
>                       value = value.strip()
>                   except ValueError as val_err:
> -                    self.logger.debug("dumpimage debug: %s = %s" % (key, line))
>                       # Handle multiple entries as e.g. for Loadables as a list
>                       if key and line.startswith("   "):
>                           value = sections[in_section][key] + "," + line.strip()
> @@ -377,6 +392,7 @@ class KernelFitImageTests(FitImageTestCase):
>               'UBOOT_SIGN_KEYNAME',
>           }
>           bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/kernel")
> +        self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))

Preparatory patch change too ?

>           return bb_vars
>   
>       def _config_add_uboot_env(self, config):
> @@ -877,12 +893,20 @@ class UBootFitImageTests(FitImageTestCase):
>           """
>           internal_used = {
>               'DEPLOY_DIR_IMAGE',
> +            'FIT_HASH_ALG',
> +            'FIT_KEY_GENRSA_ARGS',
> +            'FIT_KEY_REQ_ARGS',
> +            'FIT_KEY_SIGN_PKCS',
> +            'FIT_SIGN_ALG',
> +            'FIT_SIGN_INDIVIDUAL',
> +            'FIT_SIGN_NUMBITS',
>               'MACHINE',
>               'SPL_MKIMAGE_SIGN_ARGS',
>               'SPL_SIGN_ENABLE',
>               'SPL_SIGN_KEYNAME',
>               'UBOOT_ARCH',
>               'UBOOT_DTB_BINARY',
> +            'UBOOT_DTB_IMAGE',
>               'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT',
>               'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
>               'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
> @@ -898,9 +922,13 @@ class UBootFitImageTests(FitImageTestCase):
>               'UBOOT_FIT_USER_SETTINGS',
>               'UBOOT_FITIMAGE_ENABLE',
>               'UBOOT_NODTB_BINARY',
> +            'UBOOT_SIGN_ENABLE',
>               'UBOOT_SIGN_IMG_KEYNAME',
> +            'UBOOT_SIGN_KEYDIR',
> +            'UBOOT_SIGN_KEYNAME',
>           }
>           bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), "virtual/bootloader")
> +        self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
>           return bb_vars
>   
>       def _bitbake_fit_image(self, bb_vars):
> @@ -1082,6 +1110,50 @@ class UBootFitImageTests(FitImageTestCase):
>               self.assertEqual(found_comments, num_signatures, "Expected %d signed and commented (%s) sections in the fitImage." %
>                                (num_signatures, a_comment))
>   
> +    def _check_kernel_dtb(self, bb_vars):
> +        """
> +        Check if the device-tree from U-Boot has the kernel public key(s).
> +
> +        The concat_dtb function of the uboot-sign.bbclass injects the public keys
> +        which are required for verifying the kernel at run-time into the DTB from
> +        U-Boot. The following example is from a build with FIT_SIGN_INDIVIDUAL
> +        set to "1". If it is set to "0" the key-the-kernel-image-key node is not
> +        present.
> +        / {
> +            ...
> +            signature {
> +                key-the-kernel-image-key {
> +                required = "image";
> +                algo = "sha256,rsa2048";
> +                ...
> +            };
> +            key-the-kernel-config-key {
> +                required = "conf";
> +                algo = "sha256,rsa2048";
> +                ...
> +            };
> +        };
> +        """
> +        # Setup u-boot-tools-native
> +        dtc_bindir = FitImageTestCase._setup_native('dtc-native')
> +
> +        # Check if 1 or 2 signature sections are in the DTB.
> +        uboot_dtb_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], bb_vars['UBOOT_DTB_IMAGE'])
> +        algo = "%s,%s" % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG'])
> +        if bb_vars['FIT_SIGN_INDIVIDUAL'] == "1":
> +            uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
> +            key_dtb_path = "/signature/key-" + uboot_sign_img_keyname
> +            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "required", "image")
> +            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "algo", algo)
> +            self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "key-name-hint", uboot_sign_img_keyname)
> +
> +        uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
> +        key_dtb_path = "/signature/key-" + uboot_sign_keyname
> +        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "required", "conf")
> +        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "algo", algo)
> +        self._verify_dtb_property(dtc_bindir, uboot_dtb_path, key_dtb_path, "key-name-hint", uboot_sign_keyname)
> +
> +
>       def test_uboot_fit_image(self):
>           """
>           Summary:     Check if Uboot FIT image and Image Tree Source
> @@ -1174,9 +1246,9 @@ UBOOT_FIT_HASH_ALG = "sha256"
>                           via UBOOT_FIT_GENERATE_KEYS)
>                        3) Dumping the FIT image indicates signature values
>                           are present
> -                     4) Examination of the do_uboot_assemble_fitimage
> -                     runfile/logfile indicate that UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN
> -                     and SPL_MKIMAGE_SIGN_ARGS are working as expected.
> +                     4) Examination of the do_uboot_assemble_fitimage that
> +                     UBOOT_MKIMAGE, UBOOT_MKIMAGE_SIGN and SPL_MKIMAGE_SIGN_ARGS
> +                     are working as expected.

Preparatory patch change too ?

Sorry for the delayed reply.

