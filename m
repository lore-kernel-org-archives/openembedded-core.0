Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 3035078EFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 10:43:22 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w9HAhNaV007147
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:43:23 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.21.7])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w9HAhNDb032592;
	Wed, 17 Oct 2018 12:43:23 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1FF8310D56E1;
	Wed, 17 Oct 2018 12:43:23 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 12:42:43 +0200
Message-Id: <20181017104243.801-5-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181017104243.801-1-pascal.bach@siemens.com>
References: <20181017104243.801-1-pascal.bach@siemens.com>
Subject: [PATCH v4 4/4] cmake.bbclass: allow cmake to find hosttools
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
X-List-Received-Date: Wed, 17 Oct 2018 10:43:23 -0000

Currently the generated toolchain file is unable to find hosttools as they
do not appear in the search paths.

Just adding HOSTTOOLS_DIR is not enough as binaries are located directly under
${HOSTTOOLS_DIR}. Like ${HOSTTOOLS_DIR}/git for example.
CMake however only searches in [s]bin sub directories of the paths specified in
CMAKE_FIND_ROOT_PATH. Explicitly adding / to CMAKE_SYSTEM_PROGRAM_PATH makes
CMake look in the right location.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/cmake.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 0ef63795eb..c8a079c417 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -89,7 +89,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE} )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE} )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE} )
@@ -108,6 +108,10 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_SYSTEM_LIBRARY_PATH ${libdir} ${base_libdir})
 
+# by default CMake only looks in [s]bin subdirectories of CMAKE_FIND_ROOT_PATH
+# adding / makes CMake look for binaries in hosttools too.
+set( CMAKE_SYSTEM_PROGRAM_PATH /)
+
 # avoid treating imports as system includes
 set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON)
 
-- 
2.11.0


