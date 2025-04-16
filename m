Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C36C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 17:49:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.26219.1744825794336778282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 10:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ow0KXO6J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mXSR021614
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 17:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YKHfV3qmhmPcGf58Q6LzbKwS
	iBXPn76AOrdjwNosCqw=; b=ow0KXO6JBR4wvC7AbFyWHJ8ezXwfBfC1Y6Bs+j/1
	WEd/Vg8LAeXcSnrhkBtig60JiMj3HILNQjB2Fi2ZQQOcme2D90SmOMcXUMiK6rAc
	9h2wn7T5hOomItWArrXqEc8YxZ7Lwka99tDuBWl/O6ajQOE6Fyio/VwysUiC2iBy
	tHz7BLNmg337DJ8c46o++V33MlIFqOuqI1PVFlwLxHPVxzev+Gya6nRsN3mX8r9e
	PgDEV8qsFkorIx4fax9/1koU9nfkZjSExVybn7HfRs92kipRCC+Pudu34oeLRy1C
	54UMuqPJhxp7ucQImXbhkGJXM980SCYTgELDoBOi3BL0Qg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69vc7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 17:49:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e9083404b7so132857746d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 10:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744825792; x=1745430592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKHfV3qmhmPcGf58Q6LzbKwSiBXPn76AOrdjwNosCqw=;
        b=jX32jRc9bt3e9NLLH0CYQITJ3vt1oHbt3q/cAY7tDDhsdQE/1WoK/pBAzBSStDdPKs
         ARlyoB4ye6KQYoXXKzRzIxEWHFAP6egTYX/4/bzD3p4sobuVv5765lWu1HYt1H8YiU9y
         sZlGmE1VVRrfleslUHH3m0h638ee/ksRF79lMUlQBrRuXztRfqcAmEbrwfUTw7G5Xz2i
         ntPryOdSAh458Lw40y2NKIklsZns4nbcPFJKPzQeveIYrBE0IvnJyzwrp0ChhmbDH5P3
         YhJ9+LCpCbV5fvylQficqUF2Lb6bTG5MGeegTzC4rIw4eURA8HeL96F7zWsDTXzdHRLQ
         RM3A==
X-Gm-Message-State: AOJu0YwXc7shehI/FubcJ0gGUqU/4fmUnYjzQXypvvsgASD2RUOOCAsz
	kQBwBHj5YwTsbIqAwXsS4i2tXc6WTKVEmA79gFKgXcb8YNLV9piMWZqg3Y+hti8X9gUjs74Ym43
	KitKtU582s8JB190ZjuX5fKHb5R3toockDShUdabsqHEG/7MR8St8OPRlRcNPAtacbCBVFJ5nCn
	vPE+C/ZK1fKGs=
X-Gm-Gg: ASbGncv4ilOXrZUMzGHO9bw9bqaqe6NGGWhihvni8VtZ7zLlKeTTSIZWZAvorJNBWJB
	j/8YC8BMEfp+yO0aA+vP4kqIGJdiL0uwSjBC8kcs0URuqil57t7uIA8wPU/z2EDRK1DHwpy3e5y
	NfnMWteTjoAN/Cv3b9eETJy9ZQnqd3pX/F7LlFBGqJgtCSIFZq/b/K0ZbE7aHIt5+bVf0vOPzYP
	sPhpOklBIB6bHo5PT93Cwv7LuwOciuT/leCZr53TmCg9chS55UrXlmbWep3mfhJ5xgL7M4WRL7i
	5+hQ/+a9EBBLkIQPz+/M9Rs8TkcV2Gskq3gjJh9ocEToLOeXClv8WLfTuL5KpsfoXnXV2TBsxRo
	=
X-Received: by 2002:a05:6214:2389:b0:6ed:cea:f630 with SMTP id 6a1803df08f44-6f2b2f23d87mr46890846d6.7.1744825792031;
        Wed, 16 Apr 2025 10:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELb5IqNqHp2IQDSwUjQXCBOCA53l8ZAgxUc+XNu1HLPFvoTmRvpz48PamPlBmsu5DU5Gxmgw==
X-Received: by 2002:a05:6214:2389:b0:6ed:cea:f630 with SMTP id 6a1803df08f44-6f2b2f23d87mr46890536d6.7.1744825791696;
        Wed, 16 Apr 2025 10:49:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d239708sm1729607e87.85.2025.04.16.10.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:49:50 -0700 (PDT)
Date: Wed, 16 Apr 2025 20:49:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 3/3] mesa: bundle Clang OpenCL headers into meta-clc
Message-ID: <2y54w5uprgnqkwblkvfkkwrrvveqjon3sxfcyjictgbug2juf6@sigqhathg6gq>
References: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250416155929.2630778-3-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416155929.2630778-3-dmitry.baryshkov@oss.qualcomm.com>
X-Proofpoint-GUID: aAf92ILkNRKN9H8CUD9j5VD6s-mtAtc9
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67ffedc1 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=Lggpqd0rYo5_AZZxVZgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: aAf92ILkNRKN9H8CUD9j5VD6s-mtAtc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=984 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 17:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215006

On Wed, Apr 16, 2025 at 06:59:29PM +0300, Dmitry Baryshkov wrote:
> Add a patch bundling OpenCL headers into meta-clc. This removes extra
> runtime dependencies when runnign meta-clc compiler.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...option-to-force-inclusion-of-OpenCL-.patch | 57 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  3 +-
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch
> 
> diff --git a/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch b/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch
> new file mode 100644
> index 000000000000..567c1f7e1b44
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch
> @@ -0,0 +1,57 @@
> +From f9b6175e7c446a82c568ff1a214885d707c95f49 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Date: Wed, 16 Apr 2025 14:35:37 +0300
> +Subject: [PATCH] mesa-clc: add an option to force inclusion of OpenCL headers
> +
> +Currently mesa-clc bundles OpenCL headers from Clang only if the static
> +LLVM is used (which means Clang / LLVM are not present on the target
> +system). In some cases (e.g. when building in OpenEmbedded environemnt)
> +it is desirable to have shared LLVM library, but skip installing the
> +whole Clang runtime just to compile shaders. Add an option that forces
> +OpenCL headers to be bundled with the mesa-clc binary.
> +
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Upstream-Status: Inappropriate [OE-Specific https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34551]

And the patch status is slowly turning towards Backport, so maybe I'll
post v2 just for the sake of updating it.

-- 
With best wishes
Dmitry

