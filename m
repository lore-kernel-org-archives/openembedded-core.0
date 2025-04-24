Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27846C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:10:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10924.1745485837207889818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MeZpdgvd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9TO031001
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zHJua/rsJ59hq5k4gEPG/n3d
	x+ToZnG46jicI3a5k84=; b=MeZpdgvdHduHHIId/TNj5e1b7wnR7NsVFJRqAkfd
	QP4kWkc4pCmmPwgqY69rX1ZWzgermzL+X1RWf5dkIQ08j6137Il6NO5R44pdNJCL
	Cnq+eyJ294Cffw2lxl8U3GktrgsAtLJDAKncpyvxo9DodSyyGB5IbFJtmKf5fI8R
	FQezW4T9e/SrTmLXxGCbn1C4eN1T8vrCha4gLiZGYw+E1t7WJeih4gRDBrZVDGyU
	hyCux0g2IRanrg0Sx4LnvRxhCiY2xv2uiXaj0GR8fyTDUktqdv9/jZIZL0I6ukoi
	obsXUc4wWohfcYpfRPWTRXMMVoO7oTR8QmwtzhHN+DZJ1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cx24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:10:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so129350685a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745485835; x=1746090635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHJua/rsJ59hq5k4gEPG/n3dx+ToZnG46jicI3a5k84=;
        b=u3U91nViO55U+bf/4V87P9N6LYsWSGEOL98nPIjkQyh4RpVMQEgIV6BOHkKcKfyrwR
         ATmotXzlq1Q4b87R6K/hBHMpGGoptyJVlnqOSa194hNLAW/dFxJyNyHhjIT9SHGDtNH5
         TU/N528xsQqoiNVapl4DS7TbH78QAMw3VUUdAx8a/uWaaGQ0IbWHlZgirAe3qLJ6375c
         fY7osmFM6uYexsm09ppt30DPnontoodW0zStYg3tmyuBsKYC/JumkkbyS71NoCeA3wQ6
         0h822yJMrAZLWfW31CZgQbz+ImRWJCNtApiQlUw+HRwj/2Rtl5DoM4xnjmUlJ0K3+FX5
         B7ZQ==
X-Gm-Message-State: AOJu0YzfmOubD8t0MCl3IAAWVbsIPrlo+iBJrW9NAJtQS5XZn2hvYs6/
	uPQcA9dnVJmywdI5iYzTe5378TGkg0vk8lnjl4IXUJxEZgltIn/xOtoQFbeKJhaeRYVV1mWZi7M
	ZzHyDWpKJCo8eFs2WLTZVGzPCr/uP9mL5P/n/lxleMeEGgNmrUTgvb6EDUW/xLpROWFw6RFOrnX
	qsStI=
X-Gm-Gg: ASbGncv0NOQaXgD8qqzYkuaVOCbz5R9Qo64+GL6NGdK7xf5XM6jQf6VB1h1zigKKgup
	Z+iGhEOHogeC1vdTAYgxvxvpEAatCHlE6P/1ocT9B5TOJItddje2hGC8VGfOSbejB25bi6WNX3l
	L5oNbyJIsunruTxsSWmssyj2wzNF6LKB0p5O2dx24o26xB2n0U8aM+Ms8cQXx61DGK+r69rDdSk
	VbhzhJYIHRVCpWGUt2GW7LW4ozPkni4gOjWgjz4kNFo/Nwv98CoYhwcHbdsIMoJK7yGxgWbbO4R
	T5Hhf2AejWpp8bJTPnnTYav0Tx4ZdahnTj8GItDotXHDC1k5/R8fYilzdQfbLJ9OAo+YiJDUf78
	=
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr243269085a.0.1745485835514;
        Thu, 24 Apr 2025 02:10:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEukzCsTPbByXipD+tofbfWoo9MtT3h1Xee5T7V+WyyhVmV5EcPd8MB3WFlUgplmQAnePDuRw==
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr243266885a.0.1745485835202;
        Thu, 24 Apr 2025 02:10:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26211sm166066e87.44.2025.04.24.02.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:10:34 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:10:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/11] clang: remove LLVM_LDFLAGS from llvm-config
 --ldflags output
Message-ID: <djut26lxh77qtd3j6jxue554mwewwsutmcgqbaalsfg3jmymzr@kk6t675ae2ke>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-6-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v1-6-5a492a8461aa@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MCBTYWx0ZWRfX9MykRz5AtQz7 HlbRJ9xF4YNBLZ1GFbeQpTN65GJbjYL+lK+UZgoTu7eFaqXhhux4OK8dtQMIdbtYFfjFaufPXbE WJGKiv6DtW/yaWI0lFEJuIdTrcDlgUnNvUoiXZ9ZuFTPlMwVqJe688579i9mtGnqRJnVK7G8ptv
 yfo6R0lGoJJzsxKVJ4QGLpm0JAPWjkPFkiG4r5ZFkHN4sXgN6ENqoNmKu2vGW1hERBt/4v/s2Sd 7Sqg+VFTTx1tu3fHUEt+FkeooET3Yt6g1HS4dJUIIThl0tUOyHjRyY7moOCOAGUIyqJUVIHN99K +TfIRmwHlZJ3V4OMl6pXLntHz4qgb81fE3qUYRpve4EZzf7jIQok4SQOFkXvcoXs9xNDmGOJP1l
 1Q+vxyXrzgKGy1BGmM3g+TL6bpMm8ohT9rIL8I/90LkmkJFY2ECu3FbIUOVrcMsUsycnCe1V
X-Proofpoint-GUID: BldkttMO6_tQyaPgpiChR6KbgYvwvNuw
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a000c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=smt9_PJSpGUe1HgYja4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BldkttMO6_tQyaPgpiChR6KbgYvwvNuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215342

On Thu, Apr 24, 2025 at 12:20:40AM -0700, Khem Raj wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> On OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
> depend on exact build dir and as such be inappropriate to binaries
> shared through sstate-cache. It is not possible to override this
> behaviour in llvm-config since crossscripts are not being used for
> native builds. Ignore LLVM_LDFLAGS for native builds.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch | 32 ++++++++++++++++++++++
>  meta/recipes-devtools/clang/common.inc             |  1 +
>  2 files changed, 33 insertions(+)

This defintely doesn't need to come separately from patch 04

-- 
With best wishes
Dmitry

