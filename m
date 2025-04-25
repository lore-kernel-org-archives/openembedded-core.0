Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF69C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:04:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.4149.1745579097721028168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UP1Lhd4i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6PQ022914
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8YvNgXcND/r/v3vB8VOwltNk
	X4j1mxZL0PFTUsG05ZA=; b=UP1Lhd4iHfIGX0GB0F2Wav8D0D7vfZ34wH/OhJrt
	eolOWJ/loqN9a5QTjm8+oGe2S5lQFQRwj+UzK1qALwCv60SeXeYmkh8mv4xWLdxm
	+tveZkqHJ5Qh9dx/M8+N+SxoRVNwsooF2UXMs6KCt7PLkfI/ROasOET3xpWsUfBn
	uJKwF+QAnemiiaAa2msT65yX7NheZE3pjfLHkBsRhJhEgWEUQMtYTen0z7mfx50M
	5a/6exOZ6E3SKX1Qrrk0G/+9V8GJMty0C3zknJhtSQ/Jqo6Bea5MdLuf57pNnKHy
	VinfGIeS+Y0QQInh5aUK8vtCv6tZgOesW38Pgrp9PEYTdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gukd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:04:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff78so606200785a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745579096; x=1746183896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YvNgXcND/r/v3vB8VOwltNkX4j1mxZL0PFTUsG05ZA=;
        b=oXhDhqMlpITvty7c8UL9vgsnJEUWORxlUpndSvVc3rImTK/o+pz8XonccEa7kkIm3f
         6Vw+LkiyqQrkLFC37hiAy+9TovA/+cmjGxMPsw+rdI3NaszV404InB2D7zfPdA/ANnNN
         XLR997imbF8wF5wJ7FeTgNlqyuZ87UxH9bxOzd2l5kgsYV38yWA+ZZJLe8UkjMjcf+Cj
         fiDn1Buf1lmTsotqdVFUBP1vq0evQt07iv9mu+vksl4L1j7SSgAyLvBcn7+yYCcsCVut
         FnNbQd6ghyQsu2FDLQC80CF1xzIUrKQM28OaSJw3DGPu7iSbtlx8D7LOK1ehyao7cKdw
         bg+Q==
X-Gm-Message-State: AOJu0YyyqVFfeFA5h/I5DFvpQRzc5mKM7uT0S6WPn8kT60v/i11MGDMw
	l52st94w6/BSMDdCAxcopKyETvKJ1R9fh3Lk8cxomuylSX7X/DFjeWSOH6ztT0BUtxmXPF1R1zP
	B6s1ROFMzL4tz8tfgnhZrjiLs6DLSMscTgmlFlMb/BIJx+Q8U7Jm43IXOmjAqDiGrDU3U3dph53
	3y2Eg=
X-Gm-Gg: ASbGncvR/Wkmyu6OLkyZDotTZHt2u4X2/OWlm+TAHAq5fqRfs9kqwePZPYGLTaA8U3L
	T0i6/9aR+0hdgzVDxfiYQrDc079IQCxpjj9FO+Y26ecxoGpVRvUOf5VGv7zkUmPpp9oeT1Kqbcz
	lTnzTy6nXG3prk65xzN5/RZjs1bANET40L+rKfYzQ29jzHpQj9SniUKBTH5mKfDMWhOOtQR8oEX
	78W7Fp1oaYvisPq9j1fVmll3xFEjnkP9IgPlKZluOcA172CzqKyhHGqaHNJOC1AvugMi2A2CfWy
	1xJda7w8CedhswfB6yVFhybLnAT9wkErQ5frMbteF4KokHB1wuhpY5OCdvs6oCAGXwyC/gF9+dg
	=
X-Received: by 2002:a05:620a:f0b:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7c9606ac23fmr312900385a.1.1745579095908;
        Fri, 25 Apr 2025 04:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzaPQh6UbgBynLvUuw9MakhUTC7QpJ98bIu5CyRa2UOk8zQU8R8U+THifggM/wG3IkvXQNlw==
X-Received: by 2002:a05:620a:f0b:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7c9606ac23fmr312897285a.1.1745579095526;
        Fri, 25 Apr 2025 04:04:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e8daa604dsm120199e87.90.2025.04.25.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:04:54 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:04:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH v2 0/7] clang-merge: Bring clang recipes from meta-clang
Message-ID: <ztns5wzhs562l7hsyrludvvinocsppknusdkenmspda3nogsm2@p2iml5ncm3am>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
 <aujf4cdo2qhrzn72sx2ctwnpyckkplkmizzuvkbvm2s7circvr@kv6tiwmj3jwt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aujf4cdo2qhrzn72sx2ctwnpyckkplkmizzuvkbvm2s7circvr@kv6tiwmj3jwt>
X-Proofpoint-GUID: Zx1Z8Nuazn1xzPmcoqqePNsbrByGgnpq
X-Proofpoint-ORIG-GUID: Zx1Z8Nuazn1xzPmcoqqePNsbrByGgnpq
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b6c59 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=C3DJJpGmxNnXoAWhgpYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4MCBTYWx0ZWRfXzirINqmXCBI5 L6agEc15UzyK7I/yM9UP6rf+5h/QXDfA3K93xyYenJlh0WX3UcVUlJxLjm4MKZm8NWoh9Koguk6 mpRepeZRCvFbMIAm/uTcEe3LLCnCHbSLwbkVaEp+F5NHfhQzT166cDnPaTFqiuE4UxAkl5p2fpL
 iLEbOO4T5u0Az0m/OTOlH+UfX8crDxvopDRisFSod5Wrgq/rEPV1MrHjF7tmnU7zbRylXm5ZoK4 XW6GfHWObYVF0hx6nlwgml+NCvaiuiQBgbpELj6yp5Xp1bKyGXLCjs/cbHnm0/+hg7anKwcPrEc b1GJC5zraZ/KkwK7Z1u3LgBXtiudVgfjM5zX6kS+n0miqrtskRkU7L09j4pt2mcZunD4BlXQbqY
 Eo/qf2aXjnl9uV3AQdXQUGWkGfh7vmajrxUX6Ks3iRz7qH1ibyXErHb3Wm9pQUJpJs+k6a/s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215452

On Fri, Apr 25, 2025 at 01:27:45PM +0300, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 10:43:21PM -0700, Khem Raj wrote:
> > Latest mesa 25+ needs libclang during build for tools like mesa_clc,
> > we enahnced already existing llvm recipe to build pieces of clang as
> > well, which worked for mesa's needs but broke static clang compiler
> > provided by meta-clang due to newfound conflicts, since clang is now
> > built with llvm recipe from core and also by meta-clang and they
> > compete for same namespace, an attempt to make them co-habit did reveal
> > more difficulties. Clang compiler from meta-clang is not able to use
> > llvm libraries from core since they patch them differently.
> > 
> > This patch series therefore brings clang and all recipes that build from
> > llvm sources into core. With this changeset, clang recipes can be removed
> > from meta-clang there is a pull request for that already [1]
> > As an aside, we only build clang once and use it for meta-clang needs
> > and core needs.
> > 
> > With this, meta-clang can depend upon core layer to provide clang and
> > related recipes, meta-clang will still provide the toolchain policies
> > around clang based toolchains. Clang compiler from core, while usable
> > for mesa is not yet fully usable out of box, since we need to workout
> > the multi-toolchain architecture for core, which will be done in next
> > phase after this merge.
> > 
> > [1] https://github.com/kraj/meta-clang/pull/1088
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> With the following lines in local.conf I got the RPROVIDES error:
> 
> PACKAGECONFIG:append:pn-mesa = " opencl libclc gallium-llvm "
> PACKAGECONFIG:append:pn-mesa-native = " opencl libclc gallium-llvm "
> PACKAGECONFIG:append:pn-nativesdk-mesa = " opencl libclc gallium-llvm "
> 
> $ DISTRO=poky MACHINE=qemux86-64 bitbake mesa
> 
> ERROR: Nothing RPROVIDES 'spirv-llvm-translator' (but /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'spirv-llvm-translator' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['spirv-llvm-translator']
> ERROR: Required build target 'mesa' has no buildable providers.
> Missing or unbuildable dependency chain was: ['mesa', 'spirv-llvm-translator']

After adding the RPROVIDES for libclc and spirv-llvm-translator, the
same command fails with:

ERROR: mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/lib/libMesaOpenCL.so.1.0.0 in package libopencl-mesa contains reference to TMPDIR [buildpaths]
ERROR: mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/lumag/Projects/RPB/build-rpb/tmp-poky/work/core2-64-poky-linux/mesa/25.0.2/temp/log.do_package_qa.3491435
ERROR: Task (/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa) failed with exit code '1'

-- 
With best wishes
Dmitry

