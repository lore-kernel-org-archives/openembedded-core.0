Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B90FA78594
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:31:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y206so8053480wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=frYMeMghdVZtfSKXT0A8M0hAkmsRLMp3kdEyuw0tgs8=;
	b=qaTSEb/Bh5yWK8dfHzo9NJz06NJAFGyOz8YaPXUr7D48X6n622+L4vU4pahTPNPVT7
	gHBwq0H8dN2nqyT+fz6tm8jUdCCNH9xIS/6wQsBtyxnCO3beD5E61bVu0/yRULFate3I
	kVwUlUJonAp6T4GWSyVwSkKgAzYr4Vikb8EBHUwuapr2amFNNet49Yna68zjZ8jXaclc
	lI+SZBp0APVVx//1STc4mbqtoYhExVj8PLAA2nvTa/kAaQsRrzJOUTh1ux8CQot7MyPO
	ZJYV/dHQWClTZx0lgC/HfoduVuYnCVSKVM4cRjgn2pJgpiR2iIlrYjzP9CXZYCCmQG/9
	EDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=frYMeMghdVZtfSKXT0A8M0hAkmsRLMp3kdEyuw0tgs8=;
	b=Cvy2jWQFnfudBk9D4Dp0uJXOo5Qdz6fpABII862kNG2Yljk2CySvWF12h6rsYiP0z1
	fnJw4tGJWOFLsOJ+cdY4MIS5m++/W11NM8mwOUH5ktfpBNtRFmUcmKF/eKPPr3JvWBZr
	h1ACBz7dRrNg9sjsW1GhsKySxkCQC5wztz2zbpYl/qisCGR5D+6xLyK9vlLtqqC/oAMM
	1luXqz/87Vf0Olr1dDGR+ao5rL6fNjrIFFZLVr9uXaLCSuqdsO+upeoRR1nefKGMVy7c
	Vt7kdB249whUgUUqWsWqyRwBEWkOOsYkvqlGAoK0RiP9JXIRs93gRxTzO/ILc8cndwSv
	Uo5g==
X-Gm-Message-State: AHYfb5jfoWlztnmPelRO2/axWgSE/Riwx8d76GIjfevzJokLrMIrPiOv
	1/o1hea6A8TTQD49
X-Received: by 10.28.128.213 with SMTP id b204mr174372wmd.128.1502497862159;
	Fri, 11 Aug 2017 17:31:02 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r14sm185326wme.22.2017.08.11.17.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:31:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:32:28 +0200
Message-Id: <20170812003231.10130-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [PATCH][pyro 1/4] v86d, qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead of fbsetup init script
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
X-List-Received-Date: Sat, 12 Aug 2017 00:31:01 -0000

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
index acd03a1ce8..acf9d55c40 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -10,6 +10,11 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
 
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
2.14.0


