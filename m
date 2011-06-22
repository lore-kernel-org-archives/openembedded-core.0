Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZJ51-0002Tx-0k
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 10:46:35 +0200
Received: by wwg12 with SMTP id 12so492338wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 01:43:01 -0700 (PDT)
Received: by 10.216.245.4 with SMTP id n4mr1805282wer.83.1308732180822;
	Wed, 22 Jun 2011 01:43:00 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d7sm163500wek.21.2011.06.22.01.42.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 01:43:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2011 10:42:56 +0200
Message-Id: <1308732176-21404-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] alsa-utils 1.0.24.2: fix packaging
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
X-List-Received-Date: Wed, 22 Jun 2011 08:46:35 -0000

Put the rules and scripts associated with alsactl in the alsactl subpackage

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index 4cb31a9..52a7871 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -26,7 +26,7 @@ EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 inherit autotools gettext
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
-# ipk depend on them.
+# ipk depends on them.
 
 PACKAGES += "\
              alsa-utils-alsamixer \
@@ -39,7 +39,10 @@ PACKAGES += "\
              alsa-utils-aseqnet \
              alsa-utils-aseqdump \
              alsa-utils-alsaconf \
-             alsa-utils-alsactl "
+             alsa-utils-alsactl \
+             alsa-utils-alsaloop \
+             alsa-utils-alsaucm \
+            "
 
 # We omit alsaconf, because
 # a) this is a bash script
@@ -54,9 +57,12 @@ FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bind
 FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${base_libdir}/udev/rules.d ${base_libdir}/systemd"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaconf    = "${sbindir}/alsaconf"
+FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
+FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
+
 
 DESCRIPTION_alsa-utils-aplay        = "play (and record) sound files via ALSA"
 DESCRIPTION_alsa-utils-amixer       = "command-line based control for ALSA mixer and settings"
@@ -67,5 +73,6 @@ DESCRIPTION_alsa-utils-aconnect     = "ALSA sequencer connection manager"
 DESCRIPTION_alsa-utils-aseqnet      = "network client/server on ALSA sequencer"
 DESCRIPTION_alsa-utils-alsactl      = "saves/restores ALSA-settings in /etc/asound.state"
 DESCRIPTION_alsa-utils-alsaconf     = "a bash script that creates ALSA configuration files"
+DESCRIPTION_alsa-utils-alsaucm      = "ALSA Use Case Manager"
 
 ALLOW_EMPTY_alsa-utils = "1"
-- 
1.6.6.1



