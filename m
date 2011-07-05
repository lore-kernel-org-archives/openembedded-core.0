Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qe902-0001Uz-UB
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 19:01:27 +0200
Received: by wwi18 with SMTP id 18so5204135wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 09:57:37 -0700 (PDT)
Received: by 10.227.205.202 with SMTP id fr10mr6432550wbb.60.1309885057338;
	Tue, 05 Jul 2011 09:57:37 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm5445880wbb.54.2011.07.05.09.57.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 09:57:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:57:31 +0200
Message-Id: <1309885051-17651-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] pulseaudio: disable HAL support and enable udev support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 17:01:27 -0000

HAL is deprecated and udev should be used with pulseaudio 0.9.22. THe .23 release from 2 weeks ago already removed HAL support.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    6 +++---
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index e46b716..ab7e867 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
                     file://src/pulsecore/vector.h;beginline=1;endline=21;md5=1b561f0a2ca47b1fa49862a6ccaacff1"
-DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool hal virtual/libx11"
+DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool virtual/libx11"
 # optional
-DEPENDS += "alsa-lib glib-2.0 dbus consolekit hal"
+DEPENDS += "udev alsa-lib glib-2.0 dbus consolekit"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch;patch=1 \
@@ -26,7 +26,7 @@ EXTRA_OECONF = "\
 		--with-glib \
 		--with-alsa \
 		--with-oss \
-		--with-hal \
+		--without-hal \
 "
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index 863beda..5124bd7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "gdbm speex"
 
-- 
1.6.6.1



