Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20007C36012
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.48939.1743079038152654538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c6DFyzTl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jaKj006075
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AkTOh9tAbmi
	gNSP4S5+Szfi+tsJ/KboFvALsFtkOZPA=; b=c6DFyzTlSbhUgrWFYTTXvQbOghs
	HL/sIfK6ii+cz3P5BYr3MzqW1kXX275S62sKUP4S5a1LbdPBx8LTcbkvsDI+oBOo
	2J+448AjkkBvKFT/aZeCsh17j9nXLQkCYLHZ6ghGcCGznsFUBynGqrli0Gu+MT/d
	E15Ywjzv3Yrv+LIQFxHPkklkKeRFcyWsHCmSv0/4oWjrmgmso5EA4/zAJ+9lAnnR
	IW6v38FV0UcuqipyQbbFFSwsKCqY4NOYTOjTbTli1jYiiqKh025zqNtIpRhrExc1
	c5VMeamaa+qED9kjg7szfL3YmpQxsvbYcPQqA7u9CwNJwcqYUBd/0NEG2WQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenfbcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ba3b91b1so181075385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079036; x=1743683836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkTOh9tAbmigNSP4S5+Szfi+tsJ/KboFvALsFtkOZPA=;
        b=wTFYziIoxx4UhSjJvBcGE3F7tMOLi16Lcg3zeLRgoJJh+vmKf5ly/FHFS6WF2jNq1N
         dVYpVmOJbjSCgVmTOxaOoHdpHvQY5b46QQKqu+nRrjJdjK6ddN8ROh8Hu77rm670Ajcr
         c8CZa28O7ij4oRVVuA8EI1hrcS/koQxPcFqLdFY7br/b9BDn37vo48/zzmjLuBUB799X
         GfNgpDQz95aYswifLFS0GA73qMpl4ZJypD7WLRSC8kNk8eAmZqaTzuUfUVgDVPFNMQgU
         0scSrCRnMepgslm2DKRxfWN7cDOUr5A2m+nMX4/LEtiUyWQQFEe4xoHfwNcmbEqR/cjM
         n4Xg==
X-Gm-Message-State: AOJu0Yz3GpL55D0sXg/WBuA2E/5qxQdGIklW3a39gr3m2F30mFF5UiC6
	V2JLL9OzBFDJdP4M2VTKDVmpbR67XL6ZgwJdesolFP5/xnYEbfLOP67+vlW8CHCxY96Tk8VMsi6
	P8aGdnW0capxXoZfaNdHIkw3OxxEyafcs9we6cpbAVkKw9MevaI7qPVEj44Ps6r0Q2HDSwusJVu
	LLjFCyfdMUx2w=
X-Gm-Gg: ASbGncuUrt/rkM+b/DA7JGuw1RHrOQrrbBzVKLCRPNVxx/UIbaNgfao6WR+bJIY3JT4
	VXLxJA13ZHUn3Z3fRSrU5EQNQ06vhP0Xzpt6111p3Qg4PfWPVmuCylyD3J0py6qmIAV7VddoxJT
	/Z6t5W2NNEy4csamjtJ4LeHZjsvyBDV7+RXexT1TdzutzvzZBi69vuUeyM7dKDfFX2lB+JIHF91
	1QZZx8TGRhrC496wJGE2r9GhNkZMehJIAmY3hOi67wjp+wsPJ0x3y61sbT+08euTIMUZE2Mjqet
	jKv0/H+iItg1wXcfcv2Sb/MVB8mfk3ZSIluSiU625z3EzP5rS3tAsPRU6VZuDk7nmFHApiA2Hvd
	XNhPd9irgK/TDy9Ebx6m79CUeBJTl
X-Received: by 2002:a05:620a:d86:b0:7bc:de68:e932 with SMTP id af79cd13be357-7c5e49344admr1017237485a.23.1743079035922;
        Thu, 27 Mar 2025 05:37:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErZjZiDU0JHmWBjkW0E7cpf3vldt5ZljfLJgiEAcKFHzIR51ZCOfmOE3B1IBL+7vkjKQLanA==
X-Received: by 2002:a05:620a:d86:b0:7bc:de68:e932 with SMTP id af79cd13be357-7c5e49344admr1017232985a.23.1743079035319;
        Thu, 27 Mar 2025 05:37:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65121e2sm2053600e87.235.2025.03.27.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:37:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/8] llvm: support building libclc
Date: Thu, 27 Mar 2025 14:36:56 +0200
Message-Id: <20250327123701.3906604-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e5467d cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=EUspDBNiAAAA:8 a=YiW2yjIvKM0L5YyyVhYA:9 a=a97rIl97qucA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-GUID: nwnRSBgRvkjE9qIn1gfLcBSb9TTtYseB
X-Proofpoint-ORIG-GUID: nwnRSBgRvkjE9qIn1gfLcBSb9TTtYseB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270087
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213743

Current Mesa requires libclc in order to build Intel Gallium (iris) or
Vulkan drivers. In order to unblock Mesa updates, build libclc (and
clang) as a part of the build process. Don't install clang into the
target system, it is only used during the build process. Proper handling
of clang as a toolchain is a separate and much more complicated topic.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../llvm/llvm/fix-native-compilation.patch    | 67 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.0.bb     | 43 ++++++++++--
 2 files changed, 106 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/fix-native-compilation.patch

diff --git a/meta/recipes-devtools/llvm/llvm/fix-native-compilation.patch b/meta/recipes-devtools/llvm/llvm/fix-native-compilation.patch
new file mode 100644
index 000000000000..4d51b6617cc4
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/fix-native-compilation.patch
@@ -0,0 +1,67 @@
+From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 21 Mar 2025 17:17:52 +0200
+Subject: [PATCH] cmake/modules/CrossCompile: fix NATIVE build setup
+
+Fix variables being passed to cmake when generating NATIVE build dir.
+
+Upstream-Status: Inappropriate [OE-Specific build-system fix]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+Index: llvm-project-20.1.0.src/llvm/cmake/modules/CrossCompile.cmake
+===================================================================
+--- llvm-project-20.1.0.src.orig/llvm/cmake/modules/CrossCompile.cmake
++++ llvm-project-20.1.0.src/llvm/cmake/modules/CrossCompile.cmake
+@@ -23,19 +23,37 @@ function(llvm_create_cross_target projec
+   if (EXISTS ${LLVM_MAIN_SRC_DIR}/cmake/platforms/${toolchain}.cmake)
+     set(CROSS_TOOLCHAIN_FLAGS_INIT
+       -DCMAKE_TOOLCHAIN_FILE=\"${LLVM_MAIN_SRC_DIR}/cmake/platforms/${toolchain}.cmake\")
++  elseif (${target_name} STREQUAL NATIVE)
++    set(CROSS_TOOLCHAIN_FLAGS_INIT
++      -DCMAKE_C_COMPILER=\"${LLVM_NATIVE_C_COMPILER}\"
++      -DCMAKE_CXX_COMPILER=\"${LLVM_NATIVE_CXX_COMPILER}\"
++      -DCMAKE_C_FLAGS=\"${LLVM_NATIVE_C_FLAGS}\"
++      -DCMAKE_CXX_FLAGS=\"${LLVM_NATIVE_CXX_FLAGS}\"
++      -DCMAKE_EXE_LINKER_FLAGS=\"${LLVM_NATIVE_LD_FLAGS}\"
++      )
+   elseif (NOT CMAKE_CROSSCOMPILING)
+     set(CROSS_TOOLCHAIN_FLAGS_INIT
+       -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
+       -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
+       )
+   endif()
+   set(CROSS_TOOLCHAIN_FLAGS_${target_name} ${CROSS_TOOLCHAIN_FLAGS_INIT}
+     CACHE STRING "Toolchain configuration for ${target_name}")
+ 
+   # project specific version of the flags up above
+   set(CROSS_TOOLCHAIN_FLAGS_${project_name}_${target_name} ""
+     CACHE STRING "Toolchain configuration for ${project_name}_${target_name}")
+ 
++  if (${target_name} STREQUAL NATIVE)
++    set(cross_flags
++        "-DLLVM_DEFAULT_TARGET_TRIPLE='${LLVM_NATIVE_TRIPLE}'")
++  else()
++    set(cross_flags
++        "-DLLVM_DEFAULT_TARGET_TRIPLE='${LLVM_TARGET_TRIPLE}'"
++        "-DLLVM_TARGET_ARCH='${LLVM_TARGET_ARCH}'"
++        "-DLLVM_TARGET_IS_CROSSCOMPILE_HOST=TRUE")
++  endif()
++
+   if (buildtype)
+     set(build_type_flags "-DCMAKE_BUILD_TYPE=${buildtype}")
+   endif()
+@@ -91,12 +111,11 @@ function(llvm_create_cross_target projec
+         -DCMAKE_C_COMPILER_LAUNCHER="${CMAKE_C_COMPILER_LAUNCHER}"
+         -DCMAKE_CXX_COMPILER_LAUNCHER="${CMAKE_CXX_COMPILER_LAUNCHER}"
+         ${CROSS_TOOLCHAIN_FLAGS_${target_name}} ${CMAKE_CURRENT_SOURCE_DIR}
++	#${CROSS_TOOLCHAIN_FLAGS_INIT} ${CMAKE_CURRENT_SOURCE_DIR}
+         ${CROSS_TOOLCHAIN_FLAGS_${project_name}_${target_name}}
+-        -DLLVM_TARGET_IS_CROSSCOMPILE_HOST=TRUE
++        ${cross_flags}
+         -DLLVM_TARGETS_TO_BUILD="${targets_to_build_arg}"
+         -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="${experimental_targets_to_build_arg}"
+-        -DLLVM_DEFAULT_TARGET_TRIPLE="${LLVM_TARGET_TRIPLE}"
+-        -DLLVM_TARGET_ARCH="${LLVM_TARGET_ARCH}"
+         -DLLVM_ENABLE_PROJECTS="${llvm_enable_projects_arg}"
+         -DLLVM_EXTERNAL_PROJECTS="${llvm_external_projects_arg}"
+         -DLLVM_ENABLE_RUNTIMES="${llvm_enable_runtimes_arg}"
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 7470d2b4d8a5..0fb336ee7747 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -26,8 +26,10 @@ LLVM_RELEASE = "${PV}"
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+           file://fix-native-compilation.patch \
            file://llvm-config \
            "
+
 SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
@@ -56,19 +58,22 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
-PACKAGECONFIG ??= "libllvm"
+PACKAGECONFIG ??= "libllvm libclc"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
 PACKAGECONFIG[libllvm] = ""
+PACKAGECONFIG[libclc] = ""
 
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
+LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
+LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
+
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
                   -DLLVM_ENABLE_PIC=ON \
@@ -82,6 +87,13 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DCMAKE_BUILD_TYPE=Release \
+                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
+                  -DLLVM_NATIVE_TRIPLE='${BUILD_SYS}' \
+                  -DLLVM_NATIVE_C_COMPILER=\'${@ d.getVar('BUILD_CC').replace('ccache', '').strip()}\' \
+                  -DLLVM_NATIVE_CXX_COMPILER=\'${@ d.getVar('BUILD_CXX').replace('ccache', '').strip()}\' \
+                  -DLLVM_NATIVE_C_FLAGS='${BUILD_CFLAGS}' \
+                  -DLLVM_NATIVE_CXX_FLAGS='${BUILD_CXXFLAGS}' \
+                  -DLLVM_NATIVE_LD_FLAGS='${BUILD_LDFLAGS}' \
                  "
 
 EXTRA_OECMAKE:append:class-target = "\
@@ -89,6 +101,8 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
+                  -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
                  "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -96,6 +110,8 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_HOST_TRIPLE=${SDK_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
+                  -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
                  "
 
 # patch out build host paths for reproducibility
@@ -124,11 +140,26 @@ do_install() {
 
         # Remove opt-viewer: https://llvm.org/docs/Remarks.html
         rm -rf ${D}${datadir}/opt-viewer
-        rmdir ${D}${datadir}
+        rmdir ${D}${datadir} || true
 
         # reproducibility
         sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
     fi
+
+    # Remove clang bits from target packages, we are not providing it for the system
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
+        rm -f  ${D}${bindir}/clang*
+        rm -fr ${D}${libdir}/clang
+        rm -fr ${D}${datadir}/clang
+
+        rm -f  ${D}${bindir}/scan*
+        rm -fr ${D}${libdir}/libscanbuild
+        rm -fr ${D}${datadir}/scan-build
+        rm -fr ${D}${datadir}/scan-view
+
+        rm -fr ${D}${libdir}/libear
+    fi
 }
 
 do_install:append:class-native() {
@@ -145,9 +176,11 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
+PROVIDES = "libclc"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
+RPROVIDES:${PN}-clc += "libclc"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -180,6 +213,8 @@ FILES:${PN}-staticdev += "\
     ${libdir}/*.a \
 "
 
+FILES:${PN}-clc += "${datadir}/clc"
+
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


