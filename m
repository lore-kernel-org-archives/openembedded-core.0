Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250DBC3ABB6
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 00:04:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.64757.1746489844103930740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 17:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lcyYIDvl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTbSJ016338
	for <openembedded-core@lists.openembedded.org>; Tue, 6 May 2025 00:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aqdgOnD1KobWDz6mH5+lwddoPCtCzu2IDKU
	n6Lk8tFU=; b=lcyYIDvln0m5+rkwv18vN/tCAbp/1R0Zk4bDaIVRfdKNUNFadQj
	61mpfaEYUngxeYNG3eqUHzPS4f+swMirfaM0PP+ZIYjnuOVZcH8jJWfpHj5vuQfc
	FsaKworHiHlnRMDfABrC9zuh39GvHDXGhjkl+RTeCwi2xHZg0SgVIVOAEKUrvZ/Z
	G1EOr3emtqsTcL44RTWQhwq0m89y5DOh9jSKk2cg+TaANduET1K44apSt9BDpHlp
	LhWGi07JAunOq3FwkTmPc0hgOa2Ozfdi5sx/DG0TSrUsV3WA4qA6WxdqRhfWaBEi
	0if/6e9xRHBzWdg3kyTubGmxHlomKTR2GRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsv3aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 00:04:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so845217085a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 17:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746489842; x=1747094642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqdgOnD1KobWDz6mH5+lwddoPCtCzu2IDKUn6Lk8tFU=;
        b=EN9UnENuvbQMDDsLuKhaoFuP9o+ya1HlQgsiiIoysB/Io97oOFNvZiEhcNJc+0X+bh
         aeTYPj/wtQUs/aRZlIS4V/oq+cuvvXP3DF2M5l/zkcqWMtI4GFdfkMC308RQMNZe03Co
         3d0b09926msiB6v498881AbFL6gdVbgzf0j1rhRaXh1dxjJVo1a8lfobUoP4Dr0Rh+Qq
         0u1SDNhEyqw98emLzoAXluwb7YwlBNITyWGyAVlTXLjbYEf0i1EY20O4A3MHcGNf1Ff+
         Vi+iaVMCZqzyZTnO52qUuLDkyUsfc5R4yQUVg8lRT8Gu4FbIdYe6fVM4NV1evSebP9hq
         bATA==
X-Gm-Message-State: AOJu0Yw0d+NXzkGfHzJuP1XQ4OonM3ZmxV4GGkU6AvTwIjOGs51qe/dV
	jTqLf8/F0htPaNgLSTq5pnLPCkLSeCi3vRAyW37Ae9WmxAifnbgQtYIii/+fs7p6PChhrv9NJB1
	uA+AAjucN+M5mJOq2rlj8GEtDewj0pgzZa7hafsenNYyMT4NvW8BfUhOd2QO7lJQeXEXODitGTi
	kr6wLLWsfidAfRXg==
X-Gm-Gg: ASbGnct1wjrXmODJMKwfG0+UlJmnLRL/4hcpGN5zSLhd4Mm/5fdru8n1LxfBcN44093
	+z/PPw+vmVkfSB3FdxFhsLKCj2yaps0qWanFiJaD52j4wF9lVRv5umX96065nEBI147c07DdrTb
	bsgRboF5lvIg5RGaF11sbkjeOSJGgG1l2mkK8aRxE8j6m5yGKsLvdSw9kMZHk1C3RmdUZwaX63E
	4ocRlDejWQ9F/JT6utWZUFP8pXAXTKkr/pqffM7ZlCrIXDahEt7D/qgR2BgpiPylnzSzSnVPHbV
	PMvAyxIBJ2QSDFpGbbR8YAYWcmmNnuxSj8thG3PcXXzBpLmXIc32sBeefVSG1zekKtskiDqtirT
	TQnAfU2gAovwdKukSCCY4zeBT
X-Received: by 2002:a05:620a:4311:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7cad5b4a7d7mr2212416585a.30.1746489841563;
        Mon, 05 May 2025 17:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd+YnrYLzDlpYkUB8kE3DTR4abOUAzOPVg/q/e1ofzzMSvFVRUygBeGI0Tn5C+qD8pXG758A==
X-Received: by 2002:a05:620a:4311:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7cad5b4a7d7mr2212410885a.30.1746489841038;
        Mon, 05 May 2025 17:04:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a897cbbsm17865411fa.82.2025.05.05.17.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 17:04:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang: split SPIRV-LLVM-Translator to its own recipe
Date: Tue,  6 May 2025 03:03:59 +0300
Message-Id: <20250506000359.1784075-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aovBDR5JhbvipJ3JopJUMKA_et-6wTXw
X-Proofpoint-ORIG-GUID: aovBDR5JhbvipJ3JopJUMKA_et-6wTXw
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=681951f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=sbFYo3YMAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=67ERAKQTa8rxYUf2eSkA:9
 a=Hfi2CKXjBV7-zRAp:21 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=eQGrxjqmTwMhw5bz568X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDIyNyBTYWx0ZWRfX0ZH/kKgS7Sf0
 dxQBCbiRQwBsvP/SrtdNWx+JyJ9SYh4blcJuYFLJ54A1RZRFGmcNGXRTqmHWkV4jo7LbyckjWla
 1K5bb4gwCupHSFumGoUXuz+prDBZtFc3ExT9GHWyk6qVugX+PGinhefr2kF61WvhSX1nxoeXWrx
 vM3solwtZwshrX4zzxFm57pKiN7MgIA7b384vUvKq39/gda7GTqM/U0RbrTG0/xbrsn+tnqbbgh
 T813vlXEucf9FQEmGxePdT99yFPO4qaiXayuG+4WGQeQJOI/58e7PzNuCgwhLcnPTh4+sVXSRhc
 IpVfsiCAdoc0kUbxCxVXPHDgSWVOZoo8w7Qwd1RiiQ7oOaf0QSc1ZDNJozW1O5RBn8kyVvVZ04l
 QM5j+etaa2S9/CdeDHSbVNqVU5NxEKpUfXqDCAja8Xof8ZuTXZh97eFn3ys36mpoPPwxOi3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_10,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 00:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216024

The translator is not a part of the same source tree. As such it has
tendency to break on clang upgrades. Split it to its own recipe in order
to ease handling of clang.

This also makes it use SPIR-V headers provided by the spirv-headers
recipe instead of vendoring them in.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../clang/clang/spirv-internal-build.patch    | 30 ----------------
 .../clang/clang/spirv-shared-library.patch    | 25 -------------
 meta/recipes-devtools/clang/clang_git.bb      | 22 +++---------
 meta/recipes-devtools/clang/common.inc        | 13 -------
 .../spir/spirv-llvm-translator_20.1.2.bb      | 36 +++++++++++++++++++
 6 files changed, 41 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/spirv-internal-build.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/spirv-shared-library.patch
 create mode 100644 meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b67433d4d2b6..7d4a8e24174f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -792,6 +792,7 @@ RECIPE_MAINTAINER:pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
+RECIPE_MAINTAINER:pn-spirv-llvm-translator = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/recipes-devtools/clang/clang/spirv-internal-build.patch b/meta/recipes-devtools/clang/clang/spirv-internal-build.patch
deleted file mode 100644
index 555d40f4fb07..000000000000
--- a/meta/recipes-devtools/clang/clang/spirv-internal-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Fri, 21 Mar 2025 17:17:52 +0200
-Subject: [PATCH] SPIRV-LLVM-Translator: fix handling of built-in SPIRV targer
-
-If the SPIRV-LLVM-Translator is being built together with the LLVM, set
-the defines declaring whether SPIRV target is also included into the
-LLVM library or not. Otherwise llvm-spirv execution fails because
-spirv-ext option is registered twice.
-
-Upstream-Status: Pending [will be submitted upstream after internal clearance]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-
-Index: llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
-===================================================================
---- llvm-project-20.1.0.src.orig/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
-+++ llvm-project-20.1.0.src/llvm/projects/SPIRV-LLVM-Translator/CMakeLists.txt
-@@ -116,6 +116,12 @@ if(LLVM_SPIRV_BUILD_EXTERNAL)
-     set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
-     set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
-   endif()
-+else()
-+  is_llvm_target_library("SPIRV" spirv_present_result INCLUDED_TARGETS)
-+  if(spirv_present_result)
-+    set(SPIRV_BACKEND_FOUND TRUE)
-+    add_compile_definitions(LLVM_SPIRV_BACKEND_TARGET_PRESENT)
-+  endif()
- endif()
- 
- set(LLVM_SPIRV_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)
diff --git a/meta/recipes-devtools/clang/clang/spirv-shared-library.patch b/meta/recipes-devtools/clang/clang/spirv-shared-library.patch
deleted file mode 100644
index edc595d57699..000000000000
--- a/meta/recipes-devtools/clang/clang/spirv-shared-library.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From e94e529aefb28b65165e978daa2bfd89867ee8d0 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Thu, 9 Apr 2025 15:20:32 +0200
-Subject: [PATCH] SPIRV-LLVM-Translator: build shared library
-
-By default SPIRV-LLVM-Translator builds only a static version of the library.
-Unfortunately this might result in linking erros when uninative is in play, if
-libLLVMSPIRV uses symbols which are provided only by the uninative libc and are
-not provided by the host libc.
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-
-Index: llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
-===================================================================
---- llvm-project-20.1.1.src.orig/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
-+++ llvm-project-20.1.1.src/llvm/projects/SPIRV-LLVM-Translator/lib/SPIRV/CMakeLists.txt
-@@ -42,6 +42,7 @@ set(SRC_LIST
- )
- add_llvm_library(LLVMSPIRVLib
-   ${SRC_LIST}
-+  SHARED
-   LINK_COMPONENTS
-     Analysis
-     BitWriter
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 67cd5151df6f..ba037e597857 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -155,7 +155,6 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_BUILD_TYPE=Release \
                   -DCMAKE_CXX_FLAGS_RELEASE='${CXXFLAGS} -DNDEBUG -g0' \
                   -DCMAKE_C_FLAGS_RELEASE='${CFLAGS} -DNDEBUG -g0' \
-                  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
                   -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                   -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR} \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
@@ -171,7 +170,6 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
                                                   -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
                                                   -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
-                                                  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
                                                   -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
@@ -187,8 +185,6 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DPYTHON_EXECUTABLE='${PYTHON}' \
 "
 EXTRA_OECMAKE:append:class-target = "\
-                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
-' \
                   -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                   -DLLVM_HEADERS_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-min-tblgen \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
@@ -310,11 +306,11 @@ do_install:append:class-nativesdk () {
     fi
 }
 
-PROVIDES:append:class-native = " llvm-native libclc-native spirv-llvm-translator-native"
-PROVIDES:append:class-target = " llvm libclc spirv-llvm-translator"
-PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc nativesdk-spirv-llvm-translator"
+PROVIDES:append:class-native = " llvm-native libclc-native"
+PROVIDES:append:class-target = " llvm libclc"
+PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc"
 
-PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc ${PN}-spirv \
+PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
              libclang lldb lldb-server liblldb llvm-linker-tools"
 
 
@@ -334,7 +330,6 @@ RDEPENDS:${PN}-tools += "\
   perl-module-term-ansicolor \
 "
 
-RPROVIDES:${PN}-spirv = "${MLPREFIX}spirv-llvm-translator"
 RPROVIDES:${PN}-clc = "${MLPREFIX}libclc"
 
 RRECOMMENDS:${PN}-tidy += "${PN}-tools"
@@ -405,11 +400,6 @@ FILES:${PN} += "\
 
 FILES:${PN}-clc += "${datadir}/clc"
 
-FILES:${PN}-spirv = " \
-    ${bindir}/llvm-spirv \
-    ${libdir}/libLLVMSPIRV.so.* \
-"
-
 FILES:lldb = "\
   ${bindir}/lldb \
   ${bindir}/lldb-argdumper \
@@ -456,10 +446,6 @@ INSANE_SKIP:${PN}-lldb-python += "dev-so dev-deps"
 INSANE_SKIP:${MLPREFIX}liblldb = "dev-so"
 INSANE_SKIP:${PN}-libllvm = "dev-so"
 
-# SPIRV-LLVM-Translator provides only static libraries, they are included into
-# the clang-spirv package.
-INSANE_SKIP:${PN}-spirv += "dev-so"
-
 #Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
 SSTATE_SCAN_FILES:remove = "*-config"
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index f733566bc88a..a7b508039f7d 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,21 +17,8 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-proje
 SOURCEDIR ?= "llvm-project-${PV}.src"
 SRC_URI[sha256sum] = "b6183c41281ee3f23da7fda790c6d4f5877aed103d1e759763b1008bdd0e2c50"
 
-SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
-SRCREV_spirvheaders = "09913f088a1197aba4aefd300a876b2ebbaa3391"
-SRCREV_FORMAT .= "spirv_spirvheaders"
-# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SPIRVURI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
-    git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers;name=spirvheaders;branch=main \
-    file://spirv-internal-build.patch \
-    file://spirv-shared-library.patch \
-"
-
 SRC_URI = "\
     ${BASEURI} \
-    ${SPIRVURI} \
     file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch \
     file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
     file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch \
diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
new file mode 100644
index 000000000000..bc2bebcda882
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.2.bb
@@ -0,0 +1,36 @@
+HOMEPAGE = "https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
+SUMMARY = "LLVM/SPIR-V Bi-Directional Translator, a library and tool for translation between LLVM IR and SPIR-V."
+
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
+
+# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
+SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
+SRC_URI = " \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH} \
+"
+
+SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "clang spirv-tools spirv-headers"
+
+inherit cmake pkgconfig python3native
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+# for CMAKE_SHARED_LIBS=OFF see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
+EXTRA_OECMAKE = "\
+    -DBUILD_SHARED_LIBS=ON \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+    -DCMAKE_SKIP_RPATH=ON \
+    -DLLVM_EXTERNAL_LIT=lit \
+    -DLLVM_INCLUDE_TESTS=ON \
+    -Wno-dev \
+    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


