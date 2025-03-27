Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA8DC36011
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.48942.1743079043570422028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=k/WLHn6J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jF4P010192
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2L1YqyzMcWE
	FSrFFjAKwckg73pcKfdXuizGOneATh9w=; b=k/WLHn6Jov8nNc187dXVMhnirdP
	5lBa9KdjA7zq2npZqcfBCzzOVO3WlT2Rr+lZfoKJEeclZGCLyJ3pCxY1ugsexDxY
	ihHPkkJ8X3xupjQXJHB7MzXhrqp2S30b7M+/EOzLq/K8eFkv/BTZA/+063sJXkKW
	Uix28BSDNCyE8H/E2EW8ANoonZZBLeyxRDK7A3KweMjmjiAk6M2f1yU8GlLVkXND
	AaQ4cDJdWth0A3HiDwituh/rVsD8ib0FDcARTLkcfSz9CXo5FaQOQnOxlgtQEqwI
	QJAua+2gb3IrUJDbwqEgVZDyYFaDw4KzK/z20vcHxZfyypK+lfgeMMFZIhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcygkfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so48894385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079041; x=1743683841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L1YqyzMcWEFSrFFjAKwckg73pcKfdXuizGOneATh9w=;
        b=i6WMIzgX0+qHKFSKlsXjT9OHNJ1EQu/dpI1BSWrDWP7igdwLP6zz9OfwmKSJVjTYfR
         SNoUFmsyEXfgHOHqp3+3iVNwAqWyzJrY3Hbqq1uFGpdIUvpmuWO5HX+VbHx90q407xV8
         LOsHsx8RO1vNsARTS6HnSlOMPRxW4k6U4L5kUiXvWZ/TIECpijOFrGjwm9I+J6/zzHJ6
         +94FrBPAvf2mfYbjOAd16qq4nYO1ANECkkSiadEDT8wizNTeA7jNtunsEHn5Qp+Ppyor
         OCpi9QScX/Dp31Jzw8lrZDFLGPkJojkGmUEMyPSJ1kxtq2TJugvE39xXbmEAa1aMtADG
         D1sQ==
X-Gm-Message-State: AOJu0YyGPv8Q0Z1d8QEHsCPECFJEpfT6Df0ZvFvMabYt5SNLboQM8V+O
	kVBZv7fPeXh9Fu8DGED/wpvvSS1QPd4mZjOqLWvLuFqMY7meqgZID0AdSIrTwE9Ji6e4PXRFULk
	fzTLrRJ2ctWVPcvskCjUX/5RLttnFGeBLU6rbvHxAkale8BIb4uYR82PC8Bi9hSjjZZdQlHJNW4
	eiIK3ae9NInDg=
X-Gm-Gg: ASbGncsrdtuksDvJf5bqJKhuYOLUGx7wel2yR1HXRY6k/enGwo6RloWCnT3djpq7Nqh
	zdqvYxI3tnt3I0iBjkAsdlVzq9JzoL9eRodJHiYWOBgCrRNeHsYZd5zLwiY1I87Co1cET7bT5fG
	CJO4mWSKvbRAFp41VK40aPuNL2mljr+iMIZ15V9mi2Ko0m6AFgogSSU60xWFrR9QiVzFX2uevxB
	xZ90rZZBiZ6rBtw1A6sh5wF9lrbUHaflyQGu1XibXdHkZCq52X2MTnnPhkP1XhPHsEcF+SiI9qA
	fOXQXARBJV6XCAXzd2sFUvkvTu0jporSNB8jmoC8j/QfnM7c/w3/yKeju6n5kbIYIPKvWLzrwMU
	8mLZZobyKcbq6zRedxR13HKvdfOTO
X-Received: by 2002:a05:620a:2492:b0:7c5:ad3c:8478 with SMTP id af79cd13be357-7c5ed9f4f9cmr446326085a.16.1743079041015;
        Thu, 27 Mar 2025 05:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqP1InmEz0+L4+Xs620KCQ1kDBbRciPknm16DYkl0bZTuqWHmI9jE5uAq3KwAUxk0fHhr9dg==
X-Received: by 2002:a05:620a:2492:b0:7c5:ad3c:8478 with SMTP id af79cd13be357-7c5ed9f4f9cmr446321785a.16.1743079040446;
        Thu, 27 Mar 2025 05:37:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65121e2sm2053600e87.235.2025.03.27.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:37:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/8] llvm: add SPIRV-LLVM-Translator support
Date: Thu, 27 Mar 2025 14:36:58 +0200
Message-Id: <20250327123701.3906604-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e54683 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=NxEeosk9xJlwc9cSGm8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nxlkp8VeSL30fbHcmit9OMkIEtY5nt0q
X-Proofpoint-GUID: nxlkp8VeSL30fbHcmit9OMkIEtY5nt0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270087
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213745

Mesa builds require SPIRV-LLVM-Translator in order to build CLC support.
While it is possible to build it separately (like meta-clang does), it
also requires a separate clang compiler (which OE-Core doesn't provide).

Use an alternative path and build SPIRV-LLVM-Translator as a part of the
LLVM build process, lifting the requirement for the separate clang. Once
clang is properly integrated into the OE-Core layer, this can be split
to a separate package and dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...ossCompile-pass-SPIR-V-headers-path-.patch | 40 +++++++++++++++++++
 .../llvm/llvm/spirv-internal-build.patch      | 27 +++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.0.bb     | 32 ++++++++++++---
 3 files changed, 94 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-cmake-modules-CrossCompile-pass-SPIR-V-headers-path-.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-cmake-modules-CrossCompile-pass-SPIR-V-headers-path-.patch b/meta/recipes-devtools/llvm/llvm/0001-cmake-modules-CrossCompile-pass-SPIR-V-headers-path-.patch
new file mode 100644
index 000000000000..316a6bdbf2b1
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-cmake-modules-CrossCompile-pass-SPIR-V-headers-path-.patch
@@ -0,0 +1,40 @@
+From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 21 Mar 2025 17:17:52 +0200
+Subject: [PATCH] cmake/modules/CrossCompile: pass SPIR-V headers path to
+ native build
+
+In case LLVM is being built together with SPIRV-LLVM-Translator, it
+might be required to pass LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR define
+to the native build too. Extend native build setup to pass that variable
+to the called cmake too.
+
+Upstream-Status: Inappropriate [OE-Specific build-system fix]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ llvm/cmake/modules/CrossCompile.cmake | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/llvm/cmake/modules/CrossCompile.cmake b/llvm/cmake/modules/CrossCompile.cmake
+index 3b31d3e218a3..24b62f4ff8af 100644
+--- a/llvm/cmake/modules/CrossCompile.cmake
++++ b/llvm/cmake/modules/CrossCompile.cmake
+@@ -81,6 +81,10 @@ function(llvm_create_cross_target project_name target_name toolchain buildtype)
+     set(libc_flags -DLLVM_LIBC_GPU_BUILD=ON)
+   endif()
+ 
++  if (LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR)
++    set(spirv_headers "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR}")
++  endif()
++
+   add_custom_command(OUTPUT ${${project_name}_${target_name}_BUILD}/CMakeCache.txt
+     COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}"
+         -DCMAKE_MAKE_PROGRAM="${CMAKE_MAKE_PROGRAM}"
+@@ -101,6 +105,7 @@ function(llvm_create_cross_target project_name target_name toolchain buildtype)
+         -DLLVM_INCLUDE_BENCHMARKS=OFF
+         -DLLVM_INCLUDE_TESTS=OFF
+         ${build_type_flags} ${linker_flag} ${external_clang_dir} ${libc_flags}
++        ${spirv_headers}
+         ${ARGN}
+     WORKING_DIRECTORY ${${project_name}_${target_name}_BUILD}
+     DEPENDS CREATE_${project_name}_${target_name}
diff --git a/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch b/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
new file mode 100644
index 000000000000..14233d312870
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
@@ -0,0 +1,27 @@
+From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 21 Mar 2025 17:17:52 +0200
+Subject: [PATCH] SPIRV-LLVM-Translator: fix handling of built-in SPIRV targer
+
+Upstream-Status: Pending
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+Index: llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
+===================================================================
+--- llvm-project-20.1.0.src.orig/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
++++ llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
+@@ -116,6 +116,14 @@ if(LLVM_SPIRV_BUILD_EXTERNAL)
+     set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
+     set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
+   endif()
++else()
++  message(STATUS "Internal LLVM library")
++  is_llvm_target_library("SPIRV" spirv_present_result INCLUDED_TARGETS)
++  if(spirv_present_result)
++    message(STATUS "Found SPIR-V Backend")
++    set(SPIRV_BACKEND_FOUND TRUE)
++    add_compile_definitions(LLVM_SPIRV_BACKEND_TARGET_PRESENT)
++  endif()
+ endif()
+ 
+ set(LLVM_SPIRV_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 0fb336ee7747..df2c497c14cc 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -23,10 +23,20 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 
 LLVM_RELEASE = "${PV}"
 
+SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
+SPIRV_BRANCH = "llvm_release_200"
+
+SRC_URI_SPIRV = " \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
+    file://0001-cmake-modules-CrossCompile-pass-SPIR-V-headers-path-.patch \
+    file://spirv-internal-build.patch \
+"
+
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://fix-native-compilation.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'spirv', '${SRC_URI_SPIRV}', '', d)} \
            file://llvm-config \
            "
 
@@ -58,11 +68,12 @@ def get_llvm_arch(bb, d, arch_var):
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
@@ -72,7 +83,9 @@ LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
-LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv', 'clang', '', d)}"
+LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
+LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
 
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
@@ -147,7 +160,7 @@ do_install() {
     fi
 
     # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv', 'true', 'false', d)} &&
        [ "${CLASSOVERRIDE}" != "class-native" ] ; then
         rm -f  ${D}${bindir}/clang*
         rm -fr ${D}${libdir}/clang
@@ -176,11 +189,12 @@ llvm_sysroot_preprocess() {
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
@@ -215,6 +229,14 @@ FILES:${PN}-staticdev += "\
 
 FILES:${PN}-clc += "${datadir}/clc"
 
+FILES:${PN}-spirv = " \
+    ${bindir}/llvm-spirv \
+    ${includedir}/LLVMSPIRVLib \
+    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
+    ${libdir}/libLLVMSPIRV* \
+"
+
 INSANE_SKIP:${PN}-libllvm += "dev-so"
+INSANE_SKIP:${PN}-spirv += "staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


