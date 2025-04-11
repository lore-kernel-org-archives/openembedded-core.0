Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114ECC369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.38814.1744409365675223430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QgVmHO0k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFefAS019634
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8W3iANCcowrr5NREKOQOmbPqQl9vZT60As30OigF3A=; b=QgVmHO0kQQv0/Zcg
	5K/qVSYw28ZlyI04NksXoSCAbVXTbTJtn/9HtuJcKCJwIxzkJN3MO486DJfTevWY
	0B32Tb0LAGA0L+HQVrHtJlpO3/9JR8vV5yKLRFFi0+qkSAW31lrAnCf/B5YKq0D5
	Qw9FoSbM2BJwpq6BbHRmLWHypOWcRcyAsqI4XbloPnT6UBvpeXwxf7+VW0bm//FS
	CGHL20atE8RfUFmnMI+1gT2OkjjAnATO8+DNgG1A11DeogrR9gWBi+5czD76mgD1
	f+oL37TeCE7f3GkakjAEPmcbZWMLpN+LSGUm12Um4i7h2B3Pg4MTEqdeqzZNWkYp
	Z9hiHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcruvb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so299981985a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409363; x=1745014163;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8W3iANCcowrr5NREKOQOmbPqQl9vZT60As30OigF3A=;
        b=G+th+FWpx4dXdoOp+5EtOQ8xpsIcghF3LVpTQQ77hupZVircPxLWINsyVHU6AoKvNm
         MrFTyXL26f/jpXcFMYLcUK5yv6Nq9JMUGpBtR940ZhdeNicfe0cqBsAPpJrG3ncwt0Tw
         zThVZOMRZVBQts/Jx0c058P+Xj4gkXF24GSFUIp5WvEpZ8wWiGEWZw0l1Dxn3JOHResZ
         Mi0z4YGC2gXKfHa7ky//4Y/wSE77BJFefSS5bYtHC3xRdZ8bxfvmua4PD6VlFZnRL0r2
         aYg/VpVbMFWj1kEPGqJT00ufGuY8GhP1uZElw4yoi8+awEhy8ygK4vso5Frq1bEprt9I
         orXA==
X-Gm-Message-State: AOJu0YxMFWLhRzKpsWjPIgTozlRKGUvNU1e7TBjVGz9bMwcR44ttB/7b
	b7k7Ls91yGPsNmFZp6zG6PZQvFQCThwIxki2ob1rRr9BiNCLLaYFMCDhwP5UDNwRpisz6VQwrGb
	eyRA7WZU7E+SkhMp8A6YJQsOJi8mh7XRGR0+pakrLmFmZBY/biTdUiA7V0Xjzf7mD9fPZ9G4S6L
	NzgoFa5WbsOeg=
X-Gm-Gg: ASbGncv/BMwIvZ9QInhwlgLGm1LB6wXoPCPdlC0OuIw2bXOcbj/rbdhh4nkhs7rTLHF
	TwYglUL79DtjadNdZmpj4ysk9+Hx+CVGVuSYK+FjlFmk3VB/dNGy2xpiWekqB8c8Smsjds8iwEu
	NNr3pclxYPw7hhLvHLXno87EeZQdxifb1Cmhuwlbif+Le4Q3iLrUFbtTCnpNGqsdv9tbiG2V83c
	thyVZtOC6IzCX82OM1fqAIrHHFINUdQs8O6tr4IDRmiO/V14WPnQoV8hRtgbunh3IlKEvRKbXFp
	m8o69HywSOD6W7brybvTTYLMRLlCB5YQsGw/dHT36/2l9BcfBMhgEHPeTm9RM2O0bBBbyT3szyR
	GPSranDlIW8aKLArLfdEP3QPv
X-Received: by 2002:a05:620a:4610:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c7af1127a6mr825984585a.40.1744409363312;
        Fri, 11 Apr 2025 15:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8hFFP598LKqlcdjDTXkKU/GYNLdiptYitz7GAvLV2E2bOcDZLa6+D0/3SExiPXJ1tswx8Tw==
X-Received: by 2002:a05:620a:4610:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c7af1127a6mr825981085a.40.1744409362897;
        Fri, 11 Apr 2025 15:09:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:09:12 +0300
Subject: [PATCH 3/7] mesa: drop the bindgen patch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-mesa-25-fixes-v1-3-791840391271@oss.qualcomm.com>
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4797;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1aaS43YmAfwycWvcgP8ngMXuQ4FRkuimUaW7KNv/A3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMGcMts7y+ys0+iYsqaGbS9BjZYIoc1lwAN4
 hPgSHDWhSuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBgAKCRCLPIo+Aiko
 1Qb2B/0dTK7XFs8xiNWLrYARigQpByuyLM9NcShPj3T6YgoVQK9V6TF0J4hwvilFuO0SPKaYL6a
 xQjG8bcdAh+nEHVu2FVn6eqgiTp7AxWOjAt0+QkV9WDYHya4LU15ZmD9NFo6QSXYtRTroP6TXhI
 SEVzo3K35ir2l8CcmnPpPusRToqjVZqD1LqqAyj0BZEjNBMCRSl6PebOft0wTOgRg8nYAwG+sCR
 ZusoJbPmJdxnZVWVVRlD//OkIMtxZqkDQ64mxixoU6YuLPkgeMAlc356FWuWEeb0kZ8oa33BilJ
 lUfBMUDmABJsFljDhhWybTbQGx4YKk9ceiS9ckWtTu+tuoKq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: sWOGFBgR1q74cs6_QTseyNmFV2jPBzqq
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f99314 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8 a=9tIwmJ9o9K6fykSinjgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: sWOGFBgR1q74cs6_QTseyNmFV2jPBzqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214765

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
index a88cc8660e26bae43c713b2bfdbf396e804f6c09..d2de6a096a6343b6d1bf9e7a638abc0e3c7eb492 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,7 +18,6 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-meson-disable-SIMD-blake-optimisations-on-x32-host.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
-           file://0001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch \
 "
 
 SRC_URI[sha256sum] = "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6d4c45638627fdc97"
@@ -148,13 +147,10 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
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


