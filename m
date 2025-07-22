Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40F8C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 06:57:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.6745.1753167466431712389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 23:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RH+dpf7a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIgArt003812
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dPNSdfO6rKRb8uhusIE+ilEs
	elhKnYNu/hVkj0Fs5/Q=; b=RH+dpf7a64KIt/ylAxX8Y14mhiKAWb9IjTg4idk7
	Axs/G5fiOOG/K8bCpGQ1u4FhfIO5KPFzRA0zdaELyyoEYqBn0R6uhTx5FChWqFDY
	ojHY2UiwEry8GRpMHx3ZKC/+DSeIGvYA+S/1lAZsjkpPgHv6tKGKs65mMBOFb/jN
	SVuLpTGlNe/lr7vyobAozMi1uP3vlK2VCaXHuWDV89EeMwAtX5GINqSVbqNjF/xq
	Dl2ySznA2wt2JVeaLq2+n2FooHepWNEJZjfAQAP119MFz0Xumk7e09QrNskEfFkB
	yQ+FKLuQK8Owx9cXkvnn5gEB/q39ErsI1xblIAgypTAAxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v6rbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:57:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e3452c060eso421806085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 23:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753167464; x=1753772264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPNSdfO6rKRb8uhusIE+ilEselhKnYNu/hVkj0Fs5/Q=;
        b=jTJlHP1MC4HSc+ZKkTjXTgwZV+Sjb+t0SUbVbrGKklNlrb9V0lRmrzF5zgsV1119QI
         Cx+I7uLOt1xWB1adEMRdekinrlQ7cL5purnbfsxi5/GKU+P3dqgpkjbADsNU479gMWWa
         IS22u80ZgmPtgYY6kl+lplV3q3YYXCWecHL0IuuBWqXiDmbo0dfCV0lPfsDblXAbL60S
         9HLoohfVYfkQ1ys7bFrOYlsc1ocMZz9womh1QpmYBsqkHRDgJgnnX2yq724lomyGkMcF
         5s38wpSQiXk6kpRTgBLgcjym+YDdGMgxdy2IMI2oVsw6kJxOuKEDUaesuqep014S0DLC
         2zZw==
X-Gm-Message-State: AOJu0Yw1/NhtTCTdkwUIDbDcjL6UYQJLaHVym9AnyP5X7w7GLTysgkma
	R2mrZl1vTOeT/JqV8BRHkqK8DX1wiqOWyrVyr2LZa4UkSAB3w0mkOh8DuJevWljBnlHOuNuyKuJ
	XIrWQAP5DmLgCZWm8AfPCLcNU3dtBcULeV7KeRQGKGVPrUrE68eBtxE/EDbvOeB78SwLE4hmCwQ
	nW4rStcl8=
X-Gm-Gg: ASbGncvAIb3IQ+888tetGjFsPpcs+/gC4faufT3lMS8HMLk2rJNHet9wLx7+vfcpkHv
	Yj2L5RoMOKu6OWIX5OaWU/usc8VkljXUe3nUm+f7NeM09PHCfbsZSRlyqcbGAfSBgdc3GXQRqrM
	gVQG3xBoMxmaQ6wu9fOt2MyQ90xeZkGD8r84vUVwx4gsfjTQO7zJ+vw65oDKIUj9raHOJ+tTQsf
	cpneofwqlv4lECOCszUKo1xC3EwAfOwZq50IEvZ8YnuExHZo4VHuNODFegcLSzp3WThfsQIDguC
	AGEKnD2dTTiA0aBBCaqD1WyKO9V+w0UPUaH3ZbWQ/0hUM6xsY2OpbYRQgEQjRZPUyElIQJ6RuIG
	h6e1QgP3XIER1CPHc3ji0wz3iYjgdS5YkepYjwWos7sK7eDL/Rqw8
X-Received: by 2002:a05:620a:a21b:b0:7e3:4416:fd7 with SMTP id af79cd13be357-7e344165901mr2739115585a.62.1753167464311;
        Mon, 21 Jul 2025 23:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTyh4BA8pHVXW4yTzWStkUk1g9OB95vf2duU8DtBjqsxqJvIanmTZlpKpe2nPyvnkoqmZZ4g==
X-Received: by 2002:a05:620a:a21b:b0:7e3:4416:fd7 with SMTP id af79cd13be357-7e344165901mr2739114085a.62.1753167463904;
        Mon, 21 Jul 2025 23:57:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d8ff17sm1837695e87.137.2025.07.21.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 23:57:43 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:57:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
        Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH RFC v2 4/6] mesa: add asahi to TOOLS when selected in
 PACKAGECONFIG
Message-ID: <7hqzlznxd357u24pob6g7hlriqrniu5v5mjnxd5odouw2udkpr@vww6agvbn7tp>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-4-f713d0858949@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-mesa-libclc-panfrost-v2-4-f713d0858949@cherry.de>
X-Proofpoint-GUID: -cMJoA4b064DHu9Xw6E4Zb5qNrTMKtxe
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f3669 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=Oas5PSOM7G69CAqNWBEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1NSBTYWx0ZWRfX3+h+22zpZpv4
 J3wltSFowpD2Q1W0Kx+ZJ+xDnxdhwGwGTU7JMWrOLmC1s13N6JK0TEjbDYBCH/RgAAneFZFdV3y
 i0q/XHEFVwvOhtBuIKWCX9lk/VMCtVjnOOXldXc8gc08opDg8te/iOHQnbIpoU0ZfO/pPGfnDvD
 Ts64F4BjsymDUpS4V4KY2/YsYbpCXANTvKjlhxv+vn6m9C/6YOJWrw0bX6aJVZvIFgsHgwLi5SH
 Q4yHabxyPdzkgRc5x3mE8hbSs+hLG/IPc+p6SKcHI7pW5l9unZGsewP4jzYJ051ZA/NVEJu9HFP
 t5S82e/exsU5gBF7A+0dFCQsa6zHiy9kKM3U67/QxMmAZOKZSKWWc23eQoyvlM1JBnR3G9uvnt7
 Ux0Pehc3DZAGeENFnD3+ViReWi6lmRlb4SEpOrzNKZp/bMULBG427/vqDB7FUngtNYghqfQj
X-Proofpoint-ORIG-GUID: -cMJoA4b064DHu9Xw6E4Zb5qNrTMKtxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=959
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 06:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220720

On Mon, Jul 21, 2025 at 12:33:41PM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Similarly to panfrost and other PACKAGECONFIG, mesa has tools for asahi.
> So let's build the tools whenever asked.
> 
> This will be useful for building asahi_clc precomp-compiler in native
> mesa for example.

How? I think asahi_clc isn't controlled by -Dtools=asahi.

> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 55793baa8de5a190ae5eadb44662c1d11487c026..5295b70fc9b4bb9570d86333f9229aef9114d93d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -99,6 +99,7 @@ PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')},
>  # mesa development and testing tools support, per driver
>  TOOLS = ""
>  TOOLS_DEPS = ""
> +TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d)}"
>  TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>  TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>  TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
> 
> -- 
> 2.50.1
> 
> 

-- 
With best wishes
Dmitry

