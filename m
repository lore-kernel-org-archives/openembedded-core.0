Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZx-0005eM-Gi
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:41 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5531122pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iCNbPcdgPpkbHCO64C/7V5dOyPWdLhIl2/xBWbDNe9M=;
	b=AIPGF7g30j5ps8si5pfXW7kZWf/j9yHN+POAyyv6nw0w0zPDg68KaNkkMUPIHgHaEl
	BV1LWwBKdK0gRxUXLyVhWSwatKvEc0iCgxrKt8bcVR+o6OqcCIZ2a2rRZCFLKczoAS3w
	BRD9/bKBzplMEbrgSNS9G2EoHx5jBmdRtVpZ8okBKFIMVYweMQyCIvY8BGIbFcangLUW
	a8Ybpe+vXe7HsIL91fZd16OCD1WuJI1oWhZd8A8OqhDzKjWg5IcXxvO6bxgXeIy6e1Eq
	VglteBeaaeUrYTrKJBMsSIJl3l72M8UgDdQqZVL5gS2F0p3JDiRhs+d8/qZ5M8ThEEHW
	qxsA==
Received: by 10.68.234.200 with SMTP id ug8mr15875804pbc.54.1337571396457;
	Sun, 20 May 2012 20:36:36 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:43 -0700
Message-Id: <3a5432aec0faea49d2c04984cd169ceb35bba89f.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 08/14] runqemu: Add qemush4 and qemumips64 knowledge
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
X-List-Received-Date: Mon, 21 May 2012 03:46:41 -0000

New machines need to be added and they also
have different kernel commandlines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu          |   10 ++++++++--
 scripts/runqemu-internal |   35 ++++++++++++++++++++++++++++++++---
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index fc7363f..1e803ed 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -94,7 +94,7 @@ KVM_ENABLED="no"
 while true; do
     arg=${1}
     case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemuppc")
+        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumips64" | "qemush4"  | "qemuppc")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -223,7 +223,7 @@ if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
 fi
 
 if [ -z "$MACHINE" ]; then
-    MACHINE=`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux86\|qemuarm\|qemumips\|qemuppc\).*/\1/'`
+    MACHINE=`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
     if [ -z "$MACHINE" ]; then
         error "Unable to set MACHINE from kernel filename [$KERNEL]"
     fi
@@ -245,6 +245,12 @@ QEMUARM_DEFAULT_FSTYPE=ext3
 QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
 QEMUMIPS_DEFAULT_FSTYPE=ext3
 
+QEMUMIPS64_DEFAULT_KERNEL=vmlinux-qemumips64.bin
+QEMUMIPS64_DEFAULT_FSTYPE=ext3
+
+QEMUSH4_DEFAULT_KERNEL=vmlinux-qemumips.bin
+QEMUSH4_DEFAULT_FSTYPE=ext3
+
 QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
 QEMUPPC_DEFAULT_FSTYPE=ext3
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index fe2974b..c8e3186 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -51,12 +51,15 @@ else
         "qemuarm")
             mem_size=128
             ;;
-        "qemumips")
+        "qemumips"|"qemumips64")
             mem_size=128
             ;;
         "qemuppc")
             mem_size=128
             ;;
+        "qemush4")
+            mem_size=1024
+            ;;
         *)
             mem_size=64
             ;;
@@ -233,6 +236,8 @@ fi
 case "$MACHINE" in
     "qemuarm") ;;
     "qemumips") ;;
+    "qemumips64") ;;
+    "qemush4") ;;
     "qemuppc") ;;
     "qemuarmv6") ;;
     "qemuarmv7") ;;
@@ -370,8 +375,12 @@ if [ "$MACHINE" = "spitz" ]; then
     fi
 fi
 
-if [ "$MACHINE" = "qemumips" ]; then
-    QEMU=qemu-system-mips
+if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumips64" ]; then
+    if [ "$MACHINE" = "qemumips64" ]; then
+	QEMU=qemu-system-mips64
+    else
+	QEMU=qemu-system-mips
+    fi
     MACHINE_SUBTYPE=malta
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
@@ -411,6 +420,26 @@ if [ "$MACHINE" = "qemuppc" ]; then
     fi
 fi
 
+if [ "$MACHINE" = "qemush4" ]; then
+    QEMU=qemu-system-sh4
+    MACHINE_SUBTYPE=r2d
+    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+        #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/hda rw console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
+    fi
+    if [ "$FSTYPE" = "nfs" ]; then
+        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist"
+            cleanup
+            return
+        fi
+        KERNCMDLINE="root=/dev/nfs console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
+    fi
+fi
+
 if [ "$MACHINE" = "akita" ]; then
     QEMU=qemu-system-arm
     if [ "$FSTYPE" = "jffs2" ]; then
-- 
1.7.5.4



