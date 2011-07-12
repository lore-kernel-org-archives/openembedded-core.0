Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QgoKt-0002At-A2
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 03:33:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 18:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="26983687"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 18:29:59 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 12:02:39 -0700
Message-Id: <177b3514fcb50027a166e78ed88bf94f08fef8a4.1310497097.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
References: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310497097.git.nitin.a.kamble@intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/5] runqemu: support qemux32 machine
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
X-List-Received-Date: Wed, 13 Jul 2011 01:33:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 scripts/qemuimage-testlib |    2 +-
 scripts/runqemu           |   12 ++++++++----
 scripts/runqemu-internal  |   25 +++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index c2dbf60..05df11a 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -424,7 +424,7 @@ Test_Create_Qemu()
 		return 1
 	fi
 	
-	if [ "$QEMUARCH" = "qemux86" -o "$QEMUARCH" = "qemux86-64" ]; then
+	if [ "$QEMUARCH" = "qemux86" -o "$QEMUARCH" = "qemux32" -o "$QEMUARCH" = "qemux86-64" ]; then
 		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k bzImage -a ${QEMUARCH})
 	elif [ "$QEMUARCH" = "qemuarm" -o "$QEMUARCH" = "spitz" -o "$QEMUARCH" = "borzoi" -o "$QEMUARCH" = "akita" -o "$QEMUARCH" = "nokia800" -o "$QEMUARCH" = "qemuppc" ]; then
 		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k zImage -a ${QEMUARCH})
diff --git a/scripts/runqemu b/scripts/runqemu
index 5aed25a..ef57638 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -93,7 +93,7 @@ i=1
 while [ $i -le $# ]; do
     arg=${!i}
     case $arg in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemuppc")
+        "qemux86" | "qemux32" | "qemux86-64" | "qemuarm" | "qemumips" | "qemuppc")
             if [ -z "$MACHINE" ]; then
                 MACHINE=$arg
             else
@@ -136,7 +136,7 @@ while [ $i -le $# ]; do
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
             ;;
         "audio")
-            if [[ "x$MACHINE" == "xqemux86" || "x$MACHINE" == "xqemux86-64" ]]; then
+            if [[ "x$MACHINE" == "xqemux86" || "x$MACHINE" == "xqemux32" || "x$MACHINE" == "xqemux86-64" ]]; then
                 echo "Enable audio on qemu. Pls. install snd_intel8x0 or snd_ens1370 driver in linux guest.";
                 QEMU_AUDIO_DRV="alsa"
                 SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -soundhw ac97,es1370"
@@ -192,7 +192,7 @@ if [[ "x$KVM_ENABLED" == "xyes" ]]; then
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [[ "x$MACHINE" != "xqemux86" && "x$MACHINE" != "xqemux86-64" ]]; then
+    if [[ "x$MACHINE" != "xqemux86" && "x$MACHINE" != "xqemux32" && "x$MACHINE" != "xqemux86-64" ]]; then
         echo "KVM only support x86 & x86-64. Remove kvm from the command-line";
         exit 1;
     fi
@@ -221,7 +221,7 @@ if [[ "$FSTYPE" == "nfs" && -z "$ROOTFS" ]]; then
 fi
 
 if [ -z "$MACHINE" ]; then
-    MACHINE=`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux86\|qemuarm\|qemumips\|qemuppc\).*/\1/'`
+    MACHINE=`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux32\|qemux86\|qemuarm\|qemumips\|qemuppc\).*/\1/'`
     if [ -z "$MACHINE" ]; then
         echo "Error: Unable to set MACHINE from kernel filename [$KERNEL]"
         usage
@@ -236,6 +236,10 @@ QEMUX86_DEFAULT_KERNEL=bzImage-qemux86.bin
 QEMUX86_DEFAULT_FSTYPE=ext3
 QEMUX86_DEFAULT_ROOTFS="core-image-sato-sdk core-image-sato core-image-lsb core-image-basic core-image-minimal"
 
+QEMUX32_DEFAULT_KERNEL=bzImage-qemux32.bin
+QEMUX32_DEFAULT_FSTYPE=ext3
+QEMUX32_DEFAULT_ROOTFS="core-image-sato-sdk core-image-sato core-image-lsb core-image-basic core-image-minimal"
+
 QEMUX86_64_DEFAULT_KERNEL=bzImage-qemux86-64.bin
 QEMUX86_64_DEFAULT_FSTYPE=ext3
 QEMUX86_64_DEFAULT_ROOTFS="core-image-sato-sdk core-image-sato core-image-lsb core-image-basic core-image-minimal"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index c15632d..9f204e0 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -45,6 +45,9 @@ else
         "qemux86")
             mem_size=128
             ;;
+        "qemux32")
+            mem_size=128
+            ;;
         "qemux86-64")
             mem_size=128
             ;;
@@ -218,6 +221,7 @@ case "$MACHINE" in
     "qemuarmv6") ;;
     "qemuarmv7") ;;
     "qemux86") ;;
+    "qemux32") ;;
     "qemux86-64") ;;
     "akita") ;;
     "spitz") ;;
@@ -319,6 +323,27 @@ if [ "$MACHINE" = "qemux86" ]; then
     KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
 fi
 
+if [ "$MACHINE" = "qemux32" ]; then
+    QEMU=qemu-system-x86_64
+    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware -enable-gl"
+    if [ "$FSTYPE" = "ext3" ]; then
+        KERNCMDLINE="vga=0 root=/dev/hda rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
+    fi
+    if [ "$FSTYPE" = "nfs" ]; then
+        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist."
+            cleanup
+            return
+        fi
+        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD $QEMU_UI_OPTIONS"
+    fi
+    # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
+    # qemux86 and qemux86-64. We can use timer interrupt mode for now.
+    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
+fi
+
 if [ "$MACHINE" = "qemux86-64" ]; then
     QEMU=qemu-system-x86_64
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware -enable-gl"
-- 
1.7.5.4



