Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58CB67016E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:53:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6r4j2024175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:53:04 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:53:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:52:58 -0700
Message-ID: <e91b1e8dd79aad662139794be9bfbfe1032fc5f0.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] runqemu-internal: cleanup unsed code
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
X-List-Received-Date: Mon, 14 Mar 2016 06:53:03 -0000
Content-Type: text/plain

* remove akita and spitz related code
  They are not supported by runqemu anymore:
  $ runqemu spitz
  Error: unable to classify arg [spitz]
  So remove related code.

* Remove checking of 256M for qemuarm, qemu can check it, for example:
  $ runqemu qemuarm qemuparams="-m 1024"
  [snip]
  qemu: Too much memory for this machine: 1024 MB, maximum 256 MB
  [snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu          |    6 ------
 scripts/runqemu-internal |   41 +----------------------------------------
 2 files changed, 1 insertion(+), 46 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index b4cc9de..ab7c4f3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -350,12 +350,6 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 QEMUZYNQ_DEFAULT_KERNEL=uImage
 QEMUZYNQ_DEFAULT_FSTYPE=cpio
 
-AKITA_DEFAULT_KERNEL=zImage-akita.bin
-AKITA_DEFAULT_FSTYPE=jffs2
-
-SPITZ_DEFAULT_KERNEL=zImage-spitz.bin
-SPITZ_DEFAULT_FSTYPE=ext3
-
 setup_path_vars() {
     if [ -z "$OE_TMPDIR" ] ; then
         PATHS_REQUIRED=true
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d591c09..e042161 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -77,23 +77,12 @@ fi
 # QEMU_MEMORY has 'M' appended to mem_size
 QEMU_MEMORY="$mem_size"M
 
-# Bug 433: qemuarm cannot use > 256 MB RAM
-if [ "$MACHINE" = "qemuarm" ]; then
-    if [ -z "$mem_size" -o $mem_size -gt 256 ]; then
-        echo "WARNING: qemuarm does not support > 256M of RAM."
-        echo "Changing QEMU_MEMORY to default of 256M."
-        QEMU_MEMORY="256M"
-	mem_size="256"
-        SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e "s/$mem_set/-m 256/" `
-    fi
-fi
-
 # We need to specify -m <mem_size> to overcome a bug in qemu 0.14.0
 # https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/584480
-
 if [ -z "$mem_set" ] ; then
   SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT -m $mem_size"
 fi
+
 # This file is created when runqemu-gen-tapdevs creates a bank of tap
 # devices, indicating that the user should not bring up new ones using
 # sudo.
@@ -292,8 +281,6 @@ case "$MACHINE" in
     "qemux86") ;;
     "qemux86-64") ;;
     "qemuzynq") ;;
-    "akita") ;;
-    "spitz") ;;
     *)
         echo "Error: Unsupported machine type $MACHINE"
         return 1
@@ -472,20 +459,6 @@ if [ "$MACHINE" = "qemux86-64" ]; then
     KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
 fi
 
-if [ "$MACHINE" = "spitz" ]; then
-    QEMU=qemu-system-arm
-    if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        echo $ROOTFS
-        ROOTFS=`readlink -f $ROOTFS`
-        echo $ROOTFS
-        if [ ! -e "$ROOTFS.qemudisk" ]; then
-            echo "Adding a partition table to the ext3 image for use by QEMU, please wait..."
-            runqemu-addptable2image $ROOTFS $ROOTFS.qemudisk
-        fi
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M spitz -hda $ROOTFS.qemudisk -portrait"
-    fi
-fi
-
 if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemumips64" ]; then
     case "$MACHINE" in
        qemumips)   QEMU=qemu-system-mips ;;
@@ -561,18 +534,6 @@ if [ "${FSTYPE:0:3}" = "ext" ]; then
     KERNCMDLINE="$KERNCMDLINE rootfstype=$FSTYPE"
 fi
 
-if [ "$MACHINE" = "akita" ]; then
-    QEMU=qemu-system-arm
-    if [ "$FSTYPE" = "jffs2" ]; then
-        ROOTFS=`readlink -f $ROOTFS`
-        if [ ! -e "$ROOTFS.qemuflash" ]; then
-            echo "Converting raw image into flash image format for use by QEMU, please wait..."
-        raw2flash.akita < $ROOTFS > $ROOTFS.qemuflash
-        fi
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M akita -mtdblock $ROOTFS.qemuflash -portrait"
-    fi
-fi
-
 if [ "$MACHINE" = "qemumicroblaze" ]; then
     QEMU=qemu-system-microblazeel
     QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M petalogix-ml605 -serial mon:stdio"
-- 
1.7.9.5


