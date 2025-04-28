Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A9AC369D3
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 11:05:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.45464.1745838302555378206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 04:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=J8zrf1AW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SABANS005953
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ilDDc1tJYC7alPqdHs048pmm
	2rxoIW7FyExfDa6aov8=; b=J8zrf1AWzkH3gegpU+9m9JX/Sl7pwmmVNt3a/8Zp
	PDX1N50KCcbQ+kWbJSltHVbQAIuZuOmXSYTuQhTyEo4VVvgRHy+bAY7P6j9KDl7R
	sA5bFtOX12n1J1mgab0n58Y7p0DYHWIVbjdVe1a4bvAC0Wpw1N2BSFMdt5it/WOD
	pQ4XwlJU8nkGkRercC1RD6xFP26Z1CfR1cyRscwdstJGnllgNn12KdbbwxCQgrot
	DhUzQJulaPl8OI1d6YqSJAnHopvwR3v3hC5Ai7mhOCsiJReGChEQkTKTRvDUK4rx
	Q+AaC3DaMsIet9PEaoxMiCxj+9m02lW3eGqqHJ9r2n9JDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqh3c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:05:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so773090385a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 04:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838300; x=1746443100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilDDc1tJYC7alPqdHs048pmm2rxoIW7FyExfDa6aov8=;
        b=l+FOdgwjqMewSJSUj4pCZ1xATifznfw36+tE+RuolSMtT6VcjGoRTzoBIlhMFq12Sq
         GiyHLuFTDySdzei8GzaiVgh/c5gw0osASCylxU/7DPNu9aZOlGa+GG+i/dInLschXOht
         Cp1PRgX8+E5d8fq534LDkN0XVNlQqeGsVjFQ74eZmKgQyROUJQC4l48OfyCflfGjFIrq
         cx9UbnDTlgxoX6LBdvGJQyzxCBx6Qr7N4ujkCAcQcrD14SuX3akqK8H26a2nSlepk4Cr
         CfjvQVpKMg/VCGj1VYpv86pCChZqaTvOGOqMSKjq+/8cY466YfCUX30PpQws/+H2O75V
         sM0Q==
X-Gm-Message-State: AOJu0Yz6YREPar/RUv5BoRihim1n96HpKRD2ydV0QAIeIKVNimLgcE5f
	6TrnrR96GATv1EtqMimhUSXeFr8qHRz5Cdng+4pnymGTmTKqdT1azFSwqWvdMblKt0rKz+GpxYt
	wE/p/syrlBtdNV536ChHWG02b6rA2lW+YB46OeFzZ7nAGoK1J+cdig5CHaoQDQ7d+5uGSY7o3zi
	5cGTF4trzKw1w=
X-Gm-Gg: ASbGncvqaSGvWL2B30E1XibAwTpIa0trXphJzLGT/uk0bf/PlqdDBy2dWxCujaJb/7K
	2JVE3QPJrWNMiDA2xqqnb1YbvU5yVWwn72KUyGqh2QS/DoM9OQuk1FTub5cifWqZm1S7lkCFUhO
	Q7wz/lI44i3bBADrP4OdswyzBVOWeJHkQWU66iY3mdpN40ftaUTBzsG9QrkebAX2gR9JfyCiGzU
	lbuDycSqc3LlTPN/z9+C+g2yVuqsBPmz4vVVG2tZYn+vu2Cwxx71peSYoHBJvf32Zqr6BSO/IoU
	pspohn799hMoS8rz3wMfB8KmbTrvjjb3ZtGKji7IwQt/OhrBNF7KpNtleAvZzIuutNwD8f8y4YA
	=
X-Received: by 2002:a05:620a:44c9:b0:7c5:dfe7:4b2d with SMTP id af79cd13be357-7c9606fdeb5mr1925399885a.18.1745838300318;
        Mon, 28 Apr 2025 04:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2WZgCE59ppdhl2Zdv7XwfWt2wY3nY8v3jFMNZrL3naBa7M5/9RRJF+os+CUywolu8xYMHtA==
X-Received: by 2002:a05:620a:44c9:b0:7c5:dfe7:4b2d with SMTP id af79cd13be357-7c9606fdeb5mr1925395785a.18.1745838299941;
        Mon, 28 Apr 2025 04:04:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a831esm21307611fa.68.2025.04.28.04.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:04:59 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:04:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH v4 00/10] clang-merge: Bring clang recipes from meta-clang
Message-ID: <un4hvoe7lbzh2yd5qui4glpto5ebv4gxikkybob2b4s362d335@boopp3u7mbs5>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA5MSBTYWx0ZWRfXzPb6uRttsmBe YNSKpX4aZ1gTKuKpSpoeXlDSLioruakeBQPFwGhqpcsfJNXljnobBzYIVtlFhVLch+RGgnDYFTi WyBvDOlWBPZpBF8+uaiFfk9Pl92l5ic3Jvx8yXay1N0bZOYmUmctSqsR0Lt11IXvuX5B42rrW9I
 o389SJ+1BzpHoCZ0VwUFDs6LYf6ggX46R7OX0m1qEg5UeXedgcg6eMUMQwYDpNkFjjJAERwmVEP 0UwcKn0hU19Di5Qh8H/LFaxWGQp1fMlzMXcoMIzhtkezoTl/+oCzS5VFWGhR68OKWUPoSYWxTvB 9WtBtESz8JoyJUQklmfscCsFbCLlPvnEI1JZK1Dnt6fn7Ej9ASOjVrvuSnzSTD3O1obymmM4lL6
 /KrlfNKdyPXjbQ+ZCrE5ciNwxV6cvZr3CqMtGhWM7UaJXT/uN8T505Fr6S78r2dAJ8xBcw6Y
X-Proofpoint-GUID: m5zaAfCqya8xfWQdtlbYmKQEr0WDyWlc
X-Proofpoint-ORIG-GUID: m5zaAfCqya8xfWQdtlbYmKQEr0WDyWlc
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680f60dd cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=W3HFafzmT_P6l066yiAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215595

On Sat, Apr 26, 2025 at 08:16:39PM -0700, Khem Raj wrote:
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
> 
> [1] https://github.com/kraj/meta-clang/pull/1088
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes in v4:
> - Set BINDGEN_EXTRA_CLANG_ARGS only for target recipe

I have provided a replacement patch for this issue. Please consider
picking it up instead.

> - Link to v3: https://lore.kernel.org/r/20250425-clang-merge-v3-0-feea6f07d130@gmail.com
> 
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

-- 
With best wishes
Dmitry

