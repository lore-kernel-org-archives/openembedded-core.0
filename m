Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0537BC71135
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 20:08:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.5061.1749672526090479712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 13:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dQjODpH8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BIANDF019621
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 20:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1UV2vvDuGct/mJUEHANYc36P
	IXC3O9PBUIH2dkXYENE=; b=dQjODpH8jTJuCLjfCLq3s7FPxAgT0CSKM+hIxsqK
	/DimcXexe4DccB8qDZ9ccnl83UNIhIkcNhQU7Rp8/FbNfVVsIESp7F9yLFpjH6PN
	3l0EZxfAhDdTf4fPoDXTb0K70xRU8LkE1X/+itpR1T9o/0lFiMM2xwWAhzfAO/wh
	liIH6tp6HFWy9V0Q8KugLjf6DghVGNE2IpMSsv+e90KdOZLLWxopug70w2J6SnJ+
	n91q4+E3jX5ALiwokzPYriSeEvK2OpOlhVL6oCuxs3AA8VmiBAkeS10jiXCx2ZCO
	tCbACFqROQttN+JHtanrnSMqqNW7eu2HNWc5QBrz26EFvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcp71r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 20:08:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so220346a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 13:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749672516; x=1750277316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UV2vvDuGct/mJUEHANYc36PIXC3O9PBUIH2dkXYENE=;
        b=kCwk4fwP6c1gROJx6Y1MBu0nsectdycNj7f9imfuOo2NdJfPE+OM1EDZ4bYQbjQ51L
         kjjyauc8Ybq/9h+rxQZ4SaOZhESThxPALhKZXWU1ZoZjSKT0q4/Kqdx9nqFSOYY75vzW
         vonnz6m9ES4uHHGOcdTMAzzDIIDUjBsJbS6bJFaYJz8xQx9T+RZoxxe6c7AvGGVXtOQh
         Pp2hPBkz3lydyNMMkhsCp59YTaAPubdZ9l1lzTASXMoaOpC0vR7Z5QYbwHWsmI6yz7s6
         ABWFyxz5ay283qKSBtZUY5xlY6v5p3M+gSXCFK0LvVDaSs3fSxjJz35s4Cc+8erLskfU
         X8gA==
X-Gm-Message-State: AOJu0Yw6p6VDcprxi2Xf3by0E473Ti4hrp/Volu9pa5wD2BEtfGJvCUF
	pQe7rzz+KlLtGQMQJuOWKwLs6rKkTQVBeqbDgPgXVqULgnptE1OfBSlKRXUQnrHy1UKY6/ciRqs
	Z66f1F89zL5oYIy3APQY0g/5jhtuoFJVfL+UYbA5oJHmpnAIzlRbYwtv/8gIsOaRXqRypZDf4Sm
	9d22YWCNknXxvZceIvpTqtw0pH/wZOD4zBkyXshi2uJiZqOVC6MKQpqX4qrA==
X-Gm-Gg: ASbGncueagK93nh2u0bT3hULfxjDRLDkESgGykjMWPXFbw5bP9XlJDp3YkgZtdj+crM
	N9tA2ogCgMUxAiEsCmr/BP2ZWEKRhqCpKjGSWM7bR78axtgflB83tPMbRCZODCIE/JgnfPEWTBN
	VGKw==
X-Received: by 2002:a17:90b:4c0f:b0:312:1cd7:b337 with SMTP id 98e67ed59e1d1-313bfba128bmr987050a91.5.1749672515986;
        Wed, 11 Jun 2025 13:08:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbHgKmgI03Stn7AsOtDDQElMhqJkWCQVr2+CFtDNvzvBrVyGMc5OrPxQefma0f5KWOlQO0Iw/wOTgEDX52QvY=
X-Received: by 2002:a17:90b:4c0f:b0:312:1cd7:b337 with SMTP id
 98e67ed59e1d1-313bfba128bmr987026a91.5.1749672515501; Wed, 11 Jun 2025
 13:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
In-Reply-To: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 23:08:24 +0300
X-Gm-Features: AX0GCFt7Ae-ugaOTLVqQQBc3rYsEFh8_HjmFM_GFDRU9IvRckxFjX97Cu3SZvlE
Message-ID: <CAO9ioeUJVaovv7WTdP1V4KFRHeTK7Tv9LowrcG6V2OfvrJwpvQ@mail.gmail.com>
Subject: Re: How to fix Panfrost support in mesa?
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDE3MCBTYWx0ZWRfXylKeXNdu75Xs
 nJY8sd+YiGhyaU7TiNQhIaatT2jNeifGTsYZKJ446OOn6TKcebpIvVPbf9vQ35M4eiAodDu4vVA
 An6wS4LmGlXKmuEmhdz7EcI8zgpzqli13WuNO1lNIpsj9M0tyrK7auUJTyHIs05pJZak5Ho8Y3k
 dFMfsn90NImftZfTM0V26OCPKuZ5iQacPRYwUJVU2DzMF9A+XPNcYlXLEq1F7Xufrh+eS+U73ik
 xH1209z6gv04FXW/7LiJe8DLIg3TywkUTleBeOvz+8Avb0QOOOEPOZUoqMfEHKnN3MUC9aGnXdc
 g9VTZBPz3aDiLs4wyvE0MO0LUWkEMe9yQb7lyrBO5QXapLuVZxHNAffZSM66d30kPDc2dnzSGIE
 CdMz9o9PkBQmCAfYPGueAJI5W2hg5s3mQh23AAUv64kixLvz06KSnlmgLVb8vf2Ifm95TEGW
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6849e24d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=mZxnpWpkMNQqsn90IcUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 0XVtXC2ZlWeCXkhfthGrOJeq4J8OkAFU
X-Proofpoint-ORIG-GUID: 0XVtXC2ZlWeCXkhfthGrOJeq4J8OkAFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110170
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 20:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218471

On Wed, 11 Jun 2025 at 18:33, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi all,
>
> I've been trying to add support for Panthor (Panfrost for Mali Valhall
> and later as far as I understood) to meta-rockchip a few months ago
> already and attempting again.
>
> I had managed to do something for an old mesa release but it doesn't
> work anymore. Worse, it seems that the current Panfrost support is broken :)

That's an interesting claim. I hope you mean 'broken in OE-Core', not
'broken in Mesa'.

>
> For starters, the build doesn't succeed unless we have both panfrost and
> libclc PACKAGECONFIG enabled. I believe this is due to 20970bcd9652
> ("panfrost: Add base of OpenCL C infrastructure") merged in 25.1.0. So
> there are some changes required in mesa recipe to force libclc
> PACKAGECONFIG *in addition* to the panfrost PACKAGECONFIG for the whole
> thing to build. This shouldn't be too difficult though.

This seems almost correct.

>
> However, reading the aforementioned commit revealed something else (or
> maybe I misunderstood :) ). It appears that LLVM is now required at
> build time for the Gallium driver, so that would make panfrost part of
> GALLIUMDRIVERS_LLVM now. The issue is that it builds with and without
> gallium-llvm PACKAGECONFIG, and it seems to be running glmark2-es2-drm
> just fine on RK3588 (G610; Valhall). So I'm not sure what to do here?

If I understand correctly, panfrost requires at least mesa-clc /
panfrost-compile to be built for the build system. We support building
the former, but we don't support building the latter.
The quoted commit has the options to be passed to the meson when
building the 'host' binaries aka mesa-native and when cross-building
mesa.

Though I'm really surprised that building of panfrost works w/o
gallium-llvm in the current mesa.inc

> Making it part of gallium-llvm drivers brings in clang{,-native} among
> other things which is horrifyingly long to compile.

I think clang-native would be required at least.

If you implement precomp-compilers in some way, the correct build
options would be:

PACKAGECONFIG:append:pn-mesa-native = " panfrost libclc gallium-llvm"
PACKAGECONFIG:append:pn-mesa = " panfrost"

Note, currently we don't pass -Dmesa-clc=system if libclc is disabled.
Most likely that needs to be changed too.

>
> Additionally, according to the same previously mentioned commit, there's
> *some* OpenCL support now through rusticl for Panfrost. I wasn't able to
> compile it though (seems like Zoltan is trying to fix it already but the
> patches didn't work for me though I am testing on top of poky master
> 5b006dbc3d8669e0530ec3d633982617923ae215 due to meta-rockchip not having
> migrated to the new kernel-fit-image mechanism just yet).
> I see that we recently forced the opencl dependency on Asahi Vulkan and
> Gallium drivers, though I couldn't decipher from mesa git repo whether
> that is actually required or if it's just to bring in OpenCL always.
> I assume we could be doing something similar to Panfrost but I'm not
> sure it is worth it (especially considering that the commit listed above
> says they are only planning to support Bifrost and Valhall versions,
> which doesn't cover the Txxx (Midgard) Mali generation.

I think the commit requiring OpenCL to build the Asahi driver is incorrect.

>
> So.. what to do with this panthor/panfrost driver for mesa in OE-Core?
>
> My attempt at making panthor a gallium-llvm driver:
>

[skipped]

This looks correct from the code POV, but I'm not sure if moving
panfrost to gallium-llvm drivers is correct.

If I have time, I will try to review the whole gallium-llvm story.

>
> On a side note, I'm also not entirely sure why we need
> softpipe,llvmpipe,r300,nouveau always enabled?
> Can't we make softpipe the default only when llvmpipe isn't enabled?
> Do we really need r300 and nouveau always compiled? Can't we have a
> PACKAGECONFIG for those too? I see there's an amd PACKAGECONFIG already,
> maybe we can use that for r300 as well? For nouveau, a new nvidia
> PACKAGECONFIG maybe?

This is really a good idea. Please send those, idepdendently of your
panfrost / panvk work.

>
> Thanks!
> Quentin



-- 
With best wishes
Dmitry

