Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD3677382
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 21:35:33 +0000 (UTC)
Received: by wmww144 with SMTP id w144so73085507wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 13:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1kzDpmMvFaR7SwNMvvewMqQZ0JCTHMo4fYo2CVba7P8=;
	b=ynBmOP7+GkjjUm3PVjjK+RyC0kxtnS2srr3v+y6YC4JejORutrRtAnyfzsRVfTWpX/
	9FJAgFrkiiaoepFahl2RYVEB67AqRHN+91mb9ufHcUwnInx1MZREeo4iWhM396+VRub5
	DIEPfDgnsQ13HomdkLF2isCfmv3araOTXh3aY4GB25F2VH2lKvTo300Trc5A4zhIY+fd
	jPZNxFE28e/yfmTj36xJ+2foIjgy7tXi9ycAE3tV/RfquMSp39Ant0m5SX8GQqhmnBVA
	BZYOE18bJCPAnekWjG4+oSvLLUtwPkl/M1uwmht+HaINOWiIqdTneMqlWUTwCVFsZ69G
	uaOA==
X-Received: by 10.28.213.12 with SMTP id m12mr11612201wmg.26.1447536933678;
	Sat, 14 Nov 2015 13:35:33 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	c4sm14784681wjs.36.2015.11.14.13.35.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 13:35:33 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Nov 2015 22:35:08 +0100
Message-Id: <1447536908-21449-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 3/3] runqemu: support hostonly net mode
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
X-List-Received-Date: Sat, 14 Nov 2015 21:35:33 -0000

This patch adds a "hostonly" command line parameter to runqemu.
If this parameter is passed to runqemu, runquemu does not pass
the default gateway to the kernel parameters of the virtual
device and it does not configure NAT routing on the host.

Whit NAT routing on the host becoming an optional feature it is
possible to add the tap interface(s) to a bridge as discussed in
Yocto bugzilla #7887. The user is enabled to write a script which
does something like calling runqemu-gen-tapdevs to create the tap
device(s) on the host, add the device(s) to a bridge and finally
call runqemu with hostonly parameter.
With this patchset it is possible to configure more than one
emulated NICs for the virtual device. This allows to consider the
192.168.7.x network as a dedicated (statically configured) debug
connection between host and virtual device and to setup a second
NIC to emulate a network setup specific for a particular use case.
This might be a bridged network or what ever required.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/runqemu             |  7 ++++++-
 scripts/runqemu-gen-tapdevs | 11 +++++++----
 scripts/runqemu-ifdown      | 33 +++++++++++++++++++--------------
 scripts/runqemu-ifup        | 38 +++++++++++++++++++++++---------------
 scripts/runqemu-internal    | 21 +++++++++++++--------
 5 files changed, 68 insertions(+), 42 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e01d276..dc3c041 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -31,6 +31,7 @@ usage() {
     echo "  VM - boot a virtual machine image (= a file representing a full disk with boot loader)"
     echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
+    echo "    hostonly - disables route to internet on eth0"
     echo "    serial - enables a serial console on /dev/ttyS0"
     echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
     echo "    kvm-vhost - enables KVM with vhost support when running qemux86/qemux86-64 (VT-capable CPU required)"
@@ -74,6 +75,7 @@ KVM_ENABLED="no"
 KVM_ACTIVE="no"
 VHOST_ENABLED="no"
 VHOST_ACTIVE="no"
+NETMODE="nat"
 
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
@@ -179,7 +181,10 @@ while true; do
             VHOST_ENABLED="yes"
             ;;
         "slirp")
-            SLIRP_ENABLED="yes"
+            NETMODE="slirp"
+            ;;
+        "hostonly")
+            NETMODE="hostonly"
             ;;
         "publicvnc")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc 0.0.0.0:0"
diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index d3b27be..d2f6e80 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -23,11 +23,13 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "Usage: sudo $0 <uid> <gid> <num> <native-sysroot-basedir>"
+	echo "Usage: sudo $0 <uid> <gid> <num> <native-sysroot-basedir> <netmode>"
         echo "Where <uid> is the numeric user id the tap devices will be owned by"
 	echo "Where <gid> is the numeric group id the tap devices will be owned by"
 	echo "<num> is the number of tap devices to create (0 to remove all)"
 	echo "<native-sysroot-basedir> is the path to the build system's native sysroot"
+	echo "<netmode> is optional and defaults to nat. If netmode is set to hostonly,"
+	echo "          qemu is started without internet gateway."
 	exit 1
 }
 
@@ -36,7 +38,7 @@ if [ $EUID -ne 0 ]; then
 	exit
 fi
 
-if [ $# -ne 4 ]; then
+if [ "$#" -lt 4 -o "$#" -gt 5 ]; then
 	echo "Error: Incorrect number of arguments"
 	usage
 fi
@@ -45,6 +47,7 @@ TUID=$1
 GID=$2
 COUNT=$3
 SYSROOT=$4
+NETMODE=${5:-nat}
 
 TUNCTL=$SYSROOT/usr/bin/tunctl
 if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
@@ -75,10 +78,10 @@ for tap in `$IFCONFIG link | grep tap | awk '{ print \$2 }' | sed s/://`; do
 	$TUNCTL -d $tap
 done
 
-echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
+echo "Creating $COUNT tap devices for UID: $TUID GID: $GID netmode: $NETMODE..."
 for ((index=0; index < $COUNT; index++)); do
 	echo "Creating tap$index"
-	ifup=`$RUNQEMU_IFUP $TUID $GID $SYSROOT 2>&1`
+	ifup=`$RUNQEMU_IFUP $TUID $GID $SYSROOT $NETMODE 2>&1`
 	if [ $? -ne 0 ]; then
 		echo "Error running tunctl: $ifup"
 		exit 1
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index 8f66cfa..41e6c1b 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -27,7 +27,8 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "sudo $(basename $0) <tap-dev> <native-sysroot-basedir>"
+	echo "sudo $(basename $0) <tap-dev> <native-sysroot-basedir> <netmode>"
+	echo "netmode is optional. Supported are nat (default) or hostonly."
 }
 
 if [ $EUID -ne 0 ]; then
@@ -35,13 +36,14 @@ if [ $EUID -ne 0 ]; then
 	exit 1
 fi
 
-if [ $# -ne 2 ]; then
+if [ "$#" -lt 2 -o "$#" -gt 3 ]; then
 	usage
 	exit 1
 fi
 
 TAP=$1
 NATIVE_SYSROOT_DIR=$2
+NETMODE=${3:-nat}
 
 TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
 if [ ! -e "$TUNCTL" ]; then
@@ -51,16 +53,19 @@ fi
 
 $TUNCTL -d $TAP
 
-# cleanup the remaining iptables rules
-IPTABLES=`which iptables 2> /dev/null`
-if [ "x$IPTABLES" = "x" ]; then
-	IPTABLES=/sbin/iptables
-fi
-if [ ! -x "$IPTABLES" ]; then
-	echo "$IPTABLES cannot be executed"
-	exit 1
+
+if [ "$NETMODE" == "nat" ]; then
+	# cleanup the remaining iptables rules
+	IPTABLES=`which iptables 2> /dev/null`
+	if [ "x$IPTABLES" = "x" ]; then
+		IPTABLES=/sbin/iptables
+	fi
+	if [ ! -x "$IPTABLES" ]; then
+		echo "$IPTABLES cannot be executed"
+		exit 1
+	fi
+	n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
+	dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
+	$IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
+	$IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
 fi
-n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
-$IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
-$IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index d9bd894..92abfaf 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -34,7 +34,8 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "sudo $(basename $0) <uid> <gid> <native-sysroot-basedir>"
+	echo "sudo $(basename $0) <uid> <gid> <native-sysroot-basedir> <netmode>"
+	echo "netmode is optional. Supported are nat (default) or hostonly."
 }
 
 if [ $EUID -ne 0 ]; then
@@ -42,7 +43,7 @@ if [ $EUID -ne 0 ]; then
 	exit 1
 fi
 
-if [ $# -ne 3 ]; then
+if [ "$#" -lt 3 -o "$#" -gt 4 ]; then
 	usage
 	exit 1
 fi
@@ -50,6 +51,7 @@ fi
 USERID="-u $1"
 GROUP="-g $2"
 NATIVE_SYSROOT_DIR=$3
+NETMODE=${4:-nat}
 
 TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
 if [ ! -x "$TUNCTL" ]; then
@@ -80,13 +82,16 @@ if [ ! -x "$IFCONFIG" ]; then
 	exit 1
 fi
 
-IPTABLES=`which iptables 2> /dev/null`
-if [ "x$IPTABLES" = "x" ]; then
-	IPTABLES=/sbin/iptables
-fi
-if [ ! -x "$IPTABLES" ]; then
-	echo "$IPTABLES cannot be executed"
-	exit 1
+
+if [ "$NETMODE" == "nat" ]; then
+	IPTABLES=`which iptables 2> /dev/null`
+	if [ "x$IPTABLES" = "x" ]; then
+		IPTABLES=/sbin/iptables
+	fi
+	if [ ! -x "$IPTABLES" ]; then
+		echo "$IPTABLES cannot be executed"
+		exit 1
+	fi
 fi
 
 n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
@@ -111,11 +116,14 @@ if [ $STATUS -ne 0 ]; then
     exit 1
 fi
 
-# setup NAT for tap0 interface to have internet access in QEMU
-$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
-$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
-echo 1 > /proc/sys/net/ipv4/ip_forward
-echo 1 > /proc/sys/net/ipv4/conf/$TAP/proxy_arp
-$IPTABLES -P FORWARD ACCEPT
+
+if [ "$NETMODE" == "nat" ]; then
+	# setup NAT for tap0 interface to have internet access in QEMU
+	$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
+	$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
+	echo 1 > /proc/sys/net/ipv4/ip_forward
+	echo 1 > /proc/sys/net/ipv4/conf/$TAP/proxy_arp
+	$IPTABLES -P FORWARD ACCEPT
+fi
 
 echo $TAP
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 7b1fdd9..b234cd9 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -116,7 +116,7 @@ NFSRUNNING="false"
 #capture original stty values
 ORIG_STTY=$(stty -g)
 
-if [ "$SLIRP_ENABLED" = "yes" ]; then
+if [ "$NETMODE" = "slirp" ]; then
     KERNEL_NETWORK_CMD="ip=dhcp"
     QEMU_TAP_CMD=""
     QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
@@ -204,10 +204,10 @@ else
             echo "Setting up tap interface under sudo"
             # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
             # but inactive. This looks scary but is harmless
-            tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT 2> /dev/null`
+            tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT $NETMODE 2> /dev/null`
             if [ $? -ne 0 ]; then
                 # Re-run standalone to see verbose errors
-                sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
+                sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT $NETMODE
                 return 1
             fi
             LOCKFILE="$LOCKDIR/$tap"
@@ -225,7 +225,7 @@ else
             if [ ! -e "$NOSUDO_FLAG" -a "$USE_PRECONF_TAP" = "no" ]; then
                 # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
                 # but inactive. This looks scary but is harmless
-                sudo $QEMUIFDOWN $TAP $OECORE_NATIVE_SYSROOT 2> /dev/null
+                sudo $QEMUIFDOWN $TAP $OECORE_NATIVE_SYSROOT $NETMODE 2> /dev/null
             fi
             echo "Releasing lockfile of preconfigured tap device '$TAP'"
             release_lock $LOCKFILE
@@ -257,7 +257,12 @@ else
         n1=$(($n0 * 2 + 1))
         n2=$(($n1 + 1))
 
-        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:off"
+        #ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:<dns0-ip>:<dns1-ip>
+        if [ "$NETMODE" == "hostonly" ]; then  # Do not define the gateway
+            KERNEL_NETWORK_CMD="ip=192.168.7.$n2:::255.255.255.0::eth0:off"
+        else  # Default to nat
+            KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:off"
+        fi
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
         if [ "$VHOST_ACTIVE" = "yes" ]; then
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
@@ -315,7 +320,7 @@ fi
 
 if [ "$NFS_SERVER" = "" ]; then
     NFS_SERVER="192.168.7.1"
-    if [ "$SLIRP_ENABLED" = "yes" ]; then
+    if [ "$NETMODE" = "slirp" ]; then
 	NFS_SERVER="10.0.2.2"
     fi
 fi
@@ -516,7 +521,7 @@ if [ "$MACHINE" = "qemuppc" ]; then
     MACHINE_SUBTYPE=mac99
     CPU_SUBTYPE=G4
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    if [ "$SLIRP_ENABLED" = "yes" ]; then
+    if [ "$NETMODE" = "slirp" ]; then
         QEMU_NETWORK_CMD=""
     else
         QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
@@ -734,7 +739,7 @@ else
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
 fi
 ret=$?
-if [ "$SLIRP_ENABLED" != "yes" ]; then
+if [ "$NETMODE" != "slirp ]; then
         cleanup
 fi
 
-- 
2.4.3


