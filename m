Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdJwK-0006S6-Qf
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 13:07:00 +0100
Received: by mail-gg0-f175.google.com with SMTP id y1so1200010ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 03:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=FnUmOtuGut0meWb1mxdxj7nJdu1fMMMbe/P3VoB/xO8=;
	b=uNDVWVMv2Y1YPVUDAHLEEBnByValbNcoeNxB4ajQJ2B+bZdx0H03LHD7QJzUslK06A
	OyJjraZMTqqMlLSQnuhcAU2TuZfyw6mczkH2Ua5T+kQOmHWnKsYuyIqKlbXt58u69Nr9
	R3ZpRsfHE2jkuVvyIhfooR8kdix7D/dDzHcHJAlCPNmnnyOXVk6h4metA2bkxn8Abl/+
	awgNkbfaIUHq/5GUkX+TghwEWJqtBUFbOqS1E8xZuwuSsDzI8vTKlCSf3e6BPTz2BbjU
	NTk3BJPLsw18gjr0Vspa2/gbyLfPmGNrDcKK0z0xBtIHxZIq2rBvW1hnTU5HZvmvFaqx
	h73g==
Received: by 10.100.238.20 with SMTP id l20mr4208494anh.79.1354017167532;
	Tue, 27 Nov 2012 03:52:47 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br
	([177.100.163.15])
	by mx.google.com with ESMTPS id n12sm16368249ani.7.2012.11.27.03.52.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 03:52:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 09:55:02 -0200
Message-Id: <1354017303-22536-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] initramfs-framework: udev: Handle alternative binary paths
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
X-List-Received-Date: Tue, 27 Nov 2012 12:07:01 -0000

This allows use of udev daemon for different installation destinations
so allowing use of udev's from systemd code for initramfs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initrdscripts/initramfs-framework/udev         |   25 ++++++++++++++++----
 .../initrdscripts/initramfs-framework_1.0.bb       |    2 +-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 15a1d5b..7fbcc61 100644
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
-	if [ ! -e /lib/udev/udevd ]; then
-		debug "/lib/udev/udev doesn't exist"
+	if [ -z "$_UDEV_DAEMON" ]; then
+		msg "WARNING: Cannot find the udev daemon; daemon will not be started in initramfs."
 		return 1
 	fi
 
@@ -14,9 +29,9 @@ udev_enabled() {
 udev_run() {
 	mkdir -p /run
 
-	/lib/udev/udevd --daemon > /dev/null
+	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
 	udevadm settle
 
-	killall udevd 2>/dev/null
+	killall `basename $_UDEV_DAEMON` 2>/dev/null
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 45d6592..cbb4a39 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS = "busybox"
 
-PR = "r1"
+PR = "r2"
 
 inherit allarch
 
-- 
1.7.10.4



