Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C29C02181
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.14676.1736325752650772356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GJ+C9vDA;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so9570812a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325751; x=1736930551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed8aY29KxnSvadn9u2HIINO+vTItfQ1qfJ65aHFX6rg=;
        b=GJ+C9vDA248CB7z3HvZi5GM+IQwynX2VxtwCck25HnxQIKRZAG4XiUdly5mPiIl4EQ
         1zZR3cTQwrRYOIA5cha3jHQYx9b8cC27ZFee8EgoZi4j/rMRWpzdSBz4JTgoKUtjT8ru
         nFD37MUOv7hVeed88tNIAFIe/YhMIN200XjF1lubfWOQ+MYX1gRrU8OSBroCEPa0ELG3
         vYtHj7eff9zEb5ot6EUo7LdaAvKuSgr8CktLWutZ0u1M7tOIXUTSsGkuB1gw6GN6BFzT
         W24ekRXzpe4i0bRV3tVfuF3z0Y5naCcIG1ZrLADcUniFitOy5+0QcOxWnTKyP9uLLzIV
         vG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325751; x=1736930551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed8aY29KxnSvadn9u2HIINO+vTItfQ1qfJ65aHFX6rg=;
        b=Z68ZENdAkLaOg6S4L0gdHpaotfRxIy4vUWlb0yYs7hgAFDbpI/+4Rv5BJHrGzBm1So
         CaekfbibDRvnbq8OUhOqMifiUc8/xr03C0NPG5SX7O+SzaXQ2mJ1JCMxmjWom3klHtTH
         AOU47+65nd2v/7s/xG6gbmk754XqlpKsj4E6+4kSXVN6hH7U9gqUj3r9q+Pyjz/r3BZZ
         qzeK6WSZvZw2rBiYzXVp4KU6X3TTm4jXV2BAM0fs4aKpIsoKlPHf3k79IsrKMNFQjtCa
         YeZEigUHJA5LoWAfKNJ1wLEheywJ5Og1WasqJj1AespOZdjH7/zlK15ckCr6bks3+eRb
         6h7Q==
X-Gm-Message-State: AOJu0Yy8rKTeh2eUzdsu1nw9uZ3liVkGCODbteu8X7lMH0SqmxMxLpDW
	D5C/g1THzgw7XpwDP/+KrgU9n1CXqcjkmJtyjf24KL8aBU/JFnz7zHZY+g==
X-Gm-Gg: ASbGncuCMIkWhQZzIxkuswfgf9t0W3b7UO3M3TUTGZdcfNsmAXVTkV1OLlBkc1QDARG
	xrbotGRa5NLEE/6w9T8sUr+tXwoaANq/9s9uPrKKDvKWprr9RoZ6yBA/skh044/WegG9HZUIX6Y
	qthE7OGIHCL30K9r3vmhwywTTpjDgR8deLTBwPx6PtqHwUTlTeOwvZAVrMSMRhlQ3gsxq320jM9
	7Dy7Qr6Il8qWo1ltNSdljwj+iZgQR8lb2f+7U3AcTXgtBKdQwuN1UmvNHarIcyss4R9Z2TZp0vB
	Ar0fP1uOwvGGLco2Mg==
X-Google-Smtp-Source: AGHT+IFb71or/rK4e/G0A+ULA3myXIKB99YJrNyGlU+Ud8WM/IKIpb4pCoL3jj/0c3w47UJ7TMVWnw==
X-Received: by 2002:a17:907:60cf:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-ab2abcb07e9mr124477066b.50.1736325750694;
        Wed, 08 Jan 2025 00:42:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/20] dbus: update 1.14.10 -> 1.16.0
Date: Wed,  8 Jan 2025 09:42:08 +0100
Message-Id: <20250108084226.117178-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209524

From: Alexander Kanavin <alex@linutronix.de>

Convert from autotools to meson.

Drop tmpdir.patch (replaced by -Dtest_socket_dir=/tmp --Dsession_socket_dir=/tmp).

License-Update: license texts split into separate files, SPDX ids added.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/dbus/dbus/tmpdir.patch      | 44 --------------
 .../dbus/{dbus_1.14.10.bb => dbus_1.16.0.bb}  | 59 +++++++++----------
 2 files changed, 27 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/tmpdir.patch
 rename meta/recipes-core/dbus/{dbus_1.14.10.bb => dbus_1.16.0.bb} (77%)

diff --git a/meta/recipes-core/dbus/dbus/tmpdir.patch b/meta/recipes-core/dbus/dbus/tmpdir.patch
deleted file mode 100644
index bf086e17887..00000000000
--- a/meta/recipes-core/dbus/dbus/tmpdir.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5105fedd7fa13dadd2d0d864fb77873b83b79a4b Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 23 Jun 2011 13:52:09 +0200
-Subject: [PATCH] buildsys: hardcode socketdir to /tmp
-
-the TMPDIR env var isn't always pointing to the right target path
-
-Upstream-Status: Inappropriate [embedded]
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Original comment:
-
-	avoid to check tmp dir at build time. instead uses hard coded /tmp here
-	comment added by Kevin Tian <kevin.tian@intel.com>
----
- configure.ac |   11 +----------
- 1 files changed, 1 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 408054b..6d26180 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1483,16 +1483,7 @@ AC_SUBST(TEST_LAUNCH_HELPER_BINARY)
- AC_DEFINE_UNQUOTED(DBUS_TEST_LAUNCH_HELPER_BINARY, "$TEST_LAUNCH_HELPER_BINARY",
-                    [Full path to the launch helper test program in the builddir])
- 
--#### Find socket directories
--if ! test -z "$TMPDIR" ; then
--   DEFAULT_SOCKET_DIR=$TMPDIR
--elif ! test -z "$TEMP" ; then
--   DEFAULT_SOCKET_DIR=$TEMP
--elif ! test -z "$TMP" ; then
--   DEFAULT_SOCKET_DIR=$TMP
--else
--   DEFAULT_SOCKET_DIR=/tmp
--fi
-+DEFAULT_SOCKET_DIR=/tmp
- 
- DEFAULT_SOCKET_DIR=`echo $DEFAULT_SOCKET_DIR | sed 's/+/%2B/g'`
- 
--- 
-1.6.6.1
-
diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.16.0.bb
similarity index 77%
rename from meta/recipes-core/dbus/dbus_1.14.10.bb
rename to meta/recipes-core/dbus/dbus_1.16.0.bb
index 6a08f6984e2..f516273cc77 100644
--- a/meta/recipes-core/dbus/dbus_1.14.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.0.bb
@@ -3,43 +3,44 @@ DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to t
 HOMEPAGE = "https://dbus.freedesktop.org"
 SECTION = "base"
 
-inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
+inherit meson pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb0ffc69a965797a3d6686baa153ef05 \
+                    file://dbus/dbus.h;beginline=6;endline=22;md5=df4251a6c6e15e6a9e3c77b2ac30065d \
                     "
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
-           file://tmpdir.patch \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f"
+SRC_URI[sha256sum] = "9f8ca5eb51cbe09951aec8624b86c292990ae2428b41b856e2bed17ec65c8849"
 
-EXTRA_OECONF = "--disable-xml-docs \
-                --disable-doxygen-docs \
-                --enable-largefile \
-                --with-system-socket=/run/dbus/system_bus_socket \
-                --enable-modular-tests \
-                --enable-checks \
-                --runstatedir=/run \
+EXTRA_OEMESON = "-Dxml_docs=disabled \
+                 -Ddoxygen_docs=disabled \
+                 -Dsystem_socket=/run/dbus/system_bus_socket \
+                 -Dmodular_tests=enabled \
+                 -Dchecks=true \
+                 -Druntime_dir=${runtimedir} \
+                 -Dtest_socket_dir=/tmp \
+                 -Dsession_socket_dir=/tmp \
                 "
-EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
                    user-session \
+                  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                   "
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
 
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
-PACKAGECONFIG[x11] = "--enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
-PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
-PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
-PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsystemd_system_unitdir=${systemd_system_unitdir},-Dsystemd=disabled,systemd"
+PACKAGECONFIG[x11] = "-Dx11_autolaunch=enabled,-Dx11_autolaunch=disabled, virtual/libx11 libsm"
+PACKAGECONFIG[user-session] = "-Duser_session=true -Dsystemd_user_unitdir=${systemd_user_unitdir},-Duser_session=false"
+PACKAGECONFIG[verbose-mode] = "-Dverbose_mode=true,-Dverbose_mode=false,,"
+PACKAGECONFIG[audit] = "-Dlibaudit=enabled,-Dlibaudit=disabled,audit"
+PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
+PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
 DEPENDS = "expat virtual/libintl autoconf-archive-native glib-2.0"
 RDEPENDS:${PN} += "${PN}-common ${PN}-tools"
@@ -124,9 +125,7 @@ pkg_postinst:dbus() {
 }
 
 
-do_install() {
-	autotools_do_install
-
+do_install:append:class-target() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		sed 's:@bindir@:${bindir}:' < ${UNPACKDIR}/dbus-1.init > ${S}/dbus-1.init.sh
@@ -159,27 +158,23 @@ do_install() {
 	# Remove empty testexec directory as we don't build tests
 	rm -rf ${D}${libdir}/dbus-1.0/test
 
-	# Remove /var/run as it is created on startup
-	rm -rf ${D}${localstatedir}/run
+	# Remove /run as it is created on startup
+	rm -rf ${D}${runtimedir}
 }
 
-do_install:class-native() {
-	autotools_do_install
-
+do_install:append:class-native() {
 	# dbus-launch has no X support so lets not install it in case the host
 	# has a more featured and useful version
 	rm -f ${D}${bindir}/dbus-launch
 }
 
-do_install:class-nativesdk() {
-	autotools_do_install
-
+do_install:append:class-nativesdk() {
 	# dbus-launch has no X support so lets not install it in case the host
 	# has a more featured and useful version
 	rm -f ${D}${bindir}/dbus-launch
 
-	# Remove /var/run to avoid QA error
-	rm -rf ${D}${localstatedir}/run
+	# Remove /run to avoid QA error
+	rm -rf ${D}${runtimedir}
 }
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.5


