Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A7EE77184
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 16:44:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.24074.1734021868234631706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 08:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ak0+uhm/;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso6224665e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734021866; x=1734626666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jjh5nCafTZUhI9d3Y54APbXVq79WTV2k004+X6P2lSE=;
        b=Ak0+uhm/F0COfAy7uVjsb1je1uXmuBoJJT7Ha+wj2Pmp83x0ODF+dDLAwgTCA+TXYj
         Nuw+lpUuuVAojp1jyqm5oDnth5SkUTWOmBcaVV0djq6OQ/h7nfgbXwoaav5WIDoldA5N
         mG/J5PkHRvrhS40JR6w3M2qmrIAFvmsJl7Vx4kaMbFH46jE9rCmw3CydpmaINAd7Rbhq
         xzgezgbdHLfvNVrV/yz247NVhssTiv4CJXgPrMOhym/VSDo0tuL8enQ80VSwQzN0yZzm
         88JqvA94P/g+vMWBxYgt3vNGDTTXXszgAgbYbJYksCLN88YHqFaAF+r6GqJtyOHh2knZ
         iRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021866; x=1734626666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jjh5nCafTZUhI9d3Y54APbXVq79WTV2k004+X6P2lSE=;
        b=tchaV3yLKEDa3XCTjKLSuv3XjQmcWZbwNb0k3PwZfTMeXrj9A+vegz91IXxNN8rEp1
         9TNDqRJ0W5iYhaoz7ea6EPBEkSek5OQQpHrssFoTp0ERq+I23O/obI5DY3KQZPwv9Zqr
         KbmuwI8KjiIKYnvE8Y+9EjCW2kwrDamf6vde5VMkjJZ68w1pMDL6+PLY2NcYttncnWPT
         nxH4jbDyYGycJBzYhkBcF1kwXbcdUJdZEowsY8g6gRC4duHokgapdbZHtpdyTIDf2X3F
         efGWLjjTFKfV9pjmymvj4/sJSO/amUAA4M4cAlAgrL68cA4qDMN37pceDt4ZoYxGdvdO
         QqHg==
X-Gm-Message-State: AOJu0YxnshKOFgGhYmDJlhB+j3xEy/wH5l0fi0NZRcmrr+AQeYVtFCHW
	Z8EG6ga+lvkyrnThjfD2epBMyrawUJm9cCDBghaaM6RsxUSgPjpXNQYBsA==
X-Gm-Gg: ASbGncvt/QizxxPAQlxF2oHD1Wx5lyiLTZYdDEUkwUAGg30u7uUR65xXxSvQ7/mkL8T
	a0DdzGArZ0a+rjYqqOUzz+4/p+2z0UuKkZvEmzjQWZhshFhZ6siBJWfCCZZtZTgYI6JYr8ONRMq
	E+RoSnPqPKgvB7Ch+0hsqsrhIRlCJ4YhGNTek1cOVH6CVn4kagKYbNfszT0o5KxLkLyIehPaDWP
	Le0D8QuyMi9uKe+joSavm2hyOvvGtmUyk0jeSKlfziHl4uMrtaihDVBaF7RDTfWAYytpZ39pQua
X-Google-Smtp-Source: AGHT+IFzmBQe2QSJ9GnZS4kFCN6d/JEMpudo7BRjjZrYfARq1gxTOqQSgZTNt12prPxgialsQtb+dQ==
X-Received: by 2002:a5d:64aa:0:b0:385:e0d6:fb48 with SMTP id ffacd0b85a97d-3864ce894b6mr7155634f8f.7.1734021866270;
        Thu, 12 Dec 2024 08:44:26 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4815sm4473331f8f.26.2024.12.12.08.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:44:25 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCHv2 5/5] systemd: split networkd into its own package
Date: Thu, 12 Dec 2024 16:55:26 +0100
Message-ID: <20241212164407.2904755-6-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 16:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208658

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Support of images with different network management implementations
without having to recompile systemd and other components.

Fedora does this as well since systemd version 246.6-2:
https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/systemd.spec#_578
This proves that it is technically possible and officially supported by
systemd.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/systemd/systemd_256.8.bb | 28 +++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index c1915d7e941..0710377d32d 100644
--- a/meta/recipes-core/systemd/systemd_256.8.bb
+++ b/meta/recipes-core/systemd/systemd_256.8.bb
@@ -412,6 +412,7 @@ PACKAGE_BEFORE_PN = "\
     ${PN}-journal-remote \
     ${PN}-kernel-install \
     ${PN}-mime \
+    ${PN}-networkd \
     ${PN}-rpm-macros \
     ${PN}-udev-rules \
     ${PN}-vconsole-setup \
@@ -440,6 +441,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${PN}-networkd', '', d)} \
 "
 SYSTEMD_SERVICE:${PN}-binfmt = "systemd-binfmt.service"
 
@@ -448,12 +450,13 @@ USERADD_PACKAGES = "${PN} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${PN}-networkd', '', d)} \
 "
 GROUPADD_PARAM:${PN} = "-r systemd-journal;"
 GROUPADD_PARAM:udev = "-r render"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
-USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
+USERADD_PARAM:${PN}-networkd = "--system -d / -M --shell /sbin/nologin systemd-network"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${datadir}/polkit-1 polkitd;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
@@ -620,6 +623,27 @@ FILES:${PN}-extra-utils = "\
 FILES:${PN}-mime = "${MIMEDIR}"
 RRECOMMENDS:${PN} += "${PN}-mime"
 
+FILES:${PN}-networkd = "\
+    ${bindir}/networkctl \
+    ${datadir}/dbus-1/system-services/org.freedesktop.network1.service \
+    ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
+    ${datadir}/polkit-1/actions/org.freedesktop.network1.policy \
+    ${nonarch_libdir}/sysusers.d/systemd-network.conf \
+    ${nonarch_libdir}/tmpfiles.d/systemd-network.conf \
+    ${sysconfdir}/systemd/networkd.conf \
+    ${systemd_system_unitdir}/systemd-networkd* \
+    ${systemd_unitdir}/network/*.network \
+    ${systemd_unitdir}/network/*.network.example \
+    ${systemd_unitdir}/networkd.conf \
+    ${systemd_unitdir}/systemd-networkd* \
+"
+# systemd-networkd-persistent-storage.service BindsTo=systemd-networkd.service
+# systemd-networkd.service has Also=systemd-networkd-wait-online.service
+SYSTEMD_SERVICE:${PN}-networkd = "systemd-networkd.service"
+CONFFILES:${PN}-networkd = "${sysconfdir}/systemd/networkd.conf"
+RDEPENDS:${PN}-networkd += "${PN}"
+RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${PN}-networkd', '', d)}"
+
 FILES:${PN}-udev-rules = "\
                         ${nonarch_libdir}/udev/rules.d/70-uaccess.rules \
                         ${nonarch_libdir}/udev/rules.d/71-seat.rules \
@@ -630,7 +654,6 @@ FILES:${PN}-udev-rules = "\
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
-	${sysconfdir}/systemd/networkd.conf \
 	${sysconfdir}/systemd/pstore.conf \
 	${sysconfdir}/systemd/resolved.conf \
 	${sysconfdir}/systemd/sleep.conf \
@@ -698,7 +721,6 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${nonarch_libdir}/modprobe.d/README \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
-                ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
                 ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '${datadir}/dbus-1/system.d/org.freedesktop.hostname1_no_polkit.conf', '', d)} \
-- 
2.47.0


