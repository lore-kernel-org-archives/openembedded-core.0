Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 114EA75CD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:35:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A6E3C6092A7
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 09:31:33 +0100
Message-Id: <e86556daf27ee841a1ac447981a0042cd484486e.1445588979.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445588979.git.joshua.lock@collabora.co.uk>
References: <cover.1445588979.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445588979.git.joshua.lock@collabora.co.uk>
References: <cover.1445588979.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v4 2/6] weston: add PACKAGECONFIG to build with systemd-login support
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
X-List-Received-Date: Fri, 23 Oct 2015 08:35:32 -0000

Automatically enable this support for distributions which have
systemd in DISTRO_FEATURES.

We add additional patches to weston, backported from Weston
git, to support the newer single libsystemd pkg-config file
and to make the enabling of systemd-login support explicit.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 .../weston/explicit-enable-disable-systemd.patch   | 70 ++++++++++++++++++++++
 .../wayland/weston/libsystemd.patch                | 53 ++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |  5 ++
 3 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch

diff --git a/meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch b/meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
new file mode 100644
index 0000000..a40eaf1
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
@@ -0,0 +1,70 @@
+From 8e1efcd40b3bad81c83744e2e120d70c2b567ef2 Mon Sep 17 00:00:00 2001
+From: Frederico Cadete <frederico@cadete.eu>
+Date: Mon, 28 Sep 2015 00:30:10 +0200
+Subject: configure.ac: add explicit enable/disable for systemd-login support
+
+Otherwise, auto-enable depending on whether the system has the necessary
+libraries.
+
+[Updated help text as per pq suggestion -- bwh]
+
+Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
+Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
+Tested-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
+
+Upstream-Status: Backport
+Backported from Weston git:
+http://cgit.freedesktop.org/wayland/weston/commit/?id=8e1efc
+
+Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
+
+diff --git a/configure.ac b/configure.ac
+index a9cd429..67e80d0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,18 +380,30 @@ AC_ARG_ENABLE(resize-optimization,
+ AS_IF([test "x$enable_resize_optimization" = "xyes"],
+       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
+ 
+-PKG_CHECK_MODULES(SYSTEMD_LOGIN,
+-                  [libsystemd >= 209],
+-                  [have_systemd_login_209=yes;have_systemd_login=yes],
+-                  [have_systemd_login_209=no;have_systemd_login=no])
+-
+-# Older versions of systemd package systemd-login separately. Fall back on that
+-AS_IF([test x$have_systemd_login != xyes],[
+-      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
+-                        [libsystemd-login >= 198],
+-                        [have_systemd_login=yes],
+-                        [have_systemd_login=no])
+-      ])
++AC_ARG_ENABLE(systemd-login,
++              AS_HELP_STRING([--enable-systemd-login],
++                             [Enable logind support]),,
++              enable_systemd_login=auto)
++if test x$enable_systemd_login != xno; then
++  PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                    [libsystemd >= 209],
++                    [have_systemd_login_209=yes;have_systemd_login=yes],
++                    [have_systemd_login_209=no;have_systemd_login=no])
++
++  # Older versions of systemd package systemd-login separately. Fall back on that
++  AS_IF([test x$have_systemd_login != xyes],[
++        PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                          [libsystemd-login >= 198],
++                          [have_systemd_login=yes],
++                          [have_systemd_login=no])
++        ])
++else
++  have_systemd_login=no
++fi
++
++if test "x$have_systemd_login" = "xno" -a "x$enable_systemd_login" = "xyes"; then
++  AC_MSG_ERROR([systemd-login support explicitly enabled, but can't find libsystemd>=209 or libsystemd-login])
++fi
+ 
+ AS_IF([test "x$have_systemd_login" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
+-- 
+cgit v0.10.2
+
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
index 342c604..47ba49d 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
            file://parallelmake.patch \
+           file://libsystemd.patch \
+           file://explicit-enable-disable-systemd.patch \
 "
 SRC_URI[md5sum] = "24cb8a7ed0535b4fc3642643988dab36"
 SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312"
@@ -39,6 +41,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
 #
 # Compositor choices
@@ -67,6 +70,8 @@ PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 # Weston with unwinding support
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+# Weston with systemd-login support
+PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.1.4


