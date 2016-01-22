Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 353F276E70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:49:17 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id o6so33577517qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9x/ThBAXouGi5fBRejNLte8UBVFXryR3/oHWbAF1oYY=;
	b=BaSLB1cK0Z/cBxdJZZ6ssEu2NUFXDqpsxtfEKtu/TmBQBcUVLfxL/w9y7eoclHhfRD
	l3XmnKg0GvFPCrFxbBLKrqwf3n+cQAKQ8Mxq0t05C1QfbuhsaUYwPq4HO3jRIBKkr5Y6
	VpCi0QlNBBf9ra1inLfF8yEnJ2WAsMO6oB552qxpcfDDJN+xIaKN2AAwmH+JOGl9mddG
	Cw86azgCZMs7jHtca06yZYM3c8YKwgWS82FMKrKHDTY5TRTcLPwBzm3vCbZ+6/7xPCHs
	2ZRVbvVt5UGAoTkiNVkX4290KZYIEQzElogQxBdZvAtTg0KTP3iaUngMQgOvBefz7QwE
	9Xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9x/ThBAXouGi5fBRejNLte8UBVFXryR3/oHWbAF1oYY=;
	b=kRbN5lCS18IV5M3ZIsFmdG0Q4sodfeMEFAPP0rB4C0qtHJ5v9O9V8JsYRnnIF8XJkV
	vAHly1TE2MkXerfRVn9ZZtJAwEDxJTVLjLA7Z4C1J6oC1clMHv3fYhfNylpyfPKj2jn7
	+jRGnxHq9xJIP7c8Ij28qIrwoVLJeWwkNcTwXDLCTq2LjcDsGfXtuWN6AgATAa5Nk/Pb
	9gXK9q23p37U+GE+pmLe6NkE7bihzwplmwHOiKYbomm3kbXNve0ocU0qfH36UeP1fHcB
	lDCtyk3LAtdREWUx77MY3s6mzds4eV9yejfwhm/JTgIhqAP1T1v2KycWlny3xPvJIrmp
	khcA==
X-Gm-Message-State: AG10YOS3GcyDZEnFUdrduPNo3tOTaIHLia9LWuYeBLUsosu+5VlJf+/T/qASjzc/ONVkBw==
X-Received: by 10.55.204.80 with SMTP id r77mr6537245qki.25.1453495758381;
	Fri, 22 Jan 2016 12:49:18 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	j23sm3486276qge.23.2016.01.22.12.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 12:49:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 20:49:09 +0000
Message-Id: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] busybox: Add support for busybox-init
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
X-List-Received-Date: Fri, 22 Jan 2016 20:49:20 -0000

in config metadata we can configure busybox based init and device
initializer ( mdev ) using e.g.

VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
VIRTUAL-RUNTIME_login_manager = "busybox"
VIRTUAL-RUNTIME_init_manager = "busybox"
VIRTUAL-RUNTIME_initscripts = "initscripts"
VIRTUAL-RUNTIME_keymaps = "keymaps"
DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"

busybox can be used to provide init system
combined with mdev it makes it a complete init
system for really tiny systems.

This patch uses above defines to configure features in busybox to enable
the init system and mdev in a configurable manner

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 15 +++++++++++++++
 meta/recipes-core/busybox/busybox/init.cfg  |  3 +++
 meta/recipes-core/busybox/busybox/mdev.cfg  | 11 +++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb |  6 ++++++
 meta/recipes-core/busybox/files/inittab     | 24 ++++++++++++++++++++++++
 meta/recipes-core/busybox/files/rcK         | 25 +++++++++++++++++++++++++
 meta/recipes-core/busybox/files/rcS         | 26 ++++++++++++++++++++++++++
 meta/recipes-core/busybox/files/runlevel    | 11 +++++++++++
 8 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/init.cfg
 create mode 100644 meta/recipes-core/busybox/busybox/mdev.cfg
 create mode 100644 meta/recipes-core/busybox/files/inittab
 create mode 100644 meta/recipes-core/busybox/files/rcK
 create mode 100644 meta/recipes-core/busybox/files/rcS
 create mode 100644 meta/recipes-core/busybox/files/runlevel

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 9541123..e5710f0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -275,6 +275,21 @@ do_install () {
                        install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
                fi
 	fi
+        if grep "CONFIG_INIT=y" ${B}/.config; then
+                install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
+                install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
+                install -D -m 0755 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel
+                if grep "CONFIG_FEATURE_USE_INITTAB=y" ${B}/.config; then
+                        install -D -m 0777 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
+                        tmp="${SERIAL_CONSOLES}"
+                        for i in $tmp
+                        do
+                                j=`echo ${i} | sed s/\;/\ /g`
+                                label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
+                                echo "tty$label::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+                        done
+                fi
+        fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core/busybox/busybox/init.cfg
new file mode 100644
index 0000000..006d4c6
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/init.cfg
@@ -0,0 +1,3 @@
+CONFIG_INIT=y
+CONFIG_FEATURE_USE_INITTAB=y
+
diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
new file mode 100644
index 0000000..6aefe90
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/mdev.cfg
@@ -0,0 +1,11 @@
+CONFIG_MDEV=y
+CONFIG_FEATURE_MDEV_CONF=y
+CONFIG_FEATURE_MDEV_RENAME=y
+CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
+CONFIG_FEATURE_MDEV_EXEC=y
+CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
+
+CONFIG_SETSID=y
+CONFIG_CTTYHACK=y
+
+CONFIG_FEATURE_SHADOWPASSWDS=y
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 5e19d9c..8adee53 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -39,6 +39,12 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://sha256sum.cfg \
            file://getopts.cfg \
            file://resize.cfg \
+           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'busybox')]} \
+           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) == 'busybox-mdev')]} \
+           file://inittab \
+           file://rcS \
+           file://rcK \
+           file://runlevel \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
diff --git a/meta/recipes-core/busybox/files/inittab b/meta/recipes-core/busybox/files/inittab
new file mode 100644
index 0000000..bfec4a7
--- /dev/null
+++ b/meta/recipes-core/busybox/files/inittab
@@ -0,0 +1,24 @@
+# This is run first except when booting in single-user mode.
+
+# Startup the system
+null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mount -t sysfs sysfs /sys
+null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
+null::sysinit:/bin/mount -o remount,rw /
+null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mount -t devpts devpts /dev/pts
+null::sysinit:/bin/mount -a
+
+::sysinit:/etc/init.d/rcS
+
+# Stuff to do before rebooting
+::ctrlaltdel:/sbin/reboot
+::shutdown:/etc/init.d/rcK
+::shutdown:/sbin/swapoff -a
+::shutdown:/bin/umount -a -r
+
+# Stuff to do when restarting the init process
+::restart:/sbin/init
+
+# set hostname
+null::sysinit:/bin/busybox hostname -F /etc/hostname
diff --git a/meta/recipes-core/busybox/files/rcK b/meta/recipes-core/busybox/files/rcK
new file mode 100644
index 0000000..050086e
--- /dev/null
+++ b/meta/recipes-core/busybox/files/rcK
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+# Stop all init scripts in /etc/init.d
+# executing them in reversed numerical order.
+#
+for i in /etc/rc6.d/K??*; do
+     # Ignore dangling symlinks (if any).
+     [ ! -f "$i" ] && continue
+
+     case "$i" in
+	*.sh)
+	    # Source shell script for speed.
+	    (
+		trap - INT QUIT TSTP
+		set stop
+		. $i
+	    )
+	    ;;
+	*)
+	    # No sh extension, so fork subprocess.
+	    $i stop
+	    ;;
+    esac
+done
+
diff --git a/meta/recipes-core/busybox/files/rcS b/meta/recipes-core/busybox/files/rcS
new file mode 100644
index 0000000..d18c26b
--- /dev/null
+++ b/meta/recipes-core/busybox/files/rcS
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+# Stop all init scripts in /etc/init.d
+# executing them in reversed numerical order.
+#
+
+for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do
+     # Ignore dangling symlinks (if any).
+     [ ! -f "$i" ] && continue
+
+     case "$i" in
+	*.sh)
+	    # Source shell script for speed.
+	    (
+		trap - INT QUIT TSTP
+		set stop
+		. $i
+	    )
+	    ;;
+	*)
+	    # No sh extension, so fork subprocess.
+	    $i start
+	    ;;
+    esac
+done
+
diff --git a/meta/recipes-core/busybox/files/runlevel b/meta/recipes-core/busybox/files/runlevel
new file mode 100644
index 0000000..866f3b5
--- /dev/null
+++ b/meta/recipes-core/busybox/files/runlevel
@@ -0,0 +1,11 @@
+#!/bin/sh
+# busybox init does not have LSB ( sysvinit ) like initlevels
+# so lets fake it to 5 which is what we default anyway
+# this helps with opkg post installs where it tries to invoke
+# update-rc.d ad post install step.
+# for package upgrades
+# See code in update-rc.d around line 190 where it calls runlevel
+# program
+#
+echo "5"
+
-- 
2.7.0


