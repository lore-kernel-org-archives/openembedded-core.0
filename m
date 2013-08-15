Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 262C26B91A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:31 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so185126eek.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mqnERFcNDiItliiVNfzeVQk6JX0KgttkinCLwiy13b8=;
	b=l1UaKGc2qLxQehWdNa9qoJOLtoDVy72H6WadX6ryDoZAM4q2x09e4Mm79lxpGyqZOY
	N70eGU6gp4xMFuK8uyvmvpHIWWYAfxh1x15QWZfKWFmgMT2CCgLaWchh6z/jCzNR5tAM
	0xDfiWENV3E6pnFobBNdANB8oyQwZK0JJVZAnFK1jCNcgsv2Ageic9W+zNfFQMFHnNSM
	LJkVF/IdeKvXTr9gSaQx03hbWSoJAZWx/5NPBybqMxWfCqc432Vhcyq3KwHjS2qcPjOw
	SIRIkNuZEfB9sIG6+eWFnrPQZ193HywxmddZ1KJneFB7Xn5sRuPJYmC8pmxoWCZEbrZb
	+49A==
X-Received: by 10.14.38.14 with SMTP id z14mr20931534eea.49.1376551412587;
	Thu, 15 Aug 2013 00:23:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm81960900eex.2.2013.08.15.00.23.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:42 +0200
Message-Id: <661efd7015588c8726fd1acfe76e784f2adaeacb.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 31/33] weston: backport patch for libunwind configure option and disable it
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:32 -0000

* it's autodetected from sysroot and runtime dependency on libunwind isn't
  deterministic
* master has weston 1.1.0 which already has this option and also explicitly
  disables libunwind

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...utotools-Add-a-libunwind-configure-switch.patch | 40 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.0.6.bb      |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-autotools-Add-a-libunwind-configure-switch.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-autotools-Add-a-libunwind-configure-switch.patch b/meta/recipes-graphics/wayland/weston/0001-autotools-Add-a-libunwind-configure-switch.patch
new file mode 100644
index 0000000..faf9680
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-autotools-Add-a-libunwind-configure-switch.patch
@@ -0,0 +1,40 @@
+From cc802f5f34c6ea4fe66f70225830c97ef7abbfc3 Mon Sep 17 00:00:00 2001
+From: Quentin Glidic <sardemff7+git@sardemff7.net>
+Date: Wed, 3 Apr 2013 20:19:45 +0200
+Subject: [PATCH] autotools: Add a libunwind configure switch
+
+Upstream-Status: Backport from 1.1 (5daccc373eddf94086fcc4662c38605de6356c6c)
+
+Signed-off-by: Quentin Glidic <sardemff7+git@sardemff7.net>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 71d0978..1e76ded 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -251,12 +251,14 @@ fi
+ AC_SUBST(GCC_CFLAGS)
+ AC_SUBST(GCC_CXXFLAGS)
+ 
+-PKG_CHECK_MODULES(LIBUNWIND, libunwind,
+-                  [have_libunwind=yes], [have_libunwind=no])
+-if test "x$have_libunwind" = xyes; then
+-       AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])
++AC_ARG_ENABLE(libunwind, AS_HELP_STRING([  --disable-libunwind],
++                                        [Disable libunwind usage for backtraces]),,
++              enable_libunwind=yes)
++if test "x$enable_libunwind" = xyes; then
++    PKG_CHECK_MODULES(LIBUNWIND, libunwind)
++    AC_DEFINE(HAVE_LIBUNWIND, 1, [Have libunwind support])
+ fi
+-AM_CONDITIONAL(HAVE_LIBUNWIND, [test "x$have_libunwind" = xyes])
++AM_CONDITIONAL(HAVE_LIBUNWIND, [test "x$enable_libunwind" = xyes])
+ 
+ WAYLAND_SCANNER_RULES(['$(top_srcdir)/protocol'])
+ 
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-graphics/wayland/weston_1.0.6.bb b/meta/recipes-graphics/wayland/weston_1.0.6.bb
index cb41e05..9dea495 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.6.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
                     file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-autotools-Add-a-libunwind-configure-switch.patch \
            file://weston.png \
            file://weston.desktop"
 SRC_URI[md5sum] = "63202129d66d5514e572814da5dfa1f7"
@@ -17,7 +18,7 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
 DEPENDS += "wayland mesa virtual/egl"
 
 EXTRA_OECONF  = "--disable-android-compositor --enable-setuid-install"
-EXTRA_OECONF += "--disable-tablet-shell --disable-xwayland"
+EXTRA_OECONF += "--disable-tablet-shell --disable-xwayland --disable-libunwind"
 EXTRA_OECONF += "--enable-simple-clients --enable-clients --disable-simple-egl-clients"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
-- 
1.8.3.2


