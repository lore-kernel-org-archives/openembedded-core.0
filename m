Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68D8CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:39:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.12076.1760110757376482714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tABHax6l;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AFdGbq797016;
	Fri, 10 Oct 2025 10:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760110756;
	bh=EGjjYj3QkJlBbM7r8wJ7lEzyKXWijgLgyt9gPb5PqSo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=tABHax6lmC2Xz7Z0qo+MeQurUwzOaOZFGmfM4g1bWNSXg2Tcruyz/2N7UtdwNq0ZB
	 S8x4cz3yFusCumcYG9z6ovkakhMKqygkLrPuBRYjVfeWT8+VCu1zuZD5Nj6Mrqyz/J
	 TSnbImUSTuziBHztAW5OcW7AWP9ev3lY882VQOD0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AFdGG11776156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 10 Oct 2025 10:39:16 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 10
 Oct 2025 10:39:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 10:39:16 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AFdG5C1857835;
	Fri, 10 Oct 2025 10:39:16 -0500
Message-ID: <606f567b-47ee-4427-9624-206643f77888@ti.com>
Date: Fri, 10 Oct 2025 10:39:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/5] mesa: add opencl -> clang build dependency
To: <dmitry.baryshkov@oss.qualcomm.com>,
        <openembedded-core@lists.openembedded.org>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224693


This fixes a build issue when building nativesdk-mesa since the clang 
dependency was missing.


On 10/10/2025 6:59 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> With the commits 448f4a84cb22 ("llvm: add recipe for just the LLVM
> libraries") and d76dc362c8e1 ("clang: use llvm recipe") the 'llvm'
> dependency inside mesa.inc does no longer pull in the clang libraries,
> failing RustiCL build as it can not find Clang libaries.
> 
> Add direct dependency on the clang in order to fulfill build-time deps.
> 
> Fixes: d76dc362c8e1 ("clang: use llvm recipe")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Note, this fixes the build issue, so it would be nice to pick this up
> even if there are review comments for other patches in the series.
> 
> BTW: would it be possible to enable OpenCL in one of autobuilder
> configurations to spot out such issues? Or would it make sense to enable
> the 'opencl' DISTRO_FEATURE for poky?
> 
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 7046deeb2b63..f299f9570284 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -128,7 +128,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>   
>   # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
>   # Be sure to enable them both for the target and for the native build.
> -PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native"
> +PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang"
>   
>   PACKAGECONFIG[broadcom] = ""
>   PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224683): https://lists.openembedded.org/g/openembedded-core/message/224683
> Mute This Topic: https://lists.openembedded.org/mt/115687493/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

