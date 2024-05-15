Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D86C41513
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.12948.1715774185794769555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Di7NUPZT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-420157ee56cso25102075e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774184; x=1716378984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=we27HosSCXwEhg/ZxnaN5Svs7jxsAzde+yIZJjmwEpo=;
        b=Di7NUPZTk7rR3eX4nWuzGqmoiLGU7lP7atce+fCuCY9dTElPoIAGwWuBoRJL70CyWf
         RpYryJujhErMrNDnPxcIxPun3C/UtbTVOtMNsCqrmQ9M+d97ESGe1mQ2swbG4PmjGj1K
         WM0MTNGKBekhZjeW0M9fsxVaB3q/0eeX+UEVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774184; x=1716378984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=we27HosSCXwEhg/ZxnaN5Svs7jxsAzde+yIZJjmwEpo=;
        b=tXsNRH7UusbYsXUUpyBW4H0jdj6+lot7n2Y6vuvyxWdPg2KtMiechv9eHNRMqmp5RB
         KSO9a+SaX//pcvdivLXwQmV9Ul5UB16gFqbeNlGW43ReeA1objXbBYJ8S2R1f8hgJXSu
         MzpDMDb7Jy3JOOjo3SrmR8rja/x4HGfppc0bHg1M0cF0ykuoKq8ORmB3KaXFGWuEfrR7
         hCQH9EYHwZLvpqY6IoCdLZsiAcajIUQHfwzOOObyDfgn5s+U92dJFGJz5bhxsCKFvmvM
         NhRqSAGFCo5PR3z2hwMAcvyPu+as+atxOX3F/kKTMitqe+P4beuS/d7covOouQx0rdV5
         BYKA==
X-Gm-Message-State: AOJu0Yy++orn5waLvFOz9UlExY+rhDZPXMY1uuu8AZUeUhimXMPRrMK5
	Xkr/FVXPQusonTG9UgK1p0+cd4zGooYEcFerQ6rgrwmVVd+FgBQLrusH6+TzyW2wAWBrKDbDjel
	ls6A=
X-Google-Smtp-Source: AGHT+IHUVZBVfylUTatpPYqwDihNTUM0rY+IcEkA0JIgE6gTlrGWBCQJcvSZKdVqBAYRdtRhRsUY2w==
X-Received: by 2002:a05:600c:444e:b0:418:9d5a:f680 with SMTP id 5b1f17b1804b1-41feac56006mr115032015e9.25.1715774183198;
        Wed, 15 May 2024 04:56:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] recipes: Switch away from S = WORKDIR
Date: Wed, 15 May 2024 12:56:12 +0100
Message-Id: <20240515115620.420558-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199278

Where recipes use S = ${WORKDIR}, change them to set UNPACKDIR to
a subdir of WORKDIR and make S point at this instead.

I've chosen not to force S into any standard UNPACKDIR we may pick in
future just so the S = UNPACKDIR case is clearly visible by the
directory naming under WORKDIR as that should aid usability.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/cpp/cpp-example.inc           | 3 ++-
 .../recipes-test/selftest-chown/selftest-chown.bb        | 3 ++-
 .../recipes-test/selftest-hardlink/selftest-hardlink.bb  | 3 ++-
 .../recipes-test/selftest-hello/selftest-hello_1.0.bb    | 5 +++--
 .../recipes-test/selftest-users/acreategroup.bb          | 3 ++-
 .../recipes-test/selftest-users/bcreategroup.bb          | 3 ++-
 .../recipes-test/selftest-users/ccreategroup.bb          | 3 ++-
 .../recipes-test/selftest-users/creategroup1.bb          | 3 ++-
 .../recipes-test/selftest-users/creategroup2.bb          | 3 ++-
 .../recipes-test/selftest-users/dcreategroup.bb          | 3 ++-
 .../recipes-test/selftest-users/useraddbadtask.bb        | 3 ++-
 meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb  | 3 ++-
 meta-skeleton/recipes-skeleton/service/service_0.1.bb    | 9 +++++----
 meta/recipes-bsp/alsa-state/alsa-state.bb                | 3 ++-
 meta/recipes-bsp/formfactor/formfactor_0.0.bb            | 4 +++-
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb              | 3 ++-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb                  | 3 ++-
 meta/recipes-bsp/usbinit/usbinit.bb                      | 4 +++-
 meta/recipes-connectivity/connman/connman-conf.bb        | 3 ++-
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb   | 3 ++-
 meta/recipes-core/base-files/base-files_3.0.14.bb        | 3 ++-
 meta/recipes-core/busybox/busybox-inittab_1.36.1.bb      | 3 ++-
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb     | 3 ++-
 meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb    | 4 ++--
 .../initrdscripts/initramfs-framework_1.0.bb             | 3 ++-
 .../initrdscripts/initramfs-live-boot-tiny_1.0.bb        | 4 ++--
 .../initrdscripts/initramfs-live-boot_1.0.bb             | 4 ++--
 .../initramfs-live-install-efi-testfs_1.0.bb             | 3 ++-
 .../initrdscripts/initramfs-live-install-efi_1.0.bb      | 4 ++--
 .../initrdscripts/initramfs-live-install-testfs_1.0.bb   | 3 ++-
 .../initrdscripts/initramfs-live-install_1.0.bb          | 4 ++--
 .../initrdscripts/initramfs-module-install-efi_1.0.bb    | 3 ++-
 .../initrdscripts/initramfs-module-install_1.0.bb        | 3 ++-
 .../initrdscripts/initramfs-module-setup-live_1.0.bb     | 3 ++-
 meta/recipes-core/initscripts/initscripts_1.0.bb         | 3 ++-
 meta/recipes-core/musl/bsd-headers.bb                    | 3 ++-
 meta/recipes-core/musl/libssp-nonshared.bb               | 3 ++-
 meta/recipes-core/musl/musl-legacy-error.bb              | 3 ++-
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb       | 3 ++-
 meta/recipes-core/systemd/systemd-compat-units.bb        | 3 ++-
 meta/recipes-core/systemd/systemd-serialgetty.bb         | 3 ++-
 meta/recipes-core/systemd/systemd-systemctl-native.bb    | 3 ++-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb   | 3 ++-
 meta/recipes-core/udev/udev-extraconf_1.1.bb             | 3 ++-
 meta/recipes-core/volatile-binds/volatile-binds.bb       | 5 ++---
 meta/recipes-devtools/devel-config/distcc-config.bb      | 3 ++-
 meta/recipes-devtools/devel-config/nfs-export-root.bb    | 4 ++--
 .../recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb | 3 ++-
 .../icecc-create-env/icecc-create-env_0.1.bb             | 3 ++-
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb         | 3 ++-
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb       | 3 ++-
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb  | 3 ++-
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb     | 3 ++-
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb      | 3 ++-
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb | 3 ++-
 meta/recipes-devtools/rust/rust-cross-canadian.inc       | 3 ++-
 meta/recipes-extended/shadow/shadow-securetty_4.6.bb     | 3 ++-
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb       | 3 ++-
 .../texinfo-dummy-native/texinfo-dummy-native.bb         | 3 ++-
 meta/recipes-graphics/builder/builder_0.1.bb             | 3 ++-
 .../matchbox-session/matchbox-session_0.1.bb             | 4 +++-
 .../mini-x-session/mini-x-session_0.1.bb                 | 4 +++-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb       | 3 ++-
 meta/recipes-graphics/wayland/weston-init.bb             | 3 ++-
 .../recipes-graphics/x11-common/xserver-nodm-init_3.0.bb | 3 ++-
 .../xinput-calibrator/pointercal-xinput_0.0.bb           | 4 +++-
 .../xorg-xserver/xserver-xf86-config_0.1.bb              | 3 ++-
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb      | 3 ++-
 meta/recipes-kernel/linux/linux-dummy.bb                 | 4 +++-
 .../make-mod-scripts/make-mod-scripts_1.0.bb             | 3 ++-
 .../modutils-initscripts/modutils-initscripts.bb         | 4 ++--
 .../matchbox-sato/matchbox-session-sato_0.1.bb           | 4 +++-
 .../pulseaudio-sato/pulseaudio-client-conf-sato_1.bb     | 4 +++-
 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb   | 3 ++-
 74 files changed, 160 insertions(+), 87 deletions(-)

diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index ad374be9d08..41aaa7219a1 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -19,6 +19,7 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit ptest
diff --git a/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
index aa6ce0c2a02..a0eeb4f2231 100644
--- a/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
+++ b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 
 DEPENDS += "coreutils-native"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index 49c3fe827a5..5632bdac7a7 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -6,7 +6,8 @@ SRC_URI = "file://hello.c \
            file://gdb.sh \
 "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile () {
 	${CC} hello.c -o hello1 ${CFLAGS} ${LDFLAGS}
diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
index 547587bef4a..2dc352d479e 100644
--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://helloworld.c"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
@@ -16,4 +17,4 @@ do_install() {
 	install -m 0755 helloworld ${D}${bindir}
 }
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-selftest/recipes-test/selftest-users/acreategroup.bb b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
index 66ed5695a26..7805182d482 100644
--- a/meta-selftest/recipes-test/selftest-users/acreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
@@ -3,7 +3,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 EXCLUDE_FROM_WORLD="1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/bcreategroup.bb b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
index c4844dd0da0..b15c07d7b25 100644
--- a/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
@@ -7,7 +7,8 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "acreategroup ccreategroup"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 EXCLUDE_FROM_WORLD="1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/ccreategroup.bb b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
index 021b1ebbf77..ff2da1c0394 100644
--- a/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "acreategroup"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 EXCLUDE_FROM_WORLD="1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
index afd23ed1eea..4ab278f5895 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup1.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
@@ -3,7 +3,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
index f776f43aedf..179aba9bfcc 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup2.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "creategroup1"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-users/dcreategroup.bb b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
index b96ca92a160..ab0a5296692 100644
--- a/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "bcreategroup"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 EXCLUDE_FROM_WORLD="1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
index 99e04a80b34..2863541010c 100644
--- a/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
+++ b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 
 DEPENDS:append = "coreutils-native"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit useradd allarch
 
diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index a2fb212a688..79f2e8a0923 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -10,7 +10,8 @@ SRC_URI = "file://Makefile \
            file://COPYING \
           "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # The inherit of module.bbclass will automatically name module packages with
 # "kernel-module-" prefix as required by the oe-core build environment.
diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index 912f6b0f611..d958bac9547 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -2,14 +2,15 @@ SUMMARY = "The canonical example of init scripts"
 SECTION = "base"
 DESCRIPTION = "This recipe is a canonical example of init scripts"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
 
 SRC_URI = "file://skeleton \
 	   file://skeleton_test.c \
 	   file://COPYRIGHT \
 	   "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
@@ -17,7 +18,7 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${sysconfdir}/init.d
-	cat ${WORKDIR}/skeleton | \
+	cat ${S}/skeleton | \
 	  sed -e 's,/etc,${sysconfdir},g' \
 	      -e 's,/usr/sbin,${sbindir},g' \
 	      -e 's,/var,${localstatedir},g' \
@@ -26,7 +27,7 @@ do_install () {
 	chmod a+x ${D}${sysconfdir}/init.d/skeleton
 
 	install -d ${D}${sbindir}
-	install -m 0755 ${WORKDIR}/skeleton-test ${D}${sbindir}/
+	install -m 0755 ${S}/skeleton-test ${D}${sbindir}/
 }
 
 RDEPENDS:${PN} = "initscripts"
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 83384f2daf5..099fbd3b9d8 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -21,7 +21,8 @@ SRC_URI = "\
   file://alsa-state-init \
 "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # As the recipe doesn't inherit systemd.bbclass, we need to set this variable
 # manually to avoid unnecessary postinst/preinst generated.
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 1eaf30746b0..4714bb2e5e2 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -7,7 +7,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://config file://machconfig"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 783e30bf387..fed3c7e9a3c 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -11,7 +11,8 @@ inherit grub-efi-cfg
 
 require conf/image-uefi.conf
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 GRUB_CFG = "${S}/grub-bootconf"
 LABELS = "boot"
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index e30dd9dca26..0425197c981 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -24,7 +24,8 @@ SRC_URI = "file://keymap.sh"
 INITSCRIPT_NAME = "keymap.sh"
 INITSCRIPT_PARAMS = "start 01 S ."
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install () {
     # Only install the script if 'sysvinit' is in DISTRO_FEATURES
diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index b80191bddc4..091aa73bb52 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://${S}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe
 
 SRC_URI = "file://usb-gether \
            file://COPYING.GPL"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}${sysconfdir}
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index a1a0e08faae..73c54cddae8 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
 SRC_URI = "file://main.conf \
           "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 0c3085d3a8c..0ee47d47c2b 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -11,7 +11,8 @@ SRC_URI = "file://host-peer \
 
 inherit allarch useradd
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -d ${D}${sysconfdir}/ppp/peers
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 42a8026e639..1b6e9671e45 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -25,7 +25,8 @@ SRC_URI = "file://rotation \
            "
 SRC_URI:append:libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd systemd-resolved', ' file://0001-add-nss-resolve-to-nsswitch.patch', '', d)}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
index 1f179d85608..4ffc44c808a 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
 
 SRC_URI = "file://inittab"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 49c7fd71b1b..ddf9d1b3112 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -15,7 +15,8 @@ SRC_URI = "file://copyright \
            file://interfaces \
            file://nfsroot"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install () {
 	install -d ${D}${sysconfdir}/init.d \
diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
index 01d2771e3fd..ec3544c67a9 100644
--- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-boot.sh"
 
-
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
         install -m 0755 ${S}/init-boot.sh ${D}/init
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 4dbb56a42dd..bb4984366d1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -20,7 +20,8 @@ SRC_URI = "file://init \
            file://overlayroot \
           "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
index a06e7902eec..40046f30a76 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
@@ -5,8 +5,8 @@ DEPENDS = "virtual/kernel"
 RDEPENDS:${PN} = "busybox-mdev"
 SRC_URI = "file://init-live.sh"
 
-
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
         install -m 0755 ${S}/init-live.sh ${D}/init
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index e1bf15d2933..7851cc9605a 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,8 +5,8 @@ DEPENDS = "virtual/kernel"
 RDEPENDS:${PN} = "udev udev-extraconf"
 SRC_URI = "file://init-live.sh"
 
-
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
         install -m 0755 ${S}/init-live.sh ${D}/init
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
index 1225ce4df9e..31291bcdf2c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
@@ -5,7 +5,8 @@ SRC_URI = "file://init-install-efi-testfs.sh"
 
 RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
         install -m 0755 ${S}/init-install-efi-testfs.sh ${D}/install-efi.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index ae7d5beb2f9..ff3b5622db7 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -3,11 +3,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install-efi.sh"
 
-
 RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
         install -m 0755 ${S}/init-install-efi.sh ${D}/install-efi.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
index 018911f5d12..19f05f9fecd 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
@@ -5,7 +5,8 @@ SRC_URI = "file://init-install-testfs.sh"
 
 RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
         install -m 0755 ${S}/init-install-testfs.sh ${D}/install.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 12b28203183..1d489e2b649 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index adea2330ae5..bb3f275f266 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -7,7 +7,8 @@ RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 SRC_URI = "file://init-install-efi.sh"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index e4ae466d7c3..b87e59f3475 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -12,7 +12,8 @@ COMPATIBLE_HOST:armv7ve = 'null'
 
 SRC_URI = "file://init-install.sh"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index 4d2c11f4526..4d9ef79a634 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -9,7 +9,8 @@ inherit allarch
 FILESEXTRAPATHS:prepend := "${THISDIR}/initramfs-framework:"
 SRC_URI = "file://setup-live"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 68eeb5e1171..65f97a0af29 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -35,7 +35,8 @@ SRC_URI = "file://functions \
            ${@bb.utils.contains('DISTRO_FEATURES','selinux','file://sushell','',d)} \
 "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 SRC_URI:append:arm = " file://alignment.sh"
 SRC_URI:append:armeb = " file://alignment.sh"
diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/musl/bsd-headers.bb
index 887a8160313..7d0bdee8704 100644
--- a/meta/recipes-core/musl/bsd-headers.bb
+++ b/meta/recipes-core/musl/bsd-headers.bb
@@ -15,7 +15,8 @@ do_compile[noexec] = "1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -Dm 0644 ${S}/sys-queue.h ${D}${includedir}/sys/queue.h
diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
index 3faf8f00c3c..e9f652fc3ea 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -17,7 +17,8 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
 
 do_configure[noexec] = "1"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile() {
 	${CC} ${CPPFLAGS} ${CFLAGS} -fPIE -c stack_chk.c -o stack_chk.o
diff --git a/meta/recipes-core/musl/musl-legacy-error.bb b/meta/recipes-core/musl/musl-legacy-error.bb
index 5ce5a233ab1..11a838a6e8a 100644
--- a/meta/recipes-core/musl/musl-legacy-error.bb
+++ b/meta/recipes-core/musl/musl-legacy-error.bb
@@ -13,7 +13,8 @@ do_compile[noexec] = "1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -Dm 0644 ${S}/error.h -t ${D}${includedir}
diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
index 19637546a99..0ec49365d02 100644
--- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -7,7 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit systemd-boot-cfg
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 LABELS = "boot"
 
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index c03d97f9c93..b9295458237 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 
 PACKAGE_WRITE_DEPS += "systemd-systemctl-native"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit features_check
 
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 987a8bf89de..9035b8c335a 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -9,7 +9,8 @@ SERIAL_TERM ?= "linux"
 
 SRC_URI = "file://serial-getty@.service"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
 inherit features_check
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index 0036e4dd8be..ffa024caef3 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -8,7 +8,8 @@ inherit native
 
 SRC_URI = "file://systemctl"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -d ${D}${bindir}
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 17a01e86400..6ff2ca1bf43 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
 SRC_URI = "file://inittab \
            file://start_getty"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index a3e5d12b818..0e2abcd4243 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -13,7 +13,8 @@ SRC_URI = " \
        file://localextra.rules \
 "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 MOUNT_BASE = "/run/media"
 
diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index cca8a65fb48..3597ec73561 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -9,7 +9,8 @@ SRC_URI = "\
     file://volatile-binds.service.in \
 "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit allarch systemd features_check
 
@@ -64,7 +65,6 @@ END
                "$var_lib_servicefile"
     fi
 }
-do_compile[dirs] = "${WORKDIR}"
 
 do_install () {
     install -d ${D}${base_sbindir}
@@ -82,4 +82,3 @@ do_install () {
     ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/etc.conf
     ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/home.conf
 }
-do_install[dirs] = "${WORKDIR}"
diff --git a/meta/recipes-devtools/devel-config/distcc-config.bb b/meta/recipes-devtools/devel-config/distcc-config.bb
index 698fd3585af..2c30488b820 100644
--- a/meta/recipes-devtools/devel-config/distcc-config.bb
+++ b/meta/recipes-devtools/devel-config/distcc-config.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://distcc.sh"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # Default to the host machine for a running qemu session
 DISTCC_HOSTS ?= "192.168.7.1"
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
index 5e69962d7c7..ad5486aa87f 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "Enables NFS access from any host to the entire filesystem (for de
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-
 SRC_URI = "file://exports"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -d ${D}${sysconfdir}
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index bbd574e2872..5229a0366c2 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -41,7 +41,8 @@ SRC_URI[payloadPV.sha256sum] = "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd791
 
 UPSTREAM_CHECK_REGEX = "docbook-xml-(?P<pver>4(\.\d+)).zip"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_configure (){
     :
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index 56a9321fb91..dd1b257b10a 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -26,7 +26,8 @@ ICECC_DISABLED = "1"
 PATCHTOOL = "patch"
 SRC_URI = "file://icecc-create-env"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}/${bindir}
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 0d6c7a01ebf..7b11093364a 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://makedevs.c;beginline=2;endline=2;md5=c3817b10013a3007
 SECTION = "base"
 SRC_URI = "file://makedevs.c"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 FILES:${PN}:append:class-nativesdk = " ${datadir}"
 
diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index 726a259a8c4..4db35c1092e 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://git.yoctoproject.org/opkg/"
 LICENSE = "MIT"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile() {
 	mkdir -p ${S}/${sysconfdir}/opkg/
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 997f72e6e77..90bba84b03c 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -18,7 +18,8 @@ SRC_URI = "file://${COREBASE}/scripts/runqemu \
            file://${COREBASE}/scripts/runqemu-export-rootfs \
           "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit nativesdk
 
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 8bb6ef0995b..28a3b95c4ea 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://${S}/qemu-oe-bridge-helper.c;endline=4;md5=ae00a3bab8
 
 SRC_URI = "file://qemu-oe-bridge-helper.c"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit native
 
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 97b44ad2e57..6d0e7883ad9 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -2,7 +2,8 @@ SUMMARY = "QEMU wrapper script"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "MIT"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 DEPENDS += "qemu-native"
 
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index e3d63df852d..f571e619218 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -8,7 +8,8 @@ SRC_URI = "file://run-postinsts \
            file://run-postinsts.init \
            file://run-postinsts.service"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit allarch systemd update-rc.d
 
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index f59fee7cddc..f962437d6b4 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -12,7 +12,8 @@ DEPENDS += "virtual/${SDK_PREFIX}gcc virtual/nativesdk-libc virtual/nativesdk-${
 
 SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
index 85c04b6af11..913c159c818 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
@@ -8,7 +8,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://securetty"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # Since SERIAL_CONSOLES is likely to be set from the machine configuration
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index 00ab58b38cf..13cfab6aabb 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -13,7 +13,8 @@ DEPENDS = "base-passwd"
 # can add custom users/groups for recipes that use inherit useradd.
 SRC_URI = "file://login.defs_shadow-sysroot"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -d ${D}${sysconfdir}
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
index a942ac2991e..51d9c927661 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
@@ -8,7 +8,8 @@ PV = "1.0"
 
 SRC_URI = "file://template.py file://COPYING"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit native
 
diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 52c9351f93f..7719b783c26 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://builder_session.sh;endline=5;md5=84796c3c41785d86100f
 SRC_URI = "file://builder_session.sh \
           "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 RDEPENDS:${PN} = "mini-x-session"
 
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index d1f0a67d841..8a4cfef6315 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -10,7 +10,9 @@ SECTION = "x11"
 RCONFLICTS:${PN} = "matchbox-common"
 
 SRC_URI = "file://matchbox-session"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 
 inherit update-alternatives
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index ba81d0b17ab..48d50c8f66d 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -11,7 +11,9 @@ SECTION = "x11"
 RCONFLICTS:${PN} = "matchbox-common"
 
 SRC_URI = "file://mini-x-session"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 RDEPENDS:${PN} = "sudo"
 
diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index d0794f8ee62..ee5173dc83d 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -10,7 +10,8 @@ SRC_URI = "file://pong-clock-no-flicker.c"
 
 LIC_FILES_CHKSUM = "file://pong-clock-no-flicker.c;beginline=1;endline=23;md5=dd248d50f73f746d1ee78586b0b2ebd3"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} -o pong-clock pong-clock-no-flicker.c `pkg-config --cflags --libs x11 xau xdmcp`
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index ca3d1478dc8..83f0cea49cb 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -13,7 +13,8 @@ SRC_URI = "file://init \
            file://weston-autologin \
            file://weston-start"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
 PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 4e38b4da343..cd4acf81551 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -12,7 +12,8 @@ SRC_URI = "file://xserver-nodm \
            file://capability.conf \
 "
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 # Since we refer to ROOTLESS_X which is normally enabled per-machine
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 5c9742fb205..f4516e69750 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 
 SRC_URI = "file://pointercal.xinput"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
     # Only install file if it has a contents
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index a3a47337850..0972a5dd784 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://xorg.conf"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
 
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 6c0739d64fc..29f34d7f36b 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -1,7 +1,8 @@
 SUMMARY = "Wrapper script for the Linux kernel module dependency indexer"
 LICENSE = "MIT"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 # The kernel and the staging dir for it is machine specific
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 2396f46202b..3e9a563cad8 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -30,7 +30,9 @@ COMPATIBLE_HOST = ".*-linux"
 
 
 SRC_URI = "file://COPYING.GPL"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_configure() {
 	:
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index a91680d4977..581e90e9b47 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -8,7 +8,8 @@ inherit pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 0a057704080..49268445a88 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://modutils.sh;beginline=3;endline=3;md5=b2dccaa94b3629a08bfb4f983cad6f89"
 SRC_URI = "file://modutils.sh"
 
-
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 INITSCRIPT_NAME = "modutils.sh"
 INITSCRIPT_PARAMS = "start 06 S ."
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 90734b6bd09..bb7ddbc7f42 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -19,7 +19,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "file://session \
            file://index.theme"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 FILES:${PN} += "${datadir}/themes/Sato/index.theme"
 
diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
index ec187ed9bd4..20368703c4d 100644
--- a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
@@ -4,7 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "file://50-sato.conf"
-S = "${WORKDIR}"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 inherit allarch
 
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index 766f574b259..8c6c0edf107 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 SRC_URI = "file://shutdown.desktop"
 
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_install() {
 	install -d ${D}${datadir}/applications
-- 
2.40.1


