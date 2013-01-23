Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TxzOt-0007zF-81
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:26:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2013 04:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,521,1355126400"; d="scan'208";a="275597146"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2013 04:10:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 12:10:10 +0000
Message-Id: <dd41fec12e2da5b34fa2db67821010d4d5bd0906.1358942978.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] zypper: remove
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
X-List-Received-Date: Wed, 23 Jan 2013 12:26:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Functionality provided by Zypper is now covered more effectively by
Smart (python-smartpm) which is now being used for package management
on the target when enabled and RPM packaging is selected.

Fixes [YOCTO #3349].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/zypper/zypper/cmake.patch    |   22 -------
 .../zypper/zypper/cmake_libxml2.patch              |   28 ---------
 .../zypper/dso_linking_change_build_fix.patch      |   60 --------------------
 .../recipes-extended/zypper/zypper/gcc-scope.patch |   20 -------
 .../recipes-extended/zypper/zypper/rpm5-flag.patch |   18 ------
 meta/recipes-extended/zypper/zypper/rpmatch.patch  |   23 --------
 meta/recipes-extended/zypper/zypper_git.bb         |   29 ----------
 7 files changed, 200 deletions(-)
 delete mode 100644 meta/recipes-extended/zypper/zypper/cmake.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/cmake_libxml2.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/gcc-scope.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/rpm5-flag.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch
 delete mode 100644 meta/recipes-extended/zypper/zypper_git.bb

diff --git a/meta/recipes-extended/zypper/zypper/cmake.patch b/meta/recipes-extended/zypper/zypper/cmake.patch
deleted file mode 100644
index 8312a97..0000000
--- a/meta/recipes-extended/zypper/zypper/cmake.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-without the patch, /usr/include/rpm/ won't be added
-in cppflags
-
-8/19/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6b040a6..04a1595 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -21,6 +21,10 @@ SET( CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -g -O2 -Wall -fstack-protector" )
- 
- GENERATE_PACKAGING(${PACKAGE} ${VERSION})
- 
-+FIND_PACKAGE(PkgConfig REQUIRED)
-+PKG_CHECK_MODULES(RPM REQUIRED rpm)
-+INCLUDE_DIRECTORIES( ${RPM_INCLUDE_DIRS} )
-+
- FIND_PACKAGE( Zypp REQUIRED )
- IF( ZYPP_FOUND )
-   INCLUDE_DIRECTORIES(${ZYPP_INCLUDE_DIR})
diff --git a/meta/recipes-extended/zypper/zypper/cmake_libxml2.patch b/meta/recipes-extended/zypper/zypper/cmake_libxml2.patch
deleted file mode 100644
index 8cda7a4..0000000
--- a/meta/recipes-extended/zypper/zypper/cmake_libxml2.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: git/CMakeLists.txt
-===================================================================
---- git.orig/CMakeLists.txt	2011-12-20 15:13:59.851209493 -0800
-+++ git/CMakeLists.txt	2011-12-20 15:14:51.167211302 -0800
-@@ -25,6 +25,9 @@
- PKG_CHECK_MODULES(RPM REQUIRED rpm)
- INCLUDE_DIRECTORIES( ${RPM_INCLUDE_DIRS} )
- 
-+PKG_CHECK_MODULES(LIBXML REQUIRED libxml-2.0)
-+INCLUDE_DIRECTORIES( ${LIBXML_INCLUDE_DIRS} )
-+
- FIND_PACKAGE( Zypp REQUIRED )
- IF( ZYPP_FOUND )
-   INCLUDE_DIRECTORIES(${ZYPP_INCLUDE_DIR})
-@@ -70,6 +73,9 @@
- INCLUDE(CTest)
- ENABLE_TESTING()
- 
-+# New Augeas requires libxml now
-+PKG_CHECK_MODULES(LIBXML REQUIRED libxml-2.0)
-+INCLUDE_DIRECTORIES( ${LIBXML_INCLUDE_DIRS} )
- 
- # documentation too important to be hidden in doc:
- INSTALL(
diff --git a/meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch b/meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch
deleted file mode 100644
index 085762d..0000000
--- a/meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Pending
-
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids these linking errors:
-
-| Linking CXX executable zypp-refresh
-| cd /build_disk/poky_build/build0/tmp/work/i586-poky-linux/zypper-1.4.7-git0+9eb0e248e06c8d20ad054be2439149d9ede37531-r2/git/src && /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_script CMakeFiles/zypp-refresh.dir/link.txt --verbose=1
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/i586-poky-linux-g++   -march=i586  --sysroot=/build_disk/poky_build/build0/tmp/sysroots/i586-poky-linux  -fpermissive -g -O2 -Wall -Woverloaded-virtual -fstack-protector  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed CMakeFiles/zypp-refresh.dir/zypp-refresh.cc.o  -o zypp-refresh -rdynamic -lzypp
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: �: invalid DSO for symbol `pthread_cancel@@GLIBC_2.0' definition
-| /build_disk/poky_build/build0/tmp/sysroots/i586-poky-linux/lib/libpthread.so.0: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[2]: *** [src/zypp-refresh] Error 1
-| make[2]: Leaving directory `/build_disk/poky_build/build0/tmp/work/i586-poky-linux/zypper-1.4.7-git0+9eb0e248e06c8d20ad054be2439149d9ede37531-r2/git'
-| make[1]: *** [src/CMakeFiles/zypp-refresh.dir/all] Error 2
-
-
-| Linking CXX executable zypper
-| cd /build_disk/poky_build/build0/tmp/work/i586-poky-linux/zypper-1.4.7-git0+9eb0e248e06c8d20ad054be2439149d9ede37531-r3/git/src && /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_script CMakeFiles/zypper.dir/link.txt --verbose=1
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/i586-poky-linux-g++   -march=i586  --sysroot=/build_disk/poky_build/build0/tmp/sysroots/i586-poky-linux  -fpermissive -g -O2 -Wall -Woverloaded-virtual -fstack-protector  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed CMakeFiles/zypper.dir/main.cc.o  -o zypper -rdynamic libzypper_lib.a -lzypp -lreadline -laugeas -laugeas
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: �: invalid DSO for symbol `pthread_cancel@@GLIBC_2.0' definition
-| /build_disk/poky_build/build0/tmp/sysroots/i586-poky-linux/lib/libpthread.so.0: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[2]: *** [src/zypper] Error 1
-
-
-| Linking CXX executable zypper
-| cd /build_disk/poky_build/build0/tmp/work/i586-poky-linux/zypper-1.4.7-git0+9eb0e248e06c8d20ad054be2439149d9ede37531-r3/git/src && /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_script CMakeFiles/zypper.dir/link.txt --verbose=1
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/bin/i586-poky-linux/i586-poky-linux-g++   -march=i586  --sysroot=/build_disk/poky_build/build0/tmp/sysroots/i586-poky-linux  -fpermissive -g -O2 -Wall -Woverloaded-virtual -fstack-protector  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed CMakeFiles/zypper.dir/main.cc.o  -o zypper -rdynamic libzypper_lib.a -lzypp -lreadline -laugeas -laugeas -lpthread
-| /build_disk/poky_build/build0/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: �: invalid DSO for symbol `clock_gettime@@GLIBC_2.2' definition
-| /build_disk/poky_build/build0/tmp/sysroots/i586-poky-linux/lib/librt.so.1: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[2]: *** [src/zypper] Error 1
-
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/19
-
-
-Index: git/src/CMakeLists.txt
-===================================================================
---- git.orig/src/CMakeLists.txt	2010-12-20 00:02:02.000000000 -0800
-+++ git/src/CMakeLists.txt	2011-01-19 09:23:13.432758255 -0800
-@@ -93,7 +93,7 @@
- TARGET_LINK_LIBRARIES( zypper_lib ${ZYPP_LIBRARY} ${READLINE_LIBRARY} -laugeas ${AUGEAS_LIBRARY} )
- 
- ADD_EXECUTABLE( zypper main.cc )
--TARGET_LINK_LIBRARIES( zypper zypper_lib ${ZYPP_LIBRARY} ${READLINE_LIBRARY} -laugeas ${AUGEAS_LIBRARY} -lrt )
-+TARGET_LINK_LIBRARIES( zypper zypper_lib ${ZYPP_LIBRARY} ${READLINE_LIBRARY} -laugeas ${AUGEAS_LIBRARY} -lrt -lpthread )
- 
- 
- INSTALL(
-@@ -115,7 +115,7 @@
- 
- # zypp-refresh utility
- ADD_EXECUTABLE( zypp-refresh zypp-refresh.cc )
--TARGET_LINK_LIBRARIES( zypp-refresh ${ZYPP_LIBRARY} )
-+TARGET_LINK_LIBRARIES( zypp-refresh ${ZYPP_LIBRARY} -lpthread )
- INSTALL(
-   TARGETS zypp-refresh
-   RUNTIME DESTINATION ${INSTALL_PREFIX}/sbin
diff --git a/meta/recipes-extended/zypper/zypper/gcc-scope.patch b/meta/recipes-extended/zypper/zypper/gcc-scope.patch
deleted file mode 100644
index a35c0d9..0000000
--- a/meta/recipes-extended/zypper/zypper/gcc-scope.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix errors like below
-
-| /home/kraj/work/openembedded-core/build/tmp-eglibc/work/qemumips-oe-linux/zypper-1.5.3-git1+2c5bb6ceb99ecd950ef993e43d77bf0569ea0582-r1/git/src/utils/console.cc:55:8: error: '::isatty' has not been declared                                                                                                                                                  
-| /home/kraj/work/openembedded-core/build/tmp-eglibc/work/qemumips-oe-linux/zypper-1.5.3-git1+2c5bb6ceb99ecd950ef993e43d77bf0569ea0582-r1/git/src/utils/console.cc:55:17: error: 'STDOUT_FILENO' was not declared in this scope                                                                                                                                   
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: git/src/utils/console.cc
-===================================================================
---- git.orig/src/utils/console.cc	2012-03-27 19:12:06.171036356 -0700
-+++ git/src/utils/console.cc	2012-03-27 19:12:52.887038622 -0700
-@@ -15,6 +15,7 @@
- #include <readline/readline.h>
- #include <readline/history.h>
- #include <cstdlib>
-+#include <unistd.h>
- 
- using namespace std;
- 
diff --git a/meta/recipes-extended/zypper/zypper/rpm5-flag.patch b/meta/recipes-extended/zypper/zypper/rpm5-flag.patch
deleted file mode 100644
index 89564a6..0000000
--- a/meta/recipes-extended/zypper/zypper/rpm5-flag.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-It's required by libzypp headers
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6b040a6..84431c8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -15,6 +15,7 @@ INCLUDE( ${ZYPPER_SOURCE_DIR}/VERSION.cmake )
- SET( VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}" )
- ADD_DEFINITIONS( -D_FILE_OFFSET_BITS=64 )
- ADD_DEFINITIONS( -DVERSION="${VERSION}" )
-+ADD_DEFINITIONS( -D_RPM_5 )
- 
- SET( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O2 -Wall -Woverloaded-virtual -fstack-protector" )
- SET( CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -g -O2 -Wall -fstack-protector" )
diff --git a/meta/recipes-extended/zypper/zypper/rpmatch.patch b/meta/recipes-extended/zypper/zypper/rpmatch.patch
deleted file mode 100644
index a750a3b..0000000
--- a/meta/recipes-extended/zypper/zypper/rpmatch.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-rpmatch() is missing in uclibc so we provide a local definition
-in form of a macro
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: git/src/utils/prompt.h
-===================================================================
---- git.orig/src/utils/prompt.h	2012-06-06 15:51:00.899112775 -0700
-+++ git/src/utils/prompt.h	2012-06-06 15:52:17.003116762 -0700
-@@ -172,4 +172,12 @@
-   return errstr;
- }
- 
-+#ifdef __UCLIBC__
-+#define rpmatch(line) \
-+       ( (line == NULL)? -1 : \
-+         (*line == 'y' || *line == 'Y')? 1 : \
-+         (*line == 'n' || *line == 'N')? 0 : \
-+         -1 )
-+#endif /* __UCLIBC__ */
-+
- #endif /*ZYPPERPROMPT_H_*/
diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
deleted file mode 100644
index c5d7c61..0000000
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-HOMEPAGE = "http://gitorious.org/opensuse/zypper"
-DESCRIPTION  = "The ZYpp Linux Software management framework"
-
-LICENSE  = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
-
-DEPENDS  = "libzypp augeas"
-PR = "r3"
-SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
-
-inherit cmake
-
-SRC_URI = "git://github.com/openSUSE/zypper.git;protocol=git \
-           file://cmake.patch \
-           file://cmake_libxml2.patch \
-           file://dso_linking_change_build_fix.patch \
-           file://rpm5-flag.patch \
-           file://gcc-scope.patch \
-           file://rpmatch.patch \
-          "
-S = "${WORKDIR}/git"
-
-PV = "1.5.3-git${SRCPV}"
-
-RDEPENDS_${PN} = "rpm-libs"
-RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-OECMAKE_CXX_LINK_FLAGS_libc-uclibc += "-lintl"
-- 
1.7.10.4



