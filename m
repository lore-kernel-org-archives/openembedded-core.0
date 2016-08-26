Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 26DA777074
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 19:56:02 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r128so6424679qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ImgQ0rVk2sCtrLefc2EUUbrjONE2uT3EaVPwK0ox8cY=;
	b=AMCTDXv/ef/DwvqZcI6+NPCWaiP+XVJ75584imvEOj/IWR8K14TgfYKg6qldfG2Yz7
	gK3LSFfwMi23v0CEr1O5N7hQPitm0YzwmA0ohf7AABnNQLinRj0ismHMYfS9xoMIG5kG
	Oo7YBzB/BxxY4b2bB2MFYE2UowBkJs6jLUztA/ghVsl2td9pzk0bBbB1yK5aHrnjmSBF
	CGFve+PgKVJpaF6pxreTuRDgHlUuUAkSvJjG7d7iiTNacPocelOHv1tgWrEDUo9qY6E6
	k9YjLjJBKbC6IzWOnqKK4OTWN8JpbYGloe3ZdM4kPZyrTguUOKjNc0DYcUhyC1GMf3gJ
	gEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ImgQ0rVk2sCtrLefc2EUUbrjONE2uT3EaVPwK0ox8cY=;
	b=OVY4iqKK1O8+jG4lnrXG2mQVLXbIlUpBVk7nLvpTwHM9y+BveIw9DzNzIJpQmeR7D8
	3vJCuVln97vQ1pmPtRaEgv5UAeZnWzdlieWx1NRUcjDgeRnXfIO9kJsyASuT2rRDPj4h
	nHQelpCCQbkUgBMVva8c8WosOIOrk6I4yNM2YJQ+9SFsTZx9Nj1uJPWohMJlsVdG38no
	T0pcRgAXmJRHPgL0C++PMNeYxfFQ57BwbORdNRoqfa7964eY2g9pO9iaw5izqfNW92qk
	rGophHxLJlzjVDRWLg0Cj9rw32aGC2zvrH2ddCE3JSyspsQ5Cmsc06S7CLXuVzNbopaK
	69gg==
X-Gm-Message-State: AE9vXwMLGdKf6yC/EnhTGTZBKGOkXD16l+2lzjqX8MIRBo9ZdCBPYXaepkEBb06u350RTg==
X-Received: by 10.55.153.68 with SMTP id b65mr5665950qke.54.1472241363165;
	Fri, 26 Aug 2016 12:56:03 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	e33sm11237486qta.47.2016.08.26.12.55.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Aug 2016 12:56:02 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 16:55:01 -0300
Message-Id: <1472241302-7437-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] watchdog: Add wd_keepalive package
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
X-List-Received-Date: Fri, 26 Aug 2016 19:56:03 -0000

This is a simplified version of the watchdog daemon. It only opens
/dev/watchdog, and keeps writing to it often enough to keep the kernel
from resetting, at least once per minute. Each write delays the reboot
time another minute. After a minute of inactivity the watchdog hardware
will cause a reset. In the case of the software watchdog the ability to
reboot will depend on the state of the machines and interrupts.

Installs wd_keepalive binary and enable initscript.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../watchdog/watchdog/wd_keepalive.init            | 121 +++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |  23 +++-
 2 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/wd_keepalive.init

diff --git a/meta/recipes-extended/watchdog/watchdog/wd_keepalive.init b/meta/recipes-extended/watchdog/watchdog/wd_keepalive.init
new file mode 100644
index 0000000..1d3e4c5
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/wd_keepalive.init
@@ -0,0 +1,121 @@
+#!/bin/sh
+#/etc/init.d/wd_keepalive: start wd_keepalive daemon.
+
+### BEGIN INIT INFO
+# Provides:          wd_keepalive
+# Short-Description: Start watchdog keepalive daemon
+# Required-Start:    $remote_fs
+# Required-Stop:     $remote_fs
+# X-Start-Before:    $all
+# Default-Start:     2 3 4 5
+# Default-Stop
+### END INIT INFO
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+
+test -x /usr/sbin/wd_keepalive || exit 0
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
+NAME=wd_keepalive
+DAEMON=/usr/sbin/wd_keepalive
+
+STOP_RETRY_SCHEDULE='TERM/10/forever/KILL/1'
+
+# . /lib/lsb/init-functions
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
+
+case "$1" in
+  start)
+    if [ $run_watchdog = 1 ]
+    then
+        [ ${watchdog_module:-none} != "none" ] && /sbin/modprobe $watchdog_module
+	echo -n "Starting watchdog keepalive daemon: "
+	if start-stop-daemon --start --quiet \
+	    --exec $DAEMON -- $watchdog_options
+	then
+	    echo wd_keepalive.
+	else
+	    echo
+	fi
+    fi
+    ;;
+
+  stop)
+    if [ $run_watchdog = 1 ]
+    then
+	echo -n "Stopping watchdog keepalive daemon: "
+	if start-stop-daemon --stop --quiet --pidfile /var/run/$NAME.pid \
+	    $STOP_RETRY_SCHEDULE
+	then
+	    echo wd_keepalive.
+	else
+	    echo
+	fi
+    fi
+    ;;
+
+  status)
+    status_of_proc "$DAEMON" "$NAME" && exit 0 || exit $?
+    ;;
+
+  restart)
+    $0 force-reload
+    ;;
+
+  force-reload)
+    if [ $run_watchdog = 0 ]; then exit 0; fi
+    echo -n "Restarting $NAME daemon."
+    start-stop-daemon --stop --quiet --pidfile /var/run/$NAME.pid \
+	$STOP_RETRY_SCHEDULE
+    echo -n "."
+    if start-stop-daemon --start --quiet --pidfile /var/run/$NAME.pid \
+	--exec $DAEMON -- $watchdog_options
+    then
+	echo "done."
+    else
+	echo
+    fi
+    ;;
+
+  *)
+    echo "Usage: /etc/init.d/wd_keepalive {start|stop|status|restart|force-reload}"
+    exit 1
+
+esac
+
+exit 0
+
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index ee1a893..1c0049c 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch \
            file://watchdog-init.patch \
            file://watchdog-conf.patch \
+           file://wd_keepalive.init \
 "
 
 SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
@@ -28,11 +29,27 @@ CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
 LDFLAGS_append_libc-musl = " -ltirpc "
 EXTRA_OECONF_append_libc-musl = " --disable-nfs "
 
-INITSCRIPT_NAME = "watchdog.sh"
-INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
+INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
-RRECOMMENDS_${PN} = "kernel-module-softdog"
+INITSCRIPT_NAME_${PN} = "watchdog.sh"
+INITSCRIPT_PARAMS_${PN} = "start 15 1 2 3 4 5 . stop 85 0 6 ."
+
+INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
+INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
 do_install_append() {
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
+    install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
 }
+
+PACKAGES =+ "${PN}-keepalive"
+
+FILES_${PN}-keepalive = " \
+    ${sysconfdir}/init.d/wd_keepalive \
+    ${sbindir}/wd_keepalive \
+"
+
+RDEPENDS_${PN} += "${PN}-keepalive"
+
+RRECOMMENDS_${PN} = "kernel-module-softdog"
+
-- 
2.1.4


