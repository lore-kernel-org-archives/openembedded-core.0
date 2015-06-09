Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2881F757C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 04:48:11 +0000 (UTC)
Received: by payr10 with SMTP id r10so5891739pay.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 21:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ksfhYi6Nf0Y+xoDO8pCMbpgPQo8PeWLvIVgK74diRKg=;
	b=ljqT5DuXjfgraJHFEnaAKCz82P+Fz2pdq0bzlAX/+An9DsZR27sSFyZa5oAAQRS4rv
	BBg7ubldUvJQi+ULRMPSaPiU84bcSp/fPVUKHPFSFSB8Hdf5A5FGSFgHFStxwRDiGgz4
	hOPdVt8KoeCtyEQ4DXEOnPhLEcLDfiOfytfxf4Q6SQJMTfG+jVVpFy6JGLGVYkjbsrvu
	Hnc6ye9Oe0ehTiLQ2tqGbcLyNFIwOZ4dNt9dsJPp1E1o2gc+T9eeIFK7N1nqQj/IVnw/
	9/Ngvo62FqarUQp9SoFwMgJDOzH36CtB6OQKjqLGmHCae5WoFx7VIl/etULAYcfdimjt
	y3Jg==
X-Gm-Message-State: ALoCoQnTAe7rudvRJcoNUJNtJJpv0av962MXQ2XF9vV1rbVH2xh8Mhe7B7g8i/XhcQ3v+XyvN9fm
X-Received: by 10.66.250.106 with SMTP id zb10mr35517348pac.36.1433825292445; 
	Mon, 08 Jun 2015 21:48:12 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id x3sm4059530pbt.93.2015.06.08.21.48.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jun 2015 21:48:11 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 10:18:06 +0530
Message-Id: <1433825286-925-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH][fido] runqemu: add support to boot arm64 qemu target from NFS
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
X-List-Received-Date: Tue, 09 Jun 2015 04:48:11 -0000

The other changes include,
runqemu - fix MACHINE type being detected as qemuarm when qemuarm64 kernel
          image name is given.

runqemu-internal - Added console=ttyAMA0,115200 as one of the boot parameters
                   for qemuarm, in order to print bootlog messages on the
                   console.

                 - Use "-nographic" option only if "serial" option is not
                   specified. Otherwise we get below error when
                   'runqemu <kernel_image> <rootfs_image> serial' is executed,

(snip)
QEMU 2.2.0 monitor - type 'help' for more information
(qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple character devices
-- CUT --

qemuarm64 NFS booting has been tested successfully on Ubuntu 14.04 host.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 scripts/runqemu          |  4 ++--
 scripts/runqemu-internal | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 84ece4d..09c507d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -232,13 +232,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2db5566..e346c64 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -275,9 +275,6 @@ else
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
         QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
-        if [ $MACHINE = 'qemuarm64' ]; then
-            QEMU_UI_OPTIONS="-nographic"
-        fi
 
         NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
         export NFS_INSTANCE
@@ -368,7 +365,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
             cleanup
             return 1
         fi
-        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$MACHINE" = "qemuarmv6" ]; then
@@ -383,12 +380,25 @@ if [ "$MACHINE" = "qemuarm64" ]; then
     QEMU=qemu-system-aarch64
 
     export QEMU_AUDIO_DRV="none"
-    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    if [ "x$SERIALSTDIO" = "x" ] ; then
+        QEMU_UI_OPTIONS="-nographic"
+    else
+        QEMU_UI_OPTIONS=""
+    fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
         # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
         QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
+    if [ "$FSTYPE" = "nfs" ]; then
+        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist"
+            cleanup
+            return 1
+        fi
+        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $QEMU_UI_OPTIONS"
+    fi
 fi
 
 
-- 
1.8.2.3


