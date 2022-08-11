Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BFBC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 19:58:21 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.2436.1660247892073097023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CCxNKuUe;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id kb8so35332391ejc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=wuRDtjwmnEv/DEUkknv6C9mF1VFKMthY8Z5Py0fVFiw=;
        b=CCxNKuUek0equzH3uY2ZCyZBsX+UOhxPN5GUiwNDbEzBr6axhftlLOv1oaHL+/MSft
         3J+PNA53i6MRsVj4KRO8FT8PfUpZ+y3cQxjYoAEcE70MsbXyyLsS3GdieWzPhLtYB/v6
         B5Pj4K2f3lRXxhz7IUDSRZwAEBg9LDPO+f2n1HM/8pm2TMxQy/Dq4WvmSfjRjC44V6ld
         9gxWoibPirhuuVEXZfCJh7MFTSF6JUiG6dKlxqVzg8k0grvdDxtw/pZr2/+LVWHp1Ngn
         f0nbuzeygeV+WNLFAzzA9rSBw5JhMCNHITW6K9xwWkv84FAZON8Q8Z9tNN65EyP/SIxu
         bZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=wuRDtjwmnEv/DEUkknv6C9mF1VFKMthY8Z5Py0fVFiw=;
        b=y+1HtxIKV8MEZWn4DCf1PfnVlljBAjPYEapcDxu6f9fTiGp81ukv3vTsJQKJrx1tDn
         g1DHmV1c0Zo717taDpsuHi3bcewJPYcbbHWTMZfmcn5044GMB0UIddiS3kRArr0iDJ1F
         CCQm4WJYX1u39e2OJ2E+VbJ6qSSqOEeRnpTgmYauyP9kFvytZ5ldHQxJzU5UIcDtyVvW
         iXYSZun+mM+DTDPeb2b/z+7wSLHPZm1HngIQVAoUzJWnV7qz94ZmtotTHkl4dFjjUoTN
         EaOp+9C9ynLveyRx+JpCUUlFbwkVbhdcAYxfUC/MY9GqUWxs62hWUHmRKch2WBEcYCCY
         IMJQ==
X-Gm-Message-State: ACgBeo0xsN22e45dnlWP7MP/fsuXt2M3MNQNhP4DihB4PQwXVia7SoqS
	tuTskhEL4DrX8Zx894zyhKCjE/A0A6Q=
X-Google-Smtp-Source: 
 AA6agR7fJK3ku9xpYkAbMnk35AW022Hwm31jlv2vk1mDoTx4sBNto+NBdSNJJDADdemGWOhon8Or7A==
X-Received: by 2002:a17:906:845c:b0:730:bbf1:196a with SMTP id
 e28-20020a170906845c00b00730bbf1196amr443512ejy.13.1660247890407;
        Thu, 11 Aug 2022 12:58:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fu18-20020a170907b01200b007308bdef04bsm22010ejc.103.2022.08.11.12.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:58:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/7] dropbear: merge .inc into .bb
Date: Thu, 11 Aug 2022 21:58:00 +0200
Message-Id: <20220811195806.1571221-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 19:58:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169263

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/dropbear/dropbear.inc       | 128 -----------------
 .../recipes-core/dropbear/dropbear_2022.82.bb | 129 +++++++++++++++++-
 2 files changed, 128 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear.inc

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
deleted file mode 100644
index e170587d08..0000000000
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ /dev/null
@@ -1,128 +0,0 @@
-SUMMARY = "A lightweight SSH and SCP implementation"
-HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
-DESCRIPTION = "Dropbear is a relatively small SSH server and client. It runs on a variety of POSIX-based platforms. Dropbear is open source software, distributed under a MIT-style license. Dropbear is particularly useful for "embedded"-type Linux (or other Unix) systems, such as wireless routers."
-SECTION = "console/network"
-
-# some files are from other projects and have others license terms:
-#   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
-LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
-
-DEPENDS = "zlib virtual/crypt"
-RPROVIDES:${PN} = "ssh sshd"
-RCONFLICTS:${PN} = "openssh-sshd openssh"
-
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
-           file://0001-urandom-xauth-changes-to-options.h.patch \
-           file://init \
-           file://dropbearkey.service \
-           file://dropbear@.service \
-           file://dropbear.socket \
-           file://dropbear.default \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
-
-PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-               file://0006-dropbear-configuration-file.patch \
-               file://dropbear"
-
-PAM_PLUGINS = "libpam-runtime \
-	pam-plugin-deny \
-	pam-plugin-permit \
-	pam-plugin-unix \
-	"
-RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-
-inherit autotools update-rc.d systemd
-
-CVE_PRODUCT = "dropbear_ssh"
-
-INITSCRIPT_NAME = "dropbear"
-INITSCRIPT_PARAMS = "defaults 10"
-
-SYSTEMD_SERVICE:${PN} = "dropbear.socket"
-
-SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
-BINCOMMANDS = "dbclient ssh scp"
-EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
-
-PACKAGECONFIG ?= "disable-weak-ciphers"
-PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
-PACKAGECONFIG[disable-weak-ciphers] = ""
-
-EXTRA_OECONF += "\
- ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
-
-# This option appends to CFLAGS and LDFLAGS from OE
-# This is causing [textrel] QA warning
-EXTRA_OECONF += "--disable-harden"
-
-# musl does not implement wtmp/logwtmp APIs
-EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
-
-do_install() {
-	install -d ${D}${sysconfdir} \
-		${D}${sysconfdir}/init.d \
-		${D}${sysconfdir}/default \
-		${D}${sysconfdir}/dropbear \
-		${D}${bindir} \
-		${D}${sbindir} \
-		${D}${localstatedir}
-
-	install -m 0644 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
-
-	install -m 0755 dropbearmulti ${D}${sbindir}/
-
-	for i in ${BINCOMMANDS}
-	do
-		# ssh and scp symlinks are created by update-alternatives
-		if [ $i = ssh ] || [ $i = scp ]; then continue; fi
-		ln -s ${sbindir}/dropbearmulti ${D}${bindir}/$i
-	done
-	for i in ${SBINCOMMANDS}
-	do
-		ln -s ./dropbearmulti ${D}${sbindir}/$i
-	done
-	sed -e 's,/etc,${sysconfdir},g' \
-		-e 's,/usr/sbin,${sbindir},g' \
-		-e 's,/var,${localstatedir},g' \
-		-e 's,/usr/bin,${bindir},g' \
-		-e 's,/usr,${prefix},g' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/dropbear
-	chmod 755 ${D}${sysconfdir}/init.d/dropbear
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -d ${D}${sysconfdir}/pam.d
-		install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
-	fi
-
-	# deal with systemd unit files
-	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_system_unitdir}
-	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-		-e 's,@BINDIR@,${bindir},g' \
-		-e 's,@SBINDIR@,${sbindir},g' \
-		${D}${systemd_system_unitdir}/dropbear.socket ${D}${systemd_system_unitdir}/*.service
-}
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "20"
-ALTERNATIVE:${PN} = "${@bb.utils.filter('BINCOMMANDS', 'scp ssh', d)}"
-
-ALTERNATIVE_TARGET = "${sbindir}/dropbearmulti"
-
-pkg_postrm:${PN} () {
-  if [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
-        rm ${sysconfdir}/dropbear/dropbear_rsa_host_key
-  fi
-  if [ -f "${sysconfdir}/dropbear/dropbear_dss_host_key" ]; then
-        rm ${sysconfdir}/dropbear/dropbear_dss_host_key
-  fi
-}
-
-CONFFILES:${PN} = "${sysconfdir}/default/dropbear"
-
-FILES:${PN} += "${bindir}"
diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.82.bb
index 154a407a19..2de243b889 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
@@ -1,3 +1,130 @@
-require dropbear.inc
+SUMMARY = "A lightweight SSH and SCP implementation"
+HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
+DESCRIPTION = "Dropbear is a relatively small SSH server and client. It runs on a variety of POSIX-based platforms. Dropbear is open source software, distributed under a MIT-style license. Dropbear is particularly useful for "embedded"-type Linux (or other Unix) systems, such as wireless routers."
+SECTION = "console/network"
+
+# some files are from other projects and have others license terms:
+#   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
+
+DEPENDS = "zlib virtual/crypt"
+RPROVIDES:${PN} = "ssh sshd"
+RCONFLICTS:${PN} = "openssh-sshd openssh"
+
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+           file://0001-urandom-xauth-changes-to-options.h.patch \
+           file://init \
+           file://dropbearkey.service \
+           file://dropbear@.service \
+           file://dropbear.socket \
+           file://dropbear.default \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
 
 SRC_URI[sha256sum] = "3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1"
+
+PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
+               file://0006-dropbear-configuration-file.patch \
+               file://dropbear"
+
+PAM_PLUGINS = "libpam-runtime \
+	pam-plugin-deny \
+	pam-plugin-permit \
+	pam-plugin-unix \
+	"
+RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
+
+inherit autotools update-rc.d systemd
+
+CVE_PRODUCT = "dropbear_ssh"
+
+INITSCRIPT_NAME = "dropbear"
+INITSCRIPT_PARAMS = "defaults 10"
+
+SYSTEMD_SERVICE:${PN} = "dropbear.socket"
+
+SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
+BINCOMMANDS = "dbclient ssh scp"
+EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
+
+PACKAGECONFIG ?= "disable-weak-ciphers"
+PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
+PACKAGECONFIG[disable-weak-ciphers] = ""
+
+EXTRA_OECONF += "\
+ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
+
+# This option appends to CFLAGS and LDFLAGS from OE
+# This is causing [textrel] QA warning
+EXTRA_OECONF += "--disable-harden"
+
+# musl does not implement wtmp/logwtmp APIs
+EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
+
+do_install() {
+	install -d ${D}${sysconfdir} \
+		${D}${sysconfdir}/init.d \
+		${D}${sysconfdir}/default \
+		${D}${sysconfdir}/dropbear \
+		${D}${bindir} \
+		${D}${sbindir} \
+		${D}${localstatedir}
+
+	install -m 0644 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
+
+	install -m 0755 dropbearmulti ${D}${sbindir}/
+
+	for i in ${BINCOMMANDS}
+	do
+		# ssh and scp symlinks are created by update-alternatives
+		if [ $i = ssh ] || [ $i = scp ]; then continue; fi
+		ln -s ${sbindir}/dropbearmulti ${D}${bindir}/$i
+	done
+	for i in ${SBINCOMMANDS}
+	do
+		ln -s ./dropbearmulti ${D}${sbindir}/$i
+	done
+	sed -e 's,/etc,${sysconfdir},g' \
+		-e 's,/usr/sbin,${sbindir},g' \
+		-e 's,/var,${localstatedir},g' \
+		-e 's,/usr/bin,${bindir},g' \
+		-e 's,/usr,${prefix},g' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/dropbear
+	chmod 755 ${D}${sysconfdir}/init.d/dropbear
+	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
+	fi
+
+	# deal with systemd unit files
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_system_unitdir}
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+		-e 's,@BINDIR@,${bindir},g' \
+		-e 's,@SBINDIR@,${sbindir},g' \
+		${D}${systemd_system_unitdir}/dropbear.socket ${D}${systemd_system_unitdir}/*.service
+}
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "20"
+ALTERNATIVE:${PN} = "${@bb.utils.filter('BINCOMMANDS', 'scp ssh', d)}"
+
+ALTERNATIVE_TARGET = "${sbindir}/dropbearmulti"
+
+pkg_postrm:${PN} () {
+  if [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
+        rm ${sysconfdir}/dropbear/dropbear_rsa_host_key
+  fi
+  if [ -f "${sysconfdir}/dropbear/dropbear_dss_host_key" ]; then
+        rm ${sysconfdir}/dropbear/dropbear_dss_host_key
+  fi
+}
+
+CONFFILES:${PN} = "${sysconfdir}/default/dropbear"
+
+FILES:${PN} += "${bindir}"
-- 
2.30.2


