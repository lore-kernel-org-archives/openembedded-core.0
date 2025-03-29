Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853D4C3600C
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.18123.1743278842703728817
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=dcPFTfJz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TJJMiB003745
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L6y3flAPG1Pwic+CYviazZ
	D04ZXIDMMPKrqfPjz4+R4=; b=dcPFTfJzlPSZSVUziHT8t8LGH3ugECPjLPOpxW
	1ATr5j8h7cpvjCmp0Y9XCpFigJPYdf6iIVcUa1gf1eIctSyruDOpLBuJuVg8YuT0
	kb/D0eCPugXgARs1+pVd9Qd2QaR7g1nZf6S4P1X2YTY0goZtmTWksgO02wLHSUpH
	F8sJ4mHXjezlsbzv4EgiaL3+oXMcsFkJycJHChwlRVf/CceLpGpd1MYIfoK2EOgi
	7AeY66dVOCCerw60dqxEk0cUzugBcatzG/b5wo144JgaygqMNvFicDJ1OkDrFlJM
	IZ4lMeIVWKnmo9RIuOgLPem/SsYPQo5X8fz2PI/TwvyVCq2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8xv98gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so587599085a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278841; x=1743883641;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6y3flAPG1Pwic+CYviazZD04ZXIDMMPKrqfPjz4+R4=;
        b=uJzBHEVn/OIcK5ZzoswRexWGZOkzIBQaGPB1kJsBRQyQEJTDBbyOSIOdJS+9/aC55v
         qJkP46cYx2qmYwpU/ZcJ0n+UHkUZ/5wMYjGkRQoiRwvAP7b9QtNrrljLiHUddzKgVxgw
         QQms2G2gFP/tYNlNZgHGfBsp1QDsHmY1d+OFw1pz0PgxDj7XjR/gdsqqtlTnmMEKjUAa
         IL1kPrApQJPMF+7haNLbTcQJcWzenlhBm9DQ6T5R3OFouL1P2kNGlUDOmPr3nm2XRUNo
         A3NGVzQAUVS7bCGZ5EUBi2+OrzezOtBbfkD95SSw4JtUCkEboU0SxGpFhXjjFLjHpLbo
         tIWw==
X-Gm-Message-State: AOJu0YyXBCU1yTDWzP5b7C7b5QF7n5uWMa/2JuEZEDS9f0/h8WNi81AJ
	fY1aoGVAFZWiZyQZOdLN5gXgaoDnhb2HwpqtlZ3tQEPVbS4Ct1fKZ+a9nyJBU1IckEwXPzGBCId
	8lv40mkqGW12F1eKF4y87Xu2hHn4P0Bz7jLiRZR1DCY2od8HSXNGw4+S40ZEapLxav+GR+6r1Qg
	8hxD4=
X-Gm-Gg: ASbGncti4yG9+M6cqIHnrOURVU7vSYvbrApRWjkXNnXnsvViJjm0gDh2Ets3V/S2gth
	rFUb1pTLWHMR76zvYnGmQ6D/k87TDRe3E0amMbu4vvVRJaPtfQvzM8wrqj6Vl4/GyV1zsLX88M+
	2I+xO/PkVoW8K9ytwox/7VES5Cjg7zuO+hvyFwEeCCKQbn9pKqjdt/UbseFxShzVYpc+AdjCzjT
	hULmuZYeCXNyXxNCB/7l7IMeoPFCGXoBzKY9ug0lZlaaecMSzSqzStf17nuAqQUPINz/Ny3oxkN
	kkQBpAT5KOn25ccMks259ebLRjbH2ribO4y1ZifvlAIXCJBVCRmc6Mo3owWUpM3MJp9npVgqPyM
	ioOO+8xam+BgACd5KARcoNaLFOfCL
X-Received: by 2002:a05:620a:2618:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c6862e7421mr631238285a.6.1743278840802;
        Sat, 29 Mar 2025 13:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8YsA7jiCVX2GsBCekj763/Bz6FJp/Ltzrigd0TRFpjR0TckWSeBN4TekeSiSYlsFBVefgew==
X-Received: by 2002:a05:620a:2618:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c6862e7421mr631234285a.6.1743278840396;
        Sat, 29 Mar 2025 13:07:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/9] mesa: upgrade to 25.0.2
Date: Sat, 29 Mar 2025 22:07:11 +0200
Message-Id: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAO9S6GcC/6WOQQ7CIBBFr9KwFgJDsa0r72FcUEqFKEWhEpumd
 5d2pTsTNz95yZ83f0ZRB6sjOhQzCjrZaP2Qge8KpIwcLhrbLjMCCoJyqLHTUWIQeN9WtaRKg2o
 oyu170L19babTOXMfvMOjCVp+3lcArKYVASGYKEvMcOfsGCbSyjBFc/Xp6GMkj6e8Ke8cybHKj
 Y2jD9O2MsH64h/hOi+xLwvjQgAlvAHK6uY3y7Isb5tGhnQ/AQAA
X-Change-ID: 20250328-mesa-25-6b78a0ce2c90
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5c/MBpB2PDWJza3NPfeGnmzC1F4+ND4PTlKo6VSheqM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL09GbB7mg7uKODiofzX0i7dhOsUrbfhLchX
 nQZqMJWHIuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9AAKCRCLPIo+Aiko
 1TgIB/9Highy5hH30/x9uqx/VXel1TG1IT5+ziR2VTRhul0oakXqOWmMeGkeiY+J8Fmv7AnhlYV
 TcvWMSx1HqHfz8gzRhpyhqilPCfLPvY1vjBkcm+i0jsDDPWsaKzuVJt3NNFvpQlno7LwmU3xjTz
 JIiKqwNYRJNi6wTpUzDp6sbqnd7rLbO/LzsHV3jrYRVUo+vsxWKLMughnIRkneJjBPBOoucvFXq
 8DVqttVTkq5oHNnxOu2HfIKgm8hYfBFMg+FsHtJX6zzlW/VOwlvnGbFFFYepEN2LmCMtmhZQfbW
 gORpA9Pm/7rT8IpLZ9yoWoV7SsCkPGhaQA0PwZSMw7eL83KY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: hW9Gd-EqT1yoPZakgJ5Uryy9pX9Y5EXN
X-Authority-Analysis: v=2.4 cv=PquTbxM3 c=1 sm=1 tr=0 ts=67e852f9 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vr40fS1c8MbUWjUDQeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hW9Gd-EqT1yoPZakgJ5Uryy9pX9Y5EXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=997 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290146
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52TJJMiB003745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213894

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
Dmitry Baryshkov (8):
      llvm: move libLLVM.so.N.M to llvm-libllvm package
      llvm: use OECMAKE_SOURCEPATH to specify cmake dir
      llvm: handle libdir in llvm-config
      llvm: also use llvm-config wrapper for nativesdk recipes
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
 meta/recipes-devtools/llvm/llvm/llvm-config        |   3 +
 .../llvm/llvm/spirv-internal-build.patch           |  30 ++++
 meta/recipes-devtools/llvm/llvm_20.1.0.bb          |  76 ++++++++-
 ...evert-meson-do-not-pull-in-clc-for-clover.patch |  53 ------
 ...d-Include-missing-llvm-IR-header-Module.h.patch |  41 -----
 .../files/0001-drisw-fix-build-without-dri3.patch  |  58 -------
 ...eno-don-t-encode-build-path-into-binaries.patch |  46 ++++-
 ...vide-cross-compilation-arguments-to-LLVM-.patch |  66 ++++++++
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch |  42 -----
 meta/recipes-graphics/mesa/mesa.inc                | 101 ++++++-----
 13 files changed, 468 insertions(+), 254 deletions(-)
---
base-commit: 8d4987cf652c9844d93000fb012dc09eebcf9fcc
change-id: 20250328-mesa-25-6b78a0ce2c90

Best regards,
--=20
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


