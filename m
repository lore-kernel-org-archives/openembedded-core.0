Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id C83B1753DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 14:03:24 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w99E3Ov5026752
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 16:03:24 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.58])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w99E3O0X009370;
	Tue, 9 Oct 2018 16:03:24 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E9F0010037C0;
	Tue,  9 Oct 2018 16:03:23 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 16:03:15 +0200
Message-Id: <20181009140315.4933-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake.bbclass: search both sysroot-native and host for native packages
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
X-List-Received-Date: Tue, 09 Oct 2018 14:03:25 -0000

Certain headers and libraries like `math.h` an `-m` are only available on the
host as they are provided by the host toolchain.

This leads to issues that a find_library in CMake doesn't find the `m` library
of a find_path doesn't find `math.h`. This issue occurred in the wireshark recipe
for example.

This change enables CMake to also look on the host for libraries and includes when
building a native package.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/cmake.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 6e2c34e4c6..89a2a77a50 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -43,8 +43,8 @@ OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
-OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
-OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
+OECMAKE_FIND_ROOT_PATH_MODE = "ONLY"
+OECMAKE_FIND_ROOT_PATH_MODE_class-native = "BOTH"
 
 EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 
@@ -93,10 +93,10 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
 set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
-set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
-set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE} )
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE} )
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE} )
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${OECMAKE_FIND_ROOT_PATH_MODE} )
 
 $cmake_sysroot
 
-- 
2.11.0


