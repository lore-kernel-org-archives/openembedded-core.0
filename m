Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56B8C71136
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 00:20:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.9443.1749774050664668854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 17:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=I5Pd59BJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CIQWM4031684
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 00:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNmexbiln5SDuOWivG0Rs07uRsmeAid7m+zqVw+Ou+w=; b=I5Pd59BJHGM0opFt
	GC9ssGQRfWW1jInS0XHMXhQH9iFjAQDeERaE50iemGLWtSGDdf1MudlSJ6z7ii86
	3Bs5wZ6vFBqm3TrPPgQxOx8W6pCCt7sHMtm4g7zOH2cEZf050aYXmAFk/5U8D7RL
	cgJ/AO+O5p2N88NAFHdtPmylKyyoMAcFqqC4pPjkpo5nG598JmxHW3VIwh1pQbOb
	/SV7SolHatfHeGjiQ0SPbm2AH2vp9rmUNrbXHLxEN+hUqO09r7xG+5iQ/zlT0d57
	wWejSuu082r/EXYQyEhJ8Yhe+dzFVtSHh28IVqMeSYwEkzgNoBkGcxGxQZ0rvk1o
	4WsxPA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdwupjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 00:20:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabb9286f9so33535526d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 17:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749774049; x=1750378849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNmexbiln5SDuOWivG0Rs07uRsmeAid7m+zqVw+Ou+w=;
        b=ln9lAU9WIzG61UiNa32u+okQiu9FVVdWLKzwAKbvnnrcXf7hHVkWFylHKJDFnbdt7z
         WsBbPJr+rN2/I98Fx1/YqBWyXj7Exz5165gSTe6zbqGT0ciV0DvkS8Y/XwaSuwaHpykV
         MSYRDScwhIn1c0zU/UvU9U6fwVEd84tOW7Zw0V020rfdVFGL5oJdkXAWYvQQ59JOdKRi
         w9BHj17lkL2H6D0tm8EB7L4p0ZjIkivzP1piAo6gEZunMjoQFqer4P7Bw/u+DgMuvpPP
         ADNmUH5OKapLchTiQOtbeejrWoyOUgsHO4FYRsJjFeotaQ6uLRYf7npAA6+lhtJpSBOm
         x8Ow==
X-Gm-Message-State: AOJu0Yx6HYmVIVeLFtJXwRScdly1AeRmwh9diTP1GA3QthjzpvWZN2zZ
	dlD53YoSU+KCnX9PhkE2CjHyKorTrZCoLszW8/62mvDw8bNJUWrwgc6fdvKjAhvEkjVphx7pglT
	MMwXiqf/LbSCxZrot04LUdv7XC5zr0rN6cUjuQMgZImwMjn6Fz3Xiag1rkMsdqsEUvPcGa6zOKP
	2k1pSqMFU=
X-Gm-Gg: ASbGncuLagHDd4889riwLOf56HSso0q2jtb8IxN9MMhLEIkzuRyHupBucKPDHjErdlF
	9zCJJcd/3h4s0tqELPbF+BB+xxYhfsYnb22fcb1+xWhMyopEIKoZXON6IasQoCes/1hOjDxqR4d
	0mt8OL3R68UUAe3UdemPrGvCGUaVlwFXNcPuIwlhTx2va3I2N40qNjTUNRfkwKXf0AGXTgBA1lS
	eO6Lf/3QEDrWH1/BFfZrlUREEPhS1HiBQw8YYg4lPw0RwHg8/+lNiuXFL3WOBwYss8rU/avfm0S
	N5QIiJFFyYHFheENJ2/TVy6WcWvR5FvA2+4AB3Xq0lmrOv5MmtklewBKStNQuBZxOk4IIdHk5BG
	ms0S0KpC6p3m4paAZQ038RTeP9SUgNX8DWHwTb7nx7LkXHKyQ5ucF1JcE2KwSZiJMiEA/bwFxQH
	U=
X-Received: by 2002:a05:6214:4017:b0:6fa:d975:6572 with SMTP id 6a1803df08f44-6fb3e57bb31mr13365826d6.1.1749774048536;
        Thu, 12 Jun 2025 17:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRzO8DmIapVA7TRTANN2sSApUsDMEaYOMwTNLnxJR+fXj8+IAo4xvmnvvds5vVe1umc7maoQ==
X-Received: by 2002:a05:6214:4017:b0:6fa:d975:6572 with SMTP id 6a1803df08f44-6fb3e57bb31mr13365506d6.1.1749774047987;
        Thu, 12 Jun 2025 17:20:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c5:75d7:7c16:e0c3:624e:3f90? (2001-14bb-c5-75d7-7c16-e0c3-624e-3f90.rev.dnainternet.fi. [2001:14bb:c5:75d7:7c16:e0c3:624e:3f90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac13f0dbsm268565e87.85.2025.06.12.17.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 17:20:45 -0700 (PDT)
Message-ID: <730d068f-6a3f-4954-a225-d48a67adf468@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 03:20:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to fix Panfrost support in mesa?
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>
References: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
 <CAO9ioeUJVaovv7WTdP1V4KFRHeTK7Tv9LowrcG6V2OfvrJwpvQ@mail.gmail.com>
 <b7dd59f6-12b1-4bea-a340-16582aecb598@cherry.de>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <b7dd59f6-12b1-4bea-a340-16582aecb598@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAwMSBTYWx0ZWRfX127XAMRSsLVk
 bsSAZv9L/le0iBUdKOE+1vTYBJ1/9yggS+98NSaxgKnd8K2W9FLr7NYFcN1KihFPQpKPe0ay/qB
 FT+x2gQvlDfviYWev/OjaSZyuxhC1D2vdBbT1PvgEcdvo5ORhFSHsTQMyCHr7uWvhtpBp1SZdKM
 ovxXx13uoWMxzkoOT1bZtGEj/NUJujxT4SsI5rs0CGHpiIdjgYwkN1EyCNqrmW7pR7jexqZK7Sj
 7MawAPgMjS5kLXemCvRGDtDPReSVdEIJ7id2vInPF9fnYVHofkdfo0+p4zjf40eOEgN/CjFPf/u
 tMyFC86t4HiorXjfegVFk5lqYsw3B3vcTkmYIKjH1gG8+7fNpe6nJKrRxYd5y6L+m/DAz2v3oNw
 MKsV6+huRm4dE79u8xHzI/iCU7s8MYCnCKUomvnR8qdkyoDOa1ZONWhmRiKwiGPVRNkBwkHn
X-Proofpoint-ORIG-GUID: c0Rdo2_IwhfIU49hD8HzHuPs8iRwTUKu
X-Proofpoint-GUID: c0Rdo2_IwhfIU49hD8HzHuPs8iRwTUKu
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684b6ee1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=zMse-cnrm1i9FOfHnKAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130001
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 55CIQWM4031684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 00:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218543

On 12/06/2025 14:21, Quentin Schulz wrote:
> Hi Dmitry,
>=20
> On 6/11/25 10:08 PM, Dmitry Baryshkov wrote:
>> On Wed, 11 Jun 2025 at 18:33, Quentin Schulz=20
>> <quentin.schulz@cherry.de> wrote:
>>>
>>> Hi all,
>>>
>>> I've been trying to add support for Panthor (Panfrost for Mali Valhal=
l
>>> and later as far as I understood) to meta-rockchip a few months ago
>>> already and attempting again.
>>>
>>> I had managed to do something for an old mesa release but it doesn't
>>> work anymore. Worse, it seems that the current Panfrost support is=20
>>> broken :)
>>
>> That's an interesting claim. I hope you mean 'broken in OE-Core', not
>> 'broken in Mesa'.
>>
>=20
> Yes, I meant in the OE-Core recipe :)
>=20
>>>
>>> For starters, the build doesn't succeed unless we have both panfrost =
and
>>> libclc PACKAGECONFIG enabled. I believe this is due to 20970bcd9652
>>> ("panfrost: Add base of OpenCL C infrastructure") merged in 25.1.0. S=
o
>>> there are some changes required in mesa recipe to force libclc
>>> PACKAGECONFIG *in addition* to the panfrost PACKAGECONFIG for the who=
le
>>> thing to build. This shouldn't be too difficult though.
>>
>> This seems almost correct.
>>
>>>
>>> However, reading the aforementioned commit revealed something else (o=
r
>>> maybe I misunderstood :) ). It appears that LLVM is now required at
>>> build time for the Gallium driver, so that would make panfrost part o=
f
>>> GALLIUMDRIVERS_LLVM now. The issue is that it builds with and without
>>> gallium-llvm PACKAGECONFIG, and it seems to be running glmark2-es2-dr=
m
>>> just fine on RK3588 (G610; Valhall). So I'm not sure what to do here?
>>
>> If I understand correctly, panfrost requires at least mesa-clc /
>> panfrost-compile to be built for the build system. We support building
>=20
> Not sure? I believe panfrost-compile is always used (either by taking i=
t=20
> from the host or building it) whenever the gallium or vulkan dirver (or=
=20
> tools) for panfrost is enabled?

Yes. The idea is to build it only for the host, removing the need for=20
the target libclc / llvm / clang.

>=20
>> the former, but we don't support building the latter.
>> The quoted commit has the options to be passed to the meson when
>> building the 'host' binaries aka mesa-native and when cross-building
>> mesa.
>>
>> Though I'm really surprised that building of panfrost works w/o
>> gallium-llvm in the current mesa.inc
>>
>=20
> For the target recipe, gallium-llvm isn't selected right now, and addin=
g=20
> libclc is enough to make it pass the build. But we also set it for both=
=20
> target (by adding it manually) and native (already there, c.f.=20
> PACKAGECONFIG:append:class-native) recipes.

Okay, you are selecting gallium-llvm manually (for the target build).=20
Then it makes sense that the build passes.

>=20
> For the native recipe, gallium-llvm is always there (c.f.=20
> PACKAGECONFIG:append:class-native). So that might explain why you're=20
> surprised.
>=20
>>> Making it part of gallium-llvm drivers brings in clang{,-native} amon=
g
>>> other things which is horrifyingly long to compile.
>>
>> I think clang-native would be required at least.
>>
>> If you implement precomp-compilers in some way, the correct build
>> options would be:
>>
>=20
> I'm not sure it's necessarily worth it as one would need to have=20
> precomp-compilers + all drivers guarding this precomp-compilers (right=20
> now panfrost and asahi it seems) in the native recipe as well so that=20
> the target recipe could use it.

I was thinking about enabling corresponding options in the BSP layer.=20
But... then came the second thought. In the BSP layer we can use target=20
overrides to select options for the target mesa, but we can't similarily=20
change class-native PACKAGECONFIG.

>=20
>> PACKAGECONFIG:append:pn-mesa-native =3D " panfrost libclc gallium-llvm=
"
>=20
> libclc and gallium-llvm are already part of the mesa-native=20
> PACKAGECONFIG, I don't have panfrost there though and I would need it t=
o=20
> make use of precom-compiler=3Dsystem on the target recipe.
>=20
> Considering we would need panfrost in mesa-native (+ precomp_compiler)=20
> to be able to build panfrost on target, does it mean we should always=20
> have panfrost in native (in OE-Core) to avoid having to figure this is=20
> required from target recipe's perspective? or in BSP layers?

It seems so...I can't find a better way to handle it, provided we want=20
BSP layers to pass yocto-check-layer requirements.

>=20
>> PACKAGECONFIG:append:pn-mesa =3D " panfrost"
>>
>> Note, currently we don't pass -Dmesa-clc=3Dsystem if libclc is disable=
d.
>> Most likely that needs to be changed too.
>>
>=20
> The issue is that if mesa-clc=3Dsystem when libclc PACKAGECONFIG is=20
> disabled, we still need mesa-native (with libclc PACKAGECONFIG)=20
> otherwise it won't be found.

Yes, this is expected.

>=20
> However, maybe with this we can lighten up the dependencies in the=20
> target recipe in PACKAGECONFIG[libclc] to essentially only mesa-native?

Yes.

>=20
> It seems like maybe some PACKAGECONFIG (e.g. libclc, the upcoming=20
> precomp_compiler, etc...) should be native-only? What's the point of=20
> libclc for the target recipe for example? Is there even a point making=20
> those PACKAGECONFIG options maybe we could simply hardcode them in=20
> EXTRA_OEMESON for example for the target (always =3Dsystem for mesa-clc=
=20
> and precomp-compiler for the target recipe for example?)

libclc is required for RustiCL support. But then you can simply fold=20
libclc into opencl.

>=20
> I "quickly" hacked something together that would make panfrost build=20
> without requiring to add libclc to the target PACKAGECONFIG. This does =
a=20
> few things like using precomp-compilers from mesa-native and mesa-clc=20
> from mesa-native without requiring either PACKAGECONFIG in target=20
> recipe, forcefully adds mesa-native as dependency of target recipe=20
> (though maybe should only be added when libclc or precomp-compilers is=20
> not in target's PACKAGECONFIG?) and removes libclc spirv-tools spirv-=20
> llvm-translator from build dependencies for the target (panfrost builds=
=20
> fine, but is it correct?).
>=20
> """
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-=20
> graphics/mesa/mesa.inc
> index 9b41955132..746b5f7be9 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -97,7 +97,7 @@ INHIBIT_DEFAULT_RUST_DEPS =3D=20
> "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '',
>  =C2=A0PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm intel amd svg=
a"
>  =C2=A0PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm intel amd =
svga"
>  =C2=A0PACKAGECONFIG:append:i686 =3D " libclc gallium-llvm intel amd sv=
ga"
> -PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm amd svga"
> +PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm amd svga=20
> asahi panfrost precomp_compiler"
>=20
>  =C2=A0# "gbm" requires "opengl"
>  =C2=A0PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
> @@ -194,10 +194,18 @@ INSTALL_MESA_CLC =3D "false"
>  =C2=A0INSTALL_MESA_CLC:class-native =3D "true"
>  =C2=A0MESA_NATIVE =3D "mesa-native"
>  =C2=A0MESA_NATIVE:class-native =3D ""
> +MESA_PRECOMP_COMPILER =3D "system"
> +MESA_PRECOMP_COMPILER:class-native =3D "enabled"
> +INSTALL_MESA_PRECOMP_COMPILER =3D "false"
> +INSTALL_MESA_PRECOMP_COMPILER:class-native =3D "true"
> +MESA_CLC_DEPS =3D "mesa-native"
> +MESA_CLC_DEPS:class-native =3D "libclc spirv-tools spirv-llvm-translat=
or"
>=20
>  =C2=A0PACKAGECONFIG[gallium] =3D "-Dgallium-=20
> drivers=3D${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers=3D'',=
 libdrm"
>  =C2=A0PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3D=
enabled, -=20
> Dllvm=3Ddisabled, llvm llvm-native elfutils"
> -PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-=20
> clc=3D${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=3Denabled,,libclc s=
pirv-=20
> tools spirv-llvm-translator ${MESA_NATIVE}"
> +DEPENDS:append:class-target =3D "mesa-native"
> +PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-=20
> clc=3D${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=3Denabled,-Dmesa-=20
> clc=3Dsystem,${MESA_CLC_DEPS}"
> +PACKAGECONFIG[precomp_compiler] =3D "-Dprecomp-=20
> compiler=3D${MESA_PRECOMP_COMPILER} -Dinstall-precomp-=20
> compiler=3D${INSTALL_MESA_PRECOMP_COMPILER},-Dprecomp-compiler=3Dsystem=
,=20
> ${MESA_NATIVE}"

I'm not sure if we need a separate option here. I like your idea of=20
folding this into EXTRA_OEMESON.

>  =C2=A0PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddis=
abled,libva-=20
> initial"
>  =C2=A0PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-=20
> vdpau=3Ddisabled,libvdpau"
> """
>=20
> To be honest, at this point it's quite difficult for me to understand=20
> what's going on. I have zero experience with mesa, very little with=20
> meson and somehow panfrost builds with wildly different configurations=20
> and seems to run fine as well with glmark2-es2-drm/kmscube, so not sure=
=20
> when things are supposed to fail when misconfigured at build time :/
>=20
> I'm not sure everything I'm writing here makes sense.

It definitely does make sense for me.

>=20
> [...]
>=20
>>>
>>> On a side note, I'm also not entirely sure why we need
>>> softpipe,llvmpipe,r300,nouveau always enabled?
>>> Can't we make softpipe the default only when llvmpipe isn't enabled?

I forgot to comment here. I'd say, please don't turn it off=20
automatically (or at least allow it to be reenabled). I've seen several=20
times the case when llvmpipe crashes, but softpipe works. I don't=20
remember what was the cause, but it's nice to have both available.

>>> Do we really need r300 and nouveau always compiled? Can't we have a
>>> PACKAGECONFIG for those too? I see there's an amd PACKAGECONFIG alrea=
dy,
>>> maybe we can use that for r300 as well? For nouveau, a new nvidia
>>> PACKAGECONFIG maybe?
>>
>> This is really a good idea. Please send those, idepdendently of your
>> panfrost / panvk work.
>>
>=20
> OK, will try to come up with something :)
>=20
> Cheers,
> Quentin


--=20
With best wishes
Dmitry

