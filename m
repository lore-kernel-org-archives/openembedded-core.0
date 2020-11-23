Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web09.40541.1606158044594048187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 11:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0ANJ0gAr009627
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 20:00:42 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.76.33])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0ANJ0gm9011968;
	Mon, 23 Nov 2020 20:00:42 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id BADB79508F2;
	Mon, 23 Nov 2020 20:00:41 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
        Pascal Bach <pascal.bach@siemens.com>,
        Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v2 2/2] cmake: split release and debug flags
Date: Mon, 23 Nov 2020 20:00:29 +0100
Message-Id: <20201123190029.13811-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123190029.13811-1-andrej.valek@siemens.com>
References: <20201123190029.13811-1-andrej.valek@siemens.com>
In-Reply-To: <20201122124853.30262-1-andrej.valek@siemens.com>
References: <20201122124853.30262-1-andrej.valek@siemens.com>

Keep only flags related to release in particular part _RELEASE (same for
debug). This option allows to really use the Release/Debug build type
in cmake. The corresponding build type will have corresponding flags set
with/without optimization. Flags are respecting selected optimization from
the whole build.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/cmake.bbclass | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 7c055e8a3d..1305b40bf9 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -25,14 +25,25 @@ python() {
 OECMAKE_AR ?= "${AR}"
 
 # Compiler flags
-OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
-OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
-OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
-OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
-OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
-OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
-CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CFLAGS_COMMON}"
+OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON}"
+OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${lcl_maybe_fortify} -DNDEBUG"
+OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${lcl_maybe_fortify} -DNDEBUG"
+OECMAKE_C_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
+OECMAKE_CXX_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
+OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
+OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON} ${LDFLAGS}"
+OECMAKE_LINKER_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${lcl_maybe_fortify}"
+OECMAKE_LINKER_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
+CXXFLAGS += "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS}"
+CFLAGS += "${HOST_CC_ARCH_COMMON} ${TOOLCHAIN_OPTIONS}"
+
+# Common compiler flags
+# CFLAGS/CXXFLAGS without optimization
+# HOST_CC_ARCH without fortify
+CFLAGS_COMMON = "${@d.getVar('CFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
+CXXFLAGS_COMMON = "${@d.getVar('CXXFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
+HOST_CC_ARCH_COMMON = "${@d.getVar('HOST_CC_ARCH').replace(d.getVar('lcl_maybe_fortify'),'')}"
 
 def oecmake_map_compiler(compiler, d):
     args = d.getVar(compiler).split()
@@ -107,8 +118,17 @@ set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
 set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional CFLAGS for release" )
 set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "Additional CXXFLAGS for release" )
 set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
+set( CMAKE_C_FLAGS_DEBUG "${OECMAKE_C_FLAGS_DEBUG}" CACHE STRING "Additional CFLAGS for debug" )
+set( CMAKE_CXX_FLAGS_DEBUG "${OECMAKE_CXX_FLAGS_DEBUG}" CACHE STRING "Additional CXXFLAGS for debug" )
+set( CMAKE_ASM_FLAGS_DEBUG "${OECMAKE_C_FLAGS_DEBUG}" CACHE STRING "Additional ASM FLAGS for debug" )
 set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
+set( CMAKE_SHARED_LINKER_FLAGS_RELEASE "${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional SHARED LINKER FLAGS for release" )
+set( CMAKE_SHARED_LINKER_FLAGS_DEBUG "${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional SHARED LINKER FLAGS for debug" )
+set( CMAKE_MODULE_LINKER_FLAGS_RELEASE "${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional MODULE LINKER FLAGS for release" )
+set( CMAKE_MODULE_LINKER_FLAGS_DEBUG "${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional MODULE LINKER FLAGS for debug" )
+set( CMAKE_EXE_LINKER_FLAGS_RELEASE "${OECMAKE_LINKER_FLAGS_RELEASE}" CACHE STRING "Additional EXE LINKER FLAGS for release" )
+set( CMAKE_EXE_LINKER_FLAGS_DEBUG "${OECMAKE_LINKER_FLAGS_DEBUG}" CACHE STRING "Additional EXE LINKER FLAGS for debug" )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-- 
2.11.0

