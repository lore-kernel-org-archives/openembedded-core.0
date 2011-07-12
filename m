Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qgcxp-0005E4-8I
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:25:25 +0200
Received: by wwi18 with SMTP id 18so4006734wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 06:21:28 -0700 (PDT)
Received: by 10.216.137.92 with SMTP id x70mr2994974wei.62.1310476887877;
	Tue, 12 Jul 2011 06:21:27 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm6482661wbh.43.2011.07.12.06.21.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 06:21:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 15:21:23 +0200
Message-Id: <1310476883-3649-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] pulseaudio: make it work out of the box
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
X-List-Received-Date: Tue, 12 Jul 2011 13:25:25 -0000

* reuse 'audio' group as access group

  The current failure is:

  root@usrp-e1xx:/etc/pulse# pulseaudio --system
   [..]
  W: protocol-native.c: Failed to get GID of group 'pulse-access'
  W: protocol-native.c: Failed to check group membership.
  W: protocol-native.c: Denied access to client with invalid authorization data.

* add more required modules
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 ++++
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 979d0a9..a520343 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -28,6 +28,7 @@ EXTRA_OECONF = "\
 		--with-oss \
 		--without-hal \
 		--disable-hal \
+		--with-access-group=audio \
 "
 
 PARALLEL_MAKE = ""
@@ -110,6 +111,8 @@ python populate_packages_prepend() {
 
 RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 RDEPENDS_pulseaudio-server = " \
+    pulseaudio-module-udev-detect \
+    pulseaudio-module-null-sink \
     pulseaudio-module-device-restore \
     pulseaudio-module-stream-restore \
     pulseaudio-module-card-restore \
@@ -120,6 +123,7 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-alsa-card \
     pulseaudio-module-native-protocol-unix \
     pulseaudio-module-default-device-restore \
+    pulseaudio-module-intended-roles \
     pulseaudio-module-rescue-streams \
     pulseaudio-module-always-sink \
     pulseaudio-module-suspend-on-idle \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index d03a726..2757b32 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r3"
+PR = "r5"
 
 DEPENDS += "gdbm speex"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 9f354ff..8b96aed 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r1"
+PR = "r3"
 
 DEPENDS += "gdbm speex"
 
-- 
1.6.6.1



