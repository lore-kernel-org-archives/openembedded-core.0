Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFuA-0005tJ-HS
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 16:17:02 +0200
Received: by gyc15 with SMTP id 15so3752999gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=oyubGhupKwWSoeRhYrbxSTP4pholCW5uYIf4oaCGVYs=;
	b=ICdb1BlOZuz6jHOXHD2DonsP1hPtSso1cgi0pf4HVT8P2MOCNYGObfUQpx+tkme1Jg
	isFiDtlkKOTiQYAQDpdWd/86RI/W5E0qv9W+laaOql9TVjb5fDL/euEaQWbIjSSGBI0R
	rDvMZxNuo3z1GqMBXScCW4zE/vt5nI540veg8=
Received: by 10.100.78.11 with SMTP id a11mr3327328anb.111.1319206264390;
	Fri, 21 Oct 2011 07:11:04 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24713630anh.8.2011.10.21.07.11.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 07:11:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 14:10:46 +0000
Message-Id: <889826463264f3a2aeb5062afb5b2f24b5dc75a0.1319206126.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319206126.git.otavio@ossystems.com.br>
References: <cover.1319206126.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319206126.git.otavio@ossystems.com.br>
References: <cover.1319206126.git.otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 21 Oct 2011 14:17:02 -0000

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



