Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFCgd-0005cG-Ra
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 01:03:25 +0100
Received: by mail-ie0-f178.google.com with SMTP id c13so5503917ieb.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 16:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=6zwPSHjXt1vZqMPz7Ef39YL6Ih1SrOKLrXquQFkjFuM=;
	b=CH+37yn3sOwWzCAADZojgDfJS9eSkkAPneZ7rLLx/CD+n6YOTFcZ/F7Fx79ZNMd35h
	Ri+NvtQNL/ZibZFQ3b0tooIwqXEAajZJAczaz6ZClFK1WN8E1+EmXNxSe3lXbTvKdHoT
	tkDzAQp5yBkZSt6Ir6CGVjw96VsGhEvZASZWfLPjw0dNfIPB7Z6yZjsiUcW5UaKMhlwv
	n+JASUyDozFSz+ynUcd8oT4n9G4KNPnZZhQ5XVfj41PxqNJa4ECNfLu6iWqkwHMdUVGq
	KrJa1Rm9+aRqA/3wH2x8QeZAuFUQpcyMYuSByDuf+w8A/i2dPjOU/BMM4fAZMyvs34p1
	ehIg==
X-Received: by 10.50.37.162 with SMTP id z2mr9389306igj.13.1363045604787;
	Mon, 11 Mar 2013 16:46:44 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id xc3sm15742315igb.10.2013.03.11.16.46.42
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 16:46:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 16:46:36 -0700
Message-Id: <1363045596-18598-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmkVRhzFozZT2h/cuGBTRcvLWsHE1rc0QKpO2vL3ptWU1H7Fd4Z+MQpSNI3sxzEAJh0y4i8
Subject: [PATCH] musicbrainz: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 00:03:25 -0000

This is in meta-multimedia now, so remove from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../musicbrainz/files/allow-libdir-override.patch  |   21 -----------
 .../musicbrainz/libmusicbrainz_git.bb              |   38 --------------------
 2 files changed, 59 deletions(-)
 delete mode 100644 meta/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
 delete mode 100644 meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb

diff --git a/meta/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch b/meta/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
deleted file mode 100644
index d59d12e..0000000
--- a/meta/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.  We dont
-easily have a way of determining something that patches ${LIB_SUFFIX} so we'll
-set LIB_INSTALL_DIR.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
-
-Index: libmusicbrainz-3.0.3/CMakeLists.txt
-===================================================================
---- libmusicbrainz-3.0.3.orig/CMakeLists.txt
-+++ libmusicbrainz-3.0.3/CMakeLists.txt
-@@ -26,7 +26,7 @@ FIND_PACKAGE(DiscId)
- SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)")
- SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installation prefix for executables and object code libraries" FORCE)
- SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installation prefix for user executables" FORCE)
--SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries" FORCE)
-+SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries")
- SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "Installation prefix for C header files" FORCE)
- 
- CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz3.pc.cmake ${CMAKE_CURRENT_BINARY_DIR}/libmusicbrainz3.pc)
diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
deleted file mode 100644
index 21eec6d..0000000
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "MusicBrainz Client"
-DESCRIPTION = "The MusicBrainz client is a library which can be built into other programs.  The library allows you to access the data held on the MusicBrainz server."
-HOMEPAGE = "http://musicbrainz.org"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "expat neon"
-
-PV = "5.0.1+git${SRCPV}"
-PR = "r0"
-
-SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
-SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
-           file://allow-libdir-override.patch "
-
-S = "${WORKDIR}/git"
-
-LDFLAGS_prepend_libc-uclibc = " -lpthread "
-
-
-inherit cmake pkgconfig
-
-do_configure_prepend() {
-    # The native build really doesn't like being rebuilt, so delete
-    # it if it's already present.
-    rm -rf build-native
-    mkdir build-native
-    cd build-native
-    cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
-            -DCMAKE_C_COMPILER=${BUILD_CC} \
-            -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
-            -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
-            ..
-    make make-c-interface
-    cd ..
-}
-
-EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
-                -DIMPORT_EXECUTABLES=build-native/ImportExecutables.cmake"
-- 
1.7.10.4



