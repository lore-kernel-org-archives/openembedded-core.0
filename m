Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO3-0000dX-JD
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926370"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:27:55 -0700
Message-Id: <5edcb56c6c7ff3684438edec22436566955763d7.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/14] libmusicbrainz: utilize base_libdir when configured
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:36 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Pass $libdir through when we configure to support a location
other than /lib.  We also have to tweak the cmake files to allow $libdir
to even be set.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
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



