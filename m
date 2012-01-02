Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RhptD-0002A9-58
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 22:57:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jan 2012 13:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92273462"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.69])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2012 13:50:34 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 13:50:32 -0800
Message-Id: <1325541032-29837-1-git-send-email-josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
Subject: [PATCH] busybox: rename syslog.conf to syslog-startup.conf
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
X-List-Received-Date: Mon, 02 Jan 2012 21:57:55 -0000

Busybox 1.19 introduced basic support for an rsyslog inspired syslog.conf
whereas we've been shipping syslog.conf as a file to be sourced by the
syslog init script in order to configure which options busybox's syslog is
started with.

Busybox 1.19 in syslog mode chokes on our syslog.conf and doesn't start.

This patch renames the syslog.conf we ship to syslog-startup.conf in order
to prevent busybox trying to parse the file as an rsyslog style syslog.conf

Fixes [YOCTO #1848]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc              |   10 +++++-----
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    4 ++--
 meta/recipes-core/busybox/files/syslog             |    4 ++--
 .../recipes-core/busybox/files/syslog-startup.conf |   12 ++++++++++++
 meta/recipes-core/busybox/files/syslog.conf        |    9 ---------
 5 files changed, 21 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/syslog-startup.conf
 delete mode 100644 meta/recipes-core/busybox/files/syslog.conf

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 07ca782..a107a02 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -17,7 +17,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog.conf*"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf*"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc ${sysconfdir}/init.d/busybox-udhcpc"
@@ -30,7 +30,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
-CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${BPN}"
+CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
@@ -168,7 +168,7 @@ do_install () {
 
 	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
-		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf.${BPN}
+		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf.${BPN}
 	fi
 	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
@@ -249,7 +249,7 @@ pkg_postinst_${PN} () {
 
 pkg_postinst_${PN}-syslog () {
 	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${BPN} 50
-	update-alternatives --install ${sysconfdir}/syslog.conf syslog-conf syslog.conf.${BPN} 50
+	update-alternatives --install ${sysconfdir}/syslog-startup.conf syslog-startup-conf syslog-startup.conf.${BPN} 50
 }
 
 pkg_prerm_${PN} () {
@@ -293,5 +293,5 @@ pkg_prerm_${PN}-syslog () {
 	fi
 
 	update-alternatives --remove syslog-init syslog.${BPN}
-	update-alternatives --remove syslog-conf syslog.conf.${BPN}
+	update-alternatives --remove syslog-startup-conf syslog-startup.conf.${BPN}
 }
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
index 7360219..f591856 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
@@ -20,7 +20,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://hwclock.sh \
            file://mount.busybox \
            file://syslog \
-           file://syslog.conf \
+           file://syslog-startup.conf \
            file://mdev \
            file://mdev.conf \
            file://umount.busybox \
diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 9edaa15..5ff6599 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -10,8 +10,8 @@
 
 set -e
 
-if [ -f /etc/syslog.conf ]; then
-	. /etc/syslog.conf
+if [ -f /etc/syslog-startup.conf ]; then
+	. /etc/syslog-startup.conf
 	LOG_LOCAL=0
 	LOG_REMOTE=0
 	for D in $DESTINATION; do
diff --git a/meta/recipes-core/busybox/files/syslog-startup.conf b/meta/recipes-core/busybox/files/syslog-startup.conf
new file mode 100644
index 0000000..903a60c
--- /dev/null
+++ b/meta/recipes-core/busybox/files/syslog-startup.conf
@@ -0,0 +1,12 @@
+# This configuration file is used by the busybox syslog init script,
+# /etc/init.d/syslog[.busybox] to set syslog configuration at start time.
+
+DESTINATION=buffer		# log destinations (buffer file remote)
+MARKINT=20			# interval between --mark-- entries
+LOGFILE=/var/log/messages	# where to log (file)
+REMOTE=loghost:514		# where to log (syslog remote)
+REDUCE=no			# reduce-size logging
+#ROTATESIZE=0			# rotate log if grown beyond X [kByte] (incompatible with busybox)
+#ROTATEGENS=3			# keep X generations of rotated logs (incompatible with busybox)
+BUFFERSIZE=64			# size of circular buffer [kByte]
+FOREGROUND=no			# run in foreground (don't use!)
diff --git a/meta/recipes-core/busybox/files/syslog.conf b/meta/recipes-core/busybox/files/syslog.conf
deleted file mode 100644
index d4a0e02..0000000
--- a/meta/recipes-core/busybox/files/syslog.conf
+++ /dev/null
@@ -1,9 +0,0 @@
-DESTINATION="buffer"		# log destinations (buffer file remote)
-MARKINT=20			# intervall between --mark-- entries
-LOGFILE=/var/log/messages	# where to log (file)
-REMOTE=loghost:514		# where to log (syslog remote)
-REDUCE=no			# reduce-size logging
-#ROTATESIZE=0			# rotate log if grown beyond X [kByte] (incompatible with busybox)
-#ROTATEGENS=3			# keep X generations of rotated logs (incompatible with busybox)
-BUFFERSIZE=64			# size of circular buffer [kByte]
-FOREGROUND=no			# run in foreground (don't use!)
-- 
1.7.7.4



