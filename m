Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84565C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 03:54:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.3578.1745639655282278843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 20:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dO8cVvqG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKMJa001950
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 03:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pb5QherIJGAF/op0weeJdpUi
	+bWAzxIHZIyp4GMaf8E=; b=dO8cVvqGL3UG7VoF3+xtW3fPBUEDRoAaG+3Ca/Rk
	v9oRuWBTU9WgYymN8OiIbLRfebjzfHleo/x98gKD2fyPRfzU2cpjMwXkhWk/+9nu
	RtpP1SHWPottDWPQijAYY7IpMm6YxqjJvFA9OQm55K9R6PzfenBIqY8rsvidzEg6
	KvlDSC5J82WUqO965QB0tAU0zn/mDA0v0yCmGQNpoKGHl97oCC1/QP0chdUJY/Pl
	tQKVghCso7l2kkUKixApqjX71v9Pu3A37eJ0DjwTegG4U7IMlXRncUHjBLghNSo9
	SNyViV42UFfH1HI3Yym3BEYPYN+C8+pQn5k4Jm3ktEhR1Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3jub0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 03:54:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c94f8f11so76994796d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 20:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745639653; x=1746244453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb5QherIJGAF/op0weeJdpUi+bWAzxIHZIyp4GMaf8E=;
        b=vdattrAkzarPNTcXsPoj373jOfy9foGZXPfjmoYDi6PfCeQCsph8fXLZ6B0KO0xwg7
         1IHjlHNrG9MPmrD2+9jq/w6jhe0vrH//IO840cNLNnSEmU+/iGM7xlkdZSix9y2szyTO
         Hg3x+Q4cQtvgNbxjb+ukfj1wWpWGz1e/d3F4XonuaLj8G73ukK+QJH30xF/IlNK7wiiE
         uvXLbdoCy8YemKxDuQOP/Bvhh4j707FZKUvHef8oGNo3UhtwJNUAy6Vk3tsQDW8XxSIe
         emyMuwS9V+5J9k23eEqE0NPp73JCWQ+VjZGO8wfTTn7ksrzfcSwP+GQ8KkuWmTqZtxIp
         tG0g==
X-Gm-Message-State: AOJu0Yyky0M3o+X/RbkGnoxFaqyymcaBlorczxiN/iGB6AEajdGAXFEc
	cQ44fjkBRfd/fyTrqeMm8MI1LMFE7ZNzOC9BduQnLQTErZtKoHgBuL2WZT68NCpEaHzv9F9DyBx
	ppeIKePiqoDsgcMG1Z0nN8ucOCJPEAKaiR/cW9IddWC/upwdbQwhCKrBwE9L3Hrhg/9KdUfrA0n
	DuW8Y=
X-Gm-Gg: ASbGncscn/TMnzf2B/kbDuw7jt0UgrQKQB1kLZo4nDEncYXJpM7fRl5udCxH6LS3Xws
	mn5KNv1UjplO6vwuhtQ8BikR2PehuTSCTp/OvUaDLcdazAgKHtoboVNbnZkLj83pC/aQFHJ7Rpq
	nrzPagFAU7DPQ5EL4mR/Z9ipkHe72p0nl508OQk6afhhd5qoxY72ZBCKmtrOEpvSyqSalpXi4GP
	bJ9QXVwfm8b2kUkXB8EBLb8GKxuENL9MmKrH0e6MGc6c31R18hfE9mtIW9ncaViwikPEaXHTBGd
	Uylodb/bkDxtmtLxWv8O7ke/zX0JVYqqsNqNo18uq8OInwLLW7AygEj5YZIqUzG/KLEN/Ofkmlk
	=
X-Received: by 2002:a05:6214:b6a:b0:6e8:fbe2:2db5 with SMTP id 6a1803df08f44-6f4d1f90636mr35816956d6.35.1745639653278;
        Fri, 25 Apr 2025 20:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE442+/ijGNSewBPNwxBbbbsAB+4veogvMAcfhIZVczFxXfnRaggcmJTwZLV6ESL/uX+q00/A==
X-Received: by 2002:a05:6214:b6a:b0:6e8:fbe2:2db5 with SMTP id 6a1803df08f44-6f4d1f90636mr35816726d6.35.1745639652835;
        Fri, 25 Apr 2025 20:54:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b97fd6sm10084651fa.100.2025.04.25.20.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 20:54:11 -0700 (PDT)
Date: Sat, 26 Apr 2025 06:54:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH v3 00/10] clang-merge: Bring clang recipes from meta-clang
Message-ID: <rq6hi25ynci5jf3vayfwx4moxq2jv6ptdk5nqyknnbygu5dtiy@cbaglsyyfiz5>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
X-Proofpoint-ORIG-GUID: Q9ib5sSNpdOxlUAs2Gj5EVaub4Z2k2Ev
X-Proofpoint-GUID: Q9ib5sSNpdOxlUAs2Gj5EVaub4Z2k2Ev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNSBTYWx0ZWRfXzhUW1bdEHSCt 6KjYW2XUKHbxvj/6opC9y/wrYSIE54wzZe9sWQOtLuaAfN9L5MDwZdn+g5NqlQSbWuXB8IuuwXJ Heapxt7g322Pi+mVtmpAVKZdbWlVAVrxcNjOzBDpZFAtHiNB0PAUiZMFNzix5XZ+pHU0/wlHRXi
 t10366fpH11ERLxU41X9X23FNrBTzDUvi/KyNP3oXyLvks/228LRsV5TQ9loKufSIrYO8WckaQk zyrytGSOpq4xekyhvSZgM87VljWkHxjUeIkelzhOBO1pjNcG/y7kNHrlmBTX9VwVy/35zU6EOo7 5E6hx2/c3UoUhdd4MHwdA90WFOQew6SI/LiC1dPSV+w5HYXlUt84uJQYzKsBg0aEuCNQGnE8Quu
 Ywdsz7pVwvuUu4BzgoLdTtJQO2FLzEI3G/XicZ98MYG1Mll8jVPnV+0h7gvaSMy4gv0aEJ5O
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680c58e6 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=W3HFafzmT_P6l066yiAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 03:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215510

On Fri, Apr 25, 2025 at 07:35:02PM -0700, Khem Raj wrote:
> Latest mesa 25+ needs libclang during build for tools like mesa_clc,
> we enahnced already existing llvm recipe to build pieces of clang as
> well, which worked for mesa's needs but broke static clang compiler
> provided by meta-clang due to newfound conflicts, since clang is now
> built with llvm recipe from core and also by meta-clang and they
> compete for same namespace, an attempt to make them co-habit did reveal
> more difficulties. Clang compiler from meta-clang is not able to use
> llvm libraries from core since they patch them differently.
> 
> This patch series therefore brings clang and all recipes that build from
> llvm sources into core. With this changeset, clang recipes can be removed
> from meta-clang there is a pull request for that already [1]
> As an aside, we only build clang once and use it for meta-clang needs
> and core needs.
> 
> With this, meta-clang can depend upon core layer to provide clang and
> related recipes, meta-clang will still provide the toolchain policies
> around clang based toolchains. Clang compiler from core, while usable
> for mesa is not yet fully usable out of box, since we need to workout
> the multi-toolchain architecture for core, which will be done in next
> phase after this merge.

After testing several configurations, only nativesdk-mesa with enabled OpenCL fails at building rusticl_llvm_bindings.rs:

/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdlib:75:15: fatal error: 'stdlib.h' file not found
Unable to generate bindings: clang diagnosed error: /../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/cstdlib:75:15: fatal error: 'stdlib.h' file not found

All other configuraions seems to work. I think it can be merged now with
nativesdk-mesa with OpenCL being fixed later.

> 
> [1] https://github.com/kraj/meta-clang/pull/1088
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes in v3:
> - Fix building mesa with openCL packageconfig.
> - Fix buildpaths in libMesaOpenCL.so.1.0.0.
> - Add mesa RPROVIDES for libclc and spirv-llvm-translator
> - Link to v2: https://lore.kernel.org/r/20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com
> 
> Changes in v2:
> - Address Feedback from Alex and Dmitry.
> - Squash similar commits to reduce number of patches.
> - Move native toolchain file generation to cmake bbclass instead of
>   adding new class
> - Fix space/tabs indentation inconsistencies
> - Reorder the patch sequence to avoid errors in future git bisects
> - Fix use before define string problem in one of the patches
> - Link to v1: https://lore.kernel.org/r/20250424-clang-merge-v1-0-5a492a8461aa@gmail.com
> 

-- 
With best wishes
Dmitry

