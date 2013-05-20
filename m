Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UeRwM-00043Y-QV
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:23:59 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id DC5839536
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 16:05:33 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 16:05:24 +0100
Message-Id: <1369062325-30335-8-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <51969025.6040407@linux.intel.com>
	<1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v2 7/8] New mx recipe (1.4.7)
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
X-List-Received-Date: Mon, 20 May 2013 15:24:03 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

The package has been renamed to mx-1.0, keeping up with the upstream versioning
policy. The 1.14.7 tag does not build with clutter 1.14, so git revision
9b1db6b8060bd00b121a692f942404a24ae2960f from the 1.14 branch is used instead.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |   14 ++++++
 .../recipes-graphics/mx/mx-1.4/fix-build-dir.patch |   46 ++++++++++++++++++++
 meta/recipes-graphics/mx/mx.inc                    |   21 +++++++++
 .../recipes-graphics/mx/mx/fix-test-includes.patch |   20 +++++++++
 meta/recipes-graphics/mx/mx_1.4.7.bb               |   18 --------
 5 files changed, 101 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
 create mode 100644 meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch
 create mode 100644 meta/recipes-graphics/mx/mx.inc
 create mode 100644 meta/recipes-graphics/mx/mx/fix-test-includes.patch
 delete mode 100644 meta/recipes-graphics/mx/mx_1.4.7.bb

diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
new file mode 100644
index 0000000..4c4c8eb
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -0,0 +1,14 @@
+require mx.inc
+
+# The 1.4.7 tag does not build against cogl 1.14, pull in a revision with a fix
+SRCREV = "9b1db6b8060bd00b121a692f942404a24ae2960f"
+PV = "1.4.7+git${SRCPV}"
+
+SRC_URI = "git://github.com/clutter-project/mx.git;protocol=git \
+	   file://fix-build-dir.patch \
+	   file://fix-test-includes.patch \
+	  "
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
+                    file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
diff --git a/meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch b/meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch
new file mode 100644
index 0000000..e7481e9
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch
@@ -0,0 +1,46 @@
+Fix build for S != B
+
+This patch is specific to version 1.4.x
+Upstream-status: Submitted @ https://github.com/clutter-project/mx/issues/81
+Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
+--
+Index: git/docs/reference/libmx-gtk/Makefile.am
+===================================================================
+--- git.orig/docs/reference/libmx-gtk/Makefile.am	2013-05-08 15:07:02.027154788 +0100
++++ git/docs/reference/libmx-gtk/Makefile.am	2013-05-08 15:14:33.684318650 +0100
+@@ -1,3 +1,6 @@
++EXTRA_DIST=
++CLEANFILES=
++
+ ## Process this file with automake to produce Makefile.in
+ 
+ # We require automake 1.6 at least.
+@@ -77,7 +80,7 @@
+ GTKDOC_LIBS=$(MX_LIBS) $(top_builddir)/mx-gtk/libmx-gtk-$(MX_API_VERSION).la
+ 
+ # This includes the standard gtk-doc make rules, copied by gtkdocize.
+-include $(top_srcdir)/gtk-doc.make
++include $(top_builddir)/gtk-doc.make
+ 
+ # Other files to distribute
+ EXTRA_DIST += version.xml.in
+Index: git/docs/reference/libmx/Makefile.am
+===================================================================
+--- git.orig/docs/reference/libmx/Makefile.am	2013-05-08 15:07:02.027154788 +0100
++++ git/docs/reference/libmx/Makefile.am	2013-05-08 15:14:24.456378135 +0100
+@@ -1,3 +1,6 @@
++EXTRA_DIST=
++CLEANFILES=
++
+ ## Process this file with automake to produce Makefile.in
+ 
+ # We require automake 1.6 at least.
+@@ -106,7 +109,7 @@
+ GTKDOC_LIBS=$(MX_LIBS) $(top_builddir)/mx/libmx-$(MX_API_VERSION).la
+ 
+ # This includes the standard gtk-doc make rules, copied by gtkdocize.
+-include $(top_srcdir)/gtk-doc.make
++include $(top_builddir)/gtk-doc.make
+ 
+ # Other files to distribute
+ EXTRA_DIST += version.xml.in
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
new file mode 100644
index 0000000..e3b4b15
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "Clutter based widget library"
+LICENSE = "LGPLv2.1"
+
+inherit clutter
+
+DEPENDS = "clutter-1.0 dbus-glib gdk-pixbuf"
+
+SRC_URI = "http://source.clutter-project.org/sources/mx/${@get_verdir("${PV}")}/mx-${PV}.tar.xz"
+
+EXTRA_OECONF = "--disable-introspection		\
+	        --disable-gtk-doc		\
+	        --disable-gtk-widgets		\
+		--with-dbus			\
+		--with-winsys=none		\
+		--without-clutter-imcontext	\
+		--without-clutter-gesture	\
+		--without-startup-notification	\
+		--without-glade			\
+	       "
+
+FILES_${PN} += "${datadir}"
diff --git a/meta/recipes-graphics/mx/mx/fix-test-includes.patch b/meta/recipes-graphics/mx/mx/fix-test-includes.patch
new file mode 100644
index 0000000..c6496a9
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx/fix-test-includes.patch
@@ -0,0 +1,20 @@
+Fix missing include directory when building tests
+
+This patch is currently required for all versions of mx
+Upstream-status: Submitted @ https://github.com/clutter-project/mx/issues/82
+Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
+--
+Index: git/tests/Makefile.am
+===================================================================
+--- git.orig/tests/Makefile.am	2013-05-08 15:18:56.918596425 +0100
++++ git/tests/Makefile.am	2013-05-08 15:23:26.864781401 +0100
+@@ -10,7 +10,8 @@
+ 
+ INCLUDES = \
+ 	-I$(top_srcdir) \
+-	-I$(top_builddir)
++	-I$(top_builddir)\
++	-I$(top_builddir)/mx
+ 
+ noinst_PROGRAMS = 			\
+ 	test-deform-texture		\
diff --git a/meta/recipes-graphics/mx/mx_1.4.7.bb b/meta/recipes-graphics/mx/mx_1.4.7.bb
deleted file mode 100644
index fd9189b..0000000
--- a/meta/recipes-graphics/mx/mx_1.4.7.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Clutter based widget library"
-LICENSE = "LGPLv2.1"
-
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
-                    file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
-
-PR = "r0"
-
-DEPENDS = "clutter-1.8 dbus-glib libxrandr gdk-pixbuf startup-notification"
-
-inherit autotools gettext
-
-SRC_URI = "https://github.com/downloads/clutter-project/${BPN}/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "19b1e4918a5ae6d014fc0dab2bb3d0a1"
-SRC_URI[sha256sum] = "1d2930d196717cacbee0ee101cf21d289b8200b5e938823d852b3b4a2f4a0e9d"
-
-EXTRA_OECONF = "--disable-introspection --disable-gtk-widgets --with-dbus"
-- 
1.7.10.4



