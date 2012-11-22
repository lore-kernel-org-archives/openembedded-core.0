Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbaGy-0007nr-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 18:09:09 +0100
Received: by mail-ye0-f175.google.com with SMTP id q7so279707yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 08:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=vukdEpOKVPl7a+aVesOOM6tUelYHj6oX8E3kwWmAWvs=;
	b=gidm30pD8mkO2crs36nIRXVW2/G/EeuqqsaiCtEWjx9bV5p/vQYezID47Sa8zsnNcI
	XoLddapQ1CCnY9D8RBu8F9T5h7MK5XDyFlk+up5pHh0NvDwiUKDZGM3AiWpGm8HvTK/3
	QH112RI0lerf4DQh1Dgc/itTwEIiMMc2SfkKrRnuoqb/rgV/9MlZYhWJeAWuZpllPilc
	FHmwEfnWp0P3D+b7z+ASH0MsfRaYquhScvB20U2lMIgHfl7VG0H6EVYrNfWul+VJhhxJ
	OamVdUk5oLc9pWe9B1KCSctF7s7c8ISIboAw6MfA68NnuVrysw37XYsPuAAneugvULOk
	TSWA==
Received: by 10.236.126.196 with SMTP id b44mr1069503yhi.21.1353603299633;
	Thu, 22 Nov 2012 08:54:59 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id i26sm3784576yhc.10.2012.11.22.08.54.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 08:54:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2012 14:54:51 -0200
Message-Id: <1353603291-8788-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] initramfs-framework: udev: Handle alternative binary paths
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
X-List-Received-Date: Thu, 22 Nov 2012 17:09:11 -0000

This allows use of udev daemon for different installation destinations
so allowing use of udev's from systemd code for initramfs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-framework/udev         |   25 ++++++++++++++++----
 .../initrdscripts/initramfs-framework_1.0.bb       |    2 +
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 9ea8aa3..8be0595 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -1,10 +1,25 @@
 #!/bin/sh
-# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Copyright (C) 2011, 2012 O.S. Systems Software LTDA.
 # Licensed on MIT
 
+udev_daemon() {
+	OPTIONS="/sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
+
+	for o in $OPTIONS; do
+		if [ -x "$o" ]; then
+			echo $o
+			return 0
+		fi
+	done
+
+	return 1
+}
+
+_UDEV_DAEMON=`udev_daemon`
+
 udev_enabled() {
-	if [ ! -e /sbin/udevd ]; then
-		debug "/sbin/udev doesn't exist"
+	if [ ! -z "$_UDEV_DAEMON" ]; then
+		msg "WARNING: Cannot find the udev daemon; daemon will not be started in initramfs."
 		return 1
 	fi
 
@@ -14,9 +29,9 @@ udev_enabled() {
 udev_run() {
 	mkdir -p /run
 
-	udevd --daemon > /dev/null
+	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
 	udevadm settle
 
-	killall udevd 2>/dev/null
+	killall `basename $_UDEV_DAEMON` 2>/dev/null
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 58e41d4..45d6592 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,6 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS = "busybox"
 
+PR = "r1"
+
 inherit allarch
 
 SRC_URI = "file://init \
-- 
1.7.2.5



