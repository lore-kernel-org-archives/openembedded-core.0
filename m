Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D28566067C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 08:37:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 144so11579505pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/lppWIzhssZHhb465Um/F4av0JQD44JWvwmMVBZuZwg=;
	b=jPVrwA3ASml58eciCLXk81oxaew8IhXfKAXSricbYD+DRbY9K3GZuG4fu0Cmz3RZer
	p0MuqzzHKHpzpt50+NBUYF5E23dUVyUQq+TVG4SGC+SwNQ1Lz/KBF1EwrAKidfu+AFrr
	G/lTiKXYm0IqxgLqofOscjncDOySxROFj5lknZRWeV0DaO58YhmLAE6Qtf7sm7vCIs0O
	/9liZUIAXf9/OOf7O/i0PcnkQ7wCmEqcgSNSUvRmsrnEdUBoURc5PQjcc27aBH7vpyN/
	+NmrqmuDhy16RbPkBpSEo1fqGnrtzCDb4zjXxgN3Pyuva7Fr3mp+GeTiwXcZ9EdjrSMM
	KZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/lppWIzhssZHhb465Um/F4av0JQD44JWvwmMVBZuZwg=;
	b=YAgt8KZv0hPnRQ0AynwrtVITLGp+wfZ6FDsINCXSKLni0dObzHD3FyKQWMhmAxJK5a
	eANVEK6HptXXYUaepqanAyAzZl7dIeno3KKubLJAUn6hbl2twoeDxceIIk5DK+lDjMZ9
	WrPK0i6aRvWVoMLYKL000dFe9QOBHVfBnAXoPLA6Y3/Sinsrg5wI1IDqDZbWyEZC5FNA
	pCkbrUS3JRJXiVlO8qnNIZJ5evMGAIS0fZ278bb2AB7I3hU3DS2Svb0sgNyF/4hnfB3g
	z3PCLxFQ0ZcAWqlDQoNQoWDOm48IiXH0KmizUXHTlVyEfv7CSaCrTOnDQLzm90mFm+cM
	xW8Q==
X-Gm-Message-State: AKaTC03GQ1BAow86yg1/x20YSyovtMXXoxatfF79+DyvIJPVnLdqihDoeN/aBUwJ+QSuIg==
X-Received: by 10.99.149.22 with SMTP id p22mr67817684pgd.21.1480581452828;
	Thu, 01 Dec 2016 00:37:32 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o126sm90643578pga.34.2016.12.01.00.37.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Dec 2016 00:37:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:37:26 -0800
Message-Id: <20161201083726.6160-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] gstreamer1.0-plugins-bad: Add PKG_CONFIG_SYSROOT_DIR to output of pkg-config
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
X-List-Received-Date: Thu, 01 Dec 2016 08:37:32 -0000

When configure pokes for wayland-protocols isntallations it ended up
using the ones from host, which is because it did not account for sysroot
prefix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 +-
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch | 37 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb   |  1 +
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
index 0000000..eb789df
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
@@ -0,0 +1,37 @@
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
+diff --git a/configure.ac b/configure.ac
+index f8ac96b..dc87b08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2233,7 +2233,7 @@ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [
+     PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, wayland-protocols >= 1.4, [
+       if test "x$wayland_scanner" != "x"; then
+         HAVE_WAYLAND="yes"
+-        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
++        AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
+       else
+         AC_MSG_RESULT([wayland-scanner is required to build the wayland plugin])
+         HAVE_WAYLAND="no"
+-- 
+2.10.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
index 9cd892e..6c6f011 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+    file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
 "
 SRC_URI[md5sum] = "491d2d5aab55ffc60c66e714d3d664ea"
 SRC_URI[sha256sum] = "133e0ed9fe21011b15d3898e3d3a9d17ab74eed31996da2e353353e688ca921d"
-- 
2.10.2


