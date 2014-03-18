Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id D48526F924
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 17:03:24 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id kl14so7588607pab.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ByDNKDIPmDfSQmcH1RY12F/xjkTHiV5jMrt2hQJZVuk=;
	b=i6pWXmcY6i9pCso3kHBS73F2N/Y2zj3yct32sgBar/ZkP1whREbIPV7rZQr+z0UhOj
	hPjGYcSY/ExAkLexRlbMpYA7dKHzmi0bCwTCzEh3k4mwV6Lg/wJvtUQeB0qHnWMLsdDn
	dMQXU9F6eNN456PknqajsweeVAe4sHG5hz0Ibgaa9mpWnE8aPHQgOtimhOWT7mbuTKKw
	2ns2D89ASWisGSumt4sAwDDw3drZNrHbudOCwfv9Hx52N6RQ7SM7E3CKA6dS0dr4ekuF
	MLqAKCxOAy/rZkPhC1Ze4d2w0Oyc1shdQV0wljbnpnUAFPUVXCSVwE03x+9GvaPxdcim
	JeSA==
X-Received: by 10.66.66.66 with SMTP id d2mr34632176pat.80.1395162205722;
	Tue, 18 Mar 2014 10:03:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	i10sm90429182pat.36.2014.03.18.10.03.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Mar 2014 10:03:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 10:04:44 -0700
Message-Id: <1395162284-27934-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH V2] pulseaudio: Upgrade 4.0 -> 5.0
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
X-List-Received-Date: Tue, 18 Mar 2014 17:03:25 -0000

bluetooth-proximity has been removed in 5.0

pulseaudio now differentiates between bluez4 and bluez5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |  7 +++----
 meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb | 12 ------------
 meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb | 11 +++++++++++
 3 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 103f72e..2176731 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -5,7 +5,6 @@ SECTION = "libs/multimedia"
 LICENSE = "GPLv2+ & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
 
 DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
@@ -32,11 +31,12 @@ EXTRA_OECONF = "\
                 ac_cv_header_valgrind_memcheck_h=no \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
+PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
+PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
 PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
@@ -145,7 +145,6 @@ RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
 FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
-FILES_pulseaudio-module-bluetooth-proximity += "${libexecdir}/pulse/proximity-helper"
 FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
 
 RDEPENDS_pulseaudio-server += "\
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
deleted file mode 100644
index b419c54..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require pulseaudio.inc
-
-SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
-           file://volatiles.04_pulse"
-
-SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
-SRC_URI[sha256sum] = "35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae"
-
-do_compile_prepend() {
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
new file mode 100644
index 0000000..f02359a
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
@@ -0,0 +1,11 @@
+require pulseaudio.inc
+
+SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
+           file://volatiles.04_pulse"
+SRC_URI[md5sum] = "c43749838612f4860465e83ed62ca38e"
+SRC_URI[sha256sum] = "99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939"
+
+do_compile_prepend() {
+    mkdir -p ${S}/libltdl
+    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
+}
-- 
1.9.0


