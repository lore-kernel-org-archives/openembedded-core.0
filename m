Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKqIU-0007zM-RT
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 14:21:49 +0100
Received: by mail-pa0-f54.google.com with SMTP id fa10so2131394pad.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=n+Gje9sC0D7f16buZDv7crSoc5w6jZ4KiKpeEHD5cyw=;
	b=rJhsscuqGhhVuIGv0+n79/Vc7JtmZqxja0uXaeTunNUgZ/hRBA59wG90s+rpQ8r636
	ROmKVAoxmFL2H4qATL9M8cJCFViI3PIbPwSfsRKfN+NvqHXL/U4bCfe/vCDpG4Ob7DwF
	OuCDebeAQOhkiZx46UStiqdXFIXJCdjGP/iSaGe8eNEeTS4brKCsO1I+fvwf8VDFThEH
	792f0On4qeUuPhcJAl84Rl8KuAf6GM+QkujVl8fpqH8IQDihaW6MgvhZvM/c6bU2Iojd
	XvTBLhZFFdi9j76YGbS+qi5Z/mYBFQZw/7teMvgthOmkBxb9aPhn1zVfDUnkvoKwqA7N
	iUKw==
X-Received: by 10.68.201.227 with SMTP id kd3mr28641816pbc.65.1364389485164;
	Wed, 27 Mar 2013 06:04:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	rt13sm23349623pac.14.2013.03.27.06.04.42
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 06:04:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 14:04:23 +0100
Message-Id: <1364389463-22332-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] runqemu-internal: use MACHINE_SUBTYPE variable for qemuarm*
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
X-List-Received-Date: Wed, 27 Mar 2013 13:21:50 -0000

---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f06870e..762c584 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -302,7 +302,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
         KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M versatilepb -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
@@ -311,7 +311,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
             return 1
         fi
         KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M versatilepb --no-reboot $QEMU_UI_OPTIONS"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$MACHINE" = "qemuarmv6" ]; then
         QEMUOPTIONS="$QEMUOPTIONS -cpu arm1136"
-- 
1.8.1.5



