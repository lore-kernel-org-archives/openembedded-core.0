Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.9558.1631282886055047929
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pUerOhGr;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id v2so3062510oie.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C+OpCesJfV6ZCK0OsPCeo1Ev3/AMNn+ltiPvxbKqD5s=;
        b=pUerOhGrR01eI5g6ZnugtnB62lq0NE/Wi95FrPxiMnkA0nXMUwEn280tkyAMSp4j0I
         avfcgeJvs6KFUjW8zbIZACdKmq5JpMcbRp38QphHQ37sgerNZ0g2tZ/ryHwQ2fL71MVn
         Bx/3uemGli1GYk+UK+f1wZXWUXlQqv0a+c0Jrij8lknTwGSwo4XtGUr0+9pGoV/K3s75
         mwu+Kbq8NDj7044JAdszB01MdkGq1+ll0g495djGgx1fju2xT8k7q+8Ubn4+bxYpZDcW
         9PH5klUi76VrTHQ2O79rHyY9ELmBzn6jrSxzIX1/AAFL3+hpg7raCXEuPgGb+izuY5FG
         WD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C+OpCesJfV6ZCK0OsPCeo1Ev3/AMNn+ltiPvxbKqD5s=;
        b=fZeeFQIzq258HRdy8xaqXWTyNnGIe30vwUWfdBo/4z5oIAkbKqkNVXzfRmGNxvR3zH
         /sqQtAXDrrb1l/HMKs1VJrI25xaG4R9LJ5/HC291T8otWsR8EbdLvwwJQBsaOPWugASV
         io0YEKXVHp/hwEZF5wvPLD2v/4vd0K17AkB5dVnnNZARg7te2XI7gsaOl7U1mrZY1Cvw
         wwYcuzzMV6AZ3SlOfRGZ9VMAIKARfF29okypcwnzOqMwI9GZT+Vq3+xAhsV3h9QiNJ3V
         cfX0Myc8Rbus7h/vM0mhW1jG+TiXJFhmkpVy1Jss4u7pqE4sKqoR+jF/m853gqBS7wCG
         o53A==
X-Gm-Message-State: AOAM530rrpczuJ/MIaAuyW8OMzB1QQDGysVPcBDg8x8s/iVJe9xSag2M
	xor9z2kx38vrqAYkFuVdrAhQ00Hn+CKrlZuw
X-Google-Smtp-Source: ABdhPJw3PE74Liv0GHQt3HKj4a6AzbXYYsidBmMggsyT6uEm753k+TjKxCp4jbPaMepVnSZZ8Bv7DQ==
X-Received: by 2002:aca:b80b:: with SMTP id i11mr4294042oif.26.1631282884595;
        Fri, 10 Sep 2021 07:08:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] dbus,dbus-test: Move common parts to dbus.inc
Date: Fri, 10 Sep 2021 04:07:15 -1000
Message-Id: <4893d6f10ba25dc918b4c3209e66d4bd77ac27e2.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

dbus and dbus-test share the same source code and base configuration options,
so factor out the common parts into dbus.inc.

This way we can eliminate the need to keep the two recipes in sync. When they
are not properly in sync (e.g. when dbus recipe has extra patches/config
options that are not duplicated in dbus-test) ptest testsuite will actually
test a slightly different codebase. This is due to the fact that dbus-test does
not run the testsuite against the system libdbus library, but instead it
generates a local libdbus.so that needs to configured/compiled as close as
possible to the system one.

(From OE-Core rev: 1cde2935526d2eec7d6b17a6c622647b0c132439)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44ae5d8d6f26fda4ab1a3fef9fc49d74e4ac89f0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

