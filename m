Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82BB3719C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 02:58:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v092wrUD010641
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Jan 2017 18:58:53 -0800 (PST)
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 8 Jan 2017 18:58:52 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Mon, 9 Jan 2017 10:54:02 +0800
Message-ID: <1483930443-12454-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: add configure option to control dbus related checking
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
X-List-Received-Date: Mon, 09 Jan 2017 02:58:58 -0000
Content-Type: text/plain

Fixed the issue that checking dbus modules is not controlled by switch
'--enable-dbus/--disable-dbus" which causes the inconsistent building
output by the package building sequence of glib-2.0 and dbus.
Also add PACKAGECONFIG line to automatically get the right configure option.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 ...d-configure-option-support-to-enable-or-d.patch | 66 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb      |  1 +
 meta/recipes-core/glib-2.0/glib.inc                |  1 +
 3 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Add-configure-option-support-to-enable-or-d.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Add-configure-option-support-to-enable-or-d.patch b/meta/recipes-core/glib-2.0/glib-2.0/Add-configure-option-support-to-enable-or-d.patch
new file mode 100644
index 0000000..a076e93
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Add-configure-option-support-to-enable-or-d.patch
@@ -0,0 +1,66 @@
+From 80f989fb3bb3110db5fe17a57f6a2499d0aade5f Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Thu, 8 Dec 2016 16:39:36 +0800
+Subject: [PATCH] glib-2.0: Add configure option support to enable or disable
+ dbus.
+
+Add configure option "--enable-dbus" to check dbus related
+stuff to avoid checking them directly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ configure.ac | 29 ++++++++++++++++++-----------
+ 1 file changed, 18 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 72c49c3..81a0943 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -232,7 +232,10 @@ AC_ARG_ENABLE(debug,
+               AS_HELP_STRING([--enable-debug=@<:@no/minimum/yes@:>@],
+                              [turn on debugging @<:@default=glib_debug_default@:>@]),,
+               enable_debug=glib_debug_default)
+-
++AC_ARG_ENABLE(dbus,
++              [AS_HELP_STRING([--enable-dbus],
++                              [for GDBus test cases only])],,
++              [enable_dbus=no])
+ AC_ARG_ENABLE(gc_friendly,
+               [AS_HELP_STRING([--enable-gc-friendly],
+                               [turn on garbage collector friendliness [default=no]])],,
+@@ -3427,16 +3430,20 @@ AC_CHECK_ALIGNOF([unsigned long])
+ # Check for libdbus1 - Optional - is only used in the GDBus test cases
+ #
+ # 1.2.14 required for dbus_message_set_serial
+-PKG_CHECK_MODULES(DBUS1,
+-     dbus-1 >= 1.2.14,
+-     [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is available]) have_dbus1=yes],
+-     have_dbus1=no)
+-AC_SUBST(DBUS1_CFLAGS)
+-AC_SUBST(DBUS1_LIBS)
+-AM_CONDITIONAL(HAVE_DBUS1, [test "x$have_dbus1" = "xyes"])
+-
+-AC_CHECK_PROGS([DBUS_DAEMON], [dbus-daemon])
+-AM_CONDITIONAL([HAVE_DBUS_DAEMON], [test x$DBUS_DAEMON = xdbus-daemon ])
++AM_CONDITIONAL([HAVE_DBUS_DAEMON], [ 0 ])
++AM_CONDITIONAL(HAVE_DBUS1, [ 0 ])
++if test "x$enable_dbus" = "xyes"; then
++	PKG_CHECK_MODULES(DBUS1,
++		dbus-1 >= 1.2.14,
++		[AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is available]) have_dbus1=yes],
++		have_dbus1=no)
++	AC_SUBST(DBUS1_CFLAGS)
++	AC_SUBST(DBUS1_LIBS)
++	AM_CONDITIONAL(HAVE_DBUS1, [test "x$have_dbus1" = "xyes"])
++
++	AC_CHECK_PROGS([DBUS_DAEMON], [dbus-daemon])
++	AM_CONDITIONAL([HAVE_DBUS_DAEMON], [test x$DBUS_DAEMON = xdbus-daemon ])
++fi
+ 
+ dnl
+ dnl Check for -Bsymbolic-functions linker flag used to avoid
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
index b7a0670..e55cbb1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.50.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
+           file://Add-configure-option-support-to-enable-or-d.patch \
            "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cb6aca7..ab178f3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -35,6 +35,7 @@ PACKAGECONFIG ??= "system-pcre libmount"
 PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-pcre=internal,libpcre"
 PACKAGECONFIG[libmount] = "--enable-libmount,--disable-libmount,util-linux"
 PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
 
-- 
1.9.1


