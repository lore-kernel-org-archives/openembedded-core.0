Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 780D97F1E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 14:20:00 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k8so53402819edr.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6mMzdr/s4LQyKgosQKPzxRzYFp/cT5t+Sd6mQXRMlPY=;
	b=KfdUAD16dIKZCD0XoZ7J0kmRZ3g3aKqv38HSINqAe/o934uCtTicZiWxAzb5RGB9Ec
	Smh6rwjsET3ihkn1TQezuc7wpYGhk00DnKB64egm+3nzu5xxWwQCXXyQGd9sm0qlBSP5
	Odrh6TLB1QOoQNkVD3w0gTtwVN2RLtWghcKo4h3QTCpA6IU03UMrNkc812nyvIMHkToX
	T+h+7gI5S79mSdBhEoQuP2mvCU3OzUlLGcMSf67pJMHkIGU2NTG+8lK6ZJIPGT13jfwj
	sSNvxidI5Yi51ecLODNpadleIzq1LbJ8cG8oTZZOVfv0US+iEri7lNNCMSmoe63ayO1Y
	Hgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6mMzdr/s4LQyKgosQKPzxRzYFp/cT5t+Sd6mQXRMlPY=;
	b=AQx/qdJfkuFrxk65VR872ODFV42rZ4LviFZrYQmuQNBMcfZAPrX5FuNPCjZraY3V41
	3USrirE4Q+SssRzEcD4udZWaB1UWU9rdtCi14Ud0ejV9EzapOIO1dvY/draLsy/bVFFe
	wv85XCz7XJqJ+AHMB2WqbzGwKVimSfkgaGxJsK0LlgiYkTi5/djkAvl5eG0H2aE24U1y
	VNoPVqxZBF2rrtJjb6MXpmiyBK+o0+jqqhUbYB2NrpucOmEFrzPWE+VOPrOPjQ41mG+G
	DKfoSaii+L4LiYZ4CFrAHehJftQg+/zTiyx6GEyy4ijTC8XGeQx/KAW1vxd8OiJ0fGso
	im+w==
X-Gm-Message-State: APjAAAXxYzvo53i1OGjAZyvx5RkMugUB7UWZlm8xAvxaIftmtCRDq2nn
	SKShKSK9uIF31OK3VAEweEj0CS5p6Y0=
X-Google-Smtp-Source: APXvYqzP26uYWKMT+oDT/QzprwkQvFL8AIPowfEQ7Iec8M4XwobYXDduPvhErOO8+xXS7cK9yuA7uQ==
X-Received: by 2002:a05:6402:2cb:: with SMTP id
	b11mr81474339edx.281.1564150800915; 
	Fri, 26 Jul 2019 07:20:00 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.203.138])
	by smtp.gmail.com with ESMTPSA id
	x10sm14225727edd.73.2019.07.26.07.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jul 2019 07:20:00 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 22:19:39 +0800
Message-Id: <1564150780-18125-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564150780-18125-1-git-send-email-liu.ming50@gmail.com>
References: <1564150780-18125-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <ming.liu@toradex.com>, stefan.agner@toradex.com,
	luka.pivk@toradex.com
Subject: [PATCH V3 1/2] libx11-compose-data: add recipe
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
X-List-Received-Date: Fri, 26 Jul 2019 14:20:00 -0000

From: Ming Liu <ming.liu@toradex.com>

So far libx11 compose data is being required by some non-X11 recipes,
like weston -> libxkbcommon -> libx11-locale. But the libx11-locale
could not build without x11 distro feature enabled. This is not
reasonable.

To fix it, we introduce this new recipe, it uses the same source with
libx11 but dropped X11 dependencies, this makes it to be able to build
without x11 distro feature. It would be skipped if x11 distro feature
is enabled, in which case the libx11-locale would provide the libx11
compose data.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 .../0001-Drop-x11-dependencies.patch               | 86 ++++++++++++++++++++++
 .../xorg-lib/libx11-compose-data_1.6.7.bb          | 35 +++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
new file mode 100644
index 0000000..fbd9684
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
@@ -0,0 +1,86 @@
+From a60f5058136aeadceebfccadf606d8210f8d3ca6 Mon Sep 17 00:00:00 2001
+From: Ming Liu <ming.liu@toradex.com>
+Date: Sun, 5 May 2019 11:55:14 +0200
+Subject: [PATCH] Drop x11 dependencies
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Ming Liu <ming.liu@toradex.com>
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb
new file mode 100644
index 0000000..9dace70
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Xlib: Compose data files for libx11"
+DESCRIPTION = "This package provides the compose data files for libx11."
+
+python () {
+    if bb.utils.contains('DISTRO_FEATURES', 'x11', True, False, d):
+        raise bb.parse.SkipRecipe("libx11-compose-data is incompatible with x11 distro feature, use libx11 instead.")
+}
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
-- 
2.7.4


