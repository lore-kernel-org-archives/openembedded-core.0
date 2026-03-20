Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9691D108B91B
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11416.1774009661817116628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A1FD165C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 206B53F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] pkgconfig: remove
Date: Fri, 20 Mar 2026 12:27:30 +0000
Message-ID: <20260320122732.1630715-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320122732.1630715-1-ross.burton@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233604

We're now using pkgconf, so drop the pkgconfig recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 ...e-g-u-intptr-atomics-in-builtin-glib.patch | 157 ------------------
 ...0001-Do-not-use-bool-as-a-field-name.patch |  36 ----
 ...Update-AM_GLIB_GNU_GETTEXT-to-match-.patch |  41 -----
 .../pkgconfig/pkgconfig/pkg-config-esdk.in    |  24 ---
 .../pkgconfig/pkgconfig/pkg-config-native.in  |   7 -
 .../pkgconfig/pkgconfig_git.bb                |  78 ---------
 7 files changed, 344 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-Backpo=
rt-g-s-size-g-u-intptr-atomics-in-builtin-glib.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not=
-use-bool-as-a-field-name.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-g=
ettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-=
esdk.in
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-=
native.in
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 86a11867a1d..f9a600ff114 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -605,7 +605,6 @@ RECIPE_MAINTAINER:pn-pigz =3D "Hongxu Jia <hongxu.jia=
@windriver.com>"
 RECIPE_MAINTAINER:pn-pinentry =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-pixman =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-pkgconf =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-pkgconfig =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pm-utils =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pointercal-xinput =3D "Unassigned <unassigned@yocto=
project.org>"
 RECIPE_MAINTAINER:pn-pong-clock =3D "Unassigned <unassigned@yoctoproject=
.org>"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Backport-g-s-=
size-g-u-intptr-atomics-in-builtin-glib.patch b/meta/recipes-devtools/pkg=
config/pkgconfig/0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-gli=
b.patch
deleted file mode 100644
index 5ef4cec8118..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Backport-g-s-size-g-=
u-intptr-atomics-in-builtin-glib.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 5fb4ae80ae13ae134a33804b1938af0e9f27a222 Mon Sep 17 00:00:00 2001
-From: Dan Fuhry <dan@fuhry.com>
-Date: Sun, 26 Oct 2025 09:09:07 -0700
-Subject: [PATCH] Backport g(s)size -> g(u)intptr atomics in builtin glib=
 for
- gcc14 and clang15
-
-pkg-config 0.29.2 doesn't build on clang 15 and up and
-gcc 14 and up, due to -Wint-conversion now defaulting to being an error =
in
-both compilers. The old version of glib 2.36 bundled with pkg-config use=
s
-gssize/gssize as the return type of the g_atomic_pointer_* functions, wh=
ich
-newer versions of gcc and clang complain (rightly) is not portable (as
-these are aliased to long and ulong, respectively).
-
-This was previously addressed in glib upstream commit c762d511 [1] by Al=
ex
-Richardson on Dec 14, 2022. The attached patch backports Alex's change t=
o
-glib 2.36 bundled with pkg-config, and also switches to the newer
-__atomic_* intrinsics from commit 2eb37622 [2] (Philip Withnall).
-
-This patch has been tested on clang 17 and only clang 17.
-
-[1]
-https://gitlab.gnome.org/GNOME/glib/-/commit/c762d511346d3cb84cea3557a24=
6ccf8873b4a1c
-[2]
-https://gitlab.gnome.org/GNOME/glib/-/commit/2eb37622418a5c9f31a9d728a99=
bc621d3157ab0
-
-Upstream-Status: Submitted [https://lists.freedesktop.org/archives/pkg-c=
onfig/2024-May/001122.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glib/glib/gatomic.c | 14 +++++++-------
- glib/glib/gatomic.h | 34 ++++++++++++++++++++--------------
- 2 files changed, 27 insertions(+), 21 deletions(-)
-
-diff --git a/glib/glib/gatomic.c b/glib/glib/gatomic.c
-index eb2fe46..c0609eb 100644
---- a/glib/glib/gatomic.c
-+++ b/glib/glib/gatomic.c
-@@ -385,7 +385,7 @@ gboolean
-  *
-  * Since: 2.30
-  **/
--gssize
-+gintptr
- (g_atomic_pointer_add) (volatile void *atomic,
-                         gssize         val)
- {
-@@ -409,11 +409,11 @@ gssize
-  *
-  * Since: 2.30
-  **/
--gsize
-+guintptr
- (g_atomic_pointer_and) (volatile void *atomic,
-                         gsize          val)
- {
--  return g_atomic_pointer_and ((volatile gpointer *) atomic, val);
-+  return g_atomic_pointer_and ((gpointer *) atomic, val);
- }
-
- /**
-@@ -433,11 +433,11 @@ gsize
-  *
-  * Since: 2.30
-  **/
--gsize
-+guintptr
- (g_atomic_pointer_or) (volatile void *atomic,
-                        gsize          val)
- {
--  return g_atomic_pointer_or ((volatile gpointer *) atomic, val);
-+  return g_atomic_pointer_or ((gpointer *) atomic, val);
- }
-
- /**
-@@ -457,11 +457,11 @@ gsize
-  *
-  * Since: 2.30
-  **/
--gsize
-+guintptr
- (g_atomic_pointer_xor) (volatile void *atomic,
-                         gsize          val)
- {
--  return g_atomic_pointer_xor ((volatile gpointer *) atomic, val);
-+  return g_atomic_pointer_xor ((gpointer *) atomic, val);
- }
-
- #elif defined (G_PLATFORM_WIN32)
-diff --git a/glib/glib/gatomic.h b/glib/glib/gatomic.h
-index e7fd1f2..124a3dd 100644
---- a/glib/glib/gatomic.h
-+++ b/glib/glib/gatomic.h
-@@ -66,16 +66,16 @@ gboolean                g_atomic_pointer_compare_and=
_exchange (volatile void  *a
-                                                                gpointer=
        oldval,
-                                                                gpointer=
        newval);
- GLIB_AVAILABLE_IN_ALL
--gssize                  g_atomic_pointer_add                  (volatile=
 void  *atomic,
-+gintptr                 g_atomic_pointer_add                  (volatile=
 void  *atomic,
-                                                                gssize  =
        val);
- GLIB_AVAILABLE_IN_2_30
--gsize                   g_atomic_pointer_and                  (volatile=
 void  *atomic,
-+guintptr                g_atomic_pointer_and                  (volatile=
 void  *atomic,
-                                                                gsize   =
        val);
- GLIB_AVAILABLE_IN_2_30
--gsize                   g_atomic_pointer_or                   (volatile=
 void  *atomic,
-+guintptr                g_atomic_pointer_or                   (volatile=
 void  *atomic,
-                                                                gsize   =
        val);
- GLIB_AVAILABLE_IN_ALL
--gsize                   g_atomic_pointer_xor                  (volatile=
 void  *atomic,
-+guintptr                g_atomic_pointer_xor                  (volatile=
 void  *atomic,
-                                                                gsize   =
        val);
-
- GLIB_DEPRECATED_IN_2_30_FOR(g_atomic_add)
-@@ -167,28 +167,34 @@ G_END_DECLS
-     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gpointer));       =
          \
-     (void) (0 ? (gpointer) *(atomic) : 0);                             =
      \
-     (void) (0 ? (val) ^ (val) : 0);                                    =
      \
--    (gssize) __sync_fetch_and_add ((atomic), (val));                   =
      \
-+    (guintptr) __atomic_fetch_add ((atomic), (val), __ATOMIC_SEQ_CST); =
       \
-   }))
- #define g_atomic_pointer_and(atomic, val) \
-   (G_GNUC_EXTENSION ({                                                 =
         \
-+    guintptr *gapa_atomic =3D (guintptr *) atomic;                     =
        \
-     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gpointer));       =
          \
--    (void) (0 ? (gpointer) *(atomic) : 0);                             =
      \
--    (void) (0 ? (val) ^ (val) : 0);                                    =
      \
--    (gsize) __sync_fetch_and_and ((atomic), (val));                    =
      \
-+    G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (guintptr));       =
          \
-+    (void) (0 ? (gpointer) *(atomic) : NULL);                          =
         \
-+    (void) (0 ? (val) ^ (val) : 1);                                    =
      \
-+    (guintptr) __atomic_fetch_and (gapa_atomic, (val), __ATOMIC_SEQ_CST=
);        \
-   }))
- #define g_atomic_pointer_or(atomic, val) \
-   (G_GNUC_EXTENSION ({                                                 =
         \
-+    guintptr *gapa_atomic =3D (guintptr *) atomic;                     =
        \
-     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gpointer));       =
          \
--    (void) (0 ? (gpointer) *(atomic) : 0);                             =
      \
--    (void) (0 ? (val) ^ (val) : 0);                                    =
      \
--    (gsize) __sync_fetch_and_or ((atomic), (val));                     =
      \
-+    G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (guintptr));       =
          \
-+    (void) (0 ? (gpointer) *(atomic) : NULL);                          =
         \
-+    (void) (0 ? (val) ^ (val) : 1);                                    =
      \
-+    (guintptr) __atomic_fetch_or (gapa_atomic, (val), __ATOMIC_SEQ_CST)=
;        \
-   }))
- #define g_atomic_pointer_xor(atomic, val) \
-   (G_GNUC_EXTENSION ({                                                 =
         \
-+    guintptr *gapa_atomic =3D (guintptr *) atomic;                     =
        \
-     G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (gpointer));       =
          \
--    (void) (0 ? (gpointer) *(atomic) : 0);                             =
      \
--    (void) (0 ? (val) ^ (val) : 0);                                    =
      \
--    (gsize) __sync_fetch_and_xor ((atomic), (val));                    =
      \
-+    G_STATIC_ASSERT (sizeof *(atomic) =3D=3D sizeof (guintptr));       =
          \
-+    (void) (0 ? (gpointer) *(atomic) : NULL);                          =
         \
-+    (void) (0 ? (val) ^ (val) : 1);                                    =
      \
-+    (guintptr) __atomic_fetch_xor (gapa_atomic, (val), __ATOMIC_SEQ_CST=
);        \
-   }))
-
- #else /* defined(G_ATOMIC_LOCK_FREE) && defined(__GCC_HAVE_SYNC_COMPARE=
_AND_SWAP_4) */
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bo=
ol-as-a-field-name.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001=
-Do-not-use-bool-as-a-field-name.patch
deleted file mode 100644
index bcb7e94d69b..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bool-as-a=
-field-name.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b3b26a7e125e5e4f5b69975cc17eb6d33198ebaa Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Thu, 11 Apr 2024 14:40:21 +0100
-Subject: [PATCH] Do not use bool as a field name
-
-C99 aliases `bool` to `_Bool`, and C23 introduces `bool` as a reserved
-keyword. Let's avoid using `bool` as a field name.
-
-Upstream-Status: Backport [Backport from glib to bunlded version in pkg-=
config https://github.com/GNOME/glib/commit/9e320e1c43a4770ed1532248fe541=
6eb0c618120]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- glib/glib/goption.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/glib/glib/goption.c b/glib/glib/goption.c
-index 0a22f6f..f439fd4 100644
---- a/glib/glib/goption.c
-+++ b/glib/glib/goption.c
-@@ -166,7 +166,7 @@ typedef struct
-   gpointer arg_data;
-   union
-   {
--    gboolean bool;
-+    gboolean boolean;
-     gint integer;
-     gchar *str;
-     gchar **array;
-@@ -1600,7 +1600,7 @@ free_changes_list (GOptionContext *context,
-           switch (change->arg_type)
-             {
-             case G_OPTION_ARG_NONE:
--              *(gboolean *)change->arg_data =3D change->prev.bool;
-+              *(gboolean *)change->arg_data =3D change->prev.boolean;
-               break;
-             case G_OPTION_ARG_INT:
-               *(gint *)change->arg_data =3D change->prev.integer;
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.=
m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch b/meta/recipes-devtools/pkg=
config/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match=
-.patch
deleted file mode 100644
index 80310cd370e..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Upda=
te-AM_GLIB_GNU_GETTEXT-to-match-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e404e27de77d8b993c4cc87013d707200b3a5547 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 17 May 2016 13:26:27 +0300
-Subject: [PATCH] glib-gettext.m4: Update AM_GLIB_GNU_GETTEXT to match gl=
ib
-
-This avoids
-  error: m4_copy: won't overwrite defined macro: glib_DEFUN
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Pending
-
----
- glib/m4macros/glib-gettext.m4 | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/glib/m4macros/glib-gettext.m4 b/glib/m4macros/glib-gettext.=
m4
-index 5217fd8..155b1d8 100644
---- a/glib/m4macros/glib-gettext.m4
-+++ b/glib/m4macros/glib-gettext.m4
-@@ -313,7 +313,7 @@ msgstr ""
- # on various variables needed by the Makefile.in.in installed by=20
- # glib-gettextize.
- dnl
--glib_DEFUN([GLIB_GNU_GETTEXT],
-+AU_DEFUN([GLIB_GNU_GETTEXT],
-   [AC_REQUIRE([AC_PROG_CC])dnl
-   =20
-    GLIB_LC_MESSAGES
-@@ -383,7 +383,8 @@ glib_DEFUN([GLIB_GNU_GETTEXT],
-    rm -f po/POTFILES
-    sed -e "/^#/d" -e "/^\$/d" -e "s,.*,	$posrcprefix& \\\\," -e "\$s/\(=
.*\) \\\\/\1/" \
- 	< $srcdir/po/POTFILES.in > po/POTFILES
--  ])
-+  ],
-+  [[$0: This macro is deprecated. You should use upstream gettext inste=
ad.]])
-=20
- # AM_GLIB_DEFINE_LOCALEDIR(VARIABLE)
- # -------------------------------
---=20
-2.1.4
-
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in=
 b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
deleted file mode 100644
index 4fc9b0a4a7b..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
+++ /dev/null
@@ -1,24 +0,0 @@
-#! /bin/sh
-
-# Orignal pkg-config-native action when called as pkg-config-native
-# NO Change here
-if [ "pkg-config-native" =3D "`basename $0`" ] ; then
-	PKG_CONFIG_PATH=3D"@PATH_NATIVE@"
-	PKG_CONFIG_LIBDIR=3D"@LIBDIR_NATIVE@"
-	unset PKG_CONFIG_SYSROOT_DIR
-else
-	# in this case check if we are in the esdk
-	if [ "$OE_SKIP_SDK_CHECK" =3D "1" ] ; then
-		parentpid=3D`ps -o ppid=3D -p $$`
-		parentpid_info=3D`ps -wo comm=3D -o args=3D -p $parentpid`
-
-		# check if we are being called from  the kernel's make menuconfig
-		if ( echo $parentpid_info | grep -q check-lxdialog ) ; then
-			PKG_CONFIG_PATH=3D"@PATH_NATIVE@"
-			PKG_CONFIG_LIBDIR=3D"@LIBDIR_NATIVE@"
-			unset PKG_CONFIG_SYSROOT_DIR
-		fi
-	fi
-fi
-
-pkg-config.real "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.=
in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
deleted file mode 100644
index 8addefbb803..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ /dev/null
@@ -1,7 +0,0 @@
-#! /bin/sh
-
-export PKG_CONFIG_PATH=3D"@PATH_NATIVE@$EXTRA_NATIVE_PKGCONFIG_PATH"
-export PKG_CONFIG_LIBDIR=3D"@LIBDIR_NATIVE@"
-unset PKG_CONFIG_SYSROOT_DIR
-
-pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
deleted file mode 100644
index d4350be212b..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ /dev/null
@@ -1,78 +0,0 @@
-SUMMARY =3D "Helper tool used when compiling"
-DESCRIPTION =3D "pkg-config is a helper tool used when compiling applica=
tions and libraries. It helps determined \
-the correct compiler/link options.  It is also language-agnostic."
-HOMEPAGE =3D "http://pkg-config.freedesktop.org/wiki/"
-BUGTRACKER =3D "http://bugs.freedesktop.org/buglist.cgi?product=3Dpkg-co=
nfig"
-SECTION =3D "console/utils"
-
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
-
-SRCREV =3D "d97db4fae4c1cd099b506970b285dc2afd818ea2"
-PV =3D "0.29.2+git"
-
-SRC_URI =3D "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;bran=
ch=3Dmaster;protocol=3Dhttps \
-           file://pkg-config-esdk.in \
-           file://pkg-config-native.in \
-           file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-mat=
ch-.patch \
-           file://0001-Do-not-use-bool-as-a-field-name.patch \
-		   file://0001-Backport-g-s-size-g-u-intptr-atomics-in-builtin-glib.pa=
tch \
-           "
-
-inherit autotools pkgconfig
-
-# Because of a faulty test, the current auto mode always evaluates to no=
,
-# so just continue that behaviour.
-#
-EXTRA_OECONF +=3D "--disable-indirect-deps"
-
-PACKAGECONFIG ??=3D "glib"
-PACKAGECONFIG:class-native =3D ""
-
-PACKAGECONFIG[glib] =3D "--without-internal-glib,--with-internal-glib,gl=
ib-2.0"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-# Set an empty dev package to ensure the base PN package gets
-# the pkg.m4 macros, pkgconfig does not deliver any other -dev
-# files.
-FILES:${PN}-dev =3D ""
-FILES:${PN} +=3D "${datadir}/aclocal/pkg.m4"
-
-# When using the RPM generated automatic package dependencies, some pack=
ages
-# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
-# specifying an appropriate provide.
-RPROVIDES:${PN} +=3D "pkgconfig(pkg-config)"
-
-do_install:append:class-native () {
-    # Install a pkg-config-native wrapper that will use the native sysro=
ot instead
-    # of the MACHINE sysroot, for using pkg-config when building native =
tools.
-    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
-    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
-    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${UNPACKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
-    install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
-}
-
-do_install:append:class-nativesdk () {
-    # Install a pkg-config-native wrapper that will use the native sysro=
ot instead
-    # of the MACHINE sysroot, for using pkg-config when building native =
tools.
-    sed -e "s|@PATH_NATIVE@|\$OECORE_NATIVE_SYSROOT|" \
-        -e "s|@LIBDIR_NATIVE@|\$OECORE_NATIVE_SYSROOT/usr/lib/pkgconfig|=
" \
-        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
-    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
-}
-
-pkgconfig_sstate_fixup_esdk () {
-	if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" -a "${WITHIN_E=
XT_SDK}" =3D "1" ] ; then
-		pkgconfdir=3D"${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}=
"
-		mv $pkgconfdir/pkg-config $pkgconfdir/pkg-config.real
-		ln -rs $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
-		sed -i -e "s|^pkg-config|pkg-config.real|" $pkgconfdir/pkg-config-nati=
ve
-	fi
-}
-
-SSTATEPOSTUNPACKFUNCS:append:class-native =3D " pkgconfig_sstate_fixup_e=
sdk"
--=20
2.43.0


