Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPWc8-0003bH-NP
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 11:12:20 +0200
Received: by wwb17 with SMTP id 17so408644wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 02:09:16 -0700 (PDT)
Received: by 10.216.141.1 with SMTP id f1mr579036wej.35.1306400956781;
	Thu, 26 May 2011 02:09:16 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm241315weg.38.2011.05.26.02.09.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 02:09:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 11:09:13 +0200
Message-Id: <1306400953-10868-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dbus 1.4.1: enable systemd support, but package systemd files seperately
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
X-List-Received-Date: Thu, 26 May 2011 09:12:20 -0000

Systemd support in dbus only affects 'make install', so no changes for sysvinit based systems

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dbus/dbus.inc      |    5 ++++-
 meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index acf43d5..8275a1b 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -21,10 +21,12 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-x11"
+PACKAGES =+ "${PN}-lib ${PN}-x11 ${PN}-systemd"
 
 FILES_${PN}-x11 = "${bindir}/dbus-launch"
 
+FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
+
 FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-uuidgen \
                ${bindir}/dbus-launch \
@@ -73,6 +75,7 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-xml=expat \
+                --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
                 ${EXTRA_OECONF_X}"
 
 do_install() {
diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb b/meta/recipes-core/dbus/dbus_1.4.1.bb
index d1c59dc..00720fd 100644
--- a/meta/recipes-core/dbus/dbus_1.4.1.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
@@ -1,6 +1,6 @@
 include dbus.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
 SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
-- 
1.6.6.1



