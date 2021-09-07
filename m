Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.4604.1631057552451360736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 16:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RDY3BNR7;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id q22so476582pfu.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xjOlSHUpeHl9uxQDT7BH3SSvj5n/k4tIcKvNq3+nbcE=;
        b=RDY3BNR7XHgwlySi3TNIy4t+d16ERUXNLxgqnfjHKXdQTqVDgCYO7oyRq5+CpeGfDC
         +Cl5zn6FmRQqyZHsZSoa31zsXZ4mkXWOJRkF7PJv9dB/2Pm/N0+B3sccU8helxjv3Of8
         QTEWYWsynO3aheK5vHxhjlF+bVZ5yf+fzHLfhtXfQZKxkJra1yX/+FpLpTJcohr2E8EA
         2GZxm9Ih51ks9vN2/mR+qt8UKAlysm4Xwg8McAWPumF6AjDDfqgGD/itk/9cxFNhOl0s
         islaPNWy/lFIJWVfkby4vRII7JXTP4c/qmD39Fnz+Ppg3Kk99JFOEdD6iu/FTdhPOlal
         f1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjOlSHUpeHl9uxQDT7BH3SSvj5n/k4tIcKvNq3+nbcE=;
        b=Qbi1gQE33r700kRLTZ46n/QpsxUrhKB+/E4CdjP42gHDYsET9aYhzibH0kdjVmTjmB
         5v42NGn3K71NSi3424dVhxXuj1S7jYa1s8g8ez2q24JB6xhoxkibCmjnkGZvcet5kUQS
         101snlNwV1u23jzNQRIa+emvLJBZdq8VjcxjZF+1+HFs5hMm0xk1PBGYmq0lgjKeEalx
         ysPMawj0IBJpzF6PEgxXvMrQmRZ/d+159zzwoXwbmhCN/fyB01PXVMyGQhU31A67t/Pl
         5DGhcnAFwK8AxUJoNjpXzoNEnAz43y5AxVkBf2Y33ycMl8Pwu5fKQ5qh8ZVc78PmpzT4
         LMuw==
X-Gm-Message-State: AOAM533nBuAKHC7YWjiMkBkt8x42RnY5sKOpaNE0qAUl3lovJYGXiCF5
	aU3dXIGRBV+eAwL6Hw6SQ0uuXOnKj+4=
X-Google-Smtp-Source: ABdhPJwZNjYdWSwWepUeAtsBVZrjfB0vaw14bHo+SrRorj2Wffdrch93uONBqu04eK9txzpGCTjb4A==
X-Received: by 2002:a63:ac09:: with SMTP id v9mr728878pge.355.1631057551822;
        Tue, 07 Sep 2021 16:32:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ece:8e2f:f07e:736f])
        by smtp.gmail.com with ESMTPSA id d200sm157186pfd.127.2021.09.07.16.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 16:32:31 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ovidiu Panait <ovidiu.panait@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 4/5] dbus,dbus-test: Move common parts to dbus.inc
Date: Tue,  7 Sep 2021 16:32:26 -0700
Message-Id: <20210907233227.3265977-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907233227.3265977-1-akuster808@gmail.com>
References: <20210907233227.3265977-1-akuster808@gmail.com>
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

