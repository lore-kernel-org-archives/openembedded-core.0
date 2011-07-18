Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QihBW-0002fG-AD
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 08:20:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2011 23:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,221,1309762800"; d="scan'208";a="26981737"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2011 23:16:01 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 14:13:02 +0800
Message-Id: <64bfac07f90375228081747d816e5e6a857ed467.1310969462.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310969462.git.dongxiao.xu@intel.com>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1310969462.git.dongxiao.xu@intel.com>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/4] xcb-proto: add multilib support.
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
X-List-Received-Date: Mon, 18 Jul 2011 06:20:06 -0000

There is hardcode of /usr/lib dir for some python files.
Fix it to support multilib.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../xcb/xcb-proto-1.6/aclocal.patch                |   22 ++++++++++++++++++++
 meta/recipes-graphics/xcb/xcb-proto.inc            |    3 +-
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 4 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch

diff --git a/meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch b/meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
new file mode 100644
index 0000000..124f146
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Inappropriate [configuration]
+
+diff -ruN xcb-proto-1.6-orig/aclocal.m4 xcb-proto-1.6/aclocal.m4
+--- xcb-proto-1.6-orig/aclocal.m4	2011-07-08 15:45:33.000000000 +0800
++++ xcb-proto-1.6/aclocal.m4	2011-07-08 15:48:19.000000000 +0800
+@@ -518,6 +518,7 @@
+   dnl general consensus is that you shouldn't need this ability.
+ 
+   AC_SUBST([PYTHON_PREFIX], ['${prefix}'])
++  AC_SUBST([PYTHON_LIB_PREFIX], ['${libdir}'])
+   AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
+ 
+   dnl At times (like when building shared libraries) you may want
+@@ -546,7 +547,7 @@
+        am_py_prefix=$prefix
+      fi
+      am_cv_python_pythondir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='$am_py_prefix'))" 2>/dev/null ||
+-     echo "$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
++     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
+      case $am_cv_python_pythondir in
+      $am_py_prefix*)
+        am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
diff --git a/meta/recipes-graphics/xcb/xcb-proto.inc b/meta/recipes-graphics/xcb/xcb-proto.inc
index cd7e115..76688c9 100644
--- a/meta/recipes-graphics/xcb/xcb-proto.inc
+++ b/meta/recipes-graphics/xcb/xcb-proto.inc
@@ -9,7 +9,8 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2"
+SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
+           file://aclocal.patch"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb b/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
index 3133977..1868f1a 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "04313e1d914b44d0e457f6c494fc178b"
 SRC_URI[sha256sum] = "f52bc1159b12496f002404eb5793c01277b20c82cb72c5ff076d7b25da9b5ca2"
diff --git a/meta/recipes-graphics/xcb/xcb-proto_git.bb b/meta/recipes-graphics/xcb/xcb-proto_git.bb
index 01a7d91..2711213 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_git.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_git.bb
@@ -3,7 +3,7 @@ DEFAULT_PREFERENCE = "-1"
 include xcb-proto.inc
 SRCREV = "d81ca233e98be8fa59e8c90d262c0516944c5a66"
 PV = "1.2+gitr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xcb/proto;protocol=git"
 S = "${WORKDIR}/git"
-- 
1.7.1



