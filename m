Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPKaY-0003aK-Mk
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 22:21:54 +0200
Received: by mail-ey0-f175.google.com with SMTP id 27so50388eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 13:18:54 -0700 (PDT)
Received: by 10.14.10.129 with SMTP id 1mr1808243eev.150.1306354726910;
	Wed, 25 May 2011 13:18:46 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b19sm13183eec.8.2011.05.25.13.18.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 13:18:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 22:18:41 +0200
Message-Id: <1306354721-16325-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dbus: split X11 dependant dbus-launch into its own subpackage
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
X-List-Received-Date: Wed, 25 May 2011 20:21:54 -0000

This makes dbus usable in non-X enviroments like QT/e

From the original commit in OE .dev:

commit 8e25448fb01b6fa6ea3a86f9327f080cd753dfbc
Author: John Lee <john_lee@openmoko.org>
Date:   Fri Sep 5 11:37:39 2008 +0000

    dbus: enable x support and put dbus-launch into new package dbus-x11
    * Enable x support only add rdepends to dbus-launch.  Make it a
      seperate package so other packages like dbus does not rdepend on
      libx11.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dbus/dbus.inc      |    4 +++-
 meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 1ef0d8f..acf43d5 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -21,7 +21,9 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib"
+PACKAGES =+ "${PN}-lib ${PN}-x11"
+
+FILES_${PN}-x11 = "${bindir}/dbus-launch"
 
 FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-uuidgen \
diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb b/meta/recipes-core/dbus/dbus_1.4.1.bb
index f16d9f2..d1c59dc 100644
--- a/meta/recipes-core/dbus/dbus_1.4.1.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
@@ -1,6 +1,6 @@
 include dbus.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
 SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
-- 
1.6.6.1



