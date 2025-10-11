Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68728CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 19:03:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.5999.1760209427916359182
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 12:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ck7AxOGn;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4539dddd99so621351766b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760209426; x=1760814226; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFC10WIsuWjh/sCBRj2jhasvgSUm+E3MvMwdCYwtVrc=;
        b=ck7AxOGn0aXelHHkCb7hQKo8j/SZz8ldjhCH+ovBvGOOVvjZTVzfi/Usd2Zg1K0yR0
         Zk4wLlINuyauKJjVs3vVD7t7hC/zxOYBhvgg8CXKRvP3lr3K2BnXaD7kYOzgkaUuARQP
         l2tqF2iW0aOlVJfYP9V7TfTWper6bDEFFfQHBVWifAHZuv9oo1NTJIwZeOucHmZGNn5R
         XWftL23kawc7ApTyiLPbo3xsiZkecZ8XAqAb58/d++AA51dzV9y3Q8Lznf7N1KYV1nDk
         +9Gn/XbFpjR1+rEl/I6VL4itXV4pOYvAQaN96oZllDQr1ppbyBiqLKFOlqLruSDhhLZg
         STdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760209426; x=1760814226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFC10WIsuWjh/sCBRj2jhasvgSUm+E3MvMwdCYwtVrc=;
        b=TIr3c8O7BOgptdGwFa9yiJx/hVIRlrT/3Hus0rYaZUxjCRsFV3KJmTcgH2YrmYe81X
         PwAFfb0x+nym2vjN/KexuZe4h9pYGPKRQibkLgfvqxRDDcdOw81YCRZ6TsQEjjZvBnGf
         8od2axqnC01Js8J3Ie30PjMVDX51kAa4gz9NrXMxygk68swJdZtD4YdwGz+HaT4PTsL0
         TdfzPrKnaak53So+Eok8EPdKI9gstOzPyo5HoltHnVg0RXdO87prFouOwehYe+yCBLym
         rdFuMG7mvt7Rfd/l4lY5PIu5ze1mdpRmxSD9e88pYGPWNT6t7gTubg89FHoJlCcggKkY
         xJiA==
X-Forwarded-Encrypted: i=1; AJvYcCWNy1G9Y6Z/kpfh3yUYrtR1GHdYqKRyLCzARxaXxroj/vSeNiKJ4uO34L/YYV1d6wjuWnScwATWXHJ4l3GBStyOIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxexq7G3LG4ELLLfB9ZglQyGZucaE0rhTtLYGLZuiu4ZtggUZRl
	saDSGgtOfITkszh5xPJzDrEBVQNKONZQ/gcDSuwUgtvAys6YuD3QMAPI
X-Gm-Gg: ASbGncuYSCWaNJ1nJS58DtAWU7SaT2tIvT9odsQE4RLUEw8bhK+56nQRpowTa2EM1ik
	GDR+Q+7nsCmrXaU4qHGA2YIBDKj7QF8oeRjjbB+P3uvbDxWdIOxQqTYv2z2uSwwFbWlhC3fD/OR
	QNImcjmPNRVqQIigZf6ztK5A7ExUrHZO7CL0h+1o0YtYazJFy+kqzgLiSFngjm0bUa3scGtIUOA
	XduuaLsa6YFx84FA4SYEx6C8O/XhoKVzyYeq7HsgH6mo39VjwLReeW7eLkj+vF8cPNA7lxN8Whz
	FZlzX/C+fUEnFql6uYKLKglSO74CxEbbCtLCOKhY9aIVy9r3gIe9st0STN1GGZO7dW6qWvkwgY7
	VDFjGUSvH2BsxjWgPODK3bOIoY9aue0HYTBvrw8kB1xtlig1vLaEbghyRy3Kw
X-Google-Smtp-Source: AGHT+IG1Ga9Dg0EsdyM96U/hv0XCCaNLhGhRX5FXEd1v1Ora4TzPbtINY647vyag61GN57NSSuvEew==
X-Received: by 2002:a17:907:9407:b0:b2b:3481:93c8 with SMTP id a640c23a62f3a-b50aa3921e2mr1679831866b.19.1760209426012;
        Sat, 11 Oct 2025 12:03:46 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d61cbcb9sm548667666b.20.2025.10.11.12.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 12:03:45 -0700 (PDT)
Message-ID: <d20a854f-d795-44a1-a970-c40a01126e3e@gmail.com>
Date: Sat, 11 Oct 2025 21:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] kernel-fit-image: allow extending compatible
 string property for DTBs
To: kavinaya@qti.qualcomm.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 19:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224721

On 10/11/25 11:48, Kavinaya S via lists.openembedded.org wrote:
> The Linux kernel allows multiple DTBs to share the same compatible string.
> For example:
> qcs6490-rb3gen2.dtb
> qcs6490-rb3gen2-vision-mezzanine.dtb
> qcs6490-rb3gen2-industrial-mezzanine.dtb
>
> All of these use the same base compatible string:
> compatible = "qcom,qcs6490-rb3gen2", "qcom,qcm6490";
>
> Since the latter two DTBs are overlays on top of the base DTB and do not
> modify platform properties, they retain the same compatible string.
>
> When these DTBs are bundled into a single fitImage, the bootloader cannot
> distinguish between them due to identical compatible strings.
>
> To address this, introduce a mechanism to extend the compatible string
> using a OE build variable:
> FIT_DTB_COMPATIBLE_EXTENTION[dtb_name] = "extension"

One small note: "extension" is misspelled as "extention" multiple times
in the patch.

> This appends the extension to the first compatible string in the DTB,
> resulting in unique entries in the generated .its file. For example:
> FIT_DTB_COMPATIBLE_EXTENTION[qcs6490-rb3gen2-vision-mezzanine] = "vision"
> FIT_DTB_COMPATIBLE_EXTENTION[qcs6490-rb3gen2-industrial-mezzanine] = "industrial"
>
> Generates:
> compatible = "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";
> compatible = "qcom,qcs6490-rb3gen2-industrial", "qcom,qcm6490";
>
> Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
> Suggested-By: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass |  8 ++-
>  meta/conf/image-fitimage.conf                | 12 +++++
>  meta/lib/oe/fitimage.py                      |  4 +-
>  meta/lib/oeqa/selftest/cases/fitimage.py     | 52 ++++++++++++++++++++
>  4 files changed, 74 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> index f04aee1807..7850d565fc 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -84,8 +84,14 @@ python do_compile() {
>  
>              # Copy the dtb or dtbo file into the FIT image assembly directory
>              shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
> +
> +            # Consider compatible extention if avilable
> +            name, ext = os.path.splitext(dtb_name)
> +            extention = (d.getVarFlag("FIT_DTB_COMPATIBLE_EXTENTION", name) or "").strip()
> +
>              root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
> -                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
> +                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"),
> +                compatible_extention=extention)
>  
>      if external_kernel_devicetree:
>          # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
> index 090ee148f4..86948b6bf3 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -65,3 +65,15 @@ FIT_ADDRESS_CELLS ?= "1"
>  # Machine configurations needing such a script file should include it in the
>  # SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
>  FIT_UBOOT_ENV ?= ""
> +
> +# For specific DTBs extend "compatible" strings when creating FIT images.
> +# Format:
> +#   FIT_DTB_COMPATIBLE_EXTENTION[<dtb_name>] = "<extension>"
> +#
> +# Result:
> +#   dtb_name.dtb {
> +#    ...
> +#    compatible = "string1-extension", "string2", ...;
> +#   };
> +#
> +FIT_DTB_COMPATIBLE_EXTENTION ?= ""
> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index f303799155..98af4aad14 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
>          self._kernel = kernel_node
>  
>      def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
> -                                  dtbo_loadaddress=None, add_compatible=False):
> +                                  dtbo_loadaddress=None, add_compatible=False, compatible_extention=""):
>          """Emit the fitImage ITS DTB section"""
>          load=None
>          dtb_ext = os.path.splitext(dtb_path)[1]
> @@ -310,6 +310,8 @@ class ItsNodeRootKernel(ItsNode):
>          compatible = None
>          if add_compatible:
>              compatible = get_compatible_from_dtb(dtb_path)
> +            if compatible and compatible_extention:
> +                compatible[0] = compatible[0] + "-" + compatible_extention
>  
>          dtb_node = self.its_add_node_dtb(
>              "fdt-" + dtb_id,
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 195b9ee8b5..dfe34ccdec 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -17,6 +17,9 @@ from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var
>  
>  
> +from pathlib import Path
> +
> +
>  class BbVarsMockGenKeys:
>      def __init__(self, keydir, gen_keys="0", sign_enabled="0", keyname="", sign_ind="0", img_keyname=""):
>          self.bb_vars = {
> @@ -819,6 +822,55 @@ MACHINE:forcevariable = "beaglebone-yocto"
>          # The alias is a symlink, therefore the compatible string is equal
>          self.assertEqual(comp_alias, comp)
>  
> +    def test_fitimage_compatible_extn_in_its(self):
> +        """
> +        Verify that FIT_DTB_COMPATIBLE_EXTENTION[...] is honored in the generated .its.
> +
> +        This test:
> +        1) Selects beaglebone-yocto machine and a DTB that is part of its kernel.
> +        2) Sets FIT_DTB_COMPATIBLE_EXTENTION[am335x-bonegreen-ext] to custom extension.
> +        3) Runs do_assemble_fitimage to generate the FIT .its.
> +        4) Asserts the .its 'compatible = ...' includes extended ones.
> +
> +        """
> +
> +        kernel_dtb = "am335x-bonegreen-ext.dtb"
> +        dtb_name = os.path.splitext(os.path.basename(kernel_dtb))[0]
> +
> +        config = f"""
> +DISTRO = "poky"
> +MACHINE = "beaglebone-yocto"
> +
> +# Ensure the FIT flow is active
> +KERNEL_CLASSES += "kernel-fit-extra-artifacts "
> +
> +# Ensure the selected DTB is built into the kernel deploy output
> +KERNEL_DEVICETREE = "{kernel_dtb}"
> +
> +# Provide the extension as a varflag (pairs: base:suffix)
> +# Original compatibles: "ti,am335x-bone-green", "ti,am335x-bone-black"
> +FIT_DTB_COMPATIBLE_EXTENTION[{dtb_name}] = "subtypeA"
> +
> +"""
> +        self.write_config(config)
> +
> +        bitbake('virtual/kernel:do_deploy')
> +        bitbake('linux-yocto-fitimage:do_deploy')
> +
> +        # Find the generated .its in DEPLOY_DIR_IMAGE
> +        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> +        self.assertTrue(deploy_dir_image and os.path.isdir(deploy_dir_image),
> +                    f"DEPLOY_DIR_IMAGE not found or invalid: {deploy_dir_image}")
> +
> +        its_path = os.path.join(deploy_dir_image, 'fit-image.its')
> +        self.assertTrue(os.path.exists(its_path), f"Expected ITS file not found: {its_path}")
> +
> +        # Read the ITS content
> +        its_text = Path(its_path).read_text(encoding='utf-8', errors='ignore')
> +
> +        # Assertions: extended compatibles must appear
> +        self.assertIn('ti,am335x-bone-green-subtypeA', its_text)
> +
>      def test_fit_image_ext_dtb_dtbo(self):
>          """
>          Summary:     Check if FIT image and Image Tree Source (its) are created correctly.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224714): https://lists.openembedded.org/g/openembedded-core/message/224714
> Mute This Topic: https://lists.openembedded.org/mt/115702434/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


