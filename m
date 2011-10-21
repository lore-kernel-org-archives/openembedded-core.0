Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5va-0004t9-Dw
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 05:37:50 +0200
Received: by mail-gy0-f175.google.com with SMTP id 15so3363880gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=oyubGhupKwWSoeRhYrbxSTP4pholCW5uYIf4oaCGVYs=;
	b=WdYDF6j5uxw5IESXfw78X2h0YyB3+yfsuD2zj/Ro3jCh2zPFXFftOTBYH3lU+EtDmT
	ZrrHWoWJEbrLn8s8I6VLGOgm8Ms+h7pZAQozFu9ZQjT4FeFpI3rICPqAKXJuOJzB7phH
	O7KTk9a7RTal8PqLHwai2DU/g6DBLzDIcxCCo=
Received: by 10.150.189.10 with SMTP id m10mr12294218ybf.78.1319167918028;
	Thu, 20 Oct 2011 20:31:58 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m3sm32008971ang.0.2011.10.20.20.31.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:31:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:31:42 +0000
Message-Id: <67ee6e07c8d57d45682fb8962df79fb8d154c400.1319167843.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
Subject: [PATCH 4/4] dbus: use useradd class to allow use in read-only filesystems
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
X-List-Received-Date: Fri, 21 Oct 2011 03:37:50 -0000

Move creation of required user/groups to useradd class thus allowing
use with read-only filesystems and booting the initial boot.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/dbus/dbus.inc |   48 +++++++++++++++++----------------------
 1 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a8ecda8..2a97c02 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,15 +10,22 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
+PR = "r1"
+
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
            file://dbus-1.init"
 
-inherit autotools pkgconfig gettext update-rc.d
+inherit useradd autotools pkgconfig gettext update-rc.d
 
 INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
 
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r netdev"
+USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
+                       --no-create-home --user-group messagebus"
+
 CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
 
 DEBIANNAME_${PN} = "dbus-1"
@@ -44,32 +51,7 @@ RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 pkg_postinst_dbus() {
-	# can't do adduser stuff offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	MESSAGEUSER=messagebus
-	MESSAGEHOME=/var/run/dbus
-	UUIDDIR=/var/lib/dbus
-
-	mkdir -p $MESSAGEHOME
-	mkdir -p $UUIDDIR
-	chgrp "$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || addgroup "$MESSAGEUSER"
-	chown "$MESSAGEUSER":"$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || \
-		adduser --system --home "$MESSAGEHOME" --no-create-home --disabled-password \
-			--ingroup "$MESSAGEUSER" "$MESSAGEUSER"
-
-	chown "$MESSAGEUSER":"$MESSAGEUSER" "$UUIDDIR"
-
-	grep -q netdev: /etc/group || addgroup netdev
-
-	chown root:"$MESSAGEUSER" /usr/libexec/dbus-daemon-launch-helper
-	chmod 4754 /usr/libexec/dbus-daemon-launch-helper
-
-	# add volatile after new user/grp are created
-	echo "d messagebus messagebus 0755 /var/run/dbus none" > /etc/default/volatiles/99_dbus
-	if [ -e /etc/init.d/populate-volatile.sh ] ; then
+	if [ -z "${D}" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
 }
@@ -92,6 +74,18 @@ do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
 
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_dbus
+
+
+	mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+
+	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+
+	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
+	chmod 4754 ${D}${libexecdir}/dbus-daemon-launch-helper
+
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
 	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
-- 
1.7.2.5



