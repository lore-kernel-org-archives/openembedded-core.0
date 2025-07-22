Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9334C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 06:54:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.6713.1753167256617944666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 23:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eJVHV1RK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LN3edW012944
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QqktJBH//iCRaGAazMd63Ydz
	fb8KYBtkAXgukCu/LG8=; b=eJVHV1RKUkbtStVczvGwWK2kHB6PLQx9o0iP718n
	WXdjP3C9wz5ZQ7+bbNmnIlftl+sGr7gryGs/wl7khK6KWNZokpSQE+cg5Jy1vFdY
	8v4v1s1amAS3MxUC27+QHMT44qCk86pUL8/JUyA9i+1iW2tl+Ic6xkWjDH2Li4AY
	n1l8wL7OYS5NA5BCOrd1N3nuEPSgfHOwF0F8izygsoyh3u+y+SDjt0rrY7mt9g/M
	65l90cnRdHdaVHIuKAi38xqb4H3ovWzFyUM1taIQTSAQtYRkF/VV9hnXQ+zkxUO3
	7tpiG47Y29CisWOkXFMPVpNmokm5emdTcxwVebyd9GEN7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6jpq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:54:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e350826d99so784089785a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 23:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753167254; x=1753772054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqktJBH//iCRaGAazMd63Ydzfb8KYBtkAXgukCu/LG8=;
        b=jViDkrMgQ1Qijb/W5E60PUP+eR6dNWzmteto4ws6+juqJJN/ePy7t8rFMHw8uWuTDi
         LqvhG1dBW2n35uqUs6GhbyQqlP/47l+N3tlCTUP0u03n6tEC1EW76BCUFbHnieOxO71V
         9RF1HEManY/cyMRZA3kcHvt/W/kgn7usD7zlxqSTL+j+guustituQwYbpO3MWrFld1WJ
         PscxPoYK5403oykxzvIspyl8VqP7QAfVxzEM9zqr0FpxGtrtjUiPXizhQEh4w4mbEi3s
         OAclWOL8PtEnIaBbYBreatPtX75VXXd6GSn8jB28pidtndtWozfZfm2OvA2/4f2tB/oa
         gCag==
X-Gm-Message-State: AOJu0YxeHGPztH46BBIHP/o2Ym3KE0DV2qxU10p2HGbCQRFMyjVlbOEM
	LPWubNtaAcHuxi1qy9sq/MZzHbOERt8ouIlqXN29k2NPPmOVi8+g+6GXsvqW0Cr0uVnbbQOX2TY
	IfvjPG78ldRw44vYSM1CjF18/jwLqU7ixXzOJIWAQykbBkDfH80TazLIRMECM5wdfQ52WDXAK3y
	y8cI9O598=
X-Gm-Gg: ASbGnct2mGNOlcVCqJsZG5g3jHLBWKC90YlgloMPOimT6O50G7rvCFxjNVBP47RuZhd
	qf8g/tgSYK94tk0djXC6UV8qEb50QA7Tk8qZf9ZbJ80D4jLGFV9NF7DbCUDVLokHhXdCweegkP/
	H7soe7pR2RFNKjqVzHW7dnVZuPhXrm+LUZOJX8BJqDakXqe9nzvi0l1JwZ9ky2IRl5NLA8rtDPA
	Fo0nxWvJNU1Ha+XBnU44exDK41gWRrqeZgB5T0uHHYHvgn4N9xnuVzpjCF1ddLFHWybxSXGaQqJ
	PVvwCQ+zFX0SR9hFEVomZSkxcwXYSVY8UkVRu7W8tjmoGsQtGN7ZvR3Z10yHSoMxOqSbHZKJCcZ
	kdU2fqY4X0skB27qN6LdCAtCBRMAMHHPKgdzZGMLlZcmLpj3bdzAr
X-Received: by 2002:a05:620a:1a18:b0:7d3:f63c:7ee0 with SMTP id af79cd13be357-7e3435f77a0mr3299055085a.27.1753167254538;
        Mon, 21 Jul 2025 23:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5VNquS0qfCNOH9/s7T1t5xOcEdOd0QHd6+Vm03sP7O0sAp/vsT4NHb2ELJBswplmYuSktVQ==
X-Received: by 2002:a05:620a:1a18:b0:7d3:f63c:7ee0 with SMTP id af79cd13be357-7e3435f77a0mr3299053385a.27.1753167254047;
        Mon, 21 Jul 2025 23:54:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a911b775sm15696351fa.45.2025.07.21.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 23:54:13 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:54:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
        Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
Message-ID: <5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-1-f713d0858949@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-mesa-libclc-panfrost-v2-1-f713d0858949@cherry.de>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f3597 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=W2TtVzO84aA9P6N03VMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fzj_f2TjCCNOG7a10mJttee8vowzsDAk
X-Proofpoint-GUID: fzj_f2TjCCNOG7a10mJttee8vowzsDAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1NSBTYWx0ZWRfXwGLV4/X8nYEw
 RKv0TPa7MIhjJqXprn6oltSCRRHOmY+T346E3AMMAJ0S/sWqJfqGw32V4tqqilhSOH57h9ql59+
 dCEwBS+IDp0kofUwhCTGxUo3QApg0BZR95dR4ulPmgN78u6sgcyPqZ6/Fzjk47U3drQIsmM+vOx
 /Ipxgmcw/BciVWLXiF/8v6Qrh2PXRpiLTg4HmBLsj6A5KOoquW9PNU32LtMr0gf4wyL4W+ZyEi6
 eRMOYxjWCU1wlwNgE0t7LEsKfaP+nI+qgvI+v5TgKVYol7Z8scU7T516tN0GK34zzRkAGZZch41
 g6tRUgi0h9hsiqM/CIQYeVzWa0TLiPM6aanrOxTGYLUbGiIqOs1xPS7q8d6LOcwT8u6hcu5uSsz
 Ei5xAIB8PgulAlcYs0xn6GQpL4Sb61zwKWPdjYUTC86QncEM2Zxg+g0USmS/Y4mwCgPYDYbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=978 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220719

On Mon, Jul 21, 2025 at 12:33:38PM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> We're planning on reusing mesa.inc for a new mesa-tools-native recipe
> which will require much less in terms of PACKAGECONFIG than the actual
> mesa recipes.
> 
> It also doesn't make a lot of sense to have a default PACKAGECONFIG in
> an include file inherited by multiple recipes (here mesa and mesa-gl)
> which is highlighted by the useless PACKAGECONFIG ??= that is in mesa-gl
> since it was entirely replaced by the one from mesa.inc (hence why it's
> removed in this commit).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  meta/recipes-graphics/mesa/mesa-gl.bb | 14 ++++++++++++--
>  meta/recipes-graphics/mesa/mesa.bb    | 12 ++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc   | 13 -------------
>  3 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
> index e2f03c81c4588c6257ffec2892fef7fcbe9f82bf..8418f13bbc8aa84c6591eb8b46e1fa96d7aad9b6 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl.bb
> @@ -8,7 +8,17 @@ S = "${UNPACKDIR}/mesa-${PV}"
>  
>  TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
>  
> -# At least one DRI rendering engine is required to build mesa.
> -PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG = " \
> +	gallium \
> +	video-codecs \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \

Please omit EGL and GLES here. If I remember correctly, the whole point
of the mesa-gl was to provide GL library in case there are
vendor-provided GLES libraries.

But the fact than nobody complained raises a question: do we actually
need the mesa-gl package?

> +	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
> +"
> +
>  PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>  
> +PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
> +PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
> +PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
> +PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
> diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
> index 96e8aa38d61661c02d2228d825f70cf41f985382..305b18070d6a47a53f204906a16bc8d4833fd9d6 100644
> --- a/meta/recipes-graphics/mesa/mesa.bb
> +++ b/meta/recipes-graphics/mesa/mesa.bb
> @@ -1,2 +1,14 @@
>  require ${BPN}.inc
>  
> +PACKAGECONFIG = " \
> +	gallium \
> +	video-codecs \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
> +"
> +
> +PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
> +PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
> +PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
> +PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 47b95728e0b33c43992e1200a9e50e0f22c9bd6b..0f896887a4d956514f1fcc807de2ad31afa29f18 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -81,22 +81,9 @@ EXTRA_OEMESON = " \
>  def strip_comma(s):
>      return s.strip(',')
>  
> -PACKAGECONFIG = " \
> -	gallium \
> -	video-codecs \
> -	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
> -	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
> -	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
> -"
> -
>  # skip all Rust dependencies if we are not building OpenCL"
>  INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
>  
> -PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
> -PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
> -PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
> -PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
> -
>  # "gbm" requires "opengl"
>  PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
>  
> 
> -- 
> 2.50.1
> 
> 

-- 
With best wishes
Dmitry

