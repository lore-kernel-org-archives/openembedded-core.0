Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252E1C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.48789.1743079028791882336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=leuNvtDG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5ja2g003117
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=grNWZOVNovmSSBPIu68dRB
	UUPkPEUgCcPvM0mRa+o0g=; b=leuNvtDGPO7eIpweOkUvZCbm6CzwKt+DPJFrK0
	QEFv6nyefI6NpgCZSdRNnemTkQGfVVsc10rwGVWzw3G02CTTi+paY2eBjt2uqPDU
	BvI+dcHq06W+KMKY//YCfw8uVnrBTFuvU+TRx+4Ge/idPESrdUpVDwjT9S48uSoY
	mTxoya5PCYWlWjzIfwwMXqka7ZAvmMZ60Mrpbg+YdqDiZFe6Myeg1DNGDZ/4cWPT
	Xilmqdx+2dyuhV//IQK8WvA34n5ylc6ja3NqQrKbOOqgr5DYipGnByRoIbLY9WhL
	6dcnDeRjS+boM33+uLA1fz5/oR3NJBmBeanebfLJBwpT1nvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdx68g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c548e16909so111139985a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079026; x=1743683826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grNWZOVNovmSSBPIu68dRBUUPkPEUgCcPvM0mRa+o0g=;
        b=w0dtW7vUil+LDrnIouFyZGOYFjGFXifZeSW3lb3R0DBRUmK24O2MrNQsm048ki9wiL
         m33P7sz5IYMPyvM0ziiAHWNhaD3Z57tgj5rkHSusfG1XaGOQ+jUSTVKwbi/te0aCFdeM
         wab+k2WgrXAblmjton7rf04CeJ3Nz9AMfsRS4ukm6UfK8gBUdwNxwOUgfEvhwItMm/fB
         V76i8gL0wF9QfiiVxtOSlf6b642gQV8ULc0JE1NpRggLV1E1wxbTpViOXJXqyxP+LNBE
         64JNiKoheB/yP7qO0tgWN0gQ3jQywfrFAyf2BVbO5WCrbg3R0Khk8MArXzXIaoxZ1vJA
         8+aQ==
X-Gm-Message-State: AOJu0Yw7YGJpXqRg7nRaPMGXgilkpHWUjy04hS/njGWiCsTO1P3Pnw9V
	YmIFmX3wkebq6fBMZuF0MIHox1GUtLSW+9bGGRGhOeH7obzlb7AtopU52HY0OMmEFRW3OTJccni
	VEnaAs/cyK+/429uvByJzk/iHMOIS/E9Q74Nsd2E8R42w0ROLBb6MnUzuYapD2KyPH5IbWVe/01
	OB5VdXpJVgKNc=
X-Gm-Gg: ASbGncuyEdGN5H5sdXdOwdLfFbT3zFjZgyJYXiuB+eqbR7CcCpnDMqn9ms4TnyRIawr
	gKkekeayzhJiEU7249nshJ4Hw+rs8/hjdF0/UHWNFdMY7nI2P9zKQ8vk2jrUTviQls6Y3aUeYsG
	OUed/D0jZ8I+FUG4GoKpdGUa4uJixWpJQRQYNxnMm6oQfqjuWfTSo+33YNVdv1nh+gjciwBRxOe
	/ECk7CIzUft4+RyRSFaflr6iQHiP47rOTF+j90BqXs1pdQOYOqwaDn4yRgyFcDmhH+zDcCxjanL
	nWAQIpfm2obMrr7kO54XpFjD2eHc1ygsHbPUWSrqjMqoPpjD7zPXJ7MuT0IuEOS87zAVF3bdLVB
	3g7+9SkVDFuNRN9FUWce8LUSrnPas
X-Received: by 2002:a05:620a:4084:b0:7c5:460d:45de with SMTP id af79cd13be357-7c5ed9ddfa4mr556329485a.8.1743079025798;
        Thu, 27 Mar 2025 05:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW0HTJ3CHNCADbL61XsrbaTbl/NKzb4jab4QXaONAlc7BiXuapnMQ6nRvYv78uvYXPTYBgTA==
X-Received: by 2002:a05:620a:4084:b0:7c5:460d:45de with SMTP id af79cd13be357-7c5ed9ddfa4mr556323085a.8.1743079025166;
        Thu, 27 Mar 2025 05:37:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65121e2sm2053600e87.235.2025.03.27.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:37:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 0/8] mesa: upgrade to 25.0.2
Date: Thu, 27 Mar 2025 14:36:53 +0200
Message-Id: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: wY7sfAgvRxTosocC2XMOiqgdoodEQK_f
X-Proofpoint-GUID: wY7sfAgvRxTosocC2XMOiqgdoodEQK_f
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e54673 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=vr40fS1c8MbUWjUDQeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=839 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270087
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52R5ja2g003117
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213740

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


