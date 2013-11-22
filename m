Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B49C86B7F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 22:33:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2013 14:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,754,1378882800"; d="scan'208";a="438308954"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.137])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2013 14:33:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 14:33:10 -0800
Message-Id: <1385159590-27427-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] runqemu: Extend to support genericx86* machine types
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
X-List-Received-Date: Fri, 22 Nov 2013 22:33:10 -0000

I have done some very basic testing to boot to graphics and run some graphics 
programs.  The genericx86* currently do not have Sound or NFSD support enabled
which qemux86* kernel do.  There might be some other bits needed, I am working
to figure that out.

[YOCTO #5105]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu          | 21 +++++++++++++++------
 scripts/runqemu-internal | 10 ++++++----
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 619ffb6..1f8199c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -108,6 +108,7 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | \
+        "genericx86" | "genericx86-64" | \
         "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
@@ -163,7 +164,8 @@ while true; do
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT ${arg##bootparams=}"
             ;;
         "audio")
-            if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" ]; then
+            if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" -o \
+                 "x$MACHINE" = "xgenericx86" -o "x$MACHINE" = "xgenericx86-64" ]; then
                 echo "Enabling audio in qemu."
                 echo "Please install snd_intel8x0 or snd_ens1370 driver in linux guest."
                 QEMU_AUDIO_DRV="alsa"
@@ -224,13 +226,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|genericx86-64\|genericx86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|genericx86-64\|genericx86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
@@ -248,7 +250,8 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [ "x$MACHINE" != "xqemux86" -a "x$MACHINE" != "xqemux86-64" ]; then
+    if [ "x$MACHINE" != "xqemux86" -a "x$MACHINE" != "xqemux86-64" -o \
+         "x$MACHINE" != "xgenericx86" -a "x$MACHINE" != "xgenericx86-64" ]; then
         echo "KVM only support x86 & x86-64. Remove kvm from the command-line";
         exit 1;
     fi
@@ -265,9 +268,9 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         exit 1;
     fi
     if [ -w /dev/kvm -a -r /dev/kvm ]; then
-        if [ "x$MACHINE" = "xqemux86" ]; then
+        if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xgeneric86" ]; then
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm32"
-        elif [ "x$MACHINE" = "xqemux86-64" ]; then
+        elif [ "x$MACHINE" = "xqemux86-64" -o "x$MACHINE" = "xgeneric86-64" ]; then
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm64"
         fi
         KVM_ACTIVE="yes"
@@ -292,9 +295,15 @@ machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
 QEMUX86_DEFAULT_KERNEL=bzImage-qemux86.bin
 QEMUX86_DEFAULT_FSTYPE=ext3
 
+GENERICX86_DEFAULT_KERNEL=bzImage-genericx86.bin
+GENERICX86_DEFAULT_FSTYPE=ext3
+
 QEMUX86_64_DEFAULT_KERNEL=bzImage-qemux86-64.bin
 QEMUX86_64_DEFAULT_FSTYPE=ext3
 
+GENERICX86_64_DEFAULT_KERNEL=bzImage-genericx86-64.bin
+GENERICX86_64_DEFAULT_FSTYPE=ext3
+
 QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
 QEMUARM_DEFAULT_FSTYPE=ext3
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 74b0c35..e7b8a82 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -41,10 +41,10 @@ if [ ! -z "$mem_set" ] ; then
   mem_size=`echo $mem_set | sed 's/-m[[:space:]] *//'`
 else
     case "$MACHINE" in
-        "qemux86")
+        "qemux86"|"genericx86")
             mem_size=256
             ;;
-        "qemux86-64")
+        "qemux86-64"|"genericx86-64")
             mem_size=256
             ;;
         "qemuarm")
@@ -280,6 +280,8 @@ case "$MACHINE" in
     "qemuarmv7") ;;
     "qemux86") ;;
     "qemux86-64") ;;
+    "genericx86") ;;
+    "genericx86-64") ;;
     "qemuzynq") ;;
     "akita") ;;
     "spitz") ;;
@@ -355,7 +357,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     fi
 fi
 
-if [ "$MACHINE" = "qemux86" ]; then
+if [ "$MACHINE" = "qemux86" -o "$MACHINE" = "genericx86" ]; then
     QEMU=qemu-system-i386
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
@@ -379,7 +381,7 @@ if [ "$MACHINE" = "qemux86" ]; then
     KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
 fi
 
-if [ "$MACHINE" = "qemux86-64" ]; then
+if [ "$MACHINE" = "qemux86-64" -o "$MACHINE" = "genericx86-64" ]; then
     QEMU=qemu-system-x86_64
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-- 
1.8.3.1


