Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RjJdG-0002Tt-7E
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:55:34 +0100
Received: by vbbfc21 with SMTP id fc21so1595570vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+sL6RRJOoK+YKCXHYxB54PYsCKHXuEUEcDwJf0ftg/Y=;
	b=CeKNQN7yPa63B1xrhhHv2d90AXp5f+8XYKsGCkAigaQYHGSgiB3dZEjJmwca/iXGj9
	Flwgkgh74KzFV/SX8kLfdRLH0r0q0N85d/14VGNSeNoQ8hK2lKNV64rM/DtUfy48IaQ7
	gvw/ZMiLWbVfU5nIMED8D8UfrszR1brtkAMQI=
MIME-Version: 1.0
Received: by 10.52.173.211 with SMTP id bm19mr4044625vdc.2.1325893689240; Fri,
	06 Jan 2012 15:48:09 -0800 (PST)
Received: by 10.52.95.211 with HTTP; Fri, 6 Jan 2012 15:48:09 -0800 (PST)
Date: Fri, 6 Jan 2012 15:48:09 -0800
Message-ID: <CAGDS+nkZd0MJ2BdGd5sH7OZeQHWJs_a43FHWjsL6RC3iZbnOTw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] dbus: change permissions of dbus-daemon-launch-helper to 4755
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
X-List-Received-Date: Fri, 06 Jan 2012 23:55:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

With current permissions of 4754 on systemd systems various services
will fail to
activate with "helpful" error messages of the type:

2000-01-01T00:00:25+00:00 omap3-multi dbus[178]: [system] Activated service
'org.freedesktop.nm_dispatcher' failed: Failed to execute program
/usr/libexec/dbus-daemon-launch-helper: Success

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 99b2fc7..2a25256 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,6 +10,8 @@ DEPENDS = "expat virtual/libintl
${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk
virtual/libintl-nativesdk virtual/libx11"

+INC_PR = "r1"
+
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
            file://dbus-1.init"
@@ -84,7 +86,7 @@ do_install() {
 	chown messagebus:messagebus ${D}${localstatedir}/run/dbus
${D}${localstatedir}/lib/dbus

 	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
-	chmod 4754 ${D}${libexecdir}/dbus-daemon-launch-helper
+	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper

 	# Remove Red Hat initscript
 	rm -rf ${D}${sysconfdir}/rc.d


