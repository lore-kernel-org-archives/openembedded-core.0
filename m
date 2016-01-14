Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 494C7731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 09:16:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0E9GAVV000967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 01:16:10 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jan 2016 01:16:09 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 17:16:23 +0800
Message-ID: <20171601baf18618d87a63ef758786f5b59bd7bf.1452762932.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452762932.git.Qi.Chen@windriver.com>
References: <cover.1452762932.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus: upgrade to 1.10.6
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
X-List-Received-Date: Thu, 14 Jan 2016 09:16:11 -0000
Content-Type: text/plain

1. Upgrade dbus and dbus-test to 1.10.6.
2. Modify PACKAGECONFIG for systemd to avoid runtime failure.
3. Modify python-config.patch to suite the latest version.
4. Change FILES variable to suite the latest version.
5. Remove obsolete option '--without-dbus-glib'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{dbus-test_1.8.20.bb => dbus-test_1.10.6.bb}    |  4 ++--
 meta/recipes-core/dbus/dbus/python-config.patch     | 21 +++++++++++++++------
 .../dbus/{dbus_1.8.20.bb => dbus_1.10.6.bb}         | 17 +++++++++++------
 3 files changed, 28 insertions(+), 14 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.6.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.8.20.bb => dbus_1.10.6.bb} (90%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.20.bb b/meta/recipes-core/dbus/dbus-test_1.10.6.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.8.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.6.bb
index f5400a0..147451f 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.6.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
+SRC_URI[md5sum] = "26d0cf3a1c9782cb0e342101f0450440"
+SRC_URI[sha256sum] = "b5fefa08a77edd76cd64d872db949eebc02cf6f3f8be82e4bbc641742af5d35f"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus/python-config.patch b/meta/recipes-core/dbus/dbus/python-config.patch
index 2944002..da2f10c 100644
--- a/meta/recipes-core/dbus/dbus/python-config.patch
+++ b/meta/recipes-core/dbus/dbus/python-config.patch
@@ -7,19 +7,28 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
---- dbus-1.6.8/configure.ac.orig	2013-07-11 14:15:58.834554799 -0500
-+++ dbus-1.6.8/configure.ac	2013-07-11 14:14:40.969554848 -0500
-@@ -257,13 +257,6 @@
+---
+ configure.ac | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 80d27b4..becc1cc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -279,13 +279,6 @@ if test "x$enable_tests" = xyes; then
    # full test coverage is required, Python is a hard dependency
-   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygobject])
+   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygi])
    AM_PATH_PYTHON([2.6])
 -  AC_MSG_CHECKING([for Python modules for full test coverage])
--  if "$PYTHON" -c "import dbus, gobject, dbus.mainloop.glib"; then
+-  if "$PYTHON" -c "import dbus, gi.repository.GObject, dbus.mainloop.glib"; then
 -    AC_MSG_RESULT([yes])
 -  else
 -    AC_MSG_RESULT([no])
--    AC_MSG_ERROR([cannot import dbus, gobject, dbus.mainloop.glib Python modules])
+-    AC_MSG_ERROR([cannot import dbus, gi.repository.GObject, dbus.mainloop.glib Python modules])
 -  fi
  else
    # --enable-tests not given: do not abort if Python is missing
    AM_PATH_PYTHON([2.6], [], [:])
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/dbus/dbus_1.10.6.bb
similarity index 90%
rename from meta/recipes-core/dbus/dbus_1.8.20.bb
rename to meta/recipes-core/dbus/dbus_1.10.6.bb
index 0c7f6b1..d159478 100644
--- a/meta/recipes-core/dbus/dbus_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.6.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://0001-configure.ac-support-large-file-for-stat64.patch \
 "
 
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
+SRC_URI[md5sum] = "26d0cf3a1c9782cb0e342101f0450440"
+SRC_URI[sha256sum] = "b5fefa08a77edd76cd64d872db949eebc02cf6f3f8be82e4bbc641742af5d35f"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
@@ -59,15 +59,21 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-monitor \
                ${bindir}/dbus-launch \
                ${bindir}/dbus-run-session \
+               ${bindir}/dbus-update-activation-environment \
+               ${bindir}/dbus-test-tool \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
                ${datadir}/dbus-1/services \
                ${datadir}/dbus-1/system-services \
+               ${datadir}/dbus-1/session.d \
+               ${datadir}/dbus-1/session.conf \
+               ${datadir}/dbus-1/system.d \
+               ${datadir}/dbus-1/system.conf \
                ${systemd_unitdir}/system/"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
-FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
+FILES_${PN}-dev += "${libdir}/dbus-1.0/include"
 
 pkg_postinst_dbus() {
 	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
@@ -87,8 +93,7 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-                --disable-systemd \
-                --without-dbus-glib"
+                "
 
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
@@ -100,7 +105,7 @@ PACKAGECONFIG_class-nativesdk = ""
 
 # Would like to --enable-systemd but that's a circular build-dependency between
 # systemd<->dbus
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 
-- 
1.9.1


