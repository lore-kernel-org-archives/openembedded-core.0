Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3062C36012
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 13:55:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50541.1743083736568839862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 06:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=mpRdR7oB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5k32Y026007
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=grNWZOVNovmSSBPIu68dRB
	UUPkPEUgCcPvM0mRa+o0g=; b=mpRdR7oBYM9a3t7B8n4Bm/4MHQISWcBXRgzyX4
	/vjAgw5iuEW43n9LJsVkAOyecWU5PtPUoASw731ko7N4p4UjS7UhLDimpihG31Zn
	5Buyi3V4XUFZ0kPjQeNqPjyEgffMI8zdBVW+bIX9xF9uD8byoJx4IIytP0UD0mTP
	nTack47dlRS84wuILNatgwwDGS1bH9xwPa90IqH35pXrhimLDQhU5pf7vvNm/aeK
	/6fZ11+GHPPMYdVcGUQgz/sRCbXL9+32Vk1ONyuLww1qurzO7LvsjVFXYeXWH57o
	gRJAJScCK5ZyUHCdnc4HmVG0eGGRIP3KNhJfDE3J1lExWY5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4rqag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54a6b0c70so117249385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083723; x=1743688523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grNWZOVNovmSSBPIu68dRBUUPkPEUgCcPvM0mRa+o0g=;
        b=lmIjFJPQaJKS/d3SLZt2w1Prd4Tdc0ddaXbNKQxSKckTQN0Wg/DHz4QX7ZZQsLQy69
         yRd1HHBWPoL7tI9Yp6SBG0HXEFuQAgw+kl3lK+j3mzUGsydlJaMKIgeWS5PRhSk8s/jb
         CAtITA8Jo9xDFq6fQh/HN5oPsSBATHaAa4O7LCBZEdHesEFmkNRGkzkbHkRODlpI/aNV
         5Swge21fc17NGya70j/ntT+nVn03JWq80r04BJ7J/OPM8kOL+gx2rFghlOWE73XWV3kO
         ARSW4YWXWf85SQThhJyHXsEjaDkuKN8ID6R78Xj/oRO0A92Njf5EJ+sIevXROnbvd1eH
         mFYQ==
X-Gm-Message-State: AOJu0YwJS5hJLrFo9U5VUX4A+60+H6/27fu/jKhxk3qEkeAWyyrodoWw
	yClm9Xt0yrTOnk37gHAsWYd4XynUto999t2lGdTQSgdY2sYNSlik0kcJRWOUtxP+AyRsnY2yrUQ
	w2sCdWGEeLhZplrOsPyQLCGp2cX+iC8Z+xjGiVFhIAgKt139E+I8UtLqYMXjej5pqBTM3DOYQkv
	apo9jwIb1lWhI=
X-Gm-Gg: ASbGncs0iawNa5xZcNEsoBla35LqZ/4lCUbGpmW4zztCntfQmk7+FtSB4R7WPvg3y8K
	jbcblRqRKGplrLp8EekQ+gyzThmkx6OveTvfR94YA9jUc7kyFRxQL2iJ1ncVJkbXv5tSRxzgNB8
	ck152PZlcqMwIRyTPCH8IPKx34fFPvdYbCZ06uXLuuHjqGGOXb9NNz/5fIsPwVRvlTdJV6GGCEM
	eGVOV0VPOFVLb7ciFTPoWFN5nneSx8qIhV3mm/6cVUlXIwFO9C1FoOTMgfBs4OfL5XuHKkztJLt
	DZjkgIEpGOsfKCbFdfE3hbhY8p0hfaML/bMdUU0UI//cWLusRd0Wd0CiHlOxHBcw/JF420LR//c
	vqYf5JskgXMlGvBAYJWvyUz+BMgdx
X-Received: by 2002:a05:620a:4407:b0:7c5:e2a0:4e64 with SMTP id af79cd13be357-7c5eda843fcmr614342585a.51.1743083722845;
        Thu, 27 Mar 2025 06:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdJaaS9PDSUEPRtfS5t8hOANAK0rebi1DqIKzA4l0yAy4WcbSq2Aega86PVxFZeJZxlDIjPA==
X-Received: by 2002:a05:620a:4407:b0:7c5:e2a0:4e64 with SMTP id af79cd13be357-7c5eda843fcmr614337285a.51.1743083722368;
        Thu, 27 Mar 2025 06:55:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e70sm24288271fa.105.2025.03.27.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:55:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 0/8] mesa: upgrade to 25.0.2
Date: Thu, 27 Mar 2025 15:55:12 +0200
Message-Id: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: DzpzJDuUuLA3YkeIIUJAJu0daVc1kMJV
X-Proofpoint-GUID: DzpzJDuUuLA3YkeIIUJAJu0daVc1kMJV
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e558d8 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=vr40fS1c8MbUWjUDQeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=839 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52R5k32Y026007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213735

libclc is required in order to build Intel drivers in Mesa 24.1 and
later. Thus OE-Core is currently locked to the 24.0.x branch, which is
no longer maintained, having last release in June 2024.

A clean solution is to package Clang, then use it to build libclc and
SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
creating proper recipes for Clang is a long process (ongoing by Khem
Raj).

This patchset attempts to solve the issue in a simpler way: by building
libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
don't have to create target Clang recipes, there is no extra toolchain
to support, etc. Clang binaries are creted as a part of the build
process (in order to support building target packages), however it only
hits the LLVM sysroot-native and is only used by the LLVM target build.

Future work by Khem (once Clang is properly supported in OE-Core) should
allow us to create proper recipes for libclc and spirv-llvm-translator
and drop them from the llvm / clang recipe.

I think this approach provides a good balance between OE-Core being
stuck with the outdated Mesa release and being able to upgrade it,
bringing support for new hardware.

Last two patches of the series bring in RustiCL support, a new OpenCL
implementation within Mesa. They are optional for the sake of the
upgrade and can be dropped if there is any issue with those. RustiCL
support is mostly compile-tested at this point.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Dmitry Baryshkov (7):
  llvm: move libLLVM.so.N.M to llvm-libllvm package
  llvm: use OECMAKE_SOURCEPATH to specify cmake dir
  llvm: support building libclc
  llvm: import YOCTO_ALTERNATE_LIBDIR patch from meta-clang
  llvm: add SPIRV-LLVM-Translator support
  mesa: upgrade 24.0.7 -> 25.0.2
  bindgen-cli: a tool to generate Rust bindings

Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
  mesa: add support for RustiCL under PACKAGECONFIG "opencl"

 meta/conf/distro/include/maintainers.inc      |   1 +
 .../bindgen-cli/bindgen-cli-crates.inc        | 186 ++++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.71.1.bb         |  19 ++
 ...ossCompile-pass-SPIR-V-headers-path-.patch |  40 ++++
 ...-llvm-allow-env-override-of-exe-path.patch |  41 +++-
 .../llvm/llvm/fix-native-compilation.patch    |  67 +++++++
 meta/recipes-devtools/llvm/llvm/llvm-config   |   7 +
 .../llvm/llvm/spirv-internal-build.patch      |  27 +++
 meta/recipes-devtools/llvm/llvm_20.1.0.bb     |  76 ++++++-
 ...-meson-do-not-pull-in-clc-for-clover.patch |  53 -----
 ...lude-missing-llvm-IR-header-Module.h.patch |  41 ----
 .../0001-drisw-fix-build-without-dri3.patch   |  58 ------
 ...on-t-encode-build-path-into-binaries.patch |  46 ++++-
 ...son-use-target-path-for-Clang-libdir.patch |  42 ++++
 ...cross-compilation-arguments-to-LLVM-.patch |  64 ++++++
 ...on-t-try-zink-if-not-enabled-in-mesa.patch |  42 ----
 meta/recipes-graphics/mesa/mesa.inc           | 103 +++++-----
 17 files changed, 656 insertions(+), 257 deletions(-)
 create mode 100644 meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.=
inc
 create mode 100644 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.=
bb
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-cmake-modules-Cr=
ossCompile-pass-SPIR-V-headers-path-.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/fix-native-compilatio=
n.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/spirv-internal-build.=
patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do=
-not-pull-in-clc-for-clover.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-mis=
sing-llvm-IR-header-Module.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build=
-without-dri3.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-use-targe=
t-path-for-Clang-libdir.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-provide=
-cross-compilation-arguments-to-LLVM-.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-tr=
y-zink-if-not-enabled-in-mesa.patch

--=20
2.39.5


