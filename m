Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E19C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 10:57:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.8440.1743159419092218604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 03:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KjKLbdyW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S598gj011618
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=891FWllaqPqgBkVawZbvQ5kr
	6qR4JQ+WKxZoAOdjKw8=; b=KjKLbdyW532N+31LVohq2BeG6D60MWOBo1VoV/aG
	xkvU/qL2ngMcWlNiDA+DhqSF0r14q+ff4aSd/JbBcha8xjdZDRf15AuprWZMNPTI
	AD9J0/0hg3WBZfC9aJtqonx0Lv3Tvs3ecwud0Dfo+z4lN69YvP/PtdQLc0uAy/8x
	OBXaeAdzl1WSdWa2EL2ZV7isVJdtlfsvbqIlu3hB/nlELcOn636ynPGqyb+esA8V
	hAezKRfiTsAAYlRyVd+ylOEWzl/1jsCfWQZ/g3Dm9KbQjljCE6npTHBsIacerPX2
	uHAuwUAGVyOTX1KWtsZufVOMw5hK+pLGg2tgWjZwPgA1cA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj87jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:56:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff55so443260085a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 03:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159417; x=1743764217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=891FWllaqPqgBkVawZbvQ5kr6qR4JQ+WKxZoAOdjKw8=;
        b=rzvui4r0VfM4mxuAOX/J9uxuvcYTpvxHxt+DkNfEeYZoxdZkMELQ5hJqZa7kWMarV8
         lc3GIKwHY2i9Bws/gafmXlnXykepexBkCBghW9pvxwAUNVOuaMPbV0fAyjW4SFYLIhQB
         Kf9hUFwGjfwdTv07JDoAVQ2snxUZhSgmqT14ETOTqnD44plZnQFuyXM0MQjo7fS2ClI/
         /N82Sd0cYTPbVv1IWnI/ZLbTshRoh0SoXaZi0JdOuLl6stEz5Ov9Sm9WrKPTAeV1egGM
         aa+iDlxXAbzlTgbx8G9bRoSOuSEFRsHxEVii9CJhcWXc1SyJYow5wopuqoDdxlF0G+2l
         Zj/Q==
X-Gm-Message-State: AOJu0YxUSqDWKxvJiQR549Cp76nzkvx/RWMhYvjscyxxt6EecFCcKWg5
	7wHPEeX+YJFIdoRqJIXBxzMOXKYTAU3oEoAcXUo1KiTyHsd8ssR7ISTCkiqDxejbTuBxvLsXdVh
	TlTEaHWsVKoUV2+K9nIBjDXthk61h0Xz8Z2brOsbWVCOgV09KYuPnxUzSCt5H0IdOBoSmDc2SHa
	udVE1WJT+fc0g=
X-Gm-Gg: ASbGncv+4GTULejlKa9Mr8Wzig//TTaOOeXZcNm/0p+0EVg++/2UaApHbmLSB+SUrc3
	0AiyMcsLZH6UyIg1YQ1YXWyFXhc9jkVda91u9ccm95zAmaxxFhvMeyXT3ozL4UOX5HelFg2LyY5
	LMdg2pS7xb63IDICWrqd8p1f4a1tMaJp9Eune8Won4rppl27Po9Ds3m3El1+AmtsFjHSogN7eVC
	ASswYfOQnyg4WdO+kAs/NU11x7wjWHRJAUVDHgSQ+dairIzqI+pE7JIh7zq5KJ1mrZ/Q0AgerVF
	Cneb4W5bjunVtCT/Rwooe8syYkUF3WF7NUkyMUY2BMmgxxH3TcJcbqbbwZaUTYdcErMMFwTu2ds
	6B1I=
X-Received: by 2002:a05:620a:3184:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7c5ed9f9e4emr1045357885a.23.1743159416812;
        Fri, 28 Mar 2025 03:56:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVdXPocQL/rbdrde5U9kloAmt4TOh9d++sr+g9QOj1mFw2KVMms6+afcGg8VrdHj46snzdoQ==
X-Received: by 2002:a05:620a:3184:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7c5ed9f9e4emr1045354285a.23.1743159416197;
        Fri, 28 Mar 2025 03:56:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590dcasm270106e87.175.2025.03.28.03.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:56:55 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:56:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/7] mesa: upgrade to 25.0.2
Message-ID: <au2oblynx5trv3mgzttmvg37yjoua3nlpjbbcamaoaf3pbsc6b@ulm7hov6lhz2>
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
 <D8RSC82XXPV4.1NJ347ZPRD6V1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8RSC82XXPV4.1NJ347ZPRD6V1@bootlin.com>
X-Proofpoint-GUID: FmrjHZiL5_FWt0dZHEjnPOrHGTvdCfPc
X-Proofpoint-ORIG-GUID: FmrjHZiL5_FWt0dZHEjnPOrHGTvdCfPc
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e6807a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=uoBhA4lb_qGyLYys5nYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213827

On Fri, Mar 28, 2025 at 10:18:05AM +0100, Mathieu Dubois-Briand wrote:
> On Thu Mar 27, 2025 at 11:18 PM CET, Dmitry Baryshkov via lists.openembedded.org wrote:
> > libclc is required in order to build Intel drivers in Mesa 24.1 and
> > later. Thus OE-Core is currently locked to the 24.0.x branch, which is
> > no longer maintained, having last release in June 2024.
> >
> > A clean solution is to package Clang, then use it to build libclc and
> > SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> > creating proper recipes for Clang is a long process (ongoing by Khem
> > Raj).
> >
> > This patchset attempts to solve the issue in a simpler way: by building
> > libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> > don't have to create target Clang recipes, there is no extra toolchain
> > to support, etc. Clang binaries are creted as a part of the build
> > process (in order to support building target packages), however it only
> > hits the LLVM sysroot-native and is only used by the LLVM target build.
> >
> > Future work by Khem (once Clang is properly supported in OE-Core) should
> > allow us to create proper recipes for libclc and spirv-llvm-translator
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
> > Changes since v1:
> > - Dropped YOCTO_ALTERNATE_LIBDIR patch
> > - Reworked mesa / LLVM integration to always use get_option('libdir')
> > - Reenabled AMD Vulkan driver (got disabled because of c&p error)
> > - Moved mesa-clc options to the libclc PACKAGECONFIG to fix several
> >   build errors
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Hi,
> 
> Thanks for the v2, but it looks like we still have some issues on the
> autobuilder:
> 
> ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/dri/libdril_dri.so in package nativesdk-mesa-megadriver contains reference to TMPDIR [buildpaths]
> ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: nativesdk-mesa-megadriver: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/dri/libdril_dri.so contains bad RPATH /srv/pokybuild/yocto-worker/meta-intel/build/build/tmp/work/x86_64-linux/llvm-native/20.1.0/recipe-sysroot-native/usr/lib:/srv/pokybuild/yocto-worker/meta-intel/build/build/tmp/work/x86_64-linux/llvm-native/20.1.0/recipe-sysroot-native/lib [rpaths]
> ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/libgallium-25.0.2.so in package nativesdk-libgallium contains reference to TMPDIR [buildpaths]
> ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: nativesdk-libgallium: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/libgallium-25.0.2.so contains bad RPATH /srv/pokybuild/yocto-worker/meta-intel/build/build/tmp/work/x86_64-linux/llvm-native/20.1.0/recipe-sysroot-native/usr/lib:/srv/pokybuild/yocto-worker/meta-intel/build/build/tmp/work/x86_64-linux/llvm-native/20.1.0/recipe-sysroot-native/lib [rpaths]
> ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found, failing task.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/1288
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1289

I will take a look at the SDK builds, thanks!

-- 
With best wishes
Dmitry

