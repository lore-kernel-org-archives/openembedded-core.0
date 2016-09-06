Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id CC7DD7753B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 13:18:19 +0000 (UTC)
From: Jack Mitchell <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 14:18:32 +0100
Message-Id: <20160906131832.11409-1-ml@embed.me.uk>
X-Mailer: git-send-email 2.9.3
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [PATCH] cmake: set CMAKE_NO_SYSTEM_FROM_IMPORTED to ON
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 13:18:20 -0000

From: Jack Mitchell <jack@embed.me.uk>

set CMAKE_NO_SYSTEM_FROM_IMPORTED to ON in the bbclass
and also the toolchain file. This is required as GCC6
has become more tetchy about the use of -isystem in the
compiler flags.

Imported targets aren't used much in cmake at the moment which
is why errors have been rare and probably worked around in
different ways prior to this patch.
---
 meta/classes/cmake.bbclass                                | 1 +
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 5203d8a..8339a6b 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -57,6 +57,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "Additi
 set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
 set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
+set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 60014bb..8279eb6 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -7,6 +7,7 @@ set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON )
 
 string(REGEX MATCH "sysroots/([a-zA-Z0-9]+)" CMAKE_SYSTEM_PROCESSOR $ENV{SDKTARGETSYSROOT})
 string(REGEX REPLACE "sysroots/" "" CMAKE_SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR})
-- 
2.9.3


