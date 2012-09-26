Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGqlS-0007tV-Vi
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:30:54 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGqYM-0006Pe-FP
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:17:22 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 13:17:21 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348661842.31293.108.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 12:30:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 .../60_wait-longer-for-threads-to-die.patch        |   11 -----
 meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch   |   34 ++++++++--------
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |   43 --------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb      |   43 ++++++++++++++++++++
 4 files changed, 61 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch b/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
index 4ff7b80..67dfeca 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
@@ -7,17 +7,6 @@ Upstream-Status: Inappropriate [patches for test code]
 diff -ruN glib-2.30.0-orig/tests/threadpool-test.c glib-2.30.0/tests/threadpool-test.c
 --- glib-2.30.0-orig/tests/threadpool-test.c	2009-04-01 07:04:21.000000000 +0800
 +++ glib-2.30.0/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0800
-@@ -5,8 +5,8 @@
- 
- #include <glib.h>
- 
--#define DEBUG_MSG(x)
--/* #define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");  */
-+/* #define DEBUG_MSG(x) */
-+#define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");
- 
- #define WAIT                5    /* seconds */
- #define MAX_THREADS         10
 @@ -130,10 +130,10 @@
             test_count_threads () == 0)
           break;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch b/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
index 1e65643..f5b8384 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
@@ -5,21 +5,23 @@ Upstream-Status: Inappropriate [configuration]
 
 RP 2012/2/25
 
-Index: glib-2.30.2/configure.ac
-===================================================================
---- glib-2.30.2.orig/configure.ac	2012-02-25 14:50:07.444242397 +0000
-+++ glib-2.30.2/configure.ac	2012-02-25 14:51:28.096240485 +0000
-@@ -3769,10 +3769,9 @@
- # Check for libdbus1 - Optional - is only used in the GDBus test cases
+--- glib-2.34.0/configure.ac~	2012-09-25 12:06:14.383311239 +0100
++++ glib-2.34.0/configure.ac	2012-09-25 12:07:28.584958144 +0100
+@@ -3500,10 +3500,13 @@
  #
  # 1.2.14 required for dbus_message_set_serial
--PKG_CHECK_MODULES(DBUS1,
--                  dbus-1 >= 1.2.14,
--                  [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is available]) have_dbus1=yes],
--                  have_dbus1=no)
-+DBUS1_CFLAGS=
-+DBUS1_LIBS=
-+$have_dbus1=no      
- AC_SUBST(DBUS1_CFLAGS)
- AC_SUBST(DBUS1_LIBS)
- AM_CONDITIONAL(HAVE_DBUS1, [test "x$have_dbus1" = "xyes"])
+ AS_IF([ test x$enable_modular_tests = xyes], [
+-   PKG_CHECK_MODULES(DBUS1,
+-                     dbus-1 >= 1.2.14,
+-                     [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is available]) have_dbus1=yes],
+-                     have_dbus1=no)
++#   PKG_CHECK_MODULES(DBUS1,
++#                     dbus-1 >= 1.2.14,
++#                     [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is available]) have_dbus1=yes],
++#                     have_dbus1=no)
++   DBUS1_CFLAGS=
++   DBUS1_LIBS=
++   have_dbus1=no
+    AC_SUBST(DBUS1_CFLAGS)
+    AC_SUBST(DBUS1_LIBS)
+ ])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
deleted file mode 100644
index 10c0b61..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-require glib.inc
-
-PR = "r6"
-PE = "1"
-
-DEPENDS += "libffi python-argparse-native zlib"
-DEPENDS_virtclass-native += "libffi-native python-argparse-native"
-DEPENDS_virtclass-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
-
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://configure-libtool.patch \
-           file://60_wait-longer-for-threads-to-die.patch \
-           file://glib-2.0_fix_for_x32.patch \
-           file://nodbus.patch \
-           file://nolibelf.patch \
-          "
-SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
-SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"
-
-SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
-BBCLASSEXTEND = "native nativesdk"
-
-do_configure_prepend() {
-	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-}
-
-do_install_append() {
-  # remove some unpackaged files
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
-  # and empty dirs
-  rmdir ${D}${libdir}/gio/modules/
-  rmdir ${D}${libdir}/gio/
-
-  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-  if [ -f ${D}${bindir}/glib-mkenums ]; then
-    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
-  fi
-}
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb
new file mode 100644
index 0000000..f4e3682
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb
@@ -0,0 +1,43 @@
+require glib.inc
+
+PR = "r0"
+PE = "1"
+
+DEPENDS += "libffi python-argparse-native zlib"
+DEPENDS_virtclass-native += "libffi-native python-argparse-native"
+DEPENDS_virtclass-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+
+SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
+           file://configure-libtool.patch \
+           file://60_wait-longer-for-threads-to-die.patch \
+           file://glib-2.0_fix_for_x32.patch \
+           file://nolibelf.patch \
+           file://nodbus.patch \
+          "
+SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
+SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"
+
+SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
+BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend() {
+	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
+	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+}
+
+do_install_append() {
+  # remove some unpackaged files
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
+  # and empty dirs
+  rmdir ${D}${libdir}/gio/modules/
+  rmdir ${D}${libdir}/gio/
+
+  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+  if [ -f ${D}${bindir}/glib-mkenums ]; then
+    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
+  fi
+}
-- 
1.7.10.4





