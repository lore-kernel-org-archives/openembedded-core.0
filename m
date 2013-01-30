Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U0SUj-0003cK-Ad
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 08:54:11 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jan 2013 23:38:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,566,1355126400"; d="scan'208";a="250170104"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 29 Jan 2013 23:38:17 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 09:38:08 +0200
Message-Id: <1359531488-3198-3-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1359531488-3198-1-git-send-email-radu.moisan@intel.com>
References: <1359531488-3198-1-git-send-email-radu.moisan@intel.com>
Subject: [PATCH 2/2] avahi: Remove -systemd postfix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 07:54:14 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index d529b37..317a592 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -64,9 +64,8 @@ do_configure_prepend() {
 }
 
 
-PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
+PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
-FILES_avahi-systemd = "${systemd_unitdir}"
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/dhcp/*/avahi-autoipd \
@@ -84,7 +83,8 @@ FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/interfaces \
-                      ${datadir}/dbus-1/system-services"
+                      ${datadir}/dbus-1/system-services \
+                      ${@base_contains('DISTRO_FEATURES','systemd','${systemd_unitdir}','',d)}"
 FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
 FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
 FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
@@ -94,8 +94,6 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
-RDEPENDS_avahi-systemd = "avahi-daemon"
-
 RDEPENDS_avahi-daemon = "sysvinit-pidof"
 
 # uclibc has no nss
-- 
1.7.9.5



