Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E0E097CA2C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:06:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,394,1544457600"; d="scan'208";a="54862673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2019 15:06:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 03D3D4C4FA35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:06:13 +0800 (CST)
Received: from ubuntu.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 21 Feb 2019 15:06:29 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2019 14:06:27 -0800
Message-ID: <1550786787-29816-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 03D3D4C4FA35.A5BAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] mdadm: add init and service scripts
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
X-List-Received-Date: Thu, 21 Feb 2019 07:06:19 -0000
Content-Type: text/plain

Add init script and service file for sysvinit and systemd.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/mdadm.init       | 72 ++++++++++++++++++++++
 .../recipes-extended/mdadm/files/mdmonitor.service | 19 ++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           | 16 ++++-
 3 files changed, 106 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 7663a6b..2d7ade6 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -17,11 +17,16 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-Compute-abs-diff-in-a-standard-compliant-way.patch \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
+	   file://mdadm.init \
+	   file://mdmonitor.service \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep ptest systemd
+
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 CFLAGS_append_toolchain-clang = " -Wno-error=address-of-packed-member"
 
@@ -46,6 +51,15 @@ do_install() {
 	autotools_do_install
 }
 
+do_install_append() {
+        install -d ${D}/${sysconfdir}/
+        install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
+        install -d ${D}/${sysconfdir}/init.d
+        install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+}
+
 do_compile_ptest() {
 	oe_runmake test
 }
-- 
2.7.4




