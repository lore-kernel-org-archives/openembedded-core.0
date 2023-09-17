Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60866CD3421
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.27141.1694943555264520931
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WXNkhOcu;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bfbbd55158so56085161fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943553; x=1695548353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZxocIspBXdyqLm1fjp/y22YOukLXrPLRkaXUiqIvZA=;
        b=WXNkhOcuGDXa2H5WJc2e1piMpWDuBHDpXESby8OQ2hrqSbmD5WcRugrrA7uBQnkZBY
         y8MHGbep3EP+JVa17+/0MzjUP5yHUhlFTKdKH7jYdWIoLOc7oX5tolu6n19npy8bI7YE
         xZFMvfsZeAwd0i8t6z7MVEuW21x5IcYOdDQknk3GHm6qe4NeJteGTTGIqnO9h8YqK57P
         wrsapJG9BH2iG5jshANXbAstLWRJFP1j1UUpIvA/8E6zVg7ldTxq8icNOR09QUmxRKSU
         PXQ1rQLICUIzYcMrPGqG+CcydM7oEHYptt18g7pt9IvV5N0rKsBp8nS9VD7+BN0EHLEL
         RvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943553; x=1695548353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZxocIspBXdyqLm1fjp/y22YOukLXrPLRkaXUiqIvZA=;
        b=Yb7VsJ9p0cq6e8dAMWfOiZxpnYTz1QyytRVbplFDaoP02ZfDg+9I828RKAUdBwI4km
         Ks5UtKsxHWnwYhU0KMYA/koX4PXah67gZ+lFAmMLvwSS+40vyeCxDDMxkB+b5WOWdPQ0
         0yMBqIdamcFE1Sfxa2gDE2rwL3/En/3UElAa9Sgqj8CWknCxhJbPRHs+z8OmqUpNcc0a
         66sMEovDUh7iJ/XQXRD13yPuwHCQO8ZEPO0PY/vICJY7jQRwk0aQdhchXjL3A02/KDAr
         XtMDG0b2Yn9hWHBsw8UnZP72SSp+2bcsGCG8XY+q2j4tb6XXZfMx6uFHcknKpj5NFyFB
         2QaQ==
X-Gm-Message-State: AOJu0Yx2nE0eE88EMaNAMwkAisrzjcjV9bT8wLctA8K4t9mlj7MWzx8n
	yZGcpSU5YTbKaGEvi6v0ZiNA8wyP0OA=
X-Google-Smtp-Source: AGHT+IE8+V39XDxsMupGW3jtgaXxoKqY/fhhaTh7sm8VNEeEmXWjJa1lfHwKskgEbAGGGRnqjqN6kg==
X-Received: by 2002:a05:6512:2142:b0:4ff:80d4:e132 with SMTP id s2-20020a056512214200b004ff80d4e132mr4759803lfr.29.1694943553316;
        Sun, 17 Sep 2023 02:39:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/29] sysstat: merge .inc into .bb
Date: Sun, 17 Sep 2023 11:38:46 +0200
Message-Id: <20230917093901.428214-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187787

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/sysstat/sysstat.inc     | 71 -----------------
 .../sysstat/sysstat_12.6.2.bb                 | 78 +++++++++++++++++--
 2 files changed, 73 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat.inc

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
deleted file mode 100644
index 77337722eaa..00000000000
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "System performance tools"
-DESCRIPTION = "The sysstat utilities are a collection of performance monitoring tools for Linux."
-HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
-LICENSE = "GPL-2.0-or-later"
-SECTION = "console/utils"
-
-SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
-           file://99_sysstat \
-           file://sysstat.service \
-          "
-
-UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
-
-DEPENDS += "base-passwd"
-
-# autotools-brokensep as this package doesn't use automake
-inherit autotools-brokensep gettext systemd upstream-version-is-even
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
-PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
-
-EXTRA_OECONF += "--disable-stripping"
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE:${PN} = "sysstat.service"
-SYSTEMD_AUTO_ENABLE = "enable"
-
-do_configure:prepend() {
-    export sa_lib_dir=${libexecdir}/sa
-}
-
-do_install() {
-	autotools_do_install
-
-	# Don't version the documentation
-	mv ${D}${docdir}/${BP} ${D}${docdir}/${BPN}
-
-	# don't install /var/log/sa when populating rootfs. Do it through volatile
-	rm -rf ${D}/var
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-	        install -d ${D}/etc/default/volatiles
-		install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
-	fi
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-	        install -d ${D}${sysconfdir}/tmpfiles.d
-	        echo "d ${localstatedir}/log/sa - - - -" \
-		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
-
-		# Unless both cron and systemd are enabled, install our own
-		# systemd unit file. Otherwise the package will install one.
-	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron systemd', 'false', 'true', d)}; then
-			install -d ${D}${systemd_system_unitdir}
-			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_system_unitdir}
-			sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_system_unitdir}/sysstat.service
-	        fi
-	fi
-}
-
-pkg_postinst:${PN} () {
-	if [  ! -n "$D" ]; then
-		if [ -e /etc/init.d/populate-volatile.sh ]; then
-			/etc/init.d/populate-volatile.sh update
-		fi
-	fi
-}
-
-FILES:${PN} += "${systemd_system_unitdir} ${nonarch_base_libdir}/systemd"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
index b5014eaefb9..335ddd5746c 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
@@ -1,9 +1,77 @@
-require sysstat.inc
+SUMMARY = "System performance tools"
+DESCRIPTION = "The sysstat utilities are a collection of performance monitoring tools for Linux."
+HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
+LICENSE = "GPL-2.0-or-later"
+SECTION = "console/utils"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
+SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
+           file://99_sysstat \
+           file://sysstat.service \
+           file://0001-configure.in-remove-check-for-chkconfig.patch \
+           file://CVE-2023-33204.patch \
+          "
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
-            file://CVE-2023-33204.patch \
-            "
+LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI[sha256sum] = "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196229261c563fb48"
+UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
+
+DEPENDS += "base-passwd"
+
+# autotools-brokensep as this package doesn't use automake
+inherit autotools-brokensep gettext systemd upstream-version-is-even
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
+PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
+
+EXTRA_OECONF += "--disable-stripping"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "sysstat.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+do_configure:prepend() {
+    export sa_lib_dir=${libexecdir}/sa
+}
+
+do_install() {
+	autotools_do_install
+
+	# Don't version the documentation
+	mv ${D}${docdir}/${BP} ${D}${docdir}/${BPN}
+
+	# don't install /var/log/sa when populating rootfs. Do it through volatile
+	rm -rf ${D}/var
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+	        install -d ${D}/etc/default/volatiles
+		install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
+	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	        install -d ${D}${sysconfdir}/tmpfiles.d
+	        echo "d ${localstatedir}/log/sa - - - -" \
+		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
+
+		# Unless both cron and systemd are enabled, install our own
+		# systemd unit file. Otherwise the package will install one.
+	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron systemd', 'false', 'true', d)}; then
+			install -d ${D}${systemd_system_unitdir}
+			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_system_unitdir}
+			sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_system_unitdir}/sysstat.service
+	        fi
+	fi
+}
+
+pkg_postinst:${PN} () {
+	if [  ! -n "$D" ]; then
+		if [ -e /etc/init.d/populate-volatile.sh ]; then
+			/etc/init.d/populate-volatile.sh update
+		fi
+	fi
+}
+
+FILES:${PN} += "${systemd_system_unitdir} ${nonarch_base_libdir}/systemd"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
-- 
2.30.2


