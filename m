Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14373C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:22:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.50467.1743423729086050506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=N9klx26v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kdsU003600
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJdMW7W0dXCmXG6hrH7PPGDMOHVhZUzClJFUJ7s1W40=; b=N9klx26vj7JUdLv2
	NGgOy+/W0DJQHyziqlyL8FDcsNjp6C75GZaWWKp8+jQJRYbpEtqWA8ycvkwCyLLD
	oFV16+W0uwU4yqwBlv2TwD1KC9LOrVBPXugrjt1chEuR6TLn9gJDveGIcVeZE5gv
	Nj0uegstwYyWDNgPt96KZCtMW7nFwE85EoTXgwLUlMKRaWZQUJfmGvzXFOZ9fnEC
	r+OZYBR7Uexxa76MsNp/BrGZAxo3P2jsGYKSIiUBNaGGRT8OXvDftsKXopyEH9CO
	L40pA63Fsg40PeeLWc1acWbKTrG6w/qdjRO+AIw2cT+cJrExIlHlpKUnwxU5nA3Q
	3koILw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935vdpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so801141685a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423727; x=1744028527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJdMW7W0dXCmXG6hrH7PPGDMOHVhZUzClJFUJ7s1W40=;
        b=a3Ps16QlVKd15MfYwYcLInlPdarnY+5fSqUkJtr6PHjoamYLHyh/WI4Fp/jSvjsyb+
         Gk1n/pJoOUvvPjRJL2tawAnQLAomC+was4Rbs/Zsf/ORI3RPQabUp1+scIKq3iX0aqCJ
         HTxmw9B/cqXXqM8i72vFbDfxDNwc0Nb4snOOOeYA41kToIUL66FbfcpNw/J9hiusAp42
         qgGpIpPGH2oc0Bqd0V2hadGD4sCAGvFg7Xw+V88gN9CIepRA9vd+0SBkY6jZjR6Nrh6/
         UGJiya+YrPJIBsd3crJImh/D4tp9S2cYXvqPYz5p+CqVk5HzHChBp9IA89e4zq1xZduA
         hb7w==
X-Gm-Message-State: AOJu0Ywdhacmd7G9kaZ1JB8PUiG4JAPhk9M+Shl4eQIm3TYl653HLuUw
	YwYU6ltaYz3Qq8T5ATL9tALlMClMk6iaUu93/k5IsJ4sFC9VIPc49r3nwBVAswgMNzPqeRwUfFV
	Fsn4xSCv+bt3JmIZ5nm29k6pUbIt6rwxFkxrWVje0yy4Q3hWkrhNQDz+J9AAHqkmuLF0PtR61IY
	DQlLctS5le4Bg0dNxD
X-Gm-Gg: ASbGnctSJ90NwPoXWW//xgZt0RNv0iI3XrVNevnXqFDnAJorqayFm68b0rkc7gn1Bvr
	fcfjAWfGjUqvlT9gILnbwDbbu113wlAjEPWS9OT0IFXKjssbbfOhLHv8QzvTu1hZvIzx06b4ck0
	XSbl4ww3lZAonI2ji1NGZz5w22G+4G4yxPz8mJJBgaC5lbzl7VWSVrvz8Sr4r/IqCD895pbWPGV
	sg2SIF0vLh3dXP8AjrVa1+wWD1TfRf6uY1B5a7wu0MLrP3sNYpg+ngbb9IRpZdA65JlGDjVbIns
	PZ6szX//ss+jX6jPQOLZrvDb22NmxmI0Ku7FbFNGliLkh76A3/07kk1s6RIXN4eaK6r5j/2a0/U
	/67MJNLcvbasWiJhChp4NWWNQ8/F1
X-Received: by 2002:a05:620a:2a03:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7c686e8248emr1173296885a.14.1743423726563;
        Mon, 31 Mar 2025 05:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwc2ZKPsnnWe/VsviMSDvsa7Z6rOk8sRN19OvQb5qya/CqDcosrAdKKva5lRKZ00vrW2aJ9Q==
X-Received: by 2002:a05:620a:2a03:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7c686e8248emr1173293585a.14.1743423726180;
        Mon, 31 Mar 2025 05:22:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:22:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 15:21:39 +0300
Subject: [PATCH v4 6/9] llvm: add SPIRV-LLVM-Translator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mesa-25-v4-6-e62fc54a6efc@oss.qualcomm.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7351;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TpDVF17GiWy8Sl1jCvLnwhzsKR/c+EDTVo2aA9JEQss=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojXHOsXBA+r5M6n5p6vgJhQYERSSwvni4UJI
 Wb5UivnElaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1wAKCRCLPIo+Aiko
 1duqB/9aPTWsuJJ83asK5YySVI68NBTxDaBrRT/Q3tPwQX1dgOo/yn5JxuQubzLWNoK8Xl1UHOx
 HZRcMW3aOfpeD46WN5ufQXywrToxvvVvoG+ujGcFuylGT7S7lm6lzJgUhaVPc3TU0oQOjG0EAz5
 4rrprsdwXSxYoEw7AXuZGVIolu5Q7ihAO/5/BoFr5bv+zCxaVrYCBEpbfAXQwthflVQ2qeEZv1X
 9UDZAoq/3P7Pk6Wt9ImHJF/c2dnbJKbF+veTajaxTAIfqcgbb2D3UjRynB+gH1izMB/Ibn+/qOz
 7EnWuhjNanyHkVcNgpyXLSM3KAeIVnWO9W04hq4sTN3g7umX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HdNGUkzJwoMyXlBRw29_qko4WLfQVZpv
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67ea88f0 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pEjDCETy_axdY1vJs2YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HdNGUkzJwoMyXlBRw29_qko4WLfQVZpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213975

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
index 3ae920122248c1aa33b53bc34ecb8b5adc3b1c90..e869ecb30a5dad0aba0db9241824aa75cc47ac96 100644
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
@@ -56,11 +66,12 @@ def get_llvm_arch(bb, d, arch_var):
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
@@ -70,7 +81,9 @@ LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
-LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'clang', '', d)}"
+LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
+LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
 
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
@@ -136,7 +149,7 @@ do_install() {
     fi
 
     # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'true', 'false', d)} &&
        [ "${CLASSOVERRIDE}" != "class-native" ] ; then
         rm -f  ${D}${bindir}/clang*
         rm -fr ${D}${libdir}/clang
@@ -174,11 +187,12 @@ llvm_sysroot_preprocess() {
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
@@ -213,6 +227,17 @@ FILES:${PN}-staticdev += "\
 
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


