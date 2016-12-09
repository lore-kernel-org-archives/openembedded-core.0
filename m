Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B0E6971C7A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:07 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so666270pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t2B4x6g6ZppT7jRGgeQ7Q/r6c4LR3BXAdgjU4sKflk4=;
	b=LkRrViRgsy0XJ7Qj6twIdN04e2AnETaFFZ93p7FVlFPK+5Dlq4e7ZiTcnuOaSDAXDs
	C3+B+376gbi8mQRtRJzh/zJmMxqiEolLs9UsUjx7sQottO/PNoQUVMoKNBSUtmsTKqLj
	q72ylmq7gj30jeQYEmsC72OBGGOfSM7TIXxBC1y3w+fCjyPwFwGYvUb2Rm9+Gky9pJXF
	MtxYXVkSfTz763WvGCYPcCkXv0T16tV2M2MjvYjt04b2HVGySMPBzMIIq03Qr9kNmWgY
	6zj4CV15CzJ/4iMYzo1ufTTq1Hvu6NwjkvZMuiNBZuxyb7Zg3JN1n/+8s53BBFV2+x9M
	eN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t2B4x6g6ZppT7jRGgeQ7Q/r6c4LR3BXAdgjU4sKflk4=;
	b=CblyFdS4sGqxc36G8vRb9ULk6uNlti9P1bBJ+C0KWMLQnDDeoNMK7cPntr0BbHKjif
	mnNxpAYjpD4bAhibt/5BuzaIqANkasUV5uy2AZ9FT1zTYKxMwffhDByVuo7Ygx6Ytgmy
	y4Oayre1g5ieOV7yjmUewLufj6N/iRO1Y+gljONXzdHRggBK9VIsu/s4m27PnXkJFgP1
	dLmLaHuMAJPPCwqX1lbDIh68OFraLg1lXuwEtIdw+vgvdNnBJUawzTpQTtxk0reb0vCo
	/AuMDS6FawxqIJHimU2lpJO1SF/j1d1XQBm1E9A+VQWK+yll1s94YKcjCvIx/RD5gwjG
	fJpg==
X-Gm-Message-State: AKaTC00F2ydLlfJn9rKuXNdY+IfWi2fWcZAFJA9I7dHI8AkSKV6GOcYNSLtFNx3wCjvnVA==
X-Received: by 10.98.35.211 with SMTP id q80mr79232342pfj.26.1481252289364;
	Thu, 08 Dec 2016 18:58:09 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:57:56 -0800
Message-Id: <20161209025801.20775-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209025801.20775-1-raj.khem@gmail.com>
References: <20161209025801.20775-1-raj.khem@gmail.com>
Subject: [PATCH 3/8] gstreamer1.0-plugins-bad: Define and use WAYLAND_PROTOCOLS_SYSROOT_DIR for output of pkg-config
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:08 -0000

When configure pokes for wayland-protocols isntallations it ended up
using the ones from host, which is because it did not account for sysroot
prefix

Remove MACHINE from variable reference tracking to avoid unnessary rebuilds for different machine
with same arch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 34 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb   |  4 +++
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d26a6a9..d3c5326 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -64,7 +64,7 @@ PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
-PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland"
+PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
new file mode 100644
index 0000000..86a4495
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
@@ -0,0 +1,34 @@
+From c271503d7e233428ac0323c51d6517113e26bef7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Dec 2016 00:27:13 -0800
+Subject: [PATCH] Prepend PKG_CONFIG_SYSROOT_DIR to pkg-config output
+
+In cross environment we have to prepend the sysroot to the path found by
+pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
+it ends up using the files from host system. If build host has wayland installed
+the build will succeed but if you dont have wayland-protocols installed on build host then
+it wont find the files on build host
+
+This should work ok with non sysrooted builds too since in those cases PKG_CONFIG_SYSROOT_DIR
+will be empty
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: gst-plugins-bad-1.10.1/configure.ac
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/configure.ac
++++ gst-plugins-bad-1.10.1/configure.ac
+@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland s
+     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >= 1.4, [
+       if test "x$wayland_scanner" != "x"; then
+         HAVE_WAYLAND="yes"
+-        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
++        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
+       else
+         AC_MSG_RESULT([wayland-scanner is required to build the wayland plugin])
+         HAVE_WAYLAND="no"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
index 9cd892e..46df026 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
@@ -14,8 +14,12 @@ SRC_URI = " \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+    file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
 "
 SRC_URI[md5sum] = "491d2d5aab55ffc60c66e714d3d664ea"
 SRC_URI[sha256sum] = "133e0ed9fe21011b15d3898e3d3a9d17ab74eed31996da2e353353e688ca921d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
+
+EXTRA_OECONF += "WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}"
+EXTRA_OECONF[vardepsexclude] = "MACHINE"
-- 
2.10.2


