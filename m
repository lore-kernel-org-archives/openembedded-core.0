Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1862AC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 21:56:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9390.1714600610518903516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 14:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XTolcyo9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ebso40609025e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 14:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714600609; x=1715205409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFArGHfdF9ADojWENb3+CAkeOAIzAT4UU3bEgMJdjCs=;
        b=XTolcyo9ZpXvznvhrZwr1RYfKzjrj8Z+r8cUhzAEC9i3XYbxl6uMgMO8doQDVVXr1T
         PLwZRErWJ7r8A71Syhf0n7OsvAb2Yb2T79dropIYAuwB0jG4+T5vnZGn21hQSd9k9lc4
         9MBzlC0EiPRYCUsvci92Rsos1BZV0DVmKg1rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714600609; x=1715205409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFArGHfdF9ADojWENb3+CAkeOAIzAT4UU3bEgMJdjCs=;
        b=fZpcNBFahRXh7Ctx60JsjFawr92EHDYpog53nfMITBMTI3o47/ktixQFT3OL8QHuMN
         PEBr03m3Iot73lGHUUsLRwT0jAA/KI2TaKA5gVIyln56ux4JqLdYdWIiFKmIX+n/US0N
         1XH788eBU7bZK/ZKqyUqvfe8HciSfepM93GWuSMHVLWSJHZsvK/i8eV6zB8tqtQL8cGY
         Ubf+xm2CVpnEPTw/EwXsgCi5DvmJqWcjSjQzuN/YZxRO3XN0GHEw0xsTZgdW6OMsMV+a
         LmrE6i5j8G20mL3tPy2c2utKn1RPFeQUL5bLvoqRCniROdJ970bcYX05ERf0yJMOmdXk
         f81Q==
X-Gm-Message-State: AOJu0YxCDb4EBHboQTGiolHdzA4g1v7Ef+9VpJDkVe7Xawv9iJ3w+eHq
	bP4NpSEmJn9z7GBDngSvmg24geWYnSd/j84P4FS1U+lbADbZfQeWXq+oL6Uc52lPuRhJWjMaPsB
	IHPM=
X-Google-Smtp-Source: AGHT+IF9EcYpIfrvzswoHlELLkQi4L0xX74wJkoNAFHn8wgAL//I6M+RhPNQaDDblTlSwJWi6W5CTQ==
X-Received: by 2002:a05:600c:4751:b0:419:e773:9052 with SMTP id w17-20020a05600c475100b00419e7739052mr231485wmo.14.1714600607051;
        Wed, 01 May 2024 14:56:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e92c:f8cd:59ee:48e5])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b0041a49b10a13sm3406986wmo.11.2024.05.01.14.56.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 14:56:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] recipes: Update WORKDIR references to UNPACKDIR
Date: Wed,  1 May 2024 22:56:43 +0100
Message-Id: <20240501215643.3386307-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
References: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198892

Since we want to be able to stop unpacking to WORKDIR, correct the WORKDIR
references in recipe do_compile/do_install tasks to use UNPACKDIR in the
appropraite places instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fortran/fortran-helloworld.bb             |  2 +-
 .../selftest-recipetool-appendfile.bb         | 16 +++----
 .../wrapper/cmdline-shebang-wrapper-test.bb   |  2 +-
 meta/recipes-bsp/acpid/acpid.inc              |  4 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |  4 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  4 +-
 .../recipes-connectivity/bind/bind_9.18.26.bb |  6 +--
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +-
 .../connman/connman-gnome_0.7.bb              |  2 +-
 meta/recipes-connectivity/connman/connman.inc |  2 +-
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  2 +-
 .../inetutils/inetutils_2.5.bb                | 10 ++--
 meta/recipes-connectivity/kea/kea_2.4.1.bb    |  4 +-
 meta/recipes-connectivity/neard/neard_0.19.bb |  2 +-
 .../nfs-utils/nfs-utils_2.6.4.bb              | 14 +++---
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  2 +-
 .../openssh/openssh_9.7p1.bb                  |  4 +-
 .../openssl/openssl_3.3.0.bb                  |  2 +-
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    | 22 ++++-----
 .../resolvconf/resolvconf_1.92.bb             |  2 +-
 .../ssh-pregen-hostkeys_1.0.bb                |  4 +-
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  8 ++--
 meta/recipes-core/busybox/busybox.inc         | 46 +++++++++----------
 meta/recipes-core/dbus/dbus_1.14.10.bb        |  4 +-
 .../recipes-core/dropbear/dropbear_2024.84.bb | 12 ++---
 meta/recipes-core/glibc/glibc-package.inc     |  6 +--
 .../glibc/glibc-y2038-tests_2.39.bb           |  2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.41.bb |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 meta/recipes-core/readline/readline.inc       |  4 +-
 meta/recipes-core/seatd/seatd_0.8.0.bb        |  2 +-
 meta/recipes-core/systemd/systemd-conf_1.0.bb | 10 ++--
 meta/recipes-core/systemd/systemd_255.4.bb    | 14 +++---
 meta/recipes-core/sysvinit/sysvinit_3.04.bb   | 10 ++--
 meta/recipes-core/udev/eudev_3.2.14.bb        |  4 +-
 .../util-linux/util-linux_2.39.3.bb           |  8 ++--
 .../bootchart2/bootchart2_0.14.9.bb           |  2 +-
 .../cmake/cmake-native_3.28.3.bb              |  4 +-
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |  8 ++--
 meta/recipes-devtools/distcc/distcc_3.4.bb    |  6 +--
 .../gnu-config/gnu-config_git.bb              |  2 +-
 .../nativesdk-icecc-toolchain_0.1.bb          |  6 +--
 meta/recipes-devtools/llvm/llvm_git.bb        |  2 +-
 meta/recipes-devtools/lua/lua_5.4.6.bb        |  4 +-
 meta/recipes-devtools/meson/meson_1.3.1.bb    |  8 ++--
 meta/recipes-devtools/opkg/opkg_0.6.3.bb      |  2 +-
 .../recipes-devtools/pkgconf/pkgconf_2.2.0.bb |  6 +--
 .../pkgconfig/pkgconfig_git.bb                |  4 +-
 meta/recipes-devtools/pseudo/pseudo.inc       |  4 +-
 .../recipes-devtools/python/python3_3.12.3.bb |  7 +--
 .../qemu/qemu-system-native_8.2.1.bb          |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  4 +-
 meta/recipes-devtools/repo/repo_2.45.bb       |  2 +-
 meta/recipes-devtools/rsync/rsync_3.3.0.bb    |  2 +-
 .../tcf-agent/tcf-agent_git.bb                |  4 +-
 meta/recipes-extended/at/at_3.2.5.bb          |  8 ++--
 meta/recipes-extended/bc/bc_1.07.1.bb         |  2 +-
 meta/recipes-extended/cronie/cronie_1.7.2.bb  |  6 +--
 meta/recipes-extended/cups/cups.inc           |  4 +-
 .../iptables/iptables_1.8.10.bb               |  8 ++--
 .../lighttpd/lighttpd_1.4.76.bb               |  6 +--
 meta/recipes-extended/man-db/man-db_2.12.1.bb |  2 +-
 meta/recipes-extended/mdadm/mdadm_4.3.bb      |  2 +-
 meta/recipes-extended/pam/libpam_1.6.1.bb     |  6 +--
 meta/recipes-extended/procps/procps_4.0.4.bb  |  2 +-
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  4 +-
 meta/recipes-extended/screen/screen_4.9.1.bb  |  2 +-
 meta/recipes-extended/shadow/shadow.inc       |  8 ++--
 meta/recipes-extended/sudo/sudo_1.9.15p5.bb   |  2 +-
 .../sysklogd/sysklogd_2.5.2.bb                |  2 +-
 .../sysstat/sysstat_12.7.5.bb                 |  4 +-
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |  4 +-
 .../watchdog/watchdog-config.bb               |  4 +-
 .../watchdog/watchdog_5.16.bb                 |  4 +-
 .../xinetd/xinetd_2.3.15.4.bb                 |  6 +--
 .../matchbox-wm/matchbox-wm_1.2.3.bb          |  2 +-
 .../ttf-fonts/liberation-fonts_2.1.5.bb       |  2 +-
 .../recipes-graphics/wayland/weston_13.0.0.bb |  8 ++--
 .../xinput-calibrator_git.bb                  |  2 +-
 .../dtc/python3-dtschema-wrapper_2021.10.bb   |  6 +--
 .../kexec/kexec-tools_2.0.28.bb               |  8 ++--
 meta/recipes-kernel/kmod/kmod_31.bb           |  2 +-
 .../lttng/lttng-tools_2.13.13.bb              |  2 +-
 .../gstreamer/gst-examples_1.18.6.bb          |  2 +-
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 .../matchbox-desktop/matchbox-desktop_2.3.bb  |  2 +-
 .../matchbox-keyboard_0.1.1.bb                |  2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb    |  2 +-
 .../rxvt-unicode/rxvt-unicode.inc             |  4 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |  2 +-
 .../rng-tools/rng-tools_6.16.bb               |  6 +--
 .../user-creation/xuser-account_0.1.bb        |  2 +-
 92 files changed, 234 insertions(+), 233 deletions(-)

diff --git a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
index 3a464044775..a8979666084 100644
--- a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
+++ b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
@@ -11,7 +11,7 @@ SECURITY_CFLAGS = ""
 SECURITY_LDFLAGS = ""
 
 do_compile() {
-	${FC} ${LDFLAGS} ${WORKDIR}/hello.f95 -o ${B}/fortran-hello
+	${FC} ${LDFLAGS} ${UNPACKDIR}/hello.f95 -o ${B}/fortran-hello
 }
 
 do_install() {
diff --git a/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
index e127b48b152..7698413d4d9 100644
--- a/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
+++ b/meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
@@ -17,20 +17,20 @@ SRC_URI = "file://installscript.sh \
 EXCLUDE_FROM_WORLD = "1"
 
 install_extrafunc() {
-	install -m 0644 ${WORKDIR}/selftest-replaceme-inst-func ${D}${datadir}/selftest-replaceme-inst-func
+	install -m 0644 ${UNPACKDIR}/selftest-replaceme-inst-func ${D}${datadir}/selftest-replaceme-inst-func
 }
 
 do_install() {
 	install -d ${D}${datadir}/
-	install -m 0644 ${WORKDIR}/selftest-replaceme-orig ${D}${datadir}/selftest-replaceme-orig
-	install -m 0644 ${WORKDIR}/selftest-replaceme-todir ${D}${datadir}
-	install -m 0644 ${WORKDIR}/file1 ${D}${datadir}/selftest-replaceme-renamed
-	install -m 0644 ${WORKDIR}/subdir/fileinsubdir ${D}${datadir}/selftest-replaceme-subdir
-	cp ${WORKDIR}/selftest-replaceme-inst-glob* ${D}${datadir}/selftest-replaceme-inst-globfile
-	cp ${WORKDIR}/selftest-replaceme-inst-todir-glob* ${D}${datadir}
+	install -m 0644 ${UNPACKDIR}/selftest-replaceme-orig ${D}${datadir}/selftest-replaceme-orig
+	install -m 0644 ${UNPACKDIR}/selftest-replaceme-todir ${D}${datadir}
+	install -m 0644 ${UNPACKDIR}/file1 ${D}${datadir}/selftest-replaceme-renamed
+	install -m 0644 ${UNPACKDIR}/subdir/fileinsubdir ${D}${datadir}/selftest-replaceme-subdir
+	cp ${UNPACKDIR}/selftest-replaceme-inst-glob* ${D}${datadir}/selftest-replaceme-inst-globfile
+	cp ${UNPACKDIR}/selftest-replaceme-inst-todir-glob* ${D}${datadir}
 	install -d ${D}${sysconfdir}
 	install -m 0644 ${S}/file2 ${D}${sysconfdir}/selftest-replaceme-patched
-	sh ${WORKDIR}/installscript.sh ${D}${datadir}
+	sh ${UNPACKDIR}/installscript.sh ${D}${datadir}
 	install_extrafunc
 }
 
diff --git a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
index c3d3548d4a7..c91d00c8d93 100644
--- a/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
+++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
@@ -9,7 +9,7 @@ EXCLUDE_FROM_WORLD = "1"
 do_install() {
     install -d ${D}${bindir}
     # was not able to make ownership preservation check
-    install -m 0400 ${WORKDIR}/test.awk ${D}${bindir}/test
+    install -m 0400 ${UNPACKDIR}/test.awk ${D}${bindir}/test
 
     perm_old="$(stat --format='%a' ${D}${bindir}/test)"
     sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 7b2f1c71c59..3d6f75f90f8 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -27,13 +27,13 @@ SYSTEMD_SERVICE:${PN} = "acpid.service"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/init.d
-	sed -e 's,/usr/sbin,${sbindir},g' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/acpid
+	sed -e 's,/usr/sbin,${sbindir},g' ${UNPACKDIR}/init > ${D}${sysconfdir}/init.d/acpid
 	chmod 755 ${D}${sysconfdir}/init.d/acpid
 
 	install -d ${D}${sysconfdir}/acpi
 	install -d ${D}${sysconfdir}/acpi/events
 
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/acpid.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/acpid.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/acpid.service
 }
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f5b43f6e365..3a7afb81c85 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -157,9 +157,9 @@ do_install () {
         fi
     fi
 
-    if [ -e ${WORKDIR}/fw_env.config ] ; then
+    if [ -e ${UNPACKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
-        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+        install -m 644 ${UNPACKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
     fi
 
     if [ -n "${SPL_BINARY}" ]
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 1f18d4491d1..a78e776a184 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -184,8 +184,8 @@ SYSTEMD_SERVICE:${PN}-dnsconfd = "avahi-dnsconfd.service"
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/udhcpc.d
-	install ${WORKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
-	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
+	install ${UNPACKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
+	install ${UNPACKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 }
 
 # At the time the postinst runs, dbus might not be setup so only restart if running 
diff --git a/meta/recipes-connectivity/bind/bind_9.18.26.bb b/meta/recipes-connectivity/bind/bind_9.18.26.bb
index 2784f3bdd94..b99f92537c0 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.26.bb
@@ -68,15 +68,15 @@ do_install:append() {
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
-	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
+	install -m 755 ${UNPACKDIR}/generate-rndc-key.sh ${D}${sbindir}
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/named.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
 	       ${D}${systemd_system_unitdir}/named.service
 
 	install -d ${D}${sysconfdir}/default
-	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
+	install -m 0644 ${UNPACKDIR}/bind9 ${D}${sysconfdir}/default
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a31d7076ba8..a1ffdeef8cc 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -85,7 +85,7 @@ NOINST_TOOLS = " \
 
 do_install:append() {
 	install -d ${D}${INIT_D_DIR}
-	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
+	install -m 0755 ${UNPACKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
 	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
 		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index fcd154b4b00..f6150d98ec9 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -26,5 +26,5 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 RDEPENDS:${PN} = "connman"
 
 do_install:append() {
-    install -m 0644 ${WORKDIR}/images/* ${D}/usr/share/icons/hicolor/22x22/apps/
+    install -m 0644 ${UNPACKDIR}/images/* ${D}/usr/share/icons/hicolor/22x22/apps/
 }
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 7487ca0d0c6..073061eeda9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -86,7 +86,7 @@ ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','sy
 do_install:append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+		install -m 0755 ${UNPACKDIR}/connman ${D}${sysconfdir}/init.d/connman
 		sed -i s%@DATADIR@%${datadir}% ${D}${sysconfdir}/init.d/connman
 	fi
 
diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 6bde9b1f515..fd193b2cff5 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -52,7 +52,7 @@ USERADD_PARAM:${PN} = "--system -d ${DBDIR} -M -s /bin/false -U dhcpcd"
 do_install:append () {
     # install systemd unit files
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/dhcpcd*.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/dhcpcd*.service ${D}${systemd_system_unitdir}
 
     chmod 700 ${D}${DBDIR}
     chown dhcpcd:dhcpcd ${D}${DBDIR}
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index 0f1a0736bd4..afb0462c617 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -80,23 +80,23 @@ do_install:append () {
     mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
     if [ -e ${D}${libexecdir}/rexecd ]; then
         mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
-        cp ${WORKDIR}/rexec.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rexec
+        cp ${UNPACKDIR}/rexec.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rexec
     fi
     if [ -e ${D}${libexecdir}/rlogind ]; then
         mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
-        cp ${WORKDIR}/rlogin.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rlogin
+        cp ${UNPACKDIR}/rlogin.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rlogin
     fi
     if [ -e ${D}${libexecdir}/rshd ]; then
         mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
-        cp ${WORKDIR}/rsh.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rsh
+        cp ${UNPACKDIR}/rsh.xinetd.inetutils ${D}/${sysconfdir}/xinetd.d/rsh
     fi
     if [ -e ${D}${libexecdir}/talkd ]; then
         mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
     fi
     mv ${D}${libexecdir}/uucpd ${D}${sbindir}/in.uucpd
     mv ${D}${libexecdir}/* ${D}${bindir}/
-    cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
-    cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
+    cp ${UNPACKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
+    cp ${UNPACKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
 
     sed -e 's,@SBINDIR@,${sbindir},g' -i ${D}/${sysconfdir}/xinetd.d/*
     if [ -e ${D}${libdir}/charset.alias ]; then
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
index 9f8758f3791..6c1e457938a 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
@@ -58,8 +58,8 @@ do_install:append() {
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${systemd_system_unitdir}
 
-    install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
-    install -m 0755 ${WORKDIR}/kea-*-server ${D}${sysconfdir}/init.d
+    install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
+    install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
index a98f436b987..94df1ac3d67 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -31,7 +31,7 @@ EXTRA_OECONF += "--enable-tools"
 do_install:append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
-		sed "s:@installpath@:${libexecdir}/nfc:" ${WORKDIR}/neard.in \
+		sed "s:@installpath@:${libexecdir}/nfc:" ${UNPACKDIR}/neard.in \
 		  > ${D}${sysconfdir}/init.d/neard
 		chmod 0755 ${D}${sysconfdir}/init.d/neard
 	fi
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 2f2644f9a83..af7a74a5fb0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -122,22 +122,22 @@ HIGH_RLIMIT_NOFILE ??= "4096"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
-	install -m 0755 ${WORKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
+	install -m 0755 ${UNPACKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
+	install -m 0755 ${UNPACKDIR}/nfscommon ${D}${sysconfdir}/init.d/nfscommon
 
-	install -m 0755 ${WORKDIR}/nfs-utils.conf ${D}${sysconfdir}
+	install -m 0755 ${UNPACKDIR}/nfs-utils.conf ${D}${sysconfdir}
 	install -m 0755 ${S}/utils/mount/nfsmount.conf ${D}${sysconfdir}
 
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${WORKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
-	install -m 0644 ${WORKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${UNPACKDIR}/nfs-server.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${UNPACKDIR}/nfs-mountd.service ${D}${systemd_system_unitdir}/
+	install -m 0644 ${UNPACKDIR}/nfs-statd.service ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
 		${D}${systemd_system_unitdir}/*.service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
+		install -m 0644 ${UNPACKDIR}/proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/
 		install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
 		ln -sf ../proc-fs-nfsd.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/proc-fs-nfsd.mount
 	fi
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index dae5cc3c25c..5e1e5f3b6a9 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -37,7 +37,7 @@ do_configure:prepend() {
 
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
+    install -m 0755 ${UNPACKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
 }
 
 PACKAGES =+ "${PN}-tests"
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index d1468c59fc4..36ffa493983 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -102,8 +102,8 @@ CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
 
 do_configure:prepend () {
 	export LD="${CC}"
-	install -m 0644 ${WORKDIR}/sshd_config ${B}/
-	install -m 0644 ${WORKDIR}/ssh_config ${B}/
+	install -m 0644 ${UNPACKDIR}/sshd_config ${B}/
+	install -m 0644 ${UNPACKDIR}/ssh_config ${B}/
 }
 
 do_compile_ptest() {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
index 2cdaf4c75d5..66cb361baa9 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
@@ -181,7 +181,7 @@ do_install:append:class-native () {
 
 do_install:append:class-nativesdk () {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	install -m 644 ${UNPACKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 	sed 's|/usr/lib/ssl/|/usr/lib/ssl-3/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
index 5f0c75de835..36e2585de42 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
@@ -35,20 +35,20 @@ do_install:append () {
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
 	mkdir -p ${D}${sysconfdir}/ppp/ip-up.d/
 	mkdir -p ${D}${sysconfdir}/ppp/ip-down.d/
-	install -m 0755 ${WORKDIR}/pon ${D}${bindir}/pon
-	install -m 0755 ${WORKDIR}/poff ${D}${bindir}/poff
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ppp
-	install -m 0755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/
-	install -m 0755 ${WORKDIR}/ip-down ${D}${sysconfdir}/ppp/
-	install -m 0755 ${WORKDIR}/08setupdns ${D}${sysconfdir}/ppp/ip-up.d/
-	install -m 0755 ${WORKDIR}/92removedns ${D}${sysconfdir}/ppp/ip-down.d/
+	install -m 0755 ${UNPACKDIR}/pon ${D}${bindir}/pon
+	install -m 0755 ${UNPACKDIR}/poff ${D}${bindir}/poff
+	install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/ppp
+	install -m 0755 ${UNPACKDIR}/ip-up ${D}${sysconfdir}/ppp/
+	install -m 0755 ${UNPACKDIR}/ip-down ${D}${sysconfdir}/ppp/
+	install -m 0755 ${UNPACKDIR}/08setupdns ${D}${sysconfdir}/ppp/ip-up.d/
+	install -m 0755 ${UNPACKDIR}/92removedns ${D}${sysconfdir}/ppp/ip-down.d/
 	mkdir -p ${D}${sysconfdir}/chatscripts
 	mkdir -p ${D}${sysconfdir}/ppp/peers
-	install -m 0755 ${WORKDIR}/pap ${D}${sysconfdir}/chatscripts
-	install -m 0755 ${WORKDIR}/ppp_on_boot ${D}${sysconfdir}/ppp/ppp_on_boot
-	install -m 0755 ${WORKDIR}/provider ${D}${sysconfdir}/ppp/peers/provider
+	install -m 0755 ${UNPACKDIR}/pap ${D}${sysconfdir}/chatscripts
+	install -m 0755 ${UNPACKDIR}/ppp_on_boot ${D}${sysconfdir}/ppp/ppp_on_boot
+	install -m 0755 ${UNPACKDIR}/provider ${D}${sysconfdir}/ppp/peers/provider
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/ppp@.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/ppp@.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 	       ${D}${systemd_system_unitdir}/ppp@.service
 }
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
index 226cb7ee770..c3ce5bc22e0 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
@@ -29,7 +29,7 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/99_resolvconf ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${UNPACKDIR}/99_resolvconf ${D}${sysconfdir}/default/volatiles
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/${BPN}/interface - - - -" \
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
index ddd10e6eeba..ede18a00317 100644
--- a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
@@ -10,10 +10,10 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 do_install () {
 	install -d ${D}${sysconfdir}/dropbear
-	install ${WORKDIR}/dropbear_rsa_host_key -m 0600 ${D}${sysconfdir}/dropbear/
+	install ${UNPACKDIR}/dropbear_rsa_host_key -m 0600 ${D}${sysconfdir}/dropbear/
 
 	install -d ${D}${sysconfdir}/ssh
-	install ${WORKDIR}/openssh/* ${D}${sysconfdir}/ssh/
+	install ${UNPACKDIR}/openssh/* ${D}${sysconfdir}/ssh/
 	chmod 0600 ${D}${sysconfdir}/ssh/*
 	chmod 0644 ${D}${sysconfdir}/ssh/*.pub
 }
\ No newline at end of file
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 22028ce9575..8113bcab094 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -62,15 +62,15 @@ do_install () {
 	oe_runmake -C wpa_supplicant DESTDIR="${D}" install
 
 	install -d ${D}${docdir}/wpa_supplicant
-	install -m 644 wpa_supplicant/README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
+	install -m 644 wpa_supplicant/README ${UNPACKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
 
 	install -d ${D}${sysconfdir}
-	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
+	install -m 600 ${UNPACKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
 
 	install -d ${D}${sysconfdir}/network/if-pre-up.d/
 	install -d ${D}${sysconfdir}/network/if-post-down.d/
 	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
+	install -m 755 ${UNPACKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
 	ln -sf ../if-pre-up.d/wpa-supplicant ${D}${sysconfdir}/network/if-post-down.d/wpa-supplicant
 
 	install -d ${D}/${sysconfdir}/dbus-1/system.d
@@ -84,7 +84,7 @@ do_install () {
 	fi
 
 	install -d ${D}/etc/default/volatiles
-	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
+	install -m 0644 ${UNPACKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 
 	install -d ${D}${includedir}
 	install -m 0644 ${S}/src/common/wpa_ctrl.h ${D}${includedir}
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f5d7c3f9c8f..67a9111e5bd 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -114,7 +114,7 @@ do_prepare_config () {
 	export KCONFIG_NOTIMESTAMP=1
 
 	sed -e '/CONFIG_STATIC/d' \
-		< ${WORKDIR}/defconfig > ${S}/.config
+		< ${UNPACKDIR}/defconfig > ${S}/.config
 	echo "# CONFIG_STATIC is not set" >> .config
 	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
 		${S}/.config
@@ -280,67 +280,67 @@ do_install () {
 	fi
 
 	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog
-		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf
-		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
+		install -m 0755 ${UNPACKDIR}/syslog ${D}${sysconfdir}/init.d/syslog
+		install -m 644 ${UNPACKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf
+		install -m 644 ${UNPACKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
 	fi
 	if grep -q "CONFIG_CROND=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
+		install -m 0755 ${UNPACKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
 	if grep -q "CONFIG_HTTPD=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
+		install -m 0755 ${UNPACKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
 		install -d ${D}/srv/www
 	fi
 	if grep -q "CONFIG_UDHCPD=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
+		install -m 0755 ${UNPACKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
 	if grep -q "CONFIG_HWCLOCK=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
+		install -m 0755 ${UNPACKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
 	if grep -q "CONFIG_UDHCPC=y" ${B}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
-		install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
+		install -m 0755 ${UNPACKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		sed -i "s:/SBIN_DIR/:${base_sbindir}/:" ${D}${sysconfdir}/udhcpc.d/50default
-		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
+		install -m 0755 ${UNPACKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 	fi
 	if grep -q "CONFIG_INETD=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
+		install -m 0755 ${UNPACKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
 		sed -i "s:/usr/sbin/:${sbindir}/:" ${D}${sysconfdir}/init.d/inetd.${BPN}
-		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
+		install -m 0644 ${UNPACKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
 	if grep -q "CONFIG_MDEV=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
+		install -m 0755 ${UNPACKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
 		if grep "CONFIG_FEATURE_MDEV_CONF=y" ${B}/.config; then
-			install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
+			install -m 644 ${UNPACKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
 			install -d ${D}${sysconfdir}/mdev
-			install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev
-			install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
+			install -m 0755 ${UNPACKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev
+			install -m 0755 ${UNPACKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
 		fi
 	fi
 	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','busybox','true','false',d)}; then
-		install -D -m 0755 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
-		install -D -m 0755 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
-		install -D -m 0755 ${WORKDIR}/rcS.default ${D}${sysconfdir}/default/rcS
+		install -D -m 0755 ${UNPACKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
+		install -D -m 0755 ${UNPACKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
+		install -D -m 0755 ${UNPACKDIR}/rcS.default ${D}${sysconfdir}/default/rcS
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		if grep -q "CONFIG_KLOGD=y" ${B}/.config; then
 			install -d ${D}${systemd_system_unitdir}
-			sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
+			sed 's,@base_sbindir@,${base_sbindir},g' < ${UNPACKDIR}/busybox-klogd.service.in \
 			> ${D}${systemd_system_unitdir}/busybox-klogd.service
 		fi
 
 		if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
 			install -d ${D}${systemd_system_unitdir}
-			sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
+			sed 's,@base_sbindir@,${base_sbindir},g' < ${UNPACKDIR}/busybox-syslog.service.in \
 			> ${D}${systemd_system_unitdir}/busybox-syslog.service
 			if  [ ! -e ${D}${systemd_system_unitdir}/busybox-klogd.service ] ; then
 				sed -i '/klog/d' ${D}${systemd_system_unitdir}/busybox-syslog.service
 			fi
-			if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
+			if [ -f ${UNPACKDIR}/busybox-syslog.default ] ; then
 				install -d ${D}${sysconfdir}/default
-				install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
+				install -m 0644 ${UNPACKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
 			fi
 		fi
 	fi
diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
index 4fe7af7512b..6a08f6984e2 100644
--- a/meta/recipes-core/dbus/dbus_1.14.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.10.bb
@@ -129,8 +129,8 @@ do_install() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d
-		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
-		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
+		sed 's:@bindir@:${bindir}:' < ${UNPACKDIR}/dbus-1.init > ${S}/dbus-1.init.sh
+		install -m 0755 ${S}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
 		install -d ${D}${sysconfdir}/default/volatiles
 		echo "d messagebus messagebus 0755 /run/dbus none" \
 		     > ${D}${sysconfdir}/default/volatiles/99_dbus
diff --git a/meta/recipes-core/dropbear/dropbear_2024.84.bb b/meta/recipes-core/dropbear/dropbear_2024.84.bb
index 69c7b04c55f..3ea64b13d0b 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.84.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.84.bb
@@ -76,7 +76,7 @@ do_install() {
 		${D}${sbindir} \
 		${D}${localstatedir}
 
-	install -m 0644 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
+	install -m 0644 ${UNPACKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
 
 	install -m 0755 dropbearmulti ${D}${sbindir}/
 
@@ -94,18 +94,18 @@ do_install() {
 		-e 's,/usr/sbin,${sbindir},g' \
 		-e 's,/var,${localstatedir},g' \
 		-e 's,/usr/bin,${bindir},g' \
-		-e 's,/usr,${prefix},g' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/dropbear
+		-e 's,/usr,${prefix},g' ${UNPACKDIR}/init > ${D}${sysconfdir}/init.d/dropbear
 	chmod 755 ${D}${sysconfdir}/init.d/dropbear
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -d ${D}${sysconfdir}/pam.d
-		install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
+		install -m 0644 ${UNPACKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
 	fi
 
 	# deal with systemd unit files
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/dropbearkey.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/dropbear@.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/dropbear.socket ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 1ef987be0ae..0c5e3b4c3de 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -69,9 +69,9 @@ inherit multilib_header
 
 do_install() {
 	oe_runmake install_root=${D} install
-	install -Dm 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
+	install -Dm 0644 ${UNPACKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
 	install -d ${D}${localedir}
-	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
+	make -f ${UNPACKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
 	# get rid of some broken files...
 	for i in ${GLIBC_BROKEN_LOCALES}; do
 		sed -i "/$i/d" ${WORKDIR}/SUPPORTED
@@ -101,7 +101,7 @@ do_install() {
 	install -d ${D}${localstatedir}/db/nscd
 	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
 	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
-	install -m 0755 ${WORKDIR}/makedbs.sh ${D}${localstatedir}/db
+	install -m 0755 ${UNPACKDIR}/makedbs.sh ${D}${localstatedir}/db
 	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/init.d/nscd
 	sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${sysconfdir}/nscd.conf
 
diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
index be49ca4cb73..b760230aeca 100644
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
+++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
@@ -76,7 +76,7 @@ do_install_ptest_base () {
 	done
 
 	install -d ${D}${PTEST_PATH}
-	cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
+	cp ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
 
 }
 
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
index 16425ea9e43..c7004ab41df 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.41.bb
@@ -35,7 +35,7 @@ do_install () {
 
 	# If volatiles are used, then we'll also need /run/network there too.
 	install -d ${D}/etc/default/volatiles
-	install -m 0644 ${WORKDIR}/99_network ${D}/etc/default/volatiles
+	install -m 0644 ${UNPACKDIR}/99_network ${D}/etc/default/volatiles
 
 	install -m 0755 ifup ${D}${base_sbindir}/
 	ln ${D}${base_sbindir}/ifup ${D}${base_sbindir}/ifdown
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 40937098e68..c7b96bc6a7b 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -80,7 +80,7 @@ python do_compile () {
     import subprocess
 
     # Build a separate executable for each splash image
-    workdir = d.getVar('WORKDIR')
+    workdir = d.getVar('UNPACKDIR')
     convertscript = "%s/make-image-header.sh" % d.getVar('S')
     destfile = "%s/psplash-poky-img.h" % d.getVar('B')
     localfiles = d.getVar('SPLASH_LOCALPATHS').split()
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 4aefc5636d0..555bd0876f9 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -38,7 +38,7 @@ do_install:append () {
 	rmdir ${D}${datadir}/${BPN} || true
 
 	install -m 0755 -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
+	install -m 0644 ${UNPACKDIR}/inputrc ${D}${sysconfdir}/inputrc
 }
 
 BBCLASSEXTEND = "native nativesdk"
@@ -54,4 +54,4 @@ ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
 # OpenSuse injects versions into libreadline leading to conficits between our native one and theirs
 # see their spec file for where this is injected. Extra versioning is harmless so we just do the same.
 SRC_URI:append:class-native = " file://rl-native.map"
-LDFLAGS:append:class-native = " -Wl,--version-script=${WORKDIR}/rl-native.map"
+LDFLAGS:append:class-native = " -Wl,--version-script=${UNPACKDIR}/rl-native.map"
diff --git a/meta/recipes-core/seatd/seatd_0.8.0.bb b/meta/recipes-core/seatd/seatd_0.8.0.bb
index 14c5b1b7ae4..df5fe35f989 100644
--- a/meta/recipes-core/seatd/seatd_0.8.0.bb
+++ b/meta/recipes-core/seatd/seatd_0.8.0.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[systemd] = ",,systemd"
 
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
-                install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
+                install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/seatd
         fi
 }
 
diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 2355936631e..752ad7c2b7e 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -22,18 +22,18 @@ SRC_URI = "\
 "
 
 do_install() {
-	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
+	install -D -m0644 ${UNPACKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
+	install -D -m0644 ${UNPACKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
+	install -D -m0644 ${UNPACKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
 
         if ${@bb.utils.contains('PACKAGECONFIG', 'dhcp-ethernet', 'true', 'false', d)}; then
-		install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
+		install -D -m0644 ${UNPACKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
         fi
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install:append:qemuall() {
-	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
+	install -D -m0644 ${UNPACKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index f58a1bc2b6b..62842d43c88 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -293,15 +293,15 @@ do_install() {
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${nonarch_libdir}/tmpfiles.d
-	for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name "*.rules"); do
+	for rule in $(find ${UNPACKDIR} -maxdepth 1 -type f -name "*.rules"); do
 		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
 	done
 
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${nonarch_libdir}/tmpfiles.d/
+	install -m 0644 ${UNPACKDIR}/00-create-volatile.conf ${D}${nonarch_libdir}/tmpfiles.d/
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
+		install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
@@ -372,9 +372,9 @@ do_install() {
 	# request hostname changes via DBUS without elevating its privileges
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'true', 'false', d)}; then
 		install -d ${D}${systemd_system_unitdir}/systemd-hostnamed.service.d/
-		install -m 0644 ${WORKDIR}/00-hostnamed-network-user.conf ${D}${systemd_system_unitdir}/systemd-hostnamed.service.d/
+		install -m 0644 ${UNPACKDIR}/00-hostnamed-network-user.conf ${D}${systemd_system_unitdir}/systemd-hostnamed.service.d/
 		install -d ${D}${datadir}/dbus-1/system.d/
-		install -m 0644 ${WORKDIR}/org.freedesktop.hostname1_no_polkit.conf ${D}${datadir}/dbus-1/system.d/
+		install -m 0644 ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf ${D}${datadir}/dbus-1/system.d/
 	fi
 
 	# create link for existing udev rules
@@ -382,10 +382,10 @@ do_install() {
 
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
-	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
+	install -Dm 0644 ${UNPACKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
 
 	# add a profile fragment to disable systemd pager with busybox less
-	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
+	install -Dm 0644 ${UNPACKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
 
     if [ -n "${WATCHDOG_TIMEOUT}" ]; then
         sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index 6a612468f35..fb9d00891c6 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -97,18 +97,18 @@ do_install () {
 
 	sed -e \
 		's:#PSPLASH_TEXT#:${@bb.utils.contains("PACKAGECONFIG","psplash-text-updates","yes","no", d)}:g' \
-		${WORKDIR}/rcS-default > ${D}${sysconfdir}/default/rcS
+		${UNPACKDIR}/rcS-default > ${D}${sysconfdir}/default/rcS
 	chmod 0644 ${D}${sysconfdir}/default/rcS
-	install -m 0755    ${WORKDIR}/rc		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/rcS		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
+	install -m 0755    ${UNPACKDIR}/rc		${D}${sysconfdir}/init.d
+	install -m 0755    ${UNPACKDIR}/rcS		${D}${sysconfdir}/init.d
+	install -m 0755    ${UNPACKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
 	ln -sf bootlogd ${D}${sysconfdir}/init.d/stop-bootlogd
 
 	update-rc.d -r ${D} bootlogd start 07 S .
 	update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
 
 	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/01_bootlogd ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${UNPACKDIR}/01_bootlogd ${D}${sysconfdir}/default/volatiles
 
 	chown root:shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index 18696679c8e..0e5610f77c2 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -42,12 +42,12 @@ PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
+	install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/udev
 	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
 	sed -i s%@KMOD@%${base_bindir}/kmod% ${D}${sysconfdir}/init.d/udev
 
 	install -d ${D}${sysconfdir}/udev/rules.d
-	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
+	install -m 0644 ${UNPACKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
 
 	# Use classic network interface naming scheme if no 'pni-names' distro feature
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', 'false', 'true', d)}; then
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
index a3f9badbd97..2cd7750afce 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -148,7 +148,7 @@ SYSTEMD_SERVICE:${PN}-fstrim = "fstrim.timer fstrim.service"
 SYSTEMD_AUTO_ENABLE:${PN}-fstrim = "disable"
 
 do_compile:append () {
-	cp ${WORKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
+	cp ${UNPACKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
 	${CC} ${CFLAGS} ${LDFLAGS} ${S}/fcntl-lock.c -o ${B}/fcntl-lock
 }
 
@@ -194,8 +194,8 @@ do_install () {
 do_install:append:class-target () {
 	if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
 		install -d ${D}${sysconfdir}/pam.d
-		install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
-		install -m 0644 ${WORKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
+		install -m 0644 ${UNPACKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
+		install -m 0644 ${UNPACKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
 		# Required for "su -" aka "su --login" because
 		# otherwise it uses "other", which has "auth pam_deny.so"
 		# and thus prevents the operation.
@@ -322,7 +322,7 @@ do_install_ptest() {
     cp ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
     cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
     cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
-    cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
+    cp ${B}/config.h ${D}${PTEST_PATH}
 
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-ptest
 
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 4d8ce4c7414..8a211366bf1 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -132,7 +132,7 @@ do_install () {
 
     oe_runmake install NO_PYTHON_COMPILE=1
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
+    install -m 0755 ${UNPACKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
 
     echo 'EXIT_PROC="$EXIT_PROC matchbox-window-manager"' >> ${D}${sysconfdir}/bootchartd.conf
 
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
index 546d117156d..7f89441fb4b 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
@@ -54,9 +54,9 @@ do_install() {
 	# The following codes are here because eSDK needs to provide compatibilty
 	# for SDK. That is, eSDK could also be used like traditional SDK.
 	mkdir -p ${D}${datadir}/cmake
-	install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
+	install -m 644 ${UNPACKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
 	mkdir -p ${D}${base_prefix}/environment-setup.d
-	install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${base_prefix}/environment-setup.d/cmake.sh
+	install -m 644 ${UNPACKDIR}/environment.d-cmake.sh ${D}${base_prefix}/environment-setup.d/cmake.sh
 
 	# Help docs create tons of files in the native sysroot and aren't needed there
 	rm -rf ${D}${datadir}/cmake-*/Help
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
index 6a9a3266dff..9146fa8c0f9 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -48,15 +48,15 @@ EXTRA_OECMAKE=" \
 
 do_install:append:class-nativesdk() {
     mkdir -p ${D}${datadir}/cmake
-    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
+    install -m 644 ${UNPACKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
 
     mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-    install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
+    install -m 644 ${UNPACKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
 
     # install cmake-setup.py to create arch-specific toolchain cmake file from template
-    install -m 0644 ${WORKDIR}/SDKToolchainConfig.cmake.template ${D}${datadir}/cmake/
+    install -m 0644 ${UNPACKDIR}/SDKToolchainConfig.cmake.template ${D}${datadir}/cmake/
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
-    install -m 0755 ${WORKDIR}/cmake-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
+    install -m 0755 ${UNPACKDIR}/cmake-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
 }
 
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}"
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index 45fc7cde532..ab138b3ab6f 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -50,10 +50,10 @@ do_install() {
     oe_runmake 'DESTDIR=${D}'  "GZIP_BIN=gzip -n" install
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/default
-    install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
+    install -m 0755 ${UNPACKDIR}/distcc ${D}${sysconfdir}/init.d/
+    install -m 0755 ${UNPACKDIR}/default ${D}${sysconfdir}/default/distcc
     install -d ${D}${systemd_system_unitdir}/
-    install -m 0644 ${WORKDIR}/distcc.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/distcc.service ${D}${systemd_system_unitdir}
     sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/distcc.service
 }
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index f9d864b9876..95a7d5485ba 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -24,7 +24,7 @@ do_compile[noexec] = "1"
 do_install () {
 	install -d ${D}${datadir}/gnu-config \
 		   ${D}${bindir}
-	cat ${WORKDIR}/gnu-configize.in | \
+	cat ${UNPACKDIR}/gnu-configize.in | \
 		sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
 		    -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > ${D}${bindir}/gnu-configize
 	# In the native case we want the system perl as perl-native can't have built yet
diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
index 034a0047d7c..d03d8adcb0f 100644
--- a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
+++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
@@ -3,7 +3,7 @@
 SUMMARY = "Generates Icecream toolchain for SDK"
 DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/icecc-env.sh;beginline=2;endline=20;md5=dd6b68c1efed8a9fb04e409b3b287d47"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/icecc-env.sh;beginline=2;endline=20;md5=dd6b68c1efed8a9fb04e409b3b287d47"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -23,12 +23,12 @@ do_install() {
     install -d ${D}${SDKPATHNATIVE}${datadir}/icecream/bin
 
     install -d ${D}${SDKPATHNATIVE}/environment-setup.d/
-    install -m 0644 ${WORKDIR}/icecc-env.sh ${D}${SDKPATHNATIVE}/environment-setup.d/
+    install -m 0644 ${UNPACKDIR}/icecc-env.sh ${D}${SDKPATHNATIVE}/environment-setup.d/
     sed -i ${D}${SDKPATHNATIVE}/environment-setup.d/icecc-env.sh \
         -e 's,@TOOLCHAIN_ENV@,${ENV_NAME},g'
 
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
-    install -m 0755 ${WORKDIR}/icecc-setup.sh ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
+    install -m 0755 ${UNPACKDIR}/icecc-setup.sh ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
     sed -i ${D}${SDKPATHNATIVE}/post-relocate-setup.d/icecc-setup.sh \
         -e 's,@TOOLCHAIN_ENV@,${ENV_NAME},g'
 }
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index e7fa88b30e6..296180ea451 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -134,7 +134,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 0755 ${UNPACKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtools/lua/lua_5.4.6.bb
index eabfc895754..65f19ae2479 100644
--- a/meta/recipes-devtools/lua/lua_5.4.6.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.6.bb
@@ -44,8 +44,8 @@ do_install () {
         install
     install -d ${D}${libdir}/pkgconfig
 
-    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
-    install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
+    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
+    install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
     rmdir ${D}${datadir}/lua/5.4
     rmdir ${D}${datadir}/lua
 }
diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-devtools/meson/meson_1.3.1.bb
index 9cc0cc31ab1..3d2eedca10a 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.1.bb
@@ -132,11 +132,11 @@ do_install:append:class-nativesdk() {
     install_templates
 
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
-    install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
+    install -m 0755 ${UNPACKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
 
     # We need to wrap the real meson with a thin env setup wrapper.
     mv ${D}${bindir}/meson ${D}${bindir}/meson.real
-    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
+    install -m 0755 ${UNPACKDIR}/meson-wrapper ${D}${bindir}/meson
 }
 
 FILES:${PN}:append:class-nativesdk = "${datadir}/meson ${SDKPATHNATIVE}"
@@ -149,10 +149,10 @@ do_install:append:class-native() {
     install_templates
 
     install -d ${D}${datadir}/post-relocate-setup.d
-    install -m 0755 ${WORKDIR}/meson-setup.py ${D}${datadir}/post-relocate-setup.d/
+    install -m 0755 ${UNPACKDIR}/meson-setup.py ${D}${datadir}/post-relocate-setup.d/
 
     # We need to wrap the real meson with a thin wrapper that substitues native/cross files
     # when running in a direct SDK environment.
     mv ${D}${bindir}/meson ${D}${bindir}/meson.real
-    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
+    install -m 0755 ${UNPACKDIR}/meson-wrapper ${D}${bindir}/meson
 }
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.3.bb b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
index 9592ffc5d6d..ef7c4f3a728 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
@@ -47,7 +47,7 @@ EXTRA_OECONF:append:class-native = " --localstatedir=/${@os.path.relpath('${loca
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/opkg
-	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
+	install -m 0644 ${UNPACKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
 	echo "option lists_dir   ${OPKGLIBDIR}/opkg/lists"  >>${D}${sysconfdir}/opkg/opkg.conf
 	echo "option info_dir    ${OPKGLIBDIR}/opkg/info"   >>${D}${sysconfdir}/opkg/opkg.conf
 	echo "option status_file ${OPKGLIBDIR}/opkg/status" >>${D}${sysconfdir}/opkg/opkg.conf
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
index e98458ea55a..5f4ef73d435 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
@@ -29,18 +29,18 @@ EXTRA_OECONF += "--with-pkg-config-dir='${libdir}/pkgconfig:${datadir}/pkgconfig
 do_install:append () {
     # Install a wrapper which deals, as much as possible with pkgconf vs
     # pkg-config compatibility issues.
-    install -m 0755 "${WORKDIR}/pkg-config-wrapper" "${D}${bindir}/pkg-config"
+    install -m 0755 "${UNPACKDIR}/pkg-config-wrapper" "${D}${bindir}/pkg-config"
 }
 
 do_install:append:class-native () {
     # Install a pkg-config-native wrapper that will use the native sysroot instead
     # of the MACHINE sysroot, for using pkg-config when building native tools.
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
     install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
+        < ${UNPACKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
     install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 16e6c5b6099..6f13d0177ea 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -51,11 +51,11 @@ RPROVIDES:${PN} += "pkgconfig(pkg-config)"
 do_install:append:class-native () {
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
     install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
+        < ${UNPACKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
     install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
 
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 7e09b6d58c5..36283ffa74e 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -133,8 +133,8 @@ do_install:append:class-native () {
 	chrpath ${D}${bindir}/pseudo -r `chrpath ${D}${bindir}/pseudo | cut -d = -f 2 | sed s/XORIGIN/\\$ORIGIN/`
 	install -d ${D}${sysconfdir}
 	# The fallback files should never be modified
-	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
-	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
+	install -m 444 ${UNPACKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
+	install -m 444 ${UNPACKDIR}/fallback-group ${D}${sysconfdir}/group
 
 	# Two native/nativesdk entries below are the same
 	# If necessary install for the alternative machine arch.  This is only
diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.3.bb
index b49a58a1013..04558a64634 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -157,7 +157,7 @@ do_compile:prepend() {
 }
 
 do_install:prepend() {
-        ${WORKDIR}/check_build_completeness.py ${T}/log.do_compile
+        ${UNPACKDIR}/check_build_completeness.py ${T}/log.do_compile
 }
 
 do_install:append:class-target() {
@@ -197,7 +197,7 @@ do_install:append:class-native() {
 
 do_install:append() {
         for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
-            python3 ${WORKDIR}/reformat_sysconfig.py $c
+            python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.cpython*
 
@@ -284,7 +284,7 @@ py_package_preprocess () {
         # Reformat _sysconfigdata after modifying it so that it remains
         # reproducible
         for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
-            python3 ${WORKDIR}/reformat_sysconfig.py $c
+            python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
 
         # Recompile _sysconfigdata after modifying it
@@ -397,6 +397,7 @@ do_create_manifest() {
     # e.g. BerkeleyDB is an optional build dependency so it may or may not
     # be present, we must ensure it is.
 
+    cp ${UNPACKDIR}/create_manifest3.py ${WORKDIR}
     cd ${WORKDIR}
     # This needs to be executed by python-native and NOT by HOST's python
     nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
index 0634b342429..5d2fbcbc029 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
@@ -17,7 +17,7 @@ PACKAGECONFIG ??= "fdt alsa kvm pie slirp png \
 PACKAGECONFIG:remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
 
 do_install:append() {
-    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
+    install -Dm 0755 ${UNPACKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
 
     # The following is also installed by qemu-native
     rm -f ${D}${datadir}/qemu/trace-events-all
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4501f84c2be..f76cbbb5cba 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -168,11 +168,11 @@ do_install () {
 	# If we built the guest agent, also install startup/udev rules
 	if [ -e "${D}${bindir}/qemu-ga" ]; then
 		install -d ${D}${sysconfdir}/init.d/
-		install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sysconfdir}/init.d/qemu-guest-agent
+		install -m 0755 ${UNPACKDIR}/qemu-guest-agent.init ${D}${sysconfdir}/init.d/qemu-guest-agent
 		sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/qemu-guest-agent
 
 		install -d ${D}${sysconfdir}/udev/rules.d/
-		install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
+		install -m 0644 ${UNPACKDIR}/qemu-guest-agent.udev ${D}${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules
 
 		install -d ${D}${systemd_unitdir}/system/
 		install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.service ${D}${systemd_unitdir}/system
diff --git a/meta/recipes-devtools/repo/repo_2.45.bb b/meta/recipes-devtools/repo/repo_2.45.bb
index 81bf31754ba..dd12373e3ad 100644
--- a/meta/recipes-devtools/repo/repo_2.45.bb
+++ b/meta/recipes-devtools/repo/repo_2.45.bb
@@ -22,7 +22,7 @@ do_configure:prepend() {
 }
 
 do_install() {
-	install -D ${WORKDIR}/git/repo ${D}${bindir}/repo
+	install -D ${S}/repo ${D}${bindir}/repo
 }
 
 RDEPENDS:${PN} = "python3 git"
diff --git a/meta/recipes-devtools/rsync/rsync_3.3.0.bb b/meta/recipes-devtools/rsync/rsync_3.3.0.bb
index b42026331d0..a90d2887bd5 100644
--- a/meta/recipes-devtools/rsync/rsync_3.3.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.3.0.bb
@@ -61,7 +61,7 @@ do_configure:append () {
 
 do_install:append() {
 	install -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}${sysconfdir}
+	install -m 0644 ${UNPACKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 59b9d7de789..214dd4b2a8b 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -54,9 +54,9 @@ CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${WORKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-agent
+	install -m 0755 ${UNPACKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-agent
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/tcf-agent.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/tcf-agent.service
 }
 
diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index c0c876a6443..0162548d337 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -55,22 +55,22 @@ SYSTEMD_SERVICE:${PN} = "atd.service"
 do_patch[postfuncs] += "copy_posix_files"
 
 copy_posix_files() {
-    cp -f ${WORKDIR}/posixtm.[ch] ${S}
+    cp -f ${UNPACKDIR}/posixtm.[ch] ${S}
 }
 
 do_install () {
 	oe_runmake -e "IROOT=${D}" install
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/atd.init		${D}${sysconfdir}/init.d/atd
+	install -m 0755    ${UNPACKDIR}/atd.init		${D}${sysconfdir}/init.d/atd
 
 	# install systemd unit files
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/atd.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/atd.service
 
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
+		install -D -m 0644 ${UNPACKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
 	fi
         rm -f ${D}${datadir}/at/batch-job
 }
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 819da6cda68..74387c50abe 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -27,7 +27,7 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 
 do_compile:prepend() {
-    cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
+    cp -f ${UNPACKDIR}/libmath.h ${B}/bc/libmath.h
 }
 
 do_install_ptest() {
diff --git a/meta/recipes-extended/cronie/cronie_1.7.2.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
index abdaff644d6..e4711fa31ca 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -49,18 +49,18 @@ do_install:append () {
 	install -d ${D}${sysconfdir}/sysconfig/
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0644 ${S}/crond.sysconfig ${D}${sysconfdir}/sysconfig/crond
-	install -m 0755 ${WORKDIR}/crond.init ${D}${sysconfdir}/init.d/crond
+	install -m 0755 ${UNPACKDIR}/crond.init ${D}${sysconfdir}/init.d/crond
 
 	# install systemd unit files
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/crond.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
 	       ${D}${systemd_system_unitdir}/crond.service
 
 	# below are necessary for a complete cron environment
 	install -d ${D}${localstatedir}/spool/cron
-	install -m 0755 ${WORKDIR}/crontab ${D}${sysconfdir}/
+	install -m 0755 ${UNPACKDIR}/crontab ${D}${sysconfdir}/
 	mkdir -p ${D}${sysconfdir}/cron.d
 	mkdir -p ${D}${sysconfdir}/cron.hourly
 	mkdir -p ${D}${sysconfdir}/cron.daily
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b70ba3ae58c..9688efafae3 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -84,11 +84,11 @@ do_install () {
 	    rm -rf ${D}${sysconfdir}/init.d/
 	    rm -rf ${D}${sysconfdir}/rc*
 	    install -d ${D}${sysconfdir}/tmpfiles.d
-	    install -m 0644 ${WORKDIR}/cups-volatiles.conf \
+	    install -m 0644 ${UNPACKDIR}/cups-volatiles.conf \
 		    ${D}${sysconfdir}/tmpfiles.d/cups.conf
 	else
 	    install -d ${D}${sysconfdir}/default/volatiles
-	    install -m 0644 ${WORKDIR}/volatiles.99_cups \
+	    install -m 0644 ${UNPACKDIR}/volatiles.99_cups \
 		    ${D}${sysconfdir}/default/volatiles/99_cups
 	fi
 }
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index cd2f3bce0be..5a878977425 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -52,10 +52,10 @@ IPTABLES_RULES_DIR ?= "${sysconfdir}/${BPN}"
 
 do_install:append() {
     install -d ${D}${IPTABLES_RULES_DIR}
-    install -m 0644 ${WORKDIR}/iptables.rules ${D}${IPTABLES_RULES_DIR}
+    install -m 0644 ${UNPACKDIR}/iptables.rules ${D}${IPTABLES_RULES_DIR}
 
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/iptables.service ${D}${systemd_system_unitdir}
 
     sed -i \
         -e 's,@SBINDIR@,${sbindir},g' \
@@ -63,8 +63,8 @@ do_install:append() {
         ${D}${systemd_system_unitdir}/iptables.service
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', 'true', 'false', d)} ; then
-        install -m 0644 ${WORKDIR}/ip6tables.rules ${D}${IPTABLES_RULES_DIR}
-        install -m 0644 ${WORKDIR}/ip6tables.service ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/ip6tables.rules ${D}${IPTABLES_RULES_DIR}
+        install -m 0644 ${UNPACKDIR}/ip6tables.service ${D}${systemd_system_unitdir}
 
         sed -i \
             -e 's,@SBINDIR@,${sbindir},g' \
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
index f0fdda41901..153f451ea76 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
@@ -47,9 +47,9 @@ SYSTEMD_SERVICE:${PN} = "lighttpd.service"
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
-	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
-	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}/lighttpd
-	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+	install -m 0755 ${UNPACKDIR}/lighttpd ${D}${sysconfdir}/init.d
+	install -m 0644 ${UNPACKDIR}/lighttpd.conf ${D}${sysconfdir}/lighttpd
+	install -m 0644 ${UNPACKDIR}/index.html.lighttpd ${D}/www/pages/index.html
 
 	install -d ${D}${systemd_system_unitdir}
 	install -m 0644 ${S}/doc/systemd/lighttpd.service ${D}${systemd_system_unitdir}
diff --git a/meta/recipes-extended/man-db/man-db_2.12.1.bb b/meta/recipes-extended/man-db/man-db_2.12.1.bb
index 27b47a7f47b..5c6797c8f13 100644
--- a/meta/recipes-extended/man-db/man-db_2.12.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.12.1.bb
@@ -37,7 +37,7 @@ do_install() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 	        install -d ${D}/etc/default/volatiles
-		install -m 0644 ${WORKDIR}/99_mandb ${D}/etc/default/volatiles
+		install -m 0644 ${UNPACKDIR}/99_mandb ${D}/etc/default/volatiles
 	fi
 }
 
diff --git a/meta/recipes-extended/mdadm/mdadm_4.3.bb b/meta/recipes-extended/mdadm/mdadm_4.3.bb
index 228fc6f84e5..63c61b68c96 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.3.bb
@@ -61,7 +61,7 @@ do_install:append() {
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
-        install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+        install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
 }
 
 do_install:append() {
diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-extended/pam/libpam_1.6.1.bb
index 849f485f75e..9f2106ea730 100644
--- a/meta/recipes-extended/pam/libpam_1.6.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.1.bb
@@ -138,16 +138,16 @@ do_install() {
             rm -rf ${D}${sysconfdir}/init.d/
             rm -rf ${D}${sysconfdir}/rc*
             install -d ${D}${nonarch_libdir}/tmpfiles.d
-            install -m 0644 ${WORKDIR}/pam-volatiles.conf \
+            install -m 0644 ${UNPACKDIR}/pam-volatiles.conf \
                     ${D}${nonarch_libdir}/tmpfiles.d/pam.conf
         else
             install -d ${D}${sysconfdir}/default/volatiles
-            install -m 0644 ${WORKDIR}/99_pam \
+            install -m 0644 ${UNPACKDIR}/99_pam \
                     ${D}${sysconfdir}/default/volatiles/
         fi
 
 	install -d ${D}${sysconfdir}/pam.d/
-	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
+	install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
 
 	# The lsb requires unix_chkpwd has setuid permission
 	chmod 4755 ${D}${sbindir}/unix_chkpwd
diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes-extended/procps/procps_4.0.4.bb
index 800384f22f7..789e0c27475 100644
--- a/meta/recipes-extended/procps/procps_4.0.4.bb
+++ b/meta/recipes-extended/procps/procps_4.0.4.bb
@@ -41,7 +41,7 @@ do_install:append () {
         fi
 
         install -d ${D}${sysconfdir}
-        install -m 0644 ${WORKDIR}/sysctl.conf ${D}${sysconfdir}/sysctl.conf
+        install -m 0644 ${UNPACKDIR}/sysctl.conf ${D}${sysconfdir}/sysctl.conf
         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
                 install -d ${D}${sysconfdir}/sysctl.d
                 ln -sf ../sysctl.conf ${D}${sysconfdir}/sysctl.d/99-sysctl.conf
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index dbd4d32e0a0..e751eb631cd 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -46,9 +46,9 @@ do_install:append () {
 	install -d ${D}${sysconfdir}/init.d
 	sed -e 's,/etc/,${sysconfdir}/,g' \
 		-e 's,/sbin/,${sbindir}/,g' \
-		${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
+		${UNPACKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
-	install -m 0644 ${WORKDIR}/rpcbind.conf ${D}${sysconfdir}/rpcbind.conf
+	install -m 0644 ${UNPACKDIR}/rpcbind.conf ${D}${sysconfdir}/rpcbind.conf
 }
 
 ALTERNATIVE:${PN} = "rpcinfo"
diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-extended/screen/screen_4.9.1.bb
index 7b040e6b578..57d14810495 100644
--- a/meta/recipes-extended/screen/screen_4.9.1.bb
+++ b/meta/recipes-extended/screen/screen_4.9.1.bb
@@ -36,7 +36,7 @@ EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 --with-sys-screenrc=${sy
 do_install:append () {
 	install -D -m 644 ${S}/etc/etcscreenrc ${D}/${sysconfdir}/screenrc
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
+		install -D -m 644 ${UNPACKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
 	fi
 }
 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index c15715fc770..25930b64c19 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -111,7 +111,7 @@ do_install() {
 	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
 
 	install -d ${D}${sysconfdir}/default
-	install -m 0644 ${WORKDIR}/useradd ${D}${sysconfdir}/default
+	install -m 0644 ${UNPACKDIR}/useradd ${D}${sysconfdir}/default
 }
 
 do_install:append() {
@@ -121,11 +121,11 @@ do_install:append() {
 	install -m 0775 -d ${D}${localstatedir}/spool/mail
 	chown root:mail ${D}${localstatedir}/spool/mail
 
-	if [ -e ${WORKDIR}/pam.d ]; then
+	if [ -e ${UNPACKDIR}/pam.d ]; then
 		install -d ${D}${sysconfdir}/pam.d/
-		install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
+		install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
 		# Remove defaults that are not used when supporting PAM.
-		sed -i -f ${WORKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
+		sed -i -f ${UNPACKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
 	fi
 
 	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir}
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 8e542015ad5..2fd2ae6d052 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF += " \
 
 do_install:append () {
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -m 644 ${WORKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
+		install -D -m 644 ${UNPACKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
 			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
index c9c90551427..e4886030860 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
@@ -24,7 +24,7 @@ do_install:append () {
        install -d ${D}${sysconfdir}
        install -m 644 ${S}/syslog.conf ${D}${sysconfdir}/syslog.conf
        install -d ${D}${sysconfdir}/init.d
-       install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
+       install -m 755 ${UNPACKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
 }
 
 SYSTEMD_PACKAGES = "${PN}"
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.5.bb b/meta/recipes-extended/sysstat/sysstat_12.7.5.bb
index 150f4932d89..d598d5366fa 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.5.bb
@@ -45,7 +45,7 @@ do_install() {
 	rm -rf ${D}/var
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 	        install -d ${D}/etc/default/volatiles
-		install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
+		install -m 0644 ${UNPACKDIR}/99_sysstat ${D}/etc/default/volatiles
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 	        install -d ${D}${nonarch_libdir}/tmpfiles.d
@@ -56,7 +56,7 @@ do_install() {
 		# systemd unit file. Otherwise the package will install one.
 	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron systemd', 'false', 'true', d)}; then
 			install -d ${D}${systemd_system_unitdir}
-			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_system_unitdir}
+			install -m 0644 ${UNPACKDIR}/sysstat.service ${D}${systemd_system_unitdir}
 			sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_system_unitdir}/sysstat.service
 	        fi
 	fi
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index bcd1d6f7929..8cf927153f0 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -120,8 +120,8 @@ do_install () {
 		install -m 0644 $m.8 ${D}${mandir}/man8/ || exit 1
 	done
 
-	install -m 0644 ${WORKDIR}/try-from.8 ${D}${mandir}/man8/
-	install -m 0644 ${WORKDIR}/safe_finger.8 ${D}${mandir}/man8/
+	install -m 0644 ${UNPACKDIR}/try-from.8 ${D}${mandir}/man8/
+	install -m 0644 ${UNPACKDIR}/safe_finger.8 ${D}${mandir}/man8/
 
 	install -d ${D}${includedir}
 	install -m 0644 tcpd.h ${D}${includedir}/
diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
index f1389521284..e826a7d4a66 100644
--- a/meta/recipes-extended/watchdog/watchdog-config.bb
+++ b/meta/recipes-extended/watchdog/watchdog-config.bb
@@ -17,8 +17,8 @@ SRC_URI = " \
 WATCHDOG_TIMEOUT ??= ""
 
 do_install() {
-    install -Dm 0644 ${WORKDIR}/watchdog.default ${D}${sysconfdir}/default/watchdog
-    install -Dm 0644 ${WORKDIR}/watchdog.conf ${D}${sysconfdir}/watchdog.conf
+    install -Dm 0644 ${UNPACKDIR}/watchdog.default ${D}${sysconfdir}/default/watchdog
+    install -Dm 0644 ${UNPACKDIR}/watchdog.conf ${D}${sysconfdir}/watchdog.conf
 
     if [ -n "${WATCHDOG_TIMEOUT}" ]; then
         echo "watchdog-timeout = ${WATCHDOG_TIMEOUT}" >> ${D}/etc/watchdog.conf
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 5325ccafdad..c88ea08ade6 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -50,8 +50,8 @@ do_install:append() {
 	install -m 0644 ${S}/debian/watchdog.service ${D}${systemd_system_unitdir}
 	install -m 0644 ${S}/debian/wd_keepalive.service ${D}${systemd_system_unitdir}
 
-	install -Dm 0755 ${WORKDIR}/watchdog.init ${D}/${sysconfdir}/init.d/watchdog
-	install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
+	install -Dm 0755 ${UNPACKDIR}/watchdog.init ${D}/${sysconfdir}/init.d/watchdog
+	install -Dm 0755 ${UNPACKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
 
 	# watchdog.conf is provided by the watchdog-config recipe
 	rm ${D}${sysconfdir}/watchdog.conf
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 72eb1ae0676..897747379bb 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -37,12 +37,12 @@ CONFFILES:${PN} = "${sysconfdir}/xinetd.conf"
 do_install:append() {
        install -d "${D}${sysconfdir}/init.d"
        install -d "${D}${sysconfdir}/default"
-       install -m 755 "${WORKDIR}/xinetd.init" "${D}${sysconfdir}/init.d/xinetd"
-       install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
+       install -m 755 "${UNPACKDIR}/xinetd.init" "${D}${sysconfdir}/init.d/xinetd"
+       install -m 644 "${UNPACKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
 
        # Install systemd unit files
        install -d ${D}${systemd_system_unitdir}
-       install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_system_unitdir}
+       install -m 0644 ${UNPACKDIR}/xinetd.service ${D}${systemd_system_unitdir}
        sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
               -e 's,@SBINDIR@,${sbindir},g' \
               ${D}${systemd_system_unitdir}/xinetd.service
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
index 880d4ed6664..c8b6f07ed0d 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
@@ -34,5 +34,5 @@ EXTRA_OECONF = " --enable-startup-notification \
                  --with-expat-includes=${STAGING_INCDIR}"
 
 do_install:prepend() {
-	install ${WORKDIR}/kbdconfig ${S}/data/kbdconfig
+	install ${UNPACKDIR}/kbdconfig ${S}/data/kbdconfig
 }
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
index b7fdc0d399f..584a19a42a4 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
@@ -26,7 +26,7 @@ do_install () {
 	done
 
 	install -d ${D}${sysconfdir}/fonts/conf.d/
-	install -m 0644 ${WORKDIR}/30-liberation-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
+	install -m 0644 ${UNPACKDIR}/30-liberation-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 
 	install -d ${D}${prefix}/share/doc/${BPN}/
 	install -m 0644 LICENSE ${D}${datadir}/doc/${BPN}/
diff --git a/meta/recipes-graphics/wayland/weston_13.0.0.bb b/meta/recipes-graphics/wayland/weston_13.0.0.bb
index b728bd0ef3f..798cf6f19ce 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.0.bb
@@ -105,18 +105,18 @@ do_install:append() {
 	# If X11, ship a desktop file to launch it
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
 		install -d ${D}${datadir}/applications
-		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+		install ${UNPACKDIR}/weston.desktop ${D}${datadir}/applications
 
 		install -d ${D}${datadir}/icons/hicolor/48x48/apps
-		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+		install ${UNPACKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
 	fi
 
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
-		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
+		install -Dm 644 ${UNPACKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
 	fi
 
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}" = "yes" ]; then
-		install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${datadir}/weston-start/systemd-notify
+		install -Dm 644 ${UNPACKDIR}/systemd-notify.weston-start ${D}${datadir}/weston-start/systemd-notify
 	fi
 
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" = "yes" ]; then
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 7b49668f92c..0516928a76b 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -27,7 +27,7 @@ do_install:append() {
     install -m 0755 ${S}/scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
 
     install -d ${D}${sysconfdir}/X11/Xsession.d/
-    install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
+    install -m 0755 ${UNPACKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
 
     install -d ${D}${sysconfdir}/xdg/autostart
     sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
index 974fcba876a..332525f5c92 100644
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
@@ -9,9 +9,9 @@ SRC_URI = "file://dt-doc-validate \
 
 do_install() {
     install -d ${D}${bindir}/
-    install -m 755 ${WORKDIR}/dt-doc-validate ${D}${bindir}/
-    install -m 755 ${WORKDIR}/dt-mk-schema ${D}${bindir}/
-    install -m 755 ${WORKDIR}/dt-validate ${D}${bindir}/
+    install -m 755 ${UNPACKDIR}/dt-doc-validate ${D}${bindir}/
+    install -m 755 ${UNPACKDIR}/dt-mk-schema ${D}${bindir}/
+    install -m 755 ${UNPACKDIR}/dt-validate ${D}${bindir}/
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index dec821ea883..c39fff834d0 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -44,15 +44,15 @@ do_compile:prepend() {
 
 do_install:append () {
         install -d ${D}${sysconfdir}/sysconfig
-        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
+        install -m 0644 ${UNPACKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
 
         if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-                install -D -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
+                install -D -m 0755 ${UNPACKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
         fi
 
         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-                install -D -m 0755 ${WORKDIR}/kdump ${D}${libexecdir}/kdump-helper
-                install -D -m 0644 ${WORKDIR}/kdump.service ${D}${systemd_system_unitdir}/kdump.service
+                install -D -m 0755 ${UNPACKDIR}/kdump ${D}${libexecdir}/kdump-helper
+                install -D -m 0644 ${UNPACKDIR}/kdump.service ${D}${systemd_system_unitdir}/kdump.service
                 sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' ${D}${systemd_system_unitdir}/kdump.service
         fi
 }
diff --git a/meta/recipes-kernel/kmod/kmod_31.bb b/meta/recipes-kernel/kmod/kmod_31.bb
index 6ae83a7c66c..718a5565b4c 100644
--- a/meta/recipes-kernel/kmod/kmod_31.bb
+++ b/meta/recipes-kernel/kmod/kmod_31.bb
@@ -63,7 +63,7 @@ do_install:append () {
         install -dm755 ${D}${sysconfdir}/modprobe.d
 
         # install depmod.d file for search/ dir
-        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
+        install -Dm644 "${UNPACKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
 
         # Add .debug to the exclude path for depmod
         echo "exclude .debug" > ${D}${nonarch_base_libdir}/depmod.d/exclude.conf
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
index 174dec036e0..e73dd4801a6 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
@@ -69,7 +69,7 @@ PRIVATE_LIBS:${PN}-ptest = "libfoo.so"
 do_install:append () {
     # install systemd unit file
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/lttng-sessiond.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/lttng-sessiond.service ${D}${systemd_system_unitdir}
 }
 
 do_install_ptest () {
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
index 02282ac5d9a..70b72fd7fb5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 do_install:append() {
-	install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
+	install -m 0644 -D ${UNPACKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
 }
 
 RDEPENDS:${PN} = "gstreamer1.0-plugins-base-playback"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ae16056d243..9fb5c81757d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -142,7 +142,7 @@ do_compile:append () {
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/04_pulse
+	install -m 0644 ${UNPACKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/04_pulse
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index 3777f05b5a9..ab178f97e6f 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -27,7 +27,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install:append() {
     install -d ${D}${datadir}/matchbox/vfolders/
-    install -m 0644 ${WORKDIR}/vfolders/* ${D}${datadir}/matchbox/vfolders/
+    install -m 0644 ${UNPACKDIR}/vfolders/* ${D}${datadir}/matchbox/vfolders/
 }
 
 FILES:${PN} += "${datadir}/matchbox/vfolders/"
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index 6b70948f16d..a1f7862efa4 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -47,7 +47,7 @@ FILES:${PN}-applet = "${libdir}/matchbox-panel/*.so"
 
 do_install:append () {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d/
-	install -m 755 ${WORKDIR}/80matchboxkeyboard.sh ${D}/${sysconfdir}/X11/Xsession.d/
+	install -m 755 ${UNPACKDIR}/80matchboxkeyboard.sh ${D}/${sysconfdir}/X11/Xsession.d/
 
 	rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
 	rm -f ${D}${libdir}/gtk-3.0/*/immodules/*.la
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 0c5ed5e55e3..22c9fa59dcd 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -32,7 +32,7 @@ do_install:append () {
 	install -d ${D}/${datadir}
 	install -d ${D}/${datadir}/pixmaps/
 
-	install -m 0644 ${WORKDIR}/*.png ${D}/${datadir}/pixmaps
+	install -m 0644 ${UNPACKDIR}/*.png ${D}/${datadir}/pixmaps
 }
 
 FILES:${PN} += "${libdir}/pcmanfm"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 016614b19c7..95cc140e9ea 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -51,8 +51,8 @@ do_install:append () {
 	install -d ${D}/${datadir}/applications
 	install -d ${D}/${datadir}/pixmaps/
 
-	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
+	install -m 0644 ${UNPACKDIR}/rxvt.png ${D}/${datadir}/pixmaps
+	install -m 0644 ${UNPACKDIR}/rxvt.desktop ${D}/${datadir}/applications
 
 	${STAGING_BINDIR_NATIVE}/tic -x ${S}/doc/etc/rxvt-unicode.terminfo -o ${D}${datadir}/terminfo || \
 	${STAGING_BINDIR_NATIVE}/tic ${S}/doc/etc/rxvt-unicode.terminfo -o ${D}${datadir}/terminfo
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 4bdbefcb757..fb00de9bc95 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -26,5 +26,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install:append () {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d
-	install -m 755 ${WORKDIR}/70settings-daemon.sh ${D}/${sysconfdir}/X11/Xsession.d/
+	install -m 755 ${UNPACKDIR}/70settings-daemon.sh ${D}/${sysconfdir}/X11/Xsession.d/
 }
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
index f0aa3ff93f5..10771a999d2 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -50,9 +50,9 @@ do_configure:prepend() {
 }
 
 do_install:append() {
-    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
-    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-    install -Dm 0644 ${WORKDIR}/rng-tools.service \
+    install -Dm 0644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/rng-tools
+    install -Dm 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+    install -Dm 0644 ${UNPACKDIR}/rng-tools.service \
                      ${D}${systemd_system_unitdir}/rng-tools.service
     sed -i \
         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 639b01f6eb0..2bd3699e74b 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -15,7 +15,7 @@ do_compile() {
 }
 
 do_install() {
-    install -D -m 0644 ${WORKDIR}/system-xuser.conf ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
+    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
 }
 
 FILES:${PN} = "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
-- 
2.40.1


