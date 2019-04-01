Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 928C47D037
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:22:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id q16so9977291wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MHUhQBBEwm00dElS17S8w4LK1B82VJbuZ1AGzQEM1i4=;
	b=T4txmI0+sfRGzTSLqHD3t40tVFiiaAxb61o0dvVoRnxBh3Lr7L3ucV6BfK6OMi22sG
	4TR2W13JhC+VZzdzPiJVQeK6bw0bjXSdpvuRuFg3AvRcz5DToIb6fIvwagALmmTvHo1E
	dJ/dZFCueVxOunv2ZF/YWZtXVVKk1GW8+PrW66q15OycCyYLx2Czm+Bh6y4ElqETQAF+
	iGR9RzHzhLmz83fnf2QbuNOrVoHP0lwBEDA4pl3/QUywo9bIY3WWQu8nsn8emfRg+5LY
	lrYztM8GyUwWa7K9mLD763DB8iX9N1NL//cYp+ZaW13gGUFRi4g8jP6PjeRj/EBynXLi
	cRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MHUhQBBEwm00dElS17S8w4LK1B82VJbuZ1AGzQEM1i4=;
	b=MkDH8i7OkGednlSB7fFnMY7VYUuDRe2+zPoJ9bSfFUljMM+3H7Mjp9gD33Gd1qGLWx
	Gd9yZ/jr/2DEj439zhaXpK6XudvORwFvZiSVaNqDJASW84tpSVMNbaXLa21nowk0qUp3
	NG7sKOqAFhedae494XprAkifAT83Jlm92MID1tMF0H57431PWcV1a0PkoxH1mw5zUgAY
	mKaczsZD8EZr4wUHlwIn8R5VWFTDGa26aO/itetrmokWNTV09FEna1EV9vNjKEausz5U
	xzG/+2Tv5MVii+cjKa2zWHa1c81/AWfMZOxmwwmy7Ghy0TtSxAPOmGB78dBPaKUn1FDH
	lXBA==
X-Gm-Message-State: APjAAAUwiTT+2VzINOy9UA68QrJSI7jOw8drO5ePuZxVViO7WBV3Ll1w
	M5/uiI30Bw9+CRbDi9OQt6KsJlSk6xk=
X-Google-Smtp-Source: APXvYqzSOovNTuJAz4WihKdh8ELseV+TeT7bbo3MFILMs3Ee5jc5aNYXJ8ZvDoiSBJcPw8eEQtPnAg==
X-Received: by 2002:a1c:16:: with SMTP id 22mr11371698wma.91.1554117744868;
	Mon, 01 Apr 2019 04:22:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t24sm11331293wmi.10.2019.04.01.04.22.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 04:22:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 12:22:21 +0100
Message-Id: <20190401112221.29128-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsolv: use GNUInstallDirs
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
X-List-Received-Date: Mon, 01 Apr 2019 11:22:25 -0000

Backport a patch from upstream to use GNUInstallDirs instead of hand-coded path
logic, so we have proper control over where files end up.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libsolv/0001-build-use-GNUInstallDirs.patch    | 188 +++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.7.3.bb     |   3 +-
 2 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch b/meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch
new file mode 100644
index 00000000000..75ef1500524
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch
@@ -0,0 +1,188 @@
+Backport a patch from upstream to use GNUInstallDirs instead of
+hand-coded path logic, so we have proper control over where files end up.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b6c9df4c686975ce5009d09dac706a4e83f02a31 Mon Sep 17 00:00:00 2001
+From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
+Date: Mon, 2 Jul 2018 12:56:41 +0100
+Subject: [PATCH] build: use GNUInstallDirs
+
+Fixes: #128
+Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
+---
+ CMakeLists.txt               | 34 +++++++---------------------------
+ README                       |  2 +-
+ doc/CMakeLists.txt           |  4 ++--
+ examples/solv/CMakeLists.txt |  2 +-
+ ext/CMakeLists.txt           |  8 ++++----
+ libsolv.pc.in                |  4 ++--
+ libsolvext.pc.in             |  4 ++--
+ src/CMakeLists.txt           |  8 ++++----
+ tools/CMakeLists.txt         |  3 +--
+ 9 files changed, 24 insertions(+), 45 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1deef57d..7e9ffa9b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ PROJECT (libsolv)
+ 
+-CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
++CMAKE_MINIMUM_REQUIRED (VERSION 2.8.5)
+ 
+ OPTION (ENABLE_STATIC "Build a static version of the libraries?" OFF)
+ OPTION (DISABLE_SHARED "Do not build a shared version of the libraries?" OFF)
+@@ -38,34 +38,14 @@ OPTION (ENABLE_ZCHUNK_COMPRESSION "Build with zchunk compression support?" OFF)
+ OPTION (WITH_SYSTEM_ZCHUNK "Use system zchunk library?" OFF)
+ OPTION (WITH_LIBXML2  "Build with libxml2 instead of libexpat?" OFF)
+ 
+-# Library
+-IF (DEFINED LIB)
+-  SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/${LIB}")
+-ELSE (DEFINED  LIB)
+-  IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+-    SET (LIB_SUFFIX "64")
+-  ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+-  SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
+-ENDIF (DEFINED  LIB)
+-MESSAGE (STATUS "Libraries will be installed in ${LIB_INSTALL_DIR}")
+-# Library
+-IF (DEFINED INCLUDE)
+-  SET (INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/${INCLUDE}")
+-else (DEFINED INCLUDE)
+-  SET (INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/include")
+-ENDIF (DEFINED  INCLUDE)
+-MESSAGE (STATUS "Header files will be installed in ${INCLUDE_INSTALL_DIR}")
+-SET (BIN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/bin")
+-IF (NOT MAN_INSTALL_DIR)
+-SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share/man")
+-IF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man")
+-  SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/man")
+-ENDIF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man")
+-ENDIF (NOT MAN_INSTALL_DIR)
+-MESSAGE(STATUS "Man pages will be installed in ${MAN_INSTALL_DIR}")
++include (GNUInstallDirs)
++message (STATUS "Libraries will be installed in ${CMAKE_INSTALL_FULL_LIBDIR}")
++message (STATUS "Header files will be installed in ${CMAKE_INSTALL_FULL_INCLUDEDIR}")
++message (STATUS "Binaries will be installed in ${CMAKE_INSTALL_FULL_BINDIR}")
++message (STATUS "Man pages will be installed in ${CMAKE_INSTALL_FULL_MANDIR}")
+ 
+ IF (NOT PKGCONFIG_INSTALL_DIR)
+-  SET (PKGCONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/pkgconfig)
++  SET (PKGCONFIG_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ ENDIF (NOT PKGCONFIG_INSTALL_DIR)
+ ####################################################################
+ # CONFIGURATION                                                    #
+diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
+index 66011b48..ed38274e 100644
+--- a/doc/CMakeLists.txt
++++ b/doc/CMakeLists.txt
+@@ -48,8 +48,8 @@ STRING(REGEX REPLACE "([^;]+)" "gen/\\1" libsolv_MANPAGES3 "${libsolv_MANPAGES3}
+ 
+ INSTALL(FILES
+     ${libsolv_MANPAGES3}
+-    DESTINATION "${MAN_INSTALL_DIR}/man3")
++    DESTINATION "${CMAKE_INSTALL_MANDIR}/man3")
+ 
+ INSTALL(FILES
+     ${libsolv_MANPAGES1}
+-    DESTINATION "${MAN_INSTALL_DIR}/man1")
++    DESTINATION "${CMAKE_INSTALL_MANDIR}/man1")
+diff --git a/examples/solv/CMakeLists.txt b/examples/solv/CMakeLists.txt
+index 41f45f74..0f3bd477 100644
+--- a/examples/solv/CMakeLists.txt
++++ b/examples/solv/CMakeLists.txt
+@@ -25,5 +25,5 @@ TARGET_LINK_LIBRARIES (solv libsolvext libsolv ${SYSTEM_LIBRARIES})
+ 
+ INSTALL(TARGETS
+     solv
+-    DESTINATION ${BIN_INSTALL_DIR})
++    DESTINATION ${CMAKE_INSTALL_BINDIR})
+ 
+diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
+index edc2b9f9..6dd28b1a 100644
+--- a/ext/CMakeLists.txt
++++ b/ext/CMakeLists.txt
+@@ -145,14 +145,14 @@ ENDIF (DISABLE_SHARED)
+ 
+ SET_TARGET_PROPERTIES(libsolvext PROPERTIES OUTPUT_NAME "solvext")
+ SET_TARGET_PROPERTIES(libsolvext PROPERTIES SOVERSION ${LIBSOLVEXT_SOVERSION})
+-SET_TARGET_PROPERTIES(libsolvext PROPERTIES INSTALL_NAME_DIR ${LIB_INSTALL_DIR})
++SET_TARGET_PROPERTIES(libsolvext PROPERTIES INSTALL_NAME_DIR ${CMAKE_INSTALL_LIBDIR})
+ 
+-INSTALL (FILES ${libsolvext_HEADERS} DESTINATION "${INCLUDE_INSTALL_DIR}/solv")
+-INSTALL (TARGETS libsolvext LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR} RUNTIME DESTINATION bin)
++INSTALL (FILES ${libsolvext_HEADERS} DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/solv")
++INSTALL (TARGETS libsolvext LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
+ 
+ IF (ENABLE_STATIC AND NOT DISABLE_SHARED)
+ ADD_LIBRARY (libsolvext_static STATIC ${libsolvext_SRCS})
+ SET_TARGET_PROPERTIES(libsolvext_static PROPERTIES OUTPUT_NAME "solvext")
+ SET_TARGET_PROPERTIES(libsolvext_static PROPERTIES SOVERSION ${LIBSOLVEXT_SOVERSION})
+-INSTALL (TARGETS libsolvext_static LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR})
++INSTALL (TARGETS libsolvext_static LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ ENDIF (ENABLE_STATIC AND NOT DISABLE_SHARED)
+diff --git a/libsolv.pc.in b/libsolv.pc.in
+index 40a86230..766146c5 100644
+--- a/libsolv.pc.in
++++ b/libsolv.pc.in
+@@ -1,5 +1,5 @@
+-libdir=@LIB_INSTALL_DIR@
+-includedir=@INCLUDE_INSTALL_DIR@
++libdir=@CMAKE_INSTALL_FULL_LIBDIR@
++includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
+ 
+ Name: libsolv
+ Description: Library for solving packages
+diff --git a/libsolvext.pc.in b/libsolvext.pc.in
+index d48b6fab..d0078461 100644
+--- a/libsolvext.pc.in
++++ b/libsolvext.pc.in
+@@ -1,5 +1,5 @@
+-libdir=@LIB_INSTALL_DIR@
+-includedir=@INCLUDE_INSTALL_DIR@
++libdir=@CMAKE_INSTALL_FULL_LIBDIR@
++includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
+ 
+ Name: libsolvext
+ Description: Library for reading repositories
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 2e32968e..03ea9119 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -42,14 +42,14 @@ ENDIF (DISABLE_SHARED)
+ 
+ SET_TARGET_PROPERTIES(libsolv PROPERTIES OUTPUT_NAME "solv")
+ SET_TARGET_PROPERTIES(libsolv PROPERTIES SOVERSION ${LIBSOLV_SOVERSION})
+-SET_TARGET_PROPERTIES(libsolv PROPERTIES INSTALL_NAME_DIR ${LIB_INSTALL_DIR})
++SET_TARGET_PROPERTIES(libsolv PROPERTIES INSTALL_NAME_DIR ${CMAKE_INSTALL_LIBDIR})
+ 
+-INSTALL (FILES ${libsolv_HEADERS} DESTINATION "${INCLUDE_INSTALL_DIR}/solv")
+-INSTALL (TARGETS libsolv LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR} RUNTIME DESTINATION bin)
++INSTALL (FILES ${libsolv_HEADERS} DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/solv")
++INSTALL (TARGETS libsolv LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
+ 
+ IF (ENABLE_STATIC AND NOT DISABLE_SHARED)
+ ADD_LIBRARY (libsolv_static STATIC ${libsolv_SRCS})
+ SET_TARGET_PROPERTIES(libsolv_static PROPERTIES OUTPUT_NAME "solv")
+ SET_TARGET_PROPERTIES(libsolv_static PROPERTIES SOVERSION ${LIBSOLV_SOVERSION})
+-INSTALL (TARGETS libsolv_static LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR})
++INSTALL (TARGETS libsolv_static LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ ENDIF (ENABLE_STATIC AND NOT DISABLE_SHARED)
+diff --git a/tools/CMakeLists.txt b/tools/CMakeLists.txt
+index 802dc500..0d677f69 100644
+--- a/tools/CMakeLists.txt
++++ b/tools/CMakeLists.txt
+@@ -110,5 +110,4 @@ TARGET_LINK_LIBRARIES (testsolv libsolvext libsolv ${SYSTEM_LIBRARIES})
+ ADD_EXECUTABLE (repo2solv repo2solv.c )
+ TARGET_LINK_LIBRARIES (repo2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})
+ 
+-INSTALL (TARGETS ${tools_list} DESTINATION ${BIN_INSTALL_DIR})
+-
++INSTALL (TARGETS ${tools_list} DESTINATION ${CMAKE_INSTALL_BINDIR})
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.3.bb b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
index 3fe6f2c20ae..70c8dbc2e3b 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.3.bb
@@ -9,6 +9,7 @@ DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
            file://0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch \
+           file://0001-build-use-GNUInstallDirs.patch \
 "
 
 SRCREV = "dc7d0f1c3113f2c8217563166906bef3eb5d1ee1"
@@ -21,7 +22,7 @@ inherit cmake
 PACKAGECONFIG ??= "rpm"
 PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
 
-EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
+EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
 
 PACKAGES =+ "${PN}-tools ${PN}ext"
 
-- 
2.11.0


