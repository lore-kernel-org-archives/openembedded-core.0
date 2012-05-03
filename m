Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SPzjU-0002WB-Nd
	for openembedded-core@openembedded.org; Thu, 03 May 2012 19:22:24 +0200
Received: by wgbdr1 with SMTP id dr1so1530195wgb.12
	for <openembedded-core@openembedded.org>;
	Thu, 03 May 2012 10:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5nIKqqhdt/6YO9Yk5TrH/dFi2WD6k0NmshQ5qP/FxcA=;
	b=0BO24m92oLcfTw712WrCrvQ9bHh841lE5Mfc2Fs/ot63eDWckYoRQ1X8tAVjpifkT6
	Iz60WvTyHVeUA2m4vGoH8s85oQgX9vWu0/YIjtuLkX8GweBaYDFvP/ovW56Cxfgbj9af
	CuFCRdwtgFqohSB7tzxHY6zn+JAn2eLTjmW4qfnRV3c55mJ82hp8DFPwreHVelZo0wnH
	goN3YvJGN82Fd6zoJQTbOCEvXjDn8gLdVsSjP6H6vBRn4ZyNVrqbukUrMu7ZLnvtcppd
	UejgT6SpaLXC0TnMT9kLv8AmOE6tfHY1GbOjkOTtTBrmEwssILe9cl4FuxdaKxLvPOFG
	Z0Yw==
Received: by 10.216.141.39 with SMTP id f39mr1829002wej.90.1336065159268;
	Thu, 03 May 2012 10:12:39 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id du4sm5016075wib.10.2012.05.03.10.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:12:37 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SPzZz-0002E0-Lq; Thu, 03 May 2012 19:12:35 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu,  3 May 2012 19:12:32 +0200
Message-Id: <1336065154-8513-4-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 4/6] runqemu: add and use error()
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
X-List-Received-Date: Thu, 03 May 2012 17:22:25 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   71 ++++++++++++++++++++-----------------------------------
 1 file changed, 25 insertions(+), 46 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dfa7f4b..231b1bf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -46,6 +46,11 @@ if [ "x$1" = "x" ]; then
     usage
 fi
 
+error() {
+    echo "Error: "$*
+    usage
+}
+
 MACHINE=${MACHINE:=""}
 KERNEL=""
 FSTYPE=""
@@ -65,12 +70,8 @@ process_filename() {
     case /$EXT/ in
 	/bin/)
 		# A file ending in .bin is a kernel
-		if [ -z "$KERNEL" ]; then
-		    KERNEL=$filename
-		else
-		    echo "Error: conflicting KERNEL args [$KERNEL] and [$filename]"
-		    usage
-		fi
+		[ -z "$KERNEL" ] && KERNEL=$filename || \
+		    error "conflicting KERNEL args [$KERNEL] and [$filename]"
 		;;
 	/ext[234]/|/jffs2/|/btrfs/)
 		# A file ending in a supportted fs type is a rootfs image
@@ -78,13 +79,11 @@ process_filename() {
 		    FSTYPE=$EXT
 		    ROOTFS=$filename
 		else
-		    echo "Error: conflicting FSTYPE types [$FSTYPE] and [$EXT]"
-		    usage
+		    error "conflicting FSTYPE types [$FSTYPE] and [$EXT]"
 		fi
 		;;
 	*)
-		echo "Error: unknown file arg [$filename]"
-		usage
+		error "unknown file arg [$filename]"
 		;;
     esac
 }
@@ -97,20 +96,12 @@ while [ $i -le $# ]; do
     arg=${!i}
     case $arg in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemuppc")
-            if [ -z "$MACHINE" ]; then
-                MACHINE=$arg
-            else
-                echo "Error: conflicting MACHINE types [$MACHINE] and [$arg]"
-                usage
-            fi
+            [ -z "$MACHINE" ] && MACHINE=$arg || \
+                error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
         "ext2" | "ext3" | "jffs2" | "nfs" | "btrfs")
-            if [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ]; then
-                FSTYPE=$arg
-            else
-                echo "Error: conflicting FSTYPE types [$FSTYPE] and [$arg]"
-                usage
-            fi
+            [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ] && FSTYPE=$arg || \
+                error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
         *-image*)
             if [ -z "$ROOTFS" ]; then
@@ -127,8 +118,7 @@ while [ $i -le $# ]; do
                     LAZY_ROOTFS="true"
                 fi
             else
-                echo "Error: conflicting ROOTFS args [$ROOTFS] and [$arg]"
-                usage
+                error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
             fi
             ;;
         "nographic")
@@ -146,10 +136,8 @@ while [ $i -le $# ]; do
             # to use simplified options instead
             serial_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-serial\)'`
             kvm_option=`expr "$SCRIPT_QEMU_EXTRA_OPT" : '.*\(-enable-kvm\)'`
-            if [ ! -z "$serial_option" -o ! -z "$kvm_option" ]; then
-                echo "Error: Please use simplified serial or kvm options instead"
-                usage
-            fi
+            [ ! -z "$serial_option" -o ! -z "$kvm_option" ] && \
+                error "Please use simplified serial or kvm options instead"
             ;;
         "bootparams="*)
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT ${arg##bootparams=}"
@@ -172,21 +160,18 @@ while [ $i -le $# ]; do
                 if [ -z "$FSTYPE" -o "$FSTYPE" = "nfs" ]; then
                     FSTYPE=nfs
                 else
-                    echo "Error: conflicting FSTYPE types [$arg] and nfs"
-                    usage
+                    error "conflicting FSTYPE types [$arg] and nfs"
                 fi
 
                 if [ -z "$ROOTFS" ]; then
                     ROOTFS=$arg
                 else
-                    echo "Error: conflicting ROOTFS args [$ROOTFS] and [$arg]"
-                    usage
+                    error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
                 fi
             elif [ -f "$arg" ]; then
                 process_filename $arg
             else
-                echo "Error: unable to classify arg [$arg]"
-                usage
+                error "unable to classify arg [$arg]"
             fi
             ;;
     esac
@@ -229,19 +214,16 @@ fi
 
 # Report errors for missing combinations of options
 if [ -z "$MACHINE" -a -z "$KERNEL" ]; then
-    echo "Error: you must specify at least a MACHINE or KERNEL argument"
-    usage
+    error "you must specify at least a MACHINE or KERNEL argument"
 fi
 if [ "$FSTYPE" = "nfs" -a -z "$ROOTFS" ]; then
-    echo "Error: NFS booting without an explicit ROOTFS path is not yet supported"
-    usage
+    error "NFS booting without an explicit ROOTFS path is not yet supported"
 fi
 
 if [ -z "$MACHINE" ]; then
     MACHINE=`basename $KERNEL | sed 's/.*-\(qemux86-64\|qemux86\|qemuarm\|qemumips\|qemuppc\).*/\1/'`
     if [ -z "$MACHINE" ]; then
-        echo "Error: Unable to set MACHINE from kernel filename [$KERNEL]"
-        usage
+        error "Unable to set MACHINE from kernel filename [$KERNEL]"
     fi
     echo "Set MACHINE to [$MACHINE] based on kernel [$KERNEL]"
 fi
@@ -349,8 +331,7 @@ if [ -z "$KERNEL" ]; then
     KERNEL=$OE_TMPDIR/deploy/images/$kernel_file
 
     if [ -z "$KERNEL" ]; then
-        echo "Error: Unable to determine default kernel for MACHINE [$MACHINE]"
-        usage
+        error "Unable to determine default kernel for MACHINE [$MACHINE]"
     fi
 fi
 # KERNEL is now set for all cases
@@ -359,8 +340,7 @@ if [ -z "$FSTYPE" ]; then
     eval FSTYPE=\$${machine2}_DEFAULT_FSTYPE
 
     if [ -z "$FSTYPE" ]; then
-        echo "Error: Unable to determine default fstype for MACHINE [$MACHINE]"
-        usage
+        error "Unable to determine default fstype for MACHINE [$MACHINE]"
     fi
 fi
 
@@ -381,8 +361,7 @@ if [ -z "$ROOTFS" ]; then
     findimage $T $MACHINE $FSTYPE
 
     if [ -z "$ROOTFS" ]; then
-        echo "Error: Unable to determine default rootfs for MACHINE [$MACHINE]"
-        usage
+        error "Unable to determine default rootfs for MACHINE [$MACHINE]"
     fi
 fi
 # ROOTFS is now set for all cases
-- 
1.7.10



