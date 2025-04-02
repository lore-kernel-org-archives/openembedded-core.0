Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9880FC3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11446.1743607123521635489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oi0ktc2j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D9roD023751
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33gtWchws0lQd7o5+nL/y26TAEdmpbwBL1PUg000Ujs=; b=oi0ktc2j47EBv28T
	tIeopmiwAtRFaOvyoFg3XMUFoGLm8bm1SxiAJqlCnAT8dqKrRuOJVhi06ccOovRV
	9lVO4/RcwS/NGAulSd7WIoFw56Wek1AFK3Jug38CU96pPJn4Qs0TO+1NNKadzXrd
	wf5n8gNH0KcsGWD2naNUS6+u6wXxEOKmNSWXUmjCi60XVvHudpVE6g0r9ck6+AP0
	o/CbMgtYEzIUkvdV//pq4SQH+40W/SbZxjb2asBzJ8BWr/dJJOyi0wtC9rTe0wt5
	EMinS4U0Ouu6PA1Hj/gqo1hq24ehtOmnD7dabmGm5CtrrsOQ7zV1ORUkPCDTMgZX
	VEhj1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapsskr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ba3b91b1so194914085a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607121; x=1744211921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33gtWchws0lQd7o5+nL/y26TAEdmpbwBL1PUg000Ujs=;
        b=L5Nac2HyM2idu2POEZVrArJ1blyOfV77bfO7WDt+pH+cRcufXorjuu7l2e56KPhTYY
         et/TVqGx9tNq2RgLYlXxdrK1liBPlMmOFr5T0XfqZIODoeONRPW/arlNyAh/x7GTYdaK
         CCswyhTkHk0jkoKa3wMZWV6A8UUlkIz9c4SNdvQS0SMvxvkEjeegA0JVPBxEy+F3rCe0
         9z6OTeWftuhOBDTj3+9lWH1Yq/SjO7dnO4ypOPeP5EhGXfgYs+4Cw01oHHBbxfdwvoDP
         nNYelcWH6Om2XjP5NdnODg0SsvPYcO6eRCkbUOx5jQbpr1CH6Zvj+rsSd/0uxmunbrDQ
         VDbA==
X-Gm-Message-State: AOJu0Yw2yY4du8MXCvnQIEb9njsR0ld7DJA2yOTHHhRwxhnviYK149im
	zNWkGI41yy54YWnBrJTvDdmXo2F4k6VJsM7UqxVMZ/S/Z83PFMJLPBvPtx6po2RSQuP8xRlQe+u
	gixkXoZQIeuYex/+8B++ivv8pvMSNtMKBShh0UEcTDKujz1Q1CnaHgJqUDgPzdCxuDXt9qEQN9C
	SEiDQvouneX0M=
X-Gm-Gg: ASbGncuF4IHN8TRUMVPB6h563tun4VG73RSVsbwqdaVdHQogdp8jJD8EplVLx//9keH
	8l/ghY0CB/Z0T8gFYweDeWJTg0Yr1Go/ETax6RBtvmaqBNiWRKRE6rWi2L2f122ILpXpHo+QR3t
	CP4PHPSmYXsHQ1qET54AGhHiRikNnanB1P0k+AZ2K8XdLWdwx+WQv1/g7Kbr7i8a0sni03qPPe2
	6IVoymIilrigBbGYysMPwY5uSVYwwsvN8AO0J7OLXZuqfrGdxMzEIRIP7kKaZ7kdBgCjtgl2/kf
	Crtv97WBCcTo3X0J+Tf0s144VmnN25YR6WTnIKxyVMfIQM6GyomRylAcPcfY01Le1xadrkqn0YP
	Z9xESKwNzE9ZNqoj0LkJnXNrCBbP4
X-Received: by 2002:a05:620a:254d:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c7682b87fbmr337204085a.22.1743607120936;
        Wed, 02 Apr 2025 08:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGualobQvdIClSwC/w23pTdXwI3FOxkpl0HLdsaGZI6aQ99/WBWvz+tZlE5bHLyt8biJVC37Q==
X-Received: by 2002:a05:620a:254d:b0:7c3:c512:9b1a with SMTP id af79cd13be357-7c7682b87fbmr337199285a.22.1743607120476;
        Wed, 02 Apr 2025 08:18:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:30 +0300
Subject: [PATCH v5 08/11] llvm: add SPIRV-LLVM-Translator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-8-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7351;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8r2sHL1oZRuvUVtjxhWKVGUC9r5LnF62AOExNqi/xpU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVBfIVrbdtQEW5GiDFN/CdNeYd2Md9XD9aMn
 h5Ed8rCWESJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQQAKCRCLPIo+Aiko
 1dfXB/4/uwOz4JPNwh1Mg43auc4qTQZzEgdJQbzs0YdE2jeY+AKnGJid1SCUe2ILiZrltlNJOOy
 hyacIlPzXNnZ136aX4kVptryvXpgNwfAGn4XlR15+oq3F6m752EwArq8jJPGAaVwfYlS1rhMqNy
 7Ffhi3JoPi3S5YkdqDcD8AaJIvWzjuYpU8OX62Z/dgfSubyHMF4PelZN1RvgRAWfmsbssLMSzzu
 Ha7Sgn3VDsDar0H0TePVDgJVI5qM+HyZNd/BJ8P1lVBs8tKi0YXc2uODcVgWv/mlZQzH9IMmDwe
 A+NKPNTq9bqGcVXZXXF3iOb5aWU14g6KJMdIoJ6Ai0mjtWf9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed5553 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pEjDCETy_axdY1vJs2YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jSYY3Whlc9SYDeXWxomTU7dv3d3rEqx4
X-Proofpoint-GUID: jSYY3Whlc9SYDeXWxomTU7dv3d3rEqx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214276

Mesa builds require SPIRV-LLVM-Translator in order to build CLC support.
While it is possible to build it separately (like meta-clang does), it
also requires a separate clang compiler (which OE-Core doesn't provide).

Use an alternative path and build SPIRV-LLVM-Translator as a part of the
LLVM build process, lifting the requirement for the separate clang. Once
Clang is properly integrated into the OE-Core layer, this can be split
to a separate package and dropped. In order to ease migration from
meta-clang and to ease future split, PROVIDE the spirv-llvm-translator
and make the llvm-spirv package RPROVIDE spirv-llvm-translator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../llvm/llvm/spirv-internal-build.patch           | 30 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.0.bb          | 35 ++++++++++++++++++----
 2 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch b/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
new file mode 100644
index 0000000000000000000000000000000000000000..555d40f4fb07342cc204c7c578662688605b2cb1
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
@@ -0,0 +1,30 @@
+From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 21 Mar 2025 17:17:52 +0200
+Subject: [PATCH] SPIRV-LLVM-Translator: fix handling of built-in SPIRV targer
+
+If the SPIRV-LLVM-Translator is being built together with the LLVM, set
+the defines declaring whether SPIRV target is also included into the
+LLVM library or not. Otherwise llvm-spirv execution fails because
+spirv-ext option is registered twice.
+
+Upstream-Status: Pending [will be submitted upstream after internal clearance]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+Index: llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
+===================================================================
+--- llvm-project-20.1.0.src.orig/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
++++ llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
+@@ -116,6 +116,12 @@ if(LLVM_SPIRV_BUILD_EXTERNAL)
+     set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
+     set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
+   endif()
++else()
++  is_llvm_target_library("SPIRV" spirv_present_result INCLUDED_TARGETS)
++  if(spirv_present_result)
++    set(SPIRV_BACKEND_FOUND TRUE)
++    add_compile_definitions(LLVM_SPIRV_BACKEND_TARGET_PRESENT)
++  endif()
+ endif()
+ 
+ set(LLVM_SPIRV_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index df486d6502b7ce11d1db0b48a3936097c289f18a..3c39059e6278c14da4fe8ddc67fe2d82e7c4aa21 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -23,9 +23,19 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 
 LLVM_RELEASE = "${PV}"
 
+SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
+# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
+SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
+
+SRC_URI_SPIRV = " \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
+    file://spirv-internal-build.patch \
+"
+
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator', '${SRC_URI_SPIRV}', '', d)} \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
@@ -58,11 +68,12 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
-PACKAGECONFIG ??= "libllvm libclc"
+PACKAGECONFIG ??= "libllvm libclc spirv-llvm-translator"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
 PACKAGECONFIG[libllvm] = ""
 PACKAGECONFIG[libclc] = ""
+PACKAGECONFIG[spirv-llvm-translator] = "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. ,,spirv-tools-native spirv-headers"
 
 #
 # Default to build all OE-Core supported target arches (user overridable).
@@ -72,7 +83,9 @@ LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
-LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'clang', '', d)}"
+LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
+LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
 
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
@@ -138,7 +151,7 @@ do_install() {
     fi
 
     # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'true', 'false', d)} &&
        [ "${CLASSOVERRIDE}" != "class-native" ] ; then
         rm -f  ${D}${bindir}/clang*
         rm -fr ${D}${libdir}/clang
@@ -176,11 +189,12 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
-PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc ${PN}-spirv"
+PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc spirv-llvm-translator', d)}"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
 RPROVIDES:${PN}-clc += "libclc"
+RPROVIDES:${PN}-spirv += "spirv-llvm-translator"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -215,6 +229,17 @@ FILES:${PN}-staticdev += "\
 
 FILES:${PN}-clc += "${datadir}/clc"
 
+FILES:${PN}-spirv = " \
+    ${bindir}/llvm-spirv \
+    ${includedir}/LLVMSPIRVLib \
+    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
+    ${libdir}/libLLVMSPIRV* \
+"
+
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
+# SPIRV-LLVM-Translator provides only static libraries, they are included into
+# the llvm-spirv package.
+INSANE_SKIP:${PN}-spirv += "staticdev"
+
 BBCLASSEXTEND = "native nativesdk"

-- 
2.39.5


