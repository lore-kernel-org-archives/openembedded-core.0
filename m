Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDDEP-0006H8-KC
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 13:14:01 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so7405145wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2013 03:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=2ulfXiUXZ2bwV1znElJye7gPwMByAfZd29O5TYYWpaw=;
	b=NgEezf7YcJ48sL4wQqGZ8+lQoqc0UK5kPruJGkW3co6AVjNx8b4jgo2576VxTjuOTK
	+JAj4AXuKr7IvV9iLtKk/QCsj11g38VfKIerQM3m2MD4TbZ22R3omtBekQX9C4zepVa1
	IFgbo52LE7+6J+Jj+5dwo+r/fuLjsRV9Xs3j6QudRf4PbSg5lR02zYS+ic7VEznc/pYd
	0/3P/TF3AXbTIukbNdqPUm07LH+tE1aRv+4t6nLVSdCsjOFa7Kd0T6LhjncwqrLJagKR
	cJmCoAEX/EA2340iIu9W1YLpAA/qoA+Fe+Xo0FTWc5vsNYm63SUD0wzzf+o5QpAf13YN
	qDiw==
X-Received: by 10.180.81.164 with SMTP id b4mr25485359wiy.34.1362571051030;
	Wed, 06 Mar 2013 03:57:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm16985826wib.3.2013.03.06.03.57.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 03:57:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2013 11:55:01 +0000
Message-Id: <1362570902-18671-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkoQM47K6j2VZlaBaOVVd5A27NZAbQygp984Rtphmk9J8MalPoGtAx7bfwEmR9uyPJySXYx
Subject: [PATCH 1/2] pulseaudio: rationalise existing configuration using PACKAGECONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 12:14:04 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2506e41..37621e0 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
-DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
-           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
+DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 dbus gconf \
-           ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4 sbc', '', d)}"
+DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch \
@@ -25,9 +23,7 @@ USE_NLS = "yes"
 
 EXTRA_OECONF = "\
 		--disable-lynx \
-		${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluez', '--disable-bluez', d)} \
 		--disable-polkit \
-		${@base_contains('DISTRO_FEATURES', 'x11', '--enable-x11', '--disable-x11 --disable-gtk2', d)} \
 		--without-jack \
 		--with-glib \
 		--with-alsa \
@@ -44,6 +40,12 @@ EXTRA_OECONF = "\
                 ac_cv_header_valgrind_memcheck_h=no \
 "
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk x11', '', d)}"
+PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
+PACKAGECONFIG[gtk] = "--enable-gtk2,--disable-gtk2,gtk+"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
+
 EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "--enable-neon-opt=no", d)}"
 
 PARALLEL_MAKE = ""
-- 
1.7.10.4



