Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C18E7719A
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:45 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.27859.1735901139216538930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/BevpKG;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436341f575fso125651475e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901137; x=1736505937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08RK1pw8+I0YbIWuyix+LIz9NT9fsAlRZUJ4aqWj85I=;
        b=f/BevpKGWejvdKI2VpQLFxaLnUTYxofGBEc3wJd2cnU42fnwDSYUmMAtIo1qjgY+Rp
         veZlRIW8iDo4Thd70chRduyhsGP+Cy2NR2kGoP3JiALmexVljvikKnHLC0mrZdq9X198
         dxg4n47XA3iYu8owy+JaPE56Q3SCJ8JPQ0YmpgRp/2ieFfOQKFOhAxwwdjldoSm1MKD2
         lPsaIVET2oROknV+U+zLHQI7u8tRKlNwaDFwHB6+rHqZChfqUe1k0eh2qfsr+Y2bBaP/
         5SILkfOCkzhrPqgdITj877s64Etk0WZ/tlwyES2h5V3MSdmTzQCefBqpvCsOgwUUAfwV
         pkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901137; x=1736505937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08RK1pw8+I0YbIWuyix+LIz9NT9fsAlRZUJ4aqWj85I=;
        b=QFUGboaBd2XLs2h3UZnfwHJyCo2+sqJV4WEx74o+WBnIprrW2Ed0yrifAHO0Em1eQY
         oskjTDlQeLsu718BDwaXlu9uZxWGEgCHMbxWwQygEFhLIyzCOKnX2E/vDEZkbZ/STIY4
         Um9T5NPJZGt/lvsoIsZXaAjooO+mCOQutVB34a25gG8uhREn+QwWNcv7tmrJET7s7ESd
         Cot/eUQdPKUwaJUXBK+Qv3JroYrzRupQBkIhOAF4C10KOJASevvpwYzqC7MvDNy2Lc6s
         i5we/S1a/y3IJJiuWwDaZjvT7gk8T7giHkHyYW+docyq9WmwARfxnpGbw4NqOS/s27O6
         D/Yg==
X-Gm-Message-State: AOJu0YwptvAgEjrhrABEfq1oM84DpvKmf+JNmZA0r/tUmh4JGbufDwQU
	3GSJ47CZK6s8nRxb+l/M5y7+Eysn0Xw7Z27PeLtrgZ6adUVBJkFcGVtIPA==
X-Gm-Gg: ASbGnctzT6s3YCfYxO3zHA7NGD55lxJvUsTrv4vnLLn44qXioPs+O6tvfszIgZyfX9R
	ETjxgddUxvhksdYEdbpM8XyQccq6kxcrHWxhXUPV4y+tz1hdm9VYoCKUvUdIVKOYK1jLipEp2TQ
	hy58+dudwWnTtn8O6dU9KpG8NY3VmMrciCUBn9GLsJD1d3CgwK4bLXm+eb8DsHFpQnuIn3oemT5
	qT14G6tuf38lQcrg1zn3OYqguuiQoWvAqa0bgFVug1CHyTdNLjXgNrtle2KclMt5lt8slWK7qAb
	Xi+j11TfJpeXA9txnw==
X-Google-Smtp-Source: AGHT+IGK1hyeqSgHc9cVvIL+NF/G47bcLX1eE/bwp31VKB1qgU/thP6t8T7wHVgZLvdPHgWSPE8q3w==
X-Received: by 2002:a05:600c:3b18:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-43668a3a329mr383059765e9.24.1735901137335;
        Fri, 03 Jan 2025 02:45:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/11] shadow: merge .inc into .bb
Date: Fri,  3 Jan 2025 11:45:22 +0100
Message-Id: <20250103104524.4053846-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209340

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/shadow/shadow.inc       | 224 -----------------
 meta/recipes-extended/shadow/shadow_4.16.0.bb | 225 +++++++++++++++++-
 2 files changed, 224 insertions(+), 225 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/shadow.inc

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
deleted file mode 100644
index 6ba5a9c7f1c..00000000000
--- a/meta/recipes-extended/shadow/shadow.inc
+++ /dev/null
@@ -1,224 +0,0 @@
-SUMMARY = "Tools to change and administer password and group data"
-HOMEPAGE = "http://github.com/shadow-maint/shadow"
-DESCRIPTION = "${SUMMARY}"
-BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
-SECTION = "base/utils"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
-                    file://src/passwd.c;beginline=2;endline=7;md5=67bcf314687820b2f010d4863fce3fc5 \
-                    "
-
-DEPENDS = "virtual/crypt"
-
-GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-           ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://useradd \
-           "
-
-SRC_URI:append:class-target = " \
-           file://login_defs_pam.sed \
-           file://shadow-update-pam-conf.patch \
-           "
-
-SRC_URI:append:class-native = " \
-           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
-           "
-SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
-
-# Additional Policy files for PAM
-PAM_SRC_URI = "file://pam.d/chfn \
-               file://pam.d/chpasswd \
-               file://pam.d/chsh \
-               file://pam.d/login \
-               file://pam.d/newusers \
-               file://pam.d/passwd \
-               file://pam.d/su"
-
-inherit autotools gettext github-releases pkgconfig
-
-export CONFIG_SHELL="/bin/sh"
-
-EXTRA_OECONF += " \
-                 --with-group-name-max-length=24 \
-                 --enable-subordinate-ids=yes \
-                 --without-sssd \
-                 ${NSCDOPT}"
-
-CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
-
-NSCDOPT = ""
-NSCDOPT:class-native = "--without-nscd"
-NSCDOPT:class-nativesdk = "--without-nscd"
-NSCDOPT:libc-glibc = "--with-nscd"
-
-PAM_PLUGINS = "libpam-runtime \
-               pam-plugin-faildelay \
-               pam-plugin-securetty \
-               pam-plugin-nologin \
-               pam-plugin-env \
-               pam-plugin-group \
-               pam-plugin-limits \
-               pam-plugin-motd \
-               pam-plugin-mail \
-               pam-plugin-shells \
-               pam-plugin-rootok"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
-PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} libbsd"
-PACKAGECONFIG:class-nativesdk = ""
-PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
-PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
-PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
-PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
-PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
-PACKAGECONFIG[logind] = "--enable-logind,--disable-logind,systemd"
-
-RDEPENDS:${PN} = "shadow-securetty \
-                  base-passwd \
-                  util-linux-sulogin"
-RDEPENDS:${PN}:class-native = ""
-RDEPENDS:${PN}:class-nativesdk = ""
-
-do_install() {
-	oe_runmake DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install
-
-	# Info dir listing isn't interesting at this point so remove it if it exists.
-	if [ -e "${D}${infodir}/dir" ]; then
-		rm -f ${D}${infodir}/dir
-	fi
-
-	# Enable CREATE_HOME by default.
-	sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
-
-	# As we are on an embedded system, ensure the users mailbox is in
-	# ~/ not /var/spool/mail by default, as who knows where or how big
-	# /var is. The system MDA will set this later anyway.
-	sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
-	sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
-
-	# Disable checking emails.
-	sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
-
-	# Comment out SU_NAME to work correctly with busybox
-	# See Bug#5359 and Bug#7173
-	sed -i 's:^SU_NAME:#SU_NAME:g' ${D}${sysconfdir}/login.defs
-
-	# Use proper encryption for passwords
-	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
-
-	install -d ${D}${sysconfdir}/default
-	install -m 0644 ${UNPACKDIR}/useradd ${D}${sysconfdir}/default
-}
-
-do_install:append() {
-	# Ensure that the image has as a /var/spool/mail dir so shadow can
-	# put mailboxes there if the user reconfigures shadow to its
-	# defaults (see sed below).
-	install -m 0775 -d ${D}${localstatedir}/spool/mail
-	chown root:mail ${D}${localstatedir}/spool/mail
-
-	if [ -e ${UNPACKDIR}/pam.d ]; then
-		install -d ${D}${sysconfdir}/pam.d/
-		install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
-		# Remove defaults that are not used when supporting PAM.
-		sed -i -f ${UNPACKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
-	fi
-
-	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir}
-
-	# Move binaries to the locations we want
-	rm ${D}${sbindir}/vigr
-	ln -sf vipw.${BPN} ${D}${base_sbindir}/vigr
-	if [ "${sbindir}" != "${base_sbindir}" ]; then
-		mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw
-	fi
-	if [ "${bindir}" != "${base_bindir}" ]; then
-		mv ${D}${bindir}/login ${D}${base_bindir}/login
-		mv ${D}${bindir}/su ${D}${base_bindir}/su
-	fi
-
-	# Handle link properly after rename, otherwise missing files would
-	# lead rpm failed dependencies.
-	ln -sf newgrp.${BPN} ${D}${bindir}/sg
-
-	# usermod requires the subuid/subgid files to be in place before being
-	# able to use the -v/-V flags otherwise it fails:
-	# usermod: /etc/subuid does not exist, you cannot use the flags -v or -V
-	install -d ${D}${sysconfdir}
-	touch ${D}${sysconfdir}/subuid
-	touch ${D}${sysconfdir}/subgid
-}
-
-# Make executables look for dynamically linked libraries in a custom location, and install
-# the needed libraries there. That way we can use them from sstate
-# in setscene tasks without worrying about the dependency libraries being available.
-do_install:append:class-native() {
-        binaries=$(find ${D}${base_bindir}/ ${D}${base_sbindir}/ ${D}${bindir}/ ${D}${sbindir}/ -executable -type f)
-        chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
-        mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
-        libattr=${@bb.utils.contains('DISTRO_FEATURES', 'xattr', "${STAGING_LIBDIR_NATIVE}/libattr.so.*", '', d)}
-        install $libattr ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
-        install ${D}${libdir}/*.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
-}
-
-SYSROOT_DIRS:append:class-native = " ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
-INSANE_SKIP:${PN}:class-native = "already-stripped"
-
-do_install:append:class-nativesdk() {
-	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
-}
-
-do_install:append:class-target() {
-	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
-}
-
-PACKAGES =+ "${PN}-base"
-FILES:${PN}-base = "\
-    ${base_bindir}/login.shadow \
-    ${base_bindir}/su.shadow \
-    ${bindir}/sg \
-    ${bindir}/newgrp.shadow \
-    ${bindir}/groups.shadow \
-    ${sysconfdir}/pam.d/login \
-    ${sysconfdir}/pam.d/su \
-    ${sysconfdir}/login.defs \
-"
-RDEPENDS:${PN} += "${PN}-base"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "200"
-
-ALTERNATIVE:${PN} = "passwd chfn chsh chpasswd vipw vigr nologin"
-ALTERNATIVE_LINK_NAME[chfn] = "${bindir}/chfn"
-ALTERNATIVE_LINK_NAME[chsh] = "${bindir}/chsh"
-ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
-ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
-ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
-ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
-
-ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1 su.1 nologin.8"
-ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
-ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
-ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
-ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
-ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
-
-ALTERNATIVE:${PN}-base = "newgrp groups login su"
-ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-
-PACKAGE_WRITE_DEPS += "shadow-native"
-pkg_postinst:${PN}:class-target () {
-	if [ "x$D" != "x" ]; then
-	  rootarg="--root $D"
-	else
-	  rootarg=""
-	fi
-
-	pwconv $rootarg || exit 1
-	grpconv $rootarg || exit 1
-}
diff --git a/meta/recipes-extended/shadow/shadow_4.16.0.bb b/meta/recipes-extended/shadow/shadow_4.16.0.bb
index e57676c1da3..1fcf82bb01d 100644
--- a/meta/recipes-extended/shadow/shadow_4.16.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.16.0.bb
@@ -1,4 +1,227 @@
-require shadow.inc
+SUMMARY = "Tools to change and administer password and group data"
+HOMEPAGE = "http://github.com/shadow-maint/shadow"
+DESCRIPTION = "${SUMMARY}"
+BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
+SECTION = "base/utils"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
+                    file://src/passwd.c;beginline=2;endline=7;md5=67bcf314687820b2f010d4863fce3fc5 \
+                    "
+
+DEPENDS = "virtual/crypt"
+
+GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
+           ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://useradd \
+           "
+
+SRC_URI:append:class-target = " \
+           file://login_defs_pam.sed \
+           file://shadow-update-pam-conf.patch \
+           "
+
+SRC_URI:append:class-native = " \
+           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           "
+SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
+
+# Additional Policy files for PAM
+PAM_SRC_URI = "file://pam.d/chfn \
+               file://pam.d/chpasswd \
+               file://pam.d/chsh \
+               file://pam.d/login \
+               file://pam.d/newusers \
+               file://pam.d/passwd \
+               file://pam.d/su"
+
+inherit autotools gettext github-releases pkgconfig
+
+export CONFIG_SHELL="/bin/sh"
+
+EXTRA_OECONF += " \
+                 --with-group-name-max-length=24 \
+                 --enable-subordinate-ids=yes \
+                 --without-sssd \
+                 ${NSCDOPT}"
+
+CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
+
+NSCDOPT = ""
+NSCDOPT:class-native = "--without-nscd"
+NSCDOPT:class-nativesdk = "--without-nscd"
+NSCDOPT:libc-glibc = "--with-nscd"
+
+PAM_PLUGINS = "libpam-runtime \
+               pam-plugin-faildelay \
+               pam-plugin-securetty \
+               pam-plugin-nologin \
+               pam-plugin-env \
+               pam-plugin-group \
+               pam-plugin-limits \
+               pam-plugin-motd \
+               pam-plugin-mail \
+               pam-plugin-shells \
+               pam-plugin-rootok"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
+PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} libbsd"
+PACKAGECONFIG:class-nativesdk = ""
+PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
+PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
+PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
+PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
+PACKAGECONFIG[logind] = "--enable-logind,--disable-logind,systemd"
+
+RDEPENDS:${PN} = "shadow-securetty \
+                  base-passwd \
+                  util-linux-sulogin"
+RDEPENDS:${PN}:class-native = ""
+RDEPENDS:${PN}:class-nativesdk = ""
+
+do_install() {
+	oe_runmake DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install
+
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
+
+	# Enable CREATE_HOME by default.
+	sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
+
+	# As we are on an embedded system, ensure the users mailbox is in
+	# ~/ not /var/spool/mail by default, as who knows where or how big
+	# /var is. The system MDA will set this later anyway.
+	sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
+	sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
+
+	# Disable checking emails.
+	sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
+
+	# Comment out SU_NAME to work correctly with busybox
+	# See Bug#5359 and Bug#7173
+	sed -i 's:^SU_NAME:#SU_NAME:g' ${D}${sysconfdir}/login.defs
+
+	# Use proper encryption for passwords
+	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
+
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${UNPACKDIR}/useradd ${D}${sysconfdir}/default
+}
+
+do_install:append() {
+	# Ensure that the image has as a /var/spool/mail dir so shadow can
+	# put mailboxes there if the user reconfigures shadow to its
+	# defaults (see sed below).
+	install -m 0775 -d ${D}${localstatedir}/spool/mail
+	chown root:mail ${D}${localstatedir}/spool/mail
+
+	if [ -e ${UNPACKDIR}/pam.d ]; then
+		install -d ${D}${sysconfdir}/pam.d/
+		install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
+		# Remove defaults that are not used when supporting PAM.
+		sed -i -f ${UNPACKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
+	fi
+
+	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir}
+
+	# Move binaries to the locations we want
+	rm ${D}${sbindir}/vigr
+	ln -sf vipw.${BPN} ${D}${base_sbindir}/vigr
+	if [ "${sbindir}" != "${base_sbindir}" ]; then
+		mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw
+	fi
+	if [ "${bindir}" != "${base_bindir}" ]; then
+		mv ${D}${bindir}/login ${D}${base_bindir}/login
+		mv ${D}${bindir}/su ${D}${base_bindir}/su
+	fi
+
+	# Handle link properly after rename, otherwise missing files would
+	# lead rpm failed dependencies.
+	ln -sf newgrp.${BPN} ${D}${bindir}/sg
+
+	# usermod requires the subuid/subgid files to be in place before being
+	# able to use the -v/-V flags otherwise it fails:
+	# usermod: /etc/subuid does not exist, you cannot use the flags -v or -V
+	install -d ${D}${sysconfdir}
+	touch ${D}${sysconfdir}/subuid
+	touch ${D}${sysconfdir}/subgid
+}
+
+# Make executables look for dynamically linked libraries in a custom location, and install
+# the needed libraries there. That way we can use them from sstate
+# in setscene tasks without worrying about the dependency libraries being available.
+do_install:append:class-native() {
+        binaries=$(find ${D}${base_bindir}/ ${D}${base_sbindir}/ ${D}${bindir}/ ${D}${sbindir}/ -executable -type f)
+        chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
+        mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
+        libattr=${@bb.utils.contains('DISTRO_FEATURES', 'xattr', "${STAGING_LIBDIR_NATIVE}/libattr.so.*", '', d)}
+        install $libattr ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
+        install ${D}${libdir}/*.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
+}
+
+SYSROOT_DIRS:append:class-native = " ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
+INSANE_SKIP:${PN}:class-native = "already-stripped"
+
+do_install:append:class-nativesdk() {
+	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
+}
+
+do_install:append:class-target() {
+	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
+}
+
+PACKAGES =+ "${PN}-base"
+FILES:${PN}-base = "\
+    ${base_bindir}/login.shadow \
+    ${base_bindir}/su.shadow \
+    ${bindir}/sg \
+    ${bindir}/newgrp.shadow \
+    ${bindir}/groups.shadow \
+    ${sysconfdir}/pam.d/login \
+    ${sysconfdir}/pam.d/su \
+    ${sysconfdir}/login.defs \
+"
+RDEPENDS:${PN} += "${PN}-base"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "200"
+
+ALTERNATIVE:${PN} = "passwd chfn chsh chpasswd vipw vigr nologin"
+ALTERNATIVE_LINK_NAME[chfn] = "${bindir}/chfn"
+ALTERNATIVE_LINK_NAME[chsh] = "${bindir}/chsh"
+ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
+ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
+ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
+ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
+
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1 su.1 nologin.8"
+ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
+ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
+ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
+
+ALTERNATIVE:${PN}-base = "newgrp groups login su"
+ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
+ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
+
+PACKAGE_WRITE_DEPS += "shadow-native"
+pkg_postinst:${PN}:class-target () {
+	if [ "x$D" != "x" ]; then
+	  rootarg="--root $D"
+	else
+	  rootarg=""
+	fi
+
+	pwconv $rootarg || exit 1
+	grpconv $rootarg || exit 1
+}
 
 # Build falsely assumes that if --enable-libpam is set, we don't need to link against
 # libcrypt. This breaks chsh.
-- 
2.39.5


