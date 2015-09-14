Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 2B72176E04
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:07:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id F30565188055
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 12:07:08 +0200
Message-Id: <1442225233-18899-2-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
Subject: [PATCH v2 2/7] dbus: update the recipes to 1.10.0
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
X-List-Received-Date: Mon, 14 Sep 2015 10:07:47 -0000

---
 .../dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.0.bb}      |  6 +++---
 meta/recipes-core/dbus/dbus/python-config.patch            | 13 +++++++------
 meta/recipes-core/dbus/{dbus_1.8.20.bb => dbus_1.10.0.bb}  | 14 +++++++++-----
 3 files changed, 19 insertions(+), 14 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.0.bb} (91%)
 rename meta/recipes-core/dbus/{dbus_1.8.20.bb => dbus_1.10.0.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.20.bb b/meta/recipes-core/dbus/dbus-test_1.10.0.bb
similarity index 91%
rename from meta/recipes-core/dbus/dbus-test_1.8.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.0.bb
index 704070b..7dec16e 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.0.bb
@@ -5,7 +5,7 @@ LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 
-DEPENDS = "python-pygobject dbus dbus-glib"
+DEPENDS = "python-pygobject dbus"
 
 RDEPENDS_${PN} += "make"
 RDEPENDS_${PN}-dev = ""
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
+SRC_URI[md5sum] = "5af6297348107a906c8449817a728b3b"
+SRC_URI[sha256sum] = "1dfb9745fb992f1ccd43c920490de8caddf6726a6222e8b803be6098293f924b"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus/python-config.patch b/meta/recipes-core/dbus/dbus/python-config.patch
index 2944002..fbb4ede 100644
--- a/meta/recipes-core/dbus/dbus/python-config.patch
+++ b/meta/recipes-core/dbus/dbus/python-config.patch
@@ -6,19 +6,20 @@ Disable the python module check for cross compiling.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
 
---- dbus-1.6.8/configure.ac.orig	2013-07-11 14:15:58.834554799 -0500
-+++ dbus-1.6.8/configure.ac	2013-07-11 14:14:40.969554848 -0500
-@@ -257,13 +257,6 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -267,13 +267,6 @@
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
diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/dbus/dbus_1.10.0.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus_1.8.20.bb
rename to meta/recipes-core/dbus/dbus_1.10.0.bb
index 207a018..cbfdf05 100644
--- a/meta/recipes-core/dbus/dbus_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
+SRC_URI[md5sum] = "5af6297348107a906c8449817a728b3b"
+SRC_URI[sha256sum] = "1dfb9745fb992f1ccd43c920490de8caddf6726a6222e8b803be6098293f924b"
 
 inherit useradd autotools pkgconfig gettext update-rc.d
 
@@ -58,15 +58,20 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-monitor \
                ${bindir}/dbus-launch \
                ${bindir}/dbus-run-session \
+               ${bindir}/dbus-update-activation-environment \
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
+FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool ${bindir}/dbus-test-tool"
 
 pkg_postinst_dbus() {
 	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
@@ -86,8 +91,7 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-                --disable-systemd \
-                --without-dbus-glib"
+                --disable-systemd"
 
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
-- 
2.1.4


