Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D96C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:18:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.4349.1745579920516668036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lKCWRWt1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T5V7022904
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=846loO/+Koy0/D+lxtHD9yU3
	E3fVyEhfhvUpxrAn6Eg=; b=lKCWRWt1KFYIMlWSpui/cZaPJoeM49IEN+4EjMq7
	1A2PS/w6C4x+Yo/r6YeGNWlm3XmdwDo0Gnk040smsLkt8Q6b8oYTJlJUORwEHsQH
	ZDpTsZEYZFckz1lcMq8wf93nZBQEhXaGnMu9S8/PgbesX+p0z3KLhtjBvpVVK8KU
	g26PXviBiLcVSweWIRgRdzBUA3Sy9N5GU5AqHJXxxiiw3SlFq0ogYNvjltAhTONZ
	x8OfFkUmcgHNkfVQK83mfRw7axIP6fLzBZKIdapOsWsZzk8x69I2che4/6ioc+l0
	zZ578lv1HkQ6PuIKx2SU9JY5KaC3VMxyumEmRcmQxydB5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gvxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:18:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9255d5e8cso376917085a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745579918; x=1746184718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=846loO/+Koy0/D+lxtHD9yU3E3fVyEhfhvUpxrAn6Eg=;
        b=dc0NOGU4/YyjhFvN5HTvyw8nMMYnfdN4DaKI2J1U9BS5snFwBgzh8uXc00P6/Tv6No
         QhiHXFS925N7+KL+YpiEDvvhmyKQHz9gRR8fBTpVHowsCLx8aFAw0Ac2dZsfYWDzZdEd
         /k9O1Vn5xvp6SobCpJWB4p9zzfroYRE0cbKEOCzTxG5IZIxP2uzqACaaTb5fy3DcgLyn
         6GEU99JUAil2fmEI8KCqMJCSM2a7/USqZd+x643f16ysIoBvoWo7/1T+a71B/R8ttIot
         EebFnb/3Y22HamT0VRxvSGvITVjFpwsV50Sl1mT5G9DzwMJkjFhn0IlkpRnUvipr47mS
         FvHQ==
X-Gm-Message-State: AOJu0YwHs4pbXyWmVdSHzus21YYL8gi5MSSIW5u3bRQSrkNjTNPDLZul
	RHOWmqhL+pYzBoGsH2BFN+Ezxqe+lJT7XYYxWIwMlzJtFNqAgLfa6qnR01b/ESBfuUN16qmm9F5
	OLKs2gRhzeCQglx0R+2qh6PBwyUH0h7wBxw1PpHRRxt1EvY4U1YVYyfkYIogm2R8cNiWcthkMPb
	EoGws=
X-Gm-Gg: ASbGnct96gOAuuJHbKnr7arvDxb4GXcrTfR8vOwnLZ8sRPkshkU8jaqOu/fqc6BiMGs
	oJURVgCGVu885MaDtAqk38Hu+a7QfpPcSw43yaIVjy1WL9CvQHukRhGhDXgaJSrpcnW7DVaWB8R
	wDfOp3T5FwySj2d01EzEdJsKs7EbPvLybKApArKcdGTKxXmkqNDcRJ0Alb7GcegMZm+D/VcX/RE
	FeuLLWtwDP4PPMppfxax2XRA+0+uZqp7rEAuQQ23bGYn8pJ6LrMubtORopN//FuYBOP/t7FIzLG
	nGJ7BaE8hmUcu9SmyZOkLFIy5KAS2qkw9thDHNUWXaAvMc0M7Kvk2e9OGkRyCxGpzp7sGvbnhKI
	=
X-Received: by 2002:a05:620a:44c9:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c96079451fmr301983985a.38.1745579918629;
        Fri, 25 Apr 2025 04:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGWLwXQgJAdGFpBhKbGaRfkh1rQOdvJ5okLno7CTCgk/GiKhVT/BSLoO6JcE0KmYdA+h2lsw==
X-Received: by 2002:a05:620a:44c9:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c96079451fmr301981085a.38.1745579918219;
        Fri, 25 Apr 2025 04:18:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26211sm575625e87.44.2025.04.25.04.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:18:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:18:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH v2 0/7] clang-merge: Bring clang recipes from meta-clang
Message-ID: <hmxfon6u3s3wutu66qxvlm5k7tjlabyytyssvbkk3v6pfrmpxd@4oxiedpyhc7q>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
 <aujf4cdo2qhrzn72sx2ctwnpyckkplkmizzuvkbvm2s7circvr@kv6tiwmj3jwt>
 <ztns5wzhs562l7hsyrludvvinocsppknusdkenmspda3nogsm2@p2iml5ncm3am>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ztns5wzhs562l7hsyrludvvinocsppknusdkenmspda3nogsm2@p2iml5ncm3am>
X-Proofpoint-GUID: bQ6DKH-0ecBgG6gOpVRSz9qrv9-lPI7_
X-Proofpoint-ORIG-GUID: bQ6DKH-0ecBgG6gOpVRSz9qrv9-lPI7_
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b6f8f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=cm4UvnoVVb4Ps5NGzJcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4MSBTYWx0ZWRfX2XDGvivroqs2 /oAww/Q72MraKb0AD1+6OHswM9XjePdoGw2ebPm7RjlVrY0avl6TRvnc6mafo5/JRRIyGtLGamT xmiq7jnc6Jv9cVTP0qhoujyoYkD3rc02TC3SGmoX13N09htVUyMb3HGOjXN5om5MhHIItpwPV4a
 0JFlHyCjb0l1NwrMk1dHkoTqu5CahLsrMvXyXA/86uwimRbCoxroYExqR2K4wSdObcRhuGwsetU H0K/FDwUKhNHDjnUDGLOmiR0vt5K0tRaDLqp/V128yP+lIExPvmr5twM5Mf0q7RKQXyDVuMBM6J 7eGpwrPadRdXfptFlF9Fpz9mWEUpItHu9dODHZxeOky2VveVoM4ywdTsXvEypoYLxL6HxSMYeUf
 w1XMGpGPW59w/EFUvPOXTpe5+xlf+luVkCLvRBF9r8l/eBK0+AaLnX7h8Q9Nq76xRoMnqxHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215453

On Fri, Apr 25, 2025 at 02:04:53PM +0300, Dmitry Baryshkov wrote:
> On Fri, Apr 25, 2025 at 01:27:45PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 10:43:21PM -0700, Khem Raj wrote:
> > > Latest mesa 25+ needs libclang during build for tools like mesa_clc,
> > > we enahnced already existing llvm recipe to build pieces of clang as
> > > well, which worked for mesa's needs but broke static clang compiler
> > > provided by meta-clang due to newfound conflicts, since clang is now
> > > built with llvm recipe from core and also by meta-clang and they
> > > compete for same namespace, an attempt to make them co-habit did reveal
> > > more difficulties. Clang compiler from meta-clang is not able to use
> > > llvm libraries from core since they patch them differently.
> > > 
> > > This patch series therefore brings clang and all recipes that build from
> > > llvm sources into core. With this changeset, clang recipes can be removed
> > > from meta-clang there is a pull request for that already [1]
> > > As an aside, we only build clang once and use it for meta-clang needs
> > > and core needs.
> > > 
> > > With this, meta-clang can depend upon core layer to provide clang and
> > > related recipes, meta-clang will still provide the toolchain policies
> > > around clang based toolchains. Clang compiler from core, while usable
> > > for mesa is not yet fully usable out of box, since we need to workout
> > > the multi-toolchain architecture for core, which will be done in next
> > > phase after this merge.
> > > 
> > > [1] https://github.com/kraj/meta-clang/pull/1088
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > 
> > With the following lines in local.conf I got the RPROVIDES error:
> > 
> > PACKAGECONFIG:append:pn-mesa = " opencl libclc gallium-llvm "
> > PACKAGECONFIG:append:pn-mesa-native = " opencl libclc gallium-llvm "
> > PACKAGECONFIG:append:pn-nativesdk-mesa = " opencl libclc gallium-llvm "
> > 
> > $ DISTRO=poky MACHINE=qemux86-64 bitbake mesa
> > 
> > ERROR: Nothing RPROVIDES 'spirv-llvm-translator' (but /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'spirv-llvm-translator' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['spirv-llvm-translator']
> > ERROR: Required build target 'mesa' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['mesa', 'spirv-llvm-translator']
> 
> After adding the RPROVIDES for libclc and spirv-llvm-translator, the
> same command fails with:
> 
> ERROR: mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/lib/libMesaOpenCL.so.1.0.0 in package libopencl-mesa contains reference to TMPDIR [buildpaths]
> ERROR: mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found, failing task.
> ERROR: Logfile of failure stored in: /home/lumag/Projects/RPB/build-rpb/tmp-poky/work/core2-64-poky-linux/mesa/25.0.2/temp/log.do_package_qa.3491435
> ERROR: Task (/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa) failed with exit code '1'

As with the v1, building with the RPROVIDES and PACKAGECONFIG being set
for poky/qemuarm64 fails with:

/home/lumag/Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not f
ound
Unable to generate bindings: clang diagnosed error: /home/lumag/Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/Den
seMapInfo.h:17:10: fatal error: 'cassert' file not found

-- 
With best wishes
Dmitry

