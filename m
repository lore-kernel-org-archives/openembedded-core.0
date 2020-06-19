Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2329.1592594903994076464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 12:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05JJSKRm015605
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 12:28:22 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 19 Jun 2020
 12:28:20 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] dbus,dbus-test: Move common parts to dbus.inc
Date: Fri, 19 Jun 2020 22:25:50 +0300
Message-ID: <20200619192550.12379-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619192550.12379-1-ovidiu.panait@windriver.com>
References: <20200619192550.12379-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

dbus and dbus-test share the same source code and base configuration options,
so factor out the common parts into dbus.inc.

This way we can eliminate the need to keep the two recipes in sync. When they
are not properly in sync (e.g. when dbus recipe has extra patches/config
options that are not duplicated in dbus-test) ptest testsuite will actually
test a slightly different codebase. This is due to the fact that dbus-test does
not run the testsuite against the system libdbus library, but instead it
generates a local libdbus.so that needs to configured/compiled as close as
possible to the system one.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.18.bb | 38 +++++---------------
 meta/recipes-core/dbus/dbus.inc             | 34 ++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.12.18.bb      | 39 +++------------------
 3 files changed, 47 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus.inc

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
index 68fcdc847f..755c841bad 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
@@ -1,53 +1,31 @@
 SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
 HOMEPAGE = "http://dbus.freedesktop.org"
 SECTION = "base"
-LICENSE = "AFL-2.1 | GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 
-DEPENDS = "dbus glib-2.0"
+require dbus.inc
 
-RDEPENDS_${PN}-dev = ""
+SRC_URI += "file://run-ptest \
+            file://python-config.patch \
+	    "
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
-           file://tmpdir.patch \
-           file://run-ptest \
-           file://python-config.patch \
-           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           "
+DEPENDS = "dbus glib-2.0"
 
-SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
-SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
+RDEPENDS_${PN}-dev = ""
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
 
-inherit autotools pkgconfig gettext ptest upstream-version-is-even
+inherit ptest
 
-EXTRA_OECONF = "--enable-tests \
+EXTRA_OECONF += "--enable-tests \
                 --enable-modular-tests \
                 --enable-installed-tests \
                 --enable-checks \
                 --enable-asserts \
-                --enable-largefile \
-                --disable-xml-docs \
-                --disable-doxygen-docs \
-                --disable-libaudit \
                 --with-dbus-test-dir=${PTEST_PATH} \
                 --enable-embedded-tests \
              "
 
-EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
-PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_class-nativesdk = ""
-
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
-PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
-PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
-PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
-
 do_install() {
     :
 }
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
new file mode 100644
index 0000000000..3bdb7ea4ff
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -0,0 +1,34 @@
+inherit autotools pkgconfig gettext upstream-version-is-even
+
+LICENSE = "AFL-2.1 | GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+
+SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://tmpdir.patch \
+           file://dbus-1.init \
+           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+"
+
+SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
+SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
+
+EXTRA_OECONF = "--disable-xml-docs \
+                --disable-doxygen-docs \
+                --disable-libaudit \
+                --enable-largefile \
+                --with-system-socket=/run/dbus/system_bus_socket \
+                "
+EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
+EXTRA_OECONF_append_class-native = " --disable-selinux"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   user-session \
+                  "
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
+PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
diff --git a/meta/recipes-core/dbus/dbus_1.12.18.bb b/meta/recipes-core/dbus/dbus_1.12.18.bb
index 2fcb3079ad..cf6f7dc0ef 100644
--- a/meta/recipes-core/dbus/dbus_1.12.18.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.18.bb
@@ -2,9 +2,9 @@ SUMMARY = "D-Bus message bus"
 DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a \"single instance\" application or daemon, and to launch applications and daemons on demand when their services are needed."
 HOMEPAGE = "https://dbus.freedesktop.org"
 SECTION = "base"
-LICENSE = "AFL-2.1 | GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+
+require dbus.inc
+
 DEPENDS = "expat virtual/libintl autoconf-archive"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
@@ -12,16 +12,7 @@ PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '',
 ALLOW_EMPTY_dbus-ptest = "1"
 RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
 
-SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
-           file://tmpdir.patch \
-           file://dbus-1.init \
-           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-"
-
-SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
-SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
-
-inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
+inherit useradd update-rc.d
 
 INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
@@ -92,27 +83,7 @@ pkg_postinst_dbus() {
 }
 
 
-EXTRA_OECONF = "--disable-tests \
-                --disable-xml-docs \
-                --disable-doxygen-docs \
-                --disable-libaudit \
-                --enable-largefile \
-                --with-system-socket=/run/dbus/system_bus_socket \
-                "
-
-EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-EXTRA_OECONF_append_class-native = " --disable-selinux"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
-                   user-session \
-                  "
-
-PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_class-nativesdk = ""
-
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
-PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
-PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
+EXTRA_OECONF += "--disable-tests"
 
 do_install() {
 	autotools_do_install
-- 
2.17.1

