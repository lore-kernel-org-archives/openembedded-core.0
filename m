Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4A2CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:29:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.16117.1761211776570037406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IivI9hu7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BA2EC0C40D
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 09:29:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 327366062C;
	Thu, 23 Oct 2025 09:29:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92130102F2459;
	Thu, 23 Oct 2025 11:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761211773; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7qy8uhfp83RNjH7Z/1t9V2RF39gx8xaC5FZuhG8A9rU=;
	b=IivI9hu7rYFUScpql0xojvcRHmMbEFr16JtQyEbGm9ng/UBs9IR/jN9N7nFjsmCl290BoX
	OmLkyz4sl3nQUjYn3Bcz4L3P9VKhHQnh1metf2ju7y6P0h4SDxkVCiuZmisGqK1fLYKma9
	0RiGiRAGFhfWz1Jv8w0pfVnIqT3Og1NNLsg9Jn6ITvyAYHPREHi3n4XvcxzM8+7ZzHLazh
	KZUCi6HamUwH8dsYgEhKGwXFYElkia6r437on3wpZwz/gjuyAZWN6J+B7gUEf+OyMsL/Ny
	1n+i7qa8Juyq0o+Ek9Mn3jIcZlWYTlhqCCzJ5LWCbILqQ5We1TdY3pjrw3gnJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Oct 2025 11:29:28 +0200
Message-Id: <DDPLGSYQI5FH.36Z3B285WOQTG@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] kernel-fit-image: enable compatible string
 for kernel built-in DTBs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <kavinaya@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
References: <20251013055300.2425913-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20251013055300.2425913-1-kavinaya@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 09:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225227

On Mon Oct 13, 2025 at 7:53 AM CEST, Kavinaya S via lists.openembedded.org =
wrote:
> At present, the kernel-fit-image bbclass is adding compatible strings onl=
y
> for external DTBs, omitting them for DTBs built from the kernel tree. Thi=
s
> behavior is limiting the ability to clearly identify the DTBs in FIT imag=
e
> that includes multiple kernel built-in DTBs and possibly mix of in tree a=
nd
> external ones, due to lack of consistent compatible strings.
>
> To fix this, introduce a new BitBake variable, FIT_DTB_ADD_COMPATIBLE
> when set to "True", the bbclass will extract and include the compatible
> string from kernel-built DTBs also in the .its file, just like it does
> for external DTBs.
>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
>  meta/conf/image-fitimage.conf                | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-=
recipe/kernel-fit-image.bbclass
> index f04aee1807..3aa7a2e75a 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -85,7 +85,8 @@ python do_compile() {
>              # Copy the dtb or dtbo file into the FIT image assembly dire=
ctory
>              shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dt=
b_name)
>              root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
> -                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_=
LOADADDRESS"))
> +                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_=
LOADADDRESS"),
> +                add_compatible =3D bb.utils.to_boolean(d.getVar("FIT_DTB=
_ADD_COMPATIBLE"), False))
> =20
>      if external_kernel_devicetree:
>          # iterate over all .dtb and .dtbo files in the external kernel d=
evicetree directory
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.con=
f
> index 090ee148f4..35e0459d09 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -47,6 +47,9 @@ FIT_LINUX_BIN ?=3D "linux.bin"
>  # Allow user to select the default DTB for FIT image when multiple dtb's=
 exists.
>  FIT_CONF_DEFAULT_DTB ?=3D ""
> =20
> +# Allow user to choose if DTB in FIT image can have compatible strings.
> +FIT_DTB_ADD_COMPATIBLE ?=3D "False"

Hi,

If this is merged can you please send a patch documenting this variable, on
docs@lists.yoctoproject.org?

This should be added to the glossary:
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/varia=
bles.rst

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


