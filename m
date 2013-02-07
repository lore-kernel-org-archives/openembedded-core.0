Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bCl-00056o-ST
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:48:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NWinP006318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:32:44 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:32:41 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:59:32 -0600
Message-ID: <e76b5adae5d49ea02d05a888a4c401623661fcc4.1360270256.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270255.git.mark.hatle@windriver.com>
References: <cover.1360270255.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 11/11] udev: Add start/stop/status/restart support to init script
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
X-List-Received-Date: Thu, 07 Feb 2013 23:48:39 -0000
Content-Type: text/plain

From: Jesse Zhang <sen.zhang@windriver.com>

[ CQID: WIND00388860 ]

Add the ability to use "stop", "start", "restart" and "status"
with the udev initscript.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/udev/udev/init   | 113 +++++++++++++++++++++----------------
 meta/recipes-core/udev/udev_182.bb |   2 +-
 2 files changed, 65 insertions(+), 50 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 1934d11..8ac1ff7 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -9,6 +9,8 @@
 # Short-Description: Start udevd, populate /dev and load drivers.
 ### END INIT INFO
 
+. /etc/init.d/functions
+
 export TZ=/etc/localtime
 
 [ -d /sys/class ] || exit 1
@@ -27,60 +29,73 @@ readfile () {
    fi
 }
 
-kill_udevd() {
-	pid=`pidof -x udevd`
-	[ -n "$pid" ] && kill $pid
-}
-
-export ACTION=add
-# propagate /dev from /sys
-echo "Starting udev"
-
-# mount the tmpfs on /dev, if not already done
-LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
-	mount -n -o mode=0755 -t tmpfs none "/dev"
-}
-[ -e /dev/pts ] || mkdir -m 0755 /dev/pts
-[ -e /dev/shm ] || mkdir -m 1777 /dev/shm
-mount -a -t tmpfs 2>/dev/null
-mkdir -p /var/volatile/run
+case "$1" in
+  start)
+    export ACTION=add
+    # propagate /dev from /sys
+    echo "Starting udev"
 
-# cache handling
-if [ "$DEVCACHE" != "" ]; then
-	readfile /proc/version
-	VERSION="$READDATA"
-	readfile /proc/cmdline
-	CMDLINE="$READDATA"
-	readfile /proc/devices
-	DEVICES="$READDATA"
-	readfile /proc/atags
-	ATAGS="$READDATA"
+    # mount the tmpfs on /dev, if not already done
+    LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
+            mount -n -o mode=0755 -t tmpfs none "/dev"
+    }
+    [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
+    [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
+    mount -a -t tmpfs 2>/dev/null
+    mkdir -p /var/volatile/run
 
-	if [ -e $DEVCACHE ]; then
-		readfile /etc/udev/cache.data
-		if [ "$READDATA" = "$VERSION$CMDLINE$DEVICES$ATAGS" ]; then
-			(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
-			not_first_boot=1
-		fi
+    # cache handling
+    if [ "$DEVCACHE" != "" ]; then
+            readfile /proc/version
+            VERSION="$READDATA"
+            readfile /proc/cmdline
+            CMDLINE="$READDATA"
+            readfile /proc/devices
+            DEVICES="$READDATA"
+            readfile /proc/atags
+            ATAGS="$READDATA"
 
-		echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
-	fi
-fi
+            if [ -e $DEVCACHE ]; then
+                    readfile /etc/udev/cache.data
+                    if [ "$READDATA" = "$VERSION$CMDLINE$DEVICES$ATAGS" ]; then
+                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+                            not_first_boot=1
+                    fi
 
-# make_extra_nodes
-kill_udevd > "/dev/null" 2>&1
+                    echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
+            fi
+    fi
 
-# trigger the sorted events
-echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-/lib/udev/udevd -d
+    # make_extra_nodes
+    killproc udevd > "/dev/null" 2>&1
 
-/usr/bin/udevadm control --env=STARTUP=1
-if [ "$not_first_boot" != "" ];then
-	/usr/bin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
-	(/usr/bin/udevadm settle --timeout=3; /usr/bin/udevadm control --env=STARTUP=)&
-else
-	/usr/bin/udevadm trigger --action=add
-	/usr/bin/udevadm settle
-fi
+    # trigger the sorted events
+    echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+    /lib/udev/udevd -d
 
+    /usr/sbin/udevadm control --env=STARTUP=1
+    if [ "$not_first_boot" != "" ];then
+            /usr/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
+            (/usr/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
+    else
+            /usr/sbin/udevadm trigger --action=add
+            /usr/sbin/udevadm settle
+    fi
+    ;;
+  stop)
+    echo "Stopping udevd"
+    start-stop-daemon --stop --name udevd --quiet
+    ;;
+  restart)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  status)
+    status udevd
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|status|restart}"
+    exit 1
+esac
 exit 0
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index cf0f126..56d412e 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r4"
+PR = "r5"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.8.1.2.545.g2f19ada



