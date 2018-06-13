Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13A9879091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:56:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5D7ugWM017375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:56:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 00:56:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 15:58:23 +0800
Message-ID: <5d9d2f58a18faa8c36d926a3a531b8c4e6dd9721.1528870775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528870775.git.Qi.Chen@windriver.com>
References: <cover.1528870775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] watchdog: fix init script for sysvinit
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
X-List-Received-Date: Wed, 13 Jun 2018 07:56:41 -0000
Content-Type: text/plain

The current init script is installed from source with redhat style.
It does not get configuration from /etc/default/watchdog. We should use
debian style init script.

Write our own script just like what wd_keepalive does.
Also, in the init script, we check the existence of /dev/watchdog to
determine whether to start the daemon or not.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../watchdog/watchdog/watchdog-init.patch          |  56 -----------
 .../watchdog/watchdog/watchdog.init                | 110 +++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |   6 +-
 3 files changed, 113 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog.init

diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch b/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
deleted file mode 100644
index b2765f1..0000000
--- a/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Signed-off-by: Diego Rondini <diego.ml@zoho.com>
-Upstream-Status: Inappropriate
-
---- watchdog-5.13.orig/redhat/watchdog.init	2014-11-12 17:18:39.125943000 +0100
-+++ watchdog-5.13/redhat/watchdog.init	2014-11-12 18:27:36.189943000 +0100
-@@ -7,7 +7,7 @@
- #                 Henning P. Schmiedehausen <hps@tanstaafl.de>
- 
- # Source function library.
--. /etc/rc.d/init.d/functions
-+. /etc/init.d/functions
- 
- [ -x /usr/sbin/watchdog -a -e /etc/watchdog.conf ] || exit 0
- 
-@@ -23,22 +23,22 @@
- 
- start() {
- 
--	echo -n $"Starting $prog: "
-+	echo -n "Starting $prog: "
- 	if [ -n "$(pidofproc $prog)" ]; then
--		echo -n $"$prog: already running"
--		echo_failure
-+		echo -n "$prog: already running "
-+		failure
- 		echo
- 		return 1
- 	fi
- 	if [ "$VERBOSE" = "yes" ]; then
--	    daemon /usr/sbin/${prog} -v
-+	    /usr/sbin/${prog} -v
- 	else
--	    daemon /usr/sbin/${prog}
-+	    /usr/sbin/${prog}
-         fi
- 	RETVAL=$?
- 	[ $RETVAL -eq 0 ] && touch $lockfile
--	[ $RETVAL -eq 0 ] && echo_success
--	[ $RETVAL -ne 0 ] && echo_failure
-+	[ $RETVAL -eq 0 ] && success
-+	[ $RETVAL -ne 0 ] && failure
- 	echo
- 	return $RETVAL
- }
-@@ -50,8 +50,10 @@
- 	# and reboot the box.
- 	killproc $prog -TERM
- 	RETVAL=$?
--	echo
- 	[ $RETVAL -eq 0 ] && rm -f $lockfile $pidfile
-+	[ $RETVAL -eq 0 ] && success
-+	[ $RETVAL -ne 0 ] && failure
-+	echo
- 	return $RETVAL
- }
- 
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog.init b/meta/recipes-extended/watchdog/watchdog/watchdog.init
new file mode 100644
index 0000000..d37107c
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog.init
@@ -0,0 +1,110 @@
+#!/bin/sh
+#/etc/init.d/watchdog: start watchdog daemon.
+
+### BEGIN INIT INFO
+# Provides:          watchdog
+# Short-Description: Start software watchdog daemon
+# Required-Start:    $all
+# Required-Stop:     $all
+# Should-Start:      
+# Should-Stop:       
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+### END INIT INFO
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+
+test -x /usr/sbin/watchdog || exit 0
+
+# For configuration of the init script use the file
+# /etc/default/watchdog, do not edit this init script.
+
+# Set run_watchdog to 1 to start watchdog or 0 to disable it.
+run_watchdog=0
+
+# Specify additional watchdog options here (see manpage).
+watchdog_options=""
+
+# Specify module to load
+watchdog_module="none"
+
+[ -e /etc/default/watchdog ] && . /etc/default/watchdog
+
+NAME=watchdog
+DAEMON=/usr/sbin/watchdog
+
+STOP_RETRY_SCHEDULE='TERM/10/forever/KILL/1'
+
+. /etc/init.d/functions
+
+# Mock Debian stuff
+log_begin_msg() {
+    echo -n $*
+}
+
+log_end_msg() {
+    if [ "$1" = "0" ]; then
+        echo 'done'
+    else
+        echo 'error'
+    fi
+}
+
+log_daemon_msg() {
+    echo $*
+}
+
+log_progress_msg() {
+    echo $*
+}
+
+case "$1" in
+  start)
+    if [ $run_watchdog = 1 ]
+    then
+    	# do we have to load a module?
+	[ "${watchdog_module:-none}" != "none" ] && /sbin/modprobe $watchdog_module
+
+	# Check /dev/watchdog here because if it does not exist after module loading,
+	# it makes no sense to start the daemon
+	test -e /dev/watchdog || { log_daemon_msg "daemon not start due to lack of /dev/watchdog"; exit 0; }
+
+	log_begin_msg "Starting watchdog daemon..."
+	start-stop-daemon --start --quiet --pidfile /var/run/$NAME.pid \
+             --exec $DAEMON -- $watchdog_options
+	log_end_msg $?
+    fi
+    ;;
+
+  stop)
+    if [ $run_watchdog = 1 ]
+    then
+	log_begin_msg "Stopping watchdog daemon..."
+	start-stop-daemon --stop --quiet --retry $STOP_RETRY_SCHEDULE \
+	    --pidfile /var/run/$NAME.pid
+	
+    fi
+    ;;
+
+  restart)
+    $0 force-reload
+    ;;
+
+  force-reload)
+    if [ $run_watchdog = 0 ]; then exit 0; fi
+    log_daemon_msg "Restarting $NAME"
+    $0 stop
+    $0 start
+    ;;
+
+  status)
+    status "$DAEMON"
+    ;;
+
+  *)
+    echo "Usage: /etc/init.d/watchdog {start|stop|restart|force-reload|status}"
+    exit 1
+
+esac
+
+exit 0
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 8353ec0..1acab2e 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch \
            file://0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch \
-           file://watchdog-init.patch \
+           file://watchdog.init \
            file://wd_keepalive.init \
 "
 
@@ -31,7 +31,7 @@ EXTRA_OECONF += " --disable-nfs "
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
-INITSCRIPT_NAME_${PN} = "watchdog.sh"
+INITSCRIPT_NAME_${PN} = "watchdog"
 INITSCRIPT_PARAMS_${PN} = "start 25 1 2 3 4 5 . stop 85 0 6 ."
 
 INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
@@ -49,7 +49,7 @@ do_install_append() {
 	install -m 0644 ${S}/debian/watchdog.service ${D}${systemd_system_unitdir}
 	install -m 0644 ${S}/debian/wd_keepalive.service ${D}${systemd_system_unitdir}
 
-	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
+	install -Dm 0755 ${WORKDIR}/watchdog.init ${D}/${sysconfdir}/init.d/watchdog
 	install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
 
 	# watchdog.conf is provided by the watchdog-config recipe
-- 
1.9.1


