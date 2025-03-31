Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702D3C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 10:15:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.48419.1743416111388645534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 03:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gAI1gcfc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kdjl024983
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 10:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dk7n2Ov+SwfbtFn3iwvWyNjZ
	jrnZF2jSktSdZAIvt/g=; b=gAI1gcfc3MC3qK1RZEEMaDLiT7g1Dz8kIG2WDBqq
	GEVwKoL/N9epKyLeST1Bayln5zzphB+LD3tohZxvMNiT6zmrXosfgwGk3Xk8oWQQ
	xXjJfXhnsaCXmkBMZzwpyxOidT6wTKxKcHoMzZ2xS/05lTmk55dfc/o/tTsFEQ61
	lHSK4cBQkB79U2rUZGPgPT2h1FBDQ4HPRcmAmbEDcqJJWvDhJ+eY4ArHwEJI/Ur0
	w7lK2OBe8orJ7eZ0LueS/YIpSr+viwongs7Y39+jIVYnaD/mea4X5NoOUiuCRqqo
	26TDs2GpFtre4MxwpSOcqsE/v0CjQpJRL/3jO3Q3eKH+QQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1c7ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 10:15:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so290737485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 03:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743416109; x=1744020909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dk7n2Ov+SwfbtFn3iwvWyNjZjrnZF2jSktSdZAIvt/g=;
        b=HR3cxLLME4po8W4xdzop6yjbnZHokcVcTQoXxO+I0ZelkYcETabfPAzgeH9uQb9ntw
         NKnLhYWFCpIvGb1NOfCYerHWKjnsd2MOMufmVwUFaqW0bwt/zafxV7/6p5C39ZLI8/El
         AgvJpCjzGTQ3mY2W37xJ6qHAXLUDg19wI4uFJXAmmvd5/M6aOgq31Spbbyw+EhfTnrVt
         FZcv8is8qHgKG+EL6EPdQoxSbmdhtp5sgZ6eHQUxUaFK6Xq7YfmTWe5Zjj95otZviQjl
         mBB2mBPRi5HPwRN2LZsGD3P9i6r8iHWbZgRVdgqKsB3h9Axp0DYlukF0tcpPjG8dbazY
         vfiQ==
X-Gm-Message-State: AOJu0YzAEwktpxIC6nYlWnmAS/S/lOx3eGULf/Bg9SAJ7Zx4wIcOn3oj
	E24Op13sPsgNw5QvggebCUfBE+IfvfCxUMBw1YA7MKH2quHBljE3JGmUfjJMxNdFsPBtD0ml+F0
	p8YrnOIaY9xYCSV4aLhDjlGnJe9PeSw8j5w9GVksdSQEqMjs9pK54KOlxq6ROeqT7y4kj70+/bq
	ubXhs=
X-Gm-Gg: ASbGncsgfz97kBMOJocHdQNhT1VBBLuScfz0gzzfR8uToNZ8GNrdav4DKP/SHUA9rbt
	0HrTq+1W39CaiLettdeES9hEBe+qdr2zLLJzmdhWCiN8kXN13HcAgGs6N6/h0CLTbULzavLO5/g
	wqNzOFs81su98YglZwKN0ET6MWjjdrZ7jn7uHCBNxVaWUIZaMJytrTa/9gEjqxkee9BbLGkcoPb
	0MeU4uo3bDf1skVjisYajGrbOgGZLNSAMwwjjZ118P2OVxlGEz/P1vsagF+p1XPoCwlBde0B8ce
	4x5dKweA6Bnlk703aENA9h6gbOaVbnxzQeygyzrJTUVe2B3iyr2IlA6aNeVPUSbhXtBA+nNBskj
	wxV0=
X-Received: by 2002:a05:620a:f0c:b0:7c5:4adb:781b with SMTP id af79cd13be357-7c6862ebee2mr1159556885a.7.1743416109569;
        Mon, 31 Mar 2025 03:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSqAWqpiva60aWaoENzUl2f+HkEnRJIYHuvc4D8SxqyJ6GUZhddIW/VU/QozYb1TIgaaBAcg==
X-Received: by 2002:a05:620a:f0c:b0:7c5:4adb:781b with SMTP id af79cd13be357-7c6862ebee2mr1159555085a.7.1743416109236;
        Mon, 31 Mar 2025 03:15:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2ab8704sm13558331fa.29.2025.03.31.03.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:15:07 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:15:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
        =?utf-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Subject: Re: [OE-core] [PATCH v3 0/9] mesa: upgrade to 25.0.2
Message-ID: <jx5n23bzr7e3nw65udzgiy2d7imxpt6nhb4i545ryi6jbb7v7g@ljdoukxxcth3>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
 <f260bc5fa637f949b5877c5281cc71b70dfd1fd9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f260bc5fa637f949b5877c5281cc71b70dfd1fd9.camel@linuxfoundation.org>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67ea6b2e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=SeR2dSFOC_917RH7R5QA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: N-tUQH1mDUr-kzuAb2jPOjtOVE3QTs_v
X-Proofpoint-ORIG-GUID: N-tUQH1mDUr-kzuAb2jPOjtOVE3QTs_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 10:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213961

On Sun, Mar 30, 2025 at 11:40:19PM +0100, Richard Purdie wrote:
> On Sat, 2025-03-29 at 22:07 +0200, Dmitry Baryshkov via
> lists.openembedded.org wrote:
> > libclc is required in order to build Intel drivers in Mesa 24.1 and
> > later. Thus OE-Core is currently locked to the 24.0.x branch, which
> > is
> > no longer maintained, having last release in June 2024.
> > 
> > A clean solution is to package Clang, then use it to build libclc and
> > SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> > creating proper recipes for Clang is a long process (ongoing by Khem
> > Raj).
> > 
> > This patchset attempts to solve the issue in a simpler way: by
> > building
> > libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> > don't have to create target Clang recipes, there is no extra
> > toolchain
> > to support, etc. Clang binaries are creted as a part of the build
> > process (in order to support building target packages), however it
> > only
> > hits the LLVM sysroot-native and is only used by the LLVM target
> > build.
> > 
> > Future work by Khem (once Clang is properly supported in OE-Core)
> > should
> > allow us to create proper recipes for libclc and spirv-llvm-
> > translator
> > and drop them from the llvm / clang recipe.
> > 
> > I think this approach provides a good balance between OE-Core being
> > stuck with the outdated Mesa release and being able to upgrade it,
> > bringing support for new hardware.
> > 
> > Last two patches of the series bring in RustiCL support, a new OpenCL
> > implementation within Mesa. They are optional for the sake of the
> > upgrade and can be dropped if there is any issue with those. RustiCL
> > support is mostly compile-tested at this point.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Thanks for the patches. I haven't looked in detail yet but I did try
> running them through testing which revealed:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/1283

Okay, that's easy to fix, I missed multilib support.

> 
> as well as some issues working with meta-clang:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/18/builds/652

This one is more interesting. I will open a PR against meta-clang to
disable libclc and spirv-llvm bits in the llvm recipe, which should also
remove clang conflict.

> 
> There are other patches causing issues in that build, I'll leave it
> running in case it can spot any other issues with this patch series.
> 
> Cheers,
> 
> Richard
> 

-- 
With best wishes
Dmitry

