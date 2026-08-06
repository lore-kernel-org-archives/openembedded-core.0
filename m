Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45CEC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 09:18:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15701.1786007883849882348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 02:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UVmjzxpS;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MLMwXXdH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67694AKA1426365
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Aug 2026 09:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a9maKrM/oZx0PVT8MFElmVcn
	cJkKFfn13qfMQYO+0Q0=; b=UVmjzxpS93lUkK0I1NPcuivFZa+YXpZQqsaUJNjE
	I8uPvi05w7sDTTMimFnhH4d6saquwvsmD4BRVmDRwFXEmspnzELivwOXyghwhusW
	HfpwKoEZEPZeEeBszTzG5iwe9vHldQN5zriGYQCCKGW7AzrK71qG+Oz6HEOp10NC
	0RkA81RqRRj+93S4DqRjrvHKmR8WOQSaPeDsB7uz7E4HLvsry62wC6/C7vW4snLK
	i70m7zI7oVOcZyLD7fKNVfhUdg9CxtEt/A/Ck4RHldgjxdHiY6TyrPDL798vxfKV
	1/5nx0Kpsgq8yfMq08ygbsYzbDvhK1MSNmxFHiz0QclC/A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8prn91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 09:18:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso2200339a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 02:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007881; cv=none;
        d=google.com; s=arc-20260327;
        b=qgHgDrYaDXjzuiZZ0u4VdjyPVQFnGT1L2VFh2FA2RpcEYJwMte6v4lxobWpu+M4LSx
         5JbvWxZRY2D6APgcNGsAR28xKUbdM4qMTDSoobMbMBxDMY4gvwMNuVZC6yzO/Bo0zi2i
         qWN74eJliGc4tyJOAK9j0Rr4aLSVYyGHTqOGIs7Ak9sFyvQ5NvF1Wk+Bx4pzVSGIbJBW
         ntttrfwuAshWPyZdrC/QdwcSaoUC/UjfH586YOVbCj0J5Q5uypWUN+BkBFSzbxPSe/vn
         IkX6bZP4rWVlDicJwnZAB0ogPyeDFp3rfkid4JGGfCAWiVpcWpO15s2R5f3bLp07WimJ
         /BqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a9maKrM/oZx0PVT8MFElmVcncJkKFfn13qfMQYO+0Q0=;
        fh=67h9pZA9oLDAqOCvOlAIeX32v/fOgGk6/8xlHE3HTEw=;
        b=EeMBOh+bTOfCuHoMMLBw/137H5FSvTpS8fKHB42npFu3avlAFbXxlkC6c7WT+0kH/I
         5n2ekjz5BzgxapeWR1vi8ch/mjcGPxBJ0HNqFxV3lZ7wGPz3sMU3MPvKxPD/+eFj38jc
         yX1zDpYdUoUPKco0FB8m4NX9EdLh0oA29Pg0ywJECvvs9MaL4apAxsuUCXBPERhYvML2
         E2wYJr4w4ufFFEoCc1cT0AU3l2kIbBTwO7TCb9XptBnPCZE2BEa03SLT+RkPg3DUUg23
         ImuVTRtFqu85eb/RC4vOpKOyXGvGWRSHYE3CknAjdgERsrU/Bn9aY0wtKnMbiOaZ93zo
         IuHg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786007881; x=1786612681; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9maKrM/oZx0PVT8MFElmVcncJkKFfn13qfMQYO+0Q0=;
        b=MLMwXXdHNpwO6W/XGpTc9hlb+kgCJ02O6vW+RA72x3Jz4sDzUkt/IJu8qt8gD59B/n
         E0yeC9GzRJr/+xPbcNyRNNe5UrOGcRhnbCyra9izzQMbIlBZXUAbXDFaygKi2KWo8iiv
         tUPv+iyhS/qN0XqkgTDBN4xD4cYKhDG+VbjVJkNYH4dGfaQYf2wn7arhbdxqhBKMVYGj
         HYUlH/vSiLZ2vI4cgyCYcSoNnofYM0DRvUHPaIwqkwOzr4JdvlqQ5otKl032DeQXBYpC
         HrPWEvWsJZ9IG9fL1lougAamUIH55ohAWktUK9h5Y0Ich314YJGFQEm5PJdaBgHkZey4
         Kxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007881; x=1786612681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9maKrM/oZx0PVT8MFElmVcncJkKFfn13qfMQYO+0Q0=;
        b=aEvmc4Af3XQrbxfp3yu0bqRoVGW3w2F9L0T+HhYrjBiT6Qm73T1PFxLiavWGvARQHq
         DaKmwMjwcs542ZSKc6fQ5VaPC21QYG1hR7vHSCmHmD7cDYqovW2R5Y7bE31xjXS7Cn+c
         LgDMK54dhIGc/KU2jaIKD+oM5KGbBs0/VqPgBoo/4EENHuNMSOFIxkKcPThgLp3q54Mm
         jaWKowoHyXvOGf3LOfDNrvb0t6L/x0Fbz1Xhi7ZCBgwMBofV0eYtQxB3SVXoLxQY0M/f
         oF0U2fpBz70IxboC9p7jdW7XaTjIDco5bZav2H52Uct8kX5qvjJcnocmXb6IkjhcLk4i
         GBvA==
X-Gm-Message-State: AOJu0YwC4WlSKy42tlKf2lYBUpNv/+xUbP+1ZUWPsOm2tUIBOyQcqhoH
	KHwzH2Yn/eRei+lTIcoLt3SovEQGMZd3NQTZRQK0HM1eAON+Sh6wVN9APDIfy32YBVHfuNZp1FF
	VgAGmuU9QM0HmRdVlRJnYCgkLag+l1VMCnZvhZhDLH3v/sZXkHyeXpuA5mwL2KZrccflqcFUoW+
	OK5nCIIo9E4MHXBK1FAJ2u2g1rGOgJ83dRAc+RnUfCHTc0u0KGhmJ3L7A+AXoApbh2G+7c
X-Gm-Gg: AR+sD11KxrZZI8eUiu4CzLz/JO9x+bfKRIDtQd48Uo+htvU0M2C9g2eZGkGY75JL2dw
	MYxRlhiRBe+DnV8Owm3Ty4NZ4GsJrMHyn/wvYaJPy8MYbdsiA0tSubXyNvcFHdZo7ll8vH+JNyQ
	ruuDFpBNPWiyw7GwUGfUyuBLJQJXFPxnqrABqNtweDYWSSkdkaKW/Y9iWNbzo=
X-Received: by 2002:a05:6a21:697:b0:3c3:c3fb:2473 with SMTP id adf61e73a8af0-3cb85e736ecmr17639353637.20.1786007881315;
        Thu, 06 Aug 2026 02:18:01 -0700 (PDT)
X-Received: by 2002:a05:6214:1244:b0:8f0:b08d:1327 with SMTP id
 6a1803df08f44-9088125ea55mr145452146d6.20.1786007414213; Thu, 06 Aug 2026
 02:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260806051437.276400-1-zboszor@gmail.com> <20260806051437.276400-3-zboszor@gmail.com>
In-Reply-To: <20260806051437.276400-3-zboszor@gmail.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:10:02 +0100
X-Gm-Features: AUfX_mw4jJr3d5diVdKfkbLcJo8Nkr1E3zd3ycw6jKHc-NBWeSEiFLU3wc97-RI
Message-ID: <CADWMC-YSpVjazAaMwF7ztzZLTu3nmYWuusuA4QShpUGT1vC09w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] mesa, mesa-tools-native: Use mesa-libclc
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: multipart/alternative; boundary="0000000000007da0f906585d4190"
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MiBTYWx0ZWRfX8JIWkIE11noq
 dzcvCt/fUwvzPfx+DH/wgMcyNeqXTLooRCtOO34Dry06EKdWr/211PedcxXPHKjL6lRwF4ZYNXa
 3TPr6V1ItbEpM0b8XkhPgOVhQO7Wejg=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a74514a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=JaEKMs3pT05agOFGWCQA:9 a=QEXdDO2ut3YA:10 a=S1zkccnPAAAA:8
 a=16nshBjdmXcURYI_nMwA:9 a=u4cPTRW8R-78JMdz:21 a=lqcHg5cX4UMA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=acXkokOSj0xneluo_yeI:22
X-Proofpoint-GUID: -SU8R_XRVFEuIfIpiuB2wur62PcuJhzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MiBTYWx0ZWRfX3eUzOkDqhh9O
 HujzWEv3RYuC3MMuIEu/IkjZ0NjT13f9eBwWPkOcSkN67X2Sk1RgBqaRo7/W4/CDnAtoN+RQtYS
 PSo79g/wiVpWMBm1ziT73GAG6uOdFhH1kAVjR+1ij66VWjdBLRmX3RGcyvn+FxssPQ/C5KJwRLv
 kicAQ8uF1rq320RBqUtZWkb2S2ZN9UCzyWK1EmKZeaCan+cag/cir8n+KH+u+if+N73xOR8W0VV
 OncoRO/zRANLbV4YLtiULlBtHT2sMI9sozv8X8OjiNasRTX5inakq77ntxz1IaCjSydKV5hInyV
 eLCkidaz4QWoz2vVvHg3RdNRuYoY7PjTwXzSuo/X1b9exxCVIG0cYdUjs4Q78sXeQsIOS/9pGT8
 Jh3TFvkO0ICuv46HqYjJHmtv+N+TN5W/SsXkw6oPUiwtQ7J9TkQzIK68S+1SpOA8/8C/IKQgNk0
 0Hdb2ljS0/BZtBgsIpg==
X-Proofpoint-ORIG-GUID: -SU8R_XRVFEuIfIpiuB2wur62PcuJhzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 09:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242923

--0000000000007da0f906585d4190
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 6:15=E2=80=AFAM Zoltan Boszormenyi via lists.openemb=
edded.org
<zboszor=3Dgmail.com@lists.openembedded.org> wrote:

> According to the release notes at
> https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html
>
> | One important note for packagers is that there is now a Mesa community
> | maintained libclc fork that is verified to pass the OpenCL CTS with
> | Mesa/Rusticl, and will fix bugs after an upstream libclc major release
> | branch goes EoL. The Mesa build system will pick it up when available,
> | and fall back to upstream libclc if not. This libclc fork is not
> | verified for any other usages or users of libclc outside of Mesa.
>
> Rusticl would complain if about not this libclc fork is used due to
> OpenCL CTS compliance.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa.inc             | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> index 20207450bf..c495d2e8a8 100644
> --- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> @@ -11,7 +11,7 @@ PACKAGECONFIG +=3D "gallium-llvm"
>  # to PACKAGECONFIG like in mesa.inc
>  PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland',
> d)}"
>
> -DEPENDS +=3D "libclc-native spirv-tools-native spirv-llvm-translator-nat=
ive"
> +DEPENDS +=3D "mesa-libclc-native spirv-tools-native
> spirv-llvm-translator-native"
>
>  EXTRA_OEMESON +=3D " \
>      -Dmesa-clc=3Denabled -Dinstall-mesa-clc=3Dtrue
> -Dmesa-clc-bundle-headers=3Denabled \
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index a50b900cf2..fa51d62bfc 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -109,7 +109,7 @@ PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=
=3Dfalse"
>
>  # "opencl" also requires libclc and gallium-llvm to be present in
> PACKAGECONFIG!
>  # Be sure to enable them both for the target and for the native build.
> -PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue
> -Dmesa-clc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse,
> bindgen-cli-native clang libclc spirv-tools spirv-llvm-translator"
> +PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue
> -Dmesa-clc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse,
> bindgen-cli-native clang mesa-libclc spirv-tools spirv-llvm-translator"
>
>  X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage
> libxfixes xrandr xorgproto libxshmfence"
>  # "x11" requires "opengl"
> @@ -253,7 +253,7 @@ RPROVIDES:libopencl-mesa +=3D "virtual-opencl-icd"
>  RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
>  RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
>
> -RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'opencl', 'libclc', '', d)}"
> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'opencl', 'mesa-libclc', '', d)}"
>

Is it possible to have both versions installed side-by-side on the target?
I'm asking this because there might be a collision between the fork and the
original.

Jose


>
>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libgallium \
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242898):
> https://lists.openembedded.org/g/openembedded-core/message/242898
> Mute This Topic: https://lists.openembedded.org/mt/120622539/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007da0f906585d4190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 6, =
2026 at 6:15=E2=80=AFAM Zoltan Boszormenyi via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;zboszor=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">According t=
o the release notes at<br>
<a href=3D"https://lists.freedesktop.org/archives/mesa-dev/2026-August/2266=
90.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org=
/archives/mesa-dev/2026-August/226690.html</a><br>
<br>
| One important note for packagers is that there is now a Mesa community<br=
>
| maintained libclc fork that is verified to pass the OpenCL CTS with<br>
| Mesa/Rusticl, and will fix bugs after an upstream libclc major release<br=
>
| branch goes EoL. The Mesa build system will pick it up when available,<br=
>
| and fall back to upstream libclc if not. This libclc fork is not<br>
| verified for any other usages or users of libclc outside of Mesa.<br>
<br>
Rusticl would complain if about not this libclc fork is used due to<br>
OpenCL CTS compliance.<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-native.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a> | 2 +-<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-native=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a> b/meta/r=
ecipes-graphics/mesa/<a href=3D"http://mesa-tools-native.bb" rel=3D"norefer=
rer" target=3D"_blank">mesa-tools-native.bb</a><br>
index 20207450bf..c495d2e8a8 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-native.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-native.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a><br>
@@ -11,7 +11,7 @@ PACKAGECONFIG +=3D &quot;gallium-llvm&quot;<br>
=C2=A0# to PACKAGECONFIG like in mesa.inc<br>
=C2=A0PACKAGECONFIG +=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;x11 wayland&#39;, d)}&quot;<br>
<br>
-DEPENDS +=3D &quot;libclc-native spirv-tools-native spirv-llvm-translator-=
native&quot;<br>
+DEPENDS +=3D &quot;mesa-libclc-native spirv-tools-native spirv-llvm-transl=
ator-native&quot;<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dmesa-clc=3Denabled -Dinstall-mesa-clc=3Dtrue -Dmesa-c=
lc-bundle-headers=3Denabled \<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index a50b900cf2..fa51d62bfc 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -109,7 +109,7 @@ PACKAGECONFIG[opengl] =3D &quot;-Dopengl=3Dtrue, -Dopen=
gl=3Dfalse&quot;<br>
<br>
=C2=A0# &quot;opencl&quot; also requires libclc and gallium-llvm to be pres=
ent in PACKAGECONFIG!<br>
=C2=A0# Be sure to enable them both for the target and for the native build=
.<br>
-PACKAGECONFIG[opencl] =3D &quot;-Dgallium-rusticl=3Dtrue -Dmesa-clc-bundle=
-headers=3Denabled, -Dgallium-rusticl=3Dfalse, bindgen-cli-native clang lib=
clc spirv-tools spirv-llvm-translator&quot;<br>
+PACKAGECONFIG[opencl] =3D &quot;-Dgallium-rusticl=3Dtrue -Dmesa-clc-bundle=
-headers=3Denabled, -Dgallium-rusticl=3Dfalse, bindgen-cli-native clang mes=
a-libclc spirv-tools spirv-llvm-translator&quot;<br>
<br>
=C2=A0X11_DEPS =3D &quot;xorgproto virtual/libx11 libxext libxxf86vm libxda=
mage libxfixes xrandr xorgproto libxshmfence&quot;<br>
=C2=A0# &quot;x11&quot; requires &quot;opengl&quot;<br>
@@ -253,7 +253,7 @@ RPROVIDES:libopencl-mesa +=3D &quot;virtual-opencl-icd&=
quot;<br>
=C2=A0RPROVIDES:libgles2-mesa +=3D &quot;libgles3-mesa&quot;<br>
=C2=A0RPROVIDES:libgles2-mesa-dev +=3D &quot;libgles3-mesa-dev&quot;<br>
<br>
-RDEPENDS:libopencl-mesa +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;opencl&#39;, &#39;libclc&#39;, &#39;&#39;, d)}&quot;<br>
+RDEPENDS:libopencl-mesa +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;opencl&#39;, &#39;mesa-libclc&#39;, &#39;&#39;, d)}&quot;<br></=
blockquote><div><br></div><div>Is it possible to have both versions install=
ed side-by-side on the target?<br>I&#39;m asking this because there might b=
e a collision between the fork and the original.</div><div><br></div><div>J=
ose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
=C2=A0PACKAGES =3D+ &quot;libegl-mesa libegl-mesa-dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgallium \<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#242898): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/242898" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/242898</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120622539/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/120622539/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007da0f906585d4190--

