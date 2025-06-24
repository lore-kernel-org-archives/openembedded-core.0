Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822F6C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 19:37:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.5371.1750793814172102550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 12:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MP0Kka5N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OD77YL007242
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 19:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KfJGB8rlpp1hzY1gvuc6Ix+c
	Q3s79oFUn0dOkeePFuk=; b=MP0Kka5NlkDD8kttPR92K8Cd4lappcaRcQkD7z6L
	gvFkVnVqFkufanVol7XVrDziOieR16iEMQrhrrnR6fKepENr2TLiZQeBdH3DC3Gm
	FuNKurSJgX29j5ytuATFGmg/qvIlKZ7+eWXi3NoJxE+ujgJcqQIZxYyImJ2gYdrd
	+Wv2O3rFxhTXtjPR3ooISqbFjB3e05ca7pXjrvIfIdVoeZSr+incbzPsZF9KXYOY
	D5e8StbPMXferSmmE1gNtuP72CwlJIbBEjW3ygpPB31ViJZaUFVRB6xSapl3vnVg
	5AQZCbHbMbg4WvHbEjSs1Tc9iytO4Vki6mlV3gtIOrzg8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec267nxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 19:36:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23507382e64so54085645ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793813; x=1751398613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfJGB8rlpp1hzY1gvuc6Ix+cQ3s79oFUn0dOkeePFuk=;
        b=iFGZn8Pv4IJgixw8SZz40KeXWTCaV0qQPqxcQtB2lVKb6raHHEXpy5g4RCFBILgo9C
         AAP0FqUgfSYByo7aB1gt/sl50nXNYYfH5RRFy1cifgLQmOlodumlGLQihB35yUe+e6Xp
         8PJtgvBfcyLN3V9Tdd03oAmXVkGhtbGcNrQ7KXQXOX3/klYD9k1jyEuF9CAw1UFEJ2MJ
         ReNXXWFZKceifH5wbcluqOd19l9+7b7gr4DN1qDm2p8xTallJMiLUUYb+v8e0kv0184p
         /a/ldqSah7L8QUbzUFegKq3XfhJB3r+Zyxq5DAZrFMatX3IBu29DbpNZqQPbFLTuUD/u
         Afaw==
X-Forwarded-Encrypted: i=1; AJvYcCUKIQtkO4e4nQkiR/dicOKPUY+77rcjMskObi9sxUdbwIp9qeBik7JZU91x62OUOS3qmQWw6LJsDwOSqqQOYaL69A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLOhfO/5HpU4EthR6v3BpjTRnIl9U7JcPSmBy9acLsTbpsKP+4
	atrjhz1ggu12YLTMjM9SUvvyh+72eJDbf8nAPHCOF9o9xrZnXIz2EZxvG4GuTQNuity/8dRj4Nw
	3Ip/ip1rhOtBaCa2oKWSik70djSChHjxoKEDc15ChYqJzUss3PXwSSvdJO9z8//b5pfcXxb3b5c
	bSA1Yv6XgB5d7ULuB0zdT/bqmMg3mFkEsbb5IvTX7hol10vSEU2J67bbLPTA==
X-Gm-Gg: ASbGncvr/F/RSprhAeiaEA22WEMpYDhzS93LuuKqmohPjC7pAGjGCuzzhuiCSorwpeY
	S9Iu9akbuiCSw2t5bs4MGmIkltje3BByyfZb0SgQgjdymllS4V0mmlb6jMuoN/5LD2HTgRgHBOG
	zP8Q==
X-Received: by 2002:a17:90b:254b:b0:311:a314:c2d1 with SMTP id 98e67ed59e1d1-315f25c9b73mr166482a91.6.1750793812556;
        Tue, 24 Jun 2025 12:36:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh0VAFEkbC73h9RLeOJvC0fU9uYDpeX4VWFAxPKtpEwtzdNpVnBk+rFgRMTJ49WzKgIoCv/GI1Dwx+Bp8ry24=
X-Received: by 2002:a17:90b:254b:b0:311:a314:c2d1 with SMTP id
 98e67ed59e1d1-315f25c9b73mr166443a91.6.1750793812086; Tue, 24 Jun 2025
 12:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
 <20250624-mesa-libclc-panfrost-v1-3-9ed8ca980e21@cherry.de>
 <qkgwktgnp7om77sqqalrm3jkglfubt5mcnmw2d5tgkgi74boa6@pvvgu6ciq46l> <91a281a1-f336-4475-b598-b28471b5c178@cherry.de>
In-Reply-To: <91a281a1-f336-4475-b598-b28471b5c178@cherry.de>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 22:36:42 +0300
X-Gm-Features: Ac12FXwjSUMYWGJzqvMzYv1b_wiXHHO_N8LIQ9ZW8MGP60xzPqExdNkucOUwTaM
Message-ID: <CAO9ioeUytn1OXh5CF-0qg228QWaFbVgekD7AMAoe7RbtQMKWaw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] mesa: lighten up libclc dependencies for the target
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>,
        openembedded-core@lists.openembedded.org,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE2MCBTYWx0ZWRfX+kjvUbKZXFFf
 JmyqatzYO2RTnPvLpK2+xRyx0xWL12m+JardMvic8PEILR6kz/ths8QFNj2yOXCfAz/QHgu+gtX
 +sf2xFYPGAf+sfIgQMUb/S/PvfsurbMOyX2/p0iiJnN3a6YLgOQu4ukA5wUrLE/Q23q1LSIp/R4
 cm9slc9hrEznKtbKcaWGGQjlyj2aW7uZ3ZQLITTpxfOZFV5JjxA5tkdblA9s5igv5KWjje/hWT4
 SfbVrkX362t/mn9++Ua2wUeGTjrrVUTvTM7Q4uJmCCKnFok9ucmJR+RE8QjoaRhy/KC0ysHp9Io
 8rWXyPYihYkfnsv3GLoq0npa5EWvSQuQ5+0p4BCY7LIuei8qxEiPdTOMcaabOTBgNTm9Z/Uq7FZ
 1xpZO7V2UDxqSjrh9OEkAXUVs1FrswLUxyGKVvxzIxSowFO5rWTjr6RYwUJfz8cWYumpDDEg
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685afe55 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e0g49BQpKQIu3ndPJ7UA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: LtkvDaa8bSQcCqENrltIQldZcGqHE8lC
X-Proofpoint-ORIG-GUID: LtkvDaa8bSQcCqENrltIQldZcGqHE8lC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 19:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219279

On Tue, 24 Jun 2025 at 17:55, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 6/24/25 3:35 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 24, 2025 at 02:44:26PM +0200, Quentin Schulz wrote:
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> By using mesa-native mesa-clc instead of libclc, we do not actually need
> >> most of the heavy dependencies of the libclc PACKAGECONFIG as we simply
> >> need to use the natively compiled mesa-clc instead. We thus can simply
> >> depend on mesa-native for the target recipe.
> >>
> >> libclc however is still required if opencl (rusticl) is selected.
> >>
> >> Because asahi drivers are only enabled when libclc is also selected, we
> >> can now remove the explicit dependency on MESA_NATIVE.
> >> We do the same for panfrost even though libclc isn't enforced yet for
> >> mesa for the target. Support for panfrost has been broken for a while
> >> already anyway (because of the possibly missing libclc) but we'll fix it
> >> in a later commit.
> >>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> ---
> >>   meta/recipes-graphics/mesa/mesa.inc | 19 +++++++++++--------
> >>   1 file changed, 11 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> >> index 330a04f1b098a2d3a6874f40feabe8836dd4cb37..eafe1697c48edc661b33a54c5856d8e577608fd5 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -158,7 +158,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
> >>
> >>   # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
> >>   # Be sure to enable them both for the target and for the native build.
> >> -PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
> >> +PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
> >>
> >>   PACKAGECONFIG[broadcom] = ""
> >>   PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> >> @@ -201,19 +201,21 @@ MESA_CLC = "system"
> >>   MESA_CLC:class-native = "enabled"
> >>   INSTALL_MESA_CLC = "false"
> >>   INSTALL_MESA_CLC:class-native = "true"
> >> -MESA_NATIVE = "mesa-native"
> >> -MESA_NATIVE:class-native = ""
> >> +# Reuse libclc from mesa-native instead of bringing heavy dependencies
> >> +LIBCLC_DEPS = "mesa-native"
> >> +LIBCLC_DEPS:class-native = "libclc spirv-tools spirv-llvm-translator"
> >>
> >>   PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
> >>   PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
> >> -PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
> >> +PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,${LIBCLC_DEPS}"
> >
> > I think it might be easier to drop this completely and to move meson
> > arguments to EXTRA_OEMESON (next to precomp-compiler options that you've
> > added). This way native builds will always build a full configuration
> > with mesa-clc, precomp compilers and other required drivers, while the
> > targets builds can be really optimal and won't require 'foo libclc'
> > hurdle.
> >
>
> We actually talked about that and I eventually decided against, and
> forgot to explain, sorry about that.
>
> Having libclc always on for the target mesa will require mesa-native be
> a dependency of mesa, which I'm not entirely sure is the best of ideas
> since nothing else in mesa requires mesa-native as far as I could tell?
> That's quite the dependency to always bring in, what do you think?

Okay. So we have several cases:
- class-native build. It should depend on libclc & spirv in order to
provide mesa-clc, asahi-clc & panfrost_compile. I don't think we ever
need RustiCL support in this build
- target builds for asahi / panfrost / intel / nouveau. These should
depend only on mesa-native for native progs and specify
-Dmesa-clc=system
- target builds using RustiCL. These should depend on full libclc &
spirv packages

I think the easiest way to handle all these points without too many
troubles is to:
- Enable mesa-clc / prebuild-compilers / asahi / panfost in native builds
- Drop libclc PACKAGECONFIG
- Declare that asahi, panfrost, intel and nouveau PACKAGECONFIGs
depend on mesa-native. Pass -Dmesa-clc=system to these drivers in a
non-native build
- Make opencl PACKAGECONFIG depend on libclc / spirv-tools /
spirv-headers directly.

WDYT?

--
With best wishes
Dmitry

