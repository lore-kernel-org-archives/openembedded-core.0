Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QkCon-0002aL-GX
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 12:18:54 +0200
Received: by wwi18 with SMTP id 18so1698342wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 03:14:45 -0700 (PDT)
Received: by 10.227.205.78 with SMTP id fp14mr1102674wbb.65.1311329684990;
	Fri, 22 Jul 2011 03:14:44 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p14sm1782581wbh.13.2011.07.22.03.14.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 03:14:44 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 12:14:39 +0200
Message-Id: <1311329679-2872-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] consolekit 0.4.5: fix PAM installation dir
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
X-List-Received-Date: Fri, 22 Jul 2011 10:18:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 661cca6..562dfb3 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r4"
+PR = "r5"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -20,12 +20,13 @@ SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b22368
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
 EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
-                ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${libdir}/security', '--disable-pam-module', d)} \
+                ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
                "
 
 FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
 PACKAGES =+ "pam-plugin-ck-connector"
-FILES_pam-plugin-ck-connector += "${libdir}/security/*.so"
+FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
 RDEPENDS_pam-plugin-ck-connector += "${PN}"
 
-- 
1.6.6.1



