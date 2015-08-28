Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE5D76A4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:06:56 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so12012880wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 09:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LoO5lGTvppP8IV0NTKfsPj3Pa2rbXURx3wWzjDP01V0=;
	b=CrrMd2R6mFTUigOBSsabV3cZOCwmjF9/pXJy2k+cuoS4hLzkx8NOjH+v0tVeDiJm8n
	TYLKJqWqiiGUpDw5PaOW89/QkgbrdtZ3+PL69Dxlm3tnaJzpLnKyloNg5WT40ak9l2w6
	0jpI8w0m4HV8MSuTfnlceB9b0TU1w2J41g60X/OkkyBRk0r3MUfviPexEpSeDC/UnuY/
	MkVQczrL3z32+wBxUuqPODi9t0+GgBjRnNl/nVcKoO3KTcs16gZpYdOQkEyWlJPqDWdL
	Kyxilu4pQL7X762dwc99eJZH9vVJJnkF6RtF4O3jw7CwlHiY57qsvK/ohssxHO2wf7RP
	Iq5Q==
X-Received: by 10.194.23.36 with SMTP id j4mr12191395wjf.105.1440778016751;
	Fri, 28 Aug 2015 09:06:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v8sm8699578wjr.15.2015.08.28.09.06.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 09:06:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 18:07:16 +0200
Message-Id: <1440778036-31624-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [RFC][PATCH] pulseaudio: improve PACKAGECONFIG for dbus/consolekit dependencies
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
X-List-Received-Date: Fri, 28 Aug 2015 16:06:58 -0000

* the problem is that consolekit module is built whenever dbus is enabled
  and consolekit is available only in distributions with x11 in DISTRO_FEATURES
* many distributions want to enable dbus support (required for bluez support),
  but without consolekit because they aren't using x11
* allow to completely disable dbus (and consolekit)
* add consolekit runtime dependency only for x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3389ec9..a2b4446 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
 
 DEPENDS = "libatomics-ops liboil libsndfile1 libtool"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
+DEPENDS += "udev alsa-lib glib-2.0 gconf"
 DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
 
 inherit autotools pkgconfig useradd gettext perlnative bluetooth systemd
@@ -37,8 +37,10 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   dbus \
                    "
 
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
 PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable-bluez5-ofono-headset,ofono"
@@ -75,7 +77,7 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
 PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainloop-glib \
-             pulseaudio-server pulseaudio-misc ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
+             pulseaudio-server pulseaudio-misc ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio-module-console-kit', '', d)}"
 
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
@@ -157,7 +159,9 @@ RDEPENDS_pulseaudio-server = " \
 # that makes the PulseAudio plugin the default ALSA device.
 RDEPENDS_pulseaudio-server += "alsa-plugins-pulseaudio-conf"
 
-RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
+# pulseaudio-module-console-kit is built whenever dbus is enabled by PACKAGECONFIG
+# but consolekit depends on libx11 and is available only for DISTRO with x11 in DISTRO_FEATURES
+RDEPENDS_pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
 FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
-- 
2.5.0


