Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C529C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:21:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50711.1743423709656874097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=kRhBcEd5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kZSY005013
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2Ggl4RH7DDz79JkrM/C3RS
	ItNoFJVK9G247rQ0bm1UU=; b=kRhBcEd5I1u4WpplPqpeoaG8hglgoJPPICqVAl
	6spq9gjRIxV61hd/5ZzHwRbXfg8af+PSGS9MDYGELEYb/MzYWrwwzKiOGtIejj8B
	wFoBLJNcVfCYKVOp02iI7X+yNoZv6MHfVzFRTsb2WMf4JfFHrEmKkZcCQMGazmZs
	ALMe2a3uuxu5rrauYq6wG8ZF3PumQ4A284R9G+sL59950Vu3vYmZFE34uajQp5cv
	t0AcIVI6scvz0X0/JzNNYIelIwfZlc2cpWRaH25PevjJC6H1TpLQ4mIpnWiqI+Vh
	LDBEl8xUv7HtDMbW3yltVpGRBUlpXDLB40+nRaAKh25BSrXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bmc49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c549ea7166so696448885a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423707; x=1744028507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ggl4RH7DDz79JkrM/C3RSItNoFJVK9G247rQ0bm1UU=;
        b=MgyzVI77Osh6OJ5+m++vu2yT3z9O0emr/A/eElrKYrgL52r+5Eaw7PAKFcTRm6PKdo
         /l5s1TsW23AKx/OZGhiomtnmAuVHdf0morGgWDgSX9LbxqpI5PyGkx+CsKoWEJP5u8/K
         czGUNa6L9Mfy9VjUxjjhwCDPlt7QhNHk2nvje7jvf9KlCJV/BWtp0ZzdFBGQNsuQA5gB
         RbWxZ7ZyNpIAKzdctskgbB+/qna9yKcR4QIlahX5wMdsJZCvTQ5XafpJJEIidqiE5Up8
         0lpmj7a/o+fAjYMSflmli+3F0wPHb1KIF/UXYNAqClqrn47z4WkwWdzo/MNZ8+DyWtY4
         lJ7Q==
X-Gm-Message-State: AOJu0Yymf0nA+7wDs+fRy4vnB8N46LMRzGhWKyUL6cDz/+08V7/BoNM0
	NqDjlj+odNI5QsbN4CI9IyXyfIGnDCCSds0tlcrODYos3MQiuuIEZNKe7a8vEuMbztmoJ0ROMkI
	DdnF9zmexhWA7IkkwE7c+y7+8m4URZNagY4a0hpi/oFy+kxxF7t9XYTICUor8/DHICldxa+okTa
	MUOR0mSnoG02i0wYYv
X-Gm-Gg: ASbGncvIxKNqvNWEZb1XGNZ68ZKJNY76mozMs2C9MHRqSNJV7LDBJdprja7LYc9Fi0L
	B6Em7qgMGsSBbhjDpDCoiOJxOgPPWgPt+dqlbIGO6DuJIxP6K15LMR/ejfuXiUF7VbRr0YfWx58
	8hK1ypSz+FWxqeql+zw1CfoUFChi0VEGJcToAnUtcyUHAZ/SNR9bTzATo2VwR+Df3eMiodzSyIp
	U54wtWxGWdblsKseqOWbE5Cm0cssrwzMvts8Ng8Ry4Jgwijhfv6QXD+BsbmGcnmturnb6iXIbcc
	sGpVIYFtb4Byc3cM3xd4DLYQ6sf+VG8e4lXUOsaZofwmFieFaMXOgj6MRUS79zuWY7t1JIw8mKU
	Niu6CAWLBbj+j0Av9Xmz2cnm5zd81
X-Received: by 2002:a05:620a:3905:b0:7c5:46e4:47f5 with SMTP id af79cd13be357-7c69071a788mr955383885a.20.1743423706860;
        Mon, 31 Mar 2025 05:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcmjUnFdrqr51e+UWj1Z8m6gec/mHsK824pykVPfxtXBG/eqWvhWw8dix891G62jMi3Qv9bw==
X-Received: by 2002:a05:620a:3905:b0:7c5:46e4:47f5 with SMTP id af79cd13be357-7c69071a788mr955381085a.20.1743423706435;
        Mon, 31 Mar 2025 05:21:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:21:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/9] mesa: upgrade to 25.0.2
Date: Mon, 31 Mar 2025 15:21:33 +0300
Message-Id: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAM2I6mcC/6WQwWrDMBBEfyXonBXSyorlnvofoQfZXsciUdRKj
 qgJ/vfKOZQEcgjksjCw82aYK0sUHSX2sbmySNklF85FVNsN60Z7PhC4vmiGArVQaMBTsoAadm1
 trOgIu0aw8v0daXC/N9L+q+ghBg/TGMne+2tEaUTNUWupqwok9N5NceatjXMajyF/hpT4z8Weu
 uA9L2eFjy5NIc63lhnXiHeAa70sHyhSaY2CqwaFNM3rFHVPaf7HyQoEDFW/Lkat2dVP7Muy/AF
 XZrk3fgEAAA==
X-Change-ID: 20250328-mesa-25-6b78a0ce2c90
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SpuFqDhYaxShusfnRPt9galh42S51ouecCAN3uFkQbE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojW6wL15Id5y5t8kRukzKL/8dhKdj5QHq4Sf
 uH0oDq1EDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1gAKCRCLPIo+Aiko
 1XI5CACgeAU632tMH0Se5qIIYvon2p7zCduGeNwxya+nAOTUntNjA217dj/8ov/tyopxOpIm8Nn
 bIrRpNFJDNrPvagluzprmtSMgvNbHr8bHLiFNthRzigC17Jjvg1gi7Zbyjsz/D4KRzWDthl1pfF
 GxTskt/yO53wyXvqKzAwKr7tcWGwDUyNccxZgzopIGbGxCpGBdfPo3AxrSd8V+7+g3rfb437WZa
 sfjjxNLlGdwF10mtfZIRFSYBOFj/RBB4TdUjPIh16SzapQje5wZKAq6Za41g1WdHWs6lleavtWi
 b/aGnRyJe7eKCo3NzMjQBlhzp+QylE1vTZPuCrJ4xbwQld5A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3fFSzSDHqxpTWaB55TtQ1loEZr0Y6D_1
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67ea88dd cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vr40fS1c8MbUWjUDQeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3fFSzSDHqxpTWaB55TtQ1loEZr0Y6D_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=945 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52V6kZSY005013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213969

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
 meta/recipes-devtools/llvm/llvm_20.1.0.bb          |  77 ++++++++-
 ...evert-meson-do-not-pull-in-clc-for-clover.patch |  53 ------
 ...d-Include-missing-llvm-IR-header-Module.h.patch |  41 -----
 .../files/0001-drisw-fix-build-without-dri3.patch  |  58 -------
 ...eno-don-t-encode-build-path-into-binaries.patch |  46 ++++-
 ...vide-cross-compilation-arguments-to-LLVM-.patch |  67 ++++++++
 ...ext-don-t-try-zink-if-not-enabled-in-mesa.patch |  42 -----
 meta/recipes-graphics/mesa/mesa.inc                | 101 ++++++-----
 13 files changed, 470 insertions(+), 254 deletions(-)
---
base-commit: dc2ef2cc1183a14cd3a05d388a1d0485a1bc8d20
change-id: 20250328-mesa-25-6b78a0ce2c90

Best regards,
--=20
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


