Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9HH-0002to-EJ
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:25:03 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so4106802pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=ghD8RvB2HoXkdEMtobSzS4E3PyPxFkISLtuGNvM9o+E=;
	b=lVECZUneds6RNkzSuIw1ohuB1y/65ov9c3ZjJvFbADc3nXtOLbjW+8k7UUfKsl4xgp
	9VkRjyM0k+qpAt1LXzrf6tfMQVWXHYLMUn7Hd5a2MRtIMEsctTI4Rwvur5XiVdCF24kL
	gN5cthmSp4kqELxus/Af4YkuYmFp85EDjfSXXCfhDTN83tKSGtsWzRJfb869gLbPJtj/
	FNjrZEQ9He7irJByZb7W2oJIG0W2edULhqyMHX4wzJytY2Pm76SVpctue51Yk00CF9PC
	8XACI+HEknINLmgFZDgh2ZIFl7vMXcOq6AYY90PapMp207q8bIaTyfe/sPaT9frWfBDz
	MSSw==
X-Received: by 10.68.136.97 with SMTP id pz1mr30682410pbb.205.1363032499868;
	Mon, 11 Mar 2013 13:08:19 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.08.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:37 -0700
Message-Id: <d770c632e670e7fe93fbe49561f719bc4546451b.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnxvLN94Ctyapdk6YHj2SyCesjDf5eVWsompKwlJLxo23c3EDYFjqZ4RcbqPFF0PxV+6GEh
Subject: [PATCH 7/9] systemd: add udev init script for hybrid sysvinit/systemd usage
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
X-List-Received-Date: Mon, 11 Mar 2013 20:25:33 -0000

If a distro is built with both sysvinit and systemd then we may be booting
systemd's udev on sysvinit, so add a sysvinit-style init script for udev (copied
from udev).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd/init   |  101 ++++++++++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb |   13 +++-
 2 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/init

diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
new file mode 100644
index 0000000..be3c379
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/init
@@ -0,0 +1,101 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides:          udev
+# Required-Start:    mountvirtfs
+# Required-Stop:
+# Default-Start:     S
+# Default-Stop:
+# Short-Description: Start udevd, populate /dev and load drivers.
+### END INIT INFO
+
+. /etc/init.d/functions
+
+export TZ=/etc/localtime
+
+[ -d /sys/class ] || exit 1
+[ -r /proc/mounts ] || exit 1
+[ -x /lib/udev/udevd ] || exit 1
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
+[ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
+
+readfile () {
+   filename=$1
+   READDATA=""
+   if [ -r $filename ]; then
+       while read line; do
+           READDATA="$READDATA$line"
+       done < $filename
+   fi
+}
+
+case "$1" in
+  start)
+    export ACTION=add
+    # propagate /dev from /sys
+    echo "Starting udev"
+
+    # mount the tmpfs on /dev, if not already done
+    LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
+            mount -n -o mode=0755 -t tmpfs none "/dev"
+    }
+    [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
+    [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
+    mount -a -t tmpfs 2>/dev/null
+    mkdir -p /var/volatile/run
+
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
+
+            if [ -e $DEVCACHE ]; then
+                    readfile /etc/udev/cache.data
+                    if [ "$READDATA" = "$VERSION$CMDLINE$DEVICES$ATAGS" ]; then
+                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+                            not_first_boot=1
+                    fi
+
+                    echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
+            fi
+    fi
+
+    # make_extra_nodes
+    killproc udevd > "/dev/null" 2>&1
+
+    # trigger the sorted events
+    echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+    /lib/udev/udevd -d
+
+    /usr/bin/udevadm control --env=STARTUP=1
+    if [ "$not_first_boot" != "" ];then
+            /usr/bin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
+            (/usr/bin/udevadm settle --timeout=3; /usr/bin/udevadm control --env=STARTUP=)&
+    else
+            /usr/bin/udevadm trigger --action=add
+            /usr/bin/udevadm settle
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
+exit 0
diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 9a66a4e..50d052f 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -16,7 +16,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
@@ -26,6 +26,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://00-create-volatile.conf \
            file://0001-systemd-analyze-rewrite-in-C.patch \
            file://udev-linkage.patch \
+           file://init \
           "
 SRC_URI[md5sum] = "56a860dceadfafe59f40141eb5223743"
 SRC_URI[sha256sum] = "e6857ea21ae24d7056e7b0f4c2aaaba73b8bf57025b8949c0a8af0c1bc9774b5"
@@ -101,6 +102,11 @@ do_install() {
 	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
+	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
+	fi
 }
 
 python populate_packages_prepend (){
@@ -212,6 +218,7 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/95*.rules \
                ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
+               ${sysconfdir}/init.d/udev \
                ${systemd_unitdir}/system/*udev* \
                ${systemd_unitdir}/system/*.wants/*udev* \
               "
@@ -221,6 +228,10 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${bindir}/udevadm"
 
+INITSCRIPT_PACKAGES = "udev"
+INITSCRIPT_NAME_udev = "udev"
+INITSCRIPT_PARAMS_udev = "start 03 S ."
+
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.10.4



