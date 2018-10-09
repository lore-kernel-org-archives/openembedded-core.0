Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 50F21750FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 14:32:00 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w99EW0rN005929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 16:32:00 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.58])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w99EW0XC020626;
	Tue, 9 Oct 2018 16:32:00 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 89B671BF1BF3;
	Tue,  9 Oct 2018 16:31:59 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 16:31:30 +0200
Message-Id: <20181009143130.6807-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCHv2] cmake.bbclass: allow cmake to find hosttools
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
X-List-Received-Date: Tue, 09 Oct 2018 14:32:00 -0000

Currently the generated toolchain file is unable to find hosttools as they
do not appear in the search paths.

One example where this is useful is for projects that query git for their version
number as git is usually provided via HOSTTOOLS.

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
index fd40a9863e..0dd6f6e6de 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -89,7 +89,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})
 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
@@ -108,6 +108,10 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 # add for non /usr/lib libdir, e.g. /usr/lib64
 set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
 
+# by default CMake only looks in [s]bin subdirectories of CMAKE_FIND_ROOT_PATH
+# adding / makes CMake look for binaries in hosttools too.
+set( CMAKE_SYSTEM_PROGRAM_PATH /)
+
 EOF
 }
 
-- 
2.11.0


