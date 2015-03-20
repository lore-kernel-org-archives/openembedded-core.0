Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C36726013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 18:32:10 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so99281356iec.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 11:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QFQxCEcHyxJm8odjX+gdoWJubkmsQ54VNocE5hBEdn8=;
	b=DXOeHZtAFvp+vSVn+VfP8Z8wmJE+9dgvI1PYGVkKs1DWz5TmH8BQXoNYI3TMh7AcCc
	ongVp+qppJ2rtP43NBdqjI2VAI9xTnRbKTRvVMAE10IUXKGDo9p6wOpfMaVN6JkiFin0
	ErDFGgEW8yZQcCYjFl7diyZxYTaAfMon6PrZ7GU2gBgBmTHmXJDtSJByV+ab5M6wqA8Q
	ak8B8nmo6D3FtdyVI5vEnQvbo5w1K5CNNhaPRaSIbYK8ekHtUCHb/cUkdLfFW96MTLEW
	4WWzz7uPa54DWmJymsIj8kkTBq3NWjlAZmZ47DfaG6Qne/fD+nRgzkgurPU2ASSfv4mn
	0ObA==
X-Received: by 10.50.66.141 with SMTP id f13mr7549934igt.9.1426876331144;
	Fri, 20 Mar 2015 11:32:11 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id m5sm32190ige.5.2015.03.20.11.32.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Mar 2015 11:32:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 11:32:01 -0700
Message-Id: <1426876321-19141-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] directfb: retire directfb.inc
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
X-List-Received-Date: Fri, 20 Mar 2015 18:32:12 -0000

Splitting the DirectFB recipe into .bb and .inc hinders maintenance
and the addition of new features such as class-native support.

Remove directfb.inc and merge everything into directfb_1.7.6.bb.

No functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc      | 76 ------------------------
 meta/recipes-graphics/directfb/directfb_1.7.6.bb | 75 ++++++++++++++++++++---
 2 files changed, 68 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb.inc

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
deleted file mode 100644
index 669c0ff..0000000
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY = "Graphics abstraction library for the Linux Framebuffer Device"
-DESCRIPTION = "DirectFB is a thin library that provides developers \
-with hardware graphics acceleration, input device handling and \
-abstraction, an integrated windowing system with support for \
-translucent windows and multiple display layers on top of the \
-Linux framebuffer device."
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
-
-HOMEPAGE = "http://directfb.org"
-DEPENDS = "jpeg libpng freetype zlib tslib"
-
-SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz \
-           file://configurefix.patch \
-           file://fusion.patch"
-
-S = "${WORKDIR}/DirectFB-${PV}"
-
-LDFLAGS_append =" -lts -lm"
-
-BINCONFIG = "${bindir}/directfb-config"
-
-inherit autotools binconfig-disabled pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
-PACKAGECONFIG[drmkms] = "--enable-drmkms,--disable-drmkms,libdrm"
-PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
-PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
-
-EXTRA_OECONF = "\
-  --with-gfxdrivers=none \
-  --enable-libmpeg3=no \
-  --enable-freetype=yes \
-  --enable-sdl=no \
-  --enable-vnc=no \
-  --disable-x11 \
-  --disable-mesa \
-"
-
-#Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS as default
-#this will cause directfb build failure on x86 arch, so filter out it.
-TARGET_CFLAGS_x86 := "${@oe_filter_out('-fno-omit-frame-pointer', '${TARGET_CFLAGS}', d)}"
-
-#PACKAGES_DYNAMIC += "^directfb-inputdrivers-.*"
-#
-#python populate_packages_prepend () {
-#    inputdrivers_libdir = d.expand('${libdir}/directfb-${RV}/inputdrivers')
-#    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-inputdrivers-%s', 'Directfb plugin for %s')
-#}
-
-# NOTE: monolithic packaging for now, should improve that eventually
-
-
-
-FILES_${PN}-dbg += "\
-  ${libdir}/directfb-${RV}/*/*/.debug/*.so \
-  ${libdir}/directfb-${RV}/*/.debug/*.so \
-"
-
-FILES_${PN}-dev += "\
-  ${bindir}/directfb-config \
-  ${libdir}/directfb-${RV}/systems/*.la \
-  ${libdir}/directfb-${RV}/inputdrivers/*.la \
-  ${libdir}/directfb-${RV}/interfaces/*/*.la \
-  ${libdir}/directfb-${RV}/wm/*.la \
-"
-
-FILES_${PN} += "\
-  ${libdir}/directfb-${RV}/systems/*.so \
-  ${libdir}/directfb-${RV}/inputdrivers/*.so \
-  ${libdir}/directfb-${RV}/interfaces/*/*.so \
-  ${libdir}/directfb-${RV}/wm/*.so \
-  ${datadir}/directfb-${PV} \
-"
diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
index d25d987..53451e3 100644
--- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
@@ -1,21 +1,82 @@
-require directfb.inc
+SUMMARY = "Graphics abstraction library for the Linux Framebuffer Device"
+DESCRIPTION = "DirectFB is a thin library that provides developers \
+with hardware graphics acceleration, input device handling and \
+abstraction, an integrated windowing system with support for \
+translucent windows and multiple display layers on top of the \
+Linux framebuffer device."
+HOMEPAGE = "http://directfb.org"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
+
+DEPENDS = "jpeg libpng freetype zlib tslib sysfsutils"
 
 RV = "1.7-6"
 
-DEPENDS += "sysfsutils"
+SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz \
+           file://configurefix.patch \
+           file://fusion.patch"
+
+SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
+SRC_URI[sha256sum] = "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
+
+S = "${WORKDIR}/DirectFB-${PV}"
+
+LDFLAGS_append =" -lts -lm"
+
+BINCONFIG = "${bindir}/directfb-config"
+
+inherit autotools binconfig-disabled pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
+PACKAGECONFIG[drmkms] = "--enable-drmkms,--disable-drmkms,libdrm"
+PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
+PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 
 EXTRA_OECONF = "\
+  --with-gfxdrivers=none \
   --enable-freetype=yes \
   --enable-zlib \
-  --with-gfxdrivers=none \
+  --disable-imlib2 \
+  --disable-mesa \
   --disable-sdl \
   --disable-vnc \
   --disable-x11 \
-  --disable-imlib2 \
-  --disable-mesa \
 "
 
 LEAD_SONAME = "libdirectfb-1.7.so.0"
 
-SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
-SRC_URI[sha256sum] = "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
+#Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS as default
+#this will cause directfb build failure on x86 arch, so filter out it.
+TARGET_CFLAGS_x86 := "${@oe_filter_out('-fno-omit-frame-pointer', '${TARGET_CFLAGS}', d)}"
+
+#PACKAGES_DYNAMIC += "^directfb-inputdrivers-.*"
+#
+#python populate_packages_prepend () {
+#    inputdrivers_libdir = d.expand('${libdir}/directfb-${RV}/inputdrivers')
+#    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-inputdrivers-%s', 'Directfb plugin for %s')
+#}
+
+# NOTE: monolithic packaging for now, should improve that eventually
+
+FILES_${PN}-dbg += "\
+  ${libdir}/directfb-${RV}/*/*/.debug/*.so \
+  ${libdir}/directfb-${RV}/*/.debug/*.so \
+"
+
+FILES_${PN}-dev += "\
+  ${bindir}/directfb-config \
+  ${libdir}/directfb-${RV}/systems/*.la \
+  ${libdir}/directfb-${RV}/inputdrivers/*.la \
+  ${libdir}/directfb-${RV}/interfaces/*/*.la \
+  ${libdir}/directfb-${RV}/wm/*.la \
+"
+
+FILES_${PN} += "\
+  ${libdir}/directfb-${RV}/systems/*.so \
+  ${libdir}/directfb-${RV}/inputdrivers/*.so \
+  ${libdir}/directfb-${RV}/interfaces/*/*.so \
+  ${libdir}/directfb-${RV}/wm/*.so \
+  ${datadir}/directfb-${PV} \
+"
-- 
1.9.1


