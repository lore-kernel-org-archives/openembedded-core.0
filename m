Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 45EBD606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 12:58:30 +0000 (UTC)
Received: by labhs14 with SMTP id hs14so13176434lab.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 04:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jkn7Tyj3td0JQ709XKQgb4ikYr6t8PDJRYPSG0+LEVw=;
	b=JzT2Ol+JM/Y1s+ST9viC19VlhQSBIMAjU82JknAZOyBU91IvHemVkEqM1odbW6b/Ua
	Svzay40Z3cuDKuy+CoUxCBaUDYxcxycwkohXKiE9dbmN9+xfn7gLQxVG4yIiq6QL0I5z
	y8Th3OZ5dvvm8IZfstnocBQSM9BBFDzQGkuDzlhxZfM4kCH2h2QnrWHTtNAz0RyTyQtj
	eP6Gger19vy/IQrfs9UX/b2Iz5SBsZGeNMtrfmeMdLOP5CRFOcoWZTh58NG+c2xCl//o
	7zrhxZQP0fbllm2O0Q4eWsUiJFshRuAGqp5gGlS2j51hLcc0mcxGSJpoH1eDwtav2m+Y
	2Ekw==
X-Received: by 10.152.181.129 with SMTP id dw1mr16765466lac.101.1423486710414; 
	Mon, 09 Feb 2015 04:58:30 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id p8sm1620160lae.39.2015.02.09.04.58.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Feb 2015 04:58:29 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 13:58:28 +0100
Message-Id: <1423486708-11715-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] cryptodev-module: Fix build on kernel v3.19
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Feb 2015 12:58:34 -0000

Kernel commit f938612dd97d481b8b5bf960c992ae577f081c17 removes the get_unused_fd_macro().
This patch replaces the macro with its output.

| NOTE: make -j 8 KERNEL_DIR=/home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/sysroots/qt5022/usr/src/kernel PREFIX=/home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/work/qt5022-poky-linux/cryptodev-module/1.6-r0/image KERNEL_PATH=/home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/sysroots/qt5022/usr/src/kernel KERNEL_SRC=/home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/sysroots/qt5022/usr/src/kernel KERNEL_VERSION=3.19.0-qtec-standard CC=x86_64-poky-linux-gcc  LD=x86_64-poky-linux-ld.bfd  AR=x86_64-poky-linux-ar
| make -C /home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/sysroots/qt5022/usr/src/kernel SUBDIRS=`pwd` modules
| make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
| make[1]: Entering directory '/home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/sysroots/qt5022/usr/src/kernel'
|   CC [M]  /home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/work/qt5022-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/ioctl.o
| /home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/work/qt5022-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/ioctl.c: In function 'clonefd':
| /home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/work/qt5022-poky-linux/cryptodev-module/1.6-r0/cryptodev-linux-1.6/ioctl.c:532:2: error: implicit declaration of function 'get_unused_fd' [-Werror=implicit-function-declaration]
|   ret = get_unused_fd();
|   ^

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../cryptodev/cryptodev-module_1.6.bb              |  1 +
 .../files/0001-ioctl.c-Fix-build-on-3.19.patch     | 29 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
index df50e5a..e6b1025 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
@@ -10,6 +10,7 @@ DEPENDS += "cryptodev-linux"
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
 file://0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch \
+file://0001-ioctl.c-Fix-build-on-3.19.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch
new file mode 100644
index 0000000..74c8972
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch
@@ -0,0 +1,29 @@
+From 7d71124991030f99965e6e6aaed421115f185adb Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Mon, 9 Feb 2015 13:51:56 +0100
+Subject: [PATCH] ioctl.c: Fix build on 3.19
+
+get_unused_fd() MACRO has been removed on kernel 3.19. Replace by the
+actual output of the macro.
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ ioctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index f26cf93..cf8cc17 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -529,7 +529,7 @@ static int
+ clonefd(struct file *filp)
+ {
+ 	int ret;
+-	ret = get_unused_fd();
++	ret = get_unused_fd_flags(0);
+ 	if (ret >= 0) {
+ 			get_file(filp);
+ 			fd_install(ret, filp);
+-- 
+2.1.4
+
-- 
2.1.4


