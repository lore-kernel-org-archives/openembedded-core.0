Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SPzjT-0002W3-9t
	for openembedded-core@openembedded.org; Thu, 03 May 2012 19:22:23 +0200
Received: by wera1 with SMTP id a1so1410676wer.6
	for <openembedded-core@openembedded.org>;
	Thu, 03 May 2012 10:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=G8AK3JociWUxViD+FEb/gBwEgwJ0ftmNQuHGS4s3z9c=;
	b=LmVZBPA1vVo382c+8E1OMJcfSoKilw9GeS2g16ZCYsG3FUr0SmdHWW3sLPFB1hW6zz
	eZgXElIRwoTxSQQaTsXoo7yiBrVEO8lC7zauRIssEcLC+7srQSbUP6KFDvqSQTQ/2G2c
	wBc054S70dtjnQfrRSIDHOeZivzcagScQLwHUhi7uw1FhNgup1XwkbNoR9yrS1As4T8p
	DM7uS3b60g7hyqR5i63pmhroV+NtDy2N2ANUsipHimFo17DXxmIJeLJnSaA9Sry0onPg
	bmGkG4vf/w5AGsGOHWp5weFC2nZu54+tj2m7Vpuf0xsKrOWwGDjhEYcAF6Unzkk0+Bld
	QLEQ==
Received: by 10.180.79.72 with SMTP id h8mr5310985wix.1.1336065157825;
	Thu, 03 May 2012 10:12:37 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id ex2sm5028067wib.8.2012.05.03.10.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:12:36 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SPzZz-0002Du-Du; Thu, 03 May 2012 19:12:35 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu,  3 May 2012 19:12:30 +0200
Message-Id: <1336065154-8513-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 2/6] runqemu: use modern, single-char name of test(1)
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
X-List-Received-Date: Thu, 03 May 2012 17:22:23 -0000

I do not have "[[", just "[". Be gentle to users of legacy-free setups,
also by using '=' instead of the double notation.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7c2c4b3..18fd691 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -70,10 +70,10 @@ process_filename() {
             echo "Error: conflicting KERNEL args [$KERNEL] and [$filename]"
             usage
         fi
-    elif [[ "x$EXT" == "xext2" || "x$EXT" == "xext3" ||
-            "x$EXT" == "xjffs2" || "x$EXT" == "xbtrfs" ]]; then
+    elif [ "x$EXT" = "xext2" -o "x$EXT" = "xext3" -o \
+            "x$EXT" = "xjffs2" -o "x$EXT" = "xbtrfs" ]; then
         # A file ending in a supportted fs type is a rootfs image
-        if [[ -z "$FSTYPE" || "$FSTYPE" == "$EXT" ]]; then
+        if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
             FSTYPE=$EXT
             ROOTFS=$filename
         else
@@ -102,7 +102,7 @@ while [ $i -le $# ]; do
             fi
             ;;
         "ext2" | "ext3" | "jffs2" | "nfs" | "btrfs")
-            if [[ -z "$FSTYPE" || "$FSTYPE" == "$arg" ]]; then
+            if [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ]; then
                 FSTYPE=$arg
             else
                 echo "Error: conflicting FSTYPE types [$FSTYPE] and [$arg]"
@@ -143,7 +143,7 @@ while [ $i -le $# ]; do
             # to use simplified options instead
             serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
             kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
-            if [[ ! -z "$serial_option" || ! -z "$kvm_option" ]]; then
+            if [ ! -z "$serial_option" -o ! -z "$kvm_option" ]; then
                 echo "Error: Please use simplified serial or kvm options instead"
                 usage
             fi
@@ -152,7 +152,7 @@ while [ $i -le $# ]; do
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT ${arg##bootparams=}"
             ;;
         "audio")
-            if [[ "x$MACHINE" == "xqemux86" || "x$MACHINE" == "xqemux86-64" ]]; then
+            if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" ]; then
                 echo "Enable audio on qemu. Pls. install snd_intel8x0 or snd_ens1370 driver in linux guest.";
                 QEMU_AUDIO_DRV="alsa"
                 SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -soundhw ac97,es1370"
@@ -166,7 +166,7 @@ while [ $i -le $# ]; do
             # A directory name is an nfs rootfs
             if [ -d "$arg" ]; then
                 echo "Assuming $arg is an nfs rootfs"
-                if [[ -z "$FSTYPE" || "$FSTYPE" == "nfs" ]]; then
+                if [ -z "$FSTYPE" -o "$FSTYPE" = "nfs" ]; then
                     FSTYPE=nfs
                 else
                     echo "Error: conflicting FSTYPE types [$arg] and nfs"
@@ -200,13 +200,13 @@ fi
 
 YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
 # Detect KVM configuration
-if [[ "x$KVM_ENABLED" == "xyes" ]]; then
-    if [[ -z "$KVM_CAPABLE" ]]; then
+if [ "x$KVM_ENABLED" = "xyes" ]; then
+    if [ -z "$KVM_CAPABLE" ]; then
         echo "You are tring to enable KVM on cpu without VT support. Remove kvm from the command-line, or refer";
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-    if [[ "x$MACHINE" != "xqemux86" && "x$MACHINE" != "xqemux86-64" ]]; then
+    if [ "x$MACHINE" != "xqemux86" -a "x$MACHINE" != "xqemux86-64" ]; then
         echo "KVM only support x86 & x86-64. Remove kvm from the command-line";
         exit 1;
     fi
@@ -225,11 +225,11 @@ if [[ "x$KVM_ENABLED" == "xyes" ]]; then
 fi
 
 # Report errors for missing combinations of options
-if [[ -z "$MACHINE" && -z "$KERNEL" ]]; then
+if [ -z "$MACHINE" -a -z "$KERNEL" ]; then
     echo "Error: you must specify at least a MACHINE or KERNEL argument"
     usage
 fi
-if [[ "$FSTYPE" == "nfs" && -z "$ROOTFS" ]]; then
+if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
     echo "Error: NFS booting without an explicit ROOTFS path is not yet supported"
     usage
 fi
@@ -313,11 +313,11 @@ findimage() {
     # recently created one is the one we most likely want to boot.
     filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
     for name in $filenames; do
-        if [[ "$name" =~ core-image-sato-sdk ||
-              "$name" =~ core-image-sato     ||
-              "$name" =~ core-image-lsb      ||
-              "$name" =~ core-image-basic    ||
-              "$name" =~ core-image-minimal ]]; then
+        if [ "$name" =~ core-image-sato-sdk -o \
+              "$name" =~ core-image-sato     -o \
+              "$name" =~ core-image-lsb      -o \
+              "$name" =~ core-image-basic    -o \
+              "$name" =~ core-image-minimal ]; then
             ROOTFS=$name
             return
         fi	
@@ -327,11 +327,11 @@ findimage() {
     exit 1
 }
 
-if [[ -e "$ROOTFS" && -z "$FSTYPE" ]]; then
+if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
     # Extract the filename extension
     EXT=`echo $ROOTFS | awk -F . '{ print \$NF }'`
-    if [[ "x$EXT" == "xext2" || "x$EXT" == "xext3" || 
-          "x$EXT" == "xjffs2" || "x$EXT" == "xbtrfs" ]]; then
+    if [ "x$EXT" = "xext2" -o "x$EXT" = "xext3" -o \
+          "x$EXT" = "xjffs2" -o "x$EXT" = "xbtrfs" ]; then
         FSTYPE=$EXT
     else
         echo "Note: Unable to determine filesystem extension for $ROOTFS"
@@ -396,9 +396,9 @@ setup_sysroot
 # We can't run without a libGL.so
 libgl='no'
 
-test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so && libgl='yes'
-test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so && libgl='yes'
-test -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so && libgl='yes'
+[ -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so ] && libgl='yes'
+[ -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so ] && libgl='yes'
+[ -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so ] && libgl='yes'
 
 if [ "$libgl" != 'yes' ]; then
     echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
-- 
1.7.10



