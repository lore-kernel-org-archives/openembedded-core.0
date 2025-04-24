Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A45C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:06:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10870.1745485612804457282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ASMm+csj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FoRE007114
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DvRsCazQrLibIWOPV/SehEjt
	lAhiGeghrGtCIN3xrXg=; b=ASMm+csjlL8d2n6v7vEH3ZCtjJRnhEYn8ERLXh5Z
	IW/Cp/ttN0BVKw8Vq+COR20LtkfZghbJJ9Vu0KfeusXEjlOsgFh//PlTSFieba0C
	mSOCPvN7XHsyGgdE3UkshuDzWVYrlkEA71MvPmG1Kn160DS/3FhFEdk5PfnKOBpX
	41SZeT2Su4JKdtUQO0k6SVzBU5HuzHKH8meOglgJuKa2N28CUxkhnlw3iggxE9o6
	zLRCMRnZpOEo9+SxCQ/BqHmruMc5Qh0014LzdMFrSDeeNgq2+lS+zINPW3iZ2owb
	rHq+KY1x8rVm+NKGGS2WGe11tGjlnXVKlIqxZiYnMuu6Yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh04wkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:06:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c8f8ab79so116174785a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745485611; x=1746090411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvRsCazQrLibIWOPV/SehEjtlAhiGeghrGtCIN3xrXg=;
        b=TwY3NKkGM9jkam7X3InO+A+tZ29xahiwR6SFR+xzePCrxZBUN1aj2jYC2eEQFc9hSf
         Scj9PXVaC2W7QnYerSlumNtFgnBQN26BKoi8GKx3IBHmzjzzuWrl05/9hfsal5JDIiqD
         bRnxt/y8s3mFmDE131ZPbjIjTvUb1y741QDDDzAiGhknlf2XUOt4LrX1tr5fVkEtfT7p
         RZmQY0yq565UfdqEAH3GEbhd4z+BEOctPkh9nYqLLjpOEbUw4qPgXp2EG5VbyagCwufE
         /ZGyxcKM1VCuXzUxnaj8DZXXx9gWppsxUHbJgcRKRGwHXLevsKuoyVzMcIDDWsnBjoOD
         B4oA==
X-Gm-Message-State: AOJu0YwDFfmvyGlK1hgJl/AZYK0tRnrKN2B8o4A/trj6nKt/tG9caGDI
	y3dH8aoBMEkY1jHf12N9FghuWoOrHHIXCnV5BfBVeKfidCcfT/zzH2Qc8g0vCptcldWkkUvxj91
	44PvBZF3TfsbpFWSe+KkMtSNmG+GqorsI94BpZYlvr6l0A0WqPuI4wh++2C2BZN6g0rNzg1sS6n
	35xCkMHVI6j14=
X-Gm-Gg: ASbGncuCJIjeApT7lftbsqz9ErXqpF1JoyjlWUVSWVfWymTowsODX1POng0LYv8lrFh
	/naYVJpQXzn+QtLXtjqNGPFb3Yh40lvHDDKf5J3xncrpyYq60MkkB3gWoQBNHtxnQ7/CKSgR2/J
	6FAQwrs14paZ8cUeg6yUr2a0zgJQ+j7NI/op2hx5V/sf6GswL1rG7HSTAFWIq0+jQ0/0cfKv5ew
	VCgVILchwY3KFkJckE7sl6h1y+UJgKqi5j1eY0ey7OzcoXiB8d3RYrvaxxm9q+v/X11gVfSDkTc
	ooHIudt14Q3PLQDE2Iy/EoI21CeIztpushoyz2x2K7+qTKsEovegfSY/lN6VtmObU+lmQYrIASY
	=
X-Received: by 2002:a05:620a:2b81:b0:7c9:269f:b652 with SMTP id af79cd13be357-7c956f01339mr301979885a.34.1745485610776;
        Thu, 24 Apr 2025 02:06:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF53+k8Xnn2MyA7VVNWU2eMVmXNd4inRGq2Yj2JQbn+xiC8mBBDvIkr8imzZKBKs+jbxWZL+g==
X-Received: by 2002:a05:620a:2b81:b0:7c9:269f:b652 with SMTP id af79cd13be357-7c956f01339mr301976485a.34.1745485610356;
        Thu, 24 Apr 2025 02:06:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7e87sm158740e87.233.2025.04.24.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:06:49 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:06:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH 08/11] clang: multilib-header fix for llvm-config.h
Message-ID: <e3ngs7lqtrkdlgzps6yqyxdefsqhkwngnvdpebqbiocdwu6wy4@7oakys5aa3ov>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-8-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v1-8-5a492a8461aa@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OSBTYWx0ZWRfXwlNSV34oomwC Gf7I4sGCNgfFxWpG/8fFmDGQRRolISdZkOezzyiSsyEgXsa3c0qg/k6CVCDUPlzkjkSycMd9qFd fSyDVtcpPfNsyzN6oekw4E6LTxKpydIlt9LVTvGDnV5v1hYBjJBzY/Oh16Dg/r4XYIHWm08rNk8
 rPJ+Er7RzjNgBSPrKp6fQ4IKXWt2K4bQFIRyJjACWodZh5W1sZeF0lFLtWlIf5NC4GgsTbuZp59 pXM3o4JI+Li6KeiEE4DCZdgp31lD3jGrfeEijkTnVrxDOMhO1SZ1vKv2fYXbBgxBzHlY5VLA7qO tvZVk+oiSqwpPTTQvmqPQLLtIxm8KkvlolZzLU2UAS/GxOYYZBUd0+ENb5v24sEqPthxJofBnYw
 /lR+1r5iFZEMjVo8awaINelHYJB+8OAJ86cIT9QECc+UAg1Eb1Es9dF1cVila2hhk823/AsK
X-Proofpoint-GUID: HZepHK7VCn9s-8X2-5gUdvtZVYXya6P0
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6809ff2b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=DbSYcXh09Ul1eMTrIvAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HZepHK7VCn9s-8X2-5gUdvtZVYXya6P0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=789 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215341

On Thu, Apr 24, 2025 at 12:20:42AM -0700, Khem Raj wrote:
> From: Liu Yiding <liuyd.fnst@fujitsu.com>
> 
> fix the issue that:
> | file /usr/include/llvm/Config/llvm-config.h conflicts between attempted installs of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.core2_64
> 
> reproduce steps:
> 1. Add in local.conf the following lines:
> 
>   MACHINE ?= "qemux86-64"
> 
>   require conf/multilib.conf
> 
>   MULTILIBS ?= "multilib:lib32"
> 
>   DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"
> 
> 2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb
> 
>   IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} lib32-llvm-dev llvm-dev"
> 
> 3. $ bitbake core-image-minimal
> 
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/clang/clang_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Can be squashed into the previous patch. There is little point in adding
a commit with known issues.


-- 
With best wishes
Dmitry

