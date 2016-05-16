Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id B0852731D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 15:38:00 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7A00E7D0QNR830@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 16 May 2016 10:37:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=kj9zAlcOel0A:10 a=yrkiwgmsf1kA:10	a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8
	a=MQQvbd3fAAAA:8 a=hD80L64hAAAA:8	a=gvl4HP8tAAAA:8 a=Q4-j1AaZAAAA:8
	a=iRJ7mXOcSlzekKp_dnEA:9	a=kUZx9T4gdFhvFmdD:21 a=GaKGfDsO8ZfPT1WQ:21
	a=ShuWEbMAaUlRaKg3:21	a=CjuIK1q_8ugA:10 a=7EJNaiyv9V4A:10
Received: by 100.15.86.14 with SMTP id 40ee9aee; Mon, 16 May 2016 15:37:45 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A75A016200C; Mon,
	16 May 2016 11:37:34 -0400 (EDT)
Date: Mon, 16 May 2016 11:37:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-id: <20160516153734.GN27602@denix.org>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
	<cb405da51da0413d5ac5999330a4e49cb7be262f.1463404035.git.jussi.kukkonen@intel.com>
MIME-version: 1.0
In-reply-to: <cb405da51da0413d5ac5999330a4e49cb7be262f.1463404035.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Mon, 16 May 2016 15:38:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, May 16, 2016 at 04:22:50PM +0300, Jussi Kukkonen wrote:
> Support for multiple new protocols, many new features:
> https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.html
> 
> * Weston now depends on wayland-protocols (which is protocol
>   collection split off from weston).

Thanks! I've been looking into this update recently, but haven't been able to 
finish wayland-protocols work yet due to lack of time... Appreciate you taking 
a stab at it!


> * Remove upstreamed patches, add a patch to fix the wayland-protocols
>   path used during build.
> * Use HTTPS for tarball download
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  ...1-configure.ac-Fix-wayland-protocols-path.patch | 34 +++++++++++
>  .../weston/explicit-enable-disable-systemd.patch   | 70 ----------------------
>  .../wayland/weston/libsystemd.patch                | 53 ----------------
>  .../weston/make-lcms-explicitly-configurable.patch | 43 -------------
>  .../wayland/{weston_1.9.0.bb => weston_1.10.0.bb}  | 14 ++---
>  5 files changed, 41 insertions(+), 173 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch
>  delete mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
>  rename meta/recipes-graphics/wayland/{weston_1.9.0.bb => weston_1.10.0.bb} (89%)
> 
> diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
> new file mode 100644
> index 0000000..7e00038
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
> @@ -0,0 +1,34 @@
> +From 1cfc1434a5d385a74de593ec7601674dba39e2fe Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 11 May 2016 16:16:30 +0300
> +Subject: [PATCH] configure.ac: Fix wayland-protocols path
> +
> +The wayland-protocols directory is used during build: Fix the path
> +to point to sysroot specified in recipe.
> +
> +Normally PKG_CONFIG_SYSROOT_DIR could be used in configure.ac but that
> +breaks multilib weston as it would point to multilib sysroot when the
> +(allarch) wayland-protocols is actually in the machine sysroot.
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Upstream-Status: Inappropriate [embedded specific]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index bc7c329..15a05d3 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -184,7 +184,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [libinput >= 0.8.0])
> + PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
> + 
> + PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.0],
> +-		  [ac_wayland_protocols_pkgdatadir=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
> ++		  [ac_wayland_protocols_pkgdatadir=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
> + AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
> + 
> + AC_ARG_ENABLE(wayland-compositor, [  --enable-wayland-compositor],,
> +-- 
> +2.1.4
> +
> diff --git a/meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch b/meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
> deleted file mode 100644
> index a40eaf1..0000000
> --- a/meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 8e1efcd40b3bad81c83744e2e120d70c2b567ef2 Mon Sep 17 00:00:00 2001
> -From: Frederico Cadete <frederico@cadete.eu>
> -Date: Mon, 28 Sep 2015 00:30:10 +0200
> -Subject: configure.ac: add explicit enable/disable for systemd-login support
> -
> -Otherwise, auto-enable depending on whether the system has the necessary
> -libraries.
> -
> -[Updated help text as per pq suggestion -- bwh]
> -
> -Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
> -Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> -Tested-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> -
> -Upstream-Status: Backport
> -Backported from Weston git:
> -http://cgit.freedesktop.org/wayland/weston/commit/?id=8e1efc
> -
> -Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> -
> -diff --git a/configure.ac b/configure.ac
> -index a9cd429..67e80d0 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -380,18 +380,30 @@ AC_ARG_ENABLE(resize-optimization,
> - AS_IF([test "x$enable_resize_optimization" = "xyes"],
> -       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
> - 
> --PKG_CHECK_MODULES(SYSTEMD_LOGIN,
> --                  [libsystemd >= 209],
> --                  [have_systemd_login_209=yes;have_systemd_login=yes],
> --                  [have_systemd_login_209=no;have_systemd_login=no])
> --
> --# Older versions of systemd package systemd-login separately. Fall back on that
> --AS_IF([test x$have_systemd_login != xyes],[
> --      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
> --                        [libsystemd-login >= 198],
> --                        [have_systemd_login=yes],
> --                        [have_systemd_login=no])
> --      ])
> -+AC_ARG_ENABLE(systemd-login,
> -+              AS_HELP_STRING([--enable-systemd-login],
> -+                             [Enable logind support]),,
> -+              enable_systemd_login=auto)
> -+if test x$enable_systemd_login != xno; then
> -+  PKG_CHECK_MODULES(SYSTEMD_LOGIN,
> -+                    [libsystemd >= 209],
> -+                    [have_systemd_login_209=yes;have_systemd_login=yes],
> -+                    [have_systemd_login_209=no;have_systemd_login=no])
> -+
> -+  # Older versions of systemd package systemd-login separately. Fall back on that
> -+  AS_IF([test x$have_systemd_login != xyes],[
> -+        PKG_CHECK_MODULES(SYSTEMD_LOGIN,
> -+                          [libsystemd-login >= 198],
> -+                          [have_systemd_login=yes],
> -+                          [have_systemd_login=no])
> -+        ])
> -+else
> -+  have_systemd_login=no
> -+fi
> -+
> -+if test "x$have_systemd_login" = "xno" -a "x$enable_systemd_login" = "xyes"; then
> -+  AC_MSG_ERROR([systemd-login support explicitly enabled, but can't find libsystemd>=209 or libsystemd-login])
> -+fi
> - 
> - AS_IF([test "x$have_systemd_login" = "xyes"],
> -       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
> --- 
> -cgit v0.10.2
> -
> diff --git a/meta/recipes-graphics/wayland/weston/libsystemd.patch b/meta/recipes-graphics/wayland/weston/libsystemd.patch
> deleted file mode 100644
> index 2d28d56..0000000
> --- a/meta/recipes-graphics/wayland/weston/libsystemd.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 5eb025a867b42f8bc7bc73279eac8de58e51a13e Mon Sep 17 00:00:00 2001
> -From: Frederico Cadete <frederico@cadete.eu>
> -Date: Mon, 28 Sep 2015 00:30:09 +0200
> -Subject: configure.ac: add support for new versions of systemd
> -
> -Starting from systemd version 209, a single libsystemd.pc is provided.
> -For previous versions, fall back on libsystemd-login.pc.
> -
> -Signed-off-by: Frederico Cadete <frederico@cadete.eu>
> -Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
> -Reviewed-by: Derek Foreman <derekf@osg.samsung.com>
> -
> -Upstream-Status: Backport
> -Backported from Weston git:
> -http://cgit.freedesktop.org/wayland/weston/commit/?id=5eb025
> -
> -Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 045291c..a9cd429 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -380,14 +380,23 @@ AC_ARG_ENABLE(resize-optimization,
> - AS_IF([test "x$enable_resize_optimization" = "xyes"],
> -       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
> - 
> --PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login >= 198],
> --                  [have_systemd_login=yes], [have_systemd_login=no])
> -+PKG_CHECK_MODULES(SYSTEMD_LOGIN,
> -+                  [libsystemd >= 209],
> -+                  [have_systemd_login_209=yes;have_systemd_login=yes],
> -+                  [have_systemd_login_209=no;have_systemd_login=no])
> -+
> -+# Older versions of systemd package systemd-login separately. Fall back on that
> -+AS_IF([test x$have_systemd_login != xyes],[
> -+      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
> -+                        [libsystemd-login >= 198],
> -+                        [have_systemd_login=yes],
> -+                        [have_systemd_login=no])
> -+      ])
> -+
> - AS_IF([test "x$have_systemd_login" = "xyes"],
> -       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
> - AM_CONDITIONAL(HAVE_SYSTEMD_LOGIN, test "x$have_systemd_login" = "xyes")
> - 
> --PKG_CHECK_MODULES(SYSTEMD_LOGIN_209, [libsystemd-login >= 209],
> --                  [have_systemd_login_209=yes], [have_systemd_login_209=no])
> - AS_IF([test "x$have_systemd_login_209" = "xyes"],
> -       [AC_DEFINE([HAVE_SYSTEMD_LOGIN_209], [1], [Have systemd-login >= 209])])
> - 
> --- 
> -cgit v0.10.2
> -
> diff --git a/meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch b/meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
> deleted file mode 100644
> index 35e6d6f..0000000
> --- a/meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -weston-1.5.0/configure.ac: make lcms explicitly configurable
> -
> -The lcms package is outside of openembedded-core, so make it
> -explicitly configurable. Make it deterministic, so that if lcms
> -dependencies are missing, autoconf throws a fatal error. Follow
> -upstream style to make it more likely to be merged.
> -
> -Upstream-Status: Pending
> -
> -Index: weston-1.5.0/configure.ac
> -===================================================================
> ---- weston-1.5.0.orig/configure.ac
> -+++ weston-1.5.0/configure.ac
> -@@ -491,12 +491,24 @@ AC_ARG_ENABLE(demo-clients-install,
> - 			     enable_demo_clients_install=no)
> - AM_CONDITIONAL(INSTALL_DEMO_CLIENTS, [test "x$enable_demo_clients_install" = "xyes"])
> - 
> --PKG_CHECK_MODULES(LCMS, lcms2,
> --                  [have_lcms=yes], [have_lcms=no])
> --if test "x$have_lcms" = xyes; then
> --       AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
> -+AC_ARG_ENABLE(lcms,
> -+              AS_HELP_STRING([--disable-lcms],
> -+                             [Disable lcms support]),,
> -+              enable_lcms=auto)
> -+AM_CONDITIONAL(HAVE_LCMS, [test "x$enable_lcms" = xyes])
> -+if test "x$enable_lcms" != "xno"; then
> -+        PKG_CHECK_MODULES(LCMS, 
> -+                         lcms2,
> -+                         [have_lcms=yes],
> -+                         [have_lcms=no])
> -+        if test "x$have_lcms" = "xno" -a "x$enable_lcms" = "xyes"; then
> -+          AC_MSG_ERROR([lcms support explicitly requested, but lcms couldn't be found])
> -+        fi
> -+        if test "x$have_lcms" = "xyes"; then
> -+                enable_lcms=yes
> -+                AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
> -+        fi
> - fi
> --AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
> - 
> - AC_PATH_PROG([wayland_scanner], [wayland-scanner])
> - if test x$wayland_scanner = x; then
> diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
> similarity index 89%
> rename from meta/recipes-graphics/wayland/weston_1.9.0.bb
> rename to meta/recipes-graphics/wayland/weston_1.10.0.bb
> index 16a788d..3eccb1f 100644
> --- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
> @@ -5,24 +5,22 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
>                      file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
>  
> -SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> +SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://weston.png \
>             file://weston.desktop \
> -           file://make-lcms-explicitly-configurable.patch \
>             file://make-libwebp-explicitly-configurable.patch \
>             file://0001-make-error-portable.patch \
> -           file://libsystemd.patch \
> -           file://explicit-enable-disable-systemd.patch \
> +           file://0001-configure.ac-Fix-wayland-protocols-path.patch \
>  "
> -SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
> -SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
> +SRC_URI[md5sum] = "1cd17c54ecac6d9a3cd90bf12eaa3e20"
> +SRC_URI[sha256sum] = "e0b2004d00d8293ddf7903ca283c1746afa9ccb5919ab50fd04397ff472aa5c1"
>  
>  inherit autotools pkgconfig useradd distro_features_check
>  # depends on virtual/egl
>  REQUIRED_DISTRO_FEATURES = "opengl"
>  
>  DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> -DEPENDS += "wayland libinput virtual/egl pango wayland-native"
> +DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
>  
>  EXTRA_OECONF = "--enable-setuid-install \
>                  --enable-simple-clients \
> @@ -30,6 +28,7 @@ EXTRA_OECONF = "--enable-setuid-install \
>                  --enable-demo-clients-install \
>                  --disable-rpi-compositor \
>                  --disable-rdp-compositor \
> +                WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
>                  "
>  
>  EXTRA_OECONF_append_qemux86 = "\
> @@ -98,6 +97,7 @@ FILES_${PN}-examples = "${bindir}/*"
>  
>  RDEPENDS_${PN} += "xkeyboard-config"
>  RRECOMMENDS_${PN} = "liberation-fonts"
> +RRECOMMENDS_${PN}-dev += "wayland-protocols"
>  
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "--system weston-launch"
> -- 
> 2.1.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

