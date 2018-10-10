Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 35FA06067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 08:12:15 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w9A8CG6U016191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 10:12:16 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.5.162])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w9A8CGJ7010125;
	Wed, 10 Oct 2018 10:12:16 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D93FE10037C0;
	Wed, 10 Oct 2018 10:12:15 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 10:10:33 +0200
Message-Id: <20181010081035.10735-2-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181010081035.10735-1-pascal.bach@siemens.com>
References: <20181010081035.10735-1-pascal.bach@siemens.com>
Subject: [PATCHv3 2/4] cmake.bbclass: search both sysroot-native and host for native packages
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
X-List-Received-Date: Wed, 10 Oct 2018 08:12:16 -0000

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
index 86b1d0e9aa..ce3c0278ff 100644
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
 
@@ -90,10 +90,10 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
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
 
 # Use qt.conf settings
 set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
-- 
2.11.0


