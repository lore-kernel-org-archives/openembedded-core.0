Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id EF4486AFF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:03:59 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id eh20so1546575obb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 18:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yaUAHBPz1DsrD9VW7K1kBkptJl82zjKKFgRm2uofwEU=;
	b=gqKR+hKNpalU/xnY0fGDBRvEP4KFbz/a1Wu52H0LUP2jIpwI9By9MG4+kXY54zwQvw
	4FNwakXnlnpGGcutdgXr+mHCz4ryg7gf00O9ohva3Ndwq+W5kLyCfXDOloKbozM/fRSN
	B+AHIhGTw5yOlFaGhvaNAckmZ6+YKixYXeTu9fW6ngdCffnQmKIXNAyCtOXNp1fC+bGR
	ajlr918B92ggYWhwl7NAWlbbuoOaux/v2gwMZTovCIflTAF258kjp5S/OI/5LVL+kqKS
	joi+Bsxvnnb7o05tkOc5siME+scuS+M4Ffqy7+6hsV7DiSaFoLpYZQucFF46mZCKeF9E
	132Q==
X-Received: by 10.60.117.233 with SMTP id kh9mr5468535oeb.58.1374023040286;
	Tue, 16 Jul 2013 18:04:00 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id qa4sm4084548oeb.5.2013.07.16.18.03.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 18:03:59 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 18:03:47 -0700
Message-Id: <1374023028-25980-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkEbk2r7ypUyNGKxwIFZ8+MahU1TsjkLNWjiq0HPoIQi4kfu3K+AFcxewTwpEL3wr7CLYYR
Subject: [PATCH 1/2] pulseaudio: Removed avahi forced dependency
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
X-List-Received-Date: Wed, 17 Jul 2013 01:04:00 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Only adds avahi dependency when zeroconf is in DISTRO_FEATURES.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index f925e7d..dd65f65 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
-DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool"
+DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 dbus gconf consolekit"
 
@@ -43,10 +43,12 @@ EXTRA_OECONF = "\
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk x11', '', d)}"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
 PACKAGECONFIG[gtk] = "--enable-gtk2,--disable-gtk2,gtk+"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 
 EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "--enable-neon-opt=no", d)}"
-- 
1.8.1.4


