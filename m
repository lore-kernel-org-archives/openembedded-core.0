Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 319 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Jul 2015 07:49:55 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 92C457597C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:49:55 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.1/8.15.1) with ESMTPS id t6H7iZ7P022856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 09:44:36 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.79.122])
	by mail2.sbs.de (8.15.1/8.15.1) with ESMTP id t6H7iZaA024678;
	Fri, 17 Jul 2015 09:44:35 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 09:44:33 +0200
Message-Id: <1437119073-4788-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cmake.bbclass: set archiver, linker and ranlib in toolchain.cmake
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
X-List-Received-Date: Fri, 17 Jul 2015 07:49:58 -0000

Setting CMAKE_AR, CMAKE_LINKER and CMAKE_RANLIB correctly in
toolchain.cmake is necessary to correctly build -native packages
using CMake.

The reason is that CMake is not able to find the above utilities by
itself because CMAKE_FIND_ROOT_PATH_MODE_PROGRAM is set to ONLY
so we need to tell it explicitly where to look.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/cmake.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 995ddf1..cae0ad2 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -13,6 +13,9 @@ inherit autotools
 # C/C++ Compiler (without cpu arch/tune arguments)
 OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
 OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_AR ?= "`echo ${AR} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_LINKER ?= "`echo ${LD} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_RANLIB ?= "`echo ${RANLIB} | sed 's/^\([^ ]*\).*/\1/'`"
 
 # Compiler flags
 OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
@@ -35,6 +38,11 @@ set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
+# Force the use of cache here otherwise the values will be overridden (http://www.cmake.org/Bug/view.php?id=13038)
+set( CMAKE_AR ar CACHE FILEPATH "Archiver" FORCE )
+set( CMAKE_LINKER ld CACHE FILEPATH "Linker" FORCE )
+set( CMAKE_RANLIB ranlib CACHE FILEPATH "Ranlib" FORCE )
+
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
-- 
1.9.1


