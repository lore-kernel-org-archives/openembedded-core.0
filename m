Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R1OoG-00088S-Fs
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 22:33:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R1OjP-0002iS-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 22:28:24 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 07 Sep 2011 21:28:17 +0100
Message-ID: <1315427297.4368.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] dbus: fix paths in startup script, use useradd.bbclass for user creation
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
X-List-Received-Date: Wed, 07 Sep 2011 20:33:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Replace various hard-coded references to /usr, /var and /etc with symbolic equivalents.

Also replace adhoc usage of adduser/addgroup with useradd.bbclass
functionality.  This should, in theory, remove the need for a postinst
to be run at boot time.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init |   14 +++---
 meta/recipes-core/dbus/dbus.inc                |   58 ++++++++++++------------
 meta/recipes-core/dbus/dbus_1.4.12.bb          |    1 +
 3 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init b/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init
index 4abc4cb..1917ad3 100644
--- a/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus-1.4.12/dbus-1.init
@@ -16,22 +16,22 @@
 
 set -e
 
-DAEMON=/usr/bin/dbus-daemon
+DAEMON=@BINDIR@/dbus-daemon
 NAME=dbus
 DAEMONUSER=messagebus
-PIDDIR=/var/run/dbus
+PIDDIR=@LOCALSTATEDIR@/run/dbus
 PIDFILE=$PIDDIR/pid
-UUIDDIR=/var/lib/dbus
+UUIDDIR=@LOCALSTATEDIR@/lib/dbus
 DESC="system message bus"
-EVENTDIR=/etc/dbus-1/event.d
+EVENTDIR=@SYSCONFDIR@/dbus-1/event.d
 
 test -x $DAEMON || exit 0
 
 # Source defaults file; edit that file to configure this script.
 ENABLED=1
 PARAMS=""
-if [ -e /etc/default/dbus ]; then
-  . /etc/default/dbus
+if [ -e @SYSCONFDIR@/default/dbus ]; then
+  . @SYSCONFDIR@/default/dbus
 fi
 
 test "$ENABLED" != "0" || exit 0
@@ -113,7 +113,7 @@ case "$1" in
     start_it_up
   ;;
   *)
-    echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-reload}" >&2
+    echo "Usage: @SYSCONFDIR@/init.d/$NAME {start|stop|restart|reload|force-reload}" >&2
     exit 1
   ;;
 esac
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a8ecda8..34dbe4a 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -14,11 +14,19 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
            file://dbus-1.init"
 
-inherit autotools pkgconfig gettext update-rc.d
+inherit autotools pkgconfig gettext update-rc.d useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-d ${MESSAGEHOME} -g ${MESSAGEUSER} -r ${MESSAGEUSER}"
+GROUPADD_PARAM_${PN} = "${MESSAGEUSER}; netdev"
 
 INITSCRIPT_NAME = "dbus-1"
 INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
 
+MESSAGEUSER=messagebus
+MESSAGEHOME="${localstatedir}/run/dbus"
+UUIDDIR="${localstatedir}/lib/dbus"
+
 CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
 
 DEBIANNAME_${PN} = "dbus-1"
@@ -34,42 +42,27 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-uuidgen \
                ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-send \
-               ${bindir}/dbus-monitor \
+               ${bindir}/dbus-monitor \	
+	       ${bindir}/dbus-launch \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${datadir}/dbus-1/services \
-               ${datadir}/dbus-1/system-services"
+               ${datadir}/dbus-1/system-services \
+	       ${MESSAGEHOME} \
+	       ${UUIDDIR}"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
-pkg_postinst_dbus() {
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
+pkg_postinst_${PN}() {
+	chgrp "${MESSAGEUSER}" "${MESSAGEHOME}"
+	chown "${MESSAGEUSER}":"${MESSAGEUSER}" "${MESSAGEHOME}"
+	chown "${MESSAGEUSER}":"${MESSAGEUSER}" "${UUIDDIR}"
 
-	chown "$MESSAGEUSER":"$MESSAGEUSER" "$UUIDDIR"
+	chown root:"${MESSAGEUSER}" $D${libexecdir}/dbus-daemon-launch-helper
+	chmod 4754 $D${libexecdir}/dbus-daemon-launch-helper
 
-	grep -q netdev: /etc/group || addgroup netdev
-
-	chown root:"$MESSAGEUSER" /usr/libexec/dbus-daemon-launch-helper
-	chmod 4754 /usr/libexec/dbus-daemon-launch-helper
-
-	# add volatile after new user/grp are created
-	echo "d messagebus messagebus 0755 /var/run/dbus none" > /etc/default/volatiles/99_dbus
-	if [ -e /etc/init.d/populate-volatile.sh ] ; then
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
 }
@@ -90,11 +83,18 @@ do_install() {
 	autotools_do_install
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
+	sed 's:@SYSCONFDIR@:${sysconfdir}:;s:@BINDIR@:${bindir}:;s:@LOCALSTATEDIR@:${localstatedir}:' < ${WORKDIR}/dbus-1.init > ${D}${sysconfdir}/init.d/dbus-1
+	chmod 755 ${D}${sysconfdir}/init.d/dbus-1
 
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
 	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
+
+	install -d ${D}${UUIDDIR}
+	install -d ${D}${MESSAGEHOME}
+
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" > ${D}${sysconfdir}/default/volatiles/99_dbus
 }
 
 do_install_virtclass-native() {
diff --git a/meta/recipes-core/dbus/dbus_1.4.12.bb b/meta/recipes-core/dbus/dbus_1.4.12.bb
index ada53c9..51604aa 100644
--- a/meta/recipes-core/dbus/dbus_1.4.12.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.12.bb
@@ -2,3 +2,4 @@ include dbus.inc
 SRC_URI[md5sum] = "104f2ea94c10a896dfb1edecb5714cb1"
 SRC_URI[sha256sum] = "da3c97fd546610558d588799e27c4fa81101e754acbcd34747a42c131f30dbe7"
 
+PR = "r6"
-- 
1.7.4.1





