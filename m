Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA557D42F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 20:14:59 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 132so1609943ljj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5wJsBlUSP5SxYXzOPD0X7Ee0IvpHP6m16TBcxFs/qQ0=;
	b=qK6TMbCF4SIZgHgOaBK0V3n+lXGoJQbK4ZQPj4HY0YWzdTs/QNe3frpoJglg07rLU+
	FO5h0O9ejW6muxFLEMc5OT0gvHqtqUZiIw8ThZ7FnUMnuOQvG+CKuQ9RczHrdZ31Df0d
	17HJE6LAceFY9FJLdiluqtCpQXe/lMuSPZw4mCv5LkNKEyOfcjCVpgk8XVD5oTu6pNWz
	LOw4BP51wFSK2WatvZSNY1/7DcCtANLnA20CA7RH4AoR8Re/czE3WfzFS8xAd6jS+c2r
	KbspjBBgmBmfaycVVXv8JGlCBRUzGGhBpq+oLZ6MjZO9+QjusC7WG+Zsseet/sonVU7N
	NrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5wJsBlUSP5SxYXzOPD0X7Ee0IvpHP6m16TBcxFs/qQ0=;
	b=WV3Mz/eUfRIyT/8rE4RAZlsedz9KK61ct4MeGTykbRbwW+4E57Svj/Vc2NiN+1TTlN
	hQhVQavV4w7oo7A6T5fy9EMn71XUVBQVwjKPipCx4p5BKV0FeI0QI6ZUNLGqkvCJaHZY
	FQoxI/E9In4OUMGsuUDjfSHpjdKgkZu8UEDm5+eaGHcxpcWRg9YD2mDm+SWBwShDwaLU
	Cu4gvrJ26/uXW3Whll2Npar/3xqZItAtBjY7p0nsSDkhkvTi4wpeLYiKbGOqSp8Ug2QI
	77eIyxCen/PG8AJZCux5qsL3zin/QdTb5zdco5h5wY9WxkAM/LfH0AHZzEKp/Yi6Hlt/
	Bcww==
X-Gm-Message-State: APjAAAXXgF/AZ9uKSXH8fsqA6cUUwvx0TlfiwyNFMCzC6u/lxvfX9xQ0
	E8G49Ny4FvvoX1XEZaEUd/eWMxMe
X-Google-Smtp-Source: APXvYqyKOdTRVkJXwV03VMrVRxdfdownuDmvE7HRSeqG3Y0dw/q5HVlIIPvobdkblgJvFhuBMqlg/A==
X-Received: by 2002:a2e:9855:: with SMTP id e21mr6954944ljj.180.1557087299662; 
	Sun, 05 May 2019 13:14:59 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id s27sm542072lfo.22.2019.05.05.13.14.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 May 2019 13:14:59 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 22:14:51 +0200
Message-Id: <1557087292-30921-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
References: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, Ming Liu <liu.ming50@gmail.com>,
	luka.pivk@toradex.com, stefan.agner@toradex.com
Subject: [PATCH V2 1/2] libx11: split out libx11-locale
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
X-List-Received-Date: Sun, 05 May 2019 20:14:59 -0000

From: Ming Liu <liu.ming50@gmail.com>

So far libx11-locale is also being required by some non-X11 recipes,
like weston -> libxkbcommon -> libx11-locale. But the libx11-locale
could not build without x11 distro feature enabled. This is not
reasonable.

To fix it, we split out libx11-locale from libx11 to be a standalone
recipe, and drop the X11 dependencies, this makes it to be able to
build without x11 distro feature.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb |  1 -
 .../libx11-locale/0001-Drop-x11-dependencies.patch | 86 ++++++++++++++++++++++
 .../xorg-lib/libx11-locale_1.6.7.bb                | 32 ++++++++
 meta/recipes-graphics/xorg-lib/libx11.inc          |  8 +-
 4 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-locale/0001-Drop-x11-dependencies.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-locale_1.6.7.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
index 9c773a0..5f99d40 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
@@ -9,7 +9,6 @@ SRC_URI += "file://X18NCMSstubs.patch \
            "
 
 RPROVIDES_${PN}-dev = "libx11-dev"
-RPROVIDES_${PN}-locale = "libx11-locale"
 
 EXTRA_OECONF += "--disable-xlocale"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-locale/0001-Drop-x11-dependencies.patch b/meta/recipes-graphics/xorg-lib/libx11-locale/0001-Drop-x11-dependencies.patch
new file mode 100644
index 0000000..e6e179e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-locale/0001-Drop-x11-dependencies.patch
@@ -0,0 +1,86 @@
+From a60f5058136aeadceebfccadf606d8210f8d3ca6 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Sun, 5 May 2019 11:55:14 +0200
+Subject: [PATCH] Drop x11 dependencies
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ configure.ac | 44 --------------------------------------------
+ 1 file changed, 44 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3090845..d14063f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,27 +66,8 @@ fi
+ AC_SUBST(LDFLAGS_FOR_BUILD)
+ 
+ # Checks for pkg-config packages
+-
+-# Always required
+-X11_REQUIRES='xproto >= 7.0.17 xextproto xtrans xcb >= 1.11.1'
+-X11_EXTRA_DEPS="xcb >= 1.11.1"
+-
+ PKG_PROG_PKG_CONFIG()
+ 
+-AC_SUBST(X11_EXTRA_DEPS)
+-
+-# Issue an error if xtrans.m4 was not found and XTRANS_CONNECTION_FLAGS macro
+-# was not expanded, since libX11 with no transport types is rather useless.
+-#
+-# If you're seeing an error here, be sure you installed the lib/xtrans module
+-# first and if it's not in the default location, that you set the ACLOCAL
+-# environment variable to find it, such as:
+-#	ACLOCAL="aclocal -I ${PREFIX}/share/aclocal"
+-m4_pattern_forbid([^XTRANS_CONNECTION_FLAGS$])
+-
+-# Transport selection macro from xtrans.m4
+-XTRANS_CONNECTION_FLAGS
+-
+ # Check for dlopen
+ AC_MSG_CHECKING([if run-time linking is supported])
+ AC_SEARCH_LIBS(dlopen,[dl svld])
+@@ -226,30 +207,6 @@ AC_SUBST(XTHREAD_CFLAGS)
+ 
+ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
+ 
+-#
+-# Find keysymdef.h
+-#
+-AC_MSG_CHECKING([keysym definitions])
+-AC_ARG_WITH([keysymdefdir],
+-        [AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)])],
+-        [KEYSYMDEFDIR=$withval],
+-        [KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11])
+-
+-if test ! -d "$KEYSYMDEFDIR"; then
+-	AC_MSG_ERROR([$KEYSYMDEFDIR doesn't exist or isn't a directory])
+-fi
+-
+-FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
+-for i in $FILES; do
+-    if test -f "$KEYSYMDEFDIR/$i"; then
+-            KEYSYMDEFS="$KEYSYMDEFS $KEYSYMDEFDIR/$i"
+-    elif test "x$i" = "xkeysymdef.h"; then
+-	    AC_MSG_ERROR([Cannot find keysymdef.h])
+-    fi
+-done
+-AC_MSG_RESULT([$KEYSYMDEFS])
+-AC_SUBST(KEYSYMDEFS)
+-
+ AC_ARG_ENABLE(xcms,
+               AS_HELP_STRING([--disable-xcms],
+                 [Disable Xlib support for CMS *EXPERIMENTAL*]),
+@@ -329,7 +286,6 @@ X11_LIBDIR="${libdir}/X11"
+ AX_DEFINE_DIR(X11_LIBDIR, X11_LIBDIR, [Location of libX11 library data])
+ AC_SUBST(X11_LIBDIR)
+ 
+-PKG_CHECK_MODULES(X11, [$X11_REQUIRES])
+ X11_CFLAGS="$X11_CFLAGS $XTHREAD_CFLAGS"
+ 
+ #
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11-locale_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11-locale_1.6.7.bb
new file mode 100644
index 0000000..5bf1ca6
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-locale_1.6.7.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Xlib: locale data files for libx11"
+DESCRIPTION = "This package provides the locale data files for libx11."
+
+require xorg-lib-common.inc
+
+LICENSE = "MIT & MIT-style & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
+
+SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
+SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
+
+SRC_URI += "file://0001-Drop-x11-dependencies.patch"
+
+XORG_PN = "libX11"
+
+EXTRA_OECONF += "--disable-xkb"
+
+PACKAGES = "${PN}"
+
+FILES_${PN} = "${datadir}/X11/locale ${libdir}/X11/locale"
+
+do_compile() {
+    oe_runmake -C nls
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} -C nls install
+}
+
+REQUIRED_DISTRO_FEATURES = ""
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index ea2ebfb..8ad0523 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -32,7 +32,13 @@ PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 CPPFLAGS_FOR_BUILD += "-D_GNU_SOURCE"
 
 PACKAGES =+ "${PN}-xcb"
+PACKAGES_remove = "${PN}-locale"
 
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
 FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
-FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
+
+# locale data files would be provided by libx11-locale recipe
+do_install_append() {
+	rm -rf ${D}${datadir}/X11/locale
+	rm -rf ${D}${libdir}/X11/locale
+}
-- 
2.7.4


