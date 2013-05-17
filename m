Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UdJ5P-0000ZB-9F
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:44:47 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 387609536
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 12:26:09 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 12:25:42 +0100
Message-Id: <1368789942-7476-8-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH 7/7] Update mx recipe to build with clutter 1.14.4
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
X-List-Received-Date: Fri, 17 May 2013 11:45:08 -0000

From: Tomas Frydrych <tomas@sleepfive.com>


Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 .../recipes-graphics/mx/mx-1.4/fix-build-dir.patch |   43 ++++++++++++++++++++
 meta/recipes-graphics/mx/mx.inc                    |   20 +++++++++
 .../recipes-graphics/mx/mx/fix-test-includes.patch |   17 ++++++++
 meta/recipes-graphics/mx/mx_1.4.7.bb               |   26 +++++-------
 4 files changed, 91 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch
 create mode 100644 meta/recipes-graphics/mx/mx.inc
 create mode 100644 meta/recipes-graphics/mx/mx/fix-test-includes.patch

diff --git a/meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch b/meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch
new file mode 100644
index 0000000..667f526
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx-1.4/fix-build-dir.patch
@@ -0,0 +1,43 @@
+# Fixup for S != B
+# This patch is specific to version 1.4.x
+# Upstream-status: Pending
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
index 0000000..a3b49bd
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -0,0 +1,20 @@
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
diff --git a/meta/recipes-graphics/mx/mx/fix-test-includes.patch b/meta/recipes-graphics/mx/mx/fix-test-includes.patch
new file mode 100644
index 0000000..eee62b6
--- /dev/null
+++ b/meta/recipes-graphics/mx/mx/fix-test-includes.patch
@@ -0,0 +1,17 @@
+# Fix missing include directory
+# This patch is currently required for all versions of mx
+# Upstream-status: Pending
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
index fd9189b..4c4c8eb 100644
--- a/meta/recipes-graphics/mx/mx_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx_1.4.7.bb
@@ -1,18 +1,14 @@
-DESCRIPTION = "Clutter based widget library"
-LICENSE = "LGPLv2.1"
+require mx.inc
 
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
-                    file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
-
-PR = "r0"
-
-DEPENDS = "clutter-1.8 dbus-glib libxrandr gdk-pixbuf startup-notification"
+# The 1.4.7 tag does not build against cogl 1.14, pull in a revision with a fix
+SRCREV = "9b1db6b8060bd00b121a692f942404a24ae2960f"
+PV = "1.4.7+git${SRCPV}"
 
-inherit autotools gettext
+SRC_URI = "git://github.com/clutter-project/mx.git;protocol=git \
+	   file://fix-build-dir.patch \
+	   file://fix-test-includes.patch \
+	  "
+S = "${WORKDIR}/git"
 
-SRC_URI = "https://github.com/downloads/clutter-project/${BPN}/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "19b1e4918a5ae6d014fc0dab2bb3d0a1"
-SRC_URI[sha256sum] = "1d2930d196717cacbee0ee101cf21d289b8200b5e938823d852b3b4a2f4a0e9d"
-
-EXTRA_OECONF = "--disable-introspection --disable-gtk-widgets --with-dbus"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
+                    file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
-- 
1.7.10.4



