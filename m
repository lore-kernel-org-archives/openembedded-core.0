Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18GdU41/Q/TtduCivytnsiQslh5EVf4K5g=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqrEc-0004Ag-Hd
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:41:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79IaY5Y029918
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 13:36:34 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 13:36:30 -0500
Message-Id: <1312914992-18260-3-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1312914992-18260-2-git-send-email-galak@kernel.crashing.org>
References: <1312914992-18260-1-git-send-email-galak@kernel.crashing.org>
	<1312914992-18260-2-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 2/4] xcb-proto: use python-dir class for proper path setting
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
X-List-Received-Date: Tue, 09 Aug 2011 18:41:03 -0000

The previous patch to deal with multilib that patched aclocal doesn't
work in all cases as we might regenerate aclocal and thus the
modification is overwritten.

Instead we can utilize python-dir class to have it set:

am_cv_python_pythondir & am_cv_python_pyexecdir

for is to the proper path.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../xcb/xcb-proto-1.6/aclocal.patch                |   22 --------------------
 meta/recipes-graphics/xcb/xcb-proto.inc            |    5 +--
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 4 files changed, 4 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch

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
diff --git a/meta/recipes-graphics/xcb/xcb-proto.inc b/meta/recipes-graphics/xcb/xcb-proto.inc
index 76688c9..048a8e2 100644
--- a/meta/recipes-graphics/xcb/xcb-proto.inc
+++ b/meta/recipes-graphics/xcb/xcb-proto.inc
@@ -9,10 +9,9 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2 \
-           file://aclocal.patch"
+SRC_URI = "http://xcb.freedesktop.org/dist/xcb-proto-${PV}.tar.bz2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig python-dir
 
 PACKAGES += "python-xcbgen"
 
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



