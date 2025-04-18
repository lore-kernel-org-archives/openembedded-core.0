Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5C8C369CF
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 00:57:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3256.1744937840941219238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 17:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VV7dMfu3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClaU3029708
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1S0pcokCXUcCLRAv38h+IE4xr2g9A+cXzbFSoFcgnYE=; b=VV7dMfu3cKzmQKdG
	cuBkynTHyDInmLdgR2SD2ClVwD4hlY4Vi8AsLHkUpugJJTiI8EIpAh2FTwgkgqvh
	xi2SA1Hu1FMGPLRi/RoKgukrYEWhyAXBLFn0vApZNN3eJWhWfGGPm4sFxBdegley
	b1WjCmeGhkJ8SqcxB6BgQU7bznlXKzm3FgQnRgMxvRCVlullSJPwYBRjeC7P0gvC
	oB/wz/wlsnEMzD2Lc4Zvig6Wrlm+t+mO6zWNgvWqlWZB11IlobunyKbaqtbfTaug
	XoeTOm6CK5IiD4zLAEuGp2VMrfLLvtXR0J8Bi56HuMTcuOB09CZtPNRlBYJU/ik0
	EenAZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9gjwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e900f6dcadso27664036d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 17:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744937839; x=1745542639;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S0pcokCXUcCLRAv38h+IE4xr2g9A+cXzbFSoFcgnYE=;
        b=bKH0TUEqrgdHeVQ35fznYqTwhoQTyJ3pe+zAsa8OOMYURpRYy2lYG7ZJ9D02QvwReV
         jhDvSQw/OurLxYut7NtpOFsaVK/HswOyVCBPr48fUop5oL7VTd+bHo1V0jpb8SQEphlP
         fBmRqSn8xpqOMS7qzkOSLJkSEL8RIfBgNhGiOsgrwjcMjYbTXS4GK98FfY0eEEoGHWwr
         TR5SVYR4n8Op1I1WxKwflJxiOFteKIx/jqG23XnYoESJjv/L3nQF2MMiosB0j1Q+sWoY
         Dqe9EkjflJs1FDU+8dM8qtVxqqtmOL7TE9mCm9uIv18QYX1qnzeQuRwWmk8MseCfOtGh
         VeMw==
X-Gm-Message-State: AOJu0YxrsFTDOOfSvu7JVLupedKExXeP5E4oHA+p09qMxrQYVCe4KjqS
	xrmP8mDULnh78scnCbH02Hxmq7zc02+POUPQIzMgUfpRl71jgiiAQ49e6L6NW975hytjQ+C42fG
	D7dvs2eaheWwN+5F9DwWMhOjm8bT3GCT82Txk9YifZA9NB3+/5ex2eA1FL2065zXAc6Ay2eJz01
	h8yf2XK1nPdaY=
X-Gm-Gg: ASbGnctm88Y6Svcr/krLPRP3W3LsuaoUDlNBHO4XcmXzrxSGjxPwKgPXR3APHPwPiH2
	dwtzoWneULM2X3+KINS4/+iEcQatn/+Pp/lcbsLJVGxDYsRltNYS9ihfGSPw+vZs+mIejA1ctEc
	96LgWtRAY5mj7rXrQiQQ0Ak4DcZT1ld75iOmgc7U3e6ImsNktqdzifhMYoVDiiET4KBWIz2LsU/
	I4RK+ux4IUg6UQns0MtobZMgZ2Vt8q/PfOyG6ciAZq0tWzsPRsBbXQbK+3OTzyMCIy17FBkZNOG
	JZ6cdvps/6eVTH1yuW7/jJvspcmbHZFnHSqdzTLce3Na6Z9e5sP3HiIfRaTUd4JPHKT2GcEzlHT
	dfrCYvczuU4/ecqTkJu2wjw0E
X-Received: by 2002:a05:6214:4103:b0:6ea:d393:962c with SMTP id 6a1803df08f44-6f2c463f961mr13007026d6.30.1744937838796;
        Thu, 17 Apr 2025 17:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmAHtPtc7VhHOPuA01RZ8dXNGiMyZdH0F75T5UchtZh2MB0O2wWGPDnrkBtAglCC3uz/1rg==
X-Received: by 2002:a05:6214:4103:b0:6ea:d393:962c with SMTP id 6a1803df08f44-6f2c463f961mr13006896d6.30.1744937838456;
        Thu, 17 Apr 2025 17:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a77c1sm718951fa.57.2025.04.17.17.57.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 17:57:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 03:57:14 +0300
Subject: [PATCH v2 3/3] mesa: bundle Clang OpenCL headers into meta-clc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-mesa-25-fixes-v2-3-e110ccfe291f@oss.qualcomm.com>
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
In-Reply-To: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GihEBmC2U/SOHeQlV0MDtNdeyx0bjKD5IbHXjDUOwm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAaNpWgLI//ezYlTV/fFB8/rxWA94la8WgSxbn
 ++Q8NL6abGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAGjaQAKCRCLPIo+Aiko
 1auYB/97208xuTw1QJyKjann4/lbJzURQwWNMKCl9DScO/GZ2tKX+66c3OgBkMT+2RDAgvg7JMt
 r4FqfCBCUwidVr0Ak05/Qul6sEvO3pzllnw2io8T06pZ6HlWSvEthOXwo5mfBvgUNXioLKCF4Dx
 xNL7SAmfARbiK9m+F+EqfHhzjUtUQO6VyjXZAQZ0MIJrVYLfQwS+NbgAhh00jIUBBfptySfzCE5
 1tBSpOVFg7qs0QGSg1PReZe+uActW5xas0L0TXoyfVu39ghUivQ6uo2FRwkRDhXqyAyArSvo4YI
 oMGqNQZBWMz22l/7ZRBTwx6bIo2KkY6yjN26ic/5tGBsXK5o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: lfn8ait2spXeeYXGMC0IUgsFfK_dggNj
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=6801a370 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8 a=mldz0pl17pscVqxRHvMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: lfn8ait2spXeeYXGMC0IUgsFfK_dggNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215118

Add a patch bundling OpenCL headers into meta-clc. This removes extra
runtime dependencies when runnign meta-clc compiler.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...d-an-option-to-force-inclusion-of-OpenCL-.patch | 57 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch b/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch
new file mode 100644
index 0000000000000000000000000000000000000000..d65ba574d26da4088df272e7c589670ff1578747
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch
@@ -0,0 +1,57 @@
+From f9b6175e7c446a82c568ff1a214885d707c95f49 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 16 Apr 2025 14:35:37 +0300
+Subject: [PATCH] mesa-clc: add an option to force inclusion of OpenCL headers
+
+Currently mesa-clc bundles OpenCL headers from Clang only if the static
+LLVM is used (which means Clang / LLVM are not present on the target
+system). In some cases (e.g. when building in OpenEmbedded environemnt)
+it is desirable to have shared LLVM library, but skip installing the
+whole Clang runtime just to compile shaders. Add an option that forces
+OpenCL headers to be bundled with the mesa-clc binary.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34551]
+---
+ meson_options.txt                | 10 ++++++++++
+ src/compiler/clc/meson.build |  3 ++-
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 18da31eff507..addd274ecef7 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -797,6 +797,16 @@ option(
+   description : 'Install the mesa-clc compiler (if needed for cross builds).'
+ )
+ 
++option(
++  'mesa-clc-bundle-headers',
++  type : 'combo',
++  value : 'auto',
++  choices : [
++    'enabled', 'auto'
++  ],
++  description : 'Bundle the OpenCL headers into the mesa-clc binary (default to bundle if static LLVM is used). Note, it might require rebuilding mesa-clc if opencl-c.h or opencl-c-base.h are changed (e.g. on Clang upgrades).'
++)
++
+ option(
+   'precomp-compiler',
+   type : 'combo',
+diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
+index 263eba527191..9ff61440f0da 100644
+--- a/src/compiler/clc/meson.build
++++ b/src/compiler/clc/meson.build
+@@ -11,7 +11,8 @@ _libmesaclc_c_args = []
+ _libmesaclc_cpp_args = ['-DLLVM_LIB_DIR="@0@"'.format(llvm_libdir)]
+ _libmesaclc_sources = []
+ 
+-if not _shared_llvm
++if not _shared_llvm or \
++    get_option('mesa-clc-bundle-headers') == 'enabled'
+   # LLVM 16 moved clang header path from using full version to only major version
+   if dep_llvm.version().version_compare('< 16')
+     # Prior to LLVM 16, this path used a full version
+-- 
+2.47.2
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c76c5a075f1e2e81e887e77059c999014f742c4f..5062551b96c404f9267a1a9cd77f85635bc14edc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
+           file://0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch \
 "
 
 SRC_URI[sha256sum] = "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6d4c45638627fdc97"
@@ -193,7 +194,7 @@ MESA_NATIVE:class-native = ""
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
-PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC},,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
+PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
 PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"

-- 
2.39.5


