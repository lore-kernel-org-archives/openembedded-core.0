Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rI-0005xS-1r
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250229"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:47 -0700
Message-Id: <053755131706d918b2f310c23dd311792157712a.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/27] dbus: use useradd class to allow use in read-only filesystems
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:20 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

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
1.7.6.4



