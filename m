Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ek-0007hn-1e
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:49 +0100
Received: by mail-wg0-f52.google.com with SMTP id 15so3392510wgd.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=SDeLtwss4ux9kEPf4q3idkITa19B90gk0PyZC8WFpQI=;
	b=b1U8TsxkGL2/nTrJpskDQa3W6gl4qjuVbwm/YcWmAg0NkS5LxQdLsBBu/ohDmfqOrB
	jZlqiDmF1TFj/iPp5Ck1mmuVOekqR3JUFRkiMKkby9R0txu/XsoZmCSyNw0RO8EhJ0ru
	j3ZYLNOdzlkBIXBquxKYP2xTjEVvcCr/bheDBrKG1bpXDJuwLazOaDSkcVh6KosqOlqp
	L1s2/gJkNOfEj4Iet0MB5kvxcT39Ds7Jr90cv0qtcsJ85UW8otEgsdSk8h7JLWpnd2b/
	Eaqvp+RLpPwKlG8IRjnhi0sTTc91w/UV9eXHHcCWdhOyQQNqELWTATEYVvmmkksUS3VF
	VPAQ==
X-Received: by 10.194.92.65 with SMTP id ck1mr4682991wjb.54.1363974108207;
	Fri, 22 Mar 2013 10:41:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.47
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:33 +0000
Message-Id: <c078935b2a8408a012210365f4e07524e5866167.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnA+4m3Wn9c6q40xxIerYzLnTjRuEC9OdT182xnaMpc8NyAOU8hC8CQYFCMDSPzxh7RpXAN
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/22] systemd: add udev init script for hybrid sysvinit/systemd usage
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:39 -0000
X-List-Received-Date: Fri, 22 Mar 2013 17:59:39 -0000

With both sysvinit and systemd features it's possible to use systemd's udev with
sysvinit, so add the required init script.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd/init   |  101 ++++++++++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb |   13 +++-
 2 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/init

diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
new file mode 100644
index 0000000..0ddd043
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
+[ -x /lib/systemd/systemd-udevd ] || exit 1
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
+    killproc systemd-udevd > "/dev/null" 2>&1
+
+    # trigger the sorted events
+    echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+    /lib/systemd/systemd-udevd -d
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
index a006ec8..d07fa95 100644
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
@@ -100,6 +101,11 @@ do_install() {
 	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
+	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
+	fi
 }
 
 python populate_packages_prepend (){
@@ -210,6 +216,7 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/8*.rules \
                /lib/udev/rules.d/95*.rules \
                ${sysconfdir}/udev \
+               ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
                ${systemd_unitdir}/system/*.wants/*udev* \
               "
@@ -221,6 +228,10 @@ FILES_udev-utils = "${bindir}/udevadm"
 
 FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
 
+INITSCRIPT_PACKAGES = "udev"
+INITSCRIPT_NAME_udev = "systemd-udevd"
+INITSCRIPT_PARAMS_udev = "start 03 S ."
+
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.10.4



