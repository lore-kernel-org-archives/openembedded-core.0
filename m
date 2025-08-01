Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06426C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 13:58:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.88561.1754056692017339245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 06:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fISoup7Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719g6KF006262
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Aug 2025 13:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkCQWVJw67Ll/uTeu/FrZ8Dy+cbDCRlp8MplRo+crlY=; b=fISoup7ZLbInV7cH
	2x1V1vO+3xJXy4aOpSs7BTOP2d0FDRKk07Ha5VeNbulO066MquhVv/W49Qqeh62X
	og75AE119J6BHou8DxRjuUbxDUyn6m3Iilb6+9Iw5EPcOKb2yf3i6TsW/xx7AKwy
	WaSKiE0zwc0EgRPJnRm4QtaFkllXgJZ5kxbSzxfdQpfntWu8Z3tshLVLfnNgrZ06
	IMHzMFWty3LD7Dv5yGMD2YvOQdASL2QeTieXjoWrxGCV3hTIqKuCOrCO5PYYLii8
	ERF7HTqyddDhDeQbHDluAS1h45AealeMoKzq0KqFZvZm8lfxHELu2MvnjC/FHTjU
	Ye+/Sg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488u650q6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 13:58:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab69fff4deso38275211cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 06:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056689; x=1754661489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkCQWVJw67Ll/uTeu/FrZ8Dy+cbDCRlp8MplRo+crlY=;
        b=Wv80J/MSqz+MgbqC4M3SepF0ELdyxybo2DNRnD273TtSVlPKlBVIW5QLIUKrlMHd9c
         UdqFY1MaWVRgb+OdiDxsqUrMLz0cyscfOl0xhH2W7+ElPftbxtpLQU/Nk2Pkr0EdGmJJ
         8w3sgCg9bqYIlrLUs8Wn2ZMGJ950XJSxykhv6LBigJEqcJsepYKeGxagueOParIU5754
         gwkeGuY+86KdhLzl+V9sNZ773bJJ/ZxC42S5Scexnzg+yokeIfV/Gn3nF93zl1MUWL6S
         jF8hAaLt40EIK55bY++VCmCM3zcK5HYWpxiZkGXub6o4e71BVZEnhAjYQ/JtdB2FV2rV
         Jdcw==
X-Forwarded-Encrypted: i=1; AJvYcCV6gP4O901dwipIRPQWqbEwgDlw/gIynQzzf/ZoM3PhWzPGN6aLIbHQG/IhbFki//33+qIpIWpwWIGTvYn8ey/0fA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqRog2Kn4Yt75GnC1EiYtYoIekUqxMNXOdrp1MVBnfTaerAz76
	TGyjWBLs8pdD9AQOV4PtURpW01feB6dpjpdEuCmY2ZX/vZ2mgxu03FcGVuhLloN89cxZ84nDRAD
	oxwcKjZe7T1VIZdlzzIxAlYE+uqBGou5Is85QSYVcOpQ91EnGTzUSxIEPyjwacsfNX3bH8Ony6N
	gJgzFSyug=
X-Gm-Gg: ASbGncuCuY6j/lOWaAj3aLwdnZ8hwelC7SbhH+iCFPE15bs8QuD2NkjxGGffgFqoGoX
	Aop1eZkPYSLFAquN/UtQa5++xpg1VbTLfdD5SbXN3+w2J0nq6yiHTHjkIoiQuvDitBW7zRN/+cC
	iJhaExyGcwL6LEuW+t2OOXgDjY4/1YTsi4P0fir2gevCJzqp6hi3Nczm4fMQm9MUhDQ050NKbuX
	R9nza5LcImgRpGCwAi4TeMxKS0POAQ+w8qIEBsO2ISc0lVbSj/TR9WvBR7WKoyhrIRMcu5/dQLj
	7YHFFG9q+lgjKCalxcMG0OK8ycJ+XFPnbY5pNz0hAK/mpO3osYU1LZNGACCsL8Vje+ffgoQu2wM
	AaHI1iGnhCOAByOjTJRMQwrrMBJTAcOnvbng8nXmpXRSJfN8ZSS2P6ix6O78LsRGg1RZPzMOYpg
	7F4EgTQ8FGNNa6ARVijC4lcg==
X-Received: by 2002:ac8:594f:0:b0:4ab:5941:a919 with SMTP id d75a77b69052e-4aedbc36cdbmr167271181cf.40.1754056689047;
        Fri, 01 Aug 2025 06:58:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLVqn4CudBc2FWm0VgeY3PLgHHKC4B1rDVQeEm3IByjZ3hdPeR3MYeuWC6pdYhB+JV2q0qng==
X-Received: by 2002:ac8:594f:0:b0:4ab:5941:a919 with SMTP id d75a77b69052e-4aedbc36cdbmr167270841cf.40.1754056688374;
        Fri, 01 Aug 2025 06:58:08 -0700 (PDT)
Received: from ?IPV6:2001:14bb:11f:12ba:7035:8684:db73:a472? (2001-14bb-11f-12ba-7035-8684-db73-a472.rev.dnainternet.fi. [2001:14bb:11f:12ba:7035:8684:db73:a472])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9aeafsm591863e87.109.2025.08.01.06.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 06:58:07 -0700 (PDT)
Message-ID: <8537d025-56bd-4712-9af3-20af63399866@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:58:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 0/9] mesa: lighten up target's libclc dependencies
 and fix panfrost support
To: Quentin Schulz <foss+yocto@0leil.net>,
        openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
        Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Quentin Schulz <quentin.schulz@cherry.de>
References: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j1_HoiuIQsvzj1oSzuySH8YTTiV45Zwo
X-Proofpoint-GUID: j1_HoiuIQsvzj1oSzuySH8YTTiV45Zwo
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=688cc7f2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9B6jaAhKy-Zsr8waVqIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX1F1mCwfx9VT1
 ufqREIV15e908MpEQFJQaAy24HamDgIeliVH47wGrol14f2amGUJ9JDrqSbG84eegiX7QqUsI9i
 RKahVg5P6zSsHhgl6wGsgJzdbkmJgTcXT2X3LgCnsYSJkJReSRJGQB/DuLxi/tbbb7ZzVdxi2zq
 qJ5ah/xmD7fY3+M1kmZwwu+2HfCvVF0VaRSSvFjkkK3wF8A7JjRohhzJm+saNoStcDCoqE/pklm
 MxmEVxQFoUuRsCnpKP8bkUr+GnGpOrChZTyKbhNNsWp9epKi0ioEIRdpF7UaeZ5Y6a9kn6GGHTI
 aJULOFpN24OfR/wbN2OxhHMtQBuZJFJvOtI9VZUSLoPGIntdtwf+CN2fyYfvfDUlimHNL8B2/k7
 Lp8B4nC4bVlokBRFN5n4hvg+QzemWtgKy1OjP1Z2XfBFY1GweY4Fc3NmkJBONFJficmlp8Px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 13:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221245

On 01/08/2025 14:03, Quentin Schulz wrote:
> @Otavio, can I add the new mesa-tools-native recipe under your
> maintainership in meta/conf/distro/include/maintainers.inc, it is after
> all still mesa?
> 
> Panfrost support has been broken for a while already because it now
> requires libclc which isn't enforced by default. This fixes this
> oversight.
> 
> While re-adding support for panfrost, the build time for libclc were a
> bit too much to my taste and I tried to figure out if we could lighten
> up the dependencies for the target recipe and it seems to be the case.
> 
> libclc brings very expensive dependencies such as llvm and clang.
> Building clang and llvm for each target architecture is very expensive,
> but mesa allows to depend on prebuilt host binaries (mesa-clc and
> precomp-compiler). Those are built by mesa as well, but can be compiled
> in mesa-native instead of mesa, making the dependency expensive but only
> once regardless of the number of target architectures to build for.
> Ideally the mesa-clc and precomp-compiler would only be compiled in
> mesa-native if target mesa requires libclc support, however this is not
> possible as a target recipe cannot impact or depend on a native recipe's
> configuration. We thus have two choices, always build libclc in
> mesa-native with its heavy dependencies and impact every build or force
> the user to modify the mesa-native recipe in a custom layer (as a native
> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> former seems to be the only option. Another big downside is that
> mesa-native currently builds drivers (amd, nouveau, svga) which we may
> have absolutely no interest in building, increasing the build time and
> possibly dependencies list).
> 
> A third choice is to spin-off the native mesa recipe with libclc support
> into a new recipe without drivers and only what's necessary to build
> mesa-clc and precomp-compiler binaries.
> This allows to keep a "clean" mesa-native recipe for whoever needs those
> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> and only bring the libclc dependency when required by the target recipe.
> 
> Because libclc is now only built for the host, opencl support now needs
> to explicitly bring libclc and others to build as libclc won't bring it
> in the build environment anymore.
> 
> Note that this was essentially only build tested (run tested on RK3588
> with panfrost though).
> 
> I tried to enable OpenCL support but it triggers a buildpaths QA error,
> which can be worked around with the following patch:
> 
>    commit f5508086477eb900bb0bcfa1a65f46c8d853595a
>    Author: Quentin Schulz <quentin.schulz@cherry.de>
>    Date:   Mon Jul 21 11:15:54 2025 +0200
>    
>        clc: avoid host path poisoning
>        
>        LLVM_LIB_DIR is derived from llvm_libdir meson variable. The latter is
>        required to figure out where the clang/llvm libraries are for the
>        cross-compiler but the former is only useful for debugging purposes
>        while running on the target. When in a cross-compiling environment,
>        LLVM_LIB_DIR would actually point at a non-existing path (the sysroot
>        path on the build host) instead of the target path.
>        
>        I don't know how to fix this properly so I just hardcode it for now to
>        silence build warnings.
>        
>        Upstream-Status: Inappropriate [proper fix sent to mesa stripping the sysroot would be much better]
>        Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>    
>    diff --git a/src/compiler/clc/clc_helpers.cpp b/src/compiler/clc/clc_helpers.cpp
>    index 3c0c9db653f..fbc3b2b3d21 100644
>    --- a/src/compiler/clc/clc_helpers.cpp
>    +++ b/src/compiler/clc/clc_helpers.cpp
>    @@ -936,7 +936,7 @@ clc_compile_to_llvm_module(LLVMContext &llvm_ctx,
>                                         false, false);
>     
>        auto clang_install_res_path =
>    -      fs::path(LLVM_LIB_DIR) / "clang" / std::to_string(LLVM_VERSION_MAJOR) / "include";
>    +      fs::path("/usr/lib/clang") / std::to_string(LLVM_VERSION_MAJOR) / "include";
>        c->getHeaderSearchOpts().AddPath(clang_install_res_path.string(),
>                                         clang::frontend::Angled,
>                                         false, false);
> 
> However, building OpenCL support with Asahi enabled triggers a bunch of
> other buildpaths QA errors and I believe those are triggered by:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/compiler/libcl/assert.h#L33
> with __FILE__ pointing at the path on the build host. This should have
> been mitigated by DEBUG_PREFIX_MAP (-ffile-prefix-map=) but it probably
> isn't propagated by mesa's build system to the LLVM-only parts of the
> build?
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Changes in v4:
> - revamped patch removing egl/gles from mesa-gl by making the native and
>    nativesdk PACKAGECONFIG use = instead of ??= (see patch 1),
> - added "No intended change in behavior" wherever it is expected,
> - Link to v3: https://lore.kernel.org/r/20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thank you!

> 
> Changes in v3:
> - added patch to move S into mesa.inc,
> - added patch to remove egl/gles from mesa-gl,
> - added patch to make mesa-gl a target-only recipe,
> - updated comment for PACKAGECONFIG[opencl] dependency on other
>    PACKAGECONFIG,
> - added clarification in commit log of commit adding asahi to TOOLS,
> - Link to v2: https://lore.kernel.org/r/20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de
> 
> Changes in v2:
> - spin-off mesa-clc/precomp-compiler host binary building into a
>    mesa-tools-native recipe to lighten the dependency even more (no
>    native mesa drivers to build),
> - make libclc's target mesa depend on mesa-tools-native instead of
>    mesa-native,
> - Link to v1: https://lore.kernel.org/r/20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de
> 
> ---
> Quentin Schulz (8):
>        mesa-gl: make mesa-gl really openGL-only
>        mesa: move PACKAGECONFIG defaults to recipes
>        mesa: move PROVIDES out of include file
>        mesa: move BBCLASSEXTEND out of the include file
>        mesa-gl: make recipe target only
>        mesa: add asahi to TOOLS when selected in PACKAGECONFIG
>        mesa: use simpler mesa-tools-native recipe as dependency for libclc
>        mesa: fix panfrost driver build
> 
> Ross Burton (1):
>        mesa: assign S in include file
> 
>   meta/recipes-graphics/mesa/mesa-gl.bb           |  8 ++---
>   meta/recipes-graphics/mesa/mesa-tools-native.bb | 19 ++++++++++
>   meta/recipes-graphics/mesa/mesa.bb              | 25 +++++++++++++
>   meta/recipes-graphics/mesa/mesa.inc             | 47 +++++--------------------
>   4 files changed, 57 insertions(+), 42 deletions(-)
> ---
> base-commit: d1afce3aa07898c30aad314e17405994053df3d6
> change-id: 20250624-mesa-libclc-panfrost-108d62e1899b
> 
> Best regards,


-- 
With best wishes
Dmitry

