Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274ADC73C66
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.26736.1750067410163489194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iFR2pQl1;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so36686895e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067408; x=1750672208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OkTH6xR8korUVn3BDc1AjA3uj3Q/1pyUdNaqhu/92A=;
        b=iFR2pQl1mWdZXVzjZ6jPpED5bx8gBAFuaIaF4Jmcy2OyTrpX5OLpOZBemS5E859Lkl
         srnKXlOBzB4mIRO2Z76Qq8NAMq5PbkoKm1x+Rhmlx62NiLEacIEHMEKlqUVQyt672WMO
         GGReZa2U2HReFFytEpgDs1ntXFJuUpRpOI+5lHgK6YS3Aw/n2UWQOnDoiu9HSn+LGRs7
         kA9D3yO1KsG/ztnZ8pQTkQQStDlCLFxU3r+0qx88rRQgPYUn4Sl0jI+1K+78TL5PZ9MR
         36UV7Y+ph/ZCdYW/ZhTIE4IrnRJUsUOfTGJBhSQ2fyjfv1D1HkzMACiZ2Zm74USrDcNT
         ylAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067408; x=1750672208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OkTH6xR8korUVn3BDc1AjA3uj3Q/1pyUdNaqhu/92A=;
        b=MR4hJqeJcj54U3Aq613tlJ0FXsZj32Hc5CjB+cN+xWppCG+BpaDZh8qmvL8R5oNHud
         w1l0f2xuzM2UeRBa6WzyQOqlrjAeGr93eMWJG6KnXaPWNqUHSDNkq38ixO4ekixqJ/Fv
         O1841y1T8ZGaO+/SRO68uK8mioG9iojnANkv4egIvMlIoMYRheue743A9Re5frK8hict
         Gp7MJK0wMqa/2VOrTdPjfA1M/gMNy+hKKKtQa1ih65ol6+2IiKTcKWIFLDa7m0QSbipn
         A5FjRwi9YAR5DPCyvb+Zuu/RZNMAA5qFtYw4gn/KWE4ON/MlPj4a2/Mw5NLHOvWGuYwn
         Bdow==
X-Gm-Message-State: AOJu0Yy7LUFA56zFiEl3EL5YKnQ62G/mJBzCZtLez0C0EW2sliXueAg5
	9g+0mGhgmSbcKBxoy7mC4wuv2Gg8lBCJMAWnej2bvmvIS1JXVwiDwtFUssDyaA==
X-Gm-Gg: ASbGncvt9iB0uYdFDpBoEQmpQc1s8pLqR4p1TQRPqyn1zfn+jTw6naKT+85jrwYXh5z
	viz1b92i489Wei47thAH2Npq1p9MyhE19WyPfc96YcUCzlQHRsd5jBlfcnjRftM4Fj0k5/6LLdY
	U97S+86Guz/3DkHj+qbKbIp46B8HtBXVx9xKldRhJEyc/lsIndi5S1uP+BwBjtuUzK3Wgi9c1BK
	DuFAqI4v/2b/51VQBDXlGxkeG2u5VSd59eIupEzMKo+2ks3ghowIFxZJk/WeanNfGynIL16vzua
	xm0e2ln8Ddgv9RHzzaOCyjBrk1LE8+Ic6W83FTK/M/Htj8Aw9AmjKOlGHDqlqtnQdDNyJEZbJOp
	kcQ9h9jr6ux0eQn7hLQRBz/o=
X-Google-Smtp-Source: AGHT+IGFG/qtcYhkA9Gq0cwx57VxvMuA0NOinkY2PHWh9SpvHwc9Uxz/i7N2hnylD00OSRk36fDnCA==
X-Received: by 2002:a05:600c:6211:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-4533c83f4afmr71265965e9.0.1750067407882;
        Mon, 16 Jun 2025 02:50:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/10] meta: set S from UNPACKDIR in recipes that use only local files
Date: Mon, 16 Jun 2025 11:49:56 +0200
Message-Id: <20250616095000.2918921-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218804

From: Alexander Kanavin <alex@linutronix.de>

There is no need to have two assignments; also setting S from
UNPACKDIR (and not vice versa) is more logical as unpack
task comes first, and tasks that come after unpack use S to access
unpack results.

Also adjust reference test data in selftest/recipeutils to reflect changes in test recipes.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-selftest/recipes-test/cpp/cpp-example.inc                | 3 +--
 meta-selftest/recipes-test/devtool/devtool-test-localonly.bb  | 3 +--
 meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb | 3 +--
 meta-selftest/recipes-test/fortran/fortran-helloworld.bb      | 3 +--
 .../recipes-test/recipeutils/recipeutils-test_1.2.bb          | 3 +--
 meta-selftest/recipes-test/selftest-chown/selftest-chown.bb   | 3 +--
 .../recipes-test/selftest-hardlink/selftest-hardlink.bb       | 3 +--
 .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 3 +--
 meta-selftest/recipes-test/selftest-users/acreategroup.bb     | 3 +--
 meta-selftest/recipes-test/selftest-users/bcreategroup.bb     | 3 +--
 meta-selftest/recipes-test/selftest-users/ccreategroup.bb     | 3 +--
 meta-selftest/recipes-test/selftest-users/creategroup1.bb     | 3 +--
 meta-selftest/recipes-test/selftest-users/creategroup2.bb     | 3 +--
 meta-selftest/recipes-test/selftest-users/dcreategroup.bb     | 3 +--
 meta-selftest/recipes-test/selftest-users/useraddbadtask.bb   | 3 +--
 meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb           | 3 +--
 meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb       | 3 +--
 meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb      | 3 +--
 meta-skeleton/recipes-skeleton/service/service_0.1.bb         | 3 +--
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb     | 3 +--
 meta/classes-recipe/devicetree.bbclass                        | 3 +--
 meta/classes-recipe/kernel-fit-image.bbclass                  | 3 +--
 meta/lib/oeqa/selftest/cases/recipeutils.py                   | 4 ++--
 meta/recipes-bsp/alsa-state/alsa-state.bb                     | 3 +--
 meta/recipes-bsp/formfactor/formfactor_0.0.bb                 | 3 +--
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb                   | 3 +--
 meta/recipes-bsp/keymaps/keymaps_1.0.bb                       | 3 +--
 meta/recipes-connectivity/connman/connman-conf.bb             | 3 +--
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb        | 3 +--
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb            | 3 +--
 meta/recipes-core/base-files/base-files_3.0.14.bb             | 3 +--
 meta/recipes-core/busybox/busybox-inittab_1.37.0.bb           | 3 +--
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb          | 3 +--
 meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb         | 3 +--
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb    | 3 +--
 .../initrdscripts/initramfs-live-boot-tiny_1.0.bb             | 3 +--
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb    | 3 +--
 .../initrdscripts/initramfs-live-install-efi-testfs_1.0.bb    | 3 +--
 .../initrdscripts/initramfs-live-install-efi_1.0.bb           | 3 +--
 .../initrdscripts/initramfs-live-install-testfs_1.0.bb        | 3 +--
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb | 3 +--
 .../initrdscripts/initramfs-module-install-efi_1.0.bb         | 3 +--
 .../initrdscripts/initramfs-module-install_1.0.bb             | 3 +--
 .../initrdscripts/initramfs-module-setup-live_1.0.bb          | 3 +--
 meta/recipes-core/initscripts/initscripts_1.0.bb              | 3 +--
 meta/recipes-core/musl/bsd-headers.bb                         | 3 +--
 meta/recipes-core/musl/libssp-nonshared.bb                    | 3 +--
 meta/recipes-core/musl/musl-legacy-error.bb                   | 3 +--
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb            | 3 +--
 meta/recipes-core/systemd/systemd-compat-units.bb             | 3 +--
 meta/recipes-core/systemd/systemd-conf_1.0.bb                 | 3 +--
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb        | 3 +--
 meta/recipes-core/udev/udev-extraconf_1.1.bb                  | 3 +--
 meta/recipes-core/volatile-binds/volatile-binds.bb            | 3 +--
 meta/recipes-devtools/devel-config/distcc-config.bb           | 3 +--
 meta/recipes-devtools/devel-config/nfs-export-root.bb         | 3 +--
 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb     | 3 +--
 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb          | 3 +--
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb              | 3 +--
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb            | 3 +--
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb       | 3 +--
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb          | 3 +--
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb           | 3 +--
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb      | 3 +--
 meta/recipes-devtools/rust/rust-cross-canadian.inc            | 3 +--
 meta/recipes-extended/shadow/shadow-securetty_4.6.bb          | 3 +--
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb            | 3 +--
 .../texinfo-dummy-native/texinfo-dummy-native.bb              | 3 +--
 meta/recipes-extended/watchdog/watchdog-config.bb             | 3 +--
 meta/recipes-graphics/builder/builder_0.1.bb                  | 3 +--
 .../recipes-graphics/matchbox-session/matchbox-session_0.1.bb | 3 +--
 meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb    | 3 +--
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb            | 3 +--
 meta/recipes-graphics/wayland/weston-init.bb                  | 3 +--
 meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb     | 3 +--
 .../xinput-calibrator/pointercal-xinput_0.0.bb                | 3 +--
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb | 3 +--
 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb   | 3 +--
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb           | 3 +--
 meta/recipes-kernel/linux/linux-dummy.bb                      | 3 +--
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb  | 3 +--
 .../modutils-initscripts/modutils-initscripts.bb              | 3 +--
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb  | 3 +--
 .../pulseaudio-sato/pulseaudio-client-conf-sato_1.bb          | 3 +--
 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb        | 3 +--
 meta/recipes-support/user-creation/xuser-account_0.1.bb       | 3 +--
 86 files changed, 87 insertions(+), 172 deletions(-)

diff --git a/meta-selftest/recipes-test/cpp/cpp-example.inc b/meta-selftest/recipes-test/cpp/cpp-example.inc
index 41aaa7219a1..76ff64e87f5 100644
--- a/meta-selftest/recipes-test/cpp/cpp-example.inc
+++ b/meta-selftest/recipes-test/cpp/cpp-example.inc
@@ -19,7 +19,6 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit ptest
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
index 446c51f09b5..54463fed98c 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
@@ -6,8 +6,7 @@ SRC_URI = "file://file1 \
 
 SRC_URI:append:class-native = " file://file3"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 EXCLUDE_FROM_WORLD = "1"
 BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
index 35672a5265f..0146be4c520 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
@@ -3,7 +3,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://file1"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
index 11928dc95a9..240ed473cc1 100644
--- a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
+++ b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
@@ -6,8 +6,7 @@ DEPENDS = "libgfortran"
 
 SRC_URI = "file://hello.f95"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # These set flags that Fortran doesn't support
 SECURITY_CFLAGS = ""
diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 8b314d396ee..dfaf67c9388 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -6,8 +6,7 @@ LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "zlib"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
index a0eeb4f2231..ca22e1e19c9 100644
--- a/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
+++ b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
@@ -5,8 +5,7 @@ LICENSE = "MIT"
 
 DEPENDS += "coreutils-native"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index 64fea8ed951..8b2aa6c7376 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -6,8 +6,7 @@ SRC_URI = "file://hello.c \
            file://gdb.sh \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile () {
 	${CC} hello.c -o hello1 ${CFLAGS} ${LDFLAGS}
diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
index 2dc352d479e..0ffe7308ba8 100644
--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://helloworld.c"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} helloworld.c -o helloworld
diff --git a/meta-selftest/recipes-test/selftest-users/acreategroup.bb b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
index a970c41134f..07771ecf409 100644
--- a/meta-selftest/recipes-test/selftest-users/acreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
@@ -3,8 +3,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/bcreategroup.bb b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
index 08106dab7cc..0071fcc331c 100644
--- a/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
@@ -7,8 +7,7 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "acreategroup ccreategroup"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/ccreategroup.bb b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
index c82ced84812..16859166302 100644
--- a/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
@@ -5,8 +5,7 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "acreategroup"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
index 4ab278f5895..28651d3ed70 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup1.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
@@ -3,8 +3,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
index 179aba9bfcc..2840c921061 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup2.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
@@ -5,8 +5,7 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "creategroup1"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-users/dcreategroup.bb b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
index 0030e81ee0a..eba91fe63dc 100644
--- a/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
@@ -5,8 +5,7 @@ LICENSE = "MIT"
 
 USERADD_DEPENDS = "bcreategroup"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
index 2863541010c..7ba7ec85feb 100644
--- a/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
+++ b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
@@ -5,8 +5,7 @@ LICENSE = "MIT"
 
 DEPENDS:append = "coreutils-native"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
index db674d0efc2..17ab7af0abd 100644
--- a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
+++ b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
@@ -6,8 +6,7 @@ LICENSE = "MIT"
 SRC_URI = "file://testfile.txt"
 INHIBIT_DEFAULT_DEPS = "1"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile(){
 	echo "testdata" > ${B}/"file with [brackets].txt"
diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index 79f2e8a0923..e5f0ca10237 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -10,8 +10,7 @@ SRC_URI = "file://Makefile \
            file://COPYING \
           "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # The inherit of module.bbclass will automatically name module packages with
 # "kernel-module-" prefix as required by the oe-core build environment.
diff --git a/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb b/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb
index 8be79809195..cb07b139748 100644
--- a/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb
+++ b/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://helloworld.c"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile() {
 	${CC} ${LDFLAGS} helloworld.c -o helloworld
diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index 54b834d45f9..f249579310d 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -9,8 +9,7 @@ SRC_URI = "file://skeleton \
 	   file://COPYRIGHT \
 	   "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} ${S}/skeleton_test.c -o ${B}/skeleton-test
diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index b0d96e7f711..5783d9e2452 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -9,8 +9,7 @@ SRC_URI = "file://file1 \
            file://file3 \
            file://file4"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 PACKAGES =+ "${PN}-user3"
 
diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index 2a2ac93e9bd..ce9d008aac1 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -40,8 +40,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SYSROOT_DIRS += "/boot/devicetree"
 FILES:${PN} = "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 B = "${WORKDIR}/build"
 
 # Default kernel includes, these represent what are normally used for in-kernel
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index d2eebb88bc2..39845997ed4 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -2,8 +2,7 @@
 inherit kernel-arch kernel-artifact-names uboot-config deploy
 require conf/image-fitimage.conf
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index 99497371724..e697fd29209 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -72,7 +72,7 @@ class RecipeUtilsTests(OESelftestTestCase):
         expected_patch = """
 --- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
 +++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
-@@ -11,6 +11,4 @@
+@@ -10,6 +10,4 @@
  
  BBCLASSEXTEND = "native nativesdk"
  
@@ -97,7 +97,7 @@ class RecipeUtilsTests(OESelftestTestCase):
         expected_patch = """
 --- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
 +++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
-@@ -11,6 +11,3 @@
+@@ -10,6 +10,3 @@
  
  BBCLASSEXTEND = "native nativesdk"
  
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 099fbd3b9d8..9452a1a4ce4 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -21,8 +21,7 @@ SRC_URI = "\
   file://alsa-state-init \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # As the recipe doesn't inherit systemd.bbclass, we need to set this variable
 # manually to avoid unnecessary postinst/preinst generated.
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 4714bb2e5e2..f8d5613ffac 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://config file://machconfig"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index a004e3a3b2f..0b4005e5bf0 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -11,8 +11,7 @@ inherit grub-efi-cfg
 
 require conf/image-uefi.conf
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 GRUB_CFG = "${S}/grub-bootconf"
 LABELS = "boot"
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 0425197c981..ab2d68d6a19 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -24,8 +24,7 @@ SRC_URI = "file://keymap.sh"
 INITSCRIPT_NAME = "keymap.sh"
 INITSCRIPT_PARAMS = "start 01 S ."
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install () {
     # Only install the script if 'sysvinit' is in DISTRO_FEATURES
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 73c54cddae8..a787232476e 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
 SRC_URI = "file://main.conf \
           "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 0ee47d47c2b..5c9c8219d72 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -11,8 +11,7 @@ SRC_URI = "file://host-peer \
 
 inherit allarch useradd
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -d ${D}${sysconfdir}/ppp/peers
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
index db5a0eb8ce5..57b05349290 100644
--- a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
@@ -6,8 +6,7 @@ SRC_URI = "file://dropbear_rsa_host_key \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 59b084d1414..3f01bb35d92 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -25,8 +25,7 @@ SRC_URI = "file://rotation \
            file://licenses/GPL-2 \
            "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
index 4ffc44c808a..3bdec248de4 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.37.0.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
 
 SRC_URI = "file://inittab"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index ddf9d1b3112..da594d00b76 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -15,8 +15,7 @@ SRC_URI = "file://copyright \
            file://interfaces \
            file://nfsroot"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install () {
 	install -d ${D}${sysconfdir}/init.d \
diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
index ec3544c67a9..e0a6319ccf1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
@@ -3,8 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-boot.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
         install -m 0755 ${S}/init-boot.sh ${D}/init
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index bb4984366d1..a3e4e2a7e97 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -20,8 +20,7 @@ SRC_URI = "file://init \
            file://overlayroot \
           "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
index 40046f30a76..6b99ab1843a 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
@@ -5,8 +5,7 @@ DEPENDS = "virtual/kernel"
 RDEPENDS:${PN} = "busybox-mdev"
 SRC_URI = "file://init-live.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
         install -m 0755 ${S}/init-live.sh ${D}/init
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 7851cc9605a..8c8355a53e4 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,8 +5,7 @@ DEPENDS = "virtual/kernel"
 RDEPENDS:${PN} = "udev udev-extraconf"
 SRC_URI = "file://init-live.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
         install -m 0755 ${S}/init-live.sh ${D}/init
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
index 31291bcdf2c..e3087273201 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
@@ -5,8 +5,7 @@ SRC_URI = "file://init-install-efi-testfs.sh"
 
 RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
         install -m 0755 ${S}/init-install-efi-testfs.sh ${D}/install-efi.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index ff3b5622db7..77462f44258 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -6,8 +6,7 @@ SRC_URI = "file://init-install-efi.sh"
 RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
         install -m 0755 ${S}/init-install-efi.sh ${D}/install-efi.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
index 19f05f9fecd..05f92203cd6 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
@@ -5,8 +5,7 @@ SRC_URI = "file://init-install-testfs.sh"
 
 RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
         install -m 0755 ${S}/init-install-testfs.sh ${D}/install.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 1d489e2b649..791bd57171f 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -3,8 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 RDEPENDS:${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index bb3f275f266..0115741f4c1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -7,8 +7,7 @@ RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
 SRC_URI = "file://init-install-efi.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index d6d83487312..96fd8310d27 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -12,8 +12,7 @@ COMPATIBLE_HOST:armv7ve = 'null'
 
 SRC_URI = "file://init-install.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index 4d9ef79a634..c2ab107980e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -9,8 +9,7 @@ inherit allarch
 FILESEXTRAPATHS:prepend := "${THISDIR}/initramfs-framework:"
 SRC_URI = "file://setup-live"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}/init.d
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 0bc078c5eb8..c984257c5c8 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -35,8 +35,7 @@ SRC_URI = "file://functions \
            ${@bb.utils.contains('DISTRO_FEATURES','selinux','file://sushell','',d)} \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 SRC_URI:append:arm = " file://alignment.sh"
 SRC_URI:append:armeb = " file://alignment.sh"
diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/musl/bsd-headers.bb
index 7d0bdee8704..ad9ba81e4f9 100644
--- a/meta/recipes-core/musl/bsd-headers.bb
+++ b/meta/recipes-core/musl/bsd-headers.bb
@@ -15,8 +15,7 @@ do_compile[noexec] = "1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -Dm 0644 ${S}/sys-queue.h ${D}${includedir}/sys/queue.h
diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
index fde3bc97b47..4bcbaef7ea4 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -17,8 +17,7 @@ DEPENDS = "virtual/cross-binutils \
 
 do_configure[noexec] = "1"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile() {
 	${CC} ${CPPFLAGS} ${CFLAGS} -fPIE -c stack_chk.c -o stack_chk.o
diff --git a/meta/recipes-core/musl/musl-legacy-error.bb b/meta/recipes-core/musl/musl-legacy-error.bb
index 11a838a6e8a..b40075c0b6b 100644
--- a/meta/recipes-core/musl/musl-legacy-error.bb
+++ b/meta/recipes-core/musl/musl-legacy-error.bb
@@ -13,8 +13,7 @@ do_compile[noexec] = "1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -Dm 0644 ${S}/error.h -t ${D}${includedir}
diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
index 0ec49365d02..5efac3e4106 100644
--- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -7,8 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit systemd-boot-cfg
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 LABELS = "boot"
 
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 33257395440..187f0d4626e 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -5,8 +5,7 @@ LICENSE = "MIT"
 
 PACKAGE_WRITE_DEPS += "systemd-systemctl-native"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit features_check
 
diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index b8bea0c25be..60066cd60a6 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -21,8 +21,7 @@ SRC_URI = "\
     file://wired.network \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -D -m0644 ${S}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 6ff2ca1bf43..748e5e6d065 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
 SRC_URI = "file://inittab \
            file://start_getty"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 0d7e4f4f369..2ba6606c059 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -13,8 +13,7 @@ SRC_URI = " \
        file://localextra.rules \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 MOUNT_BASE = "/run/media"
 MOUNT_GROUP ?= "disk"
diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 3597ec73561..857bcc93ff1 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -9,8 +9,7 @@ SRC_URI = "\
     file://volatile-binds.service.in \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit allarch systemd features_check
 
diff --git a/meta/recipes-devtools/devel-config/distcc-config.bb b/meta/recipes-devtools/devel-config/distcc-config.bb
index 2c30488b820..f5b2f0f246c 100644
--- a/meta/recipes-devtools/devel-config/distcc-config.bb
+++ b/meta/recipes-devtools/devel-config/distcc-config.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://distcc.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # Default to the host machine for a running qemu session
 DISTCC_HOSTS ?= "192.168.7.1"
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
index ad5486aa87f..a827bb58eea 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://exports"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -d ${D}${sysconfdir}
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 58e9b6659e5..1148d536944 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -26,8 +26,7 @@ SRC_URI[payloadPV.sha256sum] = "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd791
 
 UPSTREAM_CHECK_REGEX = "docbook-xml-(?P<pver>4(\.\d+)).zip"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_configure (){
     :
diff --git a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
index 8e42b12b77c..c1eca13107b 100644
--- a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
+++ b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
@@ -8,8 +8,7 @@ BBCLASSEXTEND = "native"
 DEPENDS = "elfutils"
 DEPENDS:append:libc-musl = " argp-standalone"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} -o dwarfsrcfiles ${S}/dwarfsrcfiles.c -lelf -ldw
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 7b11093364a..deed6845370 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://makedevs.c;beginline=2;endline=2;md5=c3817b10013a3007
 SECTION = "base"
 SRC_URI = "file://makedevs.c"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 FILES:${PN}:append:class-nativesdk = " ${datadir}"
 
diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index 4db35c1092e..128baa9a081 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://git.yoctoproject.org/opkg/"
 LICENSE = "MIT"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile() {
 	mkdir -p ${S}/${sysconfdir}/opkg/
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 90bba84b03c..8dfa2b74d96 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -18,8 +18,7 @@ SRC_URI = "file://${COREBASE}/scripts/runqemu \
            file://${COREBASE}/scripts/runqemu-export-rootfs \
           "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit nativesdk
 
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 28a3b95c4ea..30108e76df6 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://${S}/qemu-oe-bridge-helper.c;endline=4;md5=ae00a3bab8
 
 SRC_URI = "file://qemu-oe-bridge-helper.c"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit native
 
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 6d0e7883ad9..3418979968e 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -2,8 +2,7 @@ SUMMARY = "QEMU wrapper script"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "MIT"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 DEPENDS += "qemu-native"
 
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index f571e619218..5486f89ae75 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -8,8 +8,7 @@ SRC_URI = "file://run-postinsts \
            file://run-postinsts.init \
            file://run-postinsts.service"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit allarch systemd update-rc.d
 
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 09e1b911a28..df8b78d326e 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -13,8 +13,7 @@ DEPENDS += "virtual/nativesdk-cross-cc virtual/nativesdk-libc virtual/nativesdk-
 
 SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
index 913c159c818..dbcfad5f1bf 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
@@ -8,8 +8,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://securetty"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # Since SERIAL_CONSOLES is likely to be set from the machine configuration
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index 13cfab6aabb..aa132970b8c 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -13,8 +13,7 @@ DEPENDS = "base-passwd"
 # can add custom users/groups for recipes that use inherit useradd.
 SRC_URI = "file://login.defs_shadow-sysroot"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -d ${D}${sysconfdir}
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
index 51d9c927661..9773d134cfb 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
@@ -8,8 +8,7 @@ PV = "1.0"
 
 SRC_URI = "file://template.py file://COPYING"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit native
 
diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
index 17151ced5ec..58c565bd302 100644
--- a/meta/recipes-extended/watchdog/watchdog-config.bb
+++ b/meta/recipes-extended/watchdog/watchdog-config.bb
@@ -13,8 +13,7 @@ SRC_URI = " \
     file://watchdog.conf \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # The default value is 60 seconds when null.
 WATCHDOG_TIMEOUT ??= ""
diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 39abaf31ce5..b8a77983640 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://builder_session.sh;endline=5;md5=84796c3c41785d86100f
 SRC_URI = "file://builder_session.sh \
           "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 RDEPENDS:${PN} = "mini-x-session"
 
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index 8a4cfef6315..3f446445e79 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -11,8 +11,7 @@ RCONFLICTS:${PN} = "matchbox-common"
 
 SRC_URI = "file://matchbox-session"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 
 inherit update-alternatives
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 48d50c8f66d..a6626b5d18a 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -12,8 +12,7 @@ RCONFLICTS:${PN} = "matchbox-common"
 
 SRC_URI = "file://mini-x-session"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 RDEPENDS:${PN} = "sudo"
 
diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index ee5173dc83d..a30cdd1dcb1 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -10,8 +10,7 @@ SRC_URI = "file://pong-clock-no-flicker.c"
 
 LIC_FILES_CHKSUM = "file://pong-clock-no-flicker.c;beginline=1;endline=23;md5=dd248d50f73f746d1ee78586b0b2ebd3"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} -o pong-clock pong-clock-no-flicker.c `pkg-config --cflags --libs x11 xau xdmcp`
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 5723655a9bb..fc817d113fe 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -13,8 +13,7 @@ SRC_URI = "file://init \
            file://weston-autologin \
            file://weston-start"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
 PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index cd4acf81551..169269eefb3 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -12,8 +12,7 @@ SRC_URI = "file://xserver-nodm \
            file://capability.conf \
 "
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 # Since we refer to ROOTLESS_X which is normally enabled per-machine
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index f4516e69750..39bb5803f1b 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://pointercal.xinput"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     # Only install file if it has a contents
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index d57b3427f8d..8f3b9217a03 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 SRC_URI = "file://xorg.conf"
 SRC_URI:append:qemuall = " file://noblank.conf"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
 
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
index a766b00bef0..b19f53e20d8 100644
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
@@ -7,8 +7,7 @@ SRC_URI = "file://dt-doc-validate \
            file://dt-mk-schema \
            file://dt-validate"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
     install -d ${D}${bindir}/
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 29f34d7f36b..5e70e01102f 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -1,8 +1,7 @@
 SUMMARY = "Wrapper script for the Linux kernel module dependency indexer"
 LICENSE = "MIT"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 # The kernel and the staging dir for it is machine specific
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 3e9a563cad8..f52e3a7b564 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -31,8 +31,7 @@ COMPATIBLE_HOST = ".*-linux"
 
 SRC_URI = "file://COPYING.GPL"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_configure() {
 	:
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 1a20472994b..8fcb5e6eb3f 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -8,8 +8,7 @@ inherit pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 49268445a88..fb7b09393a3 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://modutils.sh;beginline=3;endline=3;md5=b2dccaa94b3629a08bfb4f983cad6f89"
 SRC_URI = "file://modutils.sh"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 INITSCRIPT_NAME = "modutils.sh"
 INITSCRIPT_PARAMS = "start 06 S ."
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index bb7ddbc7f42..75065163bae 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -20,8 +20,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "file://session \
            file://index.theme"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 FILES:${PN} += "${datadir}/themes/Sato/index.theme"
 
diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
index 20368703c4d..65748ee771f 100644
--- a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://50-sato.conf"
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 inherit allarch
 
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index 8c6c0edf107..73334fb7289 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 SRC_URI = "file://shutdown.desktop"
 
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -d ${D}${datadir}/applications
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 80a429c6d33..04f506e7a39 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -6,8 +6,7 @@ SRC_URI = "file://system-xuser.conf"
 
 inherit allarch useradd
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_configure() {
     :
-- 
2.39.5


