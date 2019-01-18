Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E5BEE7997F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 03:07:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="52265946"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2019 11:07:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 104584BAD9C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 11:07:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 18 Jan 2019 11:07:51 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2019 11:08:20 +0800
Message-ID: <20190118030821.11213-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 104584BAD9C6.A00A6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mdadm: add init and service scripts
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
X-List-Received-Date: Fri, 18 Jan 2019 03:07:52 -0000
Content-Type: text/plain

Add init script and service file for sysvinit and systemd.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/mdadm.init | 72 ++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb     | 22 +++++-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.init

diff --git a/meta/recipes-extended/mdadm/files/mdadm.init b/meta/recipes-extended/mdadm/files/mdadm.init
new file mode 100644
index 0000000000..cab91b9acc
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
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 7663a6b7ec..d71e9a708b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -17,11 +17,15 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-Compute-abs-diff-in-a-standard-compliant-way.patch \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
+	   file://mdadm.init \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep ptest systemd
+
+SYSTEMD_SERVICE_${PN} = "mdmonitor.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 CFLAGS_append_toolchain-clang = " -Wno-error=address-of-packed-member"
 
@@ -46,6 +50,18 @@ do_install() {
 	autotools_do_install
 }
 
+do_install_append() {
+    install -d ${D}/${sysconfdir}/
+    install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+                install -d ${D}/${systemd_unitdir}/system
+                install -m 644 ${S}/systemd/mdmonitor.service ${D}/${systemd_unitdir}/system
+    fi
+
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/mdadm.init    ${D}${sysconfdir}/init.d/mdmonitor
+}
+
 do_compile_ptest() {
 	oe_runmake test
 }
@@ -61,6 +77,10 @@ do_install_ptest() {
 	done
 }
 
++FILES_${PN} += " \
+    ${systemd_unitdir} \
+"
+
 RDEPENDS_${PN}-ptest += "bash"
 RRECOMMENDS_${PN}-ptest += " \
     coreutils \
-- 
2.17.2




