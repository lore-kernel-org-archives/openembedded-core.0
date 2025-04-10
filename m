Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E29C369A1
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:54:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.25728.1744253688942342771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=etqUg5iI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HTMJg006745
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M2pBC/De1t2DCy1iRRWTQn
	S3vCJfaI/eaBjc7jZdzXQ=; b=etqUg5iIYyETfG+EzZAmG14yvG2X24mZ/DWhed
	kNAeH7w+KdikCSFody6RvVa6udVs8fJyRpOyVn4LANHGQgLeOt7pDXMo//fz8Wm8
	wyjD0AVt2q9xflGsZdxq2Yc27obih5JkS1JPbPbyYPlXlCSsTZavVmOTgYq6f/ZA
	ZVBaxRbdeK2X7az2u+7d4SJWGaosyo7nUsU7v5kwBk4zD8zohVoGLkieRS/dMJdb
	tOXUvdfGiUaR5ufaQhyV7tgj9Vs6Z9tBdGWeLmOy2rww36v1tHpvlbnXEnulgWFO
	Vs9lhNAa4tmQZWtgNEz+Rv8QWewH4F9ZsV4OG5NpmL0OGGtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3nc7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so62354885a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253687; x=1744858487;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2pBC/De1t2DCy1iRRWTQnS3vCJfaI/eaBjc7jZdzXQ=;
        b=GTMvcJaKbGa1Wst6q2PcZ6puRotQZycZeG7+2k/sLoYCPgHaQpUUKJIqlchCv2nk7c
         nznpVsjam+7pHgVVrjmO3pjWLLPvE5R2Lq3968TylnBSARC/GI2vnexNq7KYLoOwjryF
         R5ZHsR8Mbqw/WS6o1jwjN4XxqHEoGVt3c61+JpndkwH4EwqWT2M35iR4JH6VrATU1xuo
         dL39ic4M5I+n7trDfXa1io8sduPEkzHFJeJxTswwK0gKwGj8q9noBogR95acthRjLFQ+
         hXiSm6r7p7HXew/FpXWYk5Z4wmSsOetjPfFCUytIai54UsOoYrccFqnDQDNDMjDM3V5v
         4OMA==
X-Gm-Message-State: AOJu0Yw3sbfkkOs7vffafwLw5JeooMcjHiB89y67fX6F15KF5vmPTEGe
	GO73yUGDJUMwPB9Dl9Qw5tCG2giXdJRBTm+4d3mtkVbis0as2ym/qarIhXMCQQkraWyVsH54V4Z
	G0XTvAbswwb3lJdSddP2vQDJUcxQvC1a4pZ2Bu8zKevrYt1XarL6zcKqgtyoSma72q7sdToSrAx
	T+WKio4P7LR+0=
X-Gm-Gg: ASbGncspWUMgrHL6ukghQI4frAadrARR9ATtP/UWtW/CFMddvAl6Rqf9yi6+lr2MMs7
	IEZIrU1tFmizW6mUEzKOUIELmz0m4KqFP9k9Coo9IhTRAwevM5ePyD1Ybo2MFIKLHmmY4yfV8ul
	w7Fun6WYctTjzJPdvtaRN1VGWAQRXS2hR+pNKzDJQ5TGiVRlXx5DArEr2Nhah5dQws35uEsoH++
	IPWn0s/pGXlNYsqiayRxovINw/s0JbyWlTflU39fxqYuQgS45mxw7YUgpK7I78TN/NWBpo7NmUR
	yKTJX+GM1+HTLvRz1fKyvtA89wVHBa0RX5+EgY/ySyW2VYJjZYejbdCdRL8jgBqQVW1ihMw/Bc7
	gfJgQBK0xfBsg3FXL3gA71yqc
X-Received: by 2002:a05:620a:2596:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7a81b1440mr107283585a.43.1744253686723;
        Wed, 09 Apr 2025 19:54:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiPM9rdZKk+DwMuEIuCXKnP0OGKTtO4TlAbitxdyv4lKsYb/5WMVrhD19Wes/YAS5SY/CZkQ==
X-Received: by 2002:a05:620a:2596:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7a81b1440mr107281785a.43.1744253686313;
        Wed, 09 Apr 2025 19:54:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:54:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 00/12] mesa: upgrade to 25.0.2
Date: Thu, 10 Apr 2025 05:54:39 +0300
Message-Id: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAO8y92cC/6XQwU7EIBAG4FfZcJYGBijUk+9hPAAdLNEuCrWx2
 fTdpXuwNXETEy8kf8L3z2QupGCOWMj96UIyzrHEdK5B352IH+z5GWnsaybAQDEBho5YLAVFW6e
 NZR7Bd4zU328ZQ/y8Nj0+1RxyGuk0ZLRHrwG4YboBpbiSknLaj3HKS+NsXsrwkuaHVErz/mFff
 RrHpj5b+RDLlPJy3XKGbcR/Crf1Zv6jhQulgDWiA8ZN9/cWcWzpvo8zC8pokP12MXSm1Te4PHD
 Bdy4rxxaCV9K2GPwNrnYuGexcVW6dUIEBt0a4G7w9cr3ztnLoXJDeounB/MLXdf0CzZXohDsCA
 AA=
X-Change-ID: 20250328-mesa-25-6b78a0ce2c90
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6332;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pC8o8W9EVkTdY5kb8WDoqjmOW24Qr3tO6xGCSUoF0wI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLw4ki5/qM6uC4ZIPrawwpgojPvABk9hVq1/
 EjeQAvUr+aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8AAKCRCLPIo+Aiko
 1ZcsB/9nAtR+b7XXTTl8c8pqn5aaCIlFCDZRrYZhaQR3YUrt8Y0fC++NICui5iwPLWfm/sBvfph
 Q9+ATot3nN4OfbdJTcPy+BBjnglQyQq3A6NUHL4OFZXDV+ALr2+i+R9+wV+yK8+ZXn9PZHgD6pb
 jleHA/qwBKsoLHf0VMXzn1bafRbjJnB77EpQvOmLe21MSuI0XHJcVgVt2HLIcTjSdBdNWiyiw6W
 YRtervzzJTrLCD0iXazxrMUde3E0vP4ZB/gloCJZ6bq0WeEDqFUn473QMt2nJNgEBHUMH20quaX
 4quyOwLVPzpF2Amj+Qw8ns+qYivNHono5drY0MScXPzDVH2o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qsqQKQ7zy1NDk_qYB3CiLxfY13NSOJN0
X-Proofpoint-ORIG-GUID: qsqQKQ7zy1NDk_qYB3CiLxfY13NSOJN0
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f732f7 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ShWOS5dBa1v1Jlr7YlkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 539HTMJg006745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214602

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

NOTE: This depends on the https://github.com/kraj/meta-clang/pull/1075
for interoperability with meta-clang

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Turned libLLVMSPIRV into a shared library in order to fix linking
  issues
- Dropped isoc23 patch, it should not be required now
- Link to v6: https://lore.kernel.org/r/20250407-mesa-25-v6-0-29bf4cae8d2=
8@oss.qualcomm.com

Changes in v6:
- Applied workaround for __isoc23_strtol linking issues in LLVM
- Picked up LLVM_TARGETS from meta-clang/clang
- Added filtering of libclc / spirv-llvm-translator to RPROVIDES too to
  remove conflicts with meta-clang
- Link to v5: https://lore.kernel.org/r/20250402-mesa-25-v5-0-ab35f021a83=
b@oss.qualcomm.com

Changes in v5:
- Extended runqemu script to also set GBM_BACKENDS_PATH
- Fixed LDFLAGS leak from native llvm-config --ldflags (which caused
  mesa-clc issues)
- Disabled BLAKE3 SIMD optimizations on x32, fixing the crash
- Disabled swarst Vulkan driver and llvmpipe Gallium driver on x32,
  fixing the crash
- Changed bindgen patch to pass -target to all bindgen invocations
- Link to v4: https://lore.kernel.org/r/20250331-mesa-25-v4-0-e62fc54a6ef=
c@oss.qualcomm.com

Changes in v4:
- Fixed QA issues reported against lib32-mesa-megadriver (Richard)
- Removed release notes link from the mesa's commit message (Alexander)
- Added link to the rust.bindgen() issue to RustiCL-related
  cross-compilation patch (Alexander)
- Renamed 'spirv' PACKAGECONFIG option to 'spirv-llvm-translator' in
  order to be more precise
- Link to v3: https://lore.kernel.org/r/20250329-mesa-25-v3-0-f4d0328eb86=
7@oss.qualcomm.com

Changes in v3:
- Dropped llvm/fix-native-compilation.patch and
  llvm/0001-cmake-modules-CrossCompile-pass-SPIR-V-headers-path-.patch
  in favour of installing prepare_builtins into the sysroot, dropped
  corresponding EXTRA_OECMAKE params
- Dropepd -DCLANG_TABLEGEN from llvm's EXTRA_OECMAKE
- Enabled llvm-config wrapper for nativesdk too, fixing QA errors for
  nativesdk-mesa
- Added --libdir handling to llvm-config, dropping the need for
  mesa/0001-meson-use-target-path-for-Clang-libdir.patch
- Dropped extra LIBCEXTENSION from BINDGEN_TARGET, it is already a part
  of TARGET_OS
- Expanded commit messages to explain the patches
- Link to v2: https://lore.kernel.org/r/20250327221807.2551544-1-dmitry.b=
aryshkov@oss.qualcomm.com

Changes in v2:
- Dropped YOCTO_ALTERNATE_LIBDIR patch
- Reworked mesa / LLVM integration to always use get_option('libdir')
- Reenabled AMD Vulkan driver (got disabled because of c&p error)
- Moved mesa-clc options to the libclc PACKAGECONFIG to fix several
  build errors
- Link to v1: https://lore.kernel.org/r/20250327135520.3920189-1-dmitry.b=
aryshkov@oss.qualcomm.com/

---
Dmitry Baryshkov (11):
      runqemu: also set GBM_BACKENDS_PATH
      llvm: move libLLVM.so.N.M to llvm-libllvm package
      llvm: use OECMAKE_SOURCEPATH to specify cmake dir
      llvm: handle libdir in llvm-config
      llvm: also use llvm-config wrapper for nativesdk recipes
      llvm: remove LLVM_LDFLAGS from llvm-config --ldflags output
      llvm: support building libclc
      llvm: add SPIRV-LLVM-Translator support
      llvm: enable more targets to build
      mesa: upgrade 24.0.7 -> 25.0.2
      bindgen-cli: a tool to generate Rust bindings

Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
      mesa: add support for RustiCL under PACKAGECONFIG "opencl"

 meta/conf/distro/include/maintainers.inc           |   1 +
 .../bindgen-cli/bindgen-cli-crates.inc             | 186 +++++++++++++++=
++++++
 .../bindgen-cli/bindgen-cli_0.71.1.bb              |  19 +++
 ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch |  34 ++++
 meta/recipes-devtools/llvm/llvm/llvm-config        |   3 +
 .../llvm/llvm/spirv-internal-build.patch           |  30 ++++
 .../llvm/llvm/spirv-shared-library.patch           |  25 +++
 meta/recipes-devtools/llvm/llvm_20.1.1.bb          | 101 ++++++++---
 ...evert-meson-do-not-pull-in-clc-for-clover.patch |  53 ------
 ...d-Include-missing-llvm-IR-header-Module.h.patch |  41 -----
 .../files/0001-drisw-fix-build-without-dri3.patch  |  58 -------
 ...eno-don-t-encode-build-path-into-binaries.patch |  46 ++++-
 ...able-SIMD-blake-optimisations-on-x32-host.patch |  28 ++++
 ...vide-cross-compilation-arguments-to-LLVM-.patch |  67 ++++++++
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch |  42 -----
 meta/recipes-graphics/mesa/mesa.inc                | 110 +++++++-----
 scripts/runqemu                                    |  13 +-
 17 files changed, 580 insertions(+), 277 deletions(-)
---
base-commit: bf9366583f53fe2498d7aa9192ebfe6562887cf3
change-id: 20250328-mesa-25-6b78a0ce2c90

Best regards,
--=20
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


