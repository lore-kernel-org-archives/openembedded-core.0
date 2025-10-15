Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00653CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 17:13:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.23594.1760548419896981163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 10:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mu5qGSB/;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47106fc51faso8568185e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760548418; x=1761153218; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=No0SMuQwNYBTYB87MdlFI5nh3ZG/Y2RLLPvPqbzBuLs=;
        b=mu5qGSB/y1Hjq6yxJo9q96spkz18jrs7U43p81VXXHClrBk+WRrrfJNY5Z6djNXbNW
         oCUYr+wWSNhxcfn0JDcHpWGeVUrdYLhYHY2LknUnDBMUypfXYOJVcnj+6VnFLyKbVBYn
         4aC+dBOuM3nbGW3fhzMD8hpkm536mGvs3OSfUGBCeh0mG5j/Wlc9+0hGa647TFQkkaKC
         +OrVDheI/zfLC4oSGLjhDaQoB9n5h2q2iYj/OOzzFF3JAAuDynqdoahIJsAXYgNzR5kE
         BNa7OnjCiIj1AlqEJjLK/nuOa1TDcFwVvirDv7loUIbFuLa71jIXoADT88bIl3sw728v
         FrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760548418; x=1761153218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=No0SMuQwNYBTYB87MdlFI5nh3ZG/Y2RLLPvPqbzBuLs=;
        b=IvQ9V1mFYY/oMEFImIQ4drcV973BinKaXlNI2nYOJk7AsRJCAJuSKf9uObG5AHFvR7
         uMyH/9YXeOWRaE43ucnL9KAx2A/edDj2xa1zpswVzpqTrE4wPxo85Owjxb0l8V/E9Rwt
         DEL6Vx8C6DD7vUShUyRJxQpFhF9R5MeaWH8xFldN4W2WVdVfYlzoYYeeqzc2RD3hlCdx
         N6CiCAz2Q7nvMOkMCvecptYwJIA5SMZAGH4CEckE21B6ZF7H2+4XE8aK6cq56GKC4vFv
         pJE3eEiX6nCydbUezDUuk1SsHeCcH9UEHAHHdpGuGJG9O70eIjYVfWCLp1QGn9XkMCn+
         Hzbw==
X-Gm-Message-State: AOJu0YwuGo/5VOQLgBHFbHbSGzD/jg/rqXRDmpQKcqR1XA80y84IHyLZ
	1bXXzIlVqPPoswIE/Z5m6PYIVL3sRi5jSiNLdiTzvEQe91wxTgiJzUluyQdM0Mo4w3pC4Q6ATjV
	n9ubSEyfyzZLdt9nzKY3W6Lg8v7dC7P/OvYUWTwQ=
X-Gm-Gg: ASbGncsjCcya9vtqtTXfYg+wN8DwSCTQLb1ACu60NYQ0ZROmJk4A6pg36n7P9MXxCLg
	7uBISy7rSBWui0Z+83ATmD+m0bfDgRQ7q4dnOrpSq1yPQUwFPhemWoJj4l5yF/LxAIrvgZAGeGt
	uyoy2gM1kW3TiLiyTOTC+V9KEuKV+MVkDRhI2CnoB2Voql91IvILjmD1Nmzy185F+L42bG2YUwj
	qNFb3j58tjrsX8Zh4+4YBoYeylY
X-Google-Smtp-Source: AGHT+IFIOTB0U8B71iPKOj1S001N/FgDMpXtlrv5no3D4yc8RjOf7EO+zgdP3Leo/f+pojE2xXtFmRAc+qoljRfLhHw=
X-Received: by 2002:a05:600c:6487:b0:46e:4783:1a7a with SMTP id
 5b1f17b1804b1-46fa9a8f37emr207816345e9.3.1760548417852; Wed, 15 Oct 2025
 10:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251015080502.1704801-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20251015080502.1704801-1-kavinaya@qti.qualcomm.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Wed, 15 Oct 2025 19:13:25 +0200
X-Gm-Features: AS18NWDE4vFQ8QhyQWMmmAwtDMQSZcqyBiU7jtDZDgFpU1XSPxYAf4VLKbAzWYo
Message-ID: <CAB3asfhhUoscOusRRkjWavdC3QvqROuo4WvZnVH2O0sCsuB1oA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7] kernel-fit-image: allow overriding DTB
 compatible string
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000000e57df0641359f0b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 17:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224901

--0000000000000e57df0641359f0b
Content-Type: text/plain; charset="UTF-8"

Thank you for the updated patch. It looks well integrated with the existing
code now.
I have only a few questions about some details now.

Am Mi., 15. Okt. 2025 um 10:05 Uhr schrieb Kavinaya S via
lists.openembedded.org <kavinaya=qti.qualcomm.com@lists.openembedded.org>:

> The Linux kernel allows multiple DTBs to share the same compatible string.
> For example:
> qcs6490-rb3gen2.dtb
> qcs6490-rb3gen2-vision-mezzanine.dtb
> qcs6490-rb3gen2-industrial-mezzanine.dtb
>
> All of these use the same base compatible string:
> compatible = "qcom,qcs6490-rb3gen2", "qcom,qcm6490";
>

What I don't quite understand yet is: Does this make sense from the kernel
or DTB perspective? Or are we circumventing problems that should be fixed
on the kernel or DTB side instead of overriding them on the Yocto side? I
mean, wouldn't it make more sense to assign a compatible string that is
useful for u-boot in the DTB without requiring FIT_DTB_COMPATIBLE_OVERRIDE?
>
>
> Since the latter two DTBs are overlays on top of the base DTB and do not
> modify platform properties, they retain the same compatible string.
>
> When these DTBs are bundled into a single fitImage, the bootloader cannot
> distinguish between them due to identical compatible strings.
>
> To address this, introduce a mechanism to override the compatible string
> using a BitBake variable:
> FIT_DTB_COMPATIBLE_OVERRIDE[<dtb_name>] = "<compatible_string>"
>
> This overrides the compatible string generated resulting in unique entries
> in the
> generated .its file. For example:
> FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =
> "qcom,qcs6490-rb3gen2-vision"
> FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =
> "qcom,qcs6490-rb3gen2-vision qcom,qcm6490"
>
> Results in:
>
> compatible = "qcom,qcs6490-rb3gen2-vision";
> compatible = "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";
>

Would it be easier to understand these two examples like that?

For example:
FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =
"qcom,qcs6490-rb3gen2-vision"
results in
compatible = "qcom,qcs6490-rb3gen2-vision";

or
FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =
"qcom,qcs6490-rb3gen2-vision qcom,qcm6490"
results in
compatible = "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";


> Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
> Suggested-By: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass |  7 ++-
>  meta/conf/image-fitimage.conf                | 16 +++++++
>  meta/lib/oe/fitimage.py                      | 16 +++++--
>  meta/lib/oeqa/selftest/cases/fitimage.py     | 50 ++++++++++++++++++++
>  4 files changed, 84 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> b/meta/classes-recipe/kernel-fit-image.bbclass
> index f04aee1807..0a6125b3b6 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -84,8 +84,13 @@ python do_compile() {
>
>              # Copy the dtb or dtbo file into the FIT image assembly
> directory
>              shutil.copyfile(os.path.join(kernel_deploydir, dtb_name),
> dtb_name)
> +
> +            dtb_base = os.path.splitext(os.path.basename(dtb_name))[0]
> +            compatible_override_str =
> d.getVarFlag("FIT_DTB_COMPATIBLE_OVERRIDE", dtb_base) or ""
> +
>              root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
> -                d.getVar("UBOOT_DTB_LOADADDRESS"),
> d.getVar("UBOOT_DTBO_LOADADDRESS"))
> +                d.getVar("UBOOT_DTB_LOADADDRESS"),
> d.getVar("UBOOT_DTBO_LOADADDRESS"),
> +                compatible_override=compatible_override_str)
>
>      if external_kernel_devicetree:
>          # iterate over all .dtb and .dtbo files in the external kernel
> devicetree directory
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
> index 090ee148f4..9c51b28095 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -65,3 +65,19 @@ FIT_ADDRESS_CELLS ?= "1"
>  # Machine configurations needing such a script file should include it in
> the
>  # SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
>  FIT_UBOOT_ENV ?= ""
> +
> +# For specific DTBs, add custom "compatible" strings when creating FIT
> images.
> +# Format:
> +#   FIT_DTB_COMPATIBLE_OVERRIDE[<dtb_name>] = "<compatible_string>"
> +#
> +# Result:
> +#   dtb_name.dtb {
> +#    ...
> +#    compatible = "compatible_string";
> +#   };
> +#   Example:
> +#   FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =
> "qcom,qcs6490-rb3gen2-vision"
> +#   This will result in compatible string like:
> +#   compatible = "qcom,qcs6490-rb3gen2-vision";
> +#
> +#
> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index f303799155..fc37ce7665 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -289,7 +289,8 @@ class ItsNodeRootKernel(ItsNode):
>          self._kernel = kernel_node
>
>      def fitimage_emit_section_dtb(self, dtb_id, dtb_path,
> dtb_loadaddress=None,
> -                                  dtbo_loadaddress=None,
> add_compatible=False):
> +                                  dtbo_loadaddress=None,
> add_compatible=False,
> +                                  compatible_override=None):
>          """Emit the fitImage ITS DTB section"""
>          load=None
>          dtb_ext = os.path.splitext(dtb_path)[1]
> @@ -309,7 +310,10 @@ class ItsNodeRootKernel(ItsNode):
>          # Preserve the DTB's compatible string to be added to the
> configuration node
>          compatible = None
>          if add_compatible:
> -            compatible = get_compatible_from_dtb(dtb_path)
> +            if compatible_override:
> +                compatible = str(compatible_override).split()
>

Is this str conversion good or bad? The "if compatible_override:" ensures
it is not None. What else could be assigned to compatible_override? Or
would it be better to just throw the exception (probably something like
datatype x does not have a split() function) to the user and stop
immediately? (same question for the other, same change)


> +            else:
> +                compatible = get_compatible_from_dtb(dtb_path)
>
>          dtb_node = self.its_add_node_dtb(
>              "fdt-" + dtb_id,
> @@ -321,12 +325,16 @@ class ItsNodeRootKernel(ItsNode):
>          )
>          self._dtbs.append(dtb_node)
>
> -    def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_path,
> add_compatible=False):
> +    def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_path,
> add_compatible=False,
> +                                        compatible_override=None):
>          """Add a configuration node referring to another DTB"""
>          # Preserve the DTB's compatible string to be added to the
> configuration node
>          compatible = None
>          if add_compatible:
> -            compatible = get_compatible_from_dtb(dtb_path)
> +            if compatible_override:
> +                compatible = str(compatible_override).split()
> +            else:
> +                compatible = get_compatible_from_dtb(dtb_path)
>
>          dtb_id = os.path.basename(dtb_path)
>          dtb_alias_node = ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id,
> compatible)
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py
> b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 195b9ee8b5..d32d7b6e2f 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -819,6 +819,56 @@ MACHINE:forcevariable = "beaglebone-yocto"
>          # The alias is a symlink, therefore the compatible string is equal
>          self.assertEqual(comp_alias, comp)
>
> +    def test_fitimage_custom_compatible_in_its(self):
> +        """
> +        Verify that FIT_DTB_COMPATIBLE_OVERRIDE[...] is honored in the
> generated .its.
> +        This test:
> +        1) Selects beaglebone-yocto machine and a DTB that is part of its
> kernel.
> +        2) Sets FIT_DTB_COMPATIBLE_EXTENTION[am335x-bonegreen-ext] to a
> custom string.
> +        3) Runs do_assemble_fitimage to generate the FIT .its.
> +        4) Asserts the .its 'compatible = ...' includes custom compatible
> string.
> +
>
why an empty line?

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
> +# Original compatibles: "ti,am335x-bone-green", "ti,am335x-bone-black"
> +FIT_DTB_COMPATIBLE_OVERRIDE[{dtb_name}] = "subtypeA"
> +
>
>>
>> why an empty line?
> +"""
> +        self.write_config(config)
> +
> +        bitbake('virtual/kernel:do_deploy')
>
Why is this first bitbake call needed? It should be a dependency of
bitbake('linux-yocto-fitimage:do_deploy'),

> +        bitbake('linux-yocto-fitimage:do_deploy')
> +
> +        # Find the generated .its in DEPLOY_DIR_IMAGE
> +        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> +        self.assertTrue(deploy_dir_image and
> os.path.isdir(deploy_dir_image),
> +                    f"DEPLOY_DIR_IMAGE not found or invalid:
> {deploy_dir_image}")

+
> +        its_path = os.path.join(deploy_dir_image, 'fit-image.its')
> +        self.assertTrue(os.path.exists(its_path), f"Expected ITS file not
> found: {its_path}")
>
self.assertExists(its_path) ?

> +
> +        # Read the ITS content
> +        its_text = Path(its_path).read_text(encoding='utf-8',
> errors='ignore')
>

Missing import?
from pathlib import Path


> +
> +        # Assertions: extended compatibles must appear
> +        if "compatible" in its_text:
> +            self.assertIn('subtypeA', its_text)
> +        else:
> +            pass
> +
>

This test does not do much. It also does not re-use the existing test
functions for parsing its files.
Maybe we can merge it as it is and improve it later. See the last commit
from
https://git.yoctoproject.org/poky-contrib/log/?h=adrianf/fitimage-improvements.
It replaces the test witch a quicker implementation.

Regards,
Adrian



>      def test_fit_image_ext_dtb_dtbo(self):
>          """
>          Summary:     Check if FIT image and Image Tree Source (its) are
> created correctly.
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224881):
> https://lists.openembedded.org/g/openembedded-core/message/224881
> Mute This Topic: https://lists.openembedded.org/mt/115767371/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000e57df0641359f0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for the updated patch. It looks well integr=
ated with the existing code now.</div><div>I have only a few questions abou=
t some details now.</div><div><br></div><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Mi., 15. Okt. 2025 u=
m 10:05=C2=A0Uhr schrieb Kavinaya S via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;kavinaya=3D<a href=3D"mailto:qti.qual=
comm.com@lists.openembedded.org">qti.qualcomm.com@lists.openembedded.org</a=
>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The Linux=
 kernel allows multiple DTBs to share the same compatible string.<br>
For example:<br>
qcs6490-rb3gen2.dtb<br>
qcs6490-rb3gen2-vision-mezzanine.dtb<br>
qcs6490-rb3gen2-industrial-mezzanine.dtb<br>
<br>
All of these use the same base compatible string:<br>
compatible =3D &quot;qcom,qcs6490-rb3gen2&quot;, &quot;qcom,qcm6490&quot;;<=
br></blockquote><div><br></div>What I don&#39;t quite understand yet is: Do=
es this make sense from the kernel or DTB perspective? Or are we circumvent=
ing problems that should be fixed on the kernel or DTB side instead of over=
riding them on the Yocto side? I mean, wouldn&#39;t it make more sense to a=
ssign a compatible string that is useful for u-boot in the DTB without requ=
iring FIT_DTB_COMPATIBLE_OVERRIDE?<blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Since the latter two DTBs are overlays on top of the base DTB and do not<br=
>
modify platform properties, they retain the same compatible string.<br>
<br>
When these DTBs are bundled into a single fitImage, the bootloader cannot<b=
r>
distinguish between them due to identical compatible strings.<br>
<br>
To address this, introduce a mechanism to override the compatible string<br=
>
using a BitBake variable:<br>
FIT_DTB_COMPATIBLE_OVERRIDE[&lt;dtb_name&gt;] =3D &quot;&lt;compatible_stri=
ng&gt;&quot;<br>
<br>
This overrides the compatible string generated resulting in unique entries =
in the<br>
generated .its file. For example:<br>
FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =3D &quot;qco=
m,qcs6490-rb3gen2-vision&quot;<br>
FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =3D &quot;qco=
m,qcs6490-rb3gen2-vision qcom,qcm6490&quot;<br>
<br>
Results in:<br>
<br>
compatible =3D &quot;qcom,qcs6490-rb3gen2-vision&quot;;<br>
compatible =3D &quot;qcom,qcs6490-rb3gen2-vision&quot;, &quot;qcom,qcm6490&=
quot;;<br></blockquote><div><br></div><div>Would it be easier to understand=
 these two examples like that?</div><div><br></div><div> For example:<br>
FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =3D &quot;qco=
m,qcs6490-rb3gen2-vision&quot;</div><div>results in<br>
compatible =3D &quot;qcom,qcs6490-rb3gen2-vision&quot;;</div><div><br></div=
><div>or</div><div>FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezza=
nine] =3D &quot;qcom,qcs6490-rb3gen2-vision qcom,qcm6490&quot;<br></div><di=
v>results in<br></div><div>compatible =3D &quot;qcom,qcs6490-rb3gen2-vision=
&quot;, &quot;qcom,qcm6490&quot;;</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Suggested-By: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Suggested-By: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.q=
ualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br=
>
Signed-off-by: Kavinaya S &lt;<a href=3D"mailto:kavinaya@qti.qualcomm.com" =
target=3D"_blank">kavinaya@qti.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-fit-image.bbclass |=C2=A0 7 ++-<br>
=C2=A0meta/conf/image-fitimage.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 16 +++++++<br>
=C2=A0meta/lib/oe/fitimage.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +++++--<br>
=C2=A0meta/lib/oeqa/selftest/cases/fitimage.py=C2=A0 =C2=A0 =C2=A0| 50 ++++=
++++++++++++++++<br>
=C2=A04 files changed, 84 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-re=
cipe/kernel-fit-image.bbclass<br>
index f04aee1807..0a6125b3b6 100644<br>
--- a/meta/classes-recipe/kernel-fit-image.bbclass<br>
+++ b/meta/classes-recipe/kernel-fit-image.bbclass<br>
@@ -84,8 +84,13 @@ python do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Copy the dtb or dtbo file=
 into the FIT image assembly directory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfile(os.path.joi=
n(kernel_deploydir, dtb_name), dtb_name)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_base =3D os.path.splitext(os=
.path.basename(dtb_name))[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible_override_str =3D d.ge=
tVarFlag(&quot;FIT_DTB_COMPATIBLE_OVERRIDE&quot;, dtb_base) or &quot;&quot;=
<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root_node.fitimage_emit_sec=
tion_dtb(dtb_name, dtb_name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&quot;UBO=
OT_DTB_LOADADDRESS&quot;), d.getVar(&quot;UBOOT_DTBO_LOADADDRESS&quot;))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&quot;UBO=
OT_DTB_LOADADDRESS&quot;), d.getVar(&quot;UBOOT_DTBO_LOADADDRESS&quot;),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible_overrid=
e=3Dcompatible_override_str)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if external_kernel_devicetree:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# iterate over all .dtb and .dtbo files i=
n the external kernel devicetree directory<br>
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf<=
br>
index 090ee148f4..9c51b28095 100644<br>
--- a/meta/conf/image-fitimage.conf<br>
+++ b/meta/conf/image-fitimage.conf<br>
@@ -65,3 +65,19 @@ FIT_ADDRESS_CELLS ?=3D &quot;1&quot;<br>
=C2=A0# Machine configurations needing such a script file should include it=
 in the<br>
=C2=A0# SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.<b=
r>
=C2=A0FIT_UBOOT_ENV ?=3D &quot;&quot;<br>
+<br>
+# For specific DTBs, add custom &quot;compatible&quot; strings when creati=
ng FIT images.<br>
+# Format:<br>
+#=C2=A0 =C2=A0FIT_DTB_COMPATIBLE_OVERRIDE[&lt;dtb_name&gt;] =3D &quot;&lt;=
compatible_string&gt;&quot;<br>
+#<br>
+# Result:<br>
+#=C2=A0 =C2=A0dtb_name.dtb {<br>
+#=C2=A0 =C2=A0 ...<br>
+#=C2=A0 =C2=A0 compatible =3D &quot;compatible_string&quot;;<br>
+#=C2=A0 =C2=A0};<br>
+#=C2=A0 =C2=A0Example:<br>
+#=C2=A0 =C2=A0FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine=
] =3D &quot;qcom,qcs6490-rb3gen2-vision&quot;<br>
+#=C2=A0 =C2=A0This will result in compatible string like:<br>
+#=C2=A0 =C2=A0compatible =3D &quot;qcom,qcs6490-rb3gen2-vision&quot;;<br>
+#<br>
+#<br>
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py<br>
index f303799155..fc37ce7665 100644<br>
--- a/meta/lib/oe/fitimage.py<br>
+++ b/meta/lib/oe/fitimage.py<br>
@@ -289,7 +289,8 @@ class ItsNodeRootKernel(ItsNode):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._kernel =3D kernel_node<br>
<br>
=C2=A0 =C2=A0 =C2=A0def fitimage_emit_section_dtb(self, dtb_id, dtb_path, d=
tb_loadaddress=3DNone,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtbo_loadaddress=3DNone, add_=
compatible=3DFalse):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtbo_loadaddress=3DNone, add_=
compatible=3DFalse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible_override=3DNone):<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Emit the fitImage ITS D=
TB section&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load=3DNone<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_ext =3D os.path.splitext(dtb_path)[1]=
<br>
@@ -309,7 +310,10 @@ class ItsNodeRootKernel(ItsNode):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Preserve the DTB&#39;s compatible strin=
g to be added to the configuration node<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if add_compatible:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D get_compatible_fr=
om_dtb(dtb_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if compatible_override:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D str=
(compatible_override).split()<br></blockquote><div><br></div><div>Is this s=
tr conversion good or bad? The &quot;if=C2=A0compatible_override:&quot; ens=
ures it is not None. What else could be assigned to=C2=A0compatible_overrid=
e? Or would it be better to just throw the exception (probably something li=
ke datatype x does not have a split() function) to the user and stop immedi=
ately? (same question for the other, same change)</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D get=
_compatible_from_dtb(dtb_path)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_node =3D self.its_add_node_dtb(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fdt-&quot; + dtb_id,<=
br>
@@ -321,12 +325,16 @@ class ItsNodeRootKernel(ItsNode):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._dtbs.append(dtb_node)<br>
<br>
-=C2=A0 =C2=A0 def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_=
path, add_compatible=3DFalse):<br>
+=C2=A0 =C2=A0 def fitimage_emit_section_dtb_alias(self, dtb_alias_id, dtb_=
path, add_compatible=3DFalse,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatib=
le_override=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Add a configuration nod=
e referring to another DTB&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Preserve the DTB&#39;s compatible strin=
g to be added to the configuration node<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if add_compatible:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D get_compatible_fr=
om_dtb(dtb_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if compatible_override:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D str=
(compatible_override).split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D get=
_compatible_from_dtb(dtb_path)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_id =3D os.path.basename(dtb_path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_alias_node =3D ItsNodeDtbAlias(&quot;=
fdt-&quot; + dtb_id, dtb_alias_id, compatible)<br>
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selft=
est/cases/fitimage.py<br>
index 195b9ee8b5..d32d7b6e2f 100644<br>
--- a/meta/lib/oeqa/selftest/cases/fitimage.py<br>
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py<br>
@@ -819,6 +819,56 @@ MACHINE:forcevariable =3D &quot;beaglebone-yocto&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The alias is a symlink, therefore the c=
ompatible string is equal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(comp_alias, comp)<br>
<br>
+=C2=A0 =C2=A0 def test_fitimage_custom_compatible_in_its(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Verify that FIT_DTB_COMPATIBLE_OVERRIDE[...] i=
s honored in the generated .its.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This test:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1) Selects beaglebone-yocto machine and a DTB =
that is part of its kernel.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 2) Sets FIT_DTB_COMPATIBLE_EXTENTION[am335x-bo=
negreen-ext] to a custom string.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 3) Runs do_assemble_fitimage to generate the F=
IT .its.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 4) Asserts the .its &#39;compatible =3D ...&#3=
9; includes custom compatible string.<br>
+<br></blockquote><div>why an empty line?=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dtb =3D &quot;am335x-bonegreen-ext.dtb&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_name =3D os.path.splitext(os.path.basename=
(kernel_dtb))[0]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D f&quot;&quot;&quot;<br>
+DISTRO =3D &quot;poky&quot;<br>
+MACHINE =3D &quot;beaglebone-yocto&quot;<br>
+<br>
+# Ensure the FIT flow is active<br>
+KERNEL_CLASSES +=3D &quot;kernel-fit-extra-artifacts &quot;<br>
+<br>
+# Ensure the selected DTB is built into the kernel deploy output<br>
+KERNEL_DEVICETREE =3D &quot;{kernel_dtb}&quot;<br>
+<br>
+# Original compatibles: &quot;ti,am335x-bone-green&quot;, &quot;ti,am335x-=
bone-black&quot;<br>
+FIT_DTB_COMPATIBLE_OVERRIDE[{dtb_name}] =3D &quot;subtypeA&quot;<br>
+<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br></blockquote><di=
v>why an empty line?=C2=A0</div>+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(config)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;virtual/kernel:do_deploy&#39;)<br=
></blockquote><div>Why is this first bitbake call needed? It should be a de=
pendency of bitbake(&#39;linux-yocto-fitimage:do_deploy&#39;),</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;linux-yocto-fitimage:do_deploy&#3=
9;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Find the generated .its in DEPLOY_DIR_IMAGE<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_dir_image =3D get_bb_var(&#39;DEPLOY_DI=
R_IMAGE&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(deploy_dir_image and os.path.i=
sdir(deploy_dir_image),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&qu=
ot;DEPLOY_DIR_IMAGE not found or invalid: {deploy_dir_image}&quot;)</blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 its_path =3D os.path.join(deploy_dir_image, &#=
39;fit-image.its&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.exists(its_path), f&qu=
ot;Expected ITS file not found: {its_path}&quot;)<br></blockquote><div>self=
.assertExists(its_path) ?=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Read the ITS content<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 its_text =3D Path(its_path).read_text(encoding=
=3D&#39;utf-8&#39;, errors=3D&#39;ignore&#39;)<br></blockquote><div><br></d=
iv><div>Missing import?</div><div>from pathlib import Path</div><div></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Assertions: extended compatibles must appear=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;compatible&quot; in its_text:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;subtypeA&#39;=
, its_text)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br></blockquote><div><br></div><div>This test does not do much. It also d=
oes not re-use the existing test functions for parsing its files.</div><div=
>Maybe we can merge it as it is and improve it later. See the last commit f=
rom=C2=A0<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dadri=
anf/fitimage-improvements">https://git.yoctoproject.org/poky-contrib/log/?h=
=3Dadrianf/fitimage-improvements</a>. It replaces the test witch a quicker =
implementation.</div><div><br></div><div>Regards,</div><div>Adrian</div><di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
=C2=A0 =C2=A0 =C2=A0def test_fit_image_ext_dtb_dtbo(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Summary:=C2=A0 =C2=A0 =C2=A0Check if FIT =
image and Image Tree Source (its) are created correctly.<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224881): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224881" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224881</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115767371/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115767371/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com=
" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000e57df0641359f0b--

