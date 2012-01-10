Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmX-00042N-Fc
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:01 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535253"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:02 -0800
Message-Id: <7b1e227bf28c9d4f3bb16af4d9ac21265e88a3f1.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/22] dbus: change permissions of dbus-daemon-launch-helper to 4755
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
X-List-Received-Date: Tue, 10 Jan 2012 06:02:01 -0000

From: Steve Sakoman <steve@sakoman.com>

With current permissions of 4754 on systemd systems various services will fail to
activate with "helpful" error messages of the type:

2000-01-01T00:00:25+00:00 omap3-multi dbus[178]: [system] Activated service
'org.freedesktop.nm_dispatcher' failed: Failed to execute program
/usr/libexec/dbus-daemon-launch-helper: Success

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 99b2fc7..2a25256 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,6 +10,8 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
+INC_PR = "r1"
+
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
            file://dbus-1.init"
@@ -84,7 +86,7 @@ do_install() {
 	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
 
 	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
-	chmod 4754 ${D}${libexecdir}/dbus-daemon-launch-helper
+	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
 
 	# Remove Red Hat initscript
 	rm -rf ${D}${sysconfdir}/rc.d
-- 
1.7.6.5



