Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 86CAB75D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:26:48 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so84608988wgj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 03:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=D759tekleCcO9WIEN9cXcQRdNr00fOiXwRTY0Sid+ao=;
	b=KZocX9JqTsNHUCQxt5JKe2Wg90ZR+M6DSE7FjaXVhzCHUS5mjqqrt1rCFI6fEkaKoX
	OsyzdAtoE2VIs4QSyXgzNXEWkJidfg2ZAlYm8W2BNhxBQ86k3T4e75UFIr/WT7yW4f7a
	BAUfUwbhtGuT8EtH+aSGTvBnhWdmtF+I4CyjwDf6hKS1NsGIM119oALmJTYmYHsPevby
	yZ9Cm6YOvkSBx4cITLmpGSzDyCJe5bLyKSN8lbBgFOv4CkD4cr7QR8szJ//Vycnn+lfc
	Rx7bkL5euV0nmHX9yYsbJOnZwfQvJrUc7qFLy2836IzHnm1uAf9vFnmJdPWXKUSWQ3OP
	g3YA==
X-Gm-Message-State: ALoCoQmrtB3Ya27sRvA+Bs6uRBQ/fQtX4xVbxvTynXTfcwcbz4dQbhjJKM+FsEC+2KgsNl1Vbovn
X-Received: by 10.194.93.226 with SMTP id cx2mr19428739wjb.28.1435919208990;
	Fri, 03 Jul 2015 03:26:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	ul1sm12672153wjc.30.2015.07.03.03.26.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Jul 2015 03:26:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jul 2015 11:21:25 +0100
Message-Id: <1435918885-12200-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libdrm: remove git recipe, merge inc
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
X-List-Received-Date: Fri, 03 Jul 2015 10:26:49 -0000

The git recipe hasn't been touched since 2012 and is out of date, so simplify
the recipe by removing the git form and merging the remaining bb and inc file.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc       | 41 ------------------------------
 meta/recipes-graphics/drm/libdrm_2.4.59.bb | 41 +++++++++++++++++++++++++++---
 meta/recipes-graphics/drm/libdrm_git.bb    | 12 ---------
 3 files changed, 38 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm.inc
 delete mode 100644 meta/recipes-graphics/drm/libdrm_git.bb

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
deleted file mode 100644
index d3e1e92..0000000
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Userspace interface to the kernel DRM services"
-DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
-stands for \"Direct Rendering Manager\", which is the kernel portion of the \
-\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
-accelerated OpenGL drivers."
-HOMEPAGE = "http://dri.freedesktop.org"
-SECTION = "x11/base"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
-SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
-PROVIDES = "drm"
-DEPENDS = "libpthread-stubs udev"
-
-# be aware that libdrm_2.4.44.bb ignores this
-INC_PR = "r4"
-
-#libpciaccess is required starting from libdrm 2.4.26
-DEPENDS += " libpciaccess"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--disable-cairo-tests \
-                 --enable-omap-experimental-api \
-                 --enable-install-test-programs \
-                 --disable-manpages \
-                "
-ALLOW_EMPTY_${PN}-drivers = "1"
-PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
-
-RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
-                             ${PN}-exynos ${PN}-freedreno"
-
-FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
-FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
-FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
-FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
-FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
-FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
-FILES_${PN}-kms = "${libdir}/libkms*.so.*"
-FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.59.bb b/meta/recipes-graphics/drm/libdrm_2.4.59.bb
index 14bf44a..97f75ff 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.59.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.59.bb
@@ -1,6 +1,41 @@
-require libdrm.inc
-
-SRC_URI += "file://installtests.patch "
+SUMMARY = "Userspace interface to the kernel DRM services"
+DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
+stands for \"Direct Rendering Manager\", which is the kernel portion of the \
+\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
+accelerated OpenGL drivers."
+HOMEPAGE = "http://dri.freedesktop.org"
+SECTION = "x11/base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
+PROVIDES = "drm"
+DEPENDS = "libpthread-stubs udev libpciaccess"
 
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
+           file://installtests.patch "
 SRC_URI[md5sum] = "d32a1d37c2546ee11fc5924abeedb23e"
 SRC_URI[sha256sum] = "68d26e1fd85582f4243d66864f9b43ca4ee93662825de32b5506fc8e181ea41b"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-cairo-tests \
+                 --enable-omap-experimental-api \
+                 --enable-install-test-programs \
+                 --disable-manpages \
+                "
+
+ALLOW_EMPTY_${PN}-drivers = "1"
+PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
+             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
+
+RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
+                             ${PN}-exynos ${PN}-freedreno"
+
+FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
+FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
+FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
+FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
+FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
+FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
+FILES_${PN}-kms = "${libdir}/libkms*.so.*"
+FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
+
diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
deleted file mode 100644
index d7245ee..0000000
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require libdrm.inc
-
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/drm"
-
-S = "${WORKDIR}/git"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "e01d68f9f3acfc35fe164283904b5d058c2ab378"
-PV = "2.4.40+git${SRCPV}"
-PR = "${INC_PR}.0"
-
-- 
2.1.4


