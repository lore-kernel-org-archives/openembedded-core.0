Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 934CA75947
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 05:28:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,622,1427731200"; d="scan'208";a="97115630"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jun 2015 13:32:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5G5QP5J008984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 13:26:25 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 16 Jun 2015 13:28:08 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jun 2015 13:27:50 +0800
Message-ID: <1434432470-2012-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] mdadm: add systemd service files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jun 2015 05:28:02 -0000
Content-Type: text/plain

Add mdmonitor.service to support systemd systems and add configuration
file.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/mdadm.conf       |  1 +
 meta/recipes-extended/mdadm/files/mdadm.default    | 25 ++++++++
 meta/recipes-extended/mdadm/files/mdadm.init       | 71 ++++++++++++++++++++++
 .../recipes-extended/mdadm/files/mdmonitor.service | 13 ++++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb         | 32 +++++++++-
 5 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.conf
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.default
 create mode 100755 meta/recipes-extended/mdadm/files/mdadm.init
 create mode 100644 meta/recipes-extended/mdadm/files/mdmonitor.service

diff --git a/meta/recipes-extended/mdadm/files/mdadm.conf b/meta/recipes-extended/mdadm/files/mdadm.conf
new file mode 100644
index 0000000..b869d8f
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm.conf
@@ -0,0 +1 @@
+MAILADDR root@mydomain.com
diff --git a/meta/recipes-extended/mdadm/files/mdadm.default b/meta/recipes-extended/mdadm/files/mdadm.default
new file mode 100644
index 0000000..2e74fdb
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm.default
@@ -0,0 +1,25 @@
+# mdadm configuration
+#
+# You can run 'dpkg-reconfigure mdadm' to modify the values in this file, if
+# you want. You can also change the values here and changes will be preserved.
+# Do note that only the values are preserved; the rest of the file is
+# rewritten.
+#
+
+# AUTOCHECK:
+#   should mdadm run periodic redundancy checks over your arrays? See
+#   /etc/cron.d/mdadm.
+AUTOCHECK=true
+
+# START_DAEMON:
+#   should mdadm start the MD monitoring daemon during boot?
+START_DAEMON=true
+
+# DAEMON_OPTIONS:
+#   additional options to pass to the daemon.
+DAEMON_OPTIONS="--syslog"
+
+# VERBOSE:
+#   if this variable is set to true, mdadm will be a little more verbose e.g.
+#   when creating the initramfs.
+VERBOSE=false
diff --git a/meta/recipes-extended/mdadm/files/mdadm.init b/meta/recipes-extended/mdadm/files/mdadm.init
new file mode 100755
index 0000000..8a9fbe3
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm.init
@@ -0,0 +1,71 @@
+#!/bin/sh
+#
+# Start the MD monitor daemon for all active MD arrays if desired.
+#
+### BEGIN INIT INFO
+# Provides:          mdadm
+# Required-Start:    $local_fs $syslog mdadm-raid
+# Required-Stop:     $local_fs $syslog mdadm-raid
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: MD monitoring daemon
+# Description:       mdadm provides a monitor mode, in which it will scan for
+#                    problems with the MD devices. If a problem is found, the
+#                    administrator is alerted via email, or a custom script is
+#                    run.
+### END INIT INFO
+#
+
+MDADM=/sbin/mdadm
+RUNDIR=/var/run/mdadm
+PIDFILE=$RUNDIR/monitor.pid
+DEBIANCONFIG=/etc/default/mdadm
+
+test -x "$MDADM" || exit 0
+
+test -f /proc/mdstat || exit 0
+
+START_DAEMON=true
+test -f $DEBIANCONFIG && . $DEBIANCONFIG
+
+. /lib/lsb/init-functions
+
+# Include functions
+. /etc/init.d/functions
+
+case "${1:-}" in
+  start)
+    if is_true $START_DAEMON; then
+      log_daemon_msg "Starting MD monitoring service" "mdadm --monitor"
+      mkdir -p $RUNDIR
+      start-stop-daemon -S -p $PIDFILE -x $MDADM -- \
+        --monitor --pid-file $PIDFILE --daemonise --scan ${DAEMON_OPTIONS:-}
+      RETVAL=$?
+      log_end_msg $RETVAL
+      exit $RETVAL
+    fi
+    ;;
+  stop)
+    if [ -f $PIDFILE ] ; then
+      log_daemon_msg "Stopping MD monitoring service" "mdadm --monitor"
+      start-stop-daemon -K -p $PIDFILE -x $MDADM
+      RETVAL=$?
+      rm -f $PIDFILE
+      log_end_msg $RETVAL
+      exit $RETVAL
+    fi
+    ;;
+  status)
+    status -p $PIDFILE "$MDADM" && exit 0 || exit $?
+    ;;
+  restart|reload|force-reload)
+    ${0:-} stop
+    ${0:-} start
+    ;;
+  *)
+    echo "Usage: ${0:-} {start|stop|status|restart|reload|force-reload}" >&2
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/meta/recipes-extended/mdadm/files/mdmonitor.service b/meta/recipes-extended/mdadm/files/mdmonitor.service
new file mode 100644
index 0000000..3664ceb
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdmonitor.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Software RAID monitoring and management
+After=syslog.target
+ConditionPathExists=@sysconfdir@/mdadm.conf
+
+[Service]
+Type=forking
+PIDFile=@localstatedir@/run/mdadm/mdadm.pid
+EnvironmentFile=-@sysconfdir@/sysconfig/mdmonitor
+ExecStart=@basesbindir@/mdadm --monitor --scan -f --pid-file=@localstatedir@/run/mdadm/mdadm.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
index 87e06f5..3e7e399 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
@@ -14,6 +14,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://inline.patch \
            file://run-ptest \
+           file://mdadm.init \
+           file://mdadm.default \
+           file://mdadm.conf \
+           file://mdmonitor.service \
 	  "
 
 SRC_URI[md5sum] = "44698d351501cac6a89072dc877eb220"
@@ -21,7 +25,7 @@ SRC_URI[sha256sum] = "0f3a7e1a76b13892b79f9fceaf99ecb23513260389a768ac644ffa3ae0
 
 CFLAGS += "-fno-strict-aliasing"
 
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
@@ -46,7 +50,31 @@ do_install() {
 	autotools_do_install
 }
 
-FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
+do_install_append() {
+	install -d ${D}/${sysconfdir}/
+	install -m 644 ${WORKDIR}/mdadm.conf ${D}${sysconfdir}/
+	install -d ${D}/${systemd_unitdir}/system
+	install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
+	sed -i -e 's,@basesbindir@,${base_sbindir},g' \
+		-e 's,@localstatedir@,${localstatedir},g' \
+		-e 's,@sysconfdir@,${sysconfdir},g' \
+		${D}/${systemd_unitdir}/system/mdmonitor.service
+	install -d ${D}/${localstatedir}
+	install -d ${D}/${localstatedir}/run
+	install -d -m 700 ${D}/${localstatedir}/run/mdadm
+
+	install -d ${D}/${sysconfdir}/init.d
+	install -d ${D}/${sysconfdir}/default
+	install -m 755 ${WORKDIR}/mdadm.init    ${D}${sysconfdir}/init.d/mdmonitor
+	install -m 755 ${WORKDIR}/mdadm.default ${D}${sysconfdir}/default/mdadm
+}
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules \
+                /run/mdadm \
+                ${systemd_unitdir} \
+               "
 
 inherit ptest
 
-- 
1.8.4.2


