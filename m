Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3703772598
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:18:41 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so3664849wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NdiuX3gbgdfYZr/KK57WYyqnEBcR5bbo+Y2m5p8xT0g=;
	b=T3skMZVf3gUY3D8rYdgeanYPB4eyrhL+ByyMMSERBiZ/DnOKeb93dW+dBJBdSy5mcx
	pP1nQB5AHTo1KNTBFdsFaaMGPsy2M986Lo1UD731VQOzt+fiYZ8mFphziwEgvE0rwWH+
	PEIm1UxqZ/frzhEjLS2t4qCkT6XahAUv63OTWK94SSJSM3WQxMTKimTKHZRUE3KI8dvL
	3M5hzAXWL4y17JyNiDIwoou4c8RO9q10mDJC9aD5BJeh6zGY+rTkBHSpIAKbwKaIJRxG
	zw0PYIqUWaDCClp1KBIAJ+eEEgsOBZupXSmfbtIld43vMvmnwMRQdzPpqRSRQcRP3qwp
	Nh5Q==
X-Received: by 10.194.86.165 with SMTP id q5mr7415586wjz.10.1418221122173;
	Wed, 10 Dec 2014 06:18:42 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id n8sm6063851wjx.0.2014.12.10.06.18.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:18:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:18:35 +0100
Message-Id: <1418221117-12710-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Dec 2014 14:18:42 -0000

* it's not complete, but recipes depending on virtual/libx11 are easiest
  to spot, I've long list of PNBLACKLIST for all recipes which cannot
  be built in distro without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb                     | 4 ++++
 meta/recipes-graphics/fstests/fstests_git.bb                         | 5 ++++-
 meta/recipes-graphics/glew/glew_1.11.0.bb                            | 4 +++-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                | 5 ++++-
 .../recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb | 5 ++++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb                 | 5 ++++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                 | 5 ++++-
 meta/recipes-graphics/piglit/piglit_git.bb                           | 5 ++++-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                   | 4 ++++
 .../startup-notification/startup-notification_0.12.bb                | 5 ++++-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                        | 5 ++++-
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb     | 5 ++++-
 12 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
index 18fc893..3427fdf 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
@@ -5,4 +5,8 @@ include eglinfo.inc
 
 DEPENDS += "virtual/libx11"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SUMMARY += "(X11 version)"
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 57ff9f6..5da7986 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -4,6 +4,9 @@ SECTION = "devel"
 LICENSE = "Zlib"
 DEPENDS = "pango libxext libxft virtual/libx11 gtk+"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRCREV = "e5939ff608b95cdd4d0ab0e1935781ab9a276ac0"
 PV = "0.1+git${SRCPV}"
 
@@ -13,4 +16,4 @@ LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac
 
 S = "${WORKDIR}/git/tests"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
diff --git a/meta/recipes-graphics/glew/glew_1.11.0.bb b/meta/recipes-graphics/glew/glew_1.11.0.bb
index 4231320..22bc4da 100644
--- a/meta/recipes-graphics/glew/glew_1.11.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.11.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
@@ -18,4 +20,4 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
 SRC_URI[md5sum] = "f6d72c7426a5f66580ad09e50816450a"
 SRC_URI[sha256sum] = "69bbce306ac281c4fa806a7a7d02c0596281a2d8f9d70690e98126f23ba513d6"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package pkgconfig distro_features_check
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
index 4acac39..f688b4e 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -10,13 +10,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.bz2 \
            file://libpng.patch"
 
 SRC_URI[md5sum] = "fc6cc807f55a3e7c752d8013176875d7"
 SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534217b53"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 PACKAGECONFIG ??= "jpeg png xft xsettings"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
index d7a8030..764eb95 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
 DEPENDS = "virtual/libx11"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 PR = "r5"
 
 headers = "xsettings-common.h xsettings-client.h"
@@ -28,7 +31,7 @@ SRC_URI[sha256sum] = "f274a4bc969ae192994a856b7f786c6fce96bae77f96c1c2b71dd97599
 
 S = "${WORKDIR}/Xsettings-client-0.10"
 
-inherit autotools gettext
+inherit autotools gettext distro_features_check
 
 do_configure_prepend() {
     # This package doesn't ship with its own COPYING file and
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index 8ee42c3..662f85b 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -4,6 +4,9 @@ LICENSE = "GPLv2.0+"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxcursor xdamage libxrender startup-notification expat"
 PR = "r5"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/${PV}/matchbox-window-manager-${PV}.tar.bz2 \
            file://configure_fix.patch \
            file://kbdconfig \
@@ -14,7 +17,7 @@ SRC_URI[sha256sum] = "81a23a4af797cf350759fd5ac738797015a66dd5dba2f3d9f3c6908506
 
 S = "${WORKDIR}/matchbox-window-manager-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} = "${bindir}/* \
 	       ${datadir}/matchbox \
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 154b967..5512d7e 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
 PV = "1.2+git${SRCPV}"
 
@@ -18,7 +21,7 @@ SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} = "${bindir}/* \
                ${datadir}/matchbox \
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index f468120..83c1e18 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,10 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "virtual/libx11 libxrender waffle virtual/libgl libglu python-mako-native python-numpy-native"
 
-inherit cmake pythonnative
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+inherit cmake pythonnative distro_features_check
 
 # As piglit doesn't install, enforce in-tree builds so that we can easily copy
 # contents out of $S and $B.
diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index fe886f5..0e1a792 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -2,6 +2,10 @@ SUMMARY = "A clock combined with a game of pong"
 LICENSE = "GPLv2+"
 DEPENDS = "virtual/libx11 xdmcp xau"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "file://pong-clock-no-flicker.c"
 
 LIC_FILES_CHKSUM = "file://pong-clock-no-flicker.c;beginline=1;endline=23;md5=dd248d50f73f746d1ee78586b0b2ebd3"
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index 363bdcd..a9e89f6 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -17,7 +17,10 @@ SECTION = "libs"
 
 DEPENDS = "virtual/libx11 libsm xcb-util"
 
-inherit autotools pkgconfig
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+inherit autotools pkgconfig distro_features_check
 
 SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 3d98172..3178239 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -16,7 +16,10 @@ SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a
 
 DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
 
-inherit autotools-brokensep
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+inherit autotools-brokensep distro_features_check
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 562434f..d1fe215 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -4,10 +4,13 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
 DEPENDS = "virtual/libx11 libxi"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 PV = "0.7.5+git${SRCPV}"
 PR = "r6"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
-- 
2.1.3


