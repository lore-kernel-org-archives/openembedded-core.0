Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13E2C3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42854.1744019308148104263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FNUPdZoM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378do5S001272
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtChWNyOaM+dPsI1MwbvsDh0QJuJzZcYwfoqOVK3Rsc=; b=FNUPdZoM53duf/g1
	ndp6xO3oG9YP34yxF4wi0A1jwqEgMfi6S4C53rqlNHJp9DjSrbb+Om0PT2ZaWf5s
	cfjBjAIpJBm3qQX/RZNMsPHNr8xdhOmyDKNoDBX49T56uBk/9AoEumqcRN43VCMG
	FWoiygAxhh/CyFPMyTH3u4vJ2yNPGCdEF1ee3c3ATTFIcv1YolCNcQyzYuP4gxIZ
	478YHnVybeEeC7/B04w39UVet33obltXJ+Kf/zqEabSSKNDnaCoZswU0Nm0Bu8et
	XEjXW2k4wsrUUK5p64MoT23ybaBl18sncpZea1qFjvnd6ndLeiK1WVh6pdtbakYB
	8Dfy0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkbrdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so1275255985a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019306; x=1744624106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtChWNyOaM+dPsI1MwbvsDh0QJuJzZcYwfoqOVK3Rsc=;
        b=v4zahYCsJ+qzcM9nosbM1JZxgd3dX32PIXWxBr9vePeFCfCK85tRAmyE0Ior0s4fA9
         rnarMXIQ//gRGyEWeoV80Z6rqt4n8Z9GllLQ8hQVmaOelFE0M1rjP/vphx7fl0Lktsnn
         ZvO55ORIpNAfDiM4JhojVaORo8viZjVm6fcSjJ9Vf6Fvf5XZ6JdTeUkBnVIKfDkDU3fs
         cJ1cRw0V9omt/FgZgeIWRj01GmjXjktSNnWsVp4jHn8S8Zv1mfzrTdQmDSqC3wPO9ris
         Vui5RacrCeFG2aBlj9rdPoE/UF+0OpFQFboSw5VgIn/SwgxDoxS3Vchi41xoqY5u5GGy
         gP8g==
X-Gm-Message-State: AOJu0YzreN1KVQ9yKjuiCUKC7swLa/zZP/vCTrctV6cxX1kOz1PHXQPM
	X084RGrduDbkNaPgmWhdySX7y7AfvLr0em5T4v8ulGOHvpsa35uRlHn9qtnKZOLKcm4rvyqVdJj
	UE5lNnqqbj/DazOE0B8FcrXMnvqzJeV+ilZfdtwgK+m6ETzXfb2cqybsBLJGDeww8Z6k/e5ovzR
	pA72Zx5CU+x/o=
X-Gm-Gg: ASbGncufj2kM6HACGZ1EH29Ukf/WTWIoPZ8umM5WmXfXwd27H/k7e4FbwbOZ+v0GgpV
	oTGQbEsupaGwSdr83qoczhBT2ZrUBEnYona/WasnXVuiOHs5Bn5fDkxgZUnJvSg8jjTf686314t
	VRcQSFJMNlytw1MYdtALbsnyd30FnBougpSlezjVcfPTjayKa7MKceRA/qR+AbacvRENjn8ZeVy
	p/HIb9BoAgT7oDZIDDw9NmSxPc452lPeVZs/3knCTqGaT2yEwFrXCheTtU9GczSHtd16tlPlgXs
	abCH7W0LCc8U6LeAViNZZiV1D0+0rKTBp01epxm9iAV86+5ZpVrGpxDEyjTe+xdrSbCEUeficKh
	MuwUWI+dFfl15FXnv+ovfn5Kh8tbN
X-Received: by 2002:a05:620a:2942:b0:7c5:5f58:9158 with SMTP id af79cd13be357-7c774d14899mr1944568185a.9.1744019305749;
        Mon, 07 Apr 2025 02:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhNz7YL3Ih2PRAsxBjOpD2r6sXshlte0+CW5UxcDRpBUUsnQbr5Kr0VeerjCdMf6CsGLhZWg==
X-Received: by 2002:a05:620a:2942:b0:7c5:5f58:9158 with SMTP id af79cd13be357-7c774d14899mr1944565685a.9.1744019305249;
        Mon, 07 Apr 2025 02:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:14 +0300
Subject: [PATCH v6 09/13] llvm: add SPIRV-LLVM-Translator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-9-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7324;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qUW7WsN2NlT12QGb7KX7tbK078K/1EA7UCIFm3Q1oMY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859YxPk3kzn3J8peMhekpXGdZc1VdOTeUyZfV
 tZXbpRafBKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfWAAKCRCLPIo+Aiko
 1TmbB/4w171u2BF3LjpzRqe1HpqcweFQjB3qvLyyEQqnXCbKvXy03xetBDzYp/u/jDlUz/qcrdA
 f7L5IxkQQ32mG7qmisUsblwZ/4cfgqrIm42eZLri4WZKm9ea0AdUqkiYY05vrIPphhLTjCm1cN/
 EBgbz+HuPbANrlgA+z0W+pBprttWd3IlwKm+zSJT8u42Ae7ic38J4H68R2lnbMX4D9kSL6Cdc2F
 1dXp/Yq2HCGP4UcEBUQ5zI/aLcYTGXR6m2crFUGpid7HVrG5fEXJ6dZXiG1vbPefMmZS5z3vEDv
 uXrWDajtSAhKk35M0YNJf5RLVqo1QHa7Nj1ucwEO4du0NgNa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bssyg6uWMIkLtG2gW9_pcNv7xJfZAmW1
X-Proofpoint-ORIG-GUID: bssyg6uWMIkLtG2gW9_pcNv7xJfZAmW1
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f39f6b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pEjDCETy_axdY1vJs2YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214438

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
 meta/recipes-devtools/llvm/llvm_20.1.1.bb          | 35 ++++++++++++++++++----
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
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index d33284c90180de60d5087b466304a94bd8ae6039..027de04bdd6d340792d1a9ca303dcd508a6d87c4 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
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
            file://isoc23.h \
            "
@@ -59,11 +69,12 @@ def get_llvm_arch(bb, d, arch_var):
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
@@ -73,7 +84,9 @@ LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
-LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'clang', '', d)}"
+LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
+LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
 
 BUILD_CPPFLAGS += "-include ${UNPACKDIR}/isoc23.h"
 
@@ -141,7 +154,7 @@ do_install() {
     fi
 
     # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'true', 'false', d)} &&
        [ "${CLASSOVERRIDE}" != "class-native" ] ; then
         rm -f  ${D}${bindir}/clang*
         rm -fr ${D}${libdir}/clang
@@ -179,11 +192,12 @@ llvm_sysroot_preprocess() {
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
@@ -218,6 +232,17 @@ FILES:${PN}-staticdev += "\
 
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


