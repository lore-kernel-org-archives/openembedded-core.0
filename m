Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdKKx-0007JK-07
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 13:32:42 +0100
Received: by mail-gh0-f175.google.com with SMTP id z2so1321892ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=HIGyzkH7Cao+cNBbgEXM+5g2e/8oYA/cF+qF+hNFJfo=;
	b=x4LR61bJ1z8G73wv+zluoAiVArybePs2sOKt0+0oM6ZV0J9dyexc9qsGSolCxhr4Sv
	lukp6ePpFgpbZ2KsWPLowNIe5ZhS5L03X8EFrT3lxciGpcFFTtfe0/98qwGfINhzdgcL
	Be1iG30imeSsRl6Qd//+8cnDlh7sAZyZTFasgi2XliRKwvJ8Wz5G8P7RBzS+Ikjo8ChO
	YlcAQtp6yFwvV8C1ZPRTiCwX61yt03Wgkduaj6hnaoV+6M18plDdCEbUQiVJv1OhGwiB
	yQjWNtaXB3i64BpcAp6lU0r2hYImF24TKuNAqqLOPY1hKp/mz+lkKrsGFig9ObQWVjnh
	d/lA==
Received: by 10.236.142.135 with SMTP id i7mr14630057yhj.127.1354018672063;
	Tue, 27 Nov 2012 04:17:52 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br
	([177.100.163.15])
	by mx.google.com with ESMTPS id v8sm18136452yhi.15.2012.11.27.04.17.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 04:17:51 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 10:20:05 -0200
Message-Id: <1354018807-23083-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru Damian <alexandru.damian@intel.com>
Subject: [for-danny][PATCH 1/3] initrdscripts: fix udevd in the live boot init scripts
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

From: Ross Burton <ross.burton@intel.com>

udevd moved location and isn't in $PATH anymore, so use an absolute path to
start it.

The control socket path moved too, so mkdir the directory it's in.

Mounts the new devtmpfs on /dev device tree.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexandru Damian <alexandru.damian@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/initrdscripts/files/init-live.sh         |    4 +++-
 meta/recipes-core/initrdscripts/initramfs-framework/udev   |    6 +++---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb |    2 ++
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb |    2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 5682fd1..c591f0d 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -14,12 +14,14 @@ early_setup() {
     mkdir -p /sys
     mount -t proc proc /proc
     mount -t sysfs sysfs /sys
+    mount -t devtmpfs none /dev
 
     # support modular kernel
     modprobe isofs 2> /dev/null
 
     mkdir -p /run
-    udevd --daemon
+    mkdir -p /var/run
+    /lib/udev/udevd --daemon
     udevadm trigger --action=add
 }
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 9ea8aa3..15a1d5b 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -3,8 +3,8 @@
 # Licensed on MIT
 
 udev_enabled() {
-	if [ ! -e /sbin/udevd ]; then
-		debug "/sbin/udev doesn't exist"
+	if [ ! -e /lib/udev/udevd ]; then
+		debug "/lib/udev/udev doesn't exist"
 		return 1
 	fi
 
@@ -14,7 +14,7 @@ udev_enabled() {
 udev_run() {
 	mkdir -p /run
 
-	udevd --daemon > /dev/null
+	/lib/udev/udevd --daemon > /dev/null
 	udevadm trigger --action=add
 	udevadm settle
 
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
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 137a401..55a8600 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,7 +5,7 @@ RDEPENDS = "udev"
 DEPENDS = "virtual/kernel"
 SRC_URI = "file://init-live.sh"
 
-PR = "r10"
+PR = "r11"
 
 do_compile() {
 	#if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
-- 
1.7.10.4



