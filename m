Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A10AC369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 15:59:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.22732.1744819174018446328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 08:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iPtmUsrk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDo5020542
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vabxFzg+1W2+ugdC02oao6fkqCsGe9YBXas
	aX2N+6ls=; b=iPtmUsrkPtlVqSe+AAy+JlQuWdpjy6+MiSTx7n2OwPGocX5Whqm
	s0t5N9rjMjXwJB30QHDrk+VcLNgtrwgSCf5j3RrW7goTP7qZwDMUsCf8SjrF4ZaC
	hOi9pa9xoN296dhPjs+m+XJySBxsCubS6vdtz2Qtv+w51DWk73ZCkb0JrAgmKERd
	QRNC4FLZaM8ug7UIz5s63WZr2PFSz/B6bCympofxsSYi8r4hlfC8VKL0AGWtNaCH
	zFDdVWaC/SMA6nD6f3RkMsWJRZJnV3DQ86JJgPfswVAkRnHog6Fy6zeiX4QOTJcE
	x3CKz0PUvtcZ0o/e8Oi5DKqsBuLtqlmcYSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wm2a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso173909016d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 08:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819172; x=1745423972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vabxFzg+1W2+ugdC02oao6fkqCsGe9YBXasaX2N+6ls=;
        b=vgIVAOK7zSJ7S8I9wDtGhLzGTI5uALlHCpVeTFuUS0Pd5kRdFeOdbOP5dCKjIa/ulF
         AtozyV7d1MZdyYoRRTLe/NlLriafTO/mnP1k6+qk8ENWkKnQZMmJACiHxQzDw0pXrNOO
         +AxXGy2NYBqb82HBX2aiMCJrn8AEg70+UM4+cwCd5+Xd2fNpciqqpf3TaD1AO07YrhZg
         Ve/wZEXGith1bHfoMAlQl4GSBvjvIrsdg9ktp0D5QBSlb2R59CEBFizS4+uNCsyKtvl1
         6bZNpxtrihbuDWtH+lIm8+GKBcaKkYOgcQjEF88UdvoJR5cjd8hzURIM/UoioTOOBsXx
         g2Lg==
X-Gm-Message-State: AOJu0YzNWLooozZjAPw9h4V/POD369ED18cmDpZV7ngbtXTOL4eGLVLd
	7xDZSg+0lyiVCgjpUPr0MQ8gDmJf3w3WZOi9AaEe2+ucxz1Uko4QRBHSeEG6wL3CyqzXRyVDMBJ
	O2UMFsQFQuL6NpvKpPlOiJZiKfYg/HCiY8ADQh2mMf9INhOPJdUbLmmeEj6OglyP6Yw95AeRnMQ
	89l4wk//v8aFY=
X-Gm-Gg: ASbGncs/j2KdkldruelhnZloiRHEJHf7ByOtAlCVmn9LvCPDijewCxqD25fg+AASCbl
	znWckv41BVcLV7qYjrimXl1HA8VM52noM69b+WgpMFgQsBw2xarQ+UWMHcGEqxYrNMqk1VLV4HU
	8hjzGn8Gma0zbvvn7IwWpEah0/3XvwJjy0Obe90pa1DaOLlIcSXuJMu8n4/M75YsIANtquqzFQJ
	1oj86kngwt37z+bgIui+ntSRP7Yd9abztG2IUxyeP9irRLJovLs3hVOxtWzOVB/taHLgg7Nz5js
	xdP3evoi6jUhx3TRbT+KJhohYQvNCsphMdOPbizvTEqkX6o0L/m/RuCpzlPqeFuTEaBMn09S4gt
	0D7gD85859VKtk8EAJKvYTVaI
X-Received: by 2002:a05:6214:1246:b0:6e8:9957:e705 with SMTP id 6a1803df08f44-6f2b3036a23mr39800326d6.34.1744819171975;
        Wed, 16 Apr 2025 08:59:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi+SuGDj4rIUzJ2YrowryA//601MXR1KZaNgBC6dzHkf0IVf8HesrNUCBuc+rVTyLEDH9Qug==
X-Received: by 2002:a05:6214:1246:b0:6e8:9957:e705 with SMTP id 6a1803df08f44-6f2b3036a23mr39799806d6.34.1744819171444;
        Wed, 16 Apr 2025 08:59:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d5857223csm676550e87.175.2025.04.16.08.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:59:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] llvm: import build fix from meta-clang
Date: Wed, 16 Apr 2025 18:59:27 +0300
Message-Id: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67ffd3e5 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=uIQtxe-Ix_KvRWAXy9AA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zcb3XMck_LHSAqdL3ticq81dQMtLe7NF
X-Proofpoint-GUID: zcb3XMck_LHSAqdL3ticq81dQMtLe7NF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214995

Import a fix from meta-clang, which allows packages using LLVM to find
tools from the native sysroot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...gure-for-packages-using-find_package.patch | 117 ++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.2.bb     |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
new file mode 100644
index 000000000000..94c056ab8e0a
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
@@ -0,0 +1,117 @@
+From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 31 Jan 2020 10:56:11 +0200
+Subject: [PATCH] cmake: Fix configure for packages using find_package()
+
+Currently, when a package (i.e. bcc [https://github.com/iovisor/bcc.git])
+that depends on LLVM/Clang tries to run cmake find_package() during
+do_configure, it will fail with a similar error:
+
+|   The imported target "llvm-tblgen" references the file
+|      ".../recipe-sysroot/usr/bin/llvm-tblgen"
+|
+|   but this file does not exist.  Possible reasons include:
+|   * The file was deleted, renamed, or moved to another location.
+|   * An install or uninstall procedure did not complete successfully.
+|   * The installation package was faulty and contained
+|      ".../recipe-sysroot/usr/lib/cmake/LLVMExports.cmake"
+|   but not all the files it references.
+
+This is due to the fact that currently the cmake scripts look for target
+binaries in sysroot. Work around this by not exporting the target binaries in
+Exports-* cmake files.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ clang/cmake/modules/AddClang.cmake | 2 --
+ llvm/cmake/modules/AddLLVM.cmake   | 9 ++-------
+ llvm/cmake/modules/TableGen.cmake  | 6 ------
+ 3 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/AddClang.cmake
+index cdc8bd5cd503..5faa9117a30f 100644
+--- a/clang/cmake/modules/AddClang.cmake
++++ b/clang/cmake/modules/AddClang.cmake
+@@ -182,7 +182,6 @@ macro(add_clang_tool name)
+     if (CLANG_BUILD_TOOLS)
+       get_target_export_arg(${name} Clang export_to_clangtargets)
+       install(TARGETS ${name}
+-        ${export_to_clangtargets}
+         RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
+         COMPONENT ${name})
+ 
+@@ -191,7 +190,6 @@ macro(add_clang_tool name)
+                                  DEPENDS ${name}
+                                  COMPONENT ${name})
+       endif()
+-      set_property(GLOBAL APPEND PROPERTY CLANG_EXPORTS ${name})
+     endif()
+   endif()
+   set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
+diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLLVM.cmake
+index d3e9377c8d2f..fe22d6f2b35a 100644
+--- a/llvm/cmake/modules/AddLLVM.cmake
++++ b/llvm/cmake/modules/AddLLVM.cmake
+@@ -1492,7 +1492,6 @@ macro(llvm_add_tool project name)
+       if( LLVM_BUILD_TOOLS )
+         get_target_export_arg(${name} ${project} export_to_llvmexports)
+         install(TARGETS ${name}
+-                ${export_to_llvmexports}
+                 RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
+                 COMPONENT ${name})
+ 
+@@ -1503,10 +1502,8 @@ macro(llvm_add_tool project name)
+         endif()
+       endif()
+     endif()
+-    if( LLVM_BUILD_TOOLS )
+-      string(TOUPPER "${project}" project_upper)
+-      set_property(GLOBAL APPEND PROPERTY ${project_upper}_EXPORTS ${name})
+-    endif()
++    string(TOUPPER "${project}" project_upper)
++    set_target_properties(${name} PROPERTIES FOLDER "Tools")
+   endif()
+   get_subproject_title(subproject_title)
+   set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/Tools")
+@@ -1556,7 +1553,6 @@ macro(add_llvm_utility name)
+     if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
+       get_target_export_arg(${name} LLVM export_to_llvmexports)
+       install(TARGETS ${name}
+-              ${export_to_llvmexports}
+               RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
+               COMPONENT ${name})
+ 
+@@ -1565,7 +1561,6 @@ macro(add_llvm_utility name)
+                                  DEPENDS ${name}
+                                  COMPONENT ${name})
+       endif()
+-      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
+     elseif(LLVM_BUILD_UTILS)
+       set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${name})
+     endif()
+diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/TableGen.cmake
+index ffcc718b4777..a76f28e74b86 100644
+--- a/llvm/cmake/modules/TableGen.cmake
++++ b/llvm/cmake/modules/TableGen.cmake
+@@ -232,12 +232,7 @@ macro(add_tablegen target project)
+ 
+   if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
+       (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONENTS))
+-    set(export_arg)
+-    if(ADD_TABLEGEN_EXPORT)
+-      get_target_export_arg(${target} ${ADD_TABLEGEN_EXPORT} export_arg)
+-    endif()
+     install(TARGETS ${target}
+-            ${export_arg}
+             COMPONENT ${target}
+             RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
+     if(NOT LLVM_ENABLE_IDE)
+@@ -248,6 +243,5 @@ macro(add_tablegen target project)
+   endif()
+   if(ADD_TABLEGEN_EXPORT)
+     string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
+-    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${target})
+   endif()
+ endmacro()
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
index b51ab703a136..4b24d28364cd 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
@@ -39,6 +39,7 @@ SRC_URI_SPIRV:append:class-native = " \
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+           file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator', '${SRC_URI_SPIRV}', '', d)} \
            file://llvm-config \
            "
-- 
2.39.5


