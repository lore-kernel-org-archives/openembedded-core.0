Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5329C6AA07
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 11:26:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jul 2013 04:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="365247798"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.242])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2013 04:26:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 12:26:04 +0100
Message-Id: <1372937164-14095-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] cmake: fix configure error if system Qt installation is broken
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
X-List-Received-Date: Thu, 04 Jul 2013 11:26:06 -0000

If the host Qt installation exists but is incomplete or the installed
qmake architecture doesn't match that of the Qt libraries, cmake was
failing at do_configure. cmake 2.8.10 failed silently here so we should
make 2.8.11 do the same.

Fixes [YOCTO #4565].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 .../cmake/cmake/qt4-fail-silent.patch              | 55 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 6144d51..014ff5a 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
            file://support-oe-qt4-tools-names.patch \
            file://aarch64-cmake.patch \
            file://aarch64-kwsys.patch \
+           file://qt4-fail-silent.patch \
            "
 
 inherit autotools
diff --git a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
new file mode 100644
index 0000000..fd39f3f
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
@@ -0,0 +1,55 @@
+Fail silently if system Qt installation is broken
+
+Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
+following error if the system Qt installation is broken:
+
+CMake Error at Modules/FindQt4.cmake:1028 (set_property):
+  set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
+  been created.
+Call Stack (most recent call first):
+  Tests/RunCMake/CMakeLists.txt:79 (find_package)
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:20:42.092848274 +0100
++++ cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:52:15.693380555 +0100
+@@ -1025,21 +1025,22 @@
+     set(_configs)
+   endmacro()
+ 
+-
+-  # Set QT_xyz_LIBRARY variable and add
+-  # library include path to QT_INCLUDES
+-  _QT4_ADJUST_LIB_VARS(QtCore)
+-  set_property(TARGET Qt4::QtCore APPEND PROPERTY
+-    INTERFACE_INCLUDE_DIRECTORIES
+-      "${QT_MKSPECS_DIR}/default"
+-      ${QT_INCLUDE_DIR}
+-  )
+-  set_property(TARGET Qt4::QtCore PROPERTY
+-    INTERFACE_QT_MAJOR_VERSION 4
+-  )
+-  set_property(TARGET Qt4::QtCore APPEND PROPERTY
+-    COMPATIBLE_INTERFACE_STRING QT_MAJOR_VERSION
+-  )
++  if(QT_QTCORE_FOUND)
++    # Set QT_xyz_LIBRARY variable and add
++    # library include path to QT_INCLUDES
++    _QT4_ADJUST_LIB_VARS(QtCore)
++    set_property(TARGET Qt4::QtCore APPEND PROPERTY
++      INTERFACE_INCLUDE_DIRECTORIES
++        "${QT_MKSPECS_DIR}/default"
++        ${QT_INCLUDE_DIR}
++    )
++    set_property(TARGET Qt4::QtCore PROPERTY
++      INTERFACE_QT_MAJOR_VERSION 4
++    )
++    set_property(TARGET Qt4::QtCore APPEND PROPERTY
++      COMPATIBLE_INTERFACE_STRING QT_MAJOR_VERSION
++    )
++  endif()
+ 
+   foreach(QT_MODULE ${QT_MODULES})
+     _QT4_ADJUST_LIB_VARS(${QT_MODULE})
-- 
1.8.1.2


