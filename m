Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4667C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:10:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39433.1786097404743786953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=d0ealTKX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V0ACGhNg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67783QH83251901
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Aug 2026 10:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2a662sjPveqCR5qZW6DzfLwO
	Syo+ss48yL8vQ2GIF6U=; b=d0ealTKXjFFlMS0g3VxFE5CEL3+dRtD4GZkuQXb4
	ldyKjMtgF4Lvhc+ZXcW0ef0K8zvr0VxyfQzETccW5jRJYFiMb9kSIDg055/f8N2x
	TZ2zWHXfxmzZ6DNO8fpVhNMhgCJ0EE6pCjPAcZH/qZ/1xEUryiBZaduPuiyv8FGH
	H39U++oRf/m8+hQAPIvUkFHBoQnbyzQfEbG5z0KixtFU3UxdXXOp9MsqDVXAHGiA
	BVVW+DD6keKCw+O4+ioispYPqHagt7N2x6xtQdqKqrJQQdt8v45QTbLvHravvDLU
	oRRWDvPDGS5RPNXeV9ZhBVcGI6zgiNn5J7PFgz1UTs/vPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k3eqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:10:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9083b049f73so39280126d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 03:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786097402; cv=none;
        d=google.com; s=arc-20260327;
        b=Ce8RvIRCly4RT0rYCRV27+4vuz5jv4c5VFn21QGIZu85OribLFn/WpFi7GyHZOEX1i
         eCSe06di9jLEceWzoGn1pvbglTzzMMQyIETS/LBU6b0+9nwB1sFsbme8cF01Vk0efcg7
         ouJX121ILak00bPyOqHpDKyjgwqZXFI8GuWZGU0ZilDHYJ+54czinhGJHJcZjo+PC+ib
         9rX2LF3MgoBnnO4vcDH6IJhsvmm7Mr8gDlPmLCimkEI7nxgvp3heJxqzbChfytyufM4v
         d3TIG+g7A5/RUE6jE3/t29Edx9XFZMKDyxQXzu1sX9gkO50CN+YuPsyAnri+ppl01Kba
         3r6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2a662sjPveqCR5qZW6DzfLwOSyo+ss48yL8vQ2GIF6U=;
        fh=/5TDoTxlUgcNH4PxQajVoyy6mSQIMXOY3j7oIIRxLKw=;
        b=kcVIKwUPcRgdyhe7qpp5BFwgBsyz0bKKud7PvIeI8Tj/ApozdTX1Ag4R6J443lXIsG
         H+kP2hcA5xsK09jQPg5dlIueA022Uw7c4KeVmHMpx9MIs/nuNxF0XRbTgsJk9BgTaETy
         QZpS/a/kqHn9qTcBjCDRELywwsZuSXNozHi7uN4mj3QrKgMWPTBGyuXi19bfJf7ovLOC
         0qAZOZH1WN+roIyquX0hDjPhrhTPCY4Zjuv6XqRhK9aa4uaeqJOwhdX4I4zB0ZMDFmgH
         FpG+hYScRJLxf+ObUZ/IeX7DbeXWB/YzfM1SinaGgJ5b1yNBSVYf9PQZaKCZlipQxgN9
         BmCQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786097402; x=1786702202; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2a662sjPveqCR5qZW6DzfLwOSyo+ss48yL8vQ2GIF6U=;
        b=V0ACGhNgCRj9THKdQxcwm+T8Ps7g90f41Mdl6XVG50xvc7B83AUnyBxyvbLPTjEqb9
         KnHfiE3ryUUBdjh+KiF2nOGjPvaSZMPTlqMdXgNLMjo9yJef02quzYdLA+u0bW2gSGFh
         JEv7nZHKKsFziz/2y/U84T8Kd+YdbyhrcD81nHUs++nHjx+nnw9v4n3qlVYFGX1nYqbC
         UYZGvbk3rlTHBecXxBP/svJBGoakBNThyVqFXTduhLjLylUb6YmH1iWLSRB61IC3oLHH
         h5uRuA8WNRLqrOpsEZTNwgYa4H/klGu6hGFhZwRwCOWgoeatgmQmdL1l0LlmWrFkOcLd
         cx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097402; x=1786702202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2a662sjPveqCR5qZW6DzfLwOSyo+ss48yL8vQ2GIF6U=;
        b=bxrvLFxvhkx8+uJaog4mwQkCtakOJDKwLQeYRFeCv6KC8G0C/MiFlNrtkhrMrBJLEf
         0Kf7glyVfyAEbwIuDU1Ke8IwIIWkZGwz8CIukY0CTK+q+nuvGNdMYi2ePOJ6xUku9IHF
         Ejc0D7uoPTT2W05wQ4HelpKp5YuLui1Wqrq9JPWBgg6qkxrFNBqUuNbyhFX1KmD7XkTs
         JexkvH7f8vW0cSf/zZJDegcmR+OLGSS3yHUaFOIDpGtUjksK6r40D2CIAPDEuR2mV1Hd
         6c493V+9hncqEeSzXxzQ2PEX99oXyAXhdjydz8ti6z35SM2cP2vjCe5iU64/PveMjvAq
         TPCA==
X-Gm-Message-State: AOJu0YzMLXBth3VrjDFZxmSGAmYBlZxq88gFBZoL5lWwKswSHDv7pRGn
	YYH4PqzfBcZJzojyXXVT9V8lh0D3DAd4f7ipqGz99P45VIjV/AnLAM5mQ6FSqGwYiauFBD8y5al
	6cc69BA8of8rZBwg9bnEM6FtXZ/C1OEuGxUSi/l44Bo089X6XguArgSiKO3k3JTTjUqrYy98AlT
	sKwO3NNRR+QmWqGqO1FtBkeQJjGgFpoJkxhXf59ZWdEJvU+uLtTQvGKv1FO3TsM1lx+g==
X-Gm-Gg: AR+sD13xqcO/qPETNRTrAX3QFtAA3VfkGsGI6KrwyOCjZa6Z7Q+2xk8cCzaClVzAL2J
	+Qk8cayZxZQqqzymIcMobc8ZVVaDcK/0FsNxmrzilVjuSX3C8IrkG682Vo9sfSoYMAd41CGDV4o
	djMgMvR8+OPZ+vZZ9cdOAMyGaRxx4UzNXRgrMNRn+NDupRb1u+lbb2fdt/o6I=
X-Received: by 2002:ac8:5d53:0:b0:526:d595:c7fa with SMTP id d75a77b69052e-52d0b21b43amr82030291cf.31.1786097402124;
        Fri, 07 Aug 2026 03:10:02 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:526:d595:c7fa with SMTP id
 d75a77b69052e-52d0b21b43amr82029001cf.31.1786097401020; Fri, 07 Aug 2026
 03:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260806051437.276400-1-zboszor@gmail.com> <20260806051437.276400-3-zboszor@gmail.com>
 <CADWMC-YSpVjazAaMwF7ztzZLTu3nmYWuusuA4QShpUGT1vC09w@mail.gmail.com> <CAPeTZW8iCmgrchUe-etQLzaOx_i64kUG-OP+KVuE2t4YpPor1g@mail.gmail.com>
In-Reply-To: <CAPeTZW8iCmgrchUe-etQLzaOx_i64kUG-OP+KVuE2t4YpPor1g@mail.gmail.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 11:09:49 +0100
X-Gm-Features: AUfX_mwl4LNZOt1CRJEUnDzmKbB4hkkCH_DlvnfW_XezrZRpQmHlMTfv7RhU_Hk
Message-ID: <CADWMC-YRcy+ugr25CZzCD+bcmUpNqdba6ngfoLfSwPQYFXyYdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] mesa, mesa-tools-native: Use mesa-libclc
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: multipart/alternative; boundary="0000000000001f4e650658723594"
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a75aefb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=lUS2T67uIA0zUxiFP1AA:9 a=QEXdDO2ut3YA:10 a=S1zkccnPAAAA:8
 a=455hP2v20UQrnOR6EPEA:9 a=BIxho0NzmydFVSI6:21 a=lqcHg5cX4UMA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=acXkokOSj0xneluo_yeI:22
X-Proofpoint-ORIG-GUID: nLkK98XbsFRClFCA2l_DvBroJaaxZJUn
X-Proofpoint-GUID: nLkK98XbsFRClFCA2l_DvBroJaaxZJUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NyBTYWx0ZWRfX7t519pIW54X8
 P+h/jYkLgqzKMkFR8pKfRW+NRLWZgXJIfLVNbZRhBtKdqeV97R+zB8HQ1gy5M3ABY7SD5Si5aAX
 IRSX6UKYoCgkeihycuWxjqRHi3ygKCKfIr7UXT0XKIyhHw81jfijRGjEBjXuHvuoAQdCUO1kgPg
 oWUtSV1UKYQOwPszBmefNePFUWDRRe+C5uRgwH1v2/yXP/7FaTlFBmMc78oC2XcSmgoVpPoQFfz
 lFA2SLIlsKNlvYBOPrIRljJiB8kKQwNK1Pzv0YuzEIgSXorplpuPSIYYwPrSLf8ibUqwXQdqSFC
 BctizwMz3uYjxiBuF96kFeD+ENlGz330FT2m5Dx1QIgQzwx16oCNCACXTS+f1t5IL+D6kAzKK5k
 EKLzoBfADJrAFJL/7nQDKVhJauV50KNvo3g/t38oFaoFzbbLrz+W9sIl/akJ83KJgtX6hCM45Bo
 V+3HvRoEYB5KQjw+3Gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NyBTYWx0ZWRfX3Zsh6v6+IUWw
 y4rb+DTgRMSmPdenNEO+oTzc2AnSc7ItSaSENFHZEHk4R1iley+yotHX7x2lrKaZvKQvQeQn8kq
 su+1elAE8K4/NYIsgK2F8fVAUCjL0PI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243001

--0000000000001f4e650658723594
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 5:24=E2=80=AFAM Zoltan Boszormenyi <zboszor@gmail.co=
m> wrote:

> On Thu, Aug 6, 2026 at 11:16=E2=80=AFAM Jose Quaresma
> <jose.quaresma@oss.qualcomm.com> wrote:
> >
> >
> >
> > On Thu, Aug 6, 2026 at 6:15=E2=80=AFAM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org> wrote=
:
> >>
> >> According to the release notes at
> >> https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.htm=
l
> >>
> >> | One important note for packagers is that there is now a Mesa communi=
ty
> >> | maintained libclc fork that is verified to pass the OpenCL CTS with
> >> | Mesa/Rusticl, and will fix bugs after an upstream libclc major relea=
se
> >> | branch goes EoL. The Mesa build system will pick it up when availabl=
e,
> >> | and fall back to upstream libclc if not. This libclc fork is not
> >> | verified for any other usages or users of libclc outside of Mesa.
> >>
> >> Rusticl would complain if about not this libclc fork is used due to
> >> OpenCL CTS compliance.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>  meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
> >>  meta/recipes-graphics/mesa/mesa.inc             | 4 ++--
> >>  2 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> >> index 20207450bf..c495d2e8a8 100644
> >> --- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> >> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> >> @@ -11,7 +11,7 @@ PACKAGECONFIG +=3D "gallium-llvm"
> >>  # to PACKAGECONFIG like in mesa.inc
> >>  PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11 waylan=
d',
> d)}"
> >>
> >> -DEPENDS +=3D "libclc-native spirv-tools-native
> spirv-llvm-translator-native"
> >> +DEPENDS +=3D "mesa-libclc-native spirv-tools-native
> spirv-llvm-translator-native"
> >>
> >>  EXTRA_OEMESON +=3D " \
> >>      -Dmesa-clc=3Denabled -Dinstall-mesa-clc=3Dtrue
> -Dmesa-clc-bundle-headers=3Denabled \
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> >> index a50b900cf2..fa51d62bfc 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -109,7 +109,7 @@ PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,
> -Dopengl=3Dfalse"
> >>
> >>  # "opencl" also requires libclc and gallium-llvm to be present in
> PACKAGECONFIG!
> >>  # Be sure to enable them both for the target and for the native build=
.
> >> -PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue
> -Dmesa-clc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse,
> bindgen-cli-native clang libclc spirv-tools spirv-llvm-translator"
> >> +PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue
> -Dmesa-clc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse,
> bindgen-cli-native clang mesa-libclc spirv-tools spirv-llvm-translator"
> >>
> >>  X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage
> libxfixes xrandr xorgproto libxshmfence"
> >>  # "x11" requires "opengl"
> >> @@ -253,7 +253,7 @@ RPROVIDES:libopencl-mesa +=3D "virtual-opencl-icd"
> >>  RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
> >>  RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
> >>
> >> -RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'opencl', 'libclc', '', d)}"
> >> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'opencl', 'mesa-libclc', '', d)}"
> >
> >
> > Is it possible to have both versions installed side-by-side on the
> target?
>
> Yes. libclc and mesa-libclc can be installed side-by-side.
> Only meta-libclc will be used by mesa, if built with that, though.
>
> > I'm asking this because there might be a collision between the fork and
> the original.
>
> There is none.
> The installation directory and the pkg-config file are renamed in the for=
k.
>

Nice! Thanks


>
> >
> > Jose
> >
> >>
> >>
> >>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> >>               libgallium \
> >> --
> >> 2.55.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#242898):
> https://lists.openembedded.org/g/openembedded-core/message/242898
> >> Mute This Topic: https://lists.openembedded.org/mt/120622539/10043485
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> jose.quaresma@oss.qualcomm.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000001f4e650658723594
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 7, =
2026 at 5:24=E2=80=AFAM Zoltan Boszormenyi &lt;<a href=3D"mailto:zboszor@gm=
ail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Thu, Aug 6, 2026 at 11:16=E2=80=AFAM Jose Quar=
esma<br>
&lt;<a href=3D"mailto:jose.quaresma@oss.qualcomm.com" target=3D"_blank">jos=
e.quaresma@oss.qualcomm.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Aug 6, 2026 at 6:15=E2=80=AFAM Zoltan Boszormenyi via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> &lt;zboszor=3D<a href=3D"mailto:gmail.com@lists.ope=
nembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; According to the release notes at<br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/archives/mesa-dev/2026-Au=
gust/226690.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freede=
sktop.org/archives/mesa-dev/2026-August/226690.html</a><br>
&gt;&gt;<br>
&gt;&gt; | One important note for packagers is that there is now a Mesa com=
munity<br>
&gt;&gt; | maintained libclc fork that is verified to pass the OpenCL CTS w=
ith<br>
&gt;&gt; | Mesa/Rusticl, and will fix bugs after an upstream libclc major r=
elease<br>
&gt;&gt; | branch goes EoL. The Mesa build system will pick it up when avai=
lable,<br>
&gt;&gt; | and fall back to upstream libclc if not. This libclc fork is not=
<br>
&gt;&gt; | verified for any other usages or users of libclc outside of Mesa=
.<br>
&gt;&gt;<br>
&gt;&gt; Rusticl would complain if about not this libclc fork is used due t=
o<br>
&gt;&gt; OpenCL CTS compliance.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=
=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<b=
r>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-nati=
ve.bb" rel=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a> | 2 +-=
<br>
&gt;&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-too=
ls-native.bb" rel=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a>=
 b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-native.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a><br>
&gt;&gt; index 20207450bf..c495d2e8a8 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-nati=
ve.bb" rel=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a><br>
&gt;&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-tools-nati=
ve.bb" rel=3D"noreferrer" target=3D"_blank">mesa-tools-native.bb</a><br>
&gt;&gt; @@ -11,7 +11,7 @@ PACKAGECONFIG +=3D &quot;gallium-llvm&quot;<br>
&gt;&gt;=C2=A0 # to PACKAGECONFIG like in mesa.inc<br>
&gt;&gt;=C2=A0 PACKAGECONFIG +=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEAT=
URES&#39;, &#39;x11 wayland&#39;, d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt; -DEPENDS +=3D &quot;libclc-native spirv-tools-native spirv-llvm-tr=
anslator-native&quot;<br>
&gt;&gt; +DEPENDS +=3D &quot;mesa-libclc-native spirv-tools-native spirv-ll=
vm-translator-native&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 EXTRA_OEMESON +=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dmesa-clc=3Denabled -Dinstall-mesa-clc=3Dtrue=
 -Dmesa-clc-bundle-headers=3Denabled \<br>
&gt;&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-gr=
aphics/mesa/mesa.inc<br>
&gt;&gt; index a50b900cf2..fa51d62bfc 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;&gt; @@ -109,7 +109,7 @@ PACKAGECONFIG[opengl] =3D &quot;-Dopengl=3Dtru=
e, -Dopengl=3Dfalse&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # &quot;opencl&quot; also requires libclc and gallium-llvm t=
o be present in PACKAGECONFIG!<br>
&gt;&gt;=C2=A0 # Be sure to enable them both for the target and for the nat=
ive build.<br>
&gt;&gt; -PACKAGECONFIG[opencl] =3D &quot;-Dgallium-rusticl=3Dtrue -Dmesa-c=
lc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse, bindgen-cli-native =
clang libclc spirv-tools spirv-llvm-translator&quot;<br>
&gt;&gt; +PACKAGECONFIG[opencl] =3D &quot;-Dgallium-rusticl=3Dtrue -Dmesa-c=
lc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse, bindgen-cli-native =
clang mesa-libclc spirv-tools spirv-llvm-translator&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 X11_DEPS =3D &quot;xorgproto virtual/libx11 libxext libxxf86=
vm libxdamage libxfixes xrandr xorgproto libxshmfence&quot;<br>
&gt;&gt;=C2=A0 # &quot;x11&quot; requires &quot;opengl&quot;<br>
&gt;&gt; @@ -253,7 +253,7 @@ RPROVIDES:libopencl-mesa +=3D &quot;virtual-op=
encl-icd&quot;<br>
&gt;&gt;=C2=A0 RPROVIDES:libgles2-mesa +=3D &quot;libgles3-mesa&quot;<br>
&gt;&gt;=C2=A0 RPROVIDES:libgles2-mesa-dev +=3D &quot;libgles3-mesa-dev&quo=
t;<br>
&gt;&gt;<br>
&gt;&gt; -RDEPENDS:libopencl-mesa +=3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;opencl&#39;, &#39;libclc&#39;, &#39;&#39;, d)}&quot;<b=
r>
&gt;&gt; +RDEPENDS:libopencl-mesa +=3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;opencl&#39;, &#39;mesa-libclc&#39;, &#39;&#39;, d)}&qu=
ot;<br>
&gt;<br>
&gt;<br>
&gt; Is it possible to have both versions installed side-by-side on the tar=
get?<br>
<br>
Yes. libclc and mesa-libclc can be installed side-by-side.<br>
Only meta-libclc will be used by mesa, if built with that, though.<br>
<br>
&gt; I&#39;m asking this because there might be a collision between the for=
k and the original.<br>
<br>
There is none.<br>
The installation directory and the pkg-config file are renamed in the fork.=
<br></blockquote><div><br></div><div>Nice! Thanks</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PACKAGES =3D+ &quot;libegl-mesa libegl-mesa-dev \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgallium \=
<br>
&gt;&gt; --<br>
&gt;&gt; 2.55.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#242898): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/242898" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/242898</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1206=
22539/10043485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/120622539/10043485</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss=
.qualcomm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000001f4e650658723594--

