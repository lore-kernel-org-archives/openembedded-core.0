Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537A9C7EE30
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 13:35:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8495.1750772143758655160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 06:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GLPPstsP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7EWq3006109
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 13:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eE+U9PoLQ5k7ftjsRLVDYnVa
	uWg4TvTCoJLXkMHXYjo=; b=GLPPstsPB/sRPfoUQ6KFcA1vQk4RL7APVuf2LYo8
	sSDwyq4mFgyRjYME29WLgggafT2YuXkbFaFEEaEXusbhY1Woj6TSCEnMq4DaeT6C
	iepZ3eTK8Q+C+s9ZD2ngqHJY9Kpnu167nwsfL/WM/k1P+YDdH8dJYDv6QIvIqvt9
	nkuFnCnH6J8QUIT7w72+t+0zR7rvvTtV4U9tfOtp7q56/09DovG8C6o8+FZT0lQD
	oNbqhByCP9+JoVDaIAAQGeGqxtuemjwlAuaHoRuyfr7wr64tQaopwbWOZu2eiadD
	C2oRRVx0RBNvxVZoF8FudnEkxL58h2R9Mv3xNKI70I7kHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgc8u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 13:35:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3e90c3a81so457910385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 06:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772142; x=1751376942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE+U9PoLQ5k7ftjsRLVDYnVauWg4TvTCoJLXkMHXYjo=;
        b=XwMjSoHdjdV7jFGdRx0EM4CTQPcYQENqAeYPK4aSayoWk18/4RLedQiRk4tBd5aBmF
         JxduQp6P2xAz//slnbVepClE3fEEbHoK3Ogx7I206sUveQ2xkzAM88dL3M3vVQ58Gho4
         nDujM7mYmWG+k/hHySWUQzL5XukP4xMDO++97KRenCo+pdmeEa8/yYZovZoMX+HSHe6d
         EFUbm9ipPcwbpcwP0U7azrtr5A4iMDDhnVkymhNBFT7LacnpLw0jSoyBCKvtTyZsoRhU
         dURUzTgAzxHEq6YsuYIIaYoBoII4NTQUgZQaXXNPzaVv324J/CznniMMRYWhbQSH8UW5
         NC2A==
X-Gm-Message-State: AOJu0Yw1ePyHL8rlvtUs+ZbzILly7brYu9v/CSoj7uqqZL7M8ucbuw/W
	tXNw6OTt9E7dofBunIJ492Iz6T4B+kAFtlp15nCbE2FGBMbcq+//OK9dgWtxQ4QPiJF2v2w1Hm0
	OtqGnZxYTYAXQ1zddoEgNrolsvSp7TH5JU5u18WZF/IBIn1HDfkcNs9oRK6gh8ZCbponXasPuYq
	5NotvJ5A0=
X-Gm-Gg: ASbGncuZLesP8WEVx8r2n4fJrXjIdsTKqiqFvKJ2s7oz2Epi/p9Y+3qDouaV4hN3Hk1
	6XReny94Xr4aXfLX5JNnIklQD1NazaYqaHVng1zTKuFe7rdHFMX4xngD7jX8pYrJ4elQAF7txSG
	5qEo3u57h2KxxLWvgDrq1ISuFZeHBunHwpcR8b4UugPOBlGjHmS12ySsb2FiiCyMvuGzkSI5Idl
	/y74lZFthayu0ZbddAYOsmeZeIy3O0kxbXCz/IG2Nt4SKrfbJzNMGYhZyOnfuhxNE5n8ijw1wV8
	pjfjB1NF1kb4ZDNjH8DgZ5DbtD7/a2X4cd+ucTxa3Sd6YYN5zVQXES0zdEgnaggli8IL15nBVEQ
	gsCSNahfDVtRdtEjgOoVJCSJziQ3r3pRFi8Y=
X-Received: by 2002:a05:620a:1b89:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d3f98e75a9mr2121582185a.24.1750772141635;
        Tue, 24 Jun 2025 06:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO+e4W+lECt5+G6BbRo9IGvQ1NDtqn5VpHNj7zrO1RSy7fpg8nTUEBYK1va6iGqV5dIvgVtw==
X-Received: by 2002:a05:620a:1b89:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d3f98e75a9mr2121578585a.24.1750772141113;
        Tue, 24 Jun 2025 06:35:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3d16sm1846728e87.166.2025.06.24.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:35:40 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:35:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
        Trevor Woerner <twoerner@gmail.com>,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH RFC 3/4] mesa: lighten up libclc dependencies for the
 target
Message-ID: <qkgwktgnp7om77sqqalrm3jkglfubt5mcnmw2d5tgkgi74boa6@pvvgu6ciq46l>
References: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
 <20250624-mesa-libclc-panfrost-v1-3-9ed8ca980e21@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-mesa-libclc-panfrost-v1-3-9ed8ca980e21@cherry.de>
X-Proofpoint-ORIG-GUID: uvg1E8qu54qqLSj0XydTARlmJ_INvAEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExNCBTYWx0ZWRfX/F++HDooASbX
 n/ZBb/t2oXSzgnC7iMjD1rtWxH0jumYgCLlvCgiIKr2yeniMeJTSbwfU+NHwLM0ujos0WDFM+e2
 vy9tEbQmmo+8VTNSaENWpBuprCCz0wJr7TlwLsM8pHZ1qTpYNjuOS/fJaG7owhSf0QXlIutBQI/
 ut7pFyULXkqBpUlvW5y7H0dziUtR2G0PfUNAvZGtEw8Zyifx/YI3pWSGUOER9tjfjGa1Y7Bh6I6
 P72AEFbAXAiTaARjV4fvOARNHpd99M9hmHjcaR+dd7vp8UX2mMnUJZZxiDBEdP9P9ofDnWhJeSD
 uyfjJvUsekdqNHRg12AU4YBVyWXVt0end7JNQAot2bzit9BihBjPB0EXuLFbltgFOa98G87VtNc
 NY/5V8kjvAuHFtl9Ee79NVUZX407Bxf49K+6ZXaBJVlvVXL2YKzvqSmZstzNb/lbYxTxW63p
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685aa9ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=znTCQ2M5O5mx1ZFKbcQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uvg1E8qu54qqLSj0XydTARlmJ_INvAEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 13:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219267

On Tue, Jun 24, 2025 at 02:44:26PM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> By using mesa-native mesa-clc instead of libclc, we do not actually need
> most of the heavy dependencies of the libclc PACKAGECONFIG as we simply
> need to use the natively compiled mesa-clc instead. We thus can simply
> depend on mesa-native for the target recipe.
> 
> libclc however is still required if opencl (rusticl) is selected.
> 
> Because asahi drivers are only enabled when libclc is also selected, we
> can now remove the explicit dependency on MESA_NATIVE.
> We do the same for panfrost even though libclc isn't enforced yet for
> mesa for the target. Support for panfrost has been broken for a while
> already anyway (because of the possibly missing libclc) but we'll fix it
> in a later commit.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 330a04f1b098a2d3a6874f40feabe8836dd4cb37..eafe1697c48edc661b33a54c5856d8e577608fd5 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -158,7 +158,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>  
>  # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
>  # Be sure to enable them both for the target and for the native build.
> -PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
> +PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
>  
>  PACKAGECONFIG[broadcom] = ""
>  PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> @@ -201,19 +201,21 @@ MESA_CLC = "system"
>  MESA_CLC:class-native = "enabled"
>  INSTALL_MESA_CLC = "false"
>  INSTALL_MESA_CLC:class-native = "true"
> -MESA_NATIVE = "mesa-native"
> -MESA_NATIVE:class-native = ""
> +# Reuse libclc from mesa-native instead of bringing heavy dependencies
> +LIBCLC_DEPS = "mesa-native"
> +LIBCLC_DEPS:class-native = "libclc spirv-tools spirv-llvm-translator"
>  
>  PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
>  PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
> -PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
> +PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,${LIBCLC_DEPS}"

I think it might be easier to drop this completely and to move meson
arguments to EXTRA_OEMESON (next to precomp-compiler options that you've
added). This way native builds will always build a full configuration
with mesa-clc, precomp compilers and other required drivers, while the
targets builds can be really optimal and won't require 'foo libclc'
hurdle.

>  PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
>  PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
>  
>  PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
>  
> -# Asahi requires precompiled compilers from mesa-native
> -PACKAGECONFIG[asahi] = ",,${MESA_NATIVE}"
> +# Asahi requires precompiled compilers and libclc from mesa-native
> +# Make sure libclc is in mesa-native AND mesa PACKAGECONFIG
> +PACKAGECONFIG[asahi] = ""
>  
>  PACKAGECONFIG[intel] = ""
>  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,crocus', '', d)}"
> @@ -221,8 +223,9 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,c
>  PACKAGECONFIG[lima] = ""
>  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
>  
> -# Panfrost requires precompiled compilers from mesa-native
> -PACKAGECONFIG[panfrost] = ",,${MESA_NATIVE}"
> +# Panfrost requires precompiled compilers and libclc from mesa-native
> +# Make sure libclc is in mesa-native AND mesa PACKAGECONFIG
> +PACKAGECONFIG[panfrost] = ""
>  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
>  
>  PACKAGECONFIG[tegra] = ""
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry

