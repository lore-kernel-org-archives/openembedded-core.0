Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF92EC3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.42848.1744019292640577175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=a+BrPtKy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dlom001362
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OfL/biEbEukIVBhKu/z7Uo
	0+XXNPa1IXekWSXiArarI=; b=a+BrPtKym3LD2tFG0ALwrw4qidXQn8Jg7DNflD
	i1ublzAJFbL84ZrOBjZZGKnrOKeREl7B0o2YeE9h2xo/Sj/ZbF5Dy4JWeAAzz7ba
	IWI9sBxe23udDiyKD7E61/ljvsoC+BGzAdSnAOUmfXM68evEXuiokheMRSZGNK1Z
	e/82xenIm18gvxw/Bu7uT8vF9nfyh0V3wsQ6v0mF6V5MMDs9IoKrYe0YY7ewo27M
	65OmtjERhuLb2Oofv5Zjh+xvQsinJXhYVoMpG6WBifho3c885RQLxSDAvMfG+o7e
	hgZfRaC34PhUAy8erAM28QRU7ZRdqhOvQgRW9aq81hKwisBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtausrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so1083881485a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019290; x=1744624090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfL/biEbEukIVBhKu/z7Uo0+XXNPa1IXekWSXiArarI=;
        b=LgszLhkWux5/Kddzzk4pUu0OU1sNTo998TQQVLtudfj6iPsYCajKRSRwOm00af3/96
         aSBKUdv6p14dIzugR+9EK4MasFoQd/7nOegDtUd0mOghNvVUaIUxZJ6CCsIRW1qdY6Da
         mdk0lMDNswck6gioMdTN4bUx4bcHGGygugvPkCBAGNl5KvfEunynS3BCO8sOALwd9daD
         /VYDipocLHX0zQ31pOJvvR6xJymT20Li5cHUx0dqz7sutSh/s3t9WUxP5kI9wed2Izxf
         4T+oMcM3WDdcx3KZsiC8eqYvLQlD4u+IT9KnIbgxsfQrcuKeSviPKXOUWIKcEhwf3Dav
         rGwA==
X-Gm-Message-State: AOJu0YzpHCzqVFxjedhXo3YtZ5RHzDtH3haQLVAijr8O4XsoWu2QUifX
	oVKH8le45PoGzpmAEkYcImqtv9Si7KSsY3hV661Nx0oSBoc90519aDHL9B0/b+Ii7p/sPX3E5ze
	aQbxCpyuDPltbGrQh7ypIAvHNC3TzBBdWRf8M6MWT6sNuW1brrGf9XRa0qsa4wSGBLEZl7rL3My
	x3mEA=
X-Gm-Gg: ASbGncuHeOUYLNGdBH2TpXPXNnBuy9c+7zDvneXShrU6nzgBbjBNGwg0RZwHpNEcdOp
	GeyEuYQuD4jpA+eS5kEB1lOxCh5iNBT/eZntl1ZAHbY9IT/KzT/mz28imz4Y8eSR2A+B1JdpOaq
	jBhg4QBVtCc2C3fEutqAR4oCC2AyJCGxva6K+C6MXvfkO6kpZ9UHqkLaX20B61YQp3O2+F7QT1N
	XtGQ130YX1qlxlLXhjvkioZQ68GJR0Qvq9A6khXrPKX+MXeXn6cMFvqce7urovPaDo37HHrcYJB
	EIGkB27/x/BVVJAvuByQMiySyoIn7R9nHzjoGlXNOL9Btk/pMFFdc9w/sHU3OUkuNpmImLNnC9x
	6uVUyim6TNG1SRVv+I2SA18KwRHX3
X-Received: by 2002:a05:620a:371e:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c774d277cemr1717331685a.11.1744019290414;
        Mon, 07 Apr 2025 02:48:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELv0sfw7IzZ0lENfsjVTRTBC47Ze3USG2fK0uOxj12QYQ13tdznV1Hc89akG4cfP6BIoprOg==
X-Received: by 2002:a05:620a:371e:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c774d277cemr1717328785a.11.1744019289963;
        Mon, 07 Apr 2025 02:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/13] mesa: upgrade to 25.0.2
Date: Mon, 07 Apr 2025 12:48:05 +0300
Message-Id: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAFWf82cC/6WQwUrEMBCGX2XJ2ZRkkmlTT76HeEjTiQ3ajSa1W
 Ja+u+kebAUXBC8DP8z3zfBfWKYUKLP704UlmkMO8VxCfXdibrDnZ+KhL5mBABQKDB8pWw7I664
 xVjgC1wpWtt8S+fB5NT0+lexTHPk0JLJHvgGQRjQVIErUmkvej2FKS9XZtOThJc4PMefq/cO+u
 jiOVRmbfAh5imm5fjnDduI/wu29Wf6wSIUIolItCGnav1vU0dJ+lzMrLrjX/dYYdaZubuD6gCu
 547rgVIN3qG1N3t3Acce1gB3HgttOoRcgrVHdL/i6rl/BzfKq/AEAAA==
X-Change-ID: 20250328-mesa-25-6b78a0ce2c90
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSg4h3sEPqGmJAMO66udgSWnX625xvIzBoEooht+TjE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859WqRj6rs+YTfQioCP2Erzoh2043phHRABf0
 Mmgr7g5rz+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVgAKCRCLPIo+Aiko
 1ZOmCACbDe4VLr3GVbv6G6q42EkczAlfeB7eTmAsgqnzmCrzyy6kS6fBqF6A8LEqZrAPWHOi8eM
 4T6xNO6v5Pq3GYYW62uXz6fB4BB6uvEEZnw/Zan2HSCpv/8UecncNItUd+NLL9PblrFV6tgwQcy
 7u4rpL49wrNDkGRVrMlMxuGRvtzDGoc2b2Nc043bZ3y49mWqKhgshi9E3nIJwHxKc98M7IWasP2
 gJk0TQz8/xTO+0zD4A9SSedMCMSFYnF8CUofmvHS53RUQheWgfFGvSB4kUqero7HnaQLlMJobD3
 sOQVbCyWS8cRCELIQ9h7s+qb+2CGi/xVkNXOctQWeSdS83vl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: E3zHycIJO5WZCK8loCu7LY2sgqo_c4mR
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f39f5b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ShWOS5dBa1v1Jlr7YlkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: E3zHycIJO5WZCK8loCu7LY2sgqo_c4mR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5378dlom001362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214429

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
Dmitry Baryshkov (12):
      runqemu: also set GBM_BACKENDS_PATH
      llvm: move libLLVM.so.N.M to llvm-libllvm package
      llvm: use OECMAKE_SOURCEPATH to specify cmake dir
      llvm: handle libdir in llvm-config
      llvm: also use llvm-config wrapper for nativesdk recipes
      llvm: remove LLVM_LDFLAGS from llvm-config --ldflags output
      llvm: forcibly disable __isoc23_strtol usage
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
 meta/recipes-devtools/llvm/llvm/isoc23.h           |  11 ++
 meta/recipes-devtools/llvm/llvm/llvm-config        |   3 +
 .../llvm/llvm/spirv-internal-build.patch           |  30 ++++
 meta/recipes-devtools/llvm/llvm_20.1.1.bb          | 100 ++++++++---
 ...evert-meson-do-not-pull-in-clc-for-clover.patch |  53 ------
 ...d-Include-missing-llvm-IR-header-Module.h.patch |  41 -----
 .../files/0001-drisw-fix-build-without-dri3.patch  |  58 -------
 ...eno-don-t-encode-build-path-into-binaries.patch |  46 ++++-
 ...able-SIMD-blake-optimisations-on-x32-host.patch |  28 ++++
 ...vide-cross-compilation-arguments-to-LLVM-.patch |  67 ++++++++
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch |  42 -----
 meta/recipes-graphics/mesa/mesa.inc                | 110 +++++++-----
 scripts/runqemu                                    |  13 +-
 17 files changed, 565 insertions(+), 277 deletions(-)
---
base-commit: ec524490bfa860a2caf7c3f77924c4dafeb631bf
change-id: 20250328-mesa-25-6b78a0ce2c90

Best regards,
--=20
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


