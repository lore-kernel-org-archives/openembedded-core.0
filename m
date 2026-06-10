Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13390CD98C6
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 14:12:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21331.1781100748390460753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 07:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=osWDabE2;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd45e596cso3424031f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781100747; x=1781705547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0SruAOCR7PNfOBV1OfrHAenpvclXTLlh6oddOiQOac=;
        b=osWDabE2dgpzjqPx5Yfnpoy97EuZGr56n2f9Y+1EMjGxbnSQXFmqbFFDm7pEYZJ4FA
         66fjm0CMH3wOWwvE78lYWYkZG/fLhWb9ZCI4Jv6B/S5Nh6zk+6w1sF2Zd8ZEN5zqM7Nb
         Ch6JEB8tCCyG6npLATCvaeL1Dgc3QUzNdnlehIenzQHVtcSDkYdee8M/kHtIqyX/TGRG
         iZELH4iYkDkWgylGg14p6hweomWKxQAk6q3UMt+VV4Tilsoo3KergfMK/qT5Th40V+AZ
         KkOWLCw8WAvBC0McOeghJ7eP/NCRxKfnFpheaLTKC6Ie0yUZh0SI5oqM2712YkNRarWO
         qHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100747; x=1781705547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x0SruAOCR7PNfOBV1OfrHAenpvclXTLlh6oddOiQOac=;
        b=I6ruXOorfR7eVz1en93hAWv6QTdEovXW1XAzZDoE2oLyCxl8R73G4t+Hutd6l0xsKm
         Nh5jubaKEwLrbS777+xkjsIiphPb4kkKEjljQDMrq07B8DHrmEL7xM+FNQhqWPb+w4Q4
         bsD38NPo9EFm8GXmoy9D09B+VsTiiCFndf7bUK2tjUxh34U1vugnfkoByn3S2WL3O8eY
         E+fFyRg95hnrUG1tcUy4fFBANHTOvHAf+oV6RbeQWjKI1YRYvokBDjgmIzAfCyLdRMQe
         kTkUvVx3zJmjvzUp0056OPVU+HTYFLBGEoqFpkh4zv+NOTzOa2wuBN3G2baXpwT4rkuS
         PavA==
X-Gm-Message-State: AOJu0YwDGUCtfsQLcdqC/a7CcoX8XbiujvSU3AF8wTAFYmfkrr01W0Xj
	KU2o9Zr5bww9cUOSxujeCrCNoW3lyGNdTV7WNQgxtqHgH9K1DgAMoRo4ZbFXuMvj
X-Gm-Gg: Acq92OGWb/+Xvrz0fcmKakU6XdFTRvVPhelp+IVYytuPMFgIdUX0wbh1ips8pT7mMHd
	i6NRTykn18rqD7gOts9HsQcRC197snpveLsqMd2FW7fut/ZyJERuos4tz2ZL4NE3gTj088Dj1eF
	oN3d4NvvIeons8wrdedjMZC8IHWFXPSdhcnOgqOJhXaNccVMWrPNHLclRj1RZv/jDVvOrvyGv/A
	cE+39xbjQfxlWhcQgx3coNLyByr2X0LMNn7lMBE/HaaqrfdLCcSYWcJJBHweIRJ4GFDZnPvErRG
	hvjtZAs3Xd50EgPfGYik/xhbA/+//44RXPHIbkitgRIx3SCJ43jWqT79svrJn3/kWUvfyJvLN10
	Yam5bXLsimF8Q5wKJNyTb66HKC1e///b8x30QjQ75/0U/ocWqP3SYKH4E5eDryic4oREqNmH8BI
	0zndueHXfm1GoajExJZjvym/12kcQdPTDC+/k+qHarPrG0ygC74fc46M8ydvIZEq4jdc+tSaSFi
	pHPEg//
X-Received: by 2002:a05:6000:4b14:b0:460:1755:160e with SMTP id ffacd0b85a97d-460566ca05cmr11859084f8f.33.1781100746326;
        Wed, 10 Jun 2026 07:12:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm73090471f8f.2.2026.06.10.07.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:12:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Quan Sun <Quan.Sun@windriver.com>
Subject: [PATCH 2/4] qemu: upgrade 10.2.0 -> 11.0.0
Date: Wed, 10 Jun 2026 16:12:07 +0200
Message-ID: <20260610141220.709884-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610141220.709884-1-alex.kanavin@gmail.com>
References: <20260610141220.709884-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 14:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238363

From: Alexander Kanavin <alex@linutronix.de>

Upgrade QEMU to version 11.0.0.

Main changes:

- QEMU 11.0.0 has officially dropped all support for 32-bit host systems.
  This includes the ability to build the system emulator (softmmu) on
  any 32-bit host architecture. Add COMPATIBLE_HOST for class-target and
  class-nativesdk to restrict builds to 64-bit architectures. Fix SDK
  build failure when SDKMACHINE is 32-bit.
  Note: QEMU 11.0.0 still supports emulating 32-bit guest architectures
  (such as qemu-system-i386 or qemu-system-arm) as long as they are
  running on a 64-bit host.

- qemu-targets.inc: skip linux-user targets when HOST_ARCH is not in the
  set of architectures supported by QEMU 11.0.0's linux-user mode
  (64-bit only: aarch64, loongarch64, mips64, ppc64, riscv64, s390x,
  sparc64, x86_64).

- Add --cpu=${TUNE_ARCH} to EXTRA_OECONF for class-target, and add
  --cpu=${SDK_ARCH} to nativesdk configure options to fix build
  failure. QEMU 11's configure script falls back to 'uname -m' (x86_64)
  when it cannot detect the host CPU.

- Add 0012-meson-fix-close_range-detection-on-older-glibc.patch:
  the meson has_function('close_range') check succeeds at link time on
  hosts with kernel >= 5.9 even when glibc < 2.34 does not declare the
  function, causing implicit declaration errors. Add a prefix include
  so the check only succeeds when the header declares close_range().

- Add 0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch:
  on build hosts with kernel headers < 6.0, vhost-scsi.c fails to
  compile due to missing struct vhost_vring_worker/vhost_worker_state.
  Include QEMU's bundled standard-headers before the system header,
  matching the pattern already used in hw/virtio/vhost-backend.c.

- Drop fix-strerrorname_np.patch (fixed upstream).
  Drop 0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
  (fixed upstream).
  Drop 0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
  (fixed upstream).

AI-Generated: kiro-cli

Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nativesdk-packagegroup-sdk-host.bb        |   3 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb         |   2 +
 ...native_10.2.0.bb => qemu-native_11.0.0.bb} |   1 -
 ...10.2.0.bb => qemu-system-native_11.0.0.bb} |   1 -
 meta/recipes-devtools/qemu/qemu-targets.inc   |   4 +
 meta/recipes-devtools/qemu/qemu.inc           |  26 +-
 ...tlb_to_section-for-different-Address.patch | 274 ------------------
 ...load.c-Correction-to-HWCAP2-accessor.patch |  42 ---
 ...n-environment-space-to-boot-loader-q.patch |   8 +-
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |   6 +-
 ...mu-Do-not-include-file-if-not-exists.patch |   6 +-
 ...er-space-mmap-tweaks-to-address-musl.patch |  24 +-
 .../qemu/0006-qemu-Determinism-fixes.patch    |   4 +-
 ...d-use-relative-path-to-refer-to-file.patch |   6 +-
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |   2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  10 +-
 ...and-the-python-venv-aren-t-used-for-.patch |  10 +-
 ...close_range-detection-on-older-glibc.patch |  36 +++
 ...ard-headers-for-vhost-worker-structs.patch |  35 +++
 .../qemu/qemu/fix-strerrorname_np.patch       |  35 ---
 .../qemu/{qemu_10.2.0.bb => qemu_11.0.0.bb}   |   0
 21 files changed, 127 insertions(+), 408 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.2.0.bb => qemu-native_11.0.0.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.2.0.bb => qemu-system-native_11.0.0.bb} (99%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
 rename meta/recipes-devtools/qemu/{qemu_10.2.0.bb => qemu_11.0.0.bb} (100%)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index c1d3c25060..51e48f250b 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -13,8 +13,7 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 # build some recent linux kernels (5.14+) for arm
 RDEPENDS:${PN} = "\
     nativesdk-pkgconfig \
-    nativesdk-qemu \
-    nativesdk-qemu-helper \
+    ${@'nativesdk-qemu nativesdk-qemu-helper' if d.getVar('SDK_ARCH') in ['x86_64', 'aarch64', 'ppc64', 'ppc64le', 'riscv64', 'loongarch64', 'mips64', 's390x', 'sparc64'] else ''} \
     nativesdk-pseudo \
     nativesdk-unfs3 \
     nativesdk-opkg \
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 35735c1e15..60fb635600 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Qemu helper scripts"
 LICENSE = "GPL-2.0-only"
+# QEMU 11.0.0+ requires a 64-bit host architecture
+COMPATIBLE_HOST = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
 RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
                   nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
diff --git a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb b/meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
index 26fa84c180..a77953529b 100644
--- a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
@@ -7,4 +7,3 @@ require qemu-native.inc
 EXTRA_OECONF:append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
 
 PACKAGECONFIG ??= "pie"
-
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
index 62e8a0a83b..7947499c5f 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
@@ -26,4 +26,3 @@ do_install:append() {
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
 }
-
diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 50e5eb6796..937ef1a911 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -25,6 +25,10 @@ def get_qemu_target_list(d):
             archs.remove(arch)
     if 'linux' not in tos:
         return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in archs]).rstrip(',')
+    # QEMU 11.0.0+ only supports linux-user on 64-bit host architectures
+    linux_user_hosts = ['aarch64', 'loongarch64', 'mips64', 'ppc64', 'riscv64', 's390x', 'sparc64', 'x86_64']
+    if tarch not in linux_user_hosts:
+        return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in archs]).rstrip(',')
     return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" + "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
 
 def get_qemu_usermode_target_list(d):
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5f30416a48..f61f43de4b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -4,6 +4,7 @@ machine's processor through dynamic binary translation and provides a set \
 of different hardware and device models for the machine, enabling it to run \
 a variety of guest operating systems"
 HOMEPAGE = "http://qemu.org"
+BUGTRACKER = "https://gitlab.com/qemu-project/qemu/-/issues"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 
 DEPENDS += "bison-native meson-native ninja-native"
@@ -22,7 +23,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a3b50d8b88dcc0eb3d7d39b760b9e821 \
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
-           file://fix-strerrorname_np.patch \
            file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
            file://0002-apic-fixup-fallthrough-to-PIC.patch \
            file://0004-qemu-Do-not-include-file-if-not-exists.patch \
@@ -32,8 +32,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
-           file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch \
-           file://0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch \
+           file://0012-meson-fix-close_range-detection-on-older-glibc.patch \
+           file://0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
@@ -41,7 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a"
+SRC_URI[sha256sum] = "c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
@@ -61,6 +61,10 @@ COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
+# QEMU 11.0.0+ requires a 64-bit host architecture for emulator builds
+COMPATIBLE_HOST:class-target = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST:class-nativesdk = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
+
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
 # upstream states qemu doesn't work without optimization
 DEBUG_BUILD = "0"
@@ -75,7 +79,7 @@ do_install_ptest() {
 	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcodp]" | xargs -i rm -rf {}
 
 	# Don't check the file genreated by configure
-	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}/tests/data/acpi/disassemle-aml.sh
+	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}/tests/data/acpi/disassemble-aml.sh
 
 	# Strip the paths from the QEMU variable, we can use PATH
 	makfiles=$(find ${D}${PTEST_PATH} -name "*.mak")
@@ -119,19 +123,17 @@ EXTRA_OECONF = " \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
-EXTRA_OECONF:append:class-target = " --cross-prefix=${HOST_PREFIX}"
-EXTRA_OECONF:append:class-nativesdk = " --cross-prefix=${HOST_PREFIX}"
+EXTRA_OECONF:append:class-target = " --cross-prefix=${HOST_PREFIX} --cpu=${TUNE_ARCH}"
+EXTRA_OECONF:append:class-nativesdk = " --cross-prefix=${HOST_PREFIX} --cpu=${@d.getVar('SDK_ARCH').replace('i686', 'i386')}"
 
 B = "${WORKDIR}/build"
 
 #EXTRA_OECONF:append = " --python=${HOSTTOOLS_DIR}/python3"
 
 do_configure:prepend:class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_LIBDIR=$PKG_CONFIG_LIBDIR:$BHOST_PKGCONFIG_PATH
-	fi
+	# Avoid leaking host pkg-config paths which may find incompatible
+	# old system libraries (e.g. glib-2.0, fixesproto, gtk+-3.0)
+	export PKG_CONFIG_PATH="${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_DATADIR_NATIVE}/pkgconfig"
 }
 
 do_configure() {
diff --git a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch b/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
deleted file mode 100644
index d19f872fc3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
+++ /dev/null
@@ -1,274 +0,0 @@
-From 858e6bb252e075e09cca6e78299151d3af0bf5fb Mon Sep 17 00:00:00 2001
-From: Quan Sun <Quan.Sun@windriver.com>
-Date: Tue, 28 Apr 2026 14:56:36 -0400
-Subject: [PATCH] accel/tcg: Fix iotlb_to_section() for different AddressSpace
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-'CPUTLBEntryFull.xlat_section' stores section_index in last 12 bits to
-find the correct section when CPU access the IO region over the IOTLB.
-However, section_index is only unique inside single AddressSpace. If
-address space translation is over IOMMUMemoryRegion, it could return
-section from other AddressSpace. 'iotlb_to_section()' API only finds the
-sections from CPU's AddressSpace so that it couldn't find section in
-other AddressSpace. Thus, using 'iotlb_to_section()' API will find the
-wrong section and QEMU will have wrong load/store access.
-
-To fix this bug of iotlb_to_section(), store complete MemoryRegionSection
-pointer in CPUTLBEntryFull to replace the section_index in xlat_section.
-Rename 'xlat_section' to 'xlat_offset' as we remove last 12 bits
-section_index inside. Also, since we directly use section pointer in the
-CPUTLBEntryFull (full->section), we can remove the unused functions:
-iotlb_to_section(), memory_region_section_get_iotlb().
-
-This bug occurs only when
-(1) IOMMUMemoryRegion is in the path of CPU access.
-(2) IOMMUMemoryRegion returns different target_as and the section is in
-the IO region.
-
-This patch incorporates prerequisite changes from upstream commit
-94c6e9cf0440 ("accel/tcg: Send the CPUTLBEntryFull struct into
-io_prepare()") needed for the fix to apply cleanly.
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/854cd16e318eed12de2995014b28d9f374c64bf7]
-
-Signed-off-by: Jim Shu <jim.shu@sifive.com>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Tested-by: Mark Burton <mburton@qti.qualcomm.com>
-Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
-Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
----
- accel/tcg/cputlb.c        | 32 +++++++++++++++-----------------
- include/accel/tcg/iommu.h | 15 ---------------
- include/exec/cputlb.h     |  4 ++--
- include/hw/core/cpu.h     | 17 +++++++++--------
- system/physmem.c          | 25 -------------------------
- 5 files changed, 26 insertions(+), 67 deletions(-)
-
-diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
-index fd1606c85..fa0f4d8b3 100644
---- a/accel/tcg/cputlb.c
-+++ b/accel/tcg/cputlb.c
-@@ -1089,7 +1089,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
-         }
-     } else {
-         /* I/O or ROMD */
--        iotlb = memory_region_section_get_iotlb(cpu, section) + xlat;
-+        iotlb = xlat;
-         /*
-          * Writes to romd devices must go through MMIO to enable write.
-          * Reads to romd devices go through the ram_ptr found above,
-@@ -1140,10 +1140,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
-     /*
-      * When memory region is ram, iotlb contains a TARGET_PAGE_BITS
-      * aligned ram_addr_t of the page base of the target RAM.
--     * Otherwise, iotlb contains
--     *  - a physical section number in the lower TARGET_PAGE_BITS
--     *  - the offset within section->mr of the page base (I/O, ROMD) with the
--     *    TARGET_PAGE_BITS masked off.
-+     * Otherwise, iotlb contains a TARGET_PAGE_BITS aligned
-+     * offset within section->mr of the page base (I/O, ROMD)
-+     *
-      * We subtract addr_page (which is page aligned and thus won't
-      * disturb the low bits) to give an offset which can be added to the
-      * (non-page-aligned) vaddr of the eventual memory access to get
-@@ -1153,7 +1152,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
-      */
-     desc->fulltlb[index] = *full;
-     full = &desc->fulltlb[index];
--    full->xlat_section = iotlb - addr_page;
-+    full->xlat_offset = iotlb - addr_page;
-+    full->section = section;
-     full->phys_addr = paddr_page;
-
-     /* Now calculate the new entry */
-@@ -1269,14 +1269,14 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
- }
-
- static MemoryRegionSection *
--io_prepare(hwaddr *out_offset, CPUState *cpu, hwaddr xlat,
-+io_prepare(hwaddr *out_offset, CPUState *cpu, CPUTLBEntryFull *full,
-            MemTxAttrs attrs, vaddr addr, uintptr_t retaddr)
- {
-     MemoryRegionSection *section;
-     hwaddr mr_offset;
-
--    section = iotlb_to_section(cpu, xlat, attrs);
--    mr_offset = (xlat & TARGET_PAGE_MASK) + addr;
-+    section = full->section;
-+    mr_offset = full->xlat_offset + addr;
-     cpu->mem_io_pc = retaddr;
-     if (!cpu->neg.can_do_io) {
-         cpu_io_recompile(cpu, retaddr);
-@@ -1335,7 +1335,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t mmu_idx, size_t index,
- static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
-                            CPUTLBEntryFull *full, uintptr_t retaddr)
- {
--    ram_addr_t ram_addr = mem_vaddr + full->xlat_section;
-+    ram_addr_t ram_addr = mem_vaddr + full->xlat_offset;
-
-     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
-
-@@ -1592,9 +1592,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
-
-     /* We must have an iotlb entry for MMIO */
-     if (tlb_addr & TLB_MMIO) {
--        MemoryRegionSection *section =
--            iotlb_to_section(cpu, full->xlat_section & ~TARGET_PAGE_MASK,
--                             full->attrs);
-+        MemoryRegionSection *section = full->section;
-         data->is_io = true;
-         data->mr = section->mr;
-     } else {
-@@ -1980,7 +1978,7 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
-     tcg_debug_assert(size > 0 && size <= 8);
-
-     attrs = full->attrs;
--    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
-+    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr = section->mr;
-
-     BQL_LOCK_GUARD();
-@@ -2001,7 +1999,7 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
-     tcg_debug_assert(size > 8 && size <= 16);
-
-     attrs = full->attrs;
--    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
-+    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr = section->mr;
-
-     BQL_LOCK_GUARD();
-@@ -2521,7 +2519,7 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
-     tcg_debug_assert(size > 0 && size <= 8);
-
-     attrs = full->attrs;
--    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
-+    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr = section->mr;
-
-     BQL_LOCK_GUARD();
-@@ -2541,7 +2539,7 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
-     tcg_debug_assert(size > 8 && size <= 16);
-
-     attrs = full->attrs;
--    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
-+    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr = section->mr;
-
-     BQL_LOCK_GUARD();
-diff --git a/include/accel/tcg/iommu.h b/include/accel/tcg/iommu.h
-index 90cfd6c0e..547f8ea0e 100644
---- a/include/accel/tcg/iommu.h
-+++ b/include/accel/tcg/iommu.h
-@@ -14,18 +14,6 @@
- #include "exec/hwaddr.h"
- #include "exec/memattrs.h"
-
--/**
-- * iotlb_to_section:
-- * @cpu: CPU performing the access
-- * @index: TCG CPU IOTLB entry
-- *
-- * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
-- * it refers to. @index will have been initially created and returned
-- * by memory_region_section_get_iotlb().
-- */
--MemoryRegionSection *iotlb_to_section(CPUState *cpu,
--                                      hwaddr index, MemTxAttrs attrs);
--
- MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
-                                                        int asidx,
-                                                        hwaddr addr,
-@@ -34,8 +22,5 @@ MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
-                                                        MemTxAttrs attrs,
-                                                        int *prot);
-
--hwaddr memory_region_section_get_iotlb(CPUState *cpu,
--                                       MemoryRegionSection *section);
--
- #endif
-
-diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
-index 9bec0e789..16f866990 100644
---- a/include/exec/cputlb.h
-+++ b/include/exec/cputlb.h
-@@ -43,8 +43,8 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
-  * @full: the details of the tlb entry
-  *
-  * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
-- * @full must be filled, except for xlat_section, and constitute
-- * the complete description of the translated page.
-+ * @full must be filled, except for xlat_offset & section, and
-+ * constitute the complete description of the translated page.
-  *
-  * This is generally called by the target tlb_fill function after
-  * having performed a successful page table walk to find the physical
-diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
-index 961505177..a3db3f66f 100644
---- a/include/hw/core/cpu.h
-+++ b/include/hw/core/cpu.h
-@@ -214,15 +214,16 @@ typedef uint32_t MMUIdxMap;
-  */
- struct CPUTLBEntryFull {
-     /*
--     * @xlat_section contains:
--     *  - in the lower TARGET_PAGE_BITS, a physical section number
--     *  - with the lower TARGET_PAGE_BITS masked off, an offset which
--     *    must be added to the virtual address to obtain:
--     *     + the ram_addr_t of the target RAM (if the physical section
--     *       number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
--     *     + the offset within the target MemoryRegion (otherwise)
-+     * @xlat_offset: TARGET_PAGE_BITS aligned offset which must be added to
-+     * the virtual address to obtain:
-+     *   + the ram_addr_t of the target RAM (if the physical section
-+     *     number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
-+     *   + the offset within the target MemoryRegion (otherwise)
-      */
--    hwaddr xlat_section;
-+    hwaddr xlat_offset;
-+
-+    /* @section contains physical section. */
-+    MemoryRegionSection *section;
-
-     /*
-      * @phys_addr contains the physical address in the address space
-diff --git a/system/physmem.c b/system/physmem.c
-index c9869e404..a21e7ca64 100644
---- a/system/physmem.c
-+++ b/system/physmem.c
-@@ -748,31 +748,6 @@ translate_fail:
-     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
- }
-
--MemoryRegionSection *iotlb_to_section(CPUState *cpu,
--                                      hwaddr index, MemTxAttrs attrs)
--{
--    int asidx = cpu_asidx_from_attrs(cpu, attrs);
--    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
--    AddressSpaceDispatch *d = address_space_to_dispatch(cpuas->as);
--    int section_index = index & ~TARGET_PAGE_MASK;
--    MemoryRegionSection *ret;
--
--    assert(section_index < d->map.sections_nb);
--    ret = d->map.sections + section_index;
--    assert(ret->mr);
--    assert(ret->mr->ops);
--
--    return ret;
--}
--
--/* Called from RCU critical section */
--hwaddr memory_region_section_get_iotlb(CPUState *cpu,
--                                       MemoryRegionSection *section)
--{
--    AddressSpaceDispatch *d = flatview_to_dispatch(section->fv);
--    return section - d->map.sections;
--}
--
- #endif /* CONFIG_TCG */
-
- void cpu_address_space_init(CPUState *cpu, int asidx,
---
-2.43.0
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
deleted file mode 100644
index 47d6f41385..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c333f9c4ee212297f3b9a8a6ef62396a63c48e61 Mon Sep 17 00:00:00 2001
-From: Jim MacArthur <jim.macarthur@linaro.org>
-Date: Tue, 6 Jan 2026 15:40:48 +0000
-Subject: [PATCH] linux-user/elfload.c: Correction to HWCAP2 accessor
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-get_elf_hwcap was used when get_elf_hwcap2 should have been.
-
-Cc: qemu-stable@nongnu.org
-Fixes: fcac98d0ba8b ("linux-user: Remove ELF_HWCAP2")
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3259
-Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Message-ID: <20260106-fix-hwcap2-sve2-v1-1-1d70dff63370@linaro.org>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/c333f9c4ee212297f3b9a8a6ef62396a63c48e61]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- linux-user/elfload.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux-user/elfload.c b/linux-user/elfload.c
-index 0002d5be2f..35471c0c9a 100644
---- a/linux-user/elfload.c
-+++ b/linux-user/elfload.c
-@@ -708,7 +708,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
-     NEW_AUX_ENT(AT_EXECFN, info->file_string);
- 
-     if (HAVE_ELF_HWCAP2) {
--        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap(thread_cpu));
-+        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap2(thread_cpu));
-     }
-     if (u_base_platform) {
-         NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index bc8dace013..40b08cd247 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,10 +1,10 @@
-From f2d9bc614f7edf66412209aba78aa086e65dc75e Mon Sep 17 00:00:00 2001
+From a84184c98cf296954e0c757604e969b8565eb474 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
  qemu-system-mips
 
-Upstream-Status: Inappropriate - OE uses deep paths
+Upstream-Status: Inappropriate [OE uses deep paths]
 
 If you create a project with very long directory names like 128 characters
 deep and use NFS, the kernel arguments will be truncated. The kernel will
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index cbdbb2105..62681fdae 100644
+index 812ff64d8..daf929943 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -65,7 +65,7 @@
+@@ -66,7 +66,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index bfc85f4842..ad00f24482 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 945af9ecc80653955cbdbb7d3e28dce61795b251 Mon Sep 17 00:00:00 2001
+From 0a688e763d91c2e0e11cbe960f405442a9f35417 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index aad253a..212b01f 100644
+index 8766ed00b..581fc6deb 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
  {
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index 2e738abaa3..4b6ac54445 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From f8c1614b204c1d64af906dc70dbf4a1534eb6b38 Mon Sep 17 00:00:00 2001
+From b38315a5a6f9fc033c72bb94ff258bb4b1ac8dd3 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index c236b2834..2a3527a87 100644
+index f4b74ad35..3da51ea83 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -119,7 +119,9 @@
+@@ -117,7 +117,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index ffbbb1ab32..59236999f9 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 3621615790270449bf9c8a0777e8ef28eb762bf9 Mon Sep 17 00:00:00 2001
+From e4abb937ba5a6a476d31886e71e67006df22a664 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
@@ -16,32 +16,24 @@ A better return value for the other cases of invalid addresses is EINVAL
 rather than ENOMEM so adjust the other part of the test to this.
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01355.html]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
- linux-user/mmap.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
+ linux-user/mmap.c | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index 002e1e668..912839dec 100644
+index b635b6a21..a5a617516 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1113,6 +1113,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
--    if (!guest_range_valid_untagged(old_addr, old_size) ||
--        ((flags & MREMAP_FIXED) &&
 +    if (!guest_range_valid_untagged(old_addr, old_size)) {
 +        errno = EFAULT;
 +        return -1;
 +    }
-+    
-+    if (((flags & MREMAP_FIXED) &&
++
+     if (((flags & MREMAP_FIXED) &&
           !guest_range_valid_untagged(new_addr, new_size)) ||
          ((flags & MREMAP_MAYMOVE) == 0 &&
-          !guest_range_valid_untagged(old_addr, new_size))) {
--        errno = ENOMEM;
-+        errno = EINVAL;
-         return -1;
-     }
- 
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 5b24c18916..0d7974fcdc 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 8b28a9376074067bc2d84d4f77d5c7a42433b31b Mon Sep 17 00:00:00 2001
+From e891928d2248e186c65979cf5a2ba0cff9d00824 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
@@ -11,6 +11,8 @@ meson to pass relative paths but we can fix that in the script.
 
 Upstream-Status: Pending [some version of all/part of this may be accepted]
 RP 2021/3/1
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
  scripts/decodetree.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index a58c936d06..275c500894 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 097b75ad8310143decab92f6d1744144e7a4809f Mon Sep 17 00:00:00 2001
+From ac9a866ac807cb1542f26df07b4aad3a06342a99 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index d5248ae51..2c581f055 100644
+index 41e8b06c3..ce5df4957 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -127,17 +127,17 @@ endif
+@@ -124,17 +124,17 @@ endif
  
  if have_system
    tests += {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index af0eafb65f..f6e563ad80 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9d5deb767523ea0d1aeecb9960244c702530acad Mon Sep 17 00:00:00 2001
+From c0bfd2c5556afcf4413c81b3fda54a62f2bdd8c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index db88766cf6..430b1aa509 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From aaec67c133dddda7204d23964732b4b788cbc9ce Mon Sep 17 00:00:00 2001
+From e357ac91b04f733148defe8c133ae8b2085a9a23 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -13,10 +13,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 82cace1..83bbda9 100755
+index eea903067..217af781f 100755
 --- a/configure
 +++ b/configure
-@@ -993,10 +993,7 @@ get_pwd() {
+@@ -981,10 +981,7 @@ get_pwd() {
      fi
  }
  
@@ -26,5 +26,5 @@ index 82cace1..83bbda9 100755
 -fi
 +meson=`which meson`
  
- # Conditionally ensure Sphinx is installed.
- 
+ # On Haiku, meson might show up in a "non-packaged" subfolder instead, see
+ # https://github.com/haiku/haiku/blob/r1beta5/docs/user/storage/storageintro.dox
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index d04596d313..040931a941 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From c9f174b2f7b43e59e91f88c75c8b3e2ee30bfcdd Mon Sep 17 00:00:00 2001
+From 70fa360e5bf72b28960747da47d9b85e650ad312 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 84e429409..1a9585e8e 100755
+index 217af781f..cf8666337 100755
 --- a/configure
 +++ b/configure
-@@ -981,14 +981,14 @@ python="$(command -v "$python")"
+@@ -951,14 +951,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
@@ -47,5 +47,5 @@ index 84e429409..1a9585e8e 100755
 -mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
 +mkvenv=true
  
- # Finish preparing the virtual environment using vendored .whl files
- 
+ # Finish preparing the virtual environment using vendored .whl files.
+ # Even if PyPI is allowed, we disallow it here to force installation
diff --git a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
new file mode 100644
index 0000000000..3dfc70dad6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
@@ -0,0 +1,36 @@
+From: Quan Sun <Quan.Sun@windriver.com>
+Subject: [PATCH] meson: fix close_range detection on older glibc
+
+The has_function('close_range') check succeeds at link time on hosts
+with kernel >= 5.9 even when glibc does not declare the function
+(glibc < 2.34, e.g. AlmaLinux 8 / CentOS 8 with glibc 2.28). This
+causes CONFIG_CLOSE_RANGE to be set, but compilation then fails with:
+
+  error: implicit declaration of function 'close_range' [-Wimplicit-function-declaration]
+
+Fix by adding a prefix that includes <unistd.h>, so the meson check
+only succeeds when the C library actually declares close_range() in
+its headers. When the check fails, the existing fallback path in
+oslib-posix.c (which returns false and falls through to the /proc
+based fd closing) is used instead.
+
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20260522201850.1342167-1-Quan.Sun@windriver.com/]
+
+Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index cf634dfcd8..a1b2c3d4e5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2632,6 +2632,7 @@ endif
+
+ # has_function
+-config_host_data.set('CONFIG_CLOSE_RANGE', cc.has_function('close_range'))
++config_host_data.set('CONFIG_CLOSE_RANGE',
++                     cc.has_function('close_range', prefix: '#include <unistd.h>'))
+ config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
+ config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
+ config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
diff --git a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
new file mode 100644
index 0000000000..ea37d20d87
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
@@ -0,0 +1,35 @@
+From: Quan Sun <Quan.Sun@windriver.com>
+Subject: [PATCH] hw/scsi/vhost-scsi: fix build with older kernel headers
+
+On build hosts with kernel headers older than 6.0, the system's
+<linux/vhost_types.h> does not define struct vhost_vring_worker or
+struct vhost_worker_state, causing compilation of vhost-scsi.c to
+fail:
+
+  error: storage size of 'vq_worker' isn't known
+
+Fix by including standard-headers/linux/vhost_types.h before the
+system's <linux/vhost.h>, matching the existing pattern used in
+hw/virtio/vhost-backend.c. QEMU's bundled header provides the
+struct definitions, and its include guard prevents redefinition
+when the system header pulls in its own vhost_types.h.
+
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20260525182730.4098543-1-Quan.Sun@windriver.com/]
+
+Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
+---
+ hw/scsi/vhost-scsi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
+index 699863cc10..10e8fbe503 100644
+--- a/hw/scsi/vhost-scsi.c
++++ b/hw/scsi/vhost-scsi.c
+@@ -15,6 +15,7 @@
+  */
+
+ #include "qemu/osdep.h"
++#include "standard-headers/linux/vhost_types.h"
+ #include <linux/vhost.h>
+ #include <sys/ioctl.h>
+ #include "qapi/error.h"
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
deleted file mode 100644
index 524e20a3dd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 475dbdbee7ff878d113f45a1a623e9abbf0e55f3 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 18 Sep 2024 16:19:37 -0700
-Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
-
-strerrorname_np is non-portable and breaks building with musl libc.
-
-Use strerror(errno) instead, like we do other places.
-
-Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stable/2023-12/msg00069.html]
-
-Cc: qemu-stable@nongnu.org
-Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error
-msg)
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
-Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
- target/riscv/kvm/kvm-cpu.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index e06d2126b..e1cc02fba 100644
---- a/target/riscv/kvm/kvm-cpu.c
-+++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1994,8 +1994,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
-     if (riscv_has_ext(&cpu->env, RVV)) {
-         ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
-         if (ret) {
--            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, code: %s",
--                       strerrorname_np(errno));
-+            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, error %d", errno);
-             return false;
-         }
-     }
diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-devtools/qemu/qemu_11.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.0.bb
-- 
2.47.3


