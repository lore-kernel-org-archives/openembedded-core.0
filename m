Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SPzjV-0002WG-HR
	for openembedded-core@openembedded.org; Thu, 03 May 2012 19:22:26 +0200
Received: by wibhj13 with SMTP id hj13so434142wib.12
	for <openembedded-core@openembedded.org>;
	Thu, 03 May 2012 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+a4L7wSXAbHJO3k7r7rgqbi1PJbP7+awgeGe7XWay+s=;
	b=KZos3yWKgYeMj/nvX7LvyL/Ip2nxM2NzaBDeBo0zkaKdBLI8Iu+HKxsseVWwCIj6Zp
	69Nkvrik4hwConQCk4ZQP5gSmmc/cOppk1TZDDrh1cYtVucYSA1dwG873vGHKmincrIp
	LRHyXW1cNkxE6XprmvQ09cjM4hkkwBITStI9c8E08ankOQUglFGcp8OQiOnAzYPCAFPb
	w1p6ewQQ5BJ62LauetQ6nhNPrybh9cQ9h5wlZd02sjOsrcXJ/2re5QmUwEZnjN+U1Abd
	yyRcapR5gDMPgfHPykDSawqqXkDgqhmi8gsOlSgF1eKI23H3OIs1sk2kbQGXIZicoFv0
	XX2w==
Received: by 10.180.75.241 with SMTP id f17mr5169467wiw.11.1336065160031;
	Thu, 03 May 2012 10:12:40 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id u9sm956939wix.0.2012.05.03.10.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:12:37 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SPzZz-0002E3-PM; Thu, 03 May 2012 19:12:35 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu,  3 May 2012 19:12:33 +0200
Message-Id: <1336065154-8513-5-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 5/6] runqemu: minor tweaks
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
X-List-Received-Date: Thu, 03 May 2012 17:22:26 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 231b1bf..000d93a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -104,21 +104,19 @@ while [ $i -le $# ]; do
                 error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
         *-image*)
-            if [ -z "$ROOTFS" ]; then
-                if [ -f "$arg" ]; then
-                    process_filename $arg
-                elif [ -d "$arg" ]; then
-                    # Handle the case where the nfsroot dir has -image-
-                    # in the pathname
-                    echo "Assuming $arg is an nfs rootfs"
-                    FSTYPE=nfs
-                    ROOTFS=$arg
-                else
-                    ROOTFS=$arg
-                    LAZY_ROOTFS="true"
-                fi
+            [ -z "$ROOTFS" ] || \
+		error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
+            if [ -f "$arg" ]; then
+                process_filename $arg
+            elif [ -d "$arg" ]; then
+                # Handle the case where the nfsroot dir has -image-
+                # in the pathname
+                echo "Assuming $arg is an nfs rootfs"
+                FSTYPE=nfs
+                ROOTFS=$arg
             else
-                error "conflicting ROOTFS args [$ROOTFS] and [$arg]"
+                ROOTFS=$arg
+                LAZY_ROOTFS="true"
             fi
             ;;
         "nographic")
@@ -144,14 +142,15 @@ while [ $i -le $# ]; do
             ;;
         "audio")
             if [ "x$MACHINE" = "xqemux86" -o "x$MACHINE" = "xqemux86-64" ]; then
-                echo "Enable audio on qemu. Pls. install snd_intel8x0 or snd_ens1370 driver in linux guest.";
+                echo "Enabling audio in qemu."
+                echo "Please install snd_intel8x0 or snd_ens1370 driver in linux guest."
                 QEMU_AUDIO_DRV="alsa"
                 SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -soundhw ac97,es1370"
             fi
             ;;
         "kvm")
             KVM_ENABLED="yes"
-            KVM_CAPABLE=`grep 'vmx\|smx' /proc/cpuinfo`
+            KVM_CAPABLE=`grep -q 'vmx\|smx' /proc/cpuinfo && echo 1`
             ;;
         *)
             # A directory name is an nfs rootfs
@@ -190,7 +189,8 @@ YOCTO_KVM_WIKI="https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qe
 # Detect KVM configuration
 if [ "x$KVM_ENABLED" = "xyes" ]; then
     if [ -z "$KVM_CAPABLE" ]; then
-        echo "You are tring to enable KVM on cpu without VT support. Remove kvm from the command-line, or refer";
+        echo "You are trying to enable KVM on a cpu without VT support."
+        echo "Remove kvm from the command-line, or refer"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
@@ -199,14 +199,16 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
         exit 1;
     fi
     if [ ! -e /dev/kvm ]; then
-        echo "Missing KVM device. Have you inserted kvm modules? Pls. refer";
+        echo "Missing KVM device. Have you inserted kvm modules?"
+        echo "For further help see"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
     if 9<>/dev/kvm ; then
         SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm"
     else
-        echo "You have no rights on /dev/kvm. Pls. change the owndership as described at";
+        echo "You have no rights on /dev/kvm."
+        echo "Please change the ownership of this file as described at"
         echo "$YOCTO_KVM_WIKI";
         exit 1;
     fi
-- 
1.7.10



