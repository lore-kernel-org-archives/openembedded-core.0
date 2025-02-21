Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF98C021B3
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 00:23:49 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.37816.1740183825575361516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 16:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=eiyQI8fc;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E49C10382D37;
	Sat, 22 Feb 2025 01:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740183823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNAGKpfBpblCsqKE78dm0P9t1LY2X1ktXK5is2KLc2E=;
	b=eiyQI8fcGxY6HRZe5BoMmiPsYAZVUoYxDtCeJc02jE5N7GLm7r2JV1bBErPit0b0gt1DOJ
	HKuzuE2Fy2QDe7UIcUr6+yJYdJ5T8cACqJnNGe5de5X5tA85WMFZf/oFWt9Ldr28w8yZ2L
	8WrrUKDAwR7ohc6AbbHRYvsN3JyjWK3UIjwKpFobqEpWQ0LGugbMQh5xpuzlVsT5U53hs8
	U8wB4HWQ5TMmZpz1RRwk1CGJTXeXDDtyt2kEYOP1BB73iGVuArJldg2bsayVYnHiEh7wuF
	zBwApz2U6VinEJ9v7JQd9o5SWkHnk7OWWTTH+FMO2uE+3IyKqsTs0f+ZsExyTg==
Message-ID: <42e80a56-168c-4a5e-b24b-c349af3a3fba@denx.de>
Date: Sat, 22 Feb 2025 00:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: Rogerio Guerra Borin <rogerio.borin@toradex.com>,
 Sean Anderson <seanga2@gmail.com>, Quentin Schulz
 <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
 <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
 <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
 <3341efe1-1515-4549-97ac-d3a82f71f16b@denx.de>
 <f5807fe9-d460-8f69-c480-84396db1fee8@gmail.com>
 <da99bdf6-49d6-4efa-861b-9277f01e0588@toradex.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <da99bdf6-49d6-4efa-861b-9277f01e0588@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 00:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211815

On 2/21/25 3:15 PM, Rogerio Guerra Borin wrote:
> Hey Marek and Sean,

Hi,

> I think we're discussing two different questions here and perhaps mixin=
g=20
> up them two :-)
>=20
> One question is: Should people sign "only" the individual subimages=20
> inside the FIT image? And I think we all agree that the answer is no=20
> because that image would be susceptible to mix-and-match attacks.
>=20
> Another question is: What's the behavior associated with the variable=20
> FIT_SIGN_INDIVIDUAL? And we've got two conflicting answers:
>=20
> (1) It selects between *either* signing individual images *or* signing=20
> the configuration.
> (2) It simply enables the signing of individual images but does not=20
> impact the signing of the configuration (which is always performed if=20
> UBOOT_SIGN_ENABLE=3D"1").
>=20
>  From what we talked, Marek believes the behavior follows (or should=20
> follow) item (1), but both the documentation and the observed behavior=20
> so far (up until commit d7bd9c62) follow item (2).
>=20
> So, in the end all we need to do is to decide on the *expected* behavio=
r=20
> between (1) and (2).
>=20
> In my view, behavior (2), which is the documented one, is the best=20
> choice because the user simply cannot sign *only* the individual images=
,=20
> being thus more foolproof (that is, the user simply cannot produce a=20
> signed image susceptible to the mix-and-match attack).

This is also redundant. Signing configurations also signs the images=20
referenced in those configurations.

Signing both images and configurations the way FIT_SIGN_INDIVIDUAL=3D1=20
only adds to complexity and confusion without really adding anything in=20
terms of security, I think this should be eventually removed.

> Besides that,=20
> since (2) is the observed behavior (up until commit d7bd9c62), changing=
=20
> it would be a breaking change, at least in my understanding.
>=20
>>>
>>> See the U-Boot documentation:
>>>
>>> https://docs.u-boot.org/en/latest/usage/fit/signature.html
>>>
>>> And especially this section:
>>>
>>> https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-=20
>>> configurations
>>>
>>> That is why I find the signing of both images and configurations odd.
>=20
> Checking the U-Boot docs, I see it says that it is possible to sign wit=
h=20
> multiple keys. So I don't think it contradicts or prevents what Yocto i=
s=20
> doing (signing config or config+images).
>=20
> Btw, the docs also says that each key has a property "required" which=20
> accepts values "image" or "conf". Here's a snippet of the produced U-=20
> Boot DTB (same on kirkstone and scarthgap pre d7bd9c62) when=20
> FIT_SIGN_INDIVIDUAL=3D"1":
>=20
> """
> $ fdtdump -s deploy/images/verdin-imx8mm/u-boot.dtb
> deploy/images/verdin-imx8mm/u-boot.dtb: found fdt at offset 0
> /dts-v1/;
> // magic:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0xd00dfeed
> // totalsize:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x10de8 (69096)
> // off_dt_struct:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x38
> // off_dt_strings:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xf530
> // off_mem_rsvmap:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28
> // version:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 17
> // last_comp_version:=C2=A0=C2=A0 16
> // boot_cpuid_phys:=C2=A0=C2=A0=C2=A0=C2=A0 0x0
> // size_dt_strings:=C2=A0=C2=A0=C2=A0=C2=A0 0x1664
> // size_dt_struct:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xf4f8
>=20
> / {
>  =C2=A0=C2=A0=C2=A0 interrupt-parent =3D <0x00000001>;
>  =C2=A0=C2=A0=C2=A0 #address-cells =3D <0x00000002>;
>  =C2=A0=C2=A0=C2=A0 #size-cells =3D <0x00000002>;
>  =C2=A0=C2=A0=C2=A0 model =3D "Toradex Verdin iMX8M Mini WB on Verdin D=
evelopment Board";
>  =C2=A0=C2=A0=C2=A0 compatible =3D "toradex,verdin-imx8mm-wifi-dev", "t=
oradex,verdin-...
>  =C2=A0=C2=A0=C2=A0 signature {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key-dev2 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req=
uired =3D "image";=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 <=3D=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alg=
o =3D "sha256,rsa2048";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,r-squared =3D <0x3956dbd5 0x8b651d3b 0xa621244b...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,modulus =3D <0xbcb94b0f 0x77f059c2 0xfb77ccac...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,exponent =3D <0x00000000 0x00010001>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,n0-inverse =3D <0x707813fd>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,num-bits =3D <0x00000800>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key=
-name-hint =3D "dev2";=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <=3D=
=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key-dev {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req=
uired =3D "conf";=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <=3D=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alg=
o =3D "sha256,rsa2048";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,r-squared =3D <0x06d11c22 0x56f31661 0x133143bb...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,modulus =3D <0xdb06864a 0x12a1e033 0x04b0b457...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,exponent =3D <0x00000000 0x00010001>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,n0-inverse =3D <0x8925c5c7>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsa=
,num-bits =3D <0x00000800>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key=
-name-hint =3D "dev";=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 <=3D=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0 aliases {
> ...
> """
>=20
> Basically, the "dev2" key is marked as required for checking images=20
> while the "dev" key is marked as required for checking the=20
> configurations. This seems perfectly acceptable by the U-Boot=20
> documentation and it works fine because the resulting kernel FIT image=20
> does get both signatures. To prove, here's the snippet for the kernel:
>=20
> """
> deploy/images/verdin-imx8mm/fitImage: found fdt at offset 0
> /dts-v1/;
> // magic:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0xd00dfeed
> // totalsize:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0xb86379 (12084089)
> // off_dt_struct:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x38
> // off_dt_strings:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb86010
> // off_mem_rsvmap:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x28
> // version:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 17
> // last_comp_version:=C2=A0=C2=A0 16
> // boot_cpuid_phys:=C2=A0=C2=A0=C2=A0=C2=A0 0x0
> // size_dt_strings:=C2=A0=C2=A0=C2=A0=C2=A0 0xd0
> // size_dt_struct:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xb85fd8
>=20
> / {
>  =C2=A0=C2=A0=C2=A0 timestamp =3D <0x00000000>;
>  =C2=A0=C2=A0=C2=A0 description =3D "Kernel fitImage for Torizon OS/6.6=
.74";
>  =C2=A0=C2=A0=C2=A0 #address-cells =3D <0x00000001>;
>  =C2=A0=C2=A0=C2=A0 images {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-1 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
cription =3D "Linux kernel";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a =3D [1f 8b 08 08 a6 ...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typ=
e =3D "kernel";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arc=
h =3D "arm64";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os =
=3D "linux";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
pression =3D "gzip";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loa=
d =3D <0x48200000>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ent=
ry =3D <0x48200000>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has=
h-1 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 value =3D <0x4abf5358 0x1069f770 0x4eccebee 0x6fa2fce0=
...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 algo =3D "sha256";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig=
nature-1 {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <=3D=3D=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 timestamp =3D <0x00000000>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 signer-version =3D "2024.01";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 signer-name =3D "mkimage";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 value =3D <0x1cc3293e 0x97759447 0x970a4cb2 0x4d904336=
...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 algo =3D "sha256,rsa2048";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 key-name-hint =3D "dev2";=C2=A0=C2=A0=C2=A0=C2=A0 <=3D=
=3D=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> ...
>  =C2=A0=C2=A0=C2=A0 configurations {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default =3D "conf-freescale=
_imx8mm-verdin-nonwifi-dahlia.dtb";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conf-freescale_imx8mm-verdi=
n-nonwifi-dahlia.dtb {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
cription =3D "1 Linux kernel, FDT blob";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ker=
nel =3D "kernel-1";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fdt=
 =3D "fdt-freescale_imx8mm-verdin-nonwifi-dahlia.dtb";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has=
h-1 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 algo =3D "sha256";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig=
nature-1 {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <=3D=3D=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 hashed-strings =3D <0x00000000 0x000000b4>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 hashed-nodes =3D "/", "/configurations/conf-=20
> freescale_imx8mm-verdin-nonwifi-dahlia.dtb", "/images/kernel-1", "/=20
> images/k...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 timestamp =3D <0x00000000>;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 signer-version =3D "2024.01";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 signer-name =3D "mkimage";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 value =3D <0x85d3c35c 0xeac899db...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 algo =3D "sha256,rsa2048";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 key-name-hint =3D "dev";=C2=A0=C2=A0=C2=A0=C2=A0 <=3D=3D=
=3D=3D
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 padding =3D "pkcs-1.5";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sign-images =3D "kernel", "fdt";
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> ...
> """
>=20
> Of course, I also agree with what Marek said that signing both=20
> configurations and images is redundant, but the Yocto docs (https://=20
> docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term-=20
> FIT_SIGN_INDIVIDUAL) says:
>=20
>  > If set to =E2=80=9C1=E2=80=9D, then the kernel-fitimage class will s=
ign the kernel,
>  > dtb and ramdisk images individually *in addition* to signing the FIT
>  > image itself. This could be useful if you are intending to verify
>  > signatures in *another context than booting via U-Boot*.
>=20
> Which leads me to the conclusion that the behavior pre d7bd9c62 is=20
> intended.
>=20
> Having said all of that, notice that if the decision was really to=20
> switch to interpretation (1) then other changes would be required=20
> besides those made to concat_dtb(). In particular, I imagine=20
> fitimage_emit_section_config() would require changes to avoid emitting=20
> the signature node for the configurations.
>=20
> Hope this clarifies things...
I am increasingly convinced that FIT_SIGN_INDIVIDUAL=3D1 is poorly=20
designed, but sadly here to stay.

