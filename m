Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C94CC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11435.1743607110243853044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=D952ijWk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DGIQN024525
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8V0zNcrZnkHEwyApX5DQWV
	HkaLmO2TTluTppL6pwQ9U=; b=D952ijWkGzorSaniT3EkPaLbVNNBKFLGn/s3w9
	EqU3Djju8m2i+o33UKs0ys3+Q9cCzlKspXeqEnTk0enmF+4yHs8PTFlJebO0CK9I
	DkD+cocInC8xU/FXDdl/hMpDXKkG4vIXfpa6XqOnT2zBogyMcNEySJzjGE/Sdasq
	qlcZVXrLdDbOwfbCcwlgnv+dc7OfaTVUa54gJMx5Vrrg4twqF/qOpxknbkbg1SNv
	PrzK7bDJqQiMB18iVyKbVeqw4ONW/dccmpWVTOX5HDg4dRtAhqumFFIBzrNieCKK
	463fFCCSoDxqQFH5l4O65j2+HSMrMup/WFK2qXaA/tdu5raw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyvx8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so1377721085a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607108; x=1744211908;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V0zNcrZnkHEwyApX5DQWVHkaLmO2TTluTppL6pwQ9U=;
        b=WMhwXeV0neYBWkicnHFbP14bY3MRaylQnKnGuduysqnZ9RTOG99hqqtDaioFBUN0EW
         hwZnmXWDYEyQ60M+oAmKK0ktRhbLF6x9p0iGFk5b6Rqb0+ozSYbC3mxK84a8HhDwhMZG
         BhHw7cEVCszvHG3xLmRwMyhT6y/8n+abwI7ev2nyGAG0Umc/DH5UaUtScoMQpHTR2sEP
         nUD3EzbcsJ/UHqBd7t3BzuqWUfP6R5VDtgKycbxk8PCuuFBd0EyDpFuqMdsXblnEW/yo
         MvGSc1CVWtO7MulLvuyewMMily+RR9JaSe9ZhFOSEaPEnP0vNE+zWmRXTZwSqtN2Qc4P
         Hx7g==
X-Gm-Message-State: AOJu0YwMyvlQpMoHa8Cu9DE1wMuefXZTXdcmPOmwbjbTo+dEZOhyhxQ2
	8UwcDiFFdRIj/BZl2M1utK4pRzwUBqC/ZgeNb5xnsrXuaNdb+gINuw0m8sigw11t6DgSp2dHW8F
	NorBZl3D/6qcLmXUzOIvICgaGXFQGtY/FyYZDXjCTE9EOYWWUTRu3Bb44NG5bGuW/J8oOhfpMZg
	xePRU=
X-Gm-Gg: ASbGncsl4q5OCgV+xp/J0l8sJR+HrvFwTCNrhW+F/dt1mVOkFiDFh+WjSXlT06io+Hg
	S9A32AyPK0M0+5ZGcit5611eypF0VSoPQRgbeHw1RaJ+Ov/DUz0kCbSWlgYSGig1AD2vw7fIFz/
	z65tBaHQv4s7HFHOiHYrSVAFhifJs3MAX5Cakq1acMCN3/8STmQO2DdpipOopr21nHWABaY9L6s
	SwBGaGOEJruajxAwUTCTA+7wnyzUBSj7rmo60jxMVQGzXqSFxO4R3XZmNRtfYAqHmI1TQMeqSQa
	9zzxeOn6SAwis+3xpYDp3jOsrt+XmfxjSHac4W0znAayNNT1MCsVxmZa+b0kq/G6MeruLE67sZA
	SvVir2YiTVJMIJLb2YiA8QlgmzQxl
X-Received: by 2002:a05:620a:1a8e:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c6862e7191mr2159634785a.3.1743607107771;
        Wed, 02 Apr 2025 08:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGetRmhEVetUrFMx6Q3GKWdli5rKelt9CdERalnNQjvsEhtchVtymSD9UxzBmHkd4R4CbL3bA==
X-Received: by 2002:a05:620a:1a8e:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c6862e7191mr2159630585a.3.1743607107336;
        Wed, 02 Apr 2025 08:18:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/11] mesa: upgrade to 25.0.2
Date: Wed, 02 Apr 2025 18:18:22 +0300
Message-Id: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAD9V7WcC/6WQwU7FIBBFf+WFtRAYoKWu/A/jgtLBEuWhUInNS
 /9d+hZaE01M3ExykzlnJvdCCuaAhdyeLiRjDSWkcwv65kTcbM+PSMPUMgEOmkswNGKxFDTtxt5
 Y7hDcwEnbfsnow/vVdP/Qss8p0mXOaI98DyAM7xloLbRSVNAphiWvbLR5LfNTqnepFPb6Zp9di
 pG1scvnUJaU1+uXFfYT/xHu71XxzSKk1sCZHIALM/zdIo+W4bOcKimnXk17Yziarv8FVwdcii9
 cNRw78E4r26F3P+Dbtn0ACKP0nr0BAAA=
X-Change-ID: 20250328-mesa-25-6b78a0ce2c90
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5535;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bFo6uXMY3eBcj1HyvAvUS+y6SMwSHyB7bN5GJgUs0+U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVAL7UgSPbrdf2IfkPHfmRs4LKKKjRjDiSkh
 p6DnesbzeqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQAAKCRCLPIo+Aiko
 1citB/oCm2NCdq6kDYulFC7lNNV10/rJpMrLqyBGa1Dr3y4+Iv9ZX3oAunUlPv7IPSGPUxFbF7V
 9Vq5y5L4ldNNq1l7ApgRv2ggNEg6fEdt3IlhwqMy+wnvRxPH87giSfGdjUHM6xNA1D78auAij+T
 BDlKESPMNJI7+ox+SBRgJhLFXn5rUMRUkg8+pyadVv96QJM9pbZksWzgtXOx9qIVAAbG5HLH8y3
 B0BJqiawQu5sR/xAZF982eRLZ/O9v9NhUvI0qSKDx9DfjCRxPHFLajcIfY7KLMLUTZUCc9vZL/+
 0dbB1IkZZcSZ4Hd4p8vO/UuEASZbkMcWbGxqwLV7A4j37IDW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GIPo0S1rcBeS4wcpG-ZvoLSF8NofpCoq
X-Proofpoint-ORIG-GUID: GIPo0S1rcBeS4wcpG-ZvoLSF8NofpCoq
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed5545 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lb123rD7dtkFaGzKuVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=923
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 532DGIQN024525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214268

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
---
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
Dmitry Baryshkov (10):
      runqemu: also set GBM_BACKENDS_PATH
      llvm: move libLLVM.so.N.M to llvm-libllvm package
      llvm: use OECMAKE_SOURCEPATH to specify cmake dir
      llvm: handle libdir in llvm-config
      llvm: also use llvm-config wrapper for nativesdk recipes
      llvm: remove LLVM_LDFLAGS from llvm-config --ldflags output
      llvm: support building libclc
      llvm: add SPIRV-LLVM-Translator support
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
 meta/recipes-devtools/llvm/llvm_20.1.0.bb          |  79 ++++++++-
 ...evert-meson-do-not-pull-in-clc-for-clover.patch |  53 ------
 ...d-Include-missing-llvm-IR-header-Module.h.patch |  41 -----
 .../files/0001-drisw-fix-build-without-dri3.patch  |  58 -------
 ...eno-don-t-encode-build-path-into-binaries.patch |  46 ++++-
 ...able-SIMD-blake-optimisations-on-x32-host.patch |  28 ++++
 ...vide-cross-compilation-arguments-to-LLVM-.patch |  67 ++++++++
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch |  42 -----
 meta/recipes-graphics/mesa/mesa.inc                | 110 +++++++-----
 scripts/runqemu                                    |  13 +-
 16 files changed, 551 insertions(+), 259 deletions(-)
---
base-commit: dc2ef2cc1183a14cd3a05d388a1d0485a1bc8d20
change-id: 20250328-mesa-25-6b78a0ce2c90

Best regards,
--=20
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


