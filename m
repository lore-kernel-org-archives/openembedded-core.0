Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 006C660107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:28:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 193C6601748
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Nov 2015 15:27:44 +0100
Message-Id: <5b0777dd5f120c6235dad62bab0dd8972a7c54be.1448029554.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
In-Reply-To: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
Subject: [PATCH v3 2/3] dbus: update the recipes to 1.10.2
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
X-List-Received-Date: Fri, 20 Nov 2015 14:28:03 -0000

dbus 1.10.2 doesn't depend on dbus-glib anymore, so drop the
dependency.

Refresh python-config.patch.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 .../dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.2.bb}      |  4 ++--
 meta/recipes-core/dbus/dbus/python-config.patch            | 13 +++++++------
 meta/recipes-core/dbus/{dbus_1.8.20.bb => dbus_1.10.2.bb}  | 14 +++++++++-----
 3 files changed, 18 insertions(+), 13 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.2.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.8.20.bb => dbus_1.10.2.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.20.bb b/meta/recipes-core/dbus/dbus-test_1.10.2.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.8.20.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.2.bb
index 704070b..8317548 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.2.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
+SRC_URI[md5sum] = "9190f5c0e41e8d220352c058faf5463522378e35"
+SRC_URI[sha256sum] = "aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
 
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
diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/dbus/dbus_1.10.2.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus_1.8.20.bb
rename to meta/recipes-core/dbus/dbus_1.10.2.bb
index 207a018..9e24090 100644
--- a/meta/recipes-core/dbus/dbus_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
-SRC_URI[sha256sum] = "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
+SRC_URI[md5sum] = "2428919cc77b8d0028d65ee4d5dbef31"
+SRC_URI[sha256sum] = "aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
 
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
2.5.0


