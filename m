Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 619CB6FE04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 15:49:32 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id ld10so1840930pab.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DsSIe4LvYoY7tixeG0/ZZGbYSQUxZHWgcv3kKdRDgJc=;
	b=oMdr4BT0tWBopwU+4d6Y8Bel/QBcqykPpsRINMwbv1rcoUl9s+Lz2NBy1Zwn9g0CsB
	JiFrmTOxsjFbb6li2TOor+akN7gxUBeKR6bzH81fPbfzlg709OCYt2pSgNc8kVnROTw4
	95nyOfdHB4w/nArjZgKLAd8bCaTe2+N26sVhgxKW+S1LgVR0a1c+jfwth79oLtSoy3O+
	F7Qx0pq/6ub3us+gYGu60/OFKTfo08btZQfs20DsqNJ0hVHAKca2z93JYQkxj5e/WZrc
	bzqf1RK1S+j1UkDKmpOyHH4tKeNJw45ffb3yqgJf8oRnh5eaFL3K99pfkTh8qeeNpjZQ
	DTSg==
X-Received: by 10.66.155.166 with SMTP id vx6mr12480536pab.85.1401464973594;
	Fri, 30 May 2014 08:49:33 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ko10sm7019705pbd.52.2014.05.30.08.49.32 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 30 May 2014 08:49:33 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 May 2014 08:52:10 -0700
Message-Id: <1401465130-8845-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <CAJTo0LZ=jrroBnDG272i7TaZ3zkoZsoQJRHVi0QN7ixF77EE+Q@mail.gmail.com>
References: <CAJTo0LZ=jrroBnDG272i7TaZ3zkoZsoQJRHVi0QN7ixF77EE+Q@mail.gmail.com>
Subject: [PATCH v2] weston: make lcms explicitly configurable
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
X-List-Received-Date: Fri, 30 May 2014 15:49:34 -0000

From: Tim Orling <TicoTimo@gmail.com>

Per Ross's comment, make --enable-lcms deterministic.
Follow upstream style to make it more likely to be merged upstream.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../wayland/weston/make-lcms-configurable.patch    | 22 -----------
 .../weston/make-lcms-explicitly-configurable.patch | 43 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.5.0.bb      |  2 +-
 3 files changed, 44 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch

diff --git a/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch b/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
deleted file mode 100644
index 29fe5b8..0000000
--- a/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: weston-1.5.0/configure.ac
-===================================================================
---- weston-1.5.0.orig/configure.ac
-+++ weston-1.5.0/configure.ac
-@@ -491,8 +491,16 @@ AC_ARG_ENABLE(demo-clients-install,
- 			     enable_demo_clients_install=no)
- AM_CONDITIONAL(INSTALL_DEMO_CLIENTS, [test "x$enable_demo_clients_install" = "xyes"])
- 
-+AC_ARG_ENABLE(lcms,
-+              AS_HELP_STRING([--disable-lcms],
-+                             [disable lcms support]),,
-+              enable_lcms=yes)
-+
-+AS_IF([test "x$enable_lcms" != "xno"], [
- PKG_CHECK_MODULES(LCMS, lcms2,
--                  [have_lcms=yes], [have_lcms=no])
-+                  [have_lcms=yes], [AC_MSG_ERROR([lcms enabled but not found])])],
-+                  [have_lcms=no])
-+
- if test "x$have_lcms" = xyes; then
-        AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
- fi
diff --git a/meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch b/meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
new file mode 100644
index 0000000..35e6d6f
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
@@ -0,0 +1,43 @@
+weston-1.5.0/configure.ac: make lcms explicitly configurable
+
+The lcms package is outside of openembedded-core, so make it
+explicitly configurable. Make it deterministic, so that if lcms
+dependencies are missing, autoconf throws a fatal error. Follow
+upstream style to make it more likely to be merged.
+
+Upstream-Status: Pending
+
+Index: weston-1.5.0/configure.ac
+===================================================================
+--- weston-1.5.0.orig/configure.ac
++++ weston-1.5.0/configure.ac
+@@ -491,12 +491,24 @@ AC_ARG_ENABLE(demo-clients-install,
+ 			     enable_demo_clients_install=no)
+ AM_CONDITIONAL(INSTALL_DEMO_CLIENTS, [test "x$enable_demo_clients_install" = "xyes"])
+ 
+-PKG_CHECK_MODULES(LCMS, lcms2,
+-                  [have_lcms=yes], [have_lcms=no])
+-if test "x$have_lcms" = xyes; then
+-       AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
++AC_ARG_ENABLE(lcms,
++              AS_HELP_STRING([--disable-lcms],
++                             [Disable lcms support]),,
++              enable_lcms=auto)
++AM_CONDITIONAL(HAVE_LCMS, [test "x$enable_lcms" = xyes])
++if test "x$enable_lcms" != "xno"; then
++        PKG_CHECK_MODULES(LCMS, 
++                         lcms2,
++                         [have_lcms=yes],
++                         [have_lcms=no])
++        if test "x$have_lcms" = "xno" -a "x$enable_lcms" = "xyes"; then
++          AC_MSG_ERROR([lcms support explicitly requested, but lcms couldn't be found])
++        fi
++        if test "x$have_lcms" = "xyes"; then
++                enable_lcms=yes
++                AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
++        fi
+ fi
+-AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
+ 
+ AC_PATH_PROG([wayland_scanner], [wayland-scanner])
+ if test x$wayland_scanner = x; then
diff --git a/meta/recipes-graphics/wayland/weston_1.5.0.bb b/meta/recipes-graphics/wayland/weston_1.5.0.bb
index 6a79e32..5573a06 100644
--- a/meta/recipes-graphics/wayland/weston_1.5.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.5.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://disable-wayland-scanner-pkg-check.patch \
-           file://make-lcms-configurable.patch"
+           file://make-lcms-explicitly-configurable.patch"
 SRC_URI[md5sum] = "8eb40d230efc2411f083c20656534780"
 SRC_URI[sha256sum] = "06388ba04ac79aa72d685cc1a8e646ddb2b8cfe11fcc742294f9addac48b7684"
 
-- 
1.8.3.2


