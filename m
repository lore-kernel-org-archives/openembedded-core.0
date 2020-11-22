Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web11.19156.1606049360675363192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2020 04:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AMCnITc026578
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2020 13:49:18 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.1.247])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 0AMCnI7v007652;
	Sun, 22 Nov 2020 13:49:18 +0100
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D3D316D18C0;
	Sun, 22 Nov 2020 13:49:17 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
        Pascal Bach <pascal.bach@siemens.com>,
        Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH 2/2] cmake: split release and debug flags
Date: Sun, 22 Nov 2020 13:48:53 +0100
Message-Id: <20201122124853.30262-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
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
 meta/classes/cmake.bbclass | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 7c055e8a3d..a0ce92ce46 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -25,15 +25,23 @@ python() {
 OECMAKE_AR ?= "${AR}"
 
 # Compiler flags
-OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
-OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
-OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
-OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
+OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS_COMMON}"
+OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON}"
+OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
+OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
+OECMAKE_C_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
+OECMAKE_CXX_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
 OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
-OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
+OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS_COMMON} ${LDFLAGS}"
+OECMAKE_LINKER_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION}"
+OECMAKE_LINKER_FLAGS_DEBUG ?= "${DEBUG_OPTIMIZATION}"
 CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 
+# Common CFLAGS/CXXFLAGS without optimization
+CFLAGS_COMMON = "${@d.getVar('CFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
+CXXFLAGS_COMMON = "${@d.getVar('CXXFLAGS').replace(d.getVar('SELECTED_OPTIMIZATION'),'')}"
+
 def oecmake_map_compiler(compiler, d):
     args = d.getVar(compiler).split()
     if args[0] == "ccache":
@@ -107,8 +115,17 @@ set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
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

