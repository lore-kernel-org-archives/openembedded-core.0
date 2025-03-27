Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29C5C36012
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 13:55:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50545.1743083741581711936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 06:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HSjCRFtW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jRnE012841
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2L1YqyzMcWE
	FSrFFjAKwckg73pcKfdXuizGOneATh9w=; b=HSjCRFtW4DJBFpAcN59EYK58RUV
	VbrH8YuPb5qs05BAP/kKMNSyQa+QxjEWTeCv9natT2XidOknERHLjgN+2A5+hJS5
	QK3qQuzy15txPaPF/oFdZJJWIdczl2RWHEeOm1A69WbyS+3qH2H/Ds04Rz+xeCQV
	XPxzl+eO/55wXVPdpNHDVAiDEswm8nAELeXQxd7YnoTcaso5O8xk+uGczzHm8c2l
	tKgnZhLHJreWjHCvSI5KN6aTWrcV9kPQTgtZG+C5VhCe5V8j/6TapeUVqvrHEKaq
	GfKXdwWSvhDVIl2VNBaAbPCi6xCZalfqYY+qwoI7xc7sJW6q0KTGaQf5Nvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutk4n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ed0526b507so16081746d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083729; x=1743688529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L1YqyzMcWEFSrFFjAKwckg73pcKfdXuizGOneATh9w=;
        b=bSmw1Yvx1zyBijK+6bADURAnurQAIJXZBsSEK3Zv++dxl4gFPODuvK73Kpu0d2t9SA
         ldHT8mQ+Zlq8rw2MPkWZ9LRZeMEP4//EEEC5B2CzRvKoOOg5Mz2WMiHU+LGHGEhebyvO
         AyFwU7Chv4F5sINlWLIXVxZFyJYAekc2OhNVa9wCd2UbZgNo9HOZhTBNAqsGKtEe5IsH
         Re1fCCpV9BXe33Y5ohHQ8ftPfPtKn4FFoWloG/uTe1RefFYuO0XMdpUAsFik6tpWXx6O
         PxYK7bzFP/bGN0m+Nm6AxDoQfJvLkuQD91/88KTGdPDIiN9Yty4VhmXRY8RGCKKtpu9N
         dikQ==
X-Gm-Message-State: AOJu0YwV7VFmM8TB+prw5vjhMhDD5CByebuyfLSMpUc6iLYDbn4TS+VK
	1cKoU3RV/01lgnPE9A62icR2wfEIY3EN5VNt//pAGM0YfLfhpwtQJpFKBH12BlkoaWuw6OkRdgG
	/4L24+Zmh5UslREAw95Oh0Y4nKNd7bDzVGHUcgT/ilVhDIBGhfYqdV4DNqVvGLHQwUbozwhG1DR
	Mcd/NIS5+/gvM=
X-Gm-Gg: ASbGncv94XLsl8FSsf4HXay08bzmWsWh9tV//j+kBg9KrMIGR24IeweJBogHjSWCqLQ
	RyFxPlP4e35sCPuFwzHZjl+V/ZJ5n9t+L4O9xJ8B4k50KdnYlWXiIXAzisMS6O3KRd+Jrem/5wb
	xUmMLK8X17eOrtS6d1+W3/Y0DDOq5VXvM6MwcQ6DKudmOUGAVxZMIyyPcXNUu3f0nia4Y2Fzjmx
	iBw/AGb1YnMOFA/3fVSFWSwWkcn3lJsfsT+P3BepktvgEEqnqiD/hV8vHha8V/Ka9YMZQPUV8Vc
	rABKX30vANmy5ivIzKSnU7i9wdBRnbIOYbHmmhQLGRioTswa6zJfRlua4aSrROJVR0n1PCo7MsH
	alHq3OoXGm/WCeEs38yUxNzZA2xUa
X-Received: by 2002:a05:6214:acc:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6ed2392f050mr45766026d6.39.1743083728761;
        Thu, 27 Mar 2025 06:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGswRBsVy98CTNEBzxmg1QckYC5TWLAkr/BvdFb1mTDtD0XsYKhLjfys6mMB65lc1wpTtMc8Q==
X-Received: by 2002:a05:6214:acc:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6ed2392f050mr45765586d6.39.1743083728129;
        Thu, 27 Mar 2025 06:55:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e70sm24288271fa.105.2025.03.27.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:55:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/8] llvm: add SPIRV-LLVM-Translator support
Date: Thu, 27 Mar 2025 15:55:17 +0200
Message-Id: <20250327135520.3920189-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a9kiJHzlGJvfeMS07iLCpmSylaOLKSWf
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e558dd cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=NxEeosk9xJlwc9cSGm8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: a9kiJHzlGJvfeMS07iLCpmSylaOLKSWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213738

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


