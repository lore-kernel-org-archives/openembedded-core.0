Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QaPAF-0003Ti-Qh
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 11:28:31 +0200
Received: by wyg30 with SMTP id 30so354922wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2011 02:24:54 -0700 (PDT)
Received: by 10.216.238.80 with SMTP id z58mr471979weq.106.1308993891380;
	Sat, 25 Jun 2011 02:24:51 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h43sm1774783wes.11.2011.06.25.02.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Jun 2011 02:24:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jun 2011 11:24:44 +0200
Message-Id: <1308993885-14753-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] consolekit 0.4.5: add pam support based on distro features
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
X-List-Received-Date: Sat, 25 Jun 2011 09:28:31 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index f3b1ef8..2b85455 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,11 +2,13 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
+PR = "r2"
+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-DEPENDS = "dbus"
+DEPENDS = "dbus ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit gnome
 
@@ -18,8 +20,13 @@ SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b22368
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/"
+EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+                ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${libdir}/security', '--disable-pam-module', d)} \
+               "
 
-FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit"
+FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
 
+PACKAGES =+ "pam-plugin-ck-connector"
+FILES_pam-plugin-ck-connector += "${libdir}/security/*.so"
+RDEPENDS_pam-plugin-ck-connector += "${PN}"
 
-- 
1.6.6.1



