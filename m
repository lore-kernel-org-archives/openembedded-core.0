Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TXwxW-0008LI-3W
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 17:34:02 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Nov 2012 08:20:07 -0800
Received: by mail-wg0-f69.google.com with SMTP id 16so4408594wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 08:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pWSEiPidehkNGIM7LTazN5ZyWJNcbUjtbcBTpRMzt/8=;
	b=BczwWY79qPuhNSXpa6GzGZ2+3HyNH3tgoHgX6IF9g0+zf/1bma0CzGGzJ+Yb29f6yJ
	R3i9sXN+oEYXjUXsIFH0X5T1Cwz9f8+XMViHe3bDhPbXQwwn4AKZzPHAsX7RWvTKOFrN
	JNqXklmaOm80K4rPPKBqC5bRiX/8CkjYIH+TeT1Sx/HpBMC4Po/hTRMge0nc/pIqHFrc
	qvnmedEi1EQlcR/sOkX8/v0TLLAqRoH54z2Jl2MTAd0u3NkZ3g8W5FobUEXUoTS60DE4
	I39AnBnpjXM8MCrIn2PwJZbz0PoRu+EXpPDwmZQz1S1FNV+hvzvu8nGaoMvg6pQJRkFn
	qdgA==
Received: by 10.216.209.224 with SMTP id s74mr8744378weo.63.1352737205586;
	Mon, 12 Nov 2012 08:20:05 -0800 (PST)
Received: by 10.216.209.224 with SMTP id s74mr8744373weo.63.1352737205446;
	Mon, 12 Nov 2012 08:20:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ec3sm2996224wib.10.2012.11.12.08.20.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 08:20:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2012 16:18:35 +0000
Message-Id: <1352737115-2241-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnMDA2AeaEwS9XF66IT0PaZ4rCaTjpJdSvC86zNXZ1DbIrMyqR4LVeBU/0hvMPIIutwLwePxsIRS0BMiWpumJrh1gqawm4fmdrl+4t/6RIbBR5yftZNoJhfSXl/4KxZdRRS5vsXuV5/44veM8mRyDetD4uaw8qh40DfoNduqFPRJCOZ8IdqObcib03V8hft7NKKQkqk
Cc: Alexandru Damian <alexandru.damian@intel.com>
Subject: [PATCH V3] initrdscripts: fix udevd in the live boot init scripts
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
X-List-Received-Date: Mon, 12 Nov 2012 16:34:02 -0000

udevd moved location and isn't in $PATH anymore, so use an absolute path to
start it.

The control socket path moved too, so mkdir the directory it's in.

Mounts the new devtmpfs on /dev device tree.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexandru Damian <alexandru.damian@intel.com>
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
1.7.10



