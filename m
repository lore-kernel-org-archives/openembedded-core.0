Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19G4h/GD+dRNMJiq6f++4dG+jjaFB/nX1E=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qop4m-0004VV-Rf
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 05:58:29 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p743s5mr001469
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 22:54:05 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 22:54:05 -0500
Message-Id: <1312430045-4947-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH v3] libmusicbrainz: utilize base_libdir when configured
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
X-List-Received-Date: Thu, 04 Aug 2011 03:58:29 -0000

Pass $libdir through when we configure to support a location
other than /lib.  We also have to tweak the cmake files to allow $libdir
to even be set.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
v2: Make it libdir instead of base_libdir
v3: added patch to make it so we can set libdir and it works

 .../allow-libdir-override.patch                    |   19 +++++++++++++++++++
 .../musicbrainz/libmusicbrainz_3.0.3.bb            |    7 +++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch

diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch b/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch
new file mode 100644
index 0000000..88f414a
--- /dev/null
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch
@@ -0,0 +1,19 @@
+Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.  We dont
+easily have a way of determining something that patches ${LIB_SUFFIX} so we'll
+set LIB_INSTALL_DIR.
+
+Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+
+Index: libmusicbrainz-3.0.3/CMakeLists.txt
+===================================================================
+--- libmusicbrainz-3.0.3.orig/CMakeLists.txt
++++ libmusicbrainz-3.0.3/CMakeLists.txt
+@@ -26,7 +26,7 @@ FIND_PACKAGE(DiscId)
+ SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)")
+ SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installation prefix for executables and object code libraries" FORCE)
+ SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installation prefix for user executables" FORCE)
+-SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries" FORCE)
++SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries")
+ SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "Installation prefix for C header files" FORCE)
+ 
+ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz3.pc.cmake ${CMAKE_CURRENT_BINARY_DIR}/libmusicbrainz3.pc)
diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
index d6fb2f4..4814b6d 100644
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
@@ -6,12 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24 \
                     file://include/musicbrainz3/includes.h;beginline=1;endline=21;md5=9ab2846573f560cea7561da472803a72"
 DEPENDS = "expat neon"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://ftp.musicbrainz.org/pub/musicbrainz/${BPN}-${PV}.tar.gz \
-           file://fix_build_issue_for_gcc_4.5.0.patch "
+           file://fix_build_issue_for_gcc_4.5.0.patch \
+           file://allow-libdir-override.patch "
 
 SRC_URI[md5sum] = "f4824d0a75bdeeef1e45cc88de7bb58a"
 SRC_URI[sha256sum] = "7fd459a9fd05be9faec60a9a21caa9a1e9fda03147d58d8c7c95f33582a738c5"
 
 inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir}"
-- 
1.7.3.4



