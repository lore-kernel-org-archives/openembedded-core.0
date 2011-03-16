Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PztOW-0006Mx-7F
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:16:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2GGETQf027859
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 09:14:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 09:14:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@lists.pokylinux.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2011 11:15:24 -0500
Message-ID: <eedea684a094582ea32e3f687325d91190475e1a.1300291424.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1300291424.git.mark.hatle@windriver.com>
References: <cover.1300291424.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/6] sat-solver: uprev to the latest version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 16:16:20 -0000
Content-Type: text/plain

Upgrade to the latest git version.  Also update the cmake.patch to enable
debugging in all configurations.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 .../sat-solver/sat-solver/cmake.patch              |   38 +++++++++-----------
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index c08545c..cc1e188 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -165,7 +165,7 @@ SRCREV_pn-qemu-nativesdk ??= "${QEMUSRCREV}"
 SRCREV_pn-qemu ??= "${QEMUSRCREV}"
 SRCREV_pn-qemugl ??= "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
 SRCREV_pn-qemugl-nativesdk ??= "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
-SRCREV_pn-sat-solver = "9e1f2a097965debebc69cebf8ed73c6ff31a5220"
+SRCREV_pn-sat-solver = "20212ccd92c6b3a5a93a83da5d7d60e9c305e75c"
 SRCREV_pn-screenshot ??= "292"
 SRCREV_pn-settings-daemon ??= "0f174f463dfed500b65533e249cd22942e439c77"
 SRCREV_pn-swabber-native ??= "a0792390c5d6d5a5bade7ab155c80eef3f30fa52"
diff --git a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch b/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
index d7b80b0..854bd40 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
@@ -3,9 +3,11 @@ not building docs (need oxygen)
 
 8/19/2010 - created by Qing He <qing.he@intel.com>
 1/24/2011 - Disable Fedora/Debian checking/settings by Mark Hatle <mark.hatle@windriver.com>
+3/15/2011 - Updated to newer version of sat-solver by Mark Hatle <mark.hatle@windriver.com>
 
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
+diff -ur git.orig/CMakeLists.txt git/CMakeLists.txt
+--- git.orig/CMakeLists.txt	2011-03-15 17:14:22.000000000 -0500
++++ git/CMakeLists.txt	2011-03-15 17:20:09.648880770 -0500
 @@ -35,22 +35,15 @@
  FIND_PACKAGE(Check REQUIRED)
  FIND_PACKAGE(ZLIB REQUIRED)
@@ -49,28 +51,22 @@ not building docs (need oxygen)
 -ENDIF ( FEDORA )
 -ENDIF ( NOT DEBIAN )
  
- SET( PACKAGE "satsolver" )
- SET( VERSION "${LIBSATSOLVER_MAJOR}.${LIBSATSOLVER_MINOR}.${LIBSATSOLVER_PATCH}" )
-@@ -159,22 +153,7 @@
- ADD_SUBDIRECTORY(applayer)
+ INCLUDE ( CheckFunctionExists )
+ INCLUDE ( TestBigEndian )
+@@ -164,7 +158,7 @@
+ 
+ MESSAGE(STATUS "Looking modules in ${CMAKE_MODULE_PATH}")
+ 
+-set ( CMAKE_C_FLAGS     "${CMAKE_C_FLAGS} -Werror -Wall" )
++set ( CMAKE_C_FLAGS     "${CMAKE_C_FLAGS} -Werror -Wall -g" )
+ set ( CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -g -O3" )
+ set ( CMAKE_C_FLAGS_DEBUG     "${CMAKE_C_FLAGS} -g3 -O0" )
+ 
+@@ -173,7 +167,7 @@
+ ADD_SUBDIRECTORY(tools)
  ADD_SUBDIRECTORY(tests)
  ADD_SUBDIRECTORY(examples)
 -ADD_SUBDIRECTORY(doc)
--
--FIND_PACKAGE(SWIG)
--
--IF ( SWIG_FOUND )
--  ADD_SUBDIRECTORY(bindings)
--ELSE ( SWIG_FOUND )
-- # for older version of swig/cmake
-- FIND_PROGRAM(SWIG_EXECUTABLE
--   NAMES swig-1.3 swig
--  PATHS ${SWIG_DIR} ${SWIG_DIR}/.. ${SWIG_DIR}/../../bin /usr/bin /usr/local/bin ${CMAKE_INSTALL_PREFIX}/bin
-- )
-- IF ( SWIG_EXECUTABLE )
--  ADD_SUBDIRECTORY(bindings)
-- ENDIF ( SWIG_EXECUTABLE )
--ENDIF ( SWIG_FOUND )
 +#ADD_SUBDIRECTORY(doc)
  
  MESSAGE(STATUS "version: ${VERSION}")
-- 
1.7.3.4



