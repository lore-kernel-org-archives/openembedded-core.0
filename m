Received: from mail-ia0-f174.google.com ([209.85.210.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Tm2Vu-0005Af-D2
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:19:48 +0100
Received: by mail-ia0-f174.google.com with SMTP id y25so3842043iay.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=gSw7c9AOmCvRQTg2PMFN3av+g29d317DvLNaQZE+ESo=;
	b=o9nMZuZkdHiBTPeD7XAhNKH3PUh41iu6jNWJHaFTV2+Qc/7jBA8BqpeWcAHqvwrQmp
	gf13mXT2qpcGFijv0ej05SaamDsRlz2Br58MIVRBBtomJl2cFFHRZzMJ4zC+nQhDtaVO
	LcllusqbNVOXakoj1G9M/rWrK9vhb++9beuOkewftvHl2O5eYpiu9aWP+VxNVrxzDSEu
	LY+lwZLcSQ/FbQ/WLMjFyA8L0pO8eJttFjNC7jdqEh/2X0zwmHI9v9WUYwCwyhAayVdm
	jq/kWyHilyuOZTNMjVJFb4ZN/JjkrKevkBFatbYyCF0SvQe37TgRXsoznCzsL8OVKP6s
	xQ0Q==
X-Received: by 10.50.11.226 with SMTP id t2mr8529575igb.99.1356095100047;
	Fri, 21 Dec 2012 05:05:00 -0800 (PST)
Received: from localhost.localdomain (dsl-67-55-9-50.acanac.net. [67.55.9.50])
	by mx.google.com with ESMTPS id uj6sm9418483igb.4.2012.12.21.05.04.57
	(version=SSLv3 cipher=OTHER); Fri, 21 Dec 2012 05:04:58 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 08:04:53 -0500
Message-Id: <1356095093-21988-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] runqemu: change terminal's INTR key in 'serial' mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 13:19:48 -0000

If you are using an image in '-serial stdio' mode, temporarily change the
terminal's interrupt character to 'Ctrl-]' for the duration of the image
run. In this way, hitting 'Ctrl-C' for something running in the image
doesn't accidentally abort the entire qemu session.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/runqemu          | 2 ++
 scripts/runqemu-internal | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 190e3b4..9418ebd 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -64,6 +64,7 @@ LAZY_ROOTFS=""
 SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
 SCRIPT_KERNEL_OPT=""
+SERIALSTDIO=""
 
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
@@ -138,6 +139,7 @@ while true; do
         "serial")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
+            SERIALSTDIO="1"
             ;;
         "qemuparams="*)
             SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 7fbe0a0..a11220d 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -444,6 +444,7 @@ if [ "$MACHINE" = "qemush4" ]; then
         #KERNCMDLINE="root=/dev/hda console=ttyS0 console=tty0 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         KERNCMDLINE="root=/dev/hda rw console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
+        SERIALSTDIO="1"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -453,6 +454,7 @@ if [ "$MACHINE" = "qemush4" ]; then
         fi
         KERNCMDLINE="root=/dev/nfs console=ttySC1 noiotrap earlyprintk=sh-sci.1 console=tty nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M $MACHINE_SUBTYPE -no-reboot $QEMU_UI_OPTIONS -monitor null -serial vc -serial stdio"
+        SERIALSTDIO="1"
     fi
 fi
 
@@ -565,6 +567,11 @@ then
 fi
 fi
 
+if [ "x$SERIALSTDIO" = "x1" ]; then
+        echo "Interrupt character is '^]'"
+        stty intr ^]
+fi
+
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
 if [ "$FSTYPE" = "vmdk" ]; then
-- 
1.8.0



