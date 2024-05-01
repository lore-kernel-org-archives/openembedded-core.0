Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD3DC25B5C
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 21:56:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9538.1714600608458499040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 14:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DeGNqiSZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41ba1ba5592so38588105e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714600606; x=1715205406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsZtVebSvgIWAGgUDXJXmJbf6XRLN8dPUjcwcxbHBJ4=;
        b=DeGNqiSZcplZPPB6hfeUd3u+xNnKwlmlTDies2lKP6LRR1HyUMyNI27aGH6GdxV8da
         bK2WXcmeiinSNZkupYX0pyVVmyxrA6uu6tzgMTPJ+AXks8ZYbPbwJ4DZ9aJaXa0kKLVP
         4dZGRA0vAGVtaEZiaW+fVxr520xK8//zq6Yp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714600606; x=1715205406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsZtVebSvgIWAGgUDXJXmJbf6XRLN8dPUjcwcxbHBJ4=;
        b=WynItEbiNchdvX8iJYsKBUcMwceBqqFKYHLdviBmoRmn9fWliV68CeoyMBMcZLGdpa
         J7WXKzvz/qEdRt3rT+a4dtjWiDddL3N39XAZWa7qlfWB96zn9meC4AtNhWZ0/S9GNW42
         EzzCJzzJaNLs+U3FXUWyFgTD1hfGwHgEibUTsK94KWCsKPHxqvSsjyYMNnZRHCrQFhpO
         Ph3koioGm2P1qVWnEeasRkaQhYde9WCjBtKWJ1HPUhbd1oBqeSsfKy8cxtC/c5I31a6R
         Z/f4BB3A2674Um5EATtyYAvqJjJDGPm6Yi2qRIAh1u3EQdJm1Z1IFwkDqvOsGPvLH3HV
         mynQ==
X-Gm-Message-State: AOJu0YwwmaMIrBBXcJZyY42uAggKdI/ZDAyBARW30CNNSkLQK9R/FYKl
	M7DwjUmcTnrIpbYRZORDXwwl8XYH8BNkqLHJKT4I8eKqd30BEGvWRaJ6qtqpViZvZUU22W4dpul
	MUlg=
X-Google-Smtp-Source: AGHT+IFLJyFOif3XKMnjLQu0LUEjOuoPvqAnyu7ptXNvgiO/oS7QKvFoTLhMSlQN5Ga3NEZV1CopaQ==
X-Received: by 2002:a05:600c:5117:b0:41c:12c:aaa2 with SMTP id o23-20020a05600c511700b0041c012caaa2mr194055wms.33.1714600606176;
        Wed, 01 May 2024 14:56:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e92c:f8cd:59ee:48e5])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b0041a49b10a13sm3406986wmo.11.2024.05.01.14.56.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 14:56:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] recipes: Update S = WORKDIR recipes to use ${S} correctly
Date: Wed,  1 May 2024 22:56:42 +0100
Message-Id: <20240501215643.3386307-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
References: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198891

Where recipes use S = ${WORKDIR}, ensure they are referencing ${S} correctly
to access files as soon we want to stop doing this in WORKDIR at which point
they would break unless corrected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../selftest-hardlink/selftest-hardlink.bb    |  2 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb     |  8 +--
 meta/recipes-bsp/keymaps/keymaps_1.0.bb       |  2 +-
 meta/recipes-bsp/usbinit/usbinit.bb           |  2 +-
 .../ppp-dialin/ppp-dialin_0.1.bb              |  4 +-
 .../base-files/base-files_3.0.14.bb           | 24 ++++----
 .../busybox/busybox-inittab_1.36.1.bb         |  2 +-
 .../init-ifupdown/init-ifupdown_1.0.bb        |  8 +--
 .../initrdscripts/initramfs-boot_1.0.bb       |  2 +-
 .../initrdscripts/initramfs-framework_1.0.bb  | 22 +++----
 .../initramfs-live-boot-tiny_1.0.bb           |  2 +-
 .../initrdscripts/initramfs-live-boot_1.0.bb  |  2 +-
 .../initramfs-live-install-efi-testfs_1.0.bb  |  2 +-
 .../initramfs-live-install-efi_1.0.bb         |  2 +-
 .../initramfs-live-install-testfs_1.0.bb      |  2 +-
 .../initramfs-live-install_1.0.bb             |  2 +-
 .../initramfs-module-install-efi_1.0.bb       |  2 +-
 .../initramfs-module-install_1.0.bb           |  2 +-
 .../initramfs-module-setup-live_1.0.bb        |  2 +-
 .../initscripts/initscripts_1.0.bb            | 58 +++++++++----------
 .../systemd/systemd-serialgetty.bb            |  4 +-
 .../systemd/systemd-systemctl-native.bb       |  2 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb      |  4 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb  | 12 ++--
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  2 +-
 .../icecc-create-env/icecc-create-env_0.1.bb  |  2 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb         |  4 +-
 .../qemu/qemu-helper-native_1.0.bb            |  2 +-
 .../run-postinsts/run-postinsts_1.0.bb        |  6 +-
 .../rust/rust-cross-canadian.inc              |  2 +-
 .../shadow/shadow-securetty_4.6.bb            |  2 +-
 meta/recipes-graphics/wayland/weston-init.bb  | 16 ++---
 .../x11-common/xserver-nodm-init_3.0.bb       |  2 +-
 .../xorg-xserver/xserver-xf86-config_0.1.bb   |  4 +-
 .../modutils-initscripts.bb                   |  2 +-
 35 files changed, 109 insertions(+), 109 deletions(-)

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index be346b8a0ee..49c3fe827a5 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -14,7 +14,7 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${bindir}
-	install -m 755 ${WORKDIR}/gdb.sh ${D}${bindir}/
+	install -m 755 ${S}/gdb.sh ${D}${bindir}/
 	install -m 755 hello1 ${D}${bindir}/hello1
 	ln ${D}${bindir}/hello1 ${D}${bindir}/hello2
 
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index bd7f610f465..83384f2daf5 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -38,15 +38,15 @@ INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
 do_install() {
     # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
     if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-	sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state-init
+	sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${S}/alsa-state-init
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
+	install -m 0755 ${S}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
     fi
 
     install -d ${D}/${localstatedir}/lib/alsa
     install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/*.state ${D}${localstatedir}/lib/alsa
+    install -m 0644 ${S}/asound.conf ${D}${sysconfdir}
+    install -m 0644 ${S}/*.state ${D}${localstatedir}/lib/alsa
 }
 
 PACKAGES += "alsa-states"
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 3d5d127820d..e30dd9dca26 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -31,7 +31,7 @@ do_install () {
     # THe ulitity this script provides could be achieved by systemd-vconsole-setup.service
     if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${WORKDIR}/keymap.sh ${D}${sysconfdir}/init.d/
+	install -m 0755 ${S}/keymap.sh ${D}${sysconfdir}/init.d/
     fi
 }
 
diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index 3a50b835c24..b80191bddc4 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -5,7 +5,7 @@ same wire, at higher speeds than most Wifi connections."
 HOMEPAGE = "http://linux-sunxi.org/USB_Gadget/Ethernet"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://${S}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 
 SRC_URI = "file://usb-gether \
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 099c58bfc71..0c3085d3a8c 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -15,10 +15,10 @@ S = "${WORKDIR}"
 
 do_install() {
 	install -d ${D}${sysconfdir}/ppp/peers
-	install -m 0644 ${WORKDIR}/host-peer ${D}${sysconfdir}/ppp/peers/host
+	install -m 0644 ${S}/host-peer ${D}${sysconfdir}/ppp/peers/host
 
 	install -d ${D}${sbindir}
-	install -m 0755 ${WORKDIR}/ppp-dialin ${D}${sbindir}
+	install -m 0755 ${S}/ppp-dialin ${D}${sbindir}
 }
 
 USERADD_PACKAGES = "${PN}"
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 9fab53ce63c..42a8026e639 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -113,23 +113,23 @@ do_install () {
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
-	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
+	install -m 0644 ${S}/hosts ${D}${sysconfdir}/hosts
 	${BASEFILESISSUEINSTALL}
 
-	rotation=`cat ${WORKDIR}/rotation`
+	rotation=`cat ${S}/rotation`
 	if [ "$rotation" != "0" ]; then
- 		install -m 0644 ${WORKDIR}/rotation ${D}${sysconfdir}/rotation
+ 		install -m 0644 ${S}/rotation ${D}${sysconfdir}/rotation
 	fi
 
-	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
-	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
+	install -m 0644 ${S}/fstab ${D}${sysconfdir}/fstab
+	install -m 0644 ${S}/profile ${D}${sysconfdir}/profile
 	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
         sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
-	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
-	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
-	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
-	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
-	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
+	install -m 0644 ${S}/shells ${D}${sysconfdir}/shells
+	install -m 0755 ${S}/share/dot.profile ${D}${sysconfdir}/skel/.profile
+	install -m 0755 ${S}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
+	install -m 0644 ${S}/host.conf ${D}${sysconfdir}/host.conf
+	install -m 0644 ${S}/motd ${D}${sysconfdir}/motd
 
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 
@@ -145,12 +145,12 @@ do_install () {
 }
 
 do_install:append:libc-glibc () {
-	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
+	install -m 0644 ${S}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
 }
 
 DISTRO_VERSION[vardepsexclude] += "DATE"
 do_install_basefilesissue () {
-	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
+	install -m 644 ${S}/issue*  ${D}${sysconfdir}
         if [ -n "${DISTRO_NAME}" ]; then
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
index 6904a91930f..1f179d85608 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
@@ -14,7 +14,7 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${sysconfdir}
-	install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
+	install -D -m 0644 ${S}/inittab ${D}${sysconfdir}/inittab
 
     CONSOLES="${SERIAL_CONSOLES}"
     for s in $CONSOLES
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 409b1c04033..49c7fd71b1b 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This package provides high level tools to configure network inter
 HOMEPAGE = "http://packages.debian.org/ifupdown"
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
+LIC_FILES_CHKSUM = "file://${S}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 
 inherit update-rc.d
 
@@ -23,9 +23,9 @@ do_install () {
 			${D}${sysconfdir}/network/if-up.d \
 			${D}${sysconfdir}/network/if-down.d \
 			${D}${sysconfdir}/network/if-post-down.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
-	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
-	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
+	install -m 0755 ${S}/init ${D}${sysconfdir}/init.d/networking
+	install -m 0644 ${S}/interfaces ${D}${sysconfdir}/network/interfaces
+	install -m 0755 ${S}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
 }
 
 do_install:append:qemuall () {
diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
index 198459f2b20..01d2771e3fd 100644
--- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "file://init-boot.sh"
 S = "${WORKDIR}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-boot.sh ${D}/init
+        install -m 0755 ${S}/init-boot.sh ${D}/init
 
         # Create device nodes expected by some kernels in initramfs
         # before even executing /init.
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 39ea51ccbd2..4dbb56a42dd 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -26,31 +26,31 @@ do_install() {
     install -d ${D}/init.d
 
     # base
-    install -m 0755 ${WORKDIR}/init ${D}/init
-    install -m 0755 ${WORKDIR}/nfsrootfs ${D}/init.d/85-nfsrootfs
-    install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
-    install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
+    install -m 0755 ${S}/init ${D}/init
+    install -m 0755 ${S}/nfsrootfs ${D}/init.d/85-nfsrootfs
+    install -m 0755 ${S}/rootfs ${D}/init.d/90-rootfs
+    install -m 0755 ${S}/finish ${D}/init.d/99-finish
 
     # exec
-    install -m 0755 ${WORKDIR}/exec ${D}/init.d/89-exec
+    install -m 0755 ${S}/exec ${D}/init.d/89-exec
 
     # mdev
-    install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
+    install -m 0755 ${S}/mdev ${D}/init.d/01-mdev
 
     # udev
-    install -m 0755 ${WORKDIR}/udev ${D}/init.d/01-udev
+    install -m 0755 ${S}/udev ${D}/init.d/01-udev
 
     # e2fs
-    install -m 0755 ${WORKDIR}/e2fs ${D}/init.d/10-e2fs
+    install -m 0755 ${S}/e2fs ${D}/init.d/10-e2fs
 
     # debug
-    install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
+    install -m 0755 ${S}/debug ${D}/init.d/00-debug
 
     # lvm
-    install -m 0755 ${WORKDIR}/lvm ${D}/init.d/09-lvm
+    install -m 0755 ${S}/lvm ${D}/init.d/09-lvm
 
     # overlayroot needs to run after rootfs module but before finish
-    install -m 0755 ${WORKDIR}/overlayroot ${D}/init.d/91-overlayroot
+    install -m 0755 ${S}/overlayroot ${D}/init.d/91-overlayroot
 
     # Create device nodes expected by some kernels in initramfs
     # before even executing /init.
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
index 847dbc0472c..a06e7902eec 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://init-live.sh"
 S = "${WORKDIR}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
+        install -m 0755 ${S}/init-live.sh ${D}/init
         install -d ${D}/dev
         mknod -m 622 ${D}/dev/console c 5 1
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index b3b991b8fd8..e1bf15d2933 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://init-live.sh"
 S = "${WORKDIR}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
+        install -m 0755 ${S}/init-live.sh ${D}/init
         install -d ${D}/dev
         mknod -m 622 ${D}/dev/console c 5 1
 }
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
index 495eccbeda1..1225ce4df9e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools"
 S = "${WORKDIR}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-install-efi-testfs.sh ${D}/install-efi.sh
+        install -m 0755 ${S}/init-install-efi-testfs.sh ${D}/install-efi.sh
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index e10faadfbe8..ae7d5beb2f9 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -10,7 +10,7 @@ RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 S = "${WORKDIR}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-install-efi.sh ${D}/install-efi.sh
+        install -m 0755 ${S}/init-install-efi.sh ${D}/install-efi.sh
 }
 
 # While this package maybe an allarch due to it being a
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
index d347e323b36..018911f5d12 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs"
 S = "${WORKDIR}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-install-testfs.sh ${D}/install.sh
+        install -m 0755 ${S}/init-install-testfs.sh ${D}/install.sh
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 9046d06c02c..12b28203183 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIM
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
+        install -m 0755 ${S}/init-install.sh ${D}/install.sh
 }
 
 # While this package maybe an allarch due to it being a 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index b7499644f0c..adea2330ae5 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}/init.d
-    install -m 0755 ${WORKDIR}/init-install-efi.sh ${D}/init.d/install-efi.sh
+    install -m 0755 ${S}/init-install-efi.sh ${D}/init.d/install-efi.sh
 }
 
 FILES:${PN} = "/init.d/install-efi.sh"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 11db7124af9..e4ae466d7c3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}/init.d
-    install -m 0755 ${WORKDIR}/init-install.sh ${D}/init.d/install.sh
+    install -m 0755 ${S}/init-install.sh ${D}/init.d/install.sh
 }
 
 FILES:${PN} = "/init.d/install.sh"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index 48a779e9aaf..4d2c11f4526 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}/init.d
-    install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
+    install -m 0755 ${S}/setup-live ${D}/init.d/80-setup-live
 }
 
 FILES:${PN} = "/init.d/80-setup-live"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index e61ac554f3b..68eeb5e1171 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -61,9 +61,9 @@ HALTARGS ?= "-d -f"
 VARLIBMOUNTARGS ?= ""
 
 do_configure() {
-	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/halt
-	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/reboot
-	sed -i -e "s:SED_VARLIBMOUNTARGS:${VARLIBMOUNTARGS}:g" ${WORKDIR}/read-only-rootfs-hook.sh
+	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${S}/halt
+	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${S}/reboot
+	sed -i -e "s:SED_VARLIBMOUNTARGS:${VARLIBMOUNTARGS}:g" ${S}/read-only-rootfs-hook.sh
 }
 
 do_install () {
@@ -84,27 +84,27 @@ do_install () {
 	# Holds state information pertaining to urandom
 	install -d ${D}${localstatedir}/lib/urandom
 
-	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/checkroot.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/halt		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/hostname.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/mountall.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/mountnfs.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/reboot		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/rmnologin.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/sendsigs		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/single		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/umountnfs.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/urandom		${D}${sysconfdir}/init.d
+	install -m 0644    ${S}/functions		${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/bootmisc.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/checkroot.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/halt		${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/hostname.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/mountall.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/mountnfs.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/reboot		${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/rmnologin.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/sendsigs		${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/single		${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/umountnfs.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/urandom		${D}${sysconfdir}/init.d
 	sed -i ${D}${sysconfdir}/init.d/urandom -e 's,/var/,${localstatedir}/,g;s,/etc/,${sysconfdir}/,g'
-	install -m 0755    ${WORKDIR}/devpts.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/devpts		${D}${sysconfdir}/default
-	install -m 0755    ${WORKDIR}/sysfs.sh		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
-	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
+	install -m 0755    ${S}/devpts.sh	${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/devpts		${D}${sysconfdir}/default
+	install -m 0755    ${S}/sysfs.sh		${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/populate-volatile.sh ${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
+	install -m 0755    ${S}/save-rtc.sh	${D}${sysconfdir}/init.d
+	install -m 0644    ${S}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
 	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
 		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
@@ -112,22 +112,22 @@ do_install () {
 	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
 		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
 	fi
-	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
-	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
+	install -m 0755    ${S}/dmesg.sh		${D}${sysconfdir}/init.d
+	install -m 0644    ${S}/logrotate-dmesg.conf ${D}${sysconfdir}/
 
 	if [ "${TARGET_ARCH}" = "arm" ]; then
-		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
+		install -m 0755 ${S}/alignment.sh	${D}${sysconfdir}/init.d
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','selinux','true','false',d)}; then
 		install -d ${D}/${base_sbindir}
-		install -m 0755 ${WORKDIR}/sushell ${D}/${base_sbindir}
+		install -m 0755 ${S}/sushell ${D}/${base_sbindir}
 	fi
 #
 # Install device dependent scripts
 #
-	install -m 0755 ${WORKDIR}/banner.sh	${D}${sysconfdir}/init.d/banner.sh
-	install -m 0755 ${WORKDIR}/umountfs	${D}${sysconfdir}/init.d/umountfs
+	install -m 0755 ${S}/banner.sh	${D}${sysconfdir}/init.d/banner.sh
+	install -m 0755 ${S}/umountfs	${D}${sysconfdir}/init.d/umountfs
 #
 # Create runlevel links
 #
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 44a93ac6849..987a8bf89de 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -21,7 +21,7 @@ do_install() {
 		default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
 		install -d ${D}${systemd_system_unitdir}/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
-		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_system_unitdir}/
+		install -m 0644 ${S}/serial-getty@.service ${D}${systemd_system_unitdir}/
 		sed -i -e "s/\@BAUDRATE\@/$default_baudrate/g" ${D}${systemd_system_unitdir}/serial-getty@.service
 		sed -i -e "s/\@TERM\@/${SERIAL_TERM}/g" ${D}${systemd_system_unitdir}/serial-getty@.service
 
@@ -35,7 +35,7 @@ do_install() {
 					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$ttydev.service
 			else
 				# install custom service file for the non-default baudrate
-				install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_system_unitdir}/serial-getty$baudrate@.service
+				install -m 0644 ${S}/serial-getty@.service ${D}${systemd_system_unitdir}/serial-getty$baudrate@.service
 				sed -i -e "s/\@BAUDRATE\@/$baudrate/g" ${D}${systemd_system_unitdir}/serial-getty$baudrate@.service
 				# enable the service
 				ln -sf ${systemd_system_unitdir}/serial-getty$baudrate@.service \
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index 54283bcba13..0036e4dd8be 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -12,5 +12,5 @@ S = "${WORKDIR}"
 
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
+	install -m 0755 ${S}/systemctl ${D}${bindir}
 }
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 6bbe517df1b..17a01e86400 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -16,9 +16,9 @@ do_compile() {
 
 do_install() {
     install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
+    install -m 0644 ${S}/inittab ${D}${sysconfdir}/inittab
     install -d ${D}${base_bindir}
-    install -m 0755 ${WORKDIR}/start_getty ${D}${base_bindir}/start_getty
+    install -m 0755 ${S}/start_getty ${D}${base_bindir}/start_getty
     sed -e 's,/usr/bin,${bindir},g' -i ${D}${base_bindir}/start_getty
 
     CONSOLES="${SERIAL_CONSOLES}"
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 30f1fe76d0d..a3e5d12b818 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -20,21 +20,21 @@ MOUNT_BASE = "/run/media"
 do_install() {
     install -d ${D}${sysconfdir}/udev/rules.d
 
-    install -m 0644 ${WORKDIR}/automount.rules     ${D}${sysconfdir}/udev/rules.d/automount.rules
-    install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
-    install -m 0644 ${WORKDIR}/localextra.rules    ${D}${sysconfdir}/udev/rules.d/localextra.rules
+    install -m 0644 ${S}/automount.rules     ${D}${sysconfdir}/udev/rules.d/automount.rules
+    install -m 0644 ${S}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
+    install -m 0644 ${S}/localextra.rules    ${D}${sysconfdir}/udev/rules.d/localextra.rules
 
     install -d ${D}${sysconfdir}/udev/mount.ignorelist.d
-    install -m 0644 ${WORKDIR}/mount.ignorelist     ${D}${sysconfdir}/udev/
+    install -m 0644 ${S}/mount.ignorelist     ${D}${sysconfdir}/udev/
 
     install -d ${D}${sysconfdir}/udev/scripts/
 
-    install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
+    install -m 0755 ${S}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
     sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
     sed -i 's|@MOUNT_BASE@|${MOUNT_BASE}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
 
-    install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
+    install -m 0755 ${S}/network.sh ${D}${sysconfdir}/udev/scripts
 }
 
 pkg_postinst:${PN} () {
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index e4b4201b1f9..bbd574e2872 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://docbook.org"
 # upgrading this recipe, please verify whether this is still needed.
 
 LICENSE = "OASIS"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
 
 # To support apps with xml schema backward compatibility, we must
 # install a set of schemas. Install the latest based on PV and then
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index 1826c7a40ee..56a9321fb91 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -30,7 +30,7 @@ S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}/${bindir}
-    install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
+    install -m 0755 ${S}/icecc-create-env ${D}/${bindir}
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 5d407842014..997f72e6e77 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -28,6 +28,6 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}${COREBASE}/scripts/oe-* ${D}${bindir}/
-	install -m 0755 ${WORKDIR}${COREBASE}/scripts/runqemu* ${D}${bindir}/
+	install -m 0755 ${S}${COREBASE}/scripts/oe-* ${D}${bindir}/
+	install -m 0755 ${S}${COREBASE}/scripts/runqemu* ${D}${bindir}/
 }
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 1dfce0e4c7b..8bb6ef0995b 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Helper utilities needed by the runqemu script"
 LICENSE = "GPL-2.0-only"
 RDEPENDS:${PN} = "qemu-system-native"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/qemu-oe-bridge-helper.c;endline=4;md5=ae00a3bab86f2caaa8462eacda77f4d7"
+LIC_FILES_CHKSUM = "file://${S}/qemu-oe-bridge-helper.c;endline=4;md5=ae00a3bab86f2caaa8462eacda77f4d7"
 
 SRC_URI = "file://qemu-oe-bridge-helper.c"
 
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index e977942de87..e3d63df852d 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -29,13 +29,13 @@ do_compile () {
 
 do_install() {
 	install -d ${D}${sbindir}
-	install -m 0755 ${WORKDIR}/run-postinsts ${D}${sbindir}/
+	install -m 0755 ${S}/run-postinsts ${D}${sbindir}/
 
 	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${WORKDIR}/run-postinsts.init ${D}${sysconfdir}/init.d/run-postinsts
+	install -m 0755 ${S}/run-postinsts.init ${D}${sysconfdir}/init.d/run-postinsts
 
 	install -d ${D}${systemd_system_unitdir}/
-	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${S}/run-postinsts.service ${D}${systemd_system_unitdir}/
 
 	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' \
                -e 's:#SBINDIR#:${sbindir}:g' \
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bfef6d1759..f59fee7cddc 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -46,7 +46,7 @@ do_install () {
     # where the context is easier to do the env maniupations needed
     install -d ${SYS_BINDIR}
     outfile="${SYS_BINDIR}/target-rust-ccld"
-    ${CC} ${WORKDIR}/target-rust-ccld.c -o $outfile
+    ${CC} ${S}/target-rust-ccld.c -o $outfile
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
index fe51ea18744..85c04b6af11 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
@@ -17,7 +17,7 @@ do_install () {
 	# Ensure we add a suitable securetty file to the package that has
 	# most common embedded TTYs defined.
 	install -d ${D}${sysconfdir}
-	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
+	install -m 0400 ${S}/securetty ${D}${sysconfdir}/securetty
 	if [ ! -z "${SERIAL_CONSOLES}" ]; then
 		# Our SERIAL_CONSOLES contains a baud rate and sometimes extra
 		# options as well. The following pearl :) takes that and converts
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 024e400665e..ca3d1478dc8 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -29,18 +29,18 @@ DEFAULTBACKEND:qemuall ?= "drm"
 do_install() {
 	# Install weston-start script
 	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
-		install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
+		install -Dm755 ${S}/weston-start ${D}${bindir}/weston-start
 		sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
 		sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
-		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+		install -Dm755 ${S}/init ${D}/${sysconfdir}/init.d/weston
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
 	fi
 
 	# Install Weston systemd service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
-		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
-		install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
+		install -D -p -m0644 ${S}/weston.service ${D}${systemd_system_unitdir}/weston.service
+		install -D -p -m0644 ${S}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+		install -D -p -m0644 ${S}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
 		sed -i -e s:/etc:${sysconfdir}:g \
 			-e s:/usr/bin:${bindir}:g \
 			-e s:/var:${localstatedir}:g \
@@ -48,11 +48,11 @@ do_install() {
 	fi
 
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
+		install -D -p -m0644 ${S}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
 	fi
 
-	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
-	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
+	install -D -p -m0644 ${S}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+	install -Dm644 ${S}/weston.env ${D}${sysconfdir}/default/weston
 
 	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 671c0a290e8..4e38b4da343 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -52,7 +52,7 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/xserver-nodm.service.in ${D}${systemd_system_unitdir}/xserver-nodm.service
+        install -m 0644 ${S}/xserver-nodm.service.in ${D}${systemd_system_unitdir}/xserver-nodm.service
         sed -i "s:@USER@:${XUSER}:" ${D}${systemd_system_unitdir}/xserver-nodm.service
     fi
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 03f14cef2bd..a3a47337850 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -14,8 +14,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 ALLOW_EMPTY:${PN} = "1"
 
 do_install () {
-	if test -s ${WORKDIR}/xorg.conf; then
+	if test -s ${S}/xorg.conf; then
 		install -d ${D}/${sysconfdir}/X11
-		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+		install -m 0644 ${S}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
 }
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index b630a402ff5..0a057704080 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -17,7 +17,7 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${WORKDIR}/modutils.sh ${D}${sysconfdir}/init.d/
+	install -m 0755 ${S}/modutils.sh ${D}${sysconfdir}/init.d/
 }
 
 PACKAGE_WRITE_DEPS:append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
-- 
2.40.1


