Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvrgQ-0002WG-5g
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 17:14:58 +0200
Received: by wibhq4 with SMTP id hq4so1678582wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ghGz5+NypEFkWOuC9UDXT8RX0u/tPpp3jkLOB9ELuuc=;
	b=KB+tvc2eKajP+2tRukNTsZIb1CIuSDSX2RcDAWr7L+9hnkxnCxueg1H4g+pduYy6rc
	LSNyE+tdEI2IZYCgWLJ0FAdtjIV3QA14rAm3kAdYR+kEFR3FIehGXADnf5zQgTYmOScp
	IybWkadoD6lbw+FARzue7VSOeb12O4lCFcLGExlMtdKIM7PMK+Ki80I+pKJYSKkmV+bc
	NQlsmv9u5oPjob0Yzdw5qWhPN3HeSHq21czLdms3LJSVQzUQkkvj/vT0BjNqCY9qIo4D
	+kK30eX/rph8VNtfhjup4zSpZ3o5YkYYM39V8o0GzCpQalazEdUeoKsr3N9+fj0hjMmP
	1uVw==
Received: by 10.216.132.76 with SMTP id n54mr5650619wei.135.1343660597627;
	Mon, 30 Jul 2012 08:03:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm24807650wib.0.2012.07.30.08.03.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 08:03:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 17:03:14 +0200
Message-Id: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] udev-extraconf: merge with udev-extra-rules from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 15:14:58 -0000

* license in meta-oe was MIT, in oe-core it was GPLv2, everyone fine with this?
* add mount.blacklist to CONFFILES
* add more rules and scripts from meta-oe
* change PV to 1.0 and bump PR to provide upgrade path from meta-oe's udev-extra-rules
  including RREPLACE/RPROVIDES/RCONFLICTS trio

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../udev/udev-extraconf/automount.rules            |   19 ++++++
 .../recipes-core/udev/udev-extraconf/autonet.rules |   19 ++++++
 meta/recipes-core/udev/udev-extraconf/local.rules  |   21 +++++++
 meta/recipes-core/udev/udev-extraconf/mount.sh     |   64 ++++++++++++++++++++
 meta/recipes-core/udev/udev-extraconf/network.sh   |   58 ++++++++++++++++++
 meta/recipes-core/udev/udev-extraconf_0.0.bb       |   15 -----
 meta/recipes-core/udev/udev-extraconf_1.0.bb       |   43 +++++++++++++
 7 files changed, 224 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev-extraconf/automount.rules
 create mode 100644 meta/recipes-core/udev/udev-extraconf/autonet.rules
 create mode 100644 meta/recipes-core/udev/udev-extraconf/local.rules
 create mode 100644 meta/recipes-core/udev/udev-extraconf/mount.sh
 create mode 100644 meta/recipes-core/udev/udev-extraconf/network.sh
 delete mode 100644 meta/recipes-core/udev/udev-extraconf_0.0.bb
 create mode 100644 meta/recipes-core/udev/udev-extraconf_1.0.bb

diff --git a/meta/recipes-core/udev/udev-extraconf/automount.rules b/meta/recipes-core/udev/udev-extraconf/automount.rules
new file mode 100644
index 0000000..7e844c3
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf/automount.rules
@@ -0,0 +1,19 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Media automounting
+SUBSYSTEM=="block", ACTION=="add"    RUN+="/etc/udev/scripts/mount.sh"
+SUBSYSTEM=="block", ACTION=="remove" RUN+="/etc/udev/scripts/mount.sh"
+
diff --git a/meta/recipes-core/udev/udev-extraconf/autonet.rules b/meta/recipes-core/udev/udev-extraconf/autonet.rules
new file mode 100644
index 0000000..19676aa
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf/autonet.rules
@@ -0,0 +1,19 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Handle network interface setup
+SUBSYSTEM=="net", ACTION=="add" RUN+="/etc/udev/scripts/network.sh"
+SUBSYSTEM=="net", ACTION=="remove" RUN+="/etc/udev/scripts/network.sh"
+
diff --git a/meta/recipes-core/udev/udev-extraconf/local.rules b/meta/recipes-core/udev/udev-extraconf/local.rules
new file mode 100644
index 0000000..4eaa8ca
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf/local.rules
@@ -0,0 +1,21 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# The first rtc device is symlinked to /dev/rtc
+KERNEL=="rtc0", SYMLINK+="rtc"
+
+#The first framebuffer is symlinked to /dev/fb
+KERNEL=="fb0",  SYMLINK+="fb"
+
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
new file mode 100644
index 0000000..67c2b4b
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -0,0 +1,64 @@
+#!/bin/sh
+#
+# Called from udev
+# Attemp to mount any added block devices
+# and remove any removed devices
+#
+
+MOUNT="/bin/mount"
+PMOUNT="/usr/bin/pmount"
+UMOUNT="/bin/umount"
+name="`basename "$DEVNAME"`"
+
+for line in `grep -v ^# /etc/udev/mount.blacklist`
+do
+	if ( echo "$DEVNAME" | grep -q "$line" )
+	then
+		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
+		exit 0
+	fi
+done
+
+automount() {
+	! test -d "/media/$name" && mkdir -p "/media/$name"
+
+	if ! $MOUNT -t auto -o async,relatime $DEVNAME "/media/$name"
+	then
+		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
+		rm_dir "/media/$name"
+	else
+		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
+		touch "/tmp/.automount-$name"
+	fi
+}
+
+rm_dir() {
+	# We do not want to rm -r populated directories
+	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
+	then
+		! test -z "$1" && rm -r "$1"
+	else
+		logger "mount.sh/automount" "Not removing non-empty directory [$1]"
+	fi
+}
+
+if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
+	if [ -x "$PMOUNT" ]; then
+		$PMOUNT $DEVNAME 2> /dev/null
+	elif [ -x $MOUNT ]; then
+			$MOUNT $DEVNAME 2> /dev/null
+	fi
+
+	# Avoid remounting devices (e.g: rootfs)
+	awk '{print $1}' /proc/mounts | grep -q "^$DEVNAME$" || automount
+fi
+
+if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
+	for mnt in `grep "$DEVNAME" /proc/mounts | cut -f 2 -d " " `
+	do
+		$UMOUNT -l $mnt
+	done
+
+	# Remove empty directories from auto-mounter
+	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
+fi
diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/recipes-core/udev/udev-extraconf/network.sh
new file mode 100644
index 0000000..182c26d
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf/network.sh
@@ -0,0 +1,58 @@
+#!/bin/sh
+
+# udevd does clearenv(). Export shell PATH to children.
+export PATH
+
+# Do not run when pcmcia-cs is installed
+test -x /sbin/cardctl && exit 0
+
+# We get two "add" events for hostap cards due to wifi0
+echo "$INTERFACE" | grep -q wifi && exit 0
+
+
+# Check if /etc/init.d/network has been run yet to see if we are 
+# called by starting /etc/rcS.d/S03udev and not by hotplugging a device
+#
+# At this stage, network interfaces should not be brought up
+# automatically because:
+# a)	/etc/init.d/network has not been run yet (security issue)
+# b) 	/var has not been populated yet so /etc/resolv,conf points to 
+#	oblivion, making the network unusable
+#
+
+spoofp="`grep ^spoofprotect /etc/network/options`"
+if test -z "$spoofp"
+then
+	# This is the default from /etc/init.d/network
+	spoofp_val=yes
+else
+	spoofp_val=${spoofp#spoofprotect=}
+fi
+
+test "$spoofp_val" = yes && spoofp_val=1 || spoofp_val=0
+
+# I think it is safe to assume that "lo" will always be there ;)
+if test "`cat /proc/sys/net/ipv4/conf/lo/rp_filter`" != "$spoofp_val" -a -n "$spoofp_val"
+then
+	echo "$INTERFACE" >> /dev/udev_network_queue	
+	exit 0
+fi
+
+#
+# Code taken from pcmcia-cs:/etc/pcmcia/network
+#
+
+# if this interface has an entry in /etc/network/interfaces, let ifupdown
+# handle it
+if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
+  case $ACTION in
+    add)
+    	ifconfig | grep -q "^$INTERFACE" || ifup $INTERFACE
+    	;;
+    remove)
+    	ifdown $INTERFACE
+    	;;
+  esac
+  
+  exit 0
+fi
diff --git a/meta/recipes-core/udev/udev-extraconf_0.0.bb b/meta/recipes-core/udev/udev-extraconf_0.0.bb
deleted file mode 100644
index d0d0e84..0000000
--- a/meta/recipes-core/udev/udev-extraconf_0.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Extra machine specific configuration files"
-DESCRIPTION = "Extra machine specific configuration files for udev, specifically blacklist information."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
-
-PR = "r2"
-
-SRC_URI = "file://mount.blacklist \
-           file://COPYING.GPL"
-
-do_install () {
-	install -d ${D}${sysconfdir}/udev/
-
-	install -m 0644 ${WORKDIR}/mount.blacklist     ${D}${sysconfdir}/udev/
-}
diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
new file mode 100644
index 0000000..940e7d0
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Extra machine specific configuration files"
+DESCRIPTION = "Extra machine specific configuration files for udev, specifically blacklist information."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
+
+inherit allarch
+
+PR = "r5"
+
+SRC_URI = " \
+       file://automount.rules \
+       file://mount.sh \
+       file://mount.blacklist \
+       file://autonet.rules \
+       file://network.sh \
+       file://local.rules \
+       file://COPYING.GPL \
+"
+
+
+do_install() {
+    install -d ${D}${sysconfdir}/udev/rules.d
+
+    install -m 0644 ${WORKDIR}/automount.rules     ${D}${sysconfdir}/udev/rules.d/automount.rules
+    install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
+    install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
+
+    install -m 0644 ${WORKDIR}/mount.blacklist     ${D}${sysconfdir}/udev/
+
+    install -d ${D}${sysconfdir}/udev/scripts/
+
+    install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
+    install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
+}
+
+FILES_${PN} = "${sysconfdir}/udev"
+RDEPENDS_${PN} = "udev"
+CONFFILES_${PN} = "${sysconfdir}/udev/mount.blacklist"
+
+# to replace udev-extra-rules from meta-oe
+RPROVIDES_${PN} = "udev-extra-rules"
+RREPLACES_${PN} = "udev-extra-rules"
+RCONFLICTS_${PN} = "udev-extra-rules"
-- 
1.7.8.6



