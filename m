Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <olivier.guiter@linux.intel.com>) id 1UFWAf-0000xQ-Oq
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 21:51:46 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2013 13:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,833,1355126400"; d="scan'208";a="300344500"
Received: from unknown (HELO oguiternx64.ger.corp.intel.com) ([10.252.120.189])
	by orsmga002.jf.intel.com with ESMTP; 12 Mar 2013 13:33:54 -0700
From: Olivier Guiter <olivier.guiter@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 13:33:52 -0700
Message-Id: <1363120432-10194-1-git-send-email-olivier.guiter@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <513E5F20.2020004@linux.intel.com>
References: <513E5F20.2020004@linux.intel.com>
Subject: [PATCH v4] neard: Update reference commit sha1 and install script
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
X-List-Received-Date: Tue, 12 Mar 2013 20:51:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This patch installs neard daemon in /usr/lib/neard.

Signed-off-by: Olivier Guiter <olivier.guiter@linux.intel.com>
---
 meta/recipes-connectivity/neard/neard/neard    |   42 ------------------
 meta/recipes-connectivity/neard/neard/neard.in |   54 ++++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.9.bb   |   32 ++++++++------
 3 files changed, 74 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard/neard
 create mode 100644 meta/recipes-connectivity/neard/neard/neard.in

diff --git a/meta/recipes-connectivity/neard/neard/neard b/meta/recipes-connectivity/neard/neard/neard
deleted file mode 100644
index 5f36174..0000000
--- a/meta/recipes-connectivity/neard/neard/neard
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-
-DAEMON=/usr/sbin/neard
-PIDFILE=/var/run/neard.pid
-DESC="Linux NFC daemon"
-
-if [ -f /etc/default/neard ] ; then
-	. /etc/default/neard
-fi
-
-set -e
-
-do_start() {
-	$DAEMON
-}
-
-do_stop() {
-	start-stop-daemon --stop --name neard --quiet
-}
-
-case "$1" in
-  start)
-	echo "Starting $DESC"
-	do_start
-	;;
-  stop)
-	echo "Stopping $DESC"
-	do_stop
-	;;
-  restart|force-reload)
-	echo "Restarting $DESC"
-	do_stop
-	sleep 1
-	do_start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta/recipes-connectivity/neard/neard/neard.in b/meta/recipes-connectivity/neard/neard/neard.in
new file mode 100644
index 0000000..a47d4d9
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/neard.in
@@ -0,0 +1,54 @@
+#!/bin/sh
+#
+# start/stop neard daemon.
+
+### BEGIN INIT INFO
+# Provides:          neard
+# Required-Start:    $network
+# Required-Stop:     $network
+# Default-Start:     S 2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: NFC daemon
+# Description:       neard is a daemon used to enable NFC features
+### END INIT INFO
+
+DAEMON=@installpath@/neard
+PIDFILE=/var/run/neard.pid
+DESC="Linux NFC daemon"
+
+if [ -f /etc/default/neard ] ; then
+	. /etc/default/neard
+fi
+
+set -e
+
+do_start() {
+	$DAEMON
+}
+
+do_stop() {
+	start-stop-daemon --stop --name neard --quiet
+}
+
+case "$1" in
+  start)
+	echo "Starting $DESC"
+	do_start
+	;;
+  stop)
+	echo "Stopping $DESC"
+	do_stop
+	;;
+  restart|force-reload)
+	echo "Restarting $DESC"
+	do_stop
+	sleep 1
+	do_start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-connectivity/neard/neard_0.9.bb
index 61ea58c..8e33a9d 100644
--- a/meta/recipes-connectivity/neard/neard_0.9.bb
+++ b/meta/recipes-connectivity/neard/neard_0.9.bb
@@ -11,14 +11,24 @@ inherit autotools pkgconfig update-rc.d
 INITSCRIPT_NAME = "neard"
 INITSCRIPT_PARAMS = "defaults 64"
 
+do_install() {
+	oe_runmake DESTDIR=${D} libexecdir=${libexecdir} install
+}
+
 # This would copy neard start-stop shell and test scripts
 do_install_append() {
-  install -d ${D}${sysconfdir}/init.d/
-  install -m 0755 ${WORKDIR}/neard ${D}${sysconfdir}/init.d/neard
+	# start/stop
+	install -d ${D}${sysconfdir}/init.d/
+
+	sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
+		> ${D}${sysconfdir}/init.d/neard
+
+	chmod 0755 ${D}${sysconfdir}/init.d/neard
 
-  install -d ${D}${libdir}/neard
-  install -m 0755 ${S}/test/* ${D}${libdir}/neard/
-  install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/neard/
+	#test files
+	install -d ${D}${libdir}/neard
+	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
+	install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
 }
 
 RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
@@ -32,26 +42,24 @@ RRECOMMENDS_${PN} = "\
 #Additional
 PACKAGES =+ "${PN}-tests"
 
-FILES_${PN}-tests = "${libdir}/neard/*-test"
-RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
+FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
+FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 
-FILES_${PN}-dbg += "${bindir}/neard/*/.debug"
+RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
 
-##=============================
 # This is valid for 0.9+
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 S	= "${WORKDIR}/git"
-SRCREV	= "7abdb13d106d496e1115fab49e6448a249dfb3c8"
+SRCREV	= "1e20e396cb837017b7e5ef822bfdab6ce060d2cf"
 PV	= "0.9-git${SRCPV}"
 PR	= "r1"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
-	file://neard \
+	file://neard.in \
 	"
 
 EXTRA_OECONF += "--enable-tools \
 	"
 
-
-- 
1.7.9.5



