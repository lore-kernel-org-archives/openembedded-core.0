Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D45E977BCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 21:49:21 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id w50so5205955wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ezKKHNyXyGoRp03soCJjnb1EgEP++LqXHZrC4Ze4QxY=;
	b=DOdtWdfCSlVrMPyFi4CADe8l8701AIqwedpVyk1RBXs72omRVEnhK8wQv61Uyc0S6w
	rtDlcJqgjODaOmpDZHN2ko+lMrPm69yzSx8w7jSuLZaCgGrofB5GPRDDP/CqZKhYOpDx
	xXBJO6vXqzN+kYj7F1uaLtSpCX9K5YvS7oBDDJYcV1wXT+BJjeb48IKweuQnPa3vc5rn
	E8Bf2d1GqzuaJ4vVqU/hoUJqrHOOEO9XKt32JDjV5TewvXSFNEQgS5TFTP8QB19+KYu+
	bm9dBw39lLj4YQJl/l4c0tJ+bOaRP9PXyYT8Y8gU9MW+FAbA1QyCqSOrcDkNydWjZCdS
	RtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ezKKHNyXyGoRp03soCJjnb1EgEP++LqXHZrC4Ze4QxY=;
	b=NdOkrWGOUUQ4qvZP567iRHcEEZBDQaoyZMkGCPNDF8fNCYuIpzYOAbRALw1ox+ciji
	rVw3g4BtrD4iJ3LMIp1Mhu76tGUgM9tbYLSRZ/XyZC7xZaD/EMla7oabvlt7LejX2sHJ
	/QQjLedrAKT8P0xbxTsWi/ZUoI0o49xYA+cMAoG+aZ02aIjNbvq1wFDjjfmK8daw20FD
	4CtP1fUO20eNim0m9E7zwOyXTASQNkRKCXS2FKhfTelurCQI0m55mnG+TzBzjYjTly7H
	bFH9A+VaTFpPtX9HG1C7SRq7vPvfOaYN8vQVjTjg8igrydPr6jWZLXh4hAb0sBjONwep
	BATQ==
X-Gm-Message-State: AN3rC/6zWBwvSH8dFLV8aYTqxggl8EOr4KS+tIuBulM6L/JMglFvCivX
	aYQN3vMPLIpXOv2c
X-Received: by 10.223.128.200 with SMTP id 66mr5644374wrl.197.1493329762318;
	Thu, 27 Apr 2017 14:49:22 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d23sm3675580wra.6.2017.04.27.14.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Apr 2017 14:49:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 23:49:37 +0200
Message-Id: <20170427214937.30754-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] v86d, qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead of fbsetup init script
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
X-List-Received-Date: Thu, 27 Apr 2017 21:49:22 -0000

* also add UVESA_MODE variable for easier change of resolution and respect it in QB_KERNEL_CMDLINE_APPEND
  as well
* don't use init script just to call modprobe
* I wasn't able to test this all the way with runqemu, because runqemu
  doesn't work on my system, but I've verified that the right params
  appear there and that I can easily change UVESA_MODE from
  conf/local.conf, the modules.d and modprobe.d files look OK:
  OE qemux86@ ~/build/oe-core/tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427212613.rootfs
  $ cat etc/modules-load.d/uvesafb.conf
  uvesafb

  OE qemux86@ ~/build/oe-core/tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427212613.rootfs
  $ cat etc/modprobe.d/uvesafb.conf
  options uvesafb mode_option=1600x1200-32

  so I'll be able to drop this KERNEL_MODULE_AUTOLOAD +
  KERNEL_MODULE_PROBECONF from my DISTRO conf.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc |  7 +++++-
 meta/recipes-bsp/v86d/v86d/fbsetup         |  3 ---
 meta/recipes-bsp/v86d/v86d/uvesafb.conf    |  2 --
 meta/recipes-bsp/v86d/v86d_0.1.10.bb       | 36 ------------------------------
 4 files changed, 6 insertions(+), 42 deletions(-)
 delete mode 100755 meta/recipes-bsp/v86d/v86d/fbsetup
 delete mode 100644 meta/recipes-bsp/v86d/v86d/uvesafb.conf

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 06ac983d4d..18f755a5d0 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -10,6 +10,11 @@ QB_CPU_KVM_x86-64 = "-cpu kvm64"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
-QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
+QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
+
+KERNEL_MODULE_AUTOLOAD += "uvesafb"
+KERNEL_MODULE_PROBECONF += "uvesafb"
+UVESA_MODE ?= "640x480-32"
+module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
diff --git a/meta/recipes-bsp/v86d/v86d/fbsetup b/meta/recipes-bsp/v86d/v86d/fbsetup
deleted file mode 100755
index 2a409cc529..0000000000
--- a/meta/recipes-bsp/v86d/v86d/fbsetup
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh 
-
-/sbin/modprobe uvesafb
diff --git a/meta/recipes-bsp/v86d/v86d/uvesafb.conf b/meta/recipes-bsp/v86d/v86d/uvesafb.conf
deleted file mode 100644
index 43789755d3..0000000000
--- a/meta/recipes-bsp/v86d/v86d/uvesafb.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-# Load uvesafb.ko at boot
-uvesafb
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index eab466d30d..579a0a27eb 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -11,8 +11,6 @@ PR = "r2"
 
 SRC_URI = "http://distfiles.gentoo.org/distfiles/${BP}.tar.bz2 \
            file://Update-x86emu-from-X.org.patch \
-           file://fbsetup \
-           file://uvesafb.conf \
            file://ar-from-env.patch \
            file://aarch64-host.patch \
 "
@@ -23,9 +21,6 @@ SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3b4502badeb0d9194b4bd81241d25
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-INITSCRIPT_NAME = "fbsetup"
-INITSCRIPT_PARAMS = "start 0 S ."
-
 do_configure () {
 	./configure --with-x86emu
 }
@@ -37,35 +32,4 @@ do_compile () {
 do_install () {
 	install -d ${D}${base_sbindir}
 	install v86d ${D}${base_sbindir}/
-
-        # Only install fbsetup script if 'sysvinit' is in DISTRO_FEATURES
-        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-            install -d ${D}${sysconfdir}/init.d/
-            install -m 0755 ${WORKDIR}/fbsetup ${D}${sysconfdir}/init.d/fbsetup
-        fi
-
-        # Install systemd related configuration file
-        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-            install -d ${D}${sysconfdir}/modules-load.d
-            install -m 0644 ${WORKDIR}/uvesafb.conf ${D}${sysconfdir}/modules-load.d
-        fi
-}
-
-# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
-# manually to avoid unnecessary postinst/preinst generated.
-python __anonymous() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
-inherit update-rc.d
-
-PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
-pkg_postinst_${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
-		if [ -n "$D" ]; then
-			OPTS="--root=$D"
-		fi
-		systemctl $OPTS mask fbsetup.service
-	fi
 }
-- 
2.12.2


