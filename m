Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706CBC48BE4
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:38:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.22250.1659940732271119389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J1Z9FxPD;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id m4so14815367ejr.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9pxrFzoHB6lZYV0nax5sjK/sRmsAEWwxLnY3Lb7u8/0=;
        b=J1Z9FxPDb8IEOPoJ2mIntiGnbW4kdD4U7ZRT8/3m9hD+i1j3Fo3wrapMBLRdVesBph
         B5pCp7jmUO9YEeCE8VpCTci+M19eNZbh2pNoVdFU92CfF+EkiPg9i5QcsTBiQIWWd4AO
         z/rWSRwr5ceM2rB+/URnN8RNGjd2FkvlYn1zAwRWX8Fr6GaSyQvn3zPmN/pEvkZE9slF
         zRuasQBWrgmHjyx8kU2MA+5N/HtFRsXftJan0qjHNM1N/XdW09wFXMiGKHei9yIMT7VB
         4aAyMolrqSWZ5/UaAnGY/rw7OzZ0zNWZdj17lJ1+Piiiez10jWxyib5/jhS8ZSxPacSP
         7o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9pxrFzoHB6lZYV0nax5sjK/sRmsAEWwxLnY3Lb7u8/0=;
        b=yneTtoOyYcK1UD9cSkRBROylaoG/SHNxGulWwrKJFkh7Bmy/CPNrqYVx6dBg2aJrfk
         VkJt6nDkwifItCONrIGH7HebmGL6KtdwKwwDo08heRTk614mY8GrZ32IL8cJLY+lP/qN
         VEXTH51zvwgQzGOz+fI4dW9hgx3zGQiS1v3VyWrWOFi9rIu7J6WQbdMxp5yfWCHksHPi
         Vnci7i1gWCBDnfgrnNEyqiB2ljcqHGoE6gGoLwDRJKaXMBRMAR8Ae+EvHiss4pAWhPQC
         gwbpx6s8QjChfKMNVifPxEUU/udGtuow/kip7/k8QPjNNDx8nYSfVQlNRY1D0NwHn2wA
         /WPA==
X-Gm-Message-State: ACgBeo18HmBbUUTDYC6hbId8JAFCu8+j+cnSBdfNLnlrfRYPOFGS60CL
	werxZizXykiFfu6IXTXlNOWUAG5XEf8=
X-Google-Smtp-Source: 
 AA6agR7vxx9Y0Y6mpfVYFtFSsm6ptvOBwtyZd59gIzzRYRleSZMV0KER4r9O7uso0umuJq4k+qEA0A==
X-Received: by 2002:a17:907:7b8e:b0:731:4e73:89f2 with SMTP id
 ne14-20020a1709077b8e00b007314e7389f2mr3768373ejc.562.1659940730575;
        Sun, 07 Aug 2022 23:38:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/45] dropbear: merge .inc into .bb
Date: Mon,  8 Aug 2022 08:38:00 +0200
Message-Id: <20220808063843.3975130-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169016

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/dropbear/dropbear.inc       | 128 -----------------
 .../recipes-core/dropbear/dropbear_2022.82.bb | 129 +++++++++++++++++-
 2 files changed, 127 insertions(+), 130 deletions(-)
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
index 154a407a19..e170587d08 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
@@ -1,3 +1,128 @@
-require dropbear.inc
+SUMMARY = "A lightweight SSH and SCP implementation"
+HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
+DESCRIPTION = "Dropbear is a relatively small SSH server and client. It runs on a variety of POSIX-based platforms. Dropbear is open source software, distributed under a MIT-style license. Dropbear is particularly useful for "embedded"-type Linux (or other Unix) systems, such as wireless routers."
+SECTION = "console/network"
 
-SRC_URI[sha256sum] = "3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1"
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


