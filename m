Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B21C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:45:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.2477.1745570707080652394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=onfKlY1W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TEkF030928
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vKphH508k4Pvv3817E/Di/Wb
	qlKV0hTnfE/SNNE36C4=; b=onfKlY1W2APZdE7j+J7odJMsPIdrLNtfjXPeykdL
	qKc9TUeT7lIMS5J115B12h9a8VwzJXojGTZY1ksSlitR/Tw0J7XdL3NuqcaHbJ8I
	NR9DaBmcCt7KbcRcsrrK4AipS0YrAbRv6oDTwdzJR3HtVTFCkTeHjlfAZfqSSxMO
	1VCaQOQ4k0y6iCWf8jaYMCjXV9bCYA0sDO7MJTYhxFfm5cF7QMFOoQtn0hvXxg3+
	kgyOkueyT0FS07UMgPzRbl9cM3UWQie/ksupF6bBpUbXjdR2ukECr67JHuGzNLBx
	aVEZfoUI9xa6yWIF5e6f6cZDVVFjVsJd5PdfOe1phWdK1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5gc4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:45:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so306033985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570705; x=1746175505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKphH508k4Pvv3817E/Di/WbqlKV0hTnfE/SNNE36C4=;
        b=Ple2q8sf5KPeZqb5tk5+VwTrll669yzvxbtwcMgW5nHHq25FVldJtFlt08//ACiorJ
         U5OMQeq7mJXjpVxhBDrw/1trsdL4Va1zpqd6YhQbBS98BSGxKq0yqLZ1DSfjbDbk24QG
         BGQIZfM0+J/GwooBwVCMx3sgGbYMhOp/s9hRxucftWSgedLsC9Ky89i0ffaps+f5b190
         SAlgodvL6RfgLTUlQf24xnf+uffev1lVLRE8C5RUMfdTOSU0Kkaa06RxqagliCGpOZax
         qtpGtj59eVE9V8z4WmW6j5F+LkNp0bSPkHoE7dw7QZK2Qq+sIkdafs7/G5KGl4CjROG7
         iG3Q==
X-Gm-Message-State: AOJu0Yyx39WtWnxJeuShT4+7q7q30mtOJ9dxRkD6JRUC5ELF9S6kwVE2
	Sfbtd4/4l7asZneCGQq9OKNObgfl496S3cLhw2sb7O67dw5IVrW1E+jw33hBYWK5gKtUbSNOOVx
	XpC40RMRdDjY91n6wcIL7DUNYvdIdfrjuCXbP783mpQBUb7MLgKeBOxzPP1bKbXrdQu7griQffj
	foMrA=
X-Gm-Gg: ASbGnct3jb+29bWyXq577ewS+MkCCt/JR5tgZNXqCjxTgn2QeZrUUU91CUMe4XfVCcm
	fKiLtGFSAT2+s+Gk99YuQifXr12XNkA3sGDGmOwczXzs5fKpeIaliRv88vR5eEwBSe2ncHSOM58
	uWpn3PZ0EUpuG2tZbOh4XgD9xhJqAP22XkUDacqFAIjLKZcjvmcFnwegpgst/zGue3mA8HbLEVB
	Ro4jpip9+F5vdw30cWXZHedNvjVmSMZZXGFYBL2/ucQp9R6YxcHyT1sodFwo8v8CAT0taUzbg4s
	FjbxrpIITWkmJbVH+T0oj+XPrw7DGShlqv/iI4hxm7DUgmqNBW2mRIWQfpAk4lOCK4cMOKxCl4M
	=
X-Received: by 2002:a05:620a:4110:b0:7c8:39ea:5166 with SMTP id af79cd13be357-7c9607ac4damr238094185a.55.1745570705074;
        Fri, 25 Apr 2025 01:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo/fTCmXh0VcgRPEJWOvuNLNfWqmgIIahEDT1otn2CI/hrkOd7VZ6291AUnPNO2VEm27UMsw==
X-Received: by 2002:a05:620a:4110:b0:7c8:39ea:5166 with SMTP id af79cd13be357-7c9607ac4damr238091985a.55.1745570704650;
        Fri, 25 Apr 2025 01:45:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3a688sm510091e87.77.2025.04.25.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:45:03 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:45:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH 00/11] clang-merge: Bring clang recipes from meta-clang
Message-ID: <u4rkfqrav7efoufqawci5yoncg24plo5xqpklxwjoxc23titkb@5r22roqrtknp>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <zvfx3kfrbicdbv424j4ustmrrjwjg7immyx4lp6ihrnwktgsks@rqy3zvo7xjai>
 <0724d355-d683-4b4f-abd4-68c31bbef674@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0724d355-d683-4b4f-abd4-68c31bbef674@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2MyBTYWx0ZWRfXyQlBpkO8+PoJ chiuflorIALalWQXfK5+vScGjwYyat4VaOyXt9dC2qJ7sOTd+tNq5RisGx2CJaETx3VtA8C2dOD RAegO4++m0ch0RToKEEl62Xi2oBgH3QTdzm4lsTtgpCPKCipK7/oyOqO3Dj70j5XCKqte5HAAKN
 kNUTbPcBI1k64WIrsDZHqLCCT6lZLUosisVLyTa9z6YLelVU6JejorytBpbdcQLW2d4iZ6TpXqU KLC/WU3/ZvI/wE8IU62kVs963TpYTMGgZwTcVT7Bo4bTYSZf6YHssM84yisp05sIVa9aJguGNXi L+YduLXOXQGRkzama/9gLia2ax59k0tsHFWjT38Ed30/se/JwjjHgZKKMfem8kv0F8ot418WZFl
 LVAJbwfj3b9/2ZQ4D4vPtzbkIT2abGBIvTqDoGhf5B4nFKlWphQ+0hEu2iI+XYMaQCN2Vi3D
X-Proofpoint-GUID: V7D8tB1wVFkl7ok6YNKoVnQnHtEoTFAz
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680b4b91 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=C8M6v4uNgijL-PgBwI4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: V7D8tB1wVFkl7ok6YNKoVnQnHtEoTFAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215445

On Thu, Apr 24, 2025 at 05:44:03PM -0700, Khem Raj wrote:
> On 4/24/25 3:04 AM, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 12:20:34AM -0700, Khem Raj wrote:
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
> > After fixing the RPROVIDES, this still fails the nativesdk-mesa build if
> 
> clang recipe does have this
> 
> PROVIDES:append:class-native = " llvm-native libclc-native
> spirv-llvm-translator-native"
> PROVIDES:append:class-target = " llvm libclc spirv-llvm-translator"
> PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc
> nativesdk-spirv-llvm-translator"
> 
> 
> I wonder why is RPROVIDE needed.

I'll capture the errors for v2.

> 
> > I enable OpenCL.
> > 
> > ERROR: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/libMesaOpenCL.so.1.0.0 in package nativesdk-libopencl-mesa contains reference to TMPDIR [buildpaths]
> > 
> > While building OpenCL-enabled Mesa:
> > 
> > /home/lumag/Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
> > Unable to generate bindings: clang diagnosed error: /home/lumag/Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
> >
> 
> I do not see this error for qemux86-64 here ( maybe it happens for arm64
> targets alone ? ) I enabled opencl related pakageconfigs for nativesdk-mesa
> I added this line
> 
> PACKAGECONFIG:append:class-nativesdk = " libclc gallium-llvm amd svga"
> 
> and nativesdk-mesa built just fine.
> 

Most likely because it can use headers from the native sysroot. I was
usually building three targets, qemuarm64, qemuarm and qemux86-64.

-- 
With best wishes
Dmitry

