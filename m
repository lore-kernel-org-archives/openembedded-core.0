Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DD9447CB5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:06:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,394,1544457600"; d="scan'208";a="54862704"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2019 15:06:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4B4A44C4BB93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:06:21 +0800 (CST)
Received: from ubuntu.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 21 Feb 2019 15:06:38 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2019 14:06:42 -0800
Message-ID: <1550786802-29862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 4B4A44C4BB93.A7384
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2][thud] mdadm: add init and service scripts
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
X-List-Received-Date: Thu, 21 Feb 2019 07:06:29 -0000
Content-Type: text/plain

Add init script and service file for sysvinit and systemd.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/mdadm.init       | 72 ++++++++++++++++++++++
 .../recipes-extended/mdadm/files/mdmonitor.service | 19 ++++++
 meta/recipes-extended/mdadm/mdadm_4.0.bb           | 17 ++++-
 3 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.init
 create mode 100644 meta/recipes-extended/mdadm/files/mdmonitor.service

diff --git a/meta/recipes-extended/mdadm/files/mdadm.init b/meta/recipes-extended/mdadm/files/mdadm.init
new file mode 100644
index 0000000..cab91b9
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm.init
@@ -0,0 +1,72 @@
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
+
diff --git a/meta/recipes-extended/mdadm/files/mdmonitor.service b/meta/recipes-extended/mdadm/files/mdmonitor.service
new file mode 100644
index 0000000..bd243b4
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdmonitor.service
@@ -0,0 +1,19 @@
+#  This file is part of mdadm.
+#
+#  mdadm is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+
+[Unit]
+Description=Software RAID monitoring and management
+ConditionPathExists=/etc/mdadm.conf
+
+[Service]
+Type=forking
+PIDFile=/var/run/mdadm/mdadm.pid
+EnvironmentFile=-/etc/sysconfig/mdmonitor
+ExecStart=/sbin/mdadm --monitor --scan -f --pid-file=/var/run/mdadm/mdadm.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 2c4d88a..8155ae4 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -24,12 +24,14 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch \
            file://0001-Disable-gcc8-warnings.patch \
+           file://mdadm.init \
+           file://mdmonitor.service \
            "
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
 
 CFLAGS += "-fno-strict-aliasing"
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
 
 EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
@@ -51,7 +53,17 @@ do_install() {
 	autotools_do_install
 }
 
-inherit ptest
+do_install_append() {
+    install -d ${D}/${sysconfdir}/
+    install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
+    install -d ${D}/${systemd_unitdir}/system
+    install -m 644 ${S}/systemd/mdmonitor.service ${D}/${systemd_unitdir}/system
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/mdadm.init    ${D}${sysconfdir}/init.d/mdmonitor
+}
+
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 do_compile_ptest() {
 	oe_runmake test
@@ -67,6 +79,7 @@ do_install_ptest() {
 		install -D -m 755 $prg ${D}${PTEST_PATH}/
 	done
 }
+
 RDEPENDS_${PN}-ptest += "bash"
 RRECOMMENDS_${PN}-ptest += " \
     coreutils \
-- 
2.7.4




