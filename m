Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPtSL-0000WW-VM
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 11:35:46 +0200
Received: by wye20 with SMTP id 20so1261450wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 02:32:41 -0700 (PDT)
Received: by 10.216.232.41 with SMTP id m41mr1827693weq.31.1306488760779;
	Fri, 27 May 2011 02:32:40 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y3sm845298wec.34.2011.05.27.02.32.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 02:32:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 11:32:37 +0200
Message-Id: <1306488757-29019-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] avahi: enable systemd support, but package systemd files seperately
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
X-List-Received-Date: Fri, 27 May 2011 09:35:46 -0000

Systemd support in avahi only affects 'make install', so no changes for sysvinit based systems

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/avahi/avahi.inc       |    9 +++++++--
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index b2fa8ca..099c5a4 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -37,9 +37,14 @@ EXTRA_OECONF = "--with-distro=debian \
              --disable-qt3 \
              --disable-qt4 \
              --disable-python \
-             --disable-doxygen-doc"
+             --disable-doxygen-doc \
+             --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+"
 
-PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-gobject avahi-autoipd avahi-ui-utils avahi-utils libavahi-ui libavahi-ui-dev"
+PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-gobject avahi-autoipd avahi-ui-utils avahi-utils libavahi-ui libavahi-ui-dev"
+
+FILES_avahi-systemd = "${base_libdir}/systemd"
+RDEPENDS_avahi-systemd = "avahi-daemon"
 
 FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
 FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 1084c04..e63f406 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
 RDEPENDS_avahi-daemon = "sysvinit-pidof"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "--disable-gtk3"
 
-- 
1.6.6.1



