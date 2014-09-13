Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C84A565D59
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 02:52:23 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id w10so2482740pde.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 19:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=1vi9F7uJIg0Q7ZRGxZl9frg6gEYQ0GU2tUcumUK8ufQ=;
	b=fJ4o6lLrwMSJflZVXQ+9Qs6BChfJvXFrOsZjLngup32BTKkAM/41hf8Clr580QrBQj
	iMV7ayCQzgsXi6UQriaGrJ0G2O9R/C2RFVEiDTfY1OPz1FY/mEDp0T5NmvNy6Tn9aG/I
	gUPmMml2LXMohxy26Nc3XegDMNNjjjKyTssIq4qZAP3QbTUFf8eCJP1wLyZxah3lSh1r
	y1iHMkIn4BYctCcNjYWO8kiHp5H6Fl9LwvysSVKJfeiIkV4wMTMbWI6iGjY/jzwcQHEu
	5Jmo1wE8mEvjS124Gg9oqZPnvwdd4vZJByV1rpjWXFF97ogZI0jOxha8dMVDqfhPpSWl
	7TpQ==
X-Received: by 10.70.118.68 with SMTP id kk4mr19666133pdb.21.1410576744765;
	Fri, 12 Sep 2014 19:52:24 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id jc3sm5098698pbd.59.2014.09.12.19.52.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Sep 2014 19:52:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Sep 2014 19:52:21 -0700
Message-Id: <1410576741-16362-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] scripts: add qemuppc64 qemu scripts
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
X-List-Received-Date: Sat, 13 Sep 2014 02:52:24 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/runqemu          | 10 +++++++---
 scripts/runqemu-internal | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ff64a1d..71cd798 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -109,7 +109,8 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemuppc64" | \
+        "qemumicroblaze" | "qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -229,13 +230,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\|qemuppc64).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\qemuppc64).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
@@ -316,6 +317,9 @@ QEMUSH4_DEFAULT_FSTYPE=ext3
 QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
 QEMUPPC_DEFAULT_FSTYPE=ext3
 
+QEMUPPC64_DEFAULT_KERNEL=vmlinux-qemuppc64.bin
+QEMUPPC64_DEFAULT_FSTYPE=ext3
+
 QEMUMICROBLAZE_DEFAULT_KERNEL=linux.bin.ub
 QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 38745dd..800ab69 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -59,6 +59,9 @@ else
         "qemuppc")
             mem_size=256
             ;;
+        "qemuppc64")
+            mem_size=1024
+            ;;
         "qemush4")
             mem_size=1024
             ;;
@@ -280,6 +283,7 @@ case "$MACHINE" in
     "qemumips64") ;;
     "qemush4") ;;
     "qemuppc") ;;
+    "qemuppc64") ;;
     "qemuarmv6") ;;
     "qemuarmv7") ;;
     "qemux86") ;;
@@ -548,6 +552,32 @@ if [ "$MACHINE" = "qemuzynq" ]; then
     fi
 fi
 
+if [ "$MACHINE" = "qemuppc64" ]; then
+    QEMU=qemu-system-ppc64
+    MACHINE_SUBTYPE=pseries
+    CPU_SUBTYPE=POWER7
+    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    if [ "$SLIRP_ENABLED" = "yes" ]; then
+        QEMU_NETWORK_CMD=""
+    else
+        QEMU_NETWORK_CMD="-net nic,model=e1000 $QEMU_TAP_CMD"
+    fi
+    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
+        KERNCMDLINE="root=/dev/sda rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+    fi
+    if [ "$FSTYPE" = "nfs" ]; then
+        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist"
+            cleanup
+            return 1
+        fi
+        KERNCMDLINE="root=/dev/nfs console=ttyS0 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS"
+    fi
+fi
+
+
 if [ "x$RAMFS" = "xtrue" ]; then
     QEMUOPTIONS="-initrd $ROOTFS -nographic"
     KERNCMDLINE="root=/dev/ram0 console=ttyS0 debugshell"
-- 
1.9.1


