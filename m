Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A00C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:18:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.1718.1743113894454440898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 15:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=fO2StKjz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RF0IDq011052
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RTnZM8kT6bbq0XG7ELgp4h
	mkCZEGBV7+Aq5Kja3NrLQ=; b=fO2StKjz9Hku+SYNUr02sJHMojulXZPJFpmfhq
	PoZxRG0tUZsMk7sMZMVBRN/DOyS9Mf1TXDXnDspCGgKlh13Ds8EOFyOuLmpGlLoe
	x+nfs83Bt3kwMn/sA0q90kNtHyZSoRfxqfGNWKDggS4cfRYdedsDr7gmrpDfWOYN
	ow2Cy68aEUUqDgMJJyPRMSd+12G6Blb8mNuIYUZLeVnvN4Fls04FYexz239doI6/
	gd9Oqr+KUuBS0VxuCYja43Ue+J69KFEHQbv5P657HwDgm0g4PJiz1260dbETBz77
	6MNewVjxCUPX13YNSq7W2B3vSDejZKX6B3EGDuZifpYQN1Qg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcyj2ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4767348e239so27042711cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113892; x=1743718692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTnZM8kT6bbq0XG7ELgp4hmkCZEGBV7+Aq5Kja3NrLQ=;
        b=vbViLy/ZzjZ4Zdmtyvu+EtL9Bdmrf0o4BuW34B7SJh8yR1LsWpNZiJknV2ueA6SUV4
         UA/NxnLf6k15xoxURfdhR0X6NTVYEBdEbacY5xlBB6oABr4bbyRe96hZEVllX0Aa3Gxi
         hy+7N+yZ/duODEoJarOR/ArAfkopL982CAy+xzDVBzin4baomGKIZVkJ7asGDgPiiQ/A
         teKUL9z3jzrYhHaEd9T0xTEtOs4JTaOy/qHmIuqQWDYIuzv6qBkGqv9vQEdvGQJKhByC
         ZTKabBp7AD6ET2iUPpFNJnbXxt+NKNTT1lkNq03YgNEhZyHJ68eVH+kwYNcmglYBum73
         59fQ==
X-Gm-Message-State: AOJu0YypKgCswccmpEOSD2cNLtPSZ/gUr66HbCQti3H7XAMfP89Wh/Sp
	bzFp7crex7e2tHFxKaHCSUyhS3aS3OORZuzaNT1DK0Mvi3Hussn22ky33FQcze2skgVt6ccoYNW
	80iJ8PbjGz0CM+M9jeyu9vEcA0Fhh/ekSN/UZ72wLJ1evXQiq5pNTeAYbPtcJm6orTcqjC8ngHk
	HIw+dEBP3nmw4=
X-Gm-Gg: ASbGncsdQh+MkVUlihQMDs0zLyF0IFADyOJ3UZvqLbaAQ1t0h0ol7HKQVF6zHefuAVX
	/o3Yqs6yGMWo+XJrfhXHqyQhlF+3BrdfuajWXGmR1voL+TA8DQGL5pe6VAGn+8/J4mhLv8bngJU
	H7TRbqRge4tLBGRlAJTuUOphslyNOkLZu5b9RgcWPb5krVU5FFq/LkFe3UVuKvsEdcRPKbY72Hy
	gxSdUqtrEaOsAY+8Rv1wj6a66td0UNaXM1c6U6v/rDe0b/TeNflEQydJHugzVOCJx0rITmdwzme
	LiWYfW0ijZPR77GZEi6/MSWMYN6bEjSNb8p4P6+Z8dPWtyfcSTy684bsX9OMmQTXHTkxhdWbB4f
	gwcWoui4mjkW13wnlCx13+F3lnlei
X-Received: by 2002:a05:622a:259b:b0:477:1ed0:62e9 with SMTP id d75a77b69052e-4776e21a360mr89574681cf.43.1743113891985;
        Thu, 27 Mar 2025 15:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyH/kO1Ti69lhS9XvCvg5y5Y/872v+1Rxf5w74Fie9if3rVplivuM6V9moWbgJmBBhLjTXTQ==
X-Received: by 2002:a05:622a:259b:b0:477:1ed0:62e9 with SMTP id d75a77b69052e-4776e21a360mr89574231cf.43.1743113891558;
        Thu, 27 Mar 2025 15:18:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59808sm1019081fa.107.2025.03.27.15.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:18:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 0/7] mesa: upgrade to 25.0.2
Date: Fri, 28 Mar 2025 00:18:00 +0200
Message-Id: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e5cea5 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=vr40fS1c8MbUWjUDQeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: DiKt7DkwbAYgqo2lQj0tas_rKFmuK7g9
X-Proofpoint-GUID: DiKt7DkwbAYgqo2lQj0tas_rKFmuK7g9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=832
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270150
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52RF0IDq011052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213792

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

Changes since v1:
- Dropped YOCTO_ALTERNATE_LIBDIR patch
- Reworked mesa / LLVM integration to always use get_option('libdir')
- Reenabled AMD Vulkan driver (got disabled because of c&p error)
- Moved mesa-clc options to the libclc PACKAGECONFIG to fix several
  build errors

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Dmitry Baryshkov (6):
  llvm: move libLLVM.so.N.M to llvm-libllvm package
  llvm: use OECMAKE_SOURCEPATH to specify cmake dir
  llvm: support building libclc
  llvm: add SPIRV-LLVM-Translator support
  mesa: upgrade 24.0.7 -> 25.0.2
  bindgen-cli: a tool to generate Rust bindings

Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
  mesa: add support for RustiCL under PACKAGECONFIG "opencl"

 meta/conf/distro/include/maintainers.inc      |   1 +
 .../bindgen-cli/bindgen-cli-crates.inc        | 186 ++++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.71.1.bb         |  19 ++
 ...ossCompile-pass-SPIR-V-headers-path-.patch |  40 ++++
 .../llvm/llvm/fix-native-compilation.patch    |  67 +++++++
 .../llvm/llvm/spirv-internal-build.patch      |  27 +++
 meta/recipes-devtools/llvm/llvm_20.1.0.bb     |  76 ++++++-
 ...-meson-do-not-pull-in-clc-for-clover.patch |  53 -----
 ...lude-missing-llvm-IR-header-Module.h.patch |  41 ----
 .../0001-drisw-fix-build-without-dri3.patch   |  58 ------
 ...on-t-encode-build-path-into-binaries.patch |  46 ++++-
 ...son-use-target-path-for-Clang-libdir.patch |  57 ++++++
 ...cross-compilation-arguments-to-LLVM-.patch |  64 ++++++
 ...on-t-try-zink-if-not-enabled-in-mesa.patch |  42 ----
 meta/recipes-graphics/mesa/mesa.inc           | 102 +++++-----
 15 files changed, 625 insertions(+), 254 deletions(-)
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


