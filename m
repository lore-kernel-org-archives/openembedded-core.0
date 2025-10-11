Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974BCCCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 17:33:04 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.4508.1760203981554850063
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 10:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2xqLUqF;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7960d69f14bso20534226d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 10:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760203980; x=1760808780; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lfd5cB5Cb8G6I9Q6+v9hyAf7JNnPZTF9yj9SaYdS8Hs=;
        b=l2xqLUqFv9nGSowTf+BrdiQuFJTr43jt//I1+G36FVIX0FbsJgHkswfezrC////BdM
         edQmHRbh+sUDtE0CxhU5gspoPcVRv1MDXcFPCBVw3eJOgAub32L8abShWjrzHJoKDUjr
         RaXlG0HNbFPSIE4PCNIJyysTqAQj6Eq7utiA3qyKg9jysF9IZrJIVGbLzGvZ1deoUsLm
         IX6hAwj0cp7DOBkTYyiJmj/KmrC/N4vaMOP9jRgIuaNIRNBUnebDnOWwhS+HhLXJB1+5
         KZpZ3hb5myQYgUNHo/A2M+vTOu4hsqiJ726zr9pw36HR6r9amEE8Hczr87yrPBv/nSm+
         0hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760203980; x=1760808780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfd5cB5Cb8G6I9Q6+v9hyAf7JNnPZTF9yj9SaYdS8Hs=;
        b=TzS6Kd8tdips8hTcaWLWb8G6aYlrjIkzF91drzNHgrVqJqSgJ9Qn5488Fwam1iSafD
         eZdddMukamgtoQ170P8A45ORovTZP0aoiHk4rktcryEDNFTcxubFWhKA+74YcsjvGJFV
         I5bwDAPIHrj1sLCVkPM6SG3IxD34xzDPnZuhTX2ZpyGVAf+S/UTYaAaxVKAEZrti9562
         ekKZ421Fq0uZZdmbPbTXlUywbCvikzjLf/D6qbJmsHZwUd3bHYgv6Jc3tDFHhr0Cy4qo
         pv9HG2/mQpfznVoPZ81IUk8fHyiZWecCzAe4zuq0fgG5G4vCz0rcAZVotWsWQAAx0nOw
         hkfQ==
X-Gm-Message-State: AOJu0Yx9Kj/39HSO67e93yhc3yNu9MrIVgl8sJgdvo1WuPXC99Dh9hpV
	OB2lmPbQnzJ9fOiRFWjvP+rgrL2gOoF3Q8kXBM3CDOSuIZ//RihVctkYnHix/QQ5JsDfKnsNcLp
	uYYaKHJvtoh/KTZrOxYLqIgZDyPO3QbM=
X-Gm-Gg: ASbGncsBe12tNKOk1mhSuCEHLhkOPO2bkda99Z9YSHcOBxuZe26fhAZHzBnjGnJCuT4
	ImzKjlbolqDRGAioRar2rMQKEvyPvnJXSaEpq+NGqB3yE6cfq4rQbZbAhDn/P0J+keoOH+fDS+v
	nqdeLsmYYYFCpDIzK+zvWWfIiC2ijiwZWoJnG3GXy4RSFHvP/oURsN4dNqnc9sSm/aYrlyH3YZc
	U80lrsK1sCXfKKiy69SQq9bVaXBrk1QXAY4qy0/o0L3zUDfRQTulXRAazixy80KCuDfIgMYHZU2
	cbR6x7kHad24pLP3dbiqMdQ=
X-Google-Smtp-Source: AGHT+IFGPr8/+zBWMS27nV+xl4Tvpjjm070XIVc/Dghg3dh/AjLzpdH5S5/BMQW1Bir38dE6OAaUb8sMKSaaJWEdktk=
X-Received: by 2002:a05:622a:4ccf:b0:4d9:5ce:374a with SMTP id
 d75a77b69052e-4e6ead58551mr234223921cf.53.1760203980399; Sat, 11 Oct 2025
 10:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 11 Oct 2025 19:32:49 +0200
X-Gm-Features: AS18NWBY6sL-sQgLZorA6PhknxHjKe4egLdMY2ZV9CDVZRtgB2Hs8wvRWRTP8CI
Message-ID: <CANNYZj9CcHEcb=Ekiags9zY2bcCVAE=WoPAvkcGHFr98qWMEVA@mail.gmail.com>
Subject: Re: [PATCH v5] kernel-fit-image: allow extending compatible string
 property for DTBs
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 17:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224720

Just wanted to say this looks fine to me on a (very) quick read, so if
Dmitry and people on the patch review call have no objections, neither
do I. It needs to pass the autobuilder testing too, you will hear if
something goes wrong.

Alex

On Sat, 11 Oct 2025 at 11:48, Kavinaya S <kavinaya@qti.qualcomm.com> wrote:
>
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
>
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

