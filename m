Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC4AC369D0
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 00:57:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3255.1744937839636983496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 17:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FBMb4Xab;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClKIL001224
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyxyO4JLcQobpWHdu1HYyO6b3zY0NF3oFc3r3qeCGv8=; b=FBMb4Xab+55l3ycs
	RoKAJuUKAFpiJYvR2Ntwv4FA+8gHc0eLWLpvmfWRiJwCflWZBxslH8UhcUVzAKip
	ncXHPY8isLh6VcVIHzTk3JSjy4YFwwuZZn08oKf8BTcvZQGUiVwPouvQ3mCkHpPk
	Fqd8A/YuwRP4uznqYx1pzr/HwHUgctMVC62k8Z+aE41NeN7xMm7iIU6Lh9C2bPdJ
	sJ187qQ1bjIdULy93wJ6blWPCBOsIquTx2w+uQW85FzFJLo9P3LxZaXRJ4prnsaf
	jWRPKEHjW0RORMZ+etG6jJiJALiF8FcRghO253N1ClafCiyIzQe/Iesk616TlKjz
	NRHFuA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjgunj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeffdba0e2so27693996d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 17:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744937837; x=1745542637;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyxyO4JLcQobpWHdu1HYyO6b3zY0NF3oFc3r3qeCGv8=;
        b=RHuvFve0XCoR+wyUcwwnEsVpo0iNrx+wI1c+eCyegL7WBcc7wfVJeUa8hsaB/jlalS
         rx6kMJ8FdAysbLuTyGWg3A2gzn0w2DrixbT7hDY4+pmZo+zAXIRkNiHjml2YJwx9q6f2
         MBTbe6zMTaTiPjsmZfNUZ96pfMd2hmxxPhvr7Szs3aio0yTEsePsp0KkfX4u0g6MIteb
         c0n7P4ZjfbAiqs0hOMoybdyCfq9qpV0PEQNRXcRI2KP6yMtPZ0bAWoESCrLitzntP4k/
         3BEnak/yV8OYyn1AJ8uo+RGto5KSjk96hzSiq9ObE5I5r4GaBaZYt3XgMF1Xw7CWN2Oe
         Ihvw==
X-Gm-Message-State: AOJu0YxIGjlfK7gqE68u/iF/9QUGGJQvPTpB7WVWIKqHjAyC2GKoh2vG
	+zVTIYXm1+m36FtuVVfMkAow6wpTlPPtt44YHAbddkNaAo4gkJP5m48QuRWNNjAaWX8NKtAyanZ
	xa+BwFvBzl5IDU3/FeRvZ9q99+GAZ6qztsMW6q1cYCP1/co3IfZ/t9prTQdqJDN+B1ZYZFIChQm
	2CjDEpDqhDksE=
X-Gm-Gg: ASbGncsM5LG1s2CRrGQ4cKPi9As4nl9BFEOWl+wOVwJHGIJUpUpA7PYvBo1V/kKnLfS
	Pa+7WX4M3bxmonBLcmSGZcUsnl65KNF5MZ19aGGD5Q40SaPd3F8OGyU35tIKQLRFQQyPmnsy0R4
	KipqkhkiP/7Vw2QJ5jjMqNxi31R+VFUtsdX2MmDR2rsdBix5b5wp76mR2LAMd7EmEdYWOXey51b
	1PeyAf6TYbowVZtR9Oqtd3Q3VkMIo+fpS7vGH/tdmrtaQcwKXWwK+0Xu8soCDYZN5fAVPn+GU+6
	bDaSfLMwnEqBSf6tV91QTnE0cGChoWaqRsckBaHfRGBXni1rFSZtsLy6LFLPw0CPT6W7fDAcT3r
	5+x0zddJNgmrpU4qd+Bdjz5gL
X-Received: by 2002:a05:6214:4103:b0:6ea:d393:962c with SMTP id 6a1803df08f44-6f2c463f961mr13006446d6.30.1744937837411;
        Thu, 17 Apr 2025 17:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr240ipBgcIMDCQrrqWU1FVXRxqwDB+mrE5iiMIVWpZj3M+JngXkcjiNJy/LmFiaG7jXzGTg==
X-Received: by 2002:a05:6214:4103:b0:6ea:d393:962c with SMTP id 6a1803df08f44-6f2c463f961mr13006306d6.30.1744937837027;
        Thu, 17 Apr 2025 17:57:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a77c1sm718951fa.57.2025.04.17.17.57.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 17:57:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 03:57:13 +0300
Subject: [PATCH v2 2/3] mesa: drop the bindgen patch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-mesa-25-fixes-v2-2-e110ccfe291f@oss.qualcomm.com>
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
In-Reply-To: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4797;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pMKAhtBCG1nWVb2/MqppmXqXeW1a9D1PJ/ypexNu4CI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAaNoKZUytHq1b7LSTOc7k/ldYf+LSkWCSbBkr
 Vx15OL3hJuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAGjaAAKCRCLPIo+Aiko
 1aYvB/9gKFLEMcBuAyt3wkjTUFvX94JrP5458G379P5Ji8w+SkFitr7BfjeauYQgvfo6Uzf4UHt
 hlhBXc28FDKsycMI+Rt/q4hesteMAsikKf5NcZcszR4K4SbNQ3AMxk1npIIoPds6diaPumz0wfm
 Jo+gctdrIpQwTFrVN815r69kuGlofE/DG/IA9uEr6IdJTUiDcAEqWadz+ndZsQJbYtA1bivVt5z
 gCU0lrjNYMwk2x3mnUTnb2zHky27Di/q8X7K0ufUBTt0kPQJEj8r5jnlSPafbT5rF2MXDWkZzNf
 bGQpykkRhIOHireNMerzYT32X5o4vXBCq17aL/I5OedjpieL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6801a36f cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8 a=wyzPdfLjj1_7MSCVPeEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: 71sUFLLJeCZ0ent2W9pUAn2biCTv_GfC
X-Proofpoint-ORIG-GUID: 71sUFLLJeCZ0ent2W9pUAn2biCTv_GfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215117

Drop the bingen-target and bindgen-includedir options in favour of the
bindgen_clang_args being passed through the meson target file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...vide-cross-compilation-arguments-to-LLVM-.patch | 67 ----------------------
 meta/recipes-graphics/mesa/mesa.inc                |  6 +-
 2 files changed, 1 insertion(+), 72 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch b/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
deleted file mode 100644
index d527b3408734dfa0aa756053c1b0f3ea3a59563b..0000000000000000000000000000000000000000
--- a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From b9cf34f39ca7e7546508ce2ab1f053edef5fc201 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 26 Mar 2025 17:47:09 +0200
-Subject: [PATCH] rusticl: provide cross-compilation arguments to LLVM bindgen
- invocation
-
-Correctly generating LLVM bindings requires several croos-compilation
-arguments. Provide them to rust.bindgen(). Karol Herbst on IRC suggested
-that a proper fix should be to fix meson's rust.bindgen() to support
-cross-compilation. Carry this patch until meson is fixed.
-
-Upstream-Status: Inappropriate [OE-Specific]
-Link: https://github.com/mesonbuild/meson/issues/13591
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
----
- meson_options.txt                         | 14 ++++++++++++++
- src/gallium/frontends/rusticl/meson.build |  8 ++++++++
- 2 files changed, 22 insertions(+)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index 0147cafcb146..f73e83fded18 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -796,3 +796,17 @@ option(
-   value : false,
-   description : 'Install the drivers internal shader compilers (if needed for cross builds).'
- )
-+
-+option(
-+  'bindgen-includedir',
-+  type : 'string',
-+  value : '',
-+  description : 'system-wide include directory for cross-generating LLVM bindings'
-+  )
-+
-+option(
-+  'bindgen-target',
-+  type : 'string',
-+  value : '',
-+  description : 'Clang target for cross-generating LLVM bindings'
-+  )
-diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
-index a5d1dcf3abb9..480c220b7f5f 100644
---- a/src/gallium/frontends/rusticl/meson.build
-+++ b/src/gallium/frontends/rusticl/meson.build
-@@ -115,6 +115,11 @@ rusticl_bindgen_c_args = [
-   '-fno-builtin-malloc',
- ]
- 
-+bindgen_target = get_option('bindgen-target')
-+if bindgen_target != ''
-+  rusticl_bindgen_c_args += [ '-target', bindgen_target ]
-+endif
-+
- cl_c_args = [
-   '-DCL_USE_DEPRECATED_OPENCL_1_0_APIS',
-   '-DCL_USE_DEPRECATED_OPENCL_1_1_APIS',
-@@ -187,6 +192,9 @@ rusticl_llvm_bindings_rs = rust.bindgen(
-     rusticl_bindgen_c_args,
-     pre_args,
-   ],
-+  include_directories : [
-+    get_option('bindgen-includedir'),
-+  ],
-   dependencies : [
-     dep_clang,
-     dep_llvm,
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fb76b5b1ccba1b6ca84af25cd7f3156b1c73c11a..c76c5a075f1e2e81e887e77059c999014f742c4f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,7 +18,6 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
-           file://0001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch \
 "
 
 SRC_URI[sha256sum] = "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6d4c45638627fdc97"
@@ -143,13 +142,10 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-BINDGEN_TARGET = "${TARGET_ARCH}-${TARGET_OS}${@['-gnu', ''][d.getVar('LIBCEXTENSION') != '']}"
-BINDGEN_TARGET:class-native = ""
-
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
 # Be sure to enable them both for the target and for the native build.
 PACKAGECONFIG[opencl] = " \
-    -Dgallium-opencl=icd -Dgallium-rusticl=true -Dbindgen-includedir=${STAGING_INCDIR} -Dbindgen-target=${BINDGEN_TARGET},\
+    -Dgallium-opencl=icd -Dgallium-rusticl=true, \
     -Dgallium-opencl=disabled -Dgallium-rusticl=false, \
     bindgen-cli-native \
 "

-- 
2.39.5


