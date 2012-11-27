Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdKKx-0007JL-07
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 13:32:42 +0100
Received: by mail-ye0-f175.google.com with SMTP id q7so976268yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 04:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FnUmOtuGut0meWb1mxdxj7nJdu1fMMMbe/P3VoB/xO8=;
	b=FWIQzs8/45jnM0ou5wsZxc8yAX9UDlP4ucUQy2Wu2OcyLQPDJyL+mheCd31toiZ29L
	BK1PMkRITOZeiFYeum0f1ZH7+Q8ChuzJlcRd9Id+gs37abJ0OEnUmVBtjnSjDmt9R9oU
	IamWUmNNrsksFKOvzLE6gLu8PzGVxwILUmZYhKzBn6emCiH03a1zhZQPZIjOJwsCzekx
	+ksP3J4KsJ8fJ43x9slQ6hTzPC5lr/O3tuXG9KkOGYLljHYJktzc6AJ57qlfPk7wzuLs
	kcZAjCrEqcyNXZiG8y3vvckS+FTfXGjm35t7u2n2FeqPl6PpmiON7MX/II8lmMc8Usu8
	a7EA==
Received: by 10.236.133.174 with SMTP id q34mr15123047yhi.5.1354018674141;
	Tue, 27 Nov 2012 04:17:54 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br
	([177.100.163.15])
	by mx.google.com with ESMTPS id v8sm18136452yhi.15.2012.11.27.04.17.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 04:17:53 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 10:20:06 -0200
Message-Id: <1354018807-23083-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354018807-23083-1-git-send-email-otavio@ossystems.com.br>
References: <1354018807-23083-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [for-danny][PATCH 2/3] initramfs-framework: udev: Handle alternative binary paths
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
X-List-Received-Date: Tue, 27 Nov 2012 12:32:43 -0000

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



