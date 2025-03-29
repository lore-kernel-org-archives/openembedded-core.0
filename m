Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C29DC36014
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.17861.1743278860009276325
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=P1tL7Lve;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TJOkPN013835
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyObMMbIWnDCspubLYE7fEt02BK6SyUeFrlsbTGApjI=; b=P1tL7LveZe3LYho3
	zIHnxbsIjn6qGZAmYOJ7NssmJE73RXR4++aT/lwN0lLgkV38ZtHtIuX3KzHx5k0R
	cMywdSQn8rCYeau5UeU4RUhgcpKZYc8OGfI+P/AmBb9EgN0ylR3Uwr2F8JQmaYk8
	AQ01rpAqm0mB4dSTb4ZHj6uNlFqdFQl/jrlFaxa0Jo8S/k6cm9wukvdsKSfs1MGt
	/0pRVGU2jP2qzXmZ0UXYmXUJQrbMmEW+UNcgILYNOFEUV7F9CPnMX37+8A/Dzna5
	u9UJvm2m4v8IAPDJd0Shadx9bLoFI42sneD4b8cnuMzE4EpJBCIPyCu1HE1C3RXs
	6K2fqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8xv98hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so503831885a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278858; x=1743883658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyObMMbIWnDCspubLYE7fEt02BK6SyUeFrlsbTGApjI=;
        b=erBdYatTWEnVkbsl1nePEAeZi+tqRUtp1TS3Uj+6yNl9aLaVdML6IXDKVCxpQLoERQ
         fHwLMYsnHa7OB5VqQ1rD2y2j8zBHyEJbkOzJwOVTdg6v47tDXjNpzGGSDSjE2/ARITuZ
         r83RTzzSdTu8r30+H0bdaIJQ23flJh+j4vTx1HYdGcOXEKG5eby7FPmDbp/39kRq03LB
         WkEW5/oJVl+0eosbhuoQXcHIObGBsdM39vpP62SNH1JsINWaILnuhWA4X2TuTaz9hXgd
         +ioCafkty2VFehtq/eMTFlGXW84blTviA2y/jsLdA6p3EFa/kWi5zYgW6bRwg4akrK8N
         pOIQ==
X-Gm-Message-State: AOJu0YwS/uF0tJFDzwcimb3NLtiknSXCrxuhtPxc/8NbyfxS11zfcKQZ
	ji2o1qv3hQvLZCQatd4gf4Pqk6jd/iszmcTmd4L4AO2Wa6bEN0UxCZILb6xb4RI8cxGsmE7jK33
	3dZ6iWbI35ad16ENrBssYwmhGz4TtplE1QkUZVOhRgD+VGHhs7uPPtoXxchR212i4kQJkKp81i0
	L0/gYuz3q8IQM=
X-Gm-Gg: ASbGncvcLOrHUJP5tsdYCmSZeIzR4QEQ85uft1WtAbe7QjM7ut08mKK4Drpa8mNeb44
	JhRAWX1T2WUTdsmI4QxFS8i1Sf76nobpjL4aGugJucLFzV/KLnlo2257drW6Mn3s4GH/wb3XTK6
	21IvON4p/Zw8rSaAvmMyr2rdmQD2PtgJ+KpkCtQaxYy5A2K8ftxdnsJteiw2mQXMazhBRXvivCd
	pz/99F1splx5w3tBdLe3hUniKlYJldIOyHdSUhDn6LFj8vJRwFm0k83KXJ64hRUNNuI9pgtQcrW
	zqCoYK46EhgjGrf78eV29eLTaWgwTM2gVxsawKfB/jIu+tMLFCd8Sb2Q8Y6mmtWZVqbwD8M/oqJ
	Q7P3rHfOAeStHEdmvM0qt7V9Kp6O2
X-Received: by 2002:a05:620a:2494:b0:7c5:99a6:a1ae with SMTP id af79cd13be357-7c67d22c22bmr488563185a.0.1743278857849;
        Sat, 29 Mar 2025 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvDwdTKorc+7HLCkvyWIlxfdZcLX0oZG7+/ZEp1V/QrUfcL/GhyPn7tO7pt7WvSBdWEyidiA==
X-Received: by 2002:a05:620a:2494:b0:7c5:99a6:a1ae with SMTP id af79cd13be357-7c67d22c22bmr488560585a.0.1743278857471;
        Sat, 29 Mar 2025 13:07:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 22:07:17 +0200
Subject: [PATCH v3 6/9] llvm: add SPIRV-LLVM-Translator support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-mesa-25-v3-6-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0t52XQmcNxbHcipnHSDPFwtUM4TdZrAWToPhySXflWI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL1GN9nC40FcdelvUAxla7OHUijYTXwGlMyM
 QRCaksRk56JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9QAKCRCLPIo+Aiko
 1eaVCACUrlwBTnEPimfxKEa0Eb+Vb5YWTb1+i3NW9r7d35AyBby7rtSX7ACZIeshNzq5opD3G+P
 dH4O3Bb2bpjPmkf9aXInf4TZ+HuuwEyuQTJdo7Ej+k5+a/YMOfjiR37QYDPZ9ooxUtz8PG748dx
 1EzayEvL7cW9ql0FKBDX6ZHO2BuQJ9bF5cCfT6e43Vkqi7FV294zxXQHFlRZH36gVsK7fFFG21a
 Fvs9/AgTHdWyS2Xeg0fk8ynLOtcqYAZ8vCc142YElm8nz2fNY3B09rrRDnyI6lAWl+ToG1GeINn
 axYpeD1ALfEB4hQ7dOUrfnS5v9rRyoIQad/nd1hoFCmMn8lN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3ks5AnL9BW5iHSLefA_qRZJ-adM3of_f
X-Authority-Analysis: v=2.4 cv=PquTbxM3 c=1 sm=1 tr=0 ts=67e8530b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=xUEQSCNU_4zy9qS9kesA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3ks5AnL9BW5iHSLefA_qRZJ-adM3of_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213900

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
 meta/recipes-devtools/llvm/llvm_20.1.0.bb          | 34 ++++++++++++++++++----
 2 files changed, 59 insertions(+), 5 deletions(-)

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
index 84345531714baa308077ff55b90d015f6fa167e6..9ae5a5d380f074d942c94d4169671f42355c20dc 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -23,9 +23,18 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 
 LLVM_RELEASE = "${PV}"
 
+SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
+SPIRV_BRANCH = "llvm_release_200"
+
+SRC_URI_SPIRV = " \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
+    file://spirv-internal-build.patch \
+"
+
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'spirv', '${SRC_URI_SPIRV}', '', d)} \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
@@ -56,11 +65,12 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
-PACKAGECONFIG ??= "libllvm libclc"
+PACKAGECONFIG ??= "libllvm libclc spirv"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
 PACKAGECONFIG[libllvm] = ""
 PACKAGECONFIG[libclc] = ""
+PACKAGECONFIG[spirv] = "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. ,,spirv-tools-native spirv-headers"
 
 #
 # Default to build all OE-Core supported target arches (user overridable).
@@ -70,7 +80,9 @@ LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
-LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv', 'clang', '', d)}"
+LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
+LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
 
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
@@ -136,7 +148,7 @@ do_install() {
     fi
 
     # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv', 'true', 'false', d)} &&
        [ "${CLASSOVERRIDE}" != "class-native" ] ; then
         rm -f  ${D}${bindir}/clang*
         rm -fr ${D}${libdir}/clang
@@ -174,11 +186,12 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
-PROVIDES = "libclc"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc ${PN}-spirv"
+PROVIDES = "libclc spirv-llvm-translator"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
 RPROVIDES:${PN}-clc += "libclc"
+RPROVIDES:${PN}-spirv += "spirv-llvm-translator"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -213,6 +226,17 @@ FILES:${PN}-staticdev += "\
 
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


