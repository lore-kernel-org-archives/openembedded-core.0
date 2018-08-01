Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7238978E29
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 10:03:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42919935"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Aug 2018 18:03:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 23A664B6ADE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 18:03:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 1 Aug 2018 18:03:03 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Aug 2018 02:41:57 +0800
Message-ID: <1533148917-6829-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 23A664B6ADE8.A86DE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mdadm: add init and systemd service scripts
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
X-List-Received-Date: Wed, 01 Aug 2018 10:03:13 -0000
Content-Type: text/plain

Add init script and service file for sysvinit and systemd.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-extended/mdadm/files/mdadm.conf.sample |  1 +
 meta/recipes-extended/mdadm/files/mdadm.default    | 25 ++++++++
 meta/recipes-extended/mdadm/files/mdadm.init       | 71 ++++++++++++++++++++++
 .../recipes-extended/mdadm/files/mdmonitor.service | 15 +++++
 meta/recipes-extended/mdadm/mdadm_4.0.bb           | 28 ++++++++-
 5 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.conf.sample
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.default
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.init
 create mode 100644 meta/recipes-extended/mdadm/files/mdmonitor.service

diff --git a/meta/recipes-extended/mdadm/files/mdadm.conf.sample b/meta/recipes-extended/mdadm/files/mdadm.conf.sample
new file mode 100644
index 0000000..b869d8f
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm.conf.sample
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
new file mode 100644
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
index 0000000..cd6c865
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdmonitor.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Software RAID monitoring and management
+After=syslog.target
+ConditionPathExists=/etc/mdadm.conf
+
+[Service]
+Type=forking
+RuntimeDirectory=/run/mdadm
+PIDFile=/run/mdadm/mdadm.pid
+EnvironmentFile=-/etc/sysconfig/mdmonitor
+ExecStart=/sbin/mdadm --monitor --scan -f --pid-file=/run/mdadm/mdadm.pid
+ExecStopPost=/bin/rm -rf /run/mdadm/mdadm.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 226b974..bd3f710 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -24,12 +24,20 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch \
            file://0001-Disable-gcc8-warnings.patch \
+           file://mdadm.init \
+           file://mdadm.default \
+           file://mdadm.conf.sample \
+           file://mdmonitor.service \
            "
+
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
 
 CFLAGS += "-fno-strict-aliasing"
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
+
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
@@ -51,6 +59,20 @@ do_install() {
 	autotools_do_install
 }
 
+do_install_append() {
+    install -d ${D}/${sysconfdir}/
+    install -m 644 ${WORKDIR}/mdadm.conf.sample ${D}${sysconfdir}/mdadm.conf
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+                install -d ${D}/${systemd_unitdir}/system
+                install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
+    fi
+
+    install -d ${D}/${sysconfdir}/init.d
+    install -d ${D}/${sysconfdir}/default
+    install -m 755 ${WORKDIR}/mdadm.init    ${D}${sysconfdir}/init.d/mdmonitor
+    install -m 755 ${WORKDIR}/mdadm.default ${D}${sysconfdir}/default/mdadm
+}
+
 inherit ptest
 
 do_compile_ptest() {
@@ -78,3 +100,7 @@ RRECOMMENDS_${PN}-ptest += " \
     kernel-module-raid10 \
     kernel-module-raid456 \
 "
+
+FILES_${PN} += " \
+    ${systemd_unitdir} \
+"
-- 
2.7.4




