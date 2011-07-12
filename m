Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QgoKs-0002At-0q
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 03:33:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 18:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="26983684"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 18:29:58 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 12:02:38 -0700
Message-Id: <bd724f86b719044e4e7958999893f8fbf3801f76.1310497097.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
References: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310497097.git.nitin.a.kamble@intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/5] udev-172: add a newer version for newer kernel
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
X-List-Received-Date: Wed, 13 Jul 2011 01:33:58 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

the 2.6.38 kernel has dropped v4lv1 support. and udev-168 fails to
compile because of that. So add a newer 172 version of udev to work with
2.6.38 kernel.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/udev/udev-172/init              |   59 +++++++++
 meta/recipes-core/udev/udev-172/local.rules       |   35 ++++++
 meta/recipes-core/udev/udev-172/permissions.rules |  131 +++++++++++++++++++++
 meta/recipes-core/udev/udev-172/run.rules         |   14 +++
 meta/recipes-core/udev/udev-172/udev.rules        |  116 ++++++++++++++++++
 meta/recipes-core/udev/udev_172.bb                |    6 +
 6 files changed, 361 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev-172/init
 create mode 100644 meta/recipes-core/udev/udev-172/local.rules
 create mode 100644 meta/recipes-core/udev/udev-172/permissions.rules
 create mode 100644 meta/recipes-core/udev/udev-172/run.rules
 create mode 100644 meta/recipes-core/udev/udev-172/udev.rules
 create mode 100644 meta/recipes-core/udev/udev_172.bb

diff --git a/meta/recipes-core/udev/udev-172/init b/meta/recipes-core/udev/udev-172/init
new file mode 100644
index 0000000..9ce95ee
--- /dev/null
+++ b/meta/recipes-core/udev/udev-172/init
@@ -0,0 +1,59 @@
+#!/bin/sh -e
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
+export TZ=/etc/localtime
+
+[ -d /sys/class ] || exit 1
+[ -r /proc/mounts ] || exit 1
+[ -x /sbin/udevd ] || exit 1
+[ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
+
+kill_udevd() {
+        if [ -x /sbin/pidof ]; then
+                pid=`/sbin/pidof -x udevd`
+                [ -n "$pid" ] && kill $pid
+        fi
+}
+
+export ACTION=add
+# propagate /dev from /sys
+echo -n "Starting udev"
+
+# mount the tmpfs on /dev, if not already done
+LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
+        mount -n -o mode=0755 -t tmpfs none "/dev"
+        mkdir -m 0755 /dev/pts
+        mkdir -m 1777 /dev/shm
+}
+
+if [ -e /etc/dev.tar ]; then
+	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
+	not_first_boot=1
+fi
+
+# make_extra_nodes
+kill_udevd > "/dev/null" 2>&1
+
+        # trigger the sorted events
+        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+        /sbin/udevd -d
+
+        /sbin/udevadm control --env=STARTUP=1
+		if [ "$not_first_boot" != "" ];then
+			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
+			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
+		else
+			/sbin/udevadm trigger
+			/sbin/udevadm settle
+		fi
+
+echo
+exit 0
diff --git a/meta/recipes-core/udev/udev-172/local.rules b/meta/recipes-core/udev/udev-172/local.rules
new file mode 100644
index 0000000..625e49a
--- /dev/null
+++ b/meta/recipes-core/udev/udev-172/local.rules
@@ -0,0 +1,35 @@
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
+# Handle network interface setup
+SUBSYSTEM=="net", ACTION=="add" RUN+="/etc/udev/scripts/network.sh"
+SUBSYSTEM=="net", ACTION=="remove" RUN+="/etc/udev/scripts/network.sh"
+
+# The first framebuffer is symlinked to /dev/fb                       
+KERNEL=="fb0", SYMLINK+="fb"
+
+# The first rtc device is symlinked to /dev/rtc
+KERNEL=="rtc0", SYMLINK+="rtc"
+
+# Try and modprobe for drivers for new hardware
+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
+
+# Create a symlink to any touchscreen input device
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
+
diff --git a/meta/recipes-core/udev/udev-172/permissions.rules b/meta/recipes-core/udev/udev-172/permissions.rules
new file mode 100644
index 0000000..205b733
--- /dev/null
+++ b/meta/recipes-core/udev/udev-172/permissions.rules
@@ -0,0 +1,131 @@
+ACTION!="add", GOTO="permissions_end"
+
+# workarounds needed to synchronize with sysfs
+# only needed for kernels < v2.6.18-rc1
+ENV{PHYSDEVPATH}!="?*", ENV{PHYSDEVBUS}=="?*",	WAIT_FOR_SYSFS="bus"
+SUBSYSTEM=="scsi", KERNEL=="[0-9]*:[0-9]*",	WAIT_FOR_SYSFS="ioerr_cnt"
+# only needed for kernels < 2.6.16
+SUBSYSTEM=="net",				WAIT_FOR_SYSFS="address"
+# only needed for kernels < 2.6.17
+SUBSYSTEM=="net", ENV{DRIVER}=="?*",		WAIT_FOR_SYSFS="device/driver"
+
+# devices needed to load the drivers providing them
+KERNEL=="tun",					OPTIONS+="ignore_remove"
+KERNEL=="ppp",					OPTIONS+="ignore_remove"
+KERNEL=="loop[0-9]*",				OPTIONS+="ignore_remove"
+
+# default permissions for block devices
+SUBSYSTEM=="block",				GROUP="disk"
+# the aacraid driver is broken and reports that disks removable (see #404927)
+SUBSYSTEM=="block", ATTRS{removable}=="1", \
+	DRIVERS!="aacraid",			GROUP="floppy"
+# all block devices on these buses are "removable"
+SUBSYSTEM=="block", SUBSYSTEMS=="usb|ieee1394|mmc|pcmcia", GROUP="floppy"
+
+# IDE devices
+KERNEL=="hd[a-z]|pcd[0-9]*", 			DRIVERS=="ide-cdrom|pcd", \
+	IMPORT{program}="cdrom_id --export $tempnode"
+ENV{ID_CDROM}=="?*",				GROUP="cdrom"
+KERNEL=="ht[0-9]*", 				GROUP="tape"
+KERNEL=="nht[0-9]*", 				GROUP="tape"
+
+# SCSI devices
+KERNEL=="sr[0-9]*", IMPORT{program}="cdrom_id --export $tempnode"
+SUBSYSTEMS=="scsi", ATTRS{type}=="1",				GROUP="tape"
+SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="HP",	GROUP="scanner"
+SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="Epson",	GROUP="scanner"
+SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="EPSON",	GROUP="scanner"
+SUBSYSTEMS=="scsi", ATTRS{type}=="4",				GROUP="cdrom"
+SUBSYSTEMS=="scsi", ATTRS{type}=="5",				GROUP="cdrom"
+SUBSYSTEMS=="scsi", ATTRS{type}=="6",				GROUP="scanner"
+SUBSYSTEMS=="scsi", ATTRS{type}=="8",				GROUP="tape"
+
+# USB devices
+KERNEL=="legousbtower*",	MODE="0666"
+KERNEL=="lp[0-9]*", SUBSYSTEMS=="usb",		GROUP="lp"
+
+# usbfs-like devices
+SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", \
+				MODE="0664"
+
+# iRiver music players
+SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device",	GROUP="plugdev", \
+	ATTRS{idVendor}=="4102", ATTRS{idProduct}=="10[01][135789]"
+
+# serial devices
+SUBSYSTEM=="tty",				GROUP="dialout"
+SUBSYSTEM=="capi",				GROUP="dialout"
+SUBSYSTEM=="slamr",				GROUP="dialout"
+SUBSYSTEM=="zaptel",				GROUP="dialout"
+
+# vc devices (all members of the tty subsystem)
+KERNEL=="ptmx",			MODE="0666",	GROUP="root"
+KERNEL=="console",		MODE="0600",	GROUP="root"
+KERNEL=="tty",			MODE="0666",	GROUP="root"
+KERNEL=="tty[0-9]*",				GROUP="root"
+KERNEL=="pty*",			MODE="0666",	GROUP="tty"
+
+# video devices
+SUBSYSTEM=="video4linux",			GROUP="video"
+SUBSYSTEM=="drm",				GROUP="video"
+SUBSYSTEM=="dvb",				GROUP="video"
+SUBSYSTEM=="em8300",				GROUP="video"
+SUBSYSTEM=="graphics",				GROUP="video"
+SUBSYSTEM=="nvidia",				GROUP="video"
+
+# misc devices
+KERNEL=="random",		MODE="0666"
+KERNEL=="urandom",		MODE="0666"
+KERNEL=="mem",			MODE="0640",	GROUP="kmem"
+KERNEL=="kmem",			MODE="0640",	GROUP="kmem"
+KERNEL=="port",			MODE="0640",	GROUP="kmem"
+KERNEL=="full",			MODE="0666"
+KERNEL=="null",			MODE="0666"
+KERNEL=="zero",			MODE="0666"
+KERNEL=="inotify",		MODE="0666"
+KERNEL=="sgi_fetchop",		MODE="0666"
+KERNEL=="sonypi",		MODE="0666"
+KERNEL=="agpgart",				GROUP="video"
+KERNEL=="nvram",				GROUP="nvram"
+KERNEL=="rtc|rtc[0-9]*",			GROUP="audio"
+KERNEL=="tpm*",			MODE="0600",	OWNER="tss", GROUP="tss"
+KERNEL=="fuse",					GROUP="fuse"
+KERNEL=="kqemu",		MODE="0666"
+KERNEL=="kvm",					GROUP="kvm"
+KERNEL=="tun",			MODE="0666",
+
+KERNEL=="cdemu[0-9]*",				GROUP="cdrom"
+KERNEL=="pktcdvd[0-9]*",			GROUP="cdrom"
+KERNEL=="pktcdvd",		MODE="0644"
+
+KERNEL=="uverbs*",				GROUP="rdma"
+KERNEL=="ucm*",					GROUP="rdma"
+KERNEL=="rdma_ucm",				GROUP="rdma"
+
+# printers and parallel devices
+SUBSYSTEM=="printer",				GROUP="lp"
+SUBSYSTEM=="ppdev",				GROUP="lp"
+KERNEL=="irlpt*",				GROUP="lp"
+KERNEL=="pt[0-9]*",				GROUP="tape"
+KERNEL=="pht[0-9]*",				GROUP="tape"
+
+# sound devices
+SUBSYSTEM=="sound",				GROUP="audio"
+
+# ieee1394 devices       
+KERNEL=="raw1394",				GROUP="disk"
+KERNEL=="dv1394*",				GROUP="video"
+KERNEL=="video1394*",				GROUP="video"
+
+# input devices
+KERNEL=="event[0-9]*", ATTRS{name}=="*dvb*|*DVB*|* IR *" \
+				MODE="0664",	GROUP="video"
+KERNEL=="js[0-9]*",		MODE="0664"
+KERNEL=="lirc[0-9]*",				GROUP="video"
+
+# AOE character devices
+SUBSYSTEM=="aoe",		MODE="0220",	GROUP="disk"
+SUBSYSTEM=="aoe", KERNEL=="err", MODE="0440"
+
+LABEL="permissions_end"
+
diff --git a/meta/recipes-core/udev/udev-172/run.rules b/meta/recipes-core/udev/udev-172/run.rules
new file mode 100644
index 0000000..75d7137
--- /dev/null
+++ b/meta/recipes-core/udev/udev-172/run.rules
@@ -0,0 +1,14 @@
+# debugging monitor
+RUN+="socket:/org/kernel/udev/monitor"
+
+# run a command on remove events
+ACTION=="remove", ENV{REMOVE_CMD}!="", RUN+="$env{REMOVE_CMD}"
+
+# ignore the events generated by virtual consoles
+KERNEL=="ptmx",		OPTIONS+="last_rule"
+KERNEL=="console",	OPTIONS+="last_rule"
+KERNEL=="tty"	,	OPTIONS+="last_rule"
+KERNEL=="tty[0-9]*",	OPTIONS+="last_rule"
+KERNEL=="pty*",		OPTIONS+="last_rule"
+SUBSYSTEM=="vc",	OPTIONS+="last_rule"
+
diff --git a/meta/recipes-core/udev/udev-172/udev.rules b/meta/recipes-core/udev/udev-172/udev.rules
new file mode 100644
index 0000000..a19d4a0
--- /dev/null
+++ b/meta/recipes-core/udev/udev-172/udev.rules
@@ -0,0 +1,116 @@
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
+# workaround for devices which do not report media changes
+SUBSYSTEMS=="ide", KERNEL=="hd[a-z]", ATTR{removable}=="1", \
+	ENV{ID_MODEL}=="IOMEGA_ZIP*",	NAME="%k", OPTIONS+="all_partitions"
+SUBSYSTEMS=="ide", KERNEL=="hd[a-z]", ATTRS{media}=="floppy", \
+	OPTIONS+="all_partitions"
+
+# SCSI devices
+SUBSYSTEMS=="scsi", KERNEL=="sr[0-9]*",	NAME="scd%n", SYMLINK+="sr%n"
+
+# USB devices
+SUBSYSTEMS=="usb", KERNEL=="auer[0-9]*",	NAME="usb/%k"
+SUBSYSTEMS=="usb", KERNEL=="cpad[0-9]*",	NAME="usb/%k"
+SUBSYSTEMS=="usb", KERNEL=="dabusb*",		NAME="usb/%k"
+SUBSYSTEMS=="usb", KERNEL=="hiddev*",		NAME="usb/%k"
+SUBSYSTEMS=="usb", KERNEL=="legousbtower*",	NAME="usb/%k"
+SUBSYSTEMS=="usb", KERNEL=="lp[0-9]*",		NAME="usb/%k"
+SUBSYSTEMS=="usb", KERNEL=="ttyUSB*", \
+	ATTRS{product}=="Palm Handheld*|Handspring Visor|palmOne Handheld", \
+					SYMLINK+="pilot"
+
+# usbfs-like devices
+SUBSYSTEM=="usb_device",	PROGRAM="/bin/sh -c 'K=%k; K=$${K#usbdev}; printf bus/usb/%%03i/%%03i $${K%%%%.*} $${K#*.}'", ACTION=="add", \
+				NAME="%c"
+SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device",	NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}"
+
+# serial devices
+KERNEL=="capi",			NAME="capi20", SYMLINK+="isdn/capi20"
+KERNEL=="capi[0-9]*",		NAME="capi/%n"
+
+# video devices
+KERNEL=="dvb*",			PROGRAM="/bin/sh -c 'K=%k; K=$${K#dvb}; printf dvb/adapter%%i/%%s $${K%%%%.*} $${K#*.}", ACTION=="add", \
+				NAME="%c"
+KERNEL=="card[0-9]*",		NAME="dri/%k"
+
+# misc devices
+KERNEL=="hw_random",		NAME="hwrng"
+KERNEL=="tun",			NAME="net/%k"
+KERNEL=="evtchn",		NAME="xen/%k"
+
+KERNEL=="cdemu[0-9]*",		NAME="cdemu/%n"
+KERNEL=="pktcdvd[0-9]*",	NAME="pktcdvd/%n"
+KERNEL=="pktcdvd",		NAME="pktcdvd/control"
+
+KERNEL=="cpu[0-9]*",		NAME="cpu/%n/cpuid"
+KERNEL=="msr[0-9]*",		NAME="cpu/%n/msr"
+KERNEL=="microcode",		NAME="cpu/microcode"
+
+KERNEL=="umad*",		NAME="infiniband/%k"
+KERNEL=="issm*",		NAME="infiniband/%k"
+KERNEL=="uverbs*",		NAME="infiniband/%k"
+KERNEL=="ucm*",			NAME="infiniband/%k"
+KERNEL=="rdma_ucm",		NAME="infiniband/%k"
+
+# ALSA devices
+KERNEL=="controlC[0-9]*",	NAME="snd/%k"
+KERNEL=="hwC[D0-9]*",		NAME="snd/%k"
+KERNEL=="pcmC[D0-9cp]*",	NAME="snd/%k"
+KERNEL=="midiC[D0-9]*",		NAME="snd/%k"
+KERNEL=="timer",		NAME="snd/%k"
+KERNEL=="seq",			NAME="snd/%k"
+
+# ieee1394 devices       
+KERNEL=="dv1394*",		NAME="dv1394/%n"
+KERNEL=="video1394*",		NAME="video1394/%n"
+
+# input devices
+KERNEL=="mice",			NAME="input/%k"
+KERNEL=="mouse[0-9]*",		NAME="input/%k"
+KERNEL=="event[0-9]*",		NAME="input/%k"
+KERNEL=="js[0-9]*",		NAME="input/%k"
+KERNEL=="ts[0-9]*",		NAME="input/%k"
+KERNEL=="uinput",		NAME="input/%k"
+
+# Zaptel
+KERNEL=="zapctl",		NAME="zap/ctl"
+KERNEL=="zaptimer",		NAME="zap/timer"
+KERNEL=="zapchannel",		NAME="zap/channel"
+KERNEL=="zappseudo",		NAME="zap/pseudo"
+KERNEL=="zap[0-9]*",		NAME="zap/%n"
+
+# AOE character devices
+SUBSYSTEM=="aoe", KERNEL=="discover",	NAME="etherd/%k"
+SUBSYSTEM=="aoe", KERNEL=="err",	NAME="etherd/%k"
+SUBSYSTEM=="aoe", KERNEL=="interfaces",	NAME="etherd/%k"
+SUBSYSTEM=="aoe", KERNEL=="revalidate",	NAME="etherd/%k"
+
+# device mapper creates its own device nodes, so ignore these
+KERNEL=="dm-[0-9]*",		OPTIONS+="ignore_device"
+KERNEL=="device-mapper",	NAME="mapper/control"
+
+KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
+
+# Firmware Helper
+ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
+
+# Samsung UARTS
+KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
+
+# MXC UARTs
+KERNEL=="ttymxc[0-4]",   NAME="ttymxc%n"
+
diff --git a/meta/recipes-core/udev/udev_172.bb b/meta/recipes-core/udev/udev_172.bb
new file mode 100644
index 0000000..7e3f956
--- /dev/null
+++ b/meta/recipes-core/udev/udev_172.bb
@@ -0,0 +1,6 @@
+include udev-new.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "9af0a8457cc178d18661a5848f18c4c9"
+SRC_URI[sha256sum] = "93222392488a52f8eb79c7d4f6b992d19bd375c79a87ead4b480be1cc25382d7"
-- 
1.7.5.4



