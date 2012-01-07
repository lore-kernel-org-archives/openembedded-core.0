Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RjONQ-0004sJ-9h
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 05:59:32 +0100
Received: by iakh37 with SMTP id h37so3666004iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 20:52:07 -0800 (PST)
Received: by 10.50.182.199 with SMTP id eg7mr558717igc.22.1325911927204;
	Fri, 06 Jan 2012 20:52:07 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id gh7sm109453857igb.1.2012.01.06.20.52.05
	(version=SSLv3 cipher=OTHER); Fri, 06 Jan 2012 20:52:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 20:51:52 -0800
Message-Id: <1325911915-16001-2-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v2] dbus: change permissions of dbus-daemon-launch-helper to 4755
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
X-List-Received-Date: Sat, 07 Jan 2012 04:59:32 -0000

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
1.7.1



