Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AC2CA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 18:43:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.1676.1755888197325704902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 11:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=C0CzAAx/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUh8M026217
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 18:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IQK4OE4gMpM9BDQCjQtIT7N+
	N4eH+05rzENriA7GTvs=; b=C0CzAAx/2I6vlFjgma0W9xA+6xzyh8QZrVXJYJV5
	L78xns12wtDIQIfzaxOaVsOg7k8mskfqwcsUPW9KXZgHqE/2y9z0VM/i4VwamPsB
	wOvt8GCDWyu/MV36Vhpk1bVgRxRC7PHBhdiaw2GLapfmcGlfewV5ipCjppuvFI30
	ziH42FPvrSy+7AKW6MhnvdZXiFV699VIhZ5J5hAQkNN3UXIBnS3LrjJiVrAy9r3e
	MAYLHKNDuiEXkf119KnP0SYtIEzdQflZAPIfuTdZEECluv94Y17i5VbdYXFdY2Gy
	3q/UHIP1B5mr8a7oqfWC8O3JTnv2eJhAz70rDFY014v8Og==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw1086r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 18:43:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d7c7e9709so63713646d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 11:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755888195; x=1756492995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQK4OE4gMpM9BDQCjQtIT7N+N4eH+05rzENriA7GTvs=;
        b=UsH8uiB+7QiJi8laEdAAxLG8PNHT3YQ/23mf/TbHsX1v4gHYy6ocPZWwxGmMa6d7a2
         im6W41Dk3kD0UAfk2f31vyshG+S8utfhvi57Z8prETBFq3n+wm6wVeydCl9rk3aVyYZL
         W0UV7RZcvyQrRxKg3Xjc1ZvcI3frMdPBZv/7hyKROBGIF/WOIxWuScQ0UTzbLkPU9UhT
         2wHvTMOpotUIpszHGGLuO2OBMYtpxf2t2VQuDQuaSFUFb4qkhYUnOWnImFEj3EIOr+b9
         YdLVM4xL4Dv3v0jupcaz6w+jWfgd9KnkY5e9IleuKUsJC8qsXbj0YETH18XRfQJQqSQb
         LL5A==
X-Gm-Message-State: AOJu0YwmI+8M6g5m8551XXOVNk97B4ut0XJE6M9vAJwkteRNc9dqefRW
	odc60q2RT3rP8S+KuMr3dhbWJ4ybcSjA55zwjAHEklsEZGxoR2bnX9SpDOK9SgnNXRNrZaZ+3WD
	R9b8lk2pN7Jw/S/+0Y0zU7Z4Fa/jZU/V1xD17rlCzCMK8kqGzquYZMbCFFpbPhY8mZ05v1s/YRo
	DxLuaEsuA=
X-Gm-Gg: ASbGncsPROFvYjEoDc7U1K3sNdzdFWO38JwXzu2cc26p7bKeahfWHHeN+rUcARyIVTY
	/nVNkVXG/C4KYaE3vGp9QyOIPztjz7VfxYZbVSDI/Y5LCGB5ctG/iA4l2iomtJKIkPlNssQOiOm
	TgaSQSx0kHqGIuzvTQYuuHrMoDpLASDBWP33m/dshMDFk0t3ns9obJnVxJCtQcLJVLC/aY7azhg
	tb+axYWKZWa7DPNoOpo+BGFj/Y691nEh7np0pkSr3eZHN85DCmxgfupFBgVjNbfgNZ07kt5FSVY
	7I8ZT9Khm3P0329x5l1yPnuUrRxyn0v3UjwP9e5J8DFnPvvQiduNkRzebfj871zwPuG1mhG4C+3
	6qtdwB8wC3zkMZz3HcHcnStnMx79S1tK0k3J3Wj/p18wrpxoOrEEc
X-Received: by 2002:a05:6214:2685:b0:70b:b4de:45b6 with SMTP id 6a1803df08f44-70d97251514mr54605276d6.18.1755888195257;
        Fri, 22 Aug 2025 11:43:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETNRCuotay44YxrIwO74lMSG2p20c81lWhP4nDTaTAkUUECf3c8Op/6OEzntnWJdiUSdcFLA==
X-Received: by 2002:a05:6214:2685:b0:70b:b4de:45b6 with SMTP id 6a1803df08f44-70d97251514mr54604866d6.18.1755888194634;
        Fri, 22 Aug 2025 11:43:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c994bbsm96436e87.104.2025.08.22.11.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:43:13 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:43:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
        Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Quentin Schulz <quentin.schulz@cherry.de>,
        Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH v6 00/14] mesa: lighten up target's libclc dependencies
 and fix panfrost support
Message-ID: <3pbfa6vj2ep3noewfvi3spmmvxhkthsyzfrvnlh3j3ncakfkzq@ircn74bybcaj>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
X-Proofpoint-GUID: guSd6ktIFMN7oaLQaFTrR5lyI3x6Lv39
X-Authority-Analysis: v=2.4 cv=Z+fsHGRA c=1 sm=1 tr=0 ts=68a8ba44 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2vK5742W2NiYS6pK0uMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX6q/Sbct5j5G0
 E1l8W1nhSqBAsy+pu1+dEHnGY9YAgHTEM7UrvPHuAumaWp6ZupyQ86Ui9HI4Ho36xyvMhUmK7On
 HeWJjPQZZBczYJxWDvNM4NOnPf0KL1VHVnjuPPsvqoqJ8451vSJBHT9UiO5fkXYv1NE19pq1kUA
 29O9LGwQ7/lKEAXSudZl1I8guzlIHxiXj3vPU0plHwR+cUAlSk2tdLTmc+kNbVqDN7M22cpfEMk
 BrO8r2RiQKL8PXyKCePmc4GHzfyAHFkGz6f7AY73mCNWgINw5YfEAKSXxdFHC0GOckyu/t2z8Cm
 gJZoZaBniewWWTmULIv5jmTcGQ2u1IWFjj69GysZk9c46e3KUbAHhZ9n5IFU1OqVLxYi50BNboD
 AyLLjl2h
X-Proofpoint-ORIG-GUID: guSd6ktIFMN7oaLQaFTrR5lyI3x6Lv39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 18:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222344

On Fri, Aug 22, 2025 at 02:53:06PM +0200, Quentin Schulz wrote:
> @Otavio, can I add the new mesa-tools-native recipe under your
> maintainership in meta/conf/distro/include/maintainers.inc, it is after
> all still mesa?
> 
> Panfrost support has been broken for a while already because it now
> requires libclc which isn't enforced by default. This fixes this
> oversight.
> 
> While re-adding support for panfrost, the build time for libclc were a
> bit too much to my taste and I tried to figure out if we could lighten
> up the dependencies for the target recipe and it seems to be the case.
> 
> libclc brings very expensive dependencies such as llvm and clang.
> Building clang and llvm for each target architecture is very expensive,
> but mesa allows to depend on prebuilt host binaries (mesa-clc and
> precomp-compiler). Those are built by mesa as well, but can be compiled
> in mesa-native instead of mesa, making the dependency expensive but only
> once regardless of the number of target architectures to build for.
> Ideally the mesa-clc and precomp-compiler would only be compiled in
> mesa-native if target mesa requires libclc support, however this is not
> possible as a target recipe cannot impact or depend on a native recipe's
> configuration. We thus have two choices, always build libclc in
> mesa-native with its heavy dependencies and impact every build or force
> the user to modify the mesa-native recipe in a custom layer (as a native
> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> former seems to be the only option. Another big downside is that
> mesa-native currently builds drivers (amd, nouveau, svga) which we may
> have absolutely no interest in building, increasing the build time and
> possibly dependencies list).
> 
> A third choice is to spin-off the native mesa recipe with libclc support
> into a new recipe without drivers and only what's necessary to build
> mesa-clc and precomp-compiler binaries.
> This allows to keep a "clean" mesa-native recipe for whoever needs those
> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> and only bring the libclc dependency when required by the target recipe.
> 
> Because libclc is now only built for the host, opencl support now needs
> to explicitly bring libclc and others to build as libclc won't bring it
> in the build environment anymore.
> 
> Note that this was essentially only build tested (run tested on RK3588
> with panfrost though).
> 
> Note that building gallium-llvm support on big.LITTLE architecture with
> TOOLCHAIN = "gcc" (the default) currently doesn't work as llvm doesn't
> support big.LITTLE architecture in -mcpu/-march which is passed to the
> CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
> further than that but that prevents us from building opencl support for
> Rockchip most popular and powerful SoCs right now. One option could be
> to force this recipe to be built with clang toolchain only whenever
> gallium-llvm is specified in PACKAGECONFIG (not tested). Though that may
> be not straightforward seeing the comment in libclc recipe related to
> forcing the toolchain to clang.
> I'm also not sure mesa has a way to specify different args to LLVM-only
> drivers but that could be another option.
> 
> Runtime tested on RK3588 and PX30 with kmscube.
> Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
> after some time but could be kernel related as it starts failing after
> [  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=1, config=0x7b00, status=0x8, head=0xa68d200, tail=0xa68d200, sched_job=0000000019e6f20d
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

