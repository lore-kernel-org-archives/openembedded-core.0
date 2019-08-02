Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id DBBAC7F2F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 09:14:48 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k8so71705656eds.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Bvnj5SOutM6/fP3aiIYWI/5ttNwskTRzaZgFFUBEe9Q=;
	b=VR65LfiCQS39JXH5bHmxPgDhEDF7lR4PdWEiBlGP0eH8EG1poQ7dPuIhVpbD/UcG6I
	p1gqpufG47m27ZrWJph5nwwg70Snh+0Lf/zq3gynA7mQWPHi81RAd76/0PpCqHkeHfK+
	MF3BFpSAvGFyiGNOh1oOO8+z59W5/JxsSceBGKLq4ZvsAqMuqADlSlYoi5rJUG7fLBQ+
	+B2Os7SJdVvVYCvK0ZbYVX8g6QQMEUxpsBdwFcGDixahviXsZkPXVpJTU5ZdYWHLDDnZ
	bd7rnRR43d9BBvagve05tjej+hnOjDNa1hnArk9xjA8TYU8n0AkD20kQN5HvOK6D3yXK
	PEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bvnj5SOutM6/fP3aiIYWI/5ttNwskTRzaZgFFUBEe9Q=;
	b=lbmJsgBdCj4hcQdOhZb4IL0EfOWsjk3WjhBE4c8RX/FHsGt2cFRF3Id/lRGFcjIXNk
	zKEYXohKe0UlBInL6IvwNn4IlqA/aC6eDSweYuazttwLrEkOZ9GusdjbU51O9V5A8g4k
	LECDpbavrqVL/HjFbRExvRyBPiJdTdRoxAD5l3BvqEUz8VUiFYx9yqRH4Y4NJEgyZIsO
	kitwTmdqMQy1pobSC1X5pr9X+UChCN2T65KXiHkEZk2WDs3KtvtTucSEGMwcykyEA+Us
	VroS6EMjsuNHbMQgDQgiBzDIeJrswlg6I44efI4NhrjV7mNHuTZ52Ryx6eBCuEKTmUty
	AZ6w==
X-Gm-Message-State: APjAAAVQfhveaXOFZsldYJD7JbMjZNdql7dpf2ZFG0XO4VCgbFs9bph/
	n3hix80qcblzuQReXgCmgdLnknhfphI=
X-Google-Smtp-Source: APXvYqzYb/r3JiAWSI8cUuuaOD0PbJNBmMBT+h9if6P+x+NcB+zP8FXqtcEWatCQf/rWpClP1wWtTQ==
X-Received: by 2002:a50:ac07:: with SMTP id v7mr118314834edc.205.1564737289451;
	Fri, 02 Aug 2019 02:14:49 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.202.28])
	by smtp.gmail.com with ESMTPSA id
	y3sm17227454edr.27.2019.08.02.02.14.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Aug 2019 02:14:48 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 17:14:41 +0800
Message-Id: <1564737281-4726-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <ming.liu@toradex.com>, stefan.agner@toradex.com
Subject: [PATCH V3] weston: change to use meson build system
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
X-List-Received-Date: Fri, 02 Aug 2019 09:14:49 -0000

From: Ming Liu <ming.liu@toradex.com>

The changes include:
- Drop all autotools related patches.
- Move weston-launch setuid-install to do_install task since it's not
  supported yet by meson build.
- Drop cairo-glesv2 package config, it's not supported by meson build,
  the recommended value is hard-coded to cairo-image for now in weston
  source.
- Introduce remoting package config, to give this option a explicit
  value, or else the build would run into gstreamer missing error since
  it defaults to be true but gstreamer is not in depends list.
- Default to headless backend if neither x11 nor wayland is in
  DISTRO_FEATURES.

To be noticed, the packages built from meson would not be identical
with those built from autotools, for instance, libz dependency has been
dropped from meson build, and systemd-notify is always built in meson
when systemd packageconfig is enabled, which in autotools, it's
optional, and so on, it's not easy to list all the differences, but
you could get them by comparing the pkgdata directories built by meson
and autotools.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 .../wayland/weston/0001-make-error-portable.patch  | 34 ++++----
 ...ch-Provide-a-default-version-that-doesn-t.patch | 93 ++++++++++++++--------
 meta/recipes-graphics/wayland/weston_6.0.1.bb      | 49 ++++++------
 3 files changed, 102 insertions(+), 74 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
index 0eb3d95..acea9db 100644
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -9,27 +9,14 @@ kind of systemsi e.g. musl.
 Upstream-Status: Submitted
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Signed-off-by: Ming Liu <ming.liu@toradex.com>
 ---
- configure.ac              |  2 ++
  libweston/weston-error.h  | 20 ++++++++++++++++++++
  libweston/weston-launch.c |  2 +-
- 3 files changed, 23 insertions(+), 1 deletion(-)
+ meson.build               |  1 +
+ 3 files changed, 22 insertions(+), 1 deletion(-)
  create mode 100644 libweston/weston-error.h
 
-diff --git a/configure.ac b/configure.ac
-index c05ad01..6da6e04 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -126,6 +126,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
- 	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile weston")],
- 	      [[#include <time.h>]])
- 
-+AC_CHECK_HEADERS([error.h])
-+
- AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
- 
- # check for libdrm as a build-time dependency only
 diff --git a/libweston/weston-error.h b/libweston/weston-error.h
 new file mode 100644
 index 0000000..2089d02
@@ -76,3 +63,18 @@ index bf73e0d..9064439 100644
  
  #define DRM_MAJOR 226
  
+diff --git a/meson.build b/meson.build
+index 2155b7b..baa52d9 100644
+--- a/meson.build
++++ b/meson.build
+@@ -94,6 +94,7 @@ foreach func : optional_libc_funcs
+ endforeach
+ 
+ optional_system_headers = [
++	'error.h',
+ 	'linux/sync_file.h'
+ ]
+ foreach hdr : optional_system_headers
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index a2f61bf..81cc025 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -15,44 +15,46 @@ Upstream-Status: Pending
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
+Signed-off-by: Ming Liu <ming.liu@toradex.com>
 ---
- configure.ac              |  9 +++++++--
+ libweston/meson.build     | 16 ++++++++++++----
  libweston/weston-launch.c | 20 ++++++++++++++++++++
- 2 files changed, 27 insertions(+), 2 deletions(-)
+ meson_options.txt         |  7 +++++++
+ 3 files changed, 39 insertions(+), 4 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 6da6e04..681f7c8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -515,13 +515,17 @@ AC_ARG_ENABLE(resize-optimization,
- AS_IF([test "x$enable_resize_optimization" = "xyes"],
-       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
- 
-+AC_ARG_WITH(pam,
-+            AS_HELP_STRING([--with-pam], [Use PAM]),
-+            [use_pam=$withval], [use_pam=yes])
- AC_ARG_ENABLE(weston-launch, [  --enable-weston-launch],, enable_weston_launch=yes)
- AM_CONDITIONAL(BUILD_WESTON_LAUNCH, test x$enable_weston_launch = xyes)
--if test x$enable_weston_launch = xyes; then
-+if test x$enable_weston_launch = xyes -a x$use_pam = xyes; then
-   WESTON_SEARCH_LIBS([PAM], [pam], [pam_open_session], [have_pam=yes], [have_pam=no])
-   if test x$have_pam = xno; then
--    AC_ERROR([weston-launch requires pam])
-+    AC_ERROR([PAM support is explicitly requested, but libpam couldn't be found])
-   fi
-+  AC_DEFINE([HAVE_PAM], [1], [Define if PAM is available])
- fi
- 
- AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" = "xyes")
-@@ -767,6 +771,7 @@ AC_MSG_RESULT([
- 	Enable developer documentation	${enable_devdocs}
- 
- 	weston-launch utility		${enable_weston_launch}
-+	PAM support			${use_pam}
- 	systemd-login support		${have_systemd_login}
- 	systemd notify support		${enable_systemd_notify}
- 
+diff --git a/libweston/meson.build b/libweston/meson.build
+index 33ab970..32f495a 100644
+--- a/libweston/meson.build
++++ b/libweston/meson.build
+@@ -472,16 +472,24 @@ if get_option('renderer-gl')
+ endif
+ 
+ if get_option('weston-launch')
+-	dep_pam = cc.find_library('pam')
++	deps_weston_launch = [systemd_dep, dep_libdrm]
+ 
+-	if not cc.has_function('pam_open_session', dependencies: dep_pam)
+-		error('pam_open_session not found for weston-launch')
++	if get_option('pam')
++		dep_pam = cc.find_library('pam')
++		if not cc.has_function('pam_open_session', dependencies: dep_pam)
++			error('pam_open_session not found for weston-launch')
++		endif
++
++		if dep_pam.found()
++			deps_weston_launch += dep_pam
++			config_h.set('HAVE_PAM', '1')
++		endif
+ 	endif
+ 
+ 	executable(
+ 		'weston-launch',
+ 		'weston-launch.c',
+-		dependencies: [dep_pam, systemd_dep, dep_libdrm],
++		dependencies: deps_weston_launch,
+ 		include_directories: include_directories('..'),
+ 		install: true
+ 	)
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
 index 9064439..c6abe92 100644
 --- a/libweston/weston-launch.c
@@ -172,3 +174,24 @@ index 9064439..c6abe92 100644
  
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
+diff --git a/meson_options.txt b/meson_options.txt
+index 0e1d183..9a5c3d5 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -73,6 +73,13 @@ option(
+ )
+ 
+ option(
++	'pam',
++	type: 'boolean',
++	value: true,
++	description: 'Define if PAM is available'
++)
++
++option(
+ 	'xwayland',
+ 	type: 'boolean',
+ 	value: true,
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/wayland/weston_6.0.1.bb b/meta/recipes-graphics/wayland/weston_6.0.1.bb
index 95b5403..fe8f1b8 100644
--- a/meta/recipes-graphics/wayland/weston_6.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_6.0.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://0001-make-error-portable.patch \
            file://xwayland.weston-start \
+           file://0001-make-error-portable.patch \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
 SRC_URI[md5sum] = "e7b10710ef1eac82258f97bfd41fe534"
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a51
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-inherit autotools pkgconfig useradd distro_features_check
+inherit meson pkgconfig useradd distro_features_check
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
 
@@ -26,49 +26,48 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
-EXTRA_OECONF = "--enable-setuid-install \
-                --disable-rdp-compositor \
-                --enable-autotools \
-                "
+EXTRA_OEMESON += "-Dbackend-default=auto -Dbackend-rdp=false"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x11', d)} \
+                   ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
                    clients launch"
 #
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa virtual/libgbm mtdev"
+PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/mesa virtual/libgbm mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
+PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
 # Weston on X11
-PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
-PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
 # Weston on framebuffer
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+PACKAGECONFIG[fbdev] = "-Dbackend-fbdev=true,-Dbackend-fbdev=false,udev mtdev"
 # weston-launch
-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,drm"
+PACKAGECONFIG[launch] = "-Dweston-launch=true,-Dweston-launch=false,drm"
 # VA-API desktop recorder
-PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
+PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
 # Weston with EGL support
-PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
-# Weston with cairo glesv2 support
-PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
+PACKAGECONFIG[egl] = "-Drenderer-gl=true,-Drenderer-gl=false,virtual/egl"
 # Weston with lcms support
-PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
+PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
 # Weston with webp support
-PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
+PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
-PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
+PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
 # colord CMS support
-PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
+PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,colord"
 # Clients support
-PACKAGECONFIG[clients] = "--enable-clients --enable-simple-clients --enable-demo-clients-install,--disable-clients --disable-simple-clients"
+PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
+# Virtual remote output with GStreamer on DRM backend
+PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
 # Weston with PAM support
-PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
@@ -86,6 +85,10 @@ do_install_append() {
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
 		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
 	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" = "yes" ]; then
+		chmod u+s ${D}${bindir}/weston-launch
+	fi
 }
 
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
-- 
2.7.4


