Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78608C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 15:59:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.23111.1744819177671500873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 08:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GzjTHjhQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDjd005948
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ajgp1K65Pa5
	yc3L8eALzoHsS+G0L2p+/c+IiE64S2PY=; b=GzjTHjhQDrYBrMz21OS5n2yQ7pk
	8lI1Ji6AV3uGcHWuoMzS05/TpFUoOPccTRFyhaR96Xsr7Vzp7ufjU3xFGy0X9xTq
	r9B1P2yEWUR+88h82/dVn/6tITzY4mVaTOWocdegdDCZKyeNo8Aq9F3GO5e7Ztof
	OiuJlDrtePjCXG65rWBCLwFVH/0Nps1l6ClXD4c7VRDv0hr3PdSp7GDpPMQYVauN
	nfVNxAgnb7T/hsAFoZkM5PxEjMfLwoMTNw66x1CJ8qLNreoCeyINLvAx/StUhWne
	1upvacL2edSJNjql+EPVjYJA59xbbH481+BvRFq9o2LTP1mmOTuxBT2fFGA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqc9c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9450b19so18845736d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819176; x=1745423976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ajgp1K65Pa5yc3L8eALzoHsS+G0L2p+/c+IiE64S2PY=;
        b=oGL0vTgNzj0G2w5Ja5/c73EfBS3c7JO9CnUF0rc1QUixXxHB2XaVjSpe70wZxbBEsd
         yJG+N22+H+gd0KRcYoIRNC6xwBsrZ5/pOul6G2bt1w0lfB9helmoPHHSrIHM5/eRC0gN
         /1aKl6j96vXP4hmjjy5CARIFYDgmA/YvLjkNfHFUkKg9SrWOfvrsEKdKbyyvoe4vC2AU
         42bPVTWHtAFaRcKySmRsddl+oxfe2lEFwJ+zSw/+cdk/QZUmh/hYFs5aWWrg0yPhRBu5
         m3/aC+ABONkGFm4vHPvl+fE9qR3A0b3Ydbgu6PwNnvi3sOiK6d+Rbzb5fXjCrjZl3xgW
         IuSA==
X-Gm-Message-State: AOJu0YyEFnS3iNIIqn7vRuqIgx2Eosxv3nto65u9Oh57tQOFX1u7PnL6
	fGE3sYHXu0v/X7s+lJ63hwTd62PzUofflojhTICA1MSOcjUOek9UVRQpQbEZK4FsEmwf/1ayUN2
	1c2bUsP9LhUJEWBWNNYvSIo1SZ720ToO2mwye9ciy/fgeMmC3GRNrEbebwK/I6hpgk/J7m2VDwK
	LxHC5wpzu32XI=
X-Gm-Gg: ASbGncs3JCIekRd6VXy4mZoZ2vMQmlpOb/gsO400SZVfFFLzCQSAlCUfI0n3qdWA4Os
	JbZ98aIHUnfOrMCqyPJsix9OLyAjR5fyN6KExLo8I9rBFA3vUax6ub1yf9W2OR8w7rpwNXAMdFr
	vAaWBdkyyVU2VPCy8DPqKdDT4NEs7lclNs7zdv5b0aFbWBV9v3K3CAE+duv7MGU7wWmrK5HgOv6
	uWSwztYVP57LYw8OYAB/xI+UEOtzIkmkJvH9cXUZ7nd/ikUa4MGsSKvrBUqV45xKsjfF+DTbmA+
	EfiuN6iWUk6wfbuLtoBCKdO7wSnXSstzJ/ui5DNvFTcIHB7khCtplvqnRAUabCEdJaMWNNZBU2s
	5He8tI4Fm4WoHDLa7ePPxE1f0
X-Received: by 2002:a05:6214:1d0a:b0:6ea:eeb6:c82b with SMTP id 6a1803df08f44-6f2b9955501mr910876d6.2.1744819175834;
        Wed, 16 Apr 2025 08:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy5AxNrxZlaSq5MHep6hPwIujk/BQX449iVA8d+lkIRMU4PXpUiyRBIT2y/hlt9TaTkmycZw==
X-Received: by 2002:a05:6214:1d0a:b0:6ea:eeb6:c82b with SMTP id 6a1803df08f44-6f2b9955501mr910446d6.2.1744819175378;
        Wed, 16 Apr 2025 08:59:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d5857223csm676550e87.175.2025.04.16.08.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:59:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] mesa: bundle Clang OpenCL headers into meta-clc
Date: Wed, 16 Apr 2025 18:59:29 +0300
Message-Id: <20250416155929.2630778-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BWetrUyeLfwoylJweDGh49b-N9ezqbYk
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67ffd3e8 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8 a=smLMKbEpzHjB7PiwKtkA:9 a=OIgjcC2v60KrkQgK7BGD:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: BWetrUyeLfwoylJweDGh49b-N9ezqbYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214997

Add a patch bundling OpenCL headers into meta-clc. This removes extra
runtime dependencies when runnign meta-clc compiler.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...option-to-force-inclusion-of-OpenCL-.patch | 57 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch b/meta/recipes-graphics/mesa/files/0001-mesa-clc-add-an-option-to-force-inclusion-of-OpenCL-.patch
new file mode 100644
index 000000000000..567c1f7e1b44
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
+Upstream-Status: Inappropriate [OE-Specific https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34551]
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
++  description : 'Bundle the OpenCL headers into the mesa-clc binary (default to bundle if static LLVM is used)'
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
index c191e68b5841..6660fb65374f 100644
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


