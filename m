Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgbBr-0005Kq-W0
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 13:31:48 +0200
Received: by wwi14 with SMTP id 14so2951852wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 04:27:50 -0700 (PDT)
Received: by 10.227.204.148 with SMTP id fm20mr5352441wbb.38.1310470070492;
	Tue, 12 Jul 2011 04:27:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm10784814wbb.31.2011.07.12.04.27.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 04:27:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 13:27:43 +0200
Message-Id: <1310470064-22366-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] pulseaudio: try harder to disable HAL
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
X-List-Received-Date: Tue, 12 Jul 2011 11:31:48 -0000

This disables linking against (lib)hal but enables the udev-hal compat layer so the hal-detect plugin keeps working. The hal-detect plugin is removed from the default dependencies to discourage its usage, but can be installed manually if needed.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    3 +--
 .../pulseaudio/pulseaudio_0.9.15.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 12e6ef3..979d0a9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF = "\
 		--with-alsa \
 		--with-oss \
 		--without-hal \
+		--disable-hal \
 "
 
 PARALLEL_MAKE = ""
@@ -108,7 +109,6 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
-RDEPENDS_pulseaudio-module-hal-detect =+ "hal"
 RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-device-restore \
     pulseaudio-module-stream-restore \
@@ -119,7 +119,6 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-alsa-source \
     pulseaudio-module-alsa-card \
     pulseaudio-module-native-protocol-unix \
-    pulseaudio-module-hal-detect \
     pulseaudio-module-default-device-restore \
     pulseaudio-module-rescue-streams \
     pulseaudio-module-always-sink \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
index 71e19e9..a46782b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
@@ -1,7 +1,7 @@
 require pulseaudio.inc
 
 DEPENDS += "dbus gdbm speex"
-PR = "r15"
+PR = "r16"
 
 SRC_URI += "\
   file://buildfix.patch;patch=1 \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index 5124bd7..d03a726 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "gdbm speex"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 4bdc4ed..9f354ff 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "gdbm speex"
 
-- 
1.6.6.1



