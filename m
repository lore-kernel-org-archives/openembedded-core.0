Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB04C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 19:09:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.4425.1744139336639086992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 12:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QqzHu4bd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BXO3O010525
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Apr 2025 19:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kViNm+TESBi6ohPo1JjYq3EANsheQY69HjWb+ypQqPk=; b=QqzHu4bdLU3g6LnX
	KLEN1WeGiofhinnSS4O/omtnXnoiapgkMoPokkwjucX4bVyhvmgoL0/Dqm/INA5S
	17yYxKK5Em779xznZNDxC0hoFFo7ewDdH/sWTCmvwaVW23J8/PnDUYe4YyNp27L8
	YZYp61OOY5lWlx7+EUUk94RXZRGHOX9JY8vFrfnGKznyXybCz+i0ev/+so1iLLQd
	eMr09nCNqTNN5qru0z6VDisvLFncmO7/TcS6PiXTPH/Za4xWudiMMSrZXUxh45j8
	p1Ng1AKsD0q3012ntZ54oGy68yjhq2dpUNG1/0+tVbRCzRcb9QZL1Pdgka/mkfxs
	2VzEBw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1gu1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 19:08:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30364fc706fso5389729a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 12:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744139334; x=1744744134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kViNm+TESBi6ohPo1JjYq3EANsheQY69HjWb+ypQqPk=;
        b=aV3Q3P/CXNJIBfi8np0/wADA+tSw2rxJ0ETLbsEJVThXHgH+qR2XP8E1y84mqseFVo
         3g4V6QXOs84RhZjh16XI3HRYq7149EH/2S0ELJV4db60vMumKS2K3kj+M+gQGiEDC4Go
         FvkX2trAsYJTuKHM5SkDZrQOJpf9iBK6e5AHJI8gVI04Ldshg4nLPEQVSPpsEDho0LxM
         Cn50ROlouXE5wX8rVoIooSA4yrPDjqQn5SyPLbGEgPgC5Rxymf1DBCabGvq+4kagXrCd
         4Febi0ComlRQpwzpw+S/HaaeKu+Dp9LemYLhN3ahFOXW3E4K4wDUd4NzyXJAA5L95Riu
         1xdA==
X-Gm-Message-State: AOJu0YwKlcnJCcqLtALiBreOww8kOTklr19yJn6jrJ/Ghw07nbzFTSwL
	UlDBxG/uCExLKrnI2MD0XGMVvcD3MrsBw2DqCgqafDFEs+RnHis8tDSwqtloHbFfJSyRoQGqy9F
	hiN7Y45KSyqResIf59GAb2oEI8EW+09znYgMqcGnB/sV7RU02tGincxMFnDSkIjFKNUyV7O+a08
	/xyqvQ8wqLMbdaUYU6BfuzccvgynHhB5T+wOMPu1zLyy69Lrraar3OCA==
X-Gm-Gg: ASbGncsvUYmKdxN5qLlwV7wNWIj0phNdBdPocxtwzPHvqhsVxdrLc4EzsDdUzi8K8AS
	gB7Fz/WfMApQwZ4v2DHcgFoFHZb4bl9dICKaPa+nGT3eJlnBq1jDDbflQhjK0uM0vTDsJ7Nq6
X-Received: by 2002:a17:90b:3a48:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-306dbb94e5cmr539296a91.7.1744139334229;
        Tue, 08 Apr 2025 12:08:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVH9OPfNUW95tMKXaB/W9vVCrJ/7/wR4HA6gmkBbtpXqwF4MZPZr5nbBRW6p34Na7x+07aO2ZCTDs8LTZ6Nlw=
X-Received: by 2002:a17:90b:3a48:b0:2fa:157e:c78e with SMTP id
 98e67ed59e1d1-306dbb94e5cmr539268a91.7.1744139333915; Tue, 08 Apr 2025
 12:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com> <D91AOK9S03Q6.2FUYPG6HID1V@bootlin.com>
In-Reply-To: <D91AOK9S03Q6.2FUYPG6HID1V@bootlin.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 22:08:42 +0300
X-Gm-Features: ATxdqUHhLEg2I19jNpu5l5_Weakj_HntYTKfWJw4KLGBrUohhcrNWHoWSLgvcLc
Message-ID: <CAO9ioeXKBkUSzeqw-K4wDS1_=U=Do8mueFdz09oVroUtAmKEcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 00/13] mesa: upgrade to 25.0.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
        =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yc0rEhhOL2_kE03iVhcQN_aVeYO4_8Ri
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f57447 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=SeR2dSFOC_917RH7R5QA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: yc0rEhhOL2_kE03iVhcQN_aVeYO4_8Ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 19:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214553

On Tue, 8 Apr 2025 at 16:34, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Mon Apr 7, 2025 at 11:48 AM CEST, Dmitry Baryshkov via lists.openembed=
ded.org wrote:
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
> > Future work by Khem (once Clang is properly supported in OE-Core) shoul=
d
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
> > NOTE: This depends on the https://github.com/kraj/meta-clang/pull/1075
> > for interoperability with meta-clang
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
>
> Hi Dmitry,
>
> Thanks for the new version, but it looks like we still have some issues:
>
> | Mangler.cpp:(.text._ZN4SPIR13MangleVisitor18recordSubstitutionERKNSt7__=
cxx1112basic_stringIcSt11char_traitsIcESaIcEEE[_ZN4SPIR13MangleVisitor18rec=
ordSubstitutionERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE]+0x2=
3f): undefined reference to `std::__throw_bad_array_new_length()'
> | collect2: error: ld returned 1 exit status
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/1356
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1331
>
> Can you have a look at this please?

This definitely looks like a llvm built for a newer system (or
uninative) being used for an older one (debian-11, which is pretty
old).
I think we need to fix the uninative.bbclass to add NATIVELSBSTRING to
BB_HASHCONFIG_WHITELIST only if the uninative actually gets selected.
I will check if that works...


--
With best wishes
Dmitry

