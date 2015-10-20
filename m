Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 668D8770D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 59A6E608EFC
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 10:47:10 +0100
Message-Id: <3a5c956a781b043c825663008fd022a527e7734c.1445334356.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 2/7] weston: backport support for single libsystemd.pc
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
X-List-Received-Date: Tue, 20 Oct 2015 09:47:34 -0000

systemd > 209 ships only a single libsystemd pkg-config file
by default, backport a patch from upstream Weston git to check
this pkg-config file in addition to the old libsystemd-login.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 .../wayland/weston/libsystemd.patch                | 53 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch

diff --git a/meta/recipes-graphics/wayland/weston/libsystemd.patch b/meta/recipes-graphics/wayland/weston/libsystemd.patch
new file mode 100644
index 0000000..2d28d56
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/libsystemd.patch
@@ -0,0 +1,53 @@
+From 5eb025a867b42f8bc7bc73279eac8de58e51a13e Mon Sep 17 00:00:00 2001
+From: Frederico Cadete <frederico@cadete.eu>
+Date: Mon, 28 Sep 2015 00:30:09 +0200
+Subject: configure.ac: add support for new versions of systemd
+
+Starting from systemd version 209, a single libsystemd.pc is provided.
+For previous versions, fall back on libsystemd-login.pc.
+
+Signed-off-by: Frederico Cadete <frederico@cadete.eu>
+Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
+Reviewed-by: Derek Foreman <derekf@osg.samsung.com>
+
+Upstream-Status: Backport
+Backported from Weston git:
+http://cgit.freedesktop.org/wayland/weston/commit/?id=5eb025
+
+Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
+
+diff --git a/configure.ac b/configure.ac
+index 045291c..a9cd429 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,14 +380,23 @@ AC_ARG_ENABLE(resize-optimization,
+ AS_IF([test "x$enable_resize_optimization" = "xyes"],
+       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
+ 
+-PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login >= 198],
+-                  [have_systemd_login=yes], [have_systemd_login=no])
++PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                  [libsystemd >= 209],
++                  [have_systemd_login_209=yes;have_systemd_login=yes],
++                  [have_systemd_login_209=no;have_systemd_login=no])
++
++# Older versions of systemd package systemd-login separately. Fall back on that
++AS_IF([test x$have_systemd_login != xyes],[
++      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                        [libsystemd-login >= 198],
++                        [have_systemd_login=yes],
++                        [have_systemd_login=no])
++      ])
++
+ AS_IF([test "x$have_systemd_login" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
+ AM_CONDITIONAL(HAVE_SYSTEMD_LOGIN, test "x$have_systemd_login" = "xyes")
+ 
+-PKG_CHECK_MODULES(SYSTEMD_LOGIN_209, [libsystemd-login >= 209],
+-                  [have_systemd_login_209=yes], [have_systemd_login_209=no])
+ AS_IF([test "x$have_systemd_login_209" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN_209], [1], [Have systemd-login >= 209])])
+ 
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index 342c604..a2b1c8c 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
            file://parallelmake.patch \
+           file://libsystemd.patch \
 "
 SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
 SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"
-- 
2.1.4


