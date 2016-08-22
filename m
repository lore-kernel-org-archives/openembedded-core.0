Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF0587326D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 07:52:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7M7qu0V017632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 00:52:56 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 00:52:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 00:52:45 -0700
Message-ID: <1c9895b7541eb8dade26c256667ea1150bd38d38.1471850849.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 08/11] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Mon, 22 Aug 2016 07:52:56 -0000
Content-Type: text/plain

Previously, runqemu had hard coded machine knowledge, which limited its
usage, for example, qemu can boot genericx86, but runqemu can't, we need
edit runqemu/runqemu-internal a lot if we want to boot genericx86.

Now bsp conf files can set vars to make it can be boot by runqemu, and
qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.py.
Please see qemuboot.bbclass' comments on how to set the vars.

* Re-write it in python3, which can reduce lines from 1239 to about 750
  lines
* All the machine knowledges are gone
* All of the TUN_ARCH knowledge are gone
* All the previous options are preserved, and there is a new way to run
  runqemu: (it doesn't need run "bitake -e" in such a case)
  $ runqemu tmp/deploy/images/qemux86
  or:
  $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
  or:
  $ runqemu tmp/deploy/images/qemuarm/qemuboot.py
* Fixed audio support, not limited on x86 or x86_64
* Fix SLIRP mode, add help message, avoid mixing with tap
* Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
  DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it after
  stop.
* More bsps can be boot, such as genericx86 and genericx86-64.
* The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to
  meta-xilinx' mailing list.
* I can't find any qemush4 bsp or how to build it, so it is not
  considered atm.

[YOCTO #1018]
[YOCTO #4827]
[YOCTO #7459]
[YOCTO #7887]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu          | 1287 +++++++++++++++++++++++++++-------------------
 scripts/runqemu-internal |  739 --------------------------
 2 files changed, 762 insertions(+), 1264 deletions(-)
 delete mode 100755 scripts/runqemu-internal

diff --git a/scripts/runqemu b/scripts/runqemu
index d52ea15..bed04e7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1,8 +1,9 @@
-#!/bin/bash
-#
+#!/usr/bin/env python3
+
 # Handle running OE images standalone with QEMU
 #
 # Copyright (C) 2006-2011 Linux Foundation
+# Copyright (c) 2016 Wind River Systems, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -17,536 +18,772 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-usage() {
-    MYNAME=`basename $0`
-cat <<_EOF
+import os
+import sys
+import logging
+import subprocess
+import re
+import fcntl
+import shutil
+import glob
+
+def create_logger():
+    logger = logging.getLogger('runqemu')
+    logger.setLevel(logging.INFO)
+
+    # create console handler and set level to debug
+    ch = logging.StreamHandler()
+    ch.setLevel(logging.INFO)
+
+    # create formatter
+    formatter = logging.Formatter('%(name)s - %(levelname)s - %(message)s')
+
+    # add formatter to ch
+    ch.setFormatter(formatter)
+
+    # add ch to logger
+    logger.addHandler(ch)
+
+    return logger
+
+logger = create_logger()
 
+def print_usage():
+    print("""
 Usage: you can run this script with any valid combination
 of the following environment variables (in any order):
   KERNEL - the kernel image file to use
   ROOTFS - the rootfs image file or nfsroot directory to use
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
-    nographic - disables video console
-    serial - enables a serial console on /dev/ttyS0
-    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)
-    kvm-vhost - enables KVM with vhost support when running qemux86/qemux86-64 (VT-capable CPU required)
+    nographic - disable video console
+    serial - enable a serial console on /dev/ttyS0
+    slirp - enable user networking, no root privileges is required
+    kvm - enable KVM when running x86/x86_64 (VT-capable CPU required)
+    kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
-  qemuparams="xyz" - specify custom parameters to QEMU
-  bootparams="xyz" - specify custom kernel parameters during boot
+    audio - enable audio
+  tcpserial=<port> - specify tcp serial port number
+  biosdir=<dir> - specify custom bios dir
+  biosfilename=<filename> - specify bios filename
+  qemuparams=<xyz> - specify custom parameters to QEMU
+  bootparams=<xyz> - specify custom kernel parameters during boot
+  help: print this text
 
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
-_EOF
-    exit 1
-}
-
-if [ "x$1" = "x" ]; then
-    usage
-fi
-
-error() {
-    echo "Error: "$*
-    usage
-}
-
-MACHINE=${MACHINE:=""}
-KERNEL=${KERNEL:=""}
-ROOTFS=${ROOTFS:=""}
-FSTYPE=${FSTYPE:=""}
-LAZY_ROOTFS=""
-SCRIPT_QEMU_OPT=""
-SCRIPT_QEMU_EXTRA_OPT=""
-SCRIPT_KERNEL_OPT=""
-SERIALSTDIO=""
-TCPSERIAL_PORTNUM=""
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
-    esac
-}
-
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
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "qemuzynqmp")
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
-    esac
-    shift
-done
-
-if [ ! -c /dev/net/tun ] ; then
-	echo "TUN control device /dev/net/tun is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)"
-	exit 1
-elif [ ! -w /dev/net/tun ] ; then
-	echo "TUN control device /dev/net/tun is not writable, please fix (e.g. sudo chmod 666 /dev/net/tun)"
-	exit 1
-fi
-
-# Report errors for missing combinations of options
-if [ -z "$MACHINE" -a -z "$KERNEL" -a -z "$VM" -a "$FSTYPE" != "wic" ]; then
-    error "you must specify at least a MACHINE or KERNEL argument"
-fi
-if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
-    error "NFS booting without an explicit ROOTFS path is not yet supported"
-fi
-
-if [ -z "$MACHINE" ]; then
-    if [ "$IS_VM" = "true" ]; then
-        [ "x$FSTYPE" = "xwic" ] && filename=$ROOTFS || filename=$VM
-        MACHINE=`basename $filename | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
-        if [ -z "$MACHINE" ]; then
-            error "Unable to set MACHINE from image filename [$VM]"
-        fi
-        echo "Set MACHINE to [$MACHINE] based on image [$VM]"
-    else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
-        if [ -z "$MACHINE" ]; then
-            error "Unable to set MACHINE from kernel filename [$KERNEL]"
-        fi
-        echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
-    fi
-fi
-
-YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
-YOCTO_PARAVIRT_KVM_WIKI="https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM"
-# Detect KVM configuration
-if [ "x$KVM_ENABLED" = "xyes" ]; then
-    if [ -z "$KVM_CAPABLE" ]; then
-        echo "You are trying to enable KVM on a cpu without VT support."
-        echo "Remove kvm from the command-line, or refer"
-        echo "$YOCTO_KVM_WIKI";
-        exit 1;
-    fi
-    if [ "x$MACHINE" != "xqemux86" -a "x$MACHINE" != "xqemux86-64" ]; then
-        echo "KVM only support x86 & x86-64. Remove kvm from the command-line";
-        exit 1;
-    fi
-    if [ ! -e /dev/kvm ]; then
-        echo "Missing KVM device. Have you inserted kvm modules?"
-        echo "For further help see:"
-        echo "$YOCTO_KVM_WIKI";
-        exit 1;
-    fi
-    if [ -w /dev/kvm -a -r /dev/kvm ]; then
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
-        KVM_ACTIVE="yes"
-    else
-        echo "You have no rights on /dev/kvm."
-        echo "Please change the ownership of this file as described at:"
-        echo "$YOCTO_KVM_WIKI";
-        exit 1;
-    fi
-    if [ "x$VHOST_ENABLED" = "xyes" ]; then
-        if [ ! -e /dev/vhost-net ]; then
-            echo "Missing virtio net device. Have you inserted vhost-net module?"
-            echo "For further help see:"
-            echo "$YOCTO_PARAVIRT_KVM_WIKI";
-            exit 1;
-        fi
-
-        if [ -w /dev/vhost-net -a -r /dev/vhost-net ]; then
-            VHOST_ACTIVE="yes"
-        else
-            echo "You have no rights on /dev/vhost-net."
-            echo "Please change the ownership of this file as described at:"
-            echo "$YOCTO_KVM_WIKI";
-            exit 1;
-        fi
-    fi
-fi
-
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
-QEMUZYNQMP_DEFAULT_KERNEL=Image
-QEMUZYNQMP_DEFAULT_FSTYPE=cpio
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
-        if [ -z "$QEMU_DTB" ] ; then
-            QEMU_DTB=`sed -n 's/^QEMU_DTB=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
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
-# Locate a rootfs image to boot which matches our expected
-# machine and fstype. 
-findimage() {
-    where=$1
-    machine=$2
-    extension=$3
-
-    # Sort rootfs candidates by modification time - the most
-    # recently created one is the one we most likely want to boot.
-    filename=`ls -t1 $where/*-image*$machine.$extension 2>/dev/null | head -n1`
-    if [ "x$filename" != "x" ]; then
-        ROOTFS=$filename
-        return
-    fi
-
-    echo "Couldn't find a $machine rootfs image in $where."
-    exit 1
-}
-
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
-# Handle cases where a ROOTFS type is given instead of a filename, e.g.
-# core-image-sato
-if [ "$LAZY_ROOTFS" = "true" ]; then
-    setup_path_vars 1
-    echo "Assuming $ROOTFS really means $DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE"
-    if [ "$IS_VM" = "true" ]; then
-        VM=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
-    else
-        ROOTFS=$DEPLOY_DIR_IMAGE/$ROOTFS-$MACHINE.$FSTYPE
-    fi
-fi
-
-if [ -z "$ROOTFS" ]; then
-    setup_path_vars 1
-    T=$DEPLOY_DIR_IMAGE
-    eval rootfs_list=\$${machine2}_DEFAULT_ROOTFS
-    findimage $T $MACHINE $FSTYPE
-
-    if [ -z "$ROOTFS" ]; then
-        error "Unable to determine default rootfs for MACHINE [$MACHINE]"
-    elif [ "$IS_VM" = "true" ]; then
-		VM=$ROOTFS
-    fi
-fi
-# ROOTFS is now set for all cases, now expand it to be an absolute path, it should exist at this point
-
-ROOTFS=`readlink -f $ROOTFS`
-
-echo ""
-echo "Continuing with the following parameters:"
-if [ "$IS_VM" = "false" ]; then
-    echo "KERNEL: [$KERNEL]"
-    echo "ROOTFS: [$ROOTFS]"
-else
-    echo "VM:   [$VM]"
-fi
-echo "FSTYPE: [$FSTYPE]"
-
-setup_sysroot
-# OECORE_NATIVE_SYSROOT and OECORE_MACHINE_SYSROOT are now set for all cases
-
-INTERNAL_SCRIPT="$0-internal"
-if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
-INTERNAL_SCRIPT=`which runqemu-internal`
-fi
-
-# Specify directory for BIOS, VGA BIOS and keymaps
-if [ ! -z "$CUSTOMBIOSDIR" ]; then
-    if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
-        echo "Assuming biosdir is $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
-    elif [ -d "$OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR" ]; then
-        echo "Assuming biosdir is $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
-    else
-        if [ ! -d "$CUSTOMBIOSDIR" ]; then
-            echo "Custom BIOS directory not found. Tried: $CUSTOMBIOSDIR"
-            echo "and $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
-            echo "and $OECORE_MACHINE_SYSROOT/$CUSTOMBIOSDIR"
-            exit 1;
-        fi
-        echo "Assuming biosdir is $CUSTOMBIOSDIR"
-        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $CUSTOMBIOSDIR"
-    fi
-fi
-
-. $INTERNAL_SCRIPT
-exit $?
+  runqemu qemuarm
+  runqemu tmp/deploy/images/qemuarm
+  runqemu tmp/deploy/images/qemux86/qemuboot.py
+  runqemu qemux86-64 core-image-sato ext4
+  runqemu qemux86-64 wic-image-minimal wic
+  runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
+  runqemu qemux86 iso/hddimg/vmdk/qcow2/vdi/ramfs/cpio.gz...
+  runqemu qemux86 qemuparams="-m 256"
+  runqemu qemux86 bootparams="psplash=false"
+  runqemu path/to/<image>-<machine>.vmdk
+  runqemu path/to/<image>-<machine>.wic
+""")
+
+def check_tun():
+    """Check /dev/net/run"""
+    dev_tun = '/dev/net/tun'
+    if not os.path.exists(dev_tun):
+        raise Exception("TUN control device %s is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)" % dev_tun)
+
+    if not os.access(dev_tun, os.W_OK):
+        raise Exception("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
+
+def check_libgl(qemu_bin):
+    cmd = 'ldd %s' % qemu_bin
+    logger.info('Running %s...' % cmd)
+    need_gl = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+    if re.search('libGLU', need_gl):
+        # We can't run without a libGL.so
+        libgl = False
+        check_files = (('/usr/lib/libGL.so', '/usr/lib/libGLU.so'), \
+            ('/usr/lib64/libGL.so', '/usr/lib64/libGLU.so'), \
+            ('/usr/lib/*-linux-gnu/libGL.so', '/usr/lib/*-linux-gnu/libGLU.so'))
+
+        for (f1, f2) in check_files:
+            if re.search('\*', f1):
+                for g1 in glob.glob(f1):
+                    if libgl:
+                        break
+                    if os.path.exists(g1):
+                        for g2 in glob.glob(f2):
+                            if os.path.exists(g2):
+                                libgl = True
+                                break
+                if libgl:
+                    break
+            else:
+                if os.path.exists(f1) and os.path.exists(f2):
+                    libgl = True
+                    break
+        if not libgl:
+            logger.error("You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.")
+            logger.error("Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.")
+            logger.error("Fedora package names are: mesa-libGL-devel mesa-libGLU-devel.")
+            raise Exception('%s requires libGLU, but not found' % qemu_bin)
+
+class BaseConfig(object):
+    def __init__(self):
+        # Vars can be merged with qemuboot.py, use a dict to manage them.
+        self.d = {
+            'MACHINE': '',
+            'DEPLOY_DIR_IMAGE': '',
+            'QB_KERNEL_ROOT': '/dev/vda',
+        }
+
+        self.qemu_opt = ''
+        self.qemu_opt_script = ''
+        self.nfs_dir = ''
+        self.clean_nfs_dir = False
+        self.nfs_server = ''
+        self.rootfs = ''
+        self.kernel = ''
+        self.kernel_cmdline = ''
+        self.kernel_cmdline_script = ''
+        self.fstype = ''
+        self.kvm_enabled = False
+        self.vhost_enabled = False
+        self.slirp_enabled = False
+        self.nfs_instance = 0
+        self.nfs_running = False
+        self.serialstdio = False
+        self.cleantap = False
+        self.saved_stty = ''
+        self.audio_enabled = False
+        self.tcpserial_portnum = ''
+        self.custombiosdir = ''
+        self.lock = ''
+        self.lock_descriptor = ''
+        self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs', 'cpio.gz', 'cpio', 'ramfs')
+        self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'vmdk', 'qcow2', 'vdi', 'iso')
+
+    def acquire_lock(self):
+        logger.info("Acquiring lockfile %s..." % self.lock)
+        lock_descriptor = open(self.lock, 'w')
+        try:
+            fcntl.flock(lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+        except Exception as e:
+            logger.info("Acquiring lockfile %s failed: %s" % (self.lock, e))
+            lock_descriptor.close()
+            return False
+        self.lock_descriptor = lock_descriptor
+        return True
+
+    def release_lock(self):
+        fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
+        self.lock_descriptor.close()
+        os.remove(self.lock)
+
+    def get(self, key):
+        if key in self.d:
+            return self.d.get(key)
+        else:
+            return ''
+
+    def set(self, key, value):
+        self.d[key] = value
+
+    def check_arg_fstype(self, fst):
+        """Check and set FSTYPE"""
+        if fst not in self.fstypes + self.vmtypes:
+            logger.warn("Maybe unsupported FSTYPE: %s" % fst)
+        if not self.fstype or self.fstype == fst:
+            if fst == 'ramfs':
+                fst = 'cpio.gz'
+            self.fstype = fst
+        else:
+            raise Exception("Conflicting: FSTYPE %s and %s" % (self.fstype, fst))
+
+    def set_machine_deploy_dir(self, machine, deploy_dir_image):
+        """Set MACHINE and DEPLOY_DIR_IMAGE"""
+        logger.info('MACHINE: %s' % machine)
+        logger.info('DEPLOY_DIR_IMAGE: %s' % deploy_dir_image)
+        self.set("MACHINE", machine)
+        self.set("DEPLOY_DIR_IMAGE", deploy_dir_image)
+
+    def check_arg_nfs(self, p):
+        if os.path.isdir(p):
+            self.nfs_dir = p
+        else:
+            m = re.match('(.*):(.*)', p)
+            self.nfs_server = m.group(1)
+            self.nfs_dir = m.group(2)
+        self.rootfs = ""
+        self.check_arg_fstype('nfs')
+
+    def check_arg_path(self, p):
+        """
+        - Check whether it is qemuboot.py or contains qemuboot.py
+        - Check whether is a kernel file
+        - Check whether is a image file
+        - Check whether it is a nfs dir
+        """
+        if os.path.basename(p) == 'qemuboot.py':
+            machine = os.path.basename(os.path.dirname(p))
+            self.set_machine_deploy_dir(machine, os.path.dirname(p))
+        elif os.path.exists(os.path.join(p, 'qemuboot.py')):
+            machine = os.path.basename(p)
+            self.set_machine_deploy_dir(machine, p)
+        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+             re.search('zImage', p) or re.search('vmlinux', p) or \
+             re.search('fitImage', p) or re.search('uImage', p):
+            self.kernel =  p
+        elif (not os.path.isdir(p)) and re.search('-image-', p):
+            dirpath = os.path.dirname(p)
+            if os.path.exists('%s/qemuboot.py' % dirpath):
+                machine = os.path.basename(os.path.dirname(p))
+                self.set_machine_deploy_dir(machine, os.path.dirname(p))
+            self.rootfs =  p
+            m = re.search('.*\.(.*)$', p)
+            if m:
+                fst = m.group(1)
+                self.check_arg_fstype(fst)
+            else:
+                raise Exception("Can't find FSTYPE from: %s" % p)
+        elif os.path.isdir(p) or (re.search(':', arg) and re.search('/', arg)):
+            logger.info("Assuming %s is an nfs rootfs" % p)
+            self.check_arg_nfs(p)
+        else:
+            raise Exception("Unknown path arg %s" % p)
+
+    def check_arg_machine(self, arg):
+        """Check whether it is a machine"""
+        if self.get('MACHINE') and self.get('MACHINE') != arg or re.search('/', arg):
+            raise Exception("Unknown arg: %s" % arg)
+        elif self.get('MACHINE') == arg:
+            return
+        logger.info('Assuming MACHINE = %s' % arg)
+        cmd = 'MACHINE=%s bitbake -e' % arg
+        logger.info('Running %s...' % cmd)
+        bitbake_e = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        # bitbake -e doesn't report invalid MACHINE as an error, so
+        # let's check DEPLOY_DIR_IMAGE to make sure that it is a valid
+        # MACHINE.
+        s = re.search('^DEPLOY_DIR_IMAGE="(.*)"', bitbake_e, re.M)
+        if s:
+            deploy_dir_image = s.group(1)
+        else:
+            raise Exception("bitbake -e %s" % bitbake_e)
+        if os.path.isdir(deploy_dir_image):
+            qb = deploy_dir_image + '/qemuboot.py'
+            if os.path.exists(qb):
+                self.set_machine_deploy_dir(arg, deploy_dir_image)
+            else:
+                raise Exception("%s doesn't exist" % qb)
+        else:
+            raise Exception("Falied to set MACHINE to %s. Unknown arg: %s" % (arg, arg))
+
+    def check_args(self):
+        unknown_arg = ""
+        for arg in sys.argv[1:]:
+            if arg in self.fstypes + self.vmtypes:
+                self.check_arg_fstype(arg)
+            elif arg == 'nographic':
+                self.qemu_opt_script += ' -nographic'
+                self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'serial':
+                self.kernel_cmdline_script += ' console=ttyS0'
+                self.serialstdio = True
+            elif arg == 'audio':
+                logger.info("Enabling audio in qemu")
+                logger.info("Please install sound drivers in linux host")
+                self.audio_enabled = True
+            elif arg == 'kvm':
+                self.kvm_enabled = True
+            elif arg == 'kvm-vhost':
+                self.vhost_enabled = True
+            elif arg == 'slirp':
+                self.slirp_enabled = True
+            elif arg == 'publicvnc':
+                self.qemu_opt_script += ' -vnc :0'
+            elif arg.startswith('tcpserial='):
+                self.tcpserial_portnum = arg[len('tcpserial='):]
+            elif arg.startswith('biosdir='):
+                self.custombiosdir = arg[len('biosdir='):]
+            elif arg.startswith('biosfilename='):
+                self.qemu_opt_script += ' -bios %s' % arg[len('biosfilename='):]
+            elif arg.startswith('qemuparams='):
+                self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
+            elif arg.startswith('bootparams='):
+                self.kernel_cmdline_script += ' %s' % arg[len('bootparams='):]
+            elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
+                self.check_arg_path(os.path.abspath(arg))
+            elif re.search('-image-', arg):
+                # Lazy rootfs
+                self.rootfs = arg
+            else:
+                # At last, assume is it the MACHINE
+                if (not unknown_arg) or unknown_arg == arg:
+                    unknown_arg = arg
+                else:
+                    raise Exception("Can't handle two unknown args: %s %s" % (unknown_arg, arg))
+        # Check to make sure it is a valid machine
+        if unknown_arg:
+            if self.get('MACHINE') == unknown_arg:
+                return
+            if not self.get('DEPLOY_DIR_IMAGE'):
+                # Trying to get DEPLOY_DIR_IMAGE from env.
+                p = os.getenv('DEPLOY_DIR_IMAGE')
+                if p and os.path.exists(os.path.join(p, 'qemuboot.py')):
+                    machine = os.path.basename(p)
+                    self.set_machine_deploy_dir(machine, p)
+                    if unknown_arg == machine:
+                        return
+            self.check_arg_machine(unknown_arg)
+
+    def check_kvm(self):
+        """Check kvm and kvm-host"""
+        if not (self.kvm_enabled or self.vhost_enabled):
+            self.qemu_opt_script += ' %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU'))
+            return
+
+        if not self.get('QB_CPU_KVM'):
+            raise Exception("QB_CPU_KVM is NULL, this board doesn't support kvm")
+
+        self.qemu_opt_script += ' %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU_KVM'))
+        yocto_kvm_wiki = "https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
+        yocto_paravirt_kvm_wiki = "https://wiki.yoctoproject.org/wiki/Running_an_x86_Yocto_Linux_image_under_QEMU_KVM"
+        dev_kvm = '/dev/kvm'
+        dev_vhost = '/dev/vhost-net'
+        with open('/proc/cpuinfo', 'r') as f:
+            kvm_cap = re.search('vmx|svm', "".join(f.readlines()))
+        if not kvm_cap:
+            logger.error("You are trying to enable KVM on a cpu without VT support.")
+            logger.error("Remove kvm from the command-line, or refer:")
+            raise Exception(yocto_kvm_wiki)
+
+        if not os.path.exists(dev_kvm):
+            logger.error("Missing KVM device. Have you inserted kvm modules?")
+            logger.error("For further help see:")
+            raise Exception(yocto_kvm_wiki)
+
+        if os.access(dev_kvm, os.W_OK|os.R_OK):
+            self.qemu_opt_script += ' -enable-kvm'
+        else:
+            logger.error("You have no read or write permission on /dev/kvm.")
+            logger.error("Please change the ownership of this file as described at:")
+            raise Exception(yocto_kvm_wiki)
+
+        if self.vhost_enabled:
+            if not os.path.exists(dev_vhost):
+                logger.error("Missing virtio net device. Have you inserted vhost-net module?")
+                logger.error("For further help see:")
+                raise Exception(yocto_paravirt_kvm_wiki)
+
+        if not os.access(dev_kvm, os.W_OK|os.R_OK):
+                logger.error("You have no read or write permission on /dev/vhost-net.")
+                logger.error("Please change the ownership of this file as described at:")
+                raise Exception(yocto_kvm_wiki)
+
+    def check_fstype(self):
+        """Check and setup FSTYPE"""
+        if not self.fstype:
+            fstype = self.get('QB_DEFAULT_FSTYPE')
+            if fstype:
+                self.fstype = fstype
+            else:
+                raise Exception("FSTYPE is NULL!")
+
+    def check_rootfs(self):
+        """Check and set rootfs"""
+        rootfs = self.rootfs
+        if rootfs:
+            if not os.path.exists(rootfs):
+                # Lazy rootfs
+                rootfs = "%s/%s-%s.%s" % (self.get('DEPLOY_DIR_IMAGE'),
+                        self.rootfs, self.get('MACHINE'),
+                        self.fstype)
+        elif self.fstype == 'nfs':
+            return
+        else:
+            rootfs = '%s/%s.%s' % (self.get('DEPLOY_DIR_IMAGE'),
+                    self.get('IMAGE_LINK_NAME'), self.fstype)
+        if os.path.exists(rootfs):
+            self.rootfs = rootfs
+        else:
+            raise Exception("Can't find rootfs: %s" % rootfs)
+
+    def check_kernel(self):
+        """Check and set kernel, dtb"""
+        # The vm image doesn't need a kernel
+        if self.fstype in self.vmtypes:
+            return
+        kernel = self.kernel
+        if not kernel:
+            kernel = "%s/%s" % (self.get('DEPLOY_DIR_IMAGE'), self.get('QB_DEFAULT_KERNEL'))
+
+        if os.path.exists(kernel):
+            self.kernel = kernel
+        else:
+            raise Exception("KERNEL %s not found" % kernel)
+
+        dtb = self.get('QB_DTB')
+        if dtb:
+            dtb = "%s/%s" % (self.get('DEPLOY_DIR_IMAGE'), dtb)
+            if os.path.exists(dtb):
+                self.set('QB_DTB', '-dtb %s' % dtb)
+            else:
+                raise Exception("DTB %s not found" % dtb)
+
+
+    def check_biosdir(self):
+        """Check custombiosdir"""
+        if not self.custombiosdir:
+            return
+
+        biosdir = ""
+        biosdir_native = "%s/%s" % (self.get('STAGING_DIR_NATIVE'), self.custombiosdir)
+        biosdir_host = "%s/%s" % (self.get('STAGING_DIR_HOST'), self.custombiosdir)
+        for i in (self.custombiosdir, biosdir_native, biosdir_host):
+            if os.path.isdir(i):
+                biosdir = i
+                break
+
+        if biosdir:
+            logger.info("Assuming biosdir is: %s" % biosdir)
+            self.qemu_opt_script += ' -L %s' % biosdir
+        else:
+            logger.error("Custom BIOS directory not found. Tried: %s, %s, and %s" % (self.custombiosdir, biosdir_native, biosdir_host))
+            raise Exception("Invalid custombiosdir: %s" % self.custombiosdir)
+
+    def check_mem(self):
+        s = re.search('-m +([0-9]+)', self.qemu_opt_script)
+        if s:
+            self.set('QB_MEM', '-m %s' % s.group(1))
+        elif not self.get('QB_MEM'):
+            logger.info('QB_MEM is not set, use 512M by default')
+            self.set('QB_MEM', '-m 512')
+
+        self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
+        self.qemu_opt_script += ' %s' % self.get('QB_MEM')
+
+    def check_tcpserial(self):
+        if self.tcpserial_portnum:
+            if self.get('QB_TCPSERIAL_OPT'):
+                self.qemu_opt_script += self.get('QB_TCPSERIAL_OPT').replace('@PORT@', self.tcpserial_portnum)
+            else:
+                self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % self.tcpserial_portnum
+
+    def check_and_set(self):
+        """Check configs sanity and set when needed"""
+        check_tun()
+        # Check audio
+        if self.audio_enabled:
+            if not self.get('QB_AUDIO_DRV'):
+                raise Exception("QB_AUDIO_DRV is NULL, this board doesn't support audio")
+            if not self.get('QB_AUDIO_OPT'):
+                logger.warn('QB_AUDIO_OPT is NULL, you may need define it to make audio work')
+            else:
+                self.qemu_opt_script += ' %s' % self.get('QB_AUDIO_OPT')
+            os.putenv('QEMU_AUDIO_DRV', self.get('QB_AUDIO_DRV'))
+        else:
+            os.putenv('QEMU_AUDIO_DRV', 'none')
+
+        self.check_kvm()
+        self.check_fstype()
+        self.check_rootfs()
+        self.check_kernel()
+        self.check_biosdir()
+        self.check_mem()
+        self.check_tcpserial()
+
+    def import_qemuboot(self):
+        deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
+        if not deploy_dir_image:
+            raise Exception("DEPLOY_DIR_IMAGE is NULL!")
+        sys.path.insert(0, deploy_dir_image)
+        import qemuboot
+        for k in qemuboot.config_bsp:
+            if qemuboot.config_bsp[k]:
+                self.set(k, qemuboot.config_bsp[k])
+
+    def print_config(self):
+        logger.info('Continuing with the following parameters:\n')
+        if not self.fstype in self.vmtypes:
+            print('KERNEL: [%s]' % self.kernel)
+        print('MACHINE: [%s]' % self.get('MACHINE'))
+        print('FSTYPE: [%s]' % self.fstype)
+        if self.fstype  == 'nfs':
+            print('NFS_DIR: [%s]' % self.nfs_dir)
+        else:
+            print('ROOTFS: [%s]' % self.rootfs)
+        print('')
+
+    def setup_nfs(self):
+        if not self.nfs_server:
+            if self.slirp_enabled:
+                self.nfs_server = '10.0.2.2'
+            else:
+                self.nfs_server = '192.168.7.1'
+
+        nfs_instance = int(self.nfs_instance)
+
+        mountd_rpcport = 21111 + nfs_instance
+        nfsd_rpcport = 11111 + nfs_instance
+        nfsd_port = 3049 + 2 * nfs_instance
+        mountd_port = 3048 + 2 * nfs_instance
+        unfs_opts="nfsvers=3,port=%s,mountprog=%s,nfsprog=%s,udp,mountport=%s" % (nfsd_port, mountd_rpcport, nfsd_rpcport, mountd_port)
+        self.unfs_opts = unfs_opts
+
+        p = '%s/.runqemu-sdk/pseudo' % os.getenv('HOME')
+        os.putenv('PSEUDO_LOCALSTATEDIR', p)
+
+        # Extract .tar.bz2 or .tar.bz if no self.nfs_dir
+        if not self.nfs_dir:
+            src_prefix = '%s/%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'))
+            dest = "%s-nfsroot" % src_prefix
+            if os.path.exists('%s.pseudo_state' % dest):
+                logger.info('Use %s as NFS_DIR' % dest)
+                self.nfs_dir = dest
+            else:
+                src = ""
+                src1 = '%s.tar.bz2' % src_prefix
+                src2 = '%s.tar.gz' % src_prefix
+                if os.path.exists(src1):
+                    src = src1
+                elif os.path.exists(src2):
+                    src = src2
+                if not src:
+                    raise Exception("No NFS_DIR is set and can't find %s or %s to extract" % (src1, src2))
+                logger.info('NFS_DIR not found, extracting %s to %s' % (src, dest))
+                cmd = 'runqemu-extract-sdk %s %s' % (src, dest)
+                logger.info('Running %s...' % cmd)
+                if subprocess.call(cmd, shell=True) != 0:
+                    raise Exception('Failed to run %s' % cmd)
+                self.clean_nfs_dir = True
+                self.nfs_dir = dest
+
+        # Start the userspace NFS server
+        cmd = 'runqemu-export-rootfs restart %s' % self.nfs_dir
+        logger.info('Running %s...' % cmd)
+        if subprocess.call(cmd, shell=True) != 0:
+            raise Exception('Failed to run %s' % cmd)
+
+        self.nfs_running = True
+
+
+    def setup_slirp(self):
+        if self.fstype == 'nfs':
+            self.setup_nfs()
+        self.kernel_cmdline_script += ' ip=dhcp'
+        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
+
+    def setup_tap(self):
+        """Setup tap"""
+
+        # This file is created when runqemu-gen-tapdevs creates a bank of tap
+        # devices, indicating that the user should not bring up new ones using
+        # sudo.
+        nosudo_flag = '/etc/runqemu-nosudo'
+        self.qemuifup = shutil.which('runqemu-ifup')
+        self.qemuifdown = shutil.which('runqemu-ifdown')
+        ip = shutil.which('ip')
+        lockdir = "/tmp/qemu-tap-locks"
+
+        if not (self.qemuifup and self.qemuifdown and ip):
+            raise Exception("runqemu-ifup, runqemu-ifdown or ip not found")
+
+        if not os.path.exists(lockdir):
+            os.mkdir(lockdir)
+
+        cmd = '%s link' % ip
+        logger.info('Running %s...' % cmd)
+        ip_link = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        # Matches line like: 6: tap0: <foo>
+        possibles = re.findall('^[1-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
+        tap = ""
+        for p in possibles:
+            lockfile = os.path.join(lockdir, p)
+            if os.path.exists('%s.skip' % lockfile):
+                logger.info('Found %s.skip, skipping %s' % (lockfile, p))
+                continue
+            self.lock = lockfile + '.lock'
+            if self.acquire_lock():
+                tap = p
+                logger.info("Using preconfigured tap device %s" % tap)
+                logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
+                break
+
+        if not tap:
+            if os.path.exists(nosudo_flag):
+                logger.error("Error: There are no available tap devices to use for networking,")
+                logger.error("and I see %s exists, so I am not going to try creating" % nosudo_flag)
+                raise Exception("a new one with sudo.")
+
+            gid = os.getgid()
+            uid = os.getuid()
+            logger.info("Setting up tap interface under sudo")
+            cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.get('STAGING_DIR_NATIVE'))
+            tap = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8').rstrip('\n')
+            lockfile = os.path.join(lockdir, tap)
+            self.lock = lockfile + '.lock'
+            self.acquire_lock()
+            self.cleantap = True
+            logger.info('Created tap: %s' % tap)
+
+        self.tap = tap
+        n0 = tap[3:]
+        n1 = int(n0) * 2 + 1
+        n2 = n1 + 1
+        self.nfs_instance = n0
+        if self.fstype == 'nfs':
+            self.setup_nfs()
+        self.kernel_cmdline_script += " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (n2, n1)
+        qb_tap_opt = self.get('QB_TAP_OPT')
+        if qb_tap_opt:
+            qemu_tap_opt = qb_tap_opt.replace('@TAP@', tap)
+        else:
+            qemu_tap_opt = "-net nic,model=virtio -net tap,vlan=0,ifname=%s,script=no,downscript=no" % self.tap
+
+        if self.vhost_enabled:
+            qemu_tap_opt += ',vhost=on'
+
+        self.set('NETWORK_CMD', qemu_tap_opt)
+
+    def setup_network(self):
+        cmd = "stty -g"
+        self.saved_stty = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        if self.slirp_enabled:
+            self.setup_slirp()
+        else:
+            self.setup_tap()
+
+        qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
+        if qb_rootfs_opt:
+            self.rootfs_options = qb_rootfs_opt.replace('@ROOTFS@', self.rootfs)
+        else:
+            self.rootfs_options = '-drive file=%s,if=virtio,format=raw' % self.rootfs
+
+        if self.fstype in ('cpio.gz', 'cpio'):
+            self.set('NETWORK_CMD', '')
+            self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
+            self.rootfs_options = '-initrd %s' % self.rootfs
+        else:
+            if self.fstype in self.vmtypes:
+                if self.fstype == 'iso':
+                    vm_drive = '-cdrom %s' % self.rootfs
+                else:
+                    cmd1 = "grep -q 'root=/dev/sd' %s" % self.rootfs
+                    cmd2 = "grep -q 'root=/dev/hd' %s" % self.rootfs
+                    if subprocess.call(cmd1, shell=True) == 0:
+                        logger.info('Using scsi drive')
+                        vm_drive = '-drive if=none,id=hd,file=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' % self.rootfs
+                    elif subprocess.call(cmd2, shell=True) == 0:
+                        logger.info('Using scsi drive')
+                        vm_drive = self.rootfs
+                    else:
+                        logger.warn("Can't detect drive type %s" % self.rootfs)
+                        logger.warn('Tring to use virtio block drive')
+                        vm_drive = '-drive if=virtio,file=%s' % self.rootfs
+                self.rootfs_options = '%s -no-reboot' % vm_drive
+            self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('QB_KERNEL_ROOT'))
+
+        if self.fstype == 'nfs':
+            self.rootfs_options = ''
+            k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
+            self.kernel_cmdline = 'root=%s rw highres=off' % k_root
+
+        self.set('ROOTFS_OPTIONS', self.rootfs_options)
+
+    def setup_final(self):
+        qemu_system = self.get('QB_SYSTEM_NAME')
+        if not qemu_system:
+            raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
+
+        qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
+        if not os.access(qemu_bin, os.X_OK):
+            raise Exception("No QEMU binary '%s' could be found" % qemu_bin)
+
+        check_libgl(qemu_bin)
+
+        self.qemu_opt = "%s %s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.qemu_opt_script, self.get('ROOTFS_OPTIONS'), self.get('QB_DTB'), self.get('QB_OPT_APPEND'))
+
+        if self.serialstdio:
+            logger.info("Interrupt character is '^]'")
+            cmd = "stty intr ^]"
+            subprocess.call(cmd, shell=True)
+
+            first_serial = ""
+            if not re.search("-nographic", self.qemu_opt):
+                first_serial = "-serial mon:vc"
+            # We always want a ttyS1. Since qemu by default adds a serial
+            # port when nodefaults is not specified, it seems that all that
+            # would be needed is to make sure a "-serial" is there. However,
+            # it appears that when "-serial" is specified, it ignores the
+            # default serial port that is normally added.  So here we make
+            # sure to add two -serial if there are none. And only one if
+            # there is one -serial already.
+            serial_num = len(re.findall("-serial", self.qemu_opt))
+            if serial_num == 0:
+                self.qemu_opt += " %s %s" % (first_serial, self.get("QB_SERIAL_OPT"))
+            elif serial_num == 1:
+                self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
+
+    def start_qemu(self):
+        if self.kernel:
+            kernel_opts = "-kernel %s -append '%s %s %s'" % (self.kernel, self.kernel_cmdline, self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'))
+        else:
+            kernel_opts = ""
+        cmd = "%s %s" % (self.qemu_opt, kernel_opts)
+        logger.info('Running %s' % cmd)
+        if subprocess.call(cmd, shell=True) != 0:
+            raise Exception('Failed to run %s' % cmd)
+
+    def cleanup(self):
+        if self.cleantap:
+            cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.get('STAGING_DIR_NATIVE'))
+            logger.info('Running %s' % cmd)
+            subprocess.call(cmd, shell=True)
+        if self.lock_descriptor:
+            logger.info("Releasing lockfile for tap device '%s'" % self.tap)
+            self.release_lock()
+
+        if self.nfs_running:
+            logger.info("Shutting down the userspace NFS server...")
+            cmd = "runqemu-export-rootfs stop %s" % self.nfs_dir
+            logger.info('Running %s' % cmd)
+            subprocess.call(cmd, shell=True)
+
+        if self.saved_stty:
+            cmd = "stty %s" % self.saved_stty
+            subprocess.call(cmd, shell=True)
+
+        if self.clean_nfs_dir:
+            logger.info('Removing %s' % self.nfs_dir)
+            shutil.rmtree(self.nfs_dir)
+            shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
+
+def main():
+    if len(sys.argv) == 1 or "help" in sys.argv:
+        print_usage()
+        return 0
+    config = BaseConfig()
+    try:
+        config.check_args()
+    except Exception as esc:
+        logger.error(esc)
+        logger.error("Try 'runqemu help' on how to use it")
+        return 1
+    config.import_qemuboot()
+    config.check_and_set()
+    config.print_config()
+    try:
+        config.setup_network()
+        config.setup_final()
+        config.start_qemu()
+    finally:
+        config.cleanup()
+    return 0
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception as esc:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
deleted file mode 100755
index d10466d..0000000
--- a/scripts/runqemu-internal
+++ /dev/null
@@ -1,739 +0,0 @@
-#!/bin/bash -x
-
-# Handle running OE images under qemu
-#
-# Copyright (C) 2006-2011 Linux Foundation
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-
-# Call setting:
-#   QEMU_MEMORY (optional) - set the amount of memory in the emualted system.
-#   SERIAL_LOGFILE (optional) - log the serial port output to a file
-#
-# Image options:
-#   MACHINE - the machine to run
-#   FSTYPE - the image type to run
-#   KERNEL - the kernel image file to use
-#   ROOTFS - the disk image file to use
-#
-
-mem_size=-1
-
-#Get rid of <> and get the contents of extra qemu running params
-SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e 's/<//' -e 's/>//'`
-#if user set qemu memory, eg: -m 256 in qemu extra params, we need to do some 
-# validation check
-mem_set=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-m[[:space:]] *[0-9]*\)'`
-if [ ! -z "$mem_set" ] ; then
-#Get memory setting size from user input
-  mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
-fi
-
-# This file is created when runqemu-gen-tapdevs creates a bank of tap
-# devices, indicating that the user should not bring up new ones using
-# sudo.
-NOSUDO_FLAG="/etc/runqemu-nosudo"
-
-QEMUIFUP=`which runqemu-ifup 2> /dev/null`
-QEMUIFDOWN=`which runqemu-ifdown 2> /dev/null`
-if [ -z "$QEMUIFUP" -o ! -x "$QEMUIFUP" ]; then
-       echo "runqemu-ifup cannot be found or executed"
-       exit 1
-fi
-if [ -z "$QEMUIFDOWN" -o ! -x "$QEMUIFDOWN" ]; then
-       echo "runqemu-ifdown cannot be found or executed"
-       exit 1
-fi
-
-NFSRUNNING="false"
-
-#capture original stty values
-ORIG_STTY=$(stty -g)
-
-if [ "$SLIRP_ENABLED" = "yes" ]; then
-    KERNEL_NETWORK_CMD="ip=dhcp"
-    QEMU_TAP_CMD=""
-    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
-    QEMU_NETWORK_CMD=""
-    DROOT="/dev/vda"
-    ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
-else
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
-        fi
-
-        IFCONFIG=`which ip 2> /dev/null`
-        if [ -z "$IFCONFIG" ]; then
-            IFCONFIG=/sbin/ip
-        fi
-        if [ ! -x "$IFCONFIG" ]; then
-               echo "$IFCONFIG cannot be executed"
-               exit 1
-        fi
-
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
-            # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
-            # but inactive. This looks scary but is harmless
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
-        fi
-
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
-        fi
-        DROOT="/dev/vda"
-        ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
-
-        KERNCMDLINE="mem=$QEMU_MEMORY"
-        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
-
-        NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
-        export NFS_INSTANCE
-
-        SERIALOPTS=""
-        if [ "x$SERIAL_LOGFILE" != "x" ]; then
-            SERIALOPTS="-serial file:$SERIAL_LOGFILE"
-        fi
-fi
-
-if [ ! -f "$KERNEL" -a "$IS_VM" = "false" ]; then
-    echo "Error: Kernel image file $KERNEL doesn't exist"
-    cleanup
-    return 1
-fi
-
-if [ "$FSTYPE" != "nfs" -a "$IS_VM" = "false" -a ! -f "$ROOTFS" ]; then
-    echo "Error: Image file $ROOTFS doesn't exist"
-    cleanup
-    return 1
-fi
-
-if [ "$NFS_SERVER" = "" ]; then
-    NFS_SERVER="192.168.7.1"
-    if [ "$SLIRP_ENABLED" = "yes" ]; then
-	NFS_SERVER="10.0.2.2"
-    fi
-fi
-
-if [ "$FSTYPE" = "nfs" ]; then
-    NFS_DIR=`echo $ROOTFS | sed 's/^[^:]*:\(.*\)/\1/'`
-    if [ "$NFS_INSTANCE" = "" ] ; then
-	NFS_INSTANCE=0
-    fi
-    MOUNTD_RPCPORT=$[ 21111 + $NFS_INSTANCE ]
-    NFSD_RPCPORT=$[ 11111 + $NFS_INSTANCE ]
-    NFSD_PORT=$[ 3049 + 2 * $NFS_INSTANCE ]
-    MOUNTD_PORT=$[ 3048 + 2 * $NFS_INSTANCE ]
-    UNFS_OPTS="nfsvers=3,port=$NFSD_PORT,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,mountport=$MOUNTD_PORT"
-
-    PSEUDO_LOCALSTATEDIR=~/.runqemu-sdk/pseudo
-    export PSEUDO_LOCALSTATEDIR
-
-    # Start the userspace NFS server
-    echo "runqemu-export-rootfs restart $ROOTFS"
-    runqemu-export-rootfs restart $ROOTFS
-    if [ $? != 0 ]; then
-        return 1
-    fi
-    NFSRUNNING="true"
-fi
-
-
-set_mem_size() {
-    if [ ! -z "$mem_set" ] ; then
-        #Get memory setting size from user input
-        mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
-    else
-        mem_size=$1
-    fi
-    # QEMU_MEMORY has 'M' appended to mem_size
-    QEMU_MEMORY="$mem_size"M
-
-}
-
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
-}
-
-config_qemuarm64() {
-    set_mem_size 512
-    QEMU=qemu-system-aarch64
-
-    QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
-    DROOT="/dev/vda"
-    ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,if=none,format=raw -device virtio-blk-device,drive=disk0"
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
-}
-
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
-        QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
-    fi
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
-    # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
-    # qemux86 and qemux86-64. We can use timer interrupt mode for now.
-    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
-}
-
-config_qemumips() {
-    set_mem_size 256
-    case "$MACHINE" in
-       qemumips)   QEMU=qemu-system-mips ;;
-       qemumipsel) QEMU=qemu-system-mipsel ;;
-       qemumips64) QEMU=qemu-system-mips64 ;;
-    esac
-    MACHINE_SUBTYPE=malta
-    QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
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
-}
-
-config_qemuppc() {
-    set_mem_size 256
-    QEMU=qemu-system-ppc
-    MACHINE_SUBTYPE=mac99
-    CPU_SUBTYPE=G4
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
-    if [ "$SLIRP_ENABLED" = "yes" ]; then
-        QEMU_NETWORK_CMD=""
-    else
-        QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
-    fi
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
-}
-
-config_qemuzynq() {
-    set_mem_size 1024
-    QEMU=qemu-system-arm
-    QEMU_NETWORK_CMD="-net nic -net nic $QEMU_TAP_CMD"
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xilinx-zynq-a9 -serial null -serial mon:stdio -nographic -dtb $KERNEL-$MACHINE.dtb"
-    # zynq serial ports are named 'ttyPS0' and 'ttyPS1', fixup the default values
-    SCRIPT_KERNEL_OPT=$(echo "$SCRIPT_KERNEL_OPT" | sed 's/console=ttyS/console=ttyPS/g')
-    if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
-        KERNCMDLINE="earlyprintk root=/dev/ram rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS -initrd $ROOTFS"
-    fi
-}
-
-config_qemuzynqmp() {
-    set_mem_size 2048
-    QEMU=qemu-system-aarch64
-
-    export QEMU_AUDIO_DRV="none"
-    if [ "x$SERIALSTDIO" = "x" ] ; then
-        QEMU_UI_OPTIONS="-nographic"
-    else
-        QEMU_UI_OPTIONS=""
-    fi
-
-    # Networking and system options required for QEMU ZynqMP machine
-    QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
-
-    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -initrd $ROOTFS"
-}
-
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
-        ;;
-    "qemux86")
-        config_qemux86
-        ;;
-    "qemux86-64")
-        config_qemux86_64
-        ;;
-    "qemumips" | "qemumipsel" | "qemumips64")
-        config_qemumips
-        ;;
-    "qemuppc")
-        config_qemuppc
-        ;;
-    "qemush4")
-        config_qemush4
-        ;;
-    "qemuzynq")
-        config_qemuzynq
-        ;;
-    "qemuzynqmp")
-        config_qemuzynqmp
-        ;;
-    "qemumicroblaze")
-        config_qemumicroblaze
-        ;;
-    *)
-        echo "Error: Unsupported machine type $MACHINE"
-        return 1
-    ;;
-esac
-
-# We need to specify -m <mem_size> to overcome a bug in qemu 0.14.0
-# https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/584480
-if [ -z "$mem_set" ] ; then
-  SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -m $mem_size"
-fi
-
-if [ "${FSTYPE:0:3}" = "ext" ]; then
-    KERNCMDLINE="$KERNCMDLINE rootfstype=$FSTYPE"
-fi
-
-if [ "$FSTYPE" = "cpio.gz" ]; then
-    QEMUOPTIONS="-initrd $ROOTFS -nographic"
-    KERNCMDLINE="root=/dev/ram0 console=ttyS0 debugshell"
-fi
-
-if [ "$FSTYPE" = "iso" ]; then
-    QEMUOPTIONS="$QEMU_NETWORK_CMD -cdrom $ROOTFS $QEMU_UI_OPTIONS"
-fi
-
-if [ "x$QEMUOPTIONS" = "x" ]; then
-    echo "Error: Unable to support this combination of options"
-    cleanup
-    return 1
-fi
-
-if [ "$TCPSERIAL_PORTNUM" != "" ]; then
-    if [ "$MACHINE" = "qemuarm64" ]; then
-        SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -device virtio-serial-device -chardev socket,id=virtcon,port=$TCPSERIAL_PORTNUM,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-    else
-        SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -serial tcp:127.0.0.1:$TCPSERIAL_PORTNUM"
-    fi
-fi
-
-PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$PATH
-
-QEMUBIN=`which $QEMU 2> /dev/null`
-if [ ! -x "$QEMUBIN" ]; then
-    echo "Error: No QEMU binary '$QEMU' could be found."
-    cleanup
-    return 1
-fi
-
-NEED_GL=`ldd $QEMUBIN/$QEMU 2>&1 | grep libGLU`
-# We can't run without a libGL.so
-if [ "$NEED_GL" != "" ]; then
-    libgl='no'
-
-    [ -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so ] && libgl='yes'
-    [ -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so ] && libgl='yes'
-    [ -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so ] && libgl='yes'
-
-    if [ "$libgl" != 'yes' ]; then
-        echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
-        Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.
-        Fedora package names are: mesa-libGL-devel mesa-libGLU-devel."
-        return 1;
-    fi
-fi
-
-do_quit() {
-    cleanup
-    return 1
-}
-
-trap do_quit INT TERM QUIT
-
-# qemu got segfault if linked with nVidia's libgl
-GL_LD_PRELOAD=$LD_PRELOAD
-
-if ldd $QEMUBIN | grep -i nvidia &> /dev/null
-then
-cat << EOM
-WARNING: nVidia proprietary OpenGL libraries detected.
-nVidia's OpenGL libraries are known to have compatibility issues with qemu,
-resulting in a segfault. Please uninstall these drivers or ensure the mesa libGL
-libraries precede nvidia's via LD_PRELOAD(Already do it on Ubuntu 10).
-EOM
-
-# Automatically use Ubuntu system's mesa libGL, other distro can add its own path
-if grep -i ubuntu /etc/lsb-release &> /dev/null
-then
-    # precede nvidia's driver on Ubuntu 10
-    UBUNTU_MAIN_VERSION=`cat /etc/lsb-release |grep DISTRIB_RELEASE |cut -d=  -f 2| cut -d. -f 1`
-    if [ "$UBUNTU_MAIN_VERSION" = "10" ];
-    then
-        GL_PATH=""
-        if test -e /usr/lib/libGL.so
-        then 
-            GL_PATH="/usr/lib/libGL.so"
-        elif test -e /usr/lib/x86_64-linux-gnu/libGL.so
-        then
-            GL_PATH="/usr/lib/x86_64-linux-gnu/libGL.so"
-        fi
-
-        echo "Skip nVidia's libGL on Ubuntu 10!"
-        GL_LD_PRELOAD="$GL_PATH $LD_PRELOAD"
-    fi
-fi
-fi
-
-if [ "x$SERIALSTDIO" = "x1" ]; then
-        echo "Interrupt character is '^]'"
-        stty intr ^]
-fi
-
-
-# Preserve the multiplexing behavior for the monitor that would be there based
-# on whether nographic is used.
-if echo "$QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT" | grep -- "-nographic"; then
-    FIRST_SERIAL_OPT="-serial mon:stdio"
-else
-    FIRST_SERIAL_OPT="-serial mon:vc"
-fi
-
-# qemuarm64 uses virtio for any additional serial ports so the normal mechanism
-# of using -serial will not work
-if [ "$MACHINE" = "qemuarm64" ]; then
-    SECOND_SERIAL_OPT="-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-else
-    SECOND_SERIAL_OPT="-serial null"
-fi
-
-# We always want a ttyS1. Since qemu by default adds a serial port when
-# nodefaults is not specified, it seems that all that would be needed is to
-# make sure a "-serial" is there. However, it appears that when "-serial" is
-# specified, it ignores the default serial port that is normally added.
-# So here we make sure to add two -serial if there are none. And only one
-# if there is one -serial already.
-NUM_SERIAL_OPTS=`echo $QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT | sed -e 's/ /\n/g' | grep --count -- -serial`
-
-if [ "$NUM_SERIAL_OPTS" = "0" ]; then
-    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $FIRST_SERIAL_OPT $SECOND_SERIAL_OPT"
-elif [ "$NUM_SERIAL_OPTS" = "1" ]; then
-    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $SECOND_SERIAL_OPT"
-fi
-
-echo "Running $QEMU..."
-# -no-reboot is a mandatory option - see bug #100
-if [ "$IS_VM" = "true" ]; then
-    # Check root=/dev/sdX or root=/dev/vdX
-    [ ! -e "$VM" ] && error "VM image is not found!"
-    if grep -q 'root=/dev/sd' $VM; then
-        echo "Using scsi drive"
-        VM_DRIVE="-drive if=none,id=hd,file=$VM -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd"
-    elif grep -q 'root=/dev/hd' $VM; then
-        echo "Using ide drive"
-        VM_DRIVE="$VM"
-    else
-        echo "Using virtio block drive"
-        VM_DRIVE="-drive if=virtio,file=$VM"
-    fi
-    QEMU_FIRE="$QEMUBIN $VM_DRIVE $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
-    echo $QEMU_FIRE
-    LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE
-elif [ "$FSTYPE" = "iso" -o "$FSTYPE" = "wic" ]; then
-    QEMU_FIRE="$QEMUBIN $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
-    echo $QEMU_FIRE
-    LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE
-else
-    QEMU_FIRE="$QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SLIRP_CMD $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT"
-    echo $QEMU_FIRE -append '"'$KERNCMDLINE $SCRIPT_KERNEL_OPT'"'
-    LD_PRELOAD="$GL_LD_PRELOAD" $QEMU_FIRE -append "$KERNCMDLINE $SCRIPT_KERNEL_OPT"
-fi
-ret=$?
-if [ "$SLIRP_ENABLED" != "yes" ]; then
-        cleanup
-fi
-
-#set the original stty values before exit
-stty ${ORIG_STTY}
-trap - INT TERM QUIT
-
-return $ret
-- 
2.9.0


