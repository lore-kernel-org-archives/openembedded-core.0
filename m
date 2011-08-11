Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18wwBYRqzzgzoNIwvNAf1ltg+fh6HNRcyg=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrOnJ-0005rc-Np
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 08:31:06 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7B6QZsK022561
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 01:26:35 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 01:26:34 -0500
Message-Id: <1313043994-28945-2-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1313043994-28945-1-git-send-email-galak@kernel.crashing.org>
References: <1313043994-28945-1-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 2/2] xcb-proto: update based on changes to python.m4 in automake
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
X-List-Received-Date: Thu, 11 Aug 2011 06:31:06 -0000

1. We dont need the aclocal patch as this will be handled by automake
2. We need to update xcb-proto.pc.in to know about ${libdir} since
   we'll end up with something like:

   pythondir=${libdir}/python2.6/site-packages

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../xcb/xcb-proto-1.6/aclocal.patch                |   22 --------------------
 .../xcb/xcb-proto-1.6/xcb-proto-libdir.patch       |   14 ++++++++++++
 meta/recipes-graphics/xcb/xcb-proto.inc            |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 5 files changed, 17 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
 create mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch

diff --git a/meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch b/meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
deleted file mode 100644
index 124f146..0000000
--- a/meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -ruN xcb-proto-1.6-orig/aclocal.m4 xcb-proto-1.6/aclocal.m4
---- xcb-proto-1.6-orig/aclocal.m4	2011-07-08 15:45:33.000000000 +0800
-+++ xcb-proto-1.6/aclocal.m4	2011-07-08 15:48:19.000000000 +0800
-@@ -518,6 +518,7 @@
-   dnl general consensus is that you shouldn't need this ability.
- 
-   AC_SUBST([PYTHON_PREFIX], ['${prefix}'])
-+  AC_SUBST([PYTHON_LIB_PREFIX], ['${libdir}'])
-   AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
- 
-   dnl At times (like when building shared libraries) you may want
-@@ -546,7 +547,7 @@
-        am_py_prefix=$prefix
-      fi
-      am_cv_python_pythondir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='$am_py_prefix'))" 2>/dev/null ||
--     echo "$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
-+     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
-      case $am_cv_python_pythondir in
-      $am_py_prefix*)
-        am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
diff --git a/meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch b/meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch
new file mode 100644
index 0000000..708f329
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+
+Index: xcb-proto-1.6/xcb-proto.pc.in
+===================================================================
+--- xcb-proto-1.6.orig/xcb-proto.pc.in
++++ xcb-proto-1.6/xcb-proto.pc.in
+@@ -1,4 +1,5 @@
+ prefix=@prefix@
++libdir=@libdir@
+ datarootdir=@datarootdir@
+ datadir=@datadir@
+ xcbincludedir=@xcbincludedir@
diff --git a/meta/recipes-graphics/xcb/xcb-proto.inc b/meta/recipes-graphics/xcb/xcb-proto.inc
index 76688c9..85f89be 100644
--- a/meta/recipes-graphics/xcb/xcb-proto.inc
+++ b/meta/recipes-graphics/xcb/xcb-proto.inc
@@ -10,7 +10,7 @@ SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
-           file://aclocal.patch"
+           file://xcb-proto-libdir.patch"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb b/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
index 1868f1a..9d35596 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_1.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "04313e1d914b44d0e457f6c494fc178b"
 SRC_URI[sha256sum] = "f52bc1159b12496f002404eb5793c01277b20c82cb72c5ff076d7b25da9b5ca2"
diff --git a/meta/recipes-graphics/xcb/xcb-proto_git.bb b/meta/recipes-graphics/xcb/xcb-proto_git.bb
index 2711213..4358fee 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_git.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_git.bb
@@ -3,7 +3,7 @@ DEFAULT_PREFERENCE = "-1"
 include xcb-proto.inc
 SRCREV = "d81ca233e98be8fa59e8c90d262c0516944c5a66"
 PV = "1.2+gitr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xcb/proto;protocol=git"
 S = "${WORKDIR}/git"
-- 
1.7.3.4



