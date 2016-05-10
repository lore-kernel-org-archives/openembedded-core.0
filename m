Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F920731B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4A8EFi0002637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:15 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:14:06 -0700
Message-ID: <4f6d144c3bdcd873fced6831b4e8da1d8ee29051.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 8/8] runqemu/runqemu-internal: refactor it
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
X-List-Received-Date: Tue, 10 May 2016 08:14:15 -0000
Content-Type: text/plain

* Why refactor
  The old runqemu had hardcoded machine knowledge, which limited its
  usage, for example, qemu-system-foo can boot the target, but runqemu
  can't, and we need edit runqemu/runqemu-internal a lot to support boot
  it.

* Brief introduction on implemention
  The basic thought is that, machine/bsp developer knows clearly on
  whether qemu can boot the target or not (QEMU_BOOT_SUPPORTED = "1" or
  "0"), and how to boot it, so we leave these settings in the machine's
  configuration.
  - qemu-boot.bbclass will write machine's info to
    ${DEPLOY_DIR_IMAGE}/qemu-boot, and runqemu will invoke it.
  - We need use "runqemu -m <machine>" rather than "runqemu <machine>"
    since the scripts knows nothing about machine any more, and the
    similar to other old options, this is good for future's extension.
  - I have updated all the machine's configuration except qemush4, since
    I can't find this machine anywhere.
  - Several machines such as genericx86 and genericx86-64 can be boot by
    new runqemu without any changes.

* Usage
Usage: runqemu <options>
    -m <machine>, specify machine
    -k <kernel>, specify kernel
    -r <rootfs>, specify disk image, rootfs or nfs dir
    -t <fstype>, specify fstypes, supported types:
                 ext[234], jffs2, btrfs, cpio.gz(ramfs), cpio, hddimg,
                 hdddirect, vmdk, wic, qcow2, vdi
    -n, nographic, disables video console
    -K, enable KVM when running x86 and x86-64 (VT-capable CPU required)
    -V, enables KVM with VHOST support when running x86 and x86-64 (VT-capable CPU required)
    -v, publicvnc - enable a VNC server open to all hosts
    -u, slirp mode, use user mode networking (no root privilege is required)
    -a, support audio
    -s, enable a serial console on /dev/ttyS0
    -q <qemuparams> - specify custom parameters to QEMU
    -b <bootparams> - specify custom kernel parameters during boot
    -p <portnum>, tcp serial port number
    -B <biosdir>, bios directory
    -F <biosfilename>, bios filename.

Examples:
  runqemu -m qemuarm -n
  runqemu -m qemuarm -t ext4
  runqemu -m qemux86-64 -r core-image-sato -t ext4
  runqemu -m qemux86 -r path/to/nfsrootdir/
  runqemu -r path/to/deploy/dir/image/file.vmdk
  runqemu -m qemumips -q "-m 256"
  runqemu -m qemuppc -b "psplash=false"

[YOCTO #4827]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu          | 603 ++++++++++++++---------------------------
 scripts/runqemu-internal | 678 ++++++++++++++++-------------------------------
 2 files changed, 428 insertions(+), 853 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d7fa941..f9261bb 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -2,7 +2,7 @@
 #
 # Handle running OE images standalone with QEMU
 #
-# Copyright (C) 2006-2011 Linux Foundation
+# Copyright (C) 2006-2016 Linux Foundation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -18,33 +18,35 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-    MYNAME=`basename $0`
 cat <<_EOF
-
-Usage: you can run this script with any valid combination
-of the following environment variables (in any order):
-  KERNEL - the kernel image file to use
-  ROOTFS - the rootfs image file or nfsroot directory to use
-  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
-  Simplified QEMU command-line options can be passed with:
-    nographic - disables video console
-    serial - enables a serial console on /dev/ttyS0
-    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)
-    kvm-vhost - enables KVM with vhost support when running qemux86/qemux86-64 (VT-capable CPU required)
-    publicvnc - enable a VNC server open to all hosts
-  qemuparams="xyz" - specify custom parameters to QEMU
-  bootparams="xyz" - specify custom kernel parameters during boot
+Usage: runqemu <options>
+    -m <machine>, specify machine
+    -k <kernel>, specify kernel
+    -r <rootfs>, specify disk image, rootfs or nfs dir
+    -t <fstype>, specify fstypes, supported types:
+                 ext[234], jffs2, btrfs, cpio.gz(ramfs), cpio, hddimg,
+                 hdddirect, vmdk, wic, qcow2, vdi
+    -n, nographic, disables video console
+    -K, enable KVM when running x86 and x86-64 (VT-capable CPU required)
+    -V, enables KVM with VHOST support when running x86 and x86-64 (VT-capable CPU required)
+    -v, publicvnc - enable a VNC server open to all hosts
+    -u, slirp mode, use user mode networking (no root privilege is required)
+    -a, support audio
+    -s, enable a serial console on /dev/ttyS0
+    -q <qemuparams> - specify custom parameters to QEMU
+    -b <bootparams> - specify custom kernel parameters during boot
+    -p <portnum>, tcp serial port number
+    -B <biosdir>, bios directory
+    -F <biosfilename>, bios filename.
 
 Examples:
-  $MYNAME qemuarm
-  $MYNAME qemux86-64 core-image-sato ext4
-  $MYNAME qemux86-64 wic-image-minimal wic
-  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
-  $MYNAME qemux86 iso/hddimg/vmdk/qcow2/vdi/ramfs/cpio.gz...
-  $MYNAME qemux86 qemuparams="-m 256"
-  $MYNAME qemux86 bootparams="psplash=false"
-  $MYNAME path/to/<image>-<machine>.vmdk
-  $MYNAME path/to/<image>-<machine>.wic
+  runqemu -m qemuarm -n
+  runqemu -m qemuarm -t ext4
+  runqemu -m qemux86-64 -r core-image-sato -t ext4
+  runqemu -m qemux86 -r path/to/nfsrootdir/
+  runqemu -r path/to/deploy/dir/image/file.vmdk
+  runqemu -m qemumips -q "-m 256"
+  runqemu -m qemuppc -b "psplash=false"
 _EOF
     exit 1
 }
@@ -53,232 +55,192 @@ if [ "x$1" = "x" ]; then
     usage
 fi
 
-error() {
+error_help() {
     echo "Error: "$*
     usage
 }
 
-MACHINE=${MACHINE:=""}
-KERNEL=${KERNEL:=""}
-ROOTFS=${ROOTFS:=""}
-FSTYPE=${FSTYPE:=""}
+error_exit() {
+    echo "Error: "$*
+    exit 1
+}
+
 LAZY_ROOTFS=""
 SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
 SCRIPT_KERNEL_OPT=""
 SERIALSTDIO=""
+SLIRP_ENABLED=""
 TCPSERIAL_PORTNUM=""
-KVM_ENABLED="no"
-KVM_ACTIVE="no"
-VHOST_ENABLED="no"
-VHOST_ACTIVE="no"
-IS_VM="false"
-
-# Determine whether the file is a kernel or QEMU image, and set the
-# appropriate variables
-process_filename() {
-    filename=$1
-
-    # Extract the filename extension
-    EXT=`echo $filename | awk -F . '{ print \$NF }'`
-    case /$EXT/ in
-	/bin/)
-		# A file ending in .bin is a kernel
-		[ -z "$KERNEL" ] && KERNEL=$filename || \
-		    error "conflicting KERNEL args [$KERNEL] and [$filename]"
-		;;
-	/ext[234]/|/jffs2/|/btrfs/)
-		# A file ending in a supportted fs type is a rootfs image
-		if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
-		    FSTYPE=$EXT
-		    ROOTFS=$filename
-		else
-		    error "conflicting FSTYPE types [$FSTYPE] and [$EXT]"
-		fi
-		;;
-	/hddimg/|/hdddirect/|/vmdk/|/wic/|/qcow2/|/vdi/)
-		FSTYPE=$EXT
-		VM=$filename
-		ROOTFS=$filename
-		IS_VM="true"
-		;;
-	*)
-		error "unknown file arg [$filename]"
-		;;
+KVM_ENABLED=""
+KVM_ACTIVE=""
+VHOST_ENABLED=""
+VHOST_ACTIVE=""
+IS_VM="no"
+# Export for qemu-system-foo
+export QEMU_AUDIO_DRV="none"
+
+# Check whether it is a supported fstype.
+check_fstype() {
+    case /$1/ in
+    /ext[234]/|/jffs2/|/btrfs/|/cpio.gz/|/cpio/)
+        :
+        ;;
+    /ramfs/)
+        FSTYPE="cpio.gz"
+        ;;
+    /hddimg/|/hdddirect/|/vmdk/|/wic/|/qcow2/|/vdi/|/iso/)
+        IS_VM="yes"
+        ;;
+    *)
+        error_exit "Unknown FSTYPE: $1"
+        ;;
     esac
 }
 
-check_fstype_conflicts() {
-    if [ -z "$FSTYPE" -o "$FSTYPE" = "$1" ]; then
-        FSTYPE=$1
-    else
-        error "conflicting FSTYPE types [$FSTYPE] and [$1]"
-    fi
-}
-# Parse command line args without requiring specific ordering. It's a
-# bit more complex, but offers a great user experience.
-while true; do
-    arg=${1}
-    case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
-            [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
-                error "conflicting MACHINE types [$MACHINE] and [$arg]"
-            ;;
-        "ext"[234] | "jffs2" | "nfs" | "btrfs")
-            check_fstype_conflicts $arg
-            ;;
-        "hddimg" | "hdddirect" | "wic" | "vmdk" | "qcow2" | "vdi" | "iso")
-            check_fstype_conflicts $arg
-            IS_VM="true"
-            ;;
-        "ramfs" | "cpio.gz")
-            FSTYPE=cpio.gz
-            ;;
-        "nographic")
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
-            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
-            ;;
-        "serial")
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
-            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
-            SERIALSTDIO="1"
-            ;;
-        "tcpserial="*)
-            TCPSERIAL_PORTNUM=${arg##tcpserial=}
-            ;;
-        "biosdir="*)
-            CUSTOMBIOSDIR="${arg##biosdir=}"
-	    ;;
-        "biosfilename="*)
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -bios ${arg##biosfilename=}"
-            ;;
-        "qemuparams="*)
-            SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
-
-            # Warn user if they try to specify serial or kvm options
-            # to use simplified options instead
-            serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
-            kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
-            vga_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-vga\)'`
-            [ ! -z "$serial_option" -o ! -z "$kvm_option" ] && \
-                echo "Please use simplified serial or kvm options instead"
-            ;;
-        "bootparams="*)
-            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT ${arg##bootparams=}"
-            ;;
-        "audio")
-            if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" ]; then
-                echo "Enabling audio in qemu."
-                echo "Please install snd_intel8x0 or snd_ens1370 driver in linux guest."
-                QEMU_AUDIO_DRV="alsa"
-                SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -soundhw ac97,es1370"
-            fi
-            ;;
-        "kvm")
-            KVM_ENABLED="yes"
-            KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
-            ;;
-        "kvm-vhost")
-            KVM_ENABLED="yes"
-            KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
-            VHOST_ENABLED="yes"
-            ;;
-        "slirp")
-            SLIRP_ENABLED="yes"
-            ;;
-        "publicvnc")
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc :0"
-            ;;
-        *-image*)
-            [ -z "$ROOTFS" ] || \
-        		error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
-            if [ -f "$arg" ]; then
-                process_filename $arg
-            elif [ -d "$arg" ]; then
-                # Handle the case where the nfsroot dir has -image-
-                # in the pathname
-                echo "Assuming $arg is an nfs rootfs"
-                FSTYPE=nfs
-                ROOTFS=$arg
-            else
-                ROOTFS=$arg
-                LAZY_ROOTFS="true"
-            fi
-            ;;
-        "") break ;;
-        *)
-            # A directory name is an nfs rootfs
-            if [ -d "$arg" ]; then
-                echo "Assuming $arg is an nfs rootfs"
-                if [ -z "$FSTYPE" -o "$FSTYPE" = "nfs" ]; then
-                    FSTYPE=nfs
-                else
-                    error "conflicting FSTYPE types [$arg] and nfs"
-                fi
-
-                if [ -z "$ROOTFS" ]; then
-                    ROOTFS=$arg
-                else
-                    error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
-                fi
-            elif [ -f "$arg" ]; then
-                process_filename $arg
-            else
-                error "unable to classify arg [$arg]"
-            fi
-            ;;
+while getopts "m:t:k:aKVhvsnuq:b:r:p:B:F:" OPT; do
+    case $OPT in
+    m)
+        MACHINE="$OPTARG"
+        ;;
+    k)
+        KERNEL="$OPTARG"
+        if [ ! -e "$KERNEL" ]; then
+            error_exit "kernel: \"$KERNEL\" not found!"
+        fi
+        ;;
+    t)
+        FSTYPE="$OPTARG"
+        check_fstype $FSTYPE
+        ;;
+    K|V)
+        KVM_ENABLED="yes"
+        KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
+        [ "$OPT" = "V" ] && VHOST_ENABLED="yes"
+        ;;
+    s)
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic -serial stdio"
+        SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
+        SERIALSTDIO="1"
+        ;;
+    n)
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
+        SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
+        ;;
+    q)
+        SCRIPT_QEMU_EXTRA_OPT="$OPTARG"
+        # Warn user if they try to specify serial or kvm options
+        # to use simplified options instead
+        serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
+        kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
+        vga_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-vga\)'`
+        [ ! -z "$serial_option" -o ! -z "$kvm_option" ] && \
+            echo "Please use simplified -s or -K options instead"
+        ;;
+    b)
+        SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT $OPTARG"
+        ;;
+    v)
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc :0"
+        ;;
+    r)
+        if [ -d "$OPTARG" ]; then
+            echo "Assuming $OPTARG is an nfs rootfs"
+            FSTYPE=nfs
+        elif [ -e "$OPTARG" ]; then
+            # Extract the extension
+            EXT=`echo $OPTARG | awk -F . '{ print \$NF }'`
+            FSTYPE=$EXT
+            check_fstype $FSTYPE
+        else
+            LAZY_ROOTFS="yes"
+        fi
+        ROOTFS="$OPTARG"
+        ;;
+    u)
+        SLIRP_ENABLED="yes"
+        ;;
+    p)
+        TCPSERIAL_PORTNUM="$OPTARG"
+        ;;
+    a)
+        export QEMU_AUDIO_DRV="alsa"
+        ;;
+    B)
+        CUSTOMBIOSDIR="$OPTARG"
+        ;;
+    F)
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -bios $OPTARG"
+        ;;
+    *)
+        usage
+        ;;
     esac
-    shift
 done
 
-if [ ! -c /dev/net/tun ] ; then
-	echo "TUN control device /dev/net/tun is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)"
-	exit 1
-elif [ ! -w /dev/net/tun ] ; then
-	echo "TUN control device /dev/net/tun is not writable, please fix (e.g. sudo chmod 666 /dev/net/tun)"
-	exit 1
+if [ ! -z "$MACHINE" ]; then
+    if [ -z "$DEPLOY_DIR_IMAGE" ]; then
+        eval `MACHINE=$MACHINE bitbake -e | grep -m 1 '^DEPLOY_DIR_IMAGE="'`
+    fi
+    runqemu_file=$DEPLOY_DIR_IMAGE/qemu-boot
+elif [ -e "$KERNEL" ]; then
+    runqemu_file=$(dirname $KERNEL)/qemu-boot
+elif [ -e "$ROOTFS" -a ! -d "$ROOTFS" ]; then
+    runqemu_file=$(dirname $ROOTFS)/qemu-boot
 fi
 
-# Report errors for missing combinations of options
-if [ -z "$MACHINE" -a -z "$KERNEL" -a -z "$VM" -a "$FSTYPE" != "wic" ]; then
-    error "you must specify at least a MACHINE or KERNEL argument"
+if [ -z "$runqemu_file" ]; then
+    echo "Need one of -m, -k or -r!"
 fi
-if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
-    error "NFS booting without an explicit ROOTFS path is not yet supported"
+
+if [ ! -e "$runqemu_file" ]; then
+    error_exit "$runqemu_file is not found, make sure you have built the image, and the machine is supported by qemu."
 fi
 
-if [ -z "$MACHINE" ]; then
-    if [ "$IS_VM" = "true" ]; then
-        [ "x$FSTYPE" = "xwic" ] && filename=$ROOTFS || filename=$VM
-        MACHINE=`basename $filename | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
-        if [ -z "$MACHINE" ]; then
-            error "Unable to set MACHINE from image filename [$VM]"
-        fi
-        echo "Set MACHINE to [$MACHINE] based on image [$VM]"
+. $runqemu_file || exit 1
+
+KERNEL=${KERNEL:=$DEPLOY_DIR_IMAGE/$QEMU_DEFAULT_KERNEL}
+FSTYPE=${FSTYPE:=$QEMU_DEFAULT_FSTYPE}
+
+if [ "$QEMU_AUDIO_DRV" = "alsa" ]; then
+    if [ "$TUNE_ARCH" = "x86" -o "$TUNE_ARCH" = "x86_64" ]; then
+        echo "Enabling audio in qemu."
+        echo "Please install snd_intel8x0 or snd_ens1370 driver in linux guest."
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -soundhw ac97,es1370"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
-        if [ -z "$MACHINE" ]; then
-            error "Unable to set MACHINE from kernel filename [$KERNEL]"
-        fi
-        echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
+        error_exit "$TUNE_ARCH doesn't support audio"
     fi
 fi
 
+# Report errors for missing combinations of options
+if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
+    error_exit "NFS booting without an explicit ROOTFS path is not yet supported"
+fi
+
+if [ ! -c /dev/net/tun ] ; then
+    error_exit "TUN control device /dev/net/tun is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)"
+elif [ ! -w /dev/net/tun ] ; then
+    error_exit "TUN control device /dev/net/tun is not writable, please fix (e.g. sudo chmod 666 /dev/net/tun)"
+fi
+
 YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
 YOCTO_PARAVIRT_KVM_WIKI="https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM"
 # Detect KVM configuration
 if [ "x$KVM_ENABLED" = "xyes" ]; then
     if [ -z "$KVM_CAPABLE" ]; then
         echo "You are trying to enable KVM on a cpu without VT support."
-        echo "Remove kvm from the command-line, or refer"
+        echo "Remove -K from the command-line, or refer"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [ "x$MACHINE" != "xqemux86" -a "x$MACHINE" != "xqemux86-64" ]; then
-        echo "KVM only support x86 & x86-64. Remove kvm from the command-line";
-        exit 1;
-    fi
+    case $TUNE_ARCH in
+        x86|i[3456]86|x86_64)
+            echo "Enabling KVM support"
+        ;;
+        *)
+            error_exit "KVM only support x86 & x86-64. Remove -K from the command-line";
+        ;;
+    esac
     if [ ! -e /dev/kvm ]; then
         echo "Missing KVM device. Have you inserted kvm modules?"
         echo "For further help see:"
@@ -313,228 +275,71 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
     fi
 fi
 
-machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
-# MACHINE is now set for all cases
-
-# Defaults used when these vars need to be inferred
-QEMUX86_DEFAULT_KERNEL=bzImage-qemux86.bin
-QEMUX86_DEFAULT_FSTYPE=ext4
-
-QEMUX86_64_DEFAULT_KERNEL=bzImage-qemux86-64.bin
-QEMUX86_64_DEFAULT_FSTYPE=ext4
-
-QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
-QEMUARM_DEFAULT_FSTYPE=ext4
-
-QEMUARM64_DEFAULT_KERNEL=Image-qemuarm64.bin
-QEMUARM64_DEFAULT_FSTYPE=ext4
-
-QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
-QEMUMIPS_DEFAULT_FSTYPE=ext4
-
-QEMUMIPSEL_DEFAULT_KERNEL=vmlinux-qemumipsel.bin
-QEMUMIPSEL_DEFAULT_FSTYPE=ext4
-
-QEMUMIPS64_DEFAULT_KERNEL=vmlinux-qemumips64.bin
-QEMUMIPS64_DEFAULT_FSTYPE=ext4
-
-QEMUSH4_DEFAULT_KERNEL=vmlinux-qemumips.bin
-QEMUSH4_DEFAULT_FSTYPE=ext4
-
-QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
-QEMUPPC_DEFAULT_FSTYPE=ext4
-
-QEMUMICROBLAZE_DEFAULT_KERNEL=linux.bin.ub
-QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
-
-QEMUZYNQ_DEFAULT_KERNEL=uImage
-QEMUZYNQ_DEFAULT_FSTYPE=cpio
-
-setup_path_vars() {
-    if [ -z "$OE_TMPDIR" ] ; then
-        PATHS_REQUIRED=true
-    elif [ "$1" = "1" -a -z "$DEPLOY_DIR_IMAGE" ] ; then
-        PATHS_REQUIRED=true
-    else
-        PATHS_REQUIRED=false
-    fi
-
-    if [ "$PATHS_REQUIRED" = "true" ]; then
-        # Try to get the variable values from bitbake
-        type -P bitbake &>/dev/null || {
-            echo "In order for this script to dynamically infer paths";
-            echo "to kernels or filesystem images, you either need";
-            echo "bitbake in your PATH or to source oe-init-build-env";
-            echo "before running this script" >&2;
-            exit 1; }
-
-        # We have bitbake in PATH, get the variable values from bitbake
-        BITBAKE_ENV_TMPFILE=`mktemp --tmpdir runqemu.XXXXXXXXXX`
-        if [ "$?" != "0" ] ; then
-            echo "Error: mktemp failed for bitbake environment output"
-            exit 1
-        fi
-
-        MACHINE=$MACHINE bitbake -e > $BITBAKE_ENV_TMPFILE
-        if [ -z "$OE_TMPDIR" ] ; then
-            OE_TMPDIR=`sed -n 's/^TMPDIR=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
-        fi
-        if [ -z "$DEPLOY_DIR_IMAGE" ] ; then
-            DEPLOY_DIR_IMAGE=`sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
-        fi
-        if [ -z "$OE_TMPDIR" ]; then
-            # Check for errors from bitbake that the user needs to know about
-            BITBAKE_OUTPUT=`cat $BITBAKE_ENV_TMPFILE | wc -l`
-            if [ "$BITBAKE_OUTPUT" -eq "0" ]; then
-                echo "Error: this script needs to be run from your build directory, or you need"
-                echo "to explicitly set OE_TMPDIR and DEPLOY_DIR_IMAGE in your environment"
-            else
-                echo "There was an error running bitbake to determine TMPDIR"
-                echo "Here is the output from 'bitbake -e':"
-                cat $BITBAKE_ENV_TMPFILE
-            fi
-            rm $BITBAKE_ENV_TMPFILE
-            exit 1
-        fi
-        rm $BITBAKE_ENV_TMPFILE
-    fi
-}
-
-setup_sysroot() {
-    # Toolchain installs set up $OECORE_NATIVE_SYSROOT in their
-    # environment script. If that variable isn't set, we're
-    # either in an in-tree build scenario or the environment
-    # script wasn't source'd.
-    if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
-        setup_path_vars
-        BUILD_ARCH=`uname -m`
-        BUILD_OS=`uname | tr '[A-Z]' '[a-z]'`
-        BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
-
-        OECORE_NATIVE_SYSROOT=$OE_TMPDIR/sysroots/$BUILD_SYS
-    fi 
-
-    # Some recipes store the BIOS under $OE_TMPDIR/sysroots/$MACHINE,
-    # now defined as OECORE_MACHINE_SYSROOT. The latter is used when searching
-    # BIOS, VGA BIOS and keymaps.
-    if [ -z "$OECORE_MACHINE_SYSROOT" ]; then
-        OECORE_MACHINE_SYSROOT=$OE_TMPDIR/sysroots/$MACHINE
-    fi
-}
-
 # Locate a rootfs image to boot which matches our expected
 # machine and fstype. 
 findimage() {
-    where=$1
-    machine=$2
-    extension=$3
+    machine=$1
+    ext=$2
 
     # Sort rootfs candidates by modification time - the most
     # recently created one is the one we most likely want to boot.
-    filename=`ls -t1 $where/*-image*$machine.$extension 2>/dev/null | head -n1`
+    filename=`ls -t1 $DEPLOY_DIR_IMAGE/*-image*$machine.$ext 2>/dev/null | head -n1`
     if [ "x$filename" != "x" ]; then
         ROOTFS=$filename
         return
     fi
 
-    echo "Couldn't find a $machine rootfs image in $where."
-    exit 1
+    error_exit "Couldn't find a $ext rootfs image in $DEPLOY_DIR_IMAGE"
 }
 
-if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
-    # Extract the filename extension
-    EXT=`echo $ROOTFS | awk -F . '{ print \$NF }'`
-    if [ "x$EXT" = "xext2" -o "x$EXT" = "xext3" -o \
-          "x$EXT" = "xjffs2" -o "x$EXT" = "xbtrfs" -o \
-          "x$EXT" = "xext4" ]; then
-        FSTYPE=$EXT
-    else
-        echo "Note: Unable to determine filesystem extension for $ROOTFS"
-        echo "We will use the default FSTYPE for $MACHINE"
-        # ...which is done further below...
-    fi
-fi
-
-if [ -z "$KERNEL" -a "$IS_VM" = "false" ]; then \
-    setup_path_vars 1
-    eval kernel_file=\$${machine2}_DEFAULT_KERNEL
-    KERNEL=$DEPLOY_DIR_IMAGE/$kernel_file
-
-    if [ -z "$KERNEL" ]; then
-        error "Unable to determine default kernel for MACHINE [$MACHINE]"
-    fi
-fi
-# KERNEL is now set for all cases
-
-if [ -z "$FSTYPE" ]; then
-    eval FSTYPE=\$${machine2}_DEFAULT_FSTYPE
-
-    if [ -z "$FSTYPE" ]; then
-        error "Unable to determine default fstype for MACHINE [$MACHINE]"
-    fi
-fi
-
-# FSTYPE is now set for all cases
-
 # Handle cases where a ROOTFS type is given instead of a filename, e.g.
 # core-image-sato
-if [ "$LAZY_ROOTFS" = "true" ]; then
-    setup_path_vars 1
+if [ "$LAZY_ROOTFS" = "yes" ]; then
     echo "Assuming $ROOTFS really means $DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE"
-    if [ "$IS_VM" = "true" ]; then
-        VM=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
-    else
-        ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
-    fi
+    ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
 fi
-
 if [ -z "$ROOTFS" ]; then
-    setup_path_vars 1
-    T=$DEPLOY_DIR_IMAGE
-    eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
-    findimage $T $MACHINE $FSTYPE
-
+    findimage $MACHINE $FSTYPE
     if [ -z "$ROOTFS" ]; then
-        error "Unable to determine default rootfs for MACHINE [$MACHINE]"
-    elif [ "$IS_VM" = "true" ]; then
-		VM=$ROOTFS
+        error_help "Unable to determine default rootfs for MACHINE [$MACHINE]"
     fi
 fi
 # ROOTFS is now set for all cases, now expand it to be an absolute path, it should exist at this point
-
 ROOTFS=`readlink -f $ROOTFS`
+if [ ! -e "$ROOTFS" ]; then
+    error_exit "Error: Image file $ROOTFS doesn't exist"
+fi
 
 echo ""
 echo "Continuing with the following parameters:"
-if [ "$IS_VM" = "false" ]; then
+if [ "$IS_VM" = "no" ]; then
+    if [ ! -f "$KERNEL" ]; then
+        error_exit "Error: Kernel image file $KERNEL doesn't exist"
+    fi
     echo "KERNEL: [$KERNEL]"
     echo "ROOTFS: [$ROOTFS]"
 else
-    echo "VM:   [$VM]"
+    echo "VM:   [$ROOTFS]"
 fi
-echo "FSTYPE: [$FSTYPE]"
-
-setup_sysroot
-# OECORE_NATIVE_SYSROOT and OECORE_MACHINE_SYSROOT are now set for all cases
 
 INTERNAL_SCRIPT="$0-internal"
 if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
-INTERNAL_SCRIPT=`which runqemu-internal`
+    INTERNAL_SCRIPT=`which runqemu-internal`
 fi
 
 # Specify directory for BIOS, VGA BIOS and keymaps
 if [ ! -z "$CUSTOMBIOSDIR" ]; then
-    if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
-        echo "Assuming biosdir is $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
-    elif [ -d "$OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR" ]; then
-        echo "Assuming biosdir is $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
+    if [ -d "$STAGING_DIR_NATIVE/$CUSTOMBIOSDIR" ]; then
+        echo "Assuming biosdir is $STAGING_DIR_NATIVE/$CUSTOMBIOSDIR"
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $STAGING_DIR_NATIVE/$CUSTOMBIOSDIR"
+    elif [ -d "$STAGING_DIR_HOST/$CUSTOMBIOSDIR" ]; then
+        echo "Assuming biosdir is $STAGING_DIR_HOST/$CUSTOMBIOSDIR"
+        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $STAGING_DIR_HOST/$CUSTOMBIOSDIR"
     else
         if [ ! -d "$CUSTOMBIOSDIR" ]; then
             echo "Custom BIOS directory not found. Tried: $CUSTOMBIOSDIR"
-            echo "and $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
-            echo "and $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
+            echo "and $STAGING_DIR_NATIVE/$CUSTOMBIOSDIR"
+            echo "and $STAGING_DIR_HOST/$CUSTOMBIOSDIR"
             exit 1;
         fi
         echo "Assuming biosdir is $CUSTOMBIOSDIR"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ac1c703..98faeb5 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -2,7 +2,7 @@
 
 # Handle running OE images under qemu
 #
-# Copyright (C) 2006-2011 Linux Foundation
+# Copyright (C) 2006-2016 Linux Foundation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -22,22 +22,19 @@
 #   SERIAL_LOGFILE (optional) - log the serial port output to a file
 #
 # Image options:
-#   MACHINE - the machine to run
 #   FSTYPE - the image type to run
 #   KERNEL - the kernel image file to use
 #   ROOTFS - the disk image file to use
 #
 
-mem_size=-1
-
-#Get rid of <> and get the contents of extra qemu running params
-SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e 's/<//' -e 's/>//'`
-#if user set qemu memory, eg: -m 256 in qemu extra params, we need to do some 
+# if user set qemu memory, eg: -m 256 in qemu extra params, we need to do some 
 # validation check
 mem_set=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-m[[:space:]] *[0-9]*\)'`
-if [ ! -z "$mem_set" ] ; then
-#Get memory setting size from user input
-  mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
+if [ -n "$mem_set" ] ; then
+    #Get memory setting size from user input
+    mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
+else
+    mem_size=`echo $QEMU_MEM | sed 's/-m[[:space:]] *//'`
 fi
 
 # This file is created when runqemu-gen-tapdevs creates a bank of tap
@@ -58,195 +55,171 @@ fi
 
 NFSRUNNING="false"
 
-#capture original stty values
+# capture original stty values
 ORIG_STTY=$(stty -g)
 
+DROOT="/dev/vda"
+ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
 if [ "$SLIRP_ENABLED" = "yes" ]; then
     KERNEL_NETWORK_CMD="ip=dhcp"
     QEMU_TAP_CMD=""
-    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
     QEMU_NETWORK_CMD=""
-    DROOT="/dev/vda"
-    ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
 else
-        acquire_lock() {
-            lockfile=$1
-            if [ -z "$lockfile" ]; then
-                echo "Error: missing lockfile arg passed to acquire_lock()"
-                return 1
-            fi
-
-            touch $lockfile.lock 2>/dev/null
-            if [ $? -ne 0 ]; then
-                echo "Acquiring lockfile for $lockfile.lock failed"
-                return 1
-            fi
-            exec 8>$lockfile.lock
-            flock -n -x 8
-            if [ $? -ne 0 ]; then
-                exec 8>&-
-                return 1
-            fi
-
-            return 0
-        }
-
-        release_lock() {
-            lockfile=$1
-            if [ -z "$lockfile" ]; then
-                echo "Error: missing lockfile arg passed to release_lock()"
-                return 1
-            fi
-
-            rm -f $lockfile.lock
-            exec  8>&-
-        }
-
-        LOCKDIR="/tmp/qemu-tap-locks"
-        if [ ! -d "$LOCKDIR" ]; then
-            mkdir $LOCKDIR
-            chmod 777 $LOCKDIR
+    acquire_lock() {
+        lockfile=$1
+        touch $lockfile.lock 2>/dev/null
+        if [ $? -ne 0 ]; then
+            echo "Acquiring lockfile for $lockfile.lock failed"
+            return 1
+        fi
+        exec 8>$lockfile.lock
+        flock -n -x 8
+        if [ $? -ne 0 ]; then
+            exec 8>&-
+            return 1
+        fi
+
+        return 0
+    }
+
+    release_lock() {
+        lockfile=$1
+        if [ -z "$lockfile" ]; then
+            echo "Error: missing lockfile arg passed to release_lock()"
+            return 1
         fi
 
-        IFCONFIG=`which ip 2> /dev/null`
-        if [ -z "$IFCONFIG" ]; then
-            IFCONFIG=/sbin/ip
+        rm -f $lockfile.lock
+        exec  8>&-
+    }
+
+    LOCKDIR="/tmp/qemu-tap-locks"
+    if [ ! -d "$LOCKDIR" ]; then
+        mkdir $LOCKDIR
+        chmod 777 $LOCKDIR
+    fi
+
+    IFCONFIG=`which ip 2> /dev/null`
+    if [ -z "$IFCONFIG" ]; then
+        IFCONFIG=/sbin/ip
+    fi
+    if [ ! -x "$IFCONFIG" ]; then
+           echo "$IFCONFIG cannot be executed"
+           exit 1
+    fi
+
+    POSSIBLE=`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed -e 's/://' -e 's/@.*//'`
+    TAP=""
+    LOCKFILE=""
+    USE_PRECONF_TAP="no"
+    for tap in $POSSIBLE; do
+        LOCKFILE="$LOCKDIR/$tap"
+        if [ -e "$LOCKFILE.skip" ]; then
+            echo "Found $LOCKFILE.skip, skipping $tap"
+            continue
+        fi
+        echo "Acquiring lockfile for $tap..."
+        acquire_lock $LOCKFILE
+        if [ $? -eq 0 ]; then
+            TAP=$tap
+            USE_PRECONF_TAP="yes"
+            break
         fi
-        if [ ! -x "$IFCONFIG" ]; then
-               echo "$IFCONFIG cannot be executed"
-               exit 1
+    done
+
+    if [ "$TAP" = "" ]; then
+        if [ -e "$NOSUDO_FLAG" ]; then
+            echo "Error: There are no available tap devices to use for networking,"
+            echo "and I see $NOSUDO_FLAG exists, so I am not going to try creating"
+            echo "a new one with sudo."
+            exit 1
         fi
 
-        POSSIBLE=`$IFCONFIG link | grep 'tap' | awk '{print $2}' | sed -e 's/://' -e 's/@.*//'`
-        TAP=""
-        LOCKFILE=""
-        USE_PRECONF_TAP="no"
-        for tap in $POSSIBLE; do
-            LOCKFILE="$LOCKDIR/$tap"
-            if [ -e "$LOCKFILE.skip" ]; then
-                echo "Found $LOCKFILE.skip, skipping $tap"
-                continue
-            fi
-            echo "Acquiring lockfile for $tap..."
-            acquire_lock $LOCKFILE
-            if [ $? -eq 0 ]; then
-                TAP=$tap
-                USE_PRECONF_TAP="yes"
-                break
-            fi
-        done
-
-        if [ "$TAP" = "" ]; then
-            if [ -e "$NOSUDO_FLAG" ]; then
-                echo "Error: There are no available tap devices to use for networking,"
-                echo "and I see $NOSUDO_FLAG exists, so I am not going to try creating"
-                echo "a new one with sudo."
-                exit 1
-            fi
-
-            GROUPID=`id -g`
-            USERID=`id -u`
-            echo "Setting up tap interface under sudo"
+        GROUPID=`id -g`
+        USERID=`id -u`
+        echo "Setting up tap interface under sudo"
+        # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
+        # but inactive. This looks scary but is harmless
+        tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT 2> /dev/null`
+        if [ $? -ne 0 ]; then
+            # Re-run standalone to see verbose errors
+            sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
+            return 1
+        fi
+        LOCKFILE="$LOCKDIR/$tap"
+        echo "Acquiring lockfile for $tap..."
+        acquire_lock $LOCKFILE
+        if [ $? -eq 0 ]; then
+            TAP=$tap
+        fi 
+    else
+        echo "Using preconfigured tap device '$TAP'"
+        echo "If this is not intended, touch $LOCKFILE.skip to make runqemu skip $TAP."
+    fi
+
+    cleanup() {
+        if [ ! -e "$NOSUDO_FLAG" -a "$USE_PRECONF_TAP" = "no" ]; then
             # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
             # but inactive. This looks scary but is harmless
-            tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT 2> /dev/null`
-            if [ $? -ne 0 ]; then
-                # Re-run standalone to see verbose errors
-                sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
-                return 1
-            fi
-            LOCKFILE="$LOCKDIR/$tap"
-            echo "Acquiring lockfile for $tap..."
-            acquire_lock $LOCKFILE
-            if [ $? -eq 0 ]; then
-                TAP=$tap
-            fi 
-        else
-            echo "Using preconfigured tap device '$TAP'"
-            echo "If this is not intended, touch $LOCKFILE.skip to make runqemu skip $TAP."
+            sudo $QEMUIFDOWN $TAP $OECORE_NATIVE_SYSROOT 2> /dev/null
         fi
+        echo "Releasing lockfile of preconfigured tap device '$TAP'"
+        release_lock $LOCKFILE
 
-        cleanup() {
-            if [ ! -e "$NOSUDO_FLAG" -a "$USE_PRECONF_TAP" = "no" ]; then
-                # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
-                # but inactive. This looks scary but is harmless
-                sudo $QEMUIFDOWN $TAP $OECORE_NATIVE_SYSROOT 2> /dev/null
-            fi
-            echo "Releasing lockfile of preconfigured tap device '$TAP'"
-            release_lock $LOCKFILE
-
-            if [ "$NFSRUNNING" = "true" ]; then
-                echo "Shutting down the userspace NFS server..."
-                echo "runqemu-export-rootfs stop $ROOTFS"
-                runqemu-export-rootfs stop $ROOTFS
-            fi
-            # If QEMU crashes or somehow tty properties are not restored
-            # after qemu exits, we need to run stty sane
-            #stty sane
-
-            #instead of using stty sane we set the original stty values
-            stty ${ORIG_STTY}
-
-        }
-
-
-        n0=$(echo $TAP | sed 's/tap//')
-
-        case $n0 in
-            ''|*[!0-9]*)
-                echo "Error Couldn't turn $TAP into an interface number?"
-                exit 1
-                ;;
-        esac
-
-        n1=$(($n0 * 2 + 1))
-        n2=$(($n1 + 1))
-
-        KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
-        QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
-        if [ "$VHOST_ACTIVE" = "yes" ]; then
-            QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
-        else
-            QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
+        if [ "$NFSRUNNING" = "true" ]; then
+            echo "Shutting down the userspace NFS server..."
+            echo "runqemu-export-rootfs stop $ROOTFS"
+            runqemu-export-rootfs stop $ROOTFS
         fi
-        DROOT="/dev/vda"
-        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
+        # If QEMU crashes or somehow tty properties are not restored
+        # after qemu exits, we need to run stty sane
+        #stty sane
 
-        KERNCMDLINE="mem=$QEMU_MEMORY"
-        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
+        #instead of using stty sane we set the original stty values
+        stty ${ORIG_STTY}
 
-        NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
-        export NFS_INSTANCE
+    }
 
-        SERIALOPTS=""
-        if [ "x$SERIAL_LOGFILE" != "x" ]; then
-            SERIALOPTS="-serial file:$SERIAL_LOGFILE"
-        fi
-fi
+    n0=$(echo $TAP | sed 's/tap//')
 
-if [ ! -f "$KERNEL" -a "$IS_VM" = "false" ]; then
-    echo "Error: Kernel image file $KERNEL doesn't exist"
-    cleanup
-    return 1
-fi
+    case $n0 in
+        ''|*[!0-9]*)
+            echo "Error Couldn't turn $TAP into an interface number?"
+            exit 1
+            ;;
+    esac
 
-if [ "$FSTYPE" != "nfs" -a "$IS_VM" = "false" -a ! -f "$ROOTFS" ]; then
-    echo "Error: Image file $ROOTFS doesn't exist"
-    cleanup
-    return 1
+    n1=$(($n0 * 2 + 1))
+    n2=$(($n1 + 1))
+
+    KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
+    QEMU_TAP_CMD="-net tap,vlan=0,ifname=$TAP,script=no,downscript=no"
+    if [ "$VHOST_ACTIVE" = "yes" ]; then
+        QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD,vhost=on"
+    else
+        QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
+    fi
+
+    NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
+    export NFS_INSTANCE
+
+    SERIALOPTS=""
+    if [ "x$SERIAL_LOGFILE" != "x" ]; then
+        SERIALOPTS="-serial file:$SERIAL_LOGFILE"
+    fi
 fi
 
 if [ "$NFS_SERVER" = "" ]; then
     NFS_SERVER="192.168.7.1"
     if [ "$SLIRP_ENABLED" = "yes" ]; then
-	NFS_SERVER="10.0.2.2"
+        NFS_SERVER="10.0.2.2"
     fi
 fi
 
 if [ "$FSTYPE" = "nfs" ]; then
     NFS_DIR=`echo $ROOTFS | sed 's/^[^:]*:\(.*\)/\1/'`
     if [ "$NFS_INSTANCE" = "" ] ; then
-	NFS_INSTANCE=0
+    NFS_INSTANCE=0
     fi
     MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
     NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
@@ -267,324 +240,132 @@ if [ "$FSTYPE" = "nfs" ]; then
 fi
 
 
-set_mem_size() {
-    if [ ! -z "$mem_set" ] ; then
-        #Get memory setting size from user input
-        mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
-    else
-        mem_size=$1
-    fi
-    # QEMU_MEMORY has 'M' appended to mem_size
-    QEMU_MEMORY="$mem_size"M
+# QEMU_MEMORY has 'M' appended to mem_size
+QEMU_MEMORY="$mem_size"M
 
-}
+if [ "$KVM_ACTIVE" = "yes" ]; then
+    CPU_SUBTYPE="$QEMU_CPU_SUBTYPE_KVM"
+else
+    CPU_SUBTYPE="$QEMU_CPU_SUBTYPE"
+fi
 
-config_qemuarm() {
-    set_mem_size 128
-    QEMU=qemu-system-arm
-    MACHINE_SUBTYPE=versatilepb
-    export QEMU_AUDIO_DRV="none"
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
-        KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
-    fi
-    if [ "$FSTYPE" = "nfs" ]; then
-        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-            echo "Error: NFS mount point $ROOTFS doesn't exist"
-            cleanup
-            return 1
-        fi
-        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS"
-    fi
-    if [ "$MACHINE" = "qemuarmv6" ]; then
-        QEMUOPTIONS="$QEMUOPTIONS -cpu arm1136"
-    fi
-    if [ "$MACHINE" = "qemuarmv7" ]; then
-        QEMUOPTIONS="$QEMUOPTIONS -cpu cortex-a8"
-    fi
+set_qemu_name() {
+    [ -z "$QEMU_NAME" ] && QEMU_NAME="$1"
 }
 
-config_qemuarm64() {
-    set_mem_size 512
-    QEMU=qemu-system-aarch64
-
+config_aarch64() {
     QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
-    DROOT="/dev/vda"
     ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,if=none,format=raw -device virtio-blk-device,drive=disk0"
-
-    export QEMU_AUDIO_DRV="none"
-    if [ "x$SERIALSTDIO" = "x" ] ; then
-        QEMU_UI_OPTIONS="-nographic"
-    else
-        QEMU_UI_OPTIONS=""
-    fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
-        KERNCMDLINE="root=$DROOT rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
-        # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
-    fi
-    if [ "$FSTYPE" = "nfs" ]; then
-        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-            echo "Error: NFS mount point $ROOTFS doesn't exist"
-            cleanup
-            return 1
-        fi
-        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $QEMU_UI_OPTIONS"
-    fi
-}
-
-config_qemux86() {
-    set_mem_size 256
-    QEMU=qemu-system-i386
-    if [ "$KVM_ACTIVE" = "yes" ]; then
-        CPU_SUBTYPE=kvm32
-    else
-        CPU_SUBTYPE=qemu32
-    fi
-    if [ ! -z "$vga_option" ]; then
-        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    else
-        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
-    fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
-        KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
-    fi
-    if [ "${FSTYPE:0:4}" = "cpio" ]; then
-        KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=/dev/ram0 rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -initrd $ROOTFS $QEMU_UI_OPTIONS"
-    fi
-
-    if [ "$FSTYPE" = "nfs" ]; then
-        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-            echo "Error: NFS mount point $ROOTFS doesn't exist."
-            cleanup
-            return 1
-        fi
-        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
-    fi
-    if [ "$IS_VM" = "true" ]; then
-        QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
-    fi
-    # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
-    # qemux86 and qemux86-64. We can use timer interrupt mode for now.
-    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
 }
 
-config_qemux86_64() {
-    set_mem_size 256
-    QEMU=qemu-system-x86_64
-    if [ "$KVM_ACTIVE" = "yes" ]; then
-        CPU_SUBTYPE=kvm64
-    else
-        CPU_SUBTYPE=core2duo
-    fi
-    if [ ! -z "$vga_option" ]; then
-        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    else
+KERNEL_VGA_OPTIONS=""
+config_x86() {
+    if [ -z "$vga_option" ]; then
         QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
-        KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
-    fi
-    if [ "$FSTYPE" = "nfs" ]; then
-        if [ "x$ROOTFS" = "x" ]; then
-            ROOTFS=/srv/nfs/qemux86-64
-        fi
-        if [ ! -d "$ROOTFS" ]; then
-            echo "Error: NFS mount point $ROOTFS doesn't exist."
-            cleanup
-            return 1
-        fi
-        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
-    fi
-    if [ "$IS_VM" = "true" ]; then
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $QEMU_UI_OPTIONS"
-    fi
+    KERNEL_VGA_OPTIONS="vga=0 uvesafb.mode_option=640x480-32"
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
     # qemux86 and qemux86-64. We can use timer interrupt mode for now.
     KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
+   
+   if [ "$IS_VM" = "yes" ]; then
+       QEMUOPTIONS="$CPU_SUBTYPE $QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
+   fi
 }
 
-config_qemumips() {
-    set_mem_size 256
-    case "$MACHINE" in
-       qemumips)   QEMU=qemu-system-mips ;;
-       qemumipsel) QEMU=qemu-system-mipsel ;;
-       qemumips64) QEMU=qemu-system-mips64 ;;
-    esac
-    MACHINE_SUBTYPE=malta
+config_mips() {
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
-        #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        KERNCMDLINE="root=$DROOT rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
-    fi
-    if [ "$FSTYPE" = "nfs" ]; then
-        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-            echo "Error: NFS mount point $ROOTFS doesn't exist"
-            cleanup
-            return 1
-        fi
-        KERNCMDLINE="root=/dev/nfs console=ttyS0 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
-    fi
 }
 
-config_qemuppc() {
-    set_mem_size 256
-    QEMU=qemu-system-ppc
-    MACHINE_SUBTYPE=mac99
-    CPU_SUBTYPE=G4
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    if [ "$SLIRP_ENABLED" = "yes" ]; then
-        QEMU_NETWORK_CMD=""
-    else
+config_ppc() {
+    if [ "$SLIRP_ENABLED" != "yes" ]; then
         QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
     fi
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
-        KERNCMDLINE="root=$DROOT rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
-    fi
-    if [ "$FSTYPE" = "nfs" ]; then
-        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-            echo "Error: NFS mount point $ROOTFS doesn't exist"
-            cleanup
-            return 1
-        fi
-        KERNCMDLINE="root=/dev/nfs console=ttyS0 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
-    fi
-}
-
-config_qemush4() {
-    set_mem_size 1024
-    QEMU=qemu-system-sh4
-    MACHINE_SUBTYPE=r2d
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
-        #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        KERNCMDLINE="root=/dev/hda rw console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
-        SERIALSTDIO="1"
-    fi
-    if [ "$FSTYPE" = "nfs" ]; then
-        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-            echo "Error: NFS mount point $ROOTFS doesn't exist"
-            cleanup
-            return 1
-        fi
-        KERNCMDLINE="root=/dev/nfs console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
-        SERIALSTDIO="1"
-    fi
 }
 
-config_qemuzynq() {
-    set_mem_size 1024
-    QEMU=qemu-system-arm
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
-    # zynq serial ports are named 'ttyPS0' and 'ttyPS1', fixup the default values
-    SCRIPT_KERNEL_OPT=$(echo "$SCRIPT_KERNEL_OPT" | sed 's/console=ttyS/console=ttyPS/g')
-    if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
-        KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
-    fi
+set_qemu_name() {
+    [ -z "$QEMU_NAME" ] && QEMU_NAME="$1"
 }
 
-config_qemumicroblaze() {
-    set_mem_size 256
-    QEMU=qemu-system-microblazeel
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M petalogix-ml605 -serial mon:stdio"
-    if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
-        KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
-    fi
-}
-
-case "$MACHINE" in
-    "qemuarm" | "qemuarmv6" | "qemuarmv7")
-        config_qemuarm
-        ;;
-    "qemuarm64")
-        config_qemuarm64
+case "$TUNE_ARCH" in
+    arm|armv*)
+        set_qemu_name "qemu-system-arm"
         ;;
-    "qemux86")
-        config_qemux86
+    microblazeel)
+        set_qemu_name "qemu-system-microblazeel"
         ;;
-    "qemux86-64")
-        config_qemux86_64
+    aarch64)
+        set_qemu_name "qemu-system-aarch64"
+        config_aarch64
         ;;
-    "qemumips" | "qemumipsel" | "qemumips64")
-        config_qemumips
+    x86|i[3456]86)
+        set_qemu_name "qemu-system-i386"
+        config_x86
         ;;
-    "qemuppc")
-        config_qemuppc
+    x86_64)
+        set_qemu_name "qemu-system-x86_64"
+        config_x86
         ;;
-    "qemush4")
-        config_qemush4
+    mips*)
+        set_qemu_name "qemu-system-$TUNE_ARCH"
+        config_mips
         ;;
-    "qemuzynq")
-        config_qemuzynq
-        ;;
-    "qemumicroblaze")
-        config_qemumicroblaze
+    powerpc)
+        set_qemu_name "qemu-system-ppc"
+        config_ppc
         ;;
     *)
-        echo "Error: Unsupported machine type $MACHINE"
-        return 1
+        if [ -n "$QEMU_NAME" ]; then
+            echo "Trying to boot unknown arch: $TUNE_ARCH"
+        else
+            echo_exit "Error: QEMU_NAME is not set"
+        fi
     ;;
 esac
 
-# We need to specify -m <mem_size> to overcome a bug in qemu 0.14.0
-# https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/584480
-if [ -z "$mem_set" ] ; then
-  SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -m $mem_size"
-fi
+QEMU_BIN="$STAGING_BINDIR_NATIVE/$QEMU_NAME"
+QEMU="$QEMU_BIN $QEMU_OPTIONS"
 
-if [ "${FSTYPE:0:3}" = "ext" ]; then
-    KERNCMDLINE="$KERNCMDLINE rootfstype=$FSTYPE"
+if [ "$FSTYPE" = "nfs" ]; then
+    if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+        echo "Error: NFS mount point $ROOTFS doesn't exist"
+        cleanup
+        return 1
+    fi
+    KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $QEMU_KERNEL_OPTIONS $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
+    QEMUOPTIONS="$CPU_SUBTYPE $QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
 fi
 
-if [ "$FSTYPE" = "cpio.gz" ]; then
-    QEMUOPTIONS="-initrd $ROOTFS -nographic"
-    KERNCMDLINE="root=/dev/ram0 console=ttyS0 debugshell"
+
+if [ "$FSTYPE" = "cpio.gz" -o "$FSTYPE" = "cpio" ]; then
+    KERNCMDLINE="root=/dev/ram0 rw $QEMU_KERNEL_OPTIONS debugshell"
+    QEMUOPTIONS="$CPU_SUBTYPE $QEMU_DTB -initrd $ROOTFS"
 fi
 
 if [ "$FSTYPE" = "iso" ]; then
-    QEMUOPTIONS="$QEMU_NETWORK_CMD -cdrom $ROOTFS $QEMU_UI_OPTIONS"
+    QEMUOPTIONS="$CPU_SUBTYPE $QEMU_NETWORK_CMD -cdrom $ROOTFS $QEMU_UI_OPTIONS"
 fi
 
-if [ "x$QEMUOPTIONS" = "x" ]; then
-    echo "Error: Unable to support this combination of options"
-    cleanup
-    return 1
+if [ -z "$QEMUOPTIONS" ]; then
+    KERNCMDLINE="$KERNEL_VGA_OPTIONS root=$DROOT rw $QEMU_KERNEL_OPTIONS $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
+    QEMUOPTIONS="$CPU_SUBTYPE $QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS $QEMU_DTB"
 fi
 
 if [ "$TCPSERIAL_PORTNUM" != "" ]; then
-    if [ "$MACHINE" = "qemuarm64" ]; then
+    if [ "$TUNE_ARCH" = "aarch64" ]; then
         SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -device virtio-serial-device -chardev socket,id=virtcon,port=$TCPSERIAL_PORTNUM,host=127.0.0.1 -device virtconsole,chardev=virtcon"
     else
         SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -serial tcp:127.0.0.1:$TCPSERIAL_PORTNUM"
     fi
 fi
 
-PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$PATH
-
-QEMUBIN=`which $QEMU 2> /dev/null`
-if [ ! -x "$QEMUBIN" ]; then
-    echo "Error: No QEMU binary '$QEMU' could be found."
+if [ ! -x "$QEMU_BIN" ]; then
+    echo "Error: No QEMU binary '$QEMU_BIN' could be found."
     cleanup
     return 1
 fi
 
-NEED_GL=`ldd $QEMUBIN/$QEMU 2>&1 | grep libGLU`
+NEED_GL=`ldd $QEMU_BIN 2>&1 | grep libGLU`
 # We can't run without a libGL.so
 if [ "$NEED_GL" != "" ]; then
     libgl='no'
@@ -611,7 +392,7 @@ trap do_quit INT TERM QUIT
 # qemu got segfault if linked with nVidia's libgl
 GL_LD_PRELOAD=$LD_PRELOAD
 
-if ldd $QEMUBIN | grep -i nvidia &> /dev/null
+if ldd $QEMU_BIN | grep -i nvidia &> /dev/null
 then
 cat << EOM
 WARNING: nVidia proprietary OpenGL libraries detected.
@@ -647,23 +428,12 @@ if [ "x$SERIALSTDIO" = "x1" ]; then
         stty intr ^]
 fi
 
-
 # Preserve the multiplexing behavior for the monitor that would be there based
 # on whether nographic is used.
-if echo "$QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT" | grep -- "-nographic"; then
-    FIRST_SERIAL_OPT="-serial mon:stdio"
-else
+if ! echo "$QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT" | grep -q -- "-nographic"; then
     FIRST_SERIAL_OPT="-serial mon:vc"
 fi
 
-# qemuarm64 uses virtio for any additional serial ports so the normal mechanism
-# of using -serial will not work
-if [ "$MACHINE" = "qemuarm64" ]; then
-    SECOND_SERIAL_OPT="$SCRIPT_QEMU_EXTRA_OPT -device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-else
-    SECOND_SERIAL_OPT="-serial null"
-fi
-
 # We always want a ttyS1. Since qemu by default adds a serial port when
 # nodefaults is not specified, it seems that all that would be needed is to
 # make sure a "-serial" is there. However, it appears that when "-serial" is
@@ -673,35 +443,35 @@ fi
 NUM_SERIAL_OPTS=`echo $QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT | sed -e 's/ /\n/g' | grep --count -- -serial`
 
 if [ "$NUM_SERIAL_OPTS" = "0" ]; then
-    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $FIRST_SERIAL_OPT $SECOND_SERIAL_OPT"
+    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $FIRST_SERIAL_OPT $QEMU_SECOND_SERIAL_OPT"
 elif [ "$NUM_SERIAL_OPTS" = "1" ]; then
-    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $SECOND_SERIAL_OPT"
+    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $QEMU_SECOND_SERIAL_OPT"
 fi
 
-echo "Running $QEMU..."
+echo "Running $QEMU_BIN ..."
 # -no-reboot is a mandatory option - see bug #100
-if [ "$IS_VM" = "true" ]; then
+if [ "$IS_VM" = "yes" -a "$FSTYPE" != "iso" ]; then
     # Check root=/dev/sdX or root=/dev/vdX
-    [ ! -e "$VM" ] && error "VM image is not found!"
-    if grep -q 'root=/dev/sd' $VM; then
+    [ ! -e "$ROOTFS" ] && error "VM image is not found!"
+    if grep -q 'root=/dev/sd' $ROOTFS; then
         echo "Using scsi drive"
-        VM_DRIVE="-drive if=none,id=hd,file=$VM -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd"
-    elif grep -q 'root=/dev/hd' $VM; then
+        VM_DRIVE="-drive if=none,id=hd,file=$ROOTFS -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd"
+    elif grep -q 'root=/dev/hd' $ROOTFS ; then
         echo "Using ide drive"
-        VM_DRIVE="$VM"
+        VM_DRIVE="$ROOTFS"
     else
         echo "Using virtio block drive"
-        VM_DRIVE="-drive if=virtio,file=$VM"
+        VM_DRIVE="-drive if=virtio,file=$ROOTFS"
     fi
-    QEMU_FIRE="$QEMUBIN $VM_DRIVE $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
+    QEMU_FIRE="$QEMU $VM_DRIVE $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
     echo $QEMU_FIRE
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE
 elif [ "$FSTYPE" = "iso" -o "$FSTYPE" = "wic" ]; then
-    QEMU_FIRE="$QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
+    QEMU_FIRE="$QEMU $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
     echo $QEMU_FIRE
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE
 else
-    QEMU_FIRE="$QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SLIRP_CMD $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
+    QEMU_FIRE="$QEMU -kernel $KERNEL $QEMUOPTIONS $SLIRP_CMD $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
     echo $QEMU_FIRE -append '"'$KERNCMDLINE $SCRIPT_KERNEL_OPT'"'
     LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE -append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
 fi
-- 
2.7.4


