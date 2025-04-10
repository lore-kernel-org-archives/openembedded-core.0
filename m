Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68462C369A1
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.25485.1744253714792923670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OpwKDWhF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIqDN032322
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNz6I1ZvS1hLdIHbCmOWgxa5PB0vWeik4eWlng/fYUM=; b=OpwKDWhF30kMLKVx
	Lbw6xFQamvQwaz+VdS/6ilqmEeGFZf0YPRQo8YpoAXa2yxT+axtKMAZoqQw/Dh8J
	Gb8gwQBZs8tPdu0IY7vjqxvhQLJCUIte13aix00vZMtuobi1pvd9N4GZCJ9jpqcL
	m46T2NFmmHnRmBmDAZ1JFiBDBhcQz8XO6WaklOIJQsPSsaRxlThp/x2afxukOVjW
	4K/ObaVq7nRogk9yClQtct/g+PWZQ8Qg4lSDZhndINmm+mcYIbuewYPmzn/Nng3Q
	iriJfwlrhR9Kp2fogr2xwtyaH92OE72k+4VzGng+0kVUmednlvnmlPovEImYPxIi
	66MqIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedfg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c548e16909so33101585a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253712; x=1744858512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNz6I1ZvS1hLdIHbCmOWgxa5PB0vWeik4eWlng/fYUM=;
        b=JSje8cokilY47HmizuXQuCJEcq/UHIajXadMzMoZb46QwbXsm5OXr8vMAhLp1CfUsx
         WaAWCiN099aJ0KpvZVwPiHlwqALoqLatwjL3QdYZHKNSSn7DXWeZafoE4TWn5EMH6YBA
         q0kXhb3RMUEfJ6oIqmHZUmGZSBN0Qo1FWz8x/hZGF6mu0NPL0HjtUmJ1BwWWuV67vpNb
         klqEb4Zdenc30A1CLNPS7p3ai9XpNeS4A8wiyzh6YmK7H+bW1McYaWdQXwN4aYc142Cc
         exnaaTAkabvxBGPzXgytjBNqUZNNnC3fFtwbvSL55uQurxJjYuZmtRdlAa4xcYtOS3bx
         rvpg==
X-Gm-Message-State: AOJu0Yz3OvObHLnzrXRyDFd/zvEbDFoH3kvJ5f7NemcWS/2DugJWSijd
	2aRfPXbj12eE5ThaU/x++uIzxgbIsbCrqC36xpeOwYdoOfAVfPWMrGL0MutkPjBmLspVWHSHd1I
	lrpkVWZbdZ5v+BYD0FM8RFQv+QmncZumdCGcE9tJjITdoMp3BZxoS7flTzhHsTZu8StXOSpYnOC
	E5AsKMTLmaUK0=
X-Gm-Gg: ASbGncsJNOTqO597yQe67GsWwTxPAGRirYjuOffvilT9lqYKNSOmtuYcq9Br2VFIOJ2
	kNh+kuN1RA3ow3RE4ld3/a5iNdeOyEwFsRNXekSKNG4ur6hxonvUGgzLFLOuIfG78+lZZb6CSJ7
	5UYmt3WsgMcHckeQaFyD7Q2IzzQ6BdfCJqlCT2S30SDQ4VdSVqFgCc0+3FhnaMi9s3BP3HXzFWC
	EYnsnEjt+WRk/moMQqXUN3azvJQUeRHaWzxBH40o+g0qvxUyHJ0RwUFq9gsiKKt/KtNR1BPNW+L
	XoagubipsY6W4iKbCj8nmIHoIzYcil/H94KJAZIFvtW0trLNkx/59Jwwb+WBlhOxVXkdlJxlgZZ
	KzDJ/jcEB8T55U6BInjyXXroO
X-Received: by 2002:a05:620a:2905:b0:7c5:602f:51fc with SMTP id af79cd13be357-7c7a81afe00mr108011585a.44.1744253711840;
        Wed, 09 Apr 2025 19:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb6jSBPgbRLvmWgK43JtT5Xrwm0Q0AaoA9SJrrnyzJXiWcuYmSHiRyeNFzqKY3GonhX7WcHA==
X-Received: by 2002:a05:620a:2905:b0:7c5:602f:51fc with SMTP id af79cd13be357-7c7a81afe00mr108009485a.44.1744253711389;
        Wed, 09 Apr 2025 19:55:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:55:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:47 +0300
Subject: [PATCH v7 08/12] llvm: add SPIRV-LLVM-Translator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-8-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2hkD9pj+wkIMchYxle3fOsartziKUtRt6e+7gy1GX9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLxbgsU4ARpIQ7YZz2U72wKKtrI0cgkj4ooh
 gPlmISFvL+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8QAKCRCLPIo+Aiko
 1RJiB/wLPYuVFV+X619RfDxzeEEdCFoRTDNdzMwVdhHNdL9hTveR4xJbhC75RgGcGL68RhngGn+
 KgeYKpPOF7rEuM8MkMg90uHhg09BXMQylZqDvBCp2whSdtzLx8iqRPhiWnX9h+SbA1EblBI1eNL
 zM7Yj5Htl4NZ+2GELjSb12UG7msB/mq/vRlnZmfxLJ8fcyaucEMSL7I6vEjN1tYirwvnC16TcLQ
 6a0PukK+aUZRpQRBnV/YBw3CVU94VlK6Yh4YGpnVS6lJx+sTXXdTQEUxqL49PHLKAXOy3M0snQy
 3Fiom62wykiQcmQrKsvekfoNxjiXHYm2GaN7zaQwVPWekNC+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zoWU1WhLWuqp3uporAMC3_n1pFGsiY4J
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f73312 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=NxEeosk9xJlwc9cSGm8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zoWU1WhLWuqp3uporAMC3_n1pFGsiY4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214610

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
 .../llvm/llvm/spirv-internal-build.patch           | 30 +++++++++++++++++
 .../llvm/llvm/spirv-shared-library.patch           | 25 ++++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.1.bb          | 39 +++++++++++++++++++---
 3 files changed, 89 insertions(+), 5 deletions(-)

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
diff --git a/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch b/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch
new file mode 100644
index 0000000000000000000000000000000000000000..edc595d57699a682e62f3b3b1cf999e409060226
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch
@@ -0,0 +1,25 @@
+From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Thu, 9 Apr 2025 15:20:32 +0200
+Subject: [PATCH] SPIRV-LLVM-Translator: build shared library
+
+By default SPIRV-LLVM-Translator builds only a static version of the library.
+Unfortunately this might result in linking erros when uninative is in play, if
+libLLVMSPIRV uses symbols which are provided only by the uninative libc and are
+not provided by the host libc.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+Index: llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
+===================================================================
+--- llvm-project-20.1.1.src.orig/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
++++ llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
+@@ -42,6 +42,7 @@ set(SRC_LIST
+ )
+ add_llvm_library(LLVMSPIRVLib
+   ${SRC_LIST}
++  SHARED
+   LINK_COMPONENTS
+     Analysis
+     BitWriter
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 736eeb944f033c909a77fc552c83ab253f84398a..d1a7d8d7e9144beda8f6195aff096521632c466c 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -23,9 +23,23 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 
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
+SRC_URI_SPIRV:append:class-native = " \
+    file://spirv-shared-library.patch \
+"
+
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator', '${SRC_URI_SPIRV}', '', d)} \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
@@ -58,11 +72,12 @@ def get_llvm_arch(bb, d, arch_var):
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
@@ -72,7 +87,9 @@ LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
-LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'clang', '', d)}"
+LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
+LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
 
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
@@ -138,7 +155,7 @@ do_install() {
     fi
 
     # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'true', 'false', d)} &&
        [ "${CLASSOVERRIDE}" != "class-native" ] ; then
         rm -f  ${D}${bindir}/clang*
         rm -fr ${D}${libdir}/clang
@@ -176,11 +193,12 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
-PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc ${PN}-spirv"
+PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc spirv-llvm-translator', d)}"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
 RPROVIDES:${PN}-clc = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
+RPROVIDES:${PN}-spirv = "${@bb.utils.filter('PACKAGECONFIG', 'spirv-llvm-translator', d)}"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -215,6 +233,17 @@ FILES:${PN}-staticdev += "\
 
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


