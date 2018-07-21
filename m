Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3A33878B0D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:27:29 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id f6-v6so6458149plo.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F2XLTFfq0gVslWe/7Q5V0zHo60YcKXd5yVgZMG08MGU=;
	b=ok+AqNmauw/VqR1ZPnmvpZn2QJdUKb1o+f2HXPI8UxAIS8ni1k0Eor1no2gGvTtLfa
	RxR2RZh86IwGY2z5f2ipRUFLMfLkmrujYk8gbhH+cnSn9N7tKD7RQvr32bs3wCvdSskd
	tJgoKtCrJl2VacgmT7aFf5+ypO4QzY/PDXWZ2s35O7aj/7k9wF0km24ZPeYlCr/rIpmA
	Pj2MgDL1i97xvf5dA2sZ3Q4W+h8/OfSfbJ9F4QazszwUqYewqqMMtd7QSEkD2uM3YWdz
	O39wYVstlTWEO6EuzwD0kJ1ohtGD9h7vGJhLMpdvE8qqsfgI+2QR0DC73fQ7o4j5QFg/
	QnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F2XLTFfq0gVslWe/7Q5V0zHo60YcKXd5yVgZMG08MGU=;
	b=ZfJqGgkyF2PUPhM/+KgaLUTqcHYA36m+Db1K8oK+4ub6Vhg6ZAgrIVtXNCY3FTKYYX
	a+QEpoZUy+8fKmKz32iHKT1P2BF1mcmSkgwAyKtHv+ml1sLSNRp8D3KTXzIOwCMKTRbH
	9JnK+LoveilNRZt5RZUv+9e0UZxhVTIjhojurIqVtvxaS+YQvCnMLAMPXD2YtP1lqmHm
	lJnDVas046svFPUTC80EanfrXBESh7p0+7jpxJc6A0e2Yahzd1iHbE/MeMLPV4N0Je9y
	ebAe3m2S/z7hSMqrYCGt3r58HoJC0KStq8A3cS4dGbYDSIPwbeur8g7GIwmYamx9rDIr
	VmOw==
X-Gm-Message-State: AOUpUlGtvUzG+h7Jps8IOgNi9XtOykspDdZXMWF6NhwP1UZVaFBx7+0T
	BmmLrxoOqFGWRs6t4OABM6xVS1r7
X-Google-Smtp-Source: AAOMgpdnfDlC67KlUqbgPZNS75j/a0wZSSWYKCQrGnL7t404VuhqBB2ocbxmz7PPJxDym2aGxqf6bA==
X-Received: by 2002:a17:902:b58b:: with SMTP id
	a11-v6mr5413057pls.34.1532190450036; 
	Sat, 21 Jul 2018 09:27:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm14485231pfb.167.2018.07.21.09.27.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 09:27:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 09:27:13 -0700
Message-Id: <20180721162715.12611-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180721162715.12611-1-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
Subject: [PATCH 5/7] gstreamer1.0-plugins-bad: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Sat, 21 Jul 2018 16:27:29 -0000

Fixes

| make[3]: *** No rule to make target 'viewporter-protocol.c', needed by 'all'.  Stop.
| make[3]: Leaving directory '/home/jenkins/oe/world/oe-build/build/tmpfs/work/armv5e-bec-linux-gnueabi/gstreamer1.0-plugins-bad/1.14.1-r0/build/ext/wayland'
| Makefile:1288: recipe for target 'wayland' failed
| make[2]: *** [wayland] Error 2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 31 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.14.1.bb        | 20 ++++++------
 2 files changed, 42 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
new file mode 100644
index 0000000000..5c14a70cec
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
@@ -0,0 +1,31 @@
+From bfa34a3fa9b426f28163e9ba0539180b021d81f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Jul 2018 23:24:05 -0700
+Subject: [PATCH] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+
+This allows to override the wayland-protocols pkgdatadir with the
+WAYLAND_PROTOCOLS_DATADIR from environment.
+
+pkgconfig would return an absolute path in /usr/share/wayland-protocols
+for the pkgdatadir value, which is not suitable for cross-compiling.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 79cfda4..b75c082 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1333,7 +1333,8 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [
+   PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.4.0 libdrm >= 2.4.55 wayland-protocols >= 1.4, [
+     if test "x$wayland_scanner" != "x"; then
+       HAVE_WAYLAND="yes"
+-      AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
++      PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
++      AC_SUBST(WAYLAND_PROTOCOLS_DATADIR)
+     else
+       AC_MSG_RESULT([wayland-scanner is required to build the wayland plugin])
+       HAVE_WAYLAND="no"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
index 0e477e5a9c..b4fb672b46 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
@@ -1,14 +1,14 @@
 require gstreamer1.0-plugins.inc
 
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
-    file://configure-allow-to-disable-libssh2.patch \
-    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
-    file://avoid-including-sys-poll.h-directly.patch \
-    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
-"
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+           file://configure-allow-to-disable-libssh2.patch \
+           file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
+           file://avoid-including-sys-poll.h-directly.patch \
+           file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+           file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
+           file://0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           "
 SRC_URI[md5sum] = "c2f963501fc6afc084c418894425dcfd"
 SRC_URI[sha256sum] = "2a77c6908032aafdf2cd2e5823fec948f16a25c2d1497a953828d762dc20d61a"
 
@@ -127,6 +127,8 @@ EXTRA_OECONF += " \
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
 
+EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
+
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-- 
2.18.0


