Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tbb6O-0000f9-Go
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 19:02:16 +0100
Received: by mail-yh0-f47.google.com with SMTP id g23so850809yhg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 09:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=QtbUf7TStUSDyVdnzvJzHxnbpMQUKxaKSe//t5U7cvY=;
	b=Zzi6bRDorm4IiJxiCIFzwb5tG3C7lwuTRZGqIM602ya83OujpQzh5bTrrFC6q1TkP9
	YCfHRBnLhsLBiXHG3WvsHQfjVKB6FsgQ1DpHHs7khopWLbBKoaPC2XjZRXNDh90y3+Hs
	/3KQNyBzBmuoydgWKQ9DaWE6xQXMasOSmao1+BQUzrDhnb7Qh9Jc3DDOrrHMZ2pj7b+T
	iucdwKjk7jqEohGqUquwmz4Tlp+TTqNE+g8V3P11JNywIlbY1GP8cq8/aUxZsG9Af5iU
	At4pw4D+Gc2DtcbEkJIYoqZF1f0ibE7SUaRcOXr+4z0U7eFfWthc4/Zu87+Kf1Wc0Hrm
	ihAg==
Received: by 10.236.143.131 with SMTP id l3mr1131054yhj.108.1353606489617;
	Thu, 22 Nov 2012 09:48:09 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id y9sm3586461anh.20.2012.11.22.09.48.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 09:48:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2012 15:47:58 -0200
Message-Id: <1353606478-12323-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] initramfs-framework: udev: Handle alternative binary paths
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
X-List-Received-Date: Thu, 22 Nov 2012 18:02:16 -0000

This allows use of udev daemon for different installation destinations
so allowing use of udev's from systemd code for initramfs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Change for v2:
 - Fix inverted logic in test.

 .../initrdscripts/initramfs-framework/udev         |   25 ++++++++++++++++----
 .../initrdscripts/initramfs-framework_1.0.bb       |    2 +
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 9ea8aa3..7fbcc61 100644
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
+	if [ -z "$_UDEV_DAEMON" ]; then
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



