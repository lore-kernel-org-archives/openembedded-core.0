Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Tm2qR-0001VZ-8F
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:40:59 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2012 05:26:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="260720236"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2012 05:26:02 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:26:27 +0200
Message-Id: <1356096387-5036-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libmusicbrainz: upgrade to git SRCREV 0749dd0a35b4a543
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
X-List-Received-Date: Fri, 21 Dec 2012 13:40:59 -0000

From: Constantin Musca <constantinx.musca@intel.com>

include/musicbrainz3/includes.h: removed from LIC_FILES_CHKSUM
    - the file is not present in the new version
fix_build_issue_for_gcc_4.5.0.patch: removed
    - the patched files are removed

[Other changes]
- moved to git (the last tag version doesn't support cross-compilation)
- we need to build the native make-c-interface executable before
configuring cmake for the target

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../allow-libdir-override.patch                    |    0
 .../fix_build_issue_for_gcc_4.5.0.patch            |   39 --------------------
 .../musicbrainz/libmusicbrainz_3.0.3.bb            |   22 -----------
 .../musicbrainz/libmusicbrainz_git.bb              |   36 ++++++++++++++++++
 4 files changed, 36 insertions(+), 61 deletions(-)
 rename meta/recipes-multimedia/musicbrainz/{libmusicbrainz-3.0.3 => files}/allow-libdir-override.patch (100%)
 delete mode 100644 meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch
 delete mode 100644 meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
 create mode 100644 meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb

diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch b/meta/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
similarity index 100%
rename from meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch
rename to meta/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch b/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch
deleted file mode 100644
index 6fb45e1..0000000
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-GCC 4.4 cleaned up some more C++ headers.  You always have to #include
-headers directly and cannot rely for things to be included indirectly.
-
-Otherwise you get errors like this:
-
-| /home/nitin/build/build0/tmp/work/i586-poky-linux/libmusicbrainz-3.0.2-r0/libmusicbrainz-3.0.2/src/utils_private.cpp: In function 'std::string MusicBrainz::intToString(int)':
-| /home/nitin/build/build0/tmp/work/i586-poky-linux/libmusicbrainz-3.0.2-r0/libmusicbrainz-3.0.2/src/utils_private.cpp:38:23: error: 'sprintf' was not declared in this scope
-| /home/nitin/build/build0/tmp/work/i586-poky-linux/libmusicbrainz-3.0.2-r0/libmusicbrainz-3.0.2/src/utils_private.cpp: In function 'void MusicBrainz::debug(const char*, ...)':
-| /home/nitin/build/build0/tmp/work/i586-poky-linux/libmusicbrainz-3.0.2-r0/libmusicbrainz-3.0.2/src/utils_private.cpp:80:10: error: 'stderr' was not declared in this scope
-| /home/nitin/build/build0/tmp/work/i586-poky-linux/libmusicbrainz-3.0.2-r0/libmusicbrainz-3.0.2/src/utils_private.cpp:80:33: error: 'fprintf' was not declared in this scope
-| /home/nitin/build/build0/tmp/work/i586-poky-linux/libmusicbrainz-3.0.2-r0/libmusicbrainz-3.0.2/src/utils_private.cpp:81:26: error: 'vfprintf' was not declared in this scope
-| make[2]: *** [src/CMakeFiles/musicbrainz3.dir/utils_private.o] Error 1
-| make[2]: *** Waiting for unfinished jobs....
-| /home/nitin/build/build0/tmp/work/i586-poky-linux/libmusicbrainz-3.0.2-r0/libmusicbrainz-3.0.2/src/xmlParser/xmlParser.cpp:116:1: warning: 'typedef' was ignored in this declaration
-| make[1]: *** [src/CMakeFiles/musicbrainz3.dir/all] Error 2
-| make: *** [all] Error 2
-| FATAL: oe_runmake failed
-NOTE: package libmusicbrainz-3.0.2-r0: task do_compile: Failed
-
-Found the solution here:
-http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=504895
-
-Date: 2010/07/28
-Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Upstream-Status: Inappropriate [debian patch]
-
-Index: libmusicbrainz-3.0.2/src/utils_private.cpp
-===================================================================
---- libmusicbrainz-3.0.2.orig/src/utils_private.cpp
-+++ libmusicbrainz-3.0.2/src/utils_private.cpp
-@@ -20,6 +20,7 @@
-  * $Id: utils_private.cpp 9934 2008-07-02 06:57:10Z luks $
-  */
-  
-+#include <cstdio>
- #include <cstdlib>
- #include <cstring>
- #include <cstdarg>
diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
deleted file mode 100644
index 913c463..0000000
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "MusicBrainz Client"
-DESCRIPTION = "The MusicBrainz client is a library which can be built into other programs.  The library allows you to access the data held on the MusicBrainz server."
-HOMEPAGE = "http://musicbrainz.org"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24 \
-                    file://include/musicbrainz3/includes.h;beginline=1;endline=21;md5=9ab2846573f560cea7561da472803a72"
-DEPENDS = "expat neon"
-
-PR = "r4"
-
-SRC_URI = "http://ftp.musicbrainz.org/pub/musicbrainz/${BPN}-${PV}.tar.gz \
-           file://fix_build_issue_for_gcc_4.5.0.patch \
-           file://allow-libdir-override.patch "
-
-LDFLAGS_prepend_libc-uclibc = " -lpthread "
-
-SRC_URI[md5sum] = "f4824d0a75bdeeef1e45cc88de7bb58a"
-SRC_URI[sha256sum] = "7fd459a9fd05be9faec60a9a21caa9a1e9fda03147d58d8c7c95f33582a738c5"
-
-inherit cmake pkgconfig
-
-EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir}"
diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
new file mode 100644
index 0000000..7343662
--- /dev/null
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "MusicBrainz Client"
+DESCRIPTION = "The MusicBrainz client is a library which can be built into other programs.  The library allows you to access the data held on the MusicBrainz server."
+HOMEPAGE = "http://musicbrainz.org"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "expat neon"
+
+PV = "5.0.1+git${SRCPV}"
+PR = "r0"
+
+SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
+SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
+           file://allow-libdir-override.patch "
+
+S = "${WORKDIR}/git"
+
+LDFLAGS_prepend_libc-uclibc = " -lpthread "
+
+
+inherit cmake pkgconfig
+
+do_configure_prepend() {
+    mkdir build-native
+    cd build-native
+    cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
+            -DCMAKE_C_COMPILER=${BUILD_CC} \
+            -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
+            -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
+            -DCMAKE_LINK_FLAGS=${BUILD_LDFLAGS} \
+            ..
+    make
+    cd ..
+}
+
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
+                -DIMPORT_EXECUTABLES=build-native/ImportExecutables.cmake"
-- 
1.7.10.4



