Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UX4X2-000309-QJ
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 08:59:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Apr 2013 23:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,579,1363158000"; d="scan'208";a="295270950"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.57])
	by azsmga001.ch.intel.com with ESMTP; 29 Apr 2013 23:41:28 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 09:42:11 +0300
Message-Id: <1367304131-17573-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v4] SLiRP support in runqemu
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
X-List-Received-Date: Tue, 30 Apr 2013 06:59:34 -0000
X-List-Received-Date: Tue, 30 Apr 2013 06:59:34 -0000

runqemu script now takes argument "slirp" in order to
run networking on the qemu machine, without root privileges.

changed the runqemu-internal script in order not to activate
the tap devices if the option is set. Also trimmed the
cleanup function so that after the image is closed, no
tap releases warnings showed up.

[YOCTO #1474]

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 scripts/runqemu          |    3 +
 scripts/runqemu-internal |  220 ++++++++++++++++++++++++++--------------------
 2 files changed, 130 insertions(+), 93 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8ed1226..31deb6f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -173,6 +173,9 @@ while true; do
             KVM_ENABLED="yes"
             KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
             ;;
+        "slirp")
+            SLIRP_ENABLED="yes"
+            ;;
         "publicvnc")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc 0.0.0.0:0"
             ;;
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f11706d..644859c 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -104,93 +104,111 @@ fi
 
 NFSRUNNING="false"
 
-acquire_lock() {
-    lockfile=$1
-    if [ -z "$lockfile" ]; then
-        echo "Error: missing lockfile arg passed to acquire_lock()"
-        return 1
-    fi
-
-    touch $lockfile.lock
-    exec 8>$lockfile.lock
-    flock -n -x 8
-    if [ $? -ne 0 ]; then
-        exec 8>&-
-        return 1
+if [ "$SLIRP_ENABLED" = "yes" ]; then
+    KERNEL_NETWORK_CMD=""
+    QEMU_TAP_CMD=""
+    if [ "$KVM_ACTIVE" = "yes" ]; then
+        QEMU_NETWORK_CMD=""
+        DROOT="/dev/vda"
+        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
+    else
+        QEMU_NETWORK_CMD=""
+        DROOT="/dev/hda"
+        ROOTFS_OPTIONS="-hda $ROOTFS"
     fi
+else
+    acquire_lock() {
+        lockfile=$1
+        if [ -z "$lockfile" ]; then
+            echo "Error: missing lockfile arg passed to acquire_lock()"
+            return 1
+        fi
 
-    return 0
-}
+        if [ -e "$lockfile.lock" ]; then
+            # Check that the lockfile is not stale
+            ps=`ps -eo pid | grep $(cat $lockfile.lock)`
+            if [ -z "$ps" ]; then
+                echo "WARNING: Stale lock file detected, deleting $lockfile.lock."
+                rm -f $lockfile.lock
+                echo $$ > $lockfile.lock
+            else
+                return 1
+            fi
+        else
+            echo $$ > $lockfile.lock
+        fi
 
-release_lock() {
-    lockfile=$1
-    if [ -z "$lockfile" ]; then
-        echo "Error: missing lockfile arg passed to release_lock()"
-        return 1
+        return 0
+    }
+    release_lock() {
+        lockfile=$1
+        if [ -z "$lockfile" ]; then
+            echo "Error: missing lockfile arg passed to release_lock()"
+            return 1
+        fi
+        
+        rm -f $lockfile.lock
+    }
+
+    LOCKDIR="/tmp/qemu-tap-locks"
+    if [ ! -d "$LOCKDIR" ]; then
+        mkdir $LOCKDIR
+        chmod 777 $LOCKDIR
     fi
 
-    rm -f $lockfile.lock
-    exec  8>&-
-}
+    IFCONFIG=`which ifconfig 2> /dev/null`
+    if [ -z "$IFCONFIG" ]; then
+        IFCONFIG=/sbin/ifconfig
+    fi
 
-LOCKDIR="/tmp/qemu-tap-locks"
-if [ ! -d "$LOCKDIR" ]; then
-    mkdir $LOCKDIR
-    chmod 777 $LOCKDIR
-fi
+    if [ ! -x "$IFCONFIG" ]; then
+          echo "$IFCONFIG cannot be executed"
+          exit 1
+    fi
 
-IFCONFIG=`which ifconfig 2> /dev/null`
-if [ -z "$IFCONFIG" ]; then
-    IFCONFIG=/sbin/ifconfig
-fi
-if [ ! -x "$IFCONFIG" ]; then
-       echo "$IFCONFIG cannot be executed"
-       exit 1
-fi
+    POSSIBLE=`$IFCONFIG -a | grep '^tap' | awk '{print $1}' | sed s/://`
+    TAP=""
+    LOCKFILE=""
+    for tap in $POSSIBLE; do
+        LOCKFILE="$LOCKDIR/$tap"
+        echo "Acquiring lockfile for $tap..."
+        acquire_lock $LOCKFILE
+        if [ $? -eq 0 ]; then
+           TAP=$tap
+           break
+        fi
+    done
+
+    if [ "$TAP" = "" ]; then
+        if [ -e "$NOSUDO_FLAG" ]; then
+            echo "Error: There are no available tap devices to use for networking,"
+            echo "and I see $NOSUDO_FLAG exists, so I am not going to try creating"
+            echo "a new one with sudo."
+            exit 1
+        fi
 
-POSSIBLE=`$IFCONFIG -a | grep '^tap' | awk '{print $1}' | sed s/://`
-TAP=""
-LOCKFILE=""
-for tap in $POSSIBLE; do
-    LOCKFILE="$LOCKDIR/$tap"
-    echo "Acquiring lockfile for $tap..."
-    acquire_lock $LOCKFILE
-    if [ $? -eq 0 ]; then
-        TAP=$tap
-        break
-    fi
-done
-
-if [ "$TAP" = "" ]; then
-    if [ -e "$NOSUDO_FLAG" ]; then
-        echo "Error: There are no available tap devices to use for networking,"
-        echo "and I see $NOSUDO_FLAG exists, so I am not going to try creating"
-        echo "a new one with sudo."
-        exit 1
-    fi
-
-    GROUPID=`id -g`
-    USERID=`id -u`
-    echo "Setting up tap interface under sudo"
-    # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
-    # but inactive. This looks scary but is harmless
-    tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT 2> /dev/null`
-    if [ $? -ne 0 ]; then
-        # Re-run standalone to see verbose errors
-        sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
-        return 1
+        GROUPID=`id -g`
+        USERID=`id -u`
+        echo "Setting up tap interface under sudo"
+        # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
+        # but inactive. This looks scary but is harmless
+        tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT 2> /dev/null`
+        if [ $? -ne 0 ]; then
+            # Re-run standalone to see verbose errors
+            sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
+            return
+        fi
+        LOCKFILE="$LOCKDIR/$tap"
+        echo "Acquiring lockfile for $tap..."
+        acquire_lock $LOCKFILE
+        if [ $? -eq 0 ]; then
+            TAP=$tap
+        fi 
+    else
+        echo "Using preconfigured tap device '$TAP'"
     fi
-    LOCKFILE="$LOCKDIR/$tap"
-    echo "Acquiring lockfile for $tap..."
-    acquire_lock $LOCKFILE
-    if [ $? -eq 0 ]; then
-        TAP=$tap
-    fi 
-else
-    echo "Using preconfigured tap device '$TAP'"
-fi
-
-cleanup() {
+    
+    cleanup() {
     if [ ! -e "$NOSUDO_FLAG" ]; then
         # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
         # but inactive. This looks scary but is harmless
@@ -209,21 +227,33 @@ cleanup() {
     stty sane
 }
 
-n0=$(echo $TAP | sed 's/tap//')
-n1=$(($n0 * 2 + 1))
-n2=$(($n1 + 1))
-
-KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
-QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
-if [ "$KVM_ACTIVE" = "yes" ]; then
-    QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-    DROOT="/dev/vda"
-    ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
-else
-    QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
-    DROOT="/dev/hda"
-    ROOTFS_OPTIONS="-hda $ROOTFS"
+    n0=$(echo $TAP | sed 's/tap//')
+    n1=$(($n0 * 2 + 1))
+    n2=$(($n1 + 1))
+    KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
+    QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
+
+    if [ "$KVM_ACTIVE" = "yes" ]; then
+        QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
+        DROOT="/dev/vda"
+        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
+    else
+        QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
+        DROOT="/dev/hda"
+        ROOTFS_OPTIONS="-hda $ROOTFS"
+    fi
 fi
+cleanup() {
+    
+    if [ "$NFSRUNNING" = "true" ]; then
+    echo "Shutting down the userspace NFS server..."
+    echo "runqemu-export-rootfs stop $ROOTFS"
+    runqemu-export-rootfs stop $ROOTFS
+    fi
+    # If QEMU crashes or somehow tty properties are not restored
+    # after qemu exits, we need to run stty sane
+    stty sane
+}
 KERNCMDLINE="mem=$QEMU_MEMORY"
 QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
 
@@ -414,7 +444,11 @@ if [ "$MACHINE" = "qemuppc" ]; then
     MACHINE_SUBTYPE=mac99
     CPU_SUBTYPE=G4
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
+    if [ "$SLIRP_ENABLED" = "yes" ]; then
+        QEMU_NETWORK_CMD=""
+    else 
+        QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
+    fi
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/hda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
-- 
1.7.9.5



