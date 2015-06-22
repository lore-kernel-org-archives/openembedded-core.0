Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A1879759D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:56:49 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so74181357wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 04:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wv6sLcCkIWQLa2NSoqdmXtB0uKlj98Tje2Ck8bz5cY8=;
	b=sWPxKDuXgTfo1OhREYRFnnHM2+WBCfClzSFOPVQVIko8tYjlITGjjY4K9VlrVr/RO9
	H29iN0l9gSljeazMbodibJlzovm9kcwfiDpQKCLvxo6Dn86+gSPoHgwj5jgBnUmq/6+r
	r7L7Vt6B1GbmHER+WB6DIhsBerGCn3hLtGhgNBVNBjBQE7zCjpwaYPb1D6BVZElFwTmv
	CRFSNjDS+rzKyQtIwicu/qxZcy2fmsss49C4NyZdOIcJR3uJtPVcr07ROkOWXn71CaEU
	eDGgQUUkAUUg8RFjoBaeA6MyjdxQa6KAILpZeXOPJnQ03k5ZjuYg8nUER0ifYKCLcwxk
	BGqw==
X-Received: by 10.194.95.41 with SMTP id dh9mr51473275wjb.55.1434974210781;
	Mon, 22 Jun 2015 04:56:50 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id q4sm30184358wju.14.2015.06.22.04.56.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 04:56:50 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 13:56:09 +0200
Message-Id: <1434974169-19875-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1434974169-19875-1-git-send-email-adrian.freihofer@gmail.com>
References: <1434974169-19875-1-git-send-email-adrian.freihofer@gmail.com>
Cc: paul.eggleton@linux.intel.com,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH 3/3] runqemu: support different net modes
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
X-List-Received-Date: Mon, 22 Jun 2015 11:56:51 -0000

This patch adds a "noinet" command line parameter to runqemu.
If the noinet parameter is passed to runqemu, runquemu does not
pass the default gateway to the kernel parameters of the target
device and it does not configure NAT routing on the host.
In noinet network mode the connection with IP address 192.168.7.x
can be considered as a dedicated debug interface.

To emulate Internet connectivity in a test or development setup
an additional NIC can be emulated by qemu. The second NIC might
be connected to a bridge on the host. This is more than helpful
if connected applications are developed. E.g. for testing and
development of M2M/IoT applications a reference implementation
of a cloud server can be connected to the bridge as well. Such
a setup allows writing ptests to verify the communication between
the target device and the cloud server.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/runqemu             |  5 +++++
 scripts/runqemu-gen-tapdevs | 11 +++++++----
 scripts/runqemu-ifdown      | 33 +++++++++++++++++++--------------
 scripts/runqemu-ifup        | 38 +++++++++++++++++++++++---------------
 scripts/runqemu-internal    | 13 +++++++++----
 5 files changed, 63 insertions(+), 37 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 84ece4d..f354c21 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -31,6 +31,7 @@ usage() {
     echo "  VM - boot a vmdk image"
     echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
+    echo "    noinet - disables route to internet on eth0"
     echo "    serial - enables a serial console on /dev/ttyS0"
     echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
     echo "    publicvnc - enable a VNC server open to all hosts"
@@ -70,6 +71,7 @@ SCRIPT_KERNEL_OPT=""
 SERIALSTDIO=""
 KVM_ENABLED="no"
 KVM_ACTIVE="no"
+NETMODE="nat"
 
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
@@ -188,6 +190,9 @@ while true; do
         "publicvnc")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc 0.0.0.0:0"
             ;;
+        "noinet")
+            NETMODE="noinet"
+            ;;
         "") break ;;
         *)
             # A directory name is an nfs rootfs
diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index d3b27be..f1bb5ca 100755
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
+	echo "<netmode> is optional and defaults to nat. If netmode is set to noinet,"
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
index 8f66cfa..9d12391 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -27,7 +27,8 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "sudo $(basename $0) <tap-dev> <native-sysroot-basedir>"
+	echo "sudo $(basename $0) <tap-dev> <native-sysroot-basedir> <netmode>"
+	echo "netmode is optional. Supported are nat (default) or noinet."
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
index b5a3db9..eef0a7f 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -34,7 +34,8 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "sudo $(basename $0) <uid> <gid> <native-sysroot-basedir>"
+	echo "sudo $(basename $0) <uid> <gid> <native-sysroot-basedir> <netmode>"
+	echo "netmode is optional. Supported are nat (default) or noinet."
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
@@ -96,11 +101,14 @@ $IFCONFIG link set dev $TAP up
 dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
 $IFCONFIG route add to 192.168.7.$dest dev $TAP
 
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
index ea2badc..ed4af09 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -211,10 +211,10 @@ else
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
@@ -232,7 +232,7 @@ else
             if [ ! -e "$NOSUDO_FLAG" -a "$USE_PRECONF_TAP" = "no" ]; then
                 # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
                 # but inactive. This looks scary but is harmless
-                sudo $QEMUIFDOWN $TAP $OECORE_NATIVE_SYSROOT 2> /dev/null
+                sudo $QEMUIFDOWN $TAP $OECORE_NATIVE_SYSROOT $NETMODE 2> /dev/null
             fi
             echo "Releasing lockfile of preconfigured tap device '$TAP'"
             release_lock $LOCKFILE
@@ -256,7 +256,12 @@ else
         n1=$(($n0 * 2 + 1))
         n2=$(($n1 + 1))
 
-        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:off"
+        #ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:<dns0-ip>:<dns1-ip>
+        if [ "$NETMODE" == "noinet" ]; then  # Do not define the gateway
+            KERNEL_NETWORK_CMD="ip=192.168.7.$n2:::255.255.255.0::eth0:off"
+        else  # Default to nat
+            KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:off"
+        fi
         QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
         if [ "$KVM_ACTIVE" = "yes" ]; then
             QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-- 
2.4.3


