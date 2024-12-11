Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7B7E77184
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 21:59:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6608.1733954355223196902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 13:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CUO63VE9;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3863703258fso685489f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733954353; x=1734559153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2y32TV2a6HlkYt57OuRpiV7oQNAJbYhJOaI+hlxMnUM=;
        b=CUO63VE9Y5RbKQ/MH95mw6KvvqR4p4JhR6CFcolmzpzSbSsneJJc7ESRJvDbPWcyHV
         qmulvchbOW9TDKMXU15vaq4z5czzI9q1myvmWR9GvpUC+4CQ596Tkblo9dxxOqJs0tYO
         MxU/2eckpmwBXLKwngvVaRmd0Glv76RP9BO9OcxbZRwH+V06vA3M6chRrXUCEuqOemhl
         flIiRuBvbrwuMBO4/DlbVAvcK3KLZACuBTu+/nJ8byF/ejL4KNyZ4H4gQmNGYus2yB3f
         GOaNJZ7g3DKFUUpgaGPsJDR8APZIOdxVC1rPFHH5Kw2t60vTm1ZIcQKlmcfNiOUzzlJF
         lO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954353; x=1734559153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y32TV2a6HlkYt57OuRpiV7oQNAJbYhJOaI+hlxMnUM=;
        b=kMXyGbb2Ij9LlH0pgneLuQchdqmcrdEM3WudMWu/Uw7HPryx9PVy1nL7FVklZ2JERD
         BoY+QQfTTu8MWkGcQNBBx7c/bXYU6sm+yhOCzGrvbVt67QZbwRze1Pq0Trf+gS8Ns6Sm
         8p6GhQxZisN9W8yY+iE7u5jtkmPBxjj7OF7q37B28Z9zKfjW7EJUvdtlIC/nnw2fnj9G
         sXmUFpPZe82ueUjVIf13uFE3azhuY3l4bza8/jMWPsiywLm/qq5jbZiQyvMLCZX06w56
         MTmA/11B1ho5Tu+YfkMYW4KQe5/Z33epPx9vnce2wHGWxsnbdAi1FUukKSEhz7ECqZAO
         56xw==
X-Gm-Message-State: AOJu0YykCUgKv7JuKILc99s1DLil38M3dkphneeEmftk4aR0MZt7696Y
	zEy78tsFPZjoJxiyM5k0nltUBwD0uJavCq1IQXLaqG2+v9pkHD2N0DpqnQ==
X-Gm-Gg: ASbGnctZmmk3gS8kx4JXRIxf9SPCBoUCByd8PA8yD95z05aqj9uVjXWUDCL8d6k1nOf
	5F3aopyitxiAn/DgduETiCJynBfRqsbqBRghtsi2uThn4bjB4H5kUhffYRXiTWTrpH0hCCnBx8D
	BxkZK//OwcxesN6Rk0LsEAdhAiarLzsfpen1o1xWuwbLDFGXX4Ut6TbL+mE26ZxC8c4AmlPgqvp
	h5aLi0ePRqjuQ7Ijanl8GDprCqyAHYU58/eybqXp8oZzIlJFOEf4Vxcrsd4gXw7fFhciKf53Q==
X-Google-Smtp-Source: AGHT+IFwwV8wtzybfzoy8X5s7K1w0gLPq4vxC5LbJ+g/oJjMdMt4jx9u+Vd8PaMw+eXig7ASxsXhyg==
X-Received: by 2002:a05:6000:186e:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38788858799mr538045f8f.27.1733954353216;
        Wed, 11 Dec 2024 13:59:13 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm2180792f8f.58.2024.12.11.13.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:59:12 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/5] systemd: split networkd into its own package
Date: Wed, 11 Dec 2024 22:58:41 +0100
Message-ID: <20241211215859.2187259-6-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
References: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 21:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208616

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Support of images with different network management implementations
without having to recompile systemd and other components.

Fedora does this as well since systemd version 246.6-2:
https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/systemd.spec#_578
This proves that it is technically possible and officially supported by
systemd.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/systemd/systemd_256.8.bb | 27 +++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.8.bb
index c1915d7e941..ca43c8d2ddb 100644
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
 
@@ -453,7 +455,7 @@ GROUPADD_PARAM:${PN} = "-r systemd-journal;"
 GROUPADD_PARAM:udev = "-r render"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
-USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
+USERADD_PARAM:${PN}-networkd = "--system -d / -M --shell /sbin/nologin systemd-network"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${datadir}/polkit-1 polkitd;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
@@ -620,6 +622,27 @@ FILES:${PN}-extra-utils = "\
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
@@ -630,7 +653,6 @@ FILES:${PN}-udev-rules = "\
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
-	${sysconfdir}/systemd/networkd.conf \
 	${sysconfdir}/systemd/pstore.conf \
 	${sysconfdir}/systemd/resolved.conf \
 	${sysconfdir}/systemd/sleep.conf \
@@ -698,7 +720,6 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${nonarch_libdir}/modprobe.d/README \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
-                ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
                 ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '${datadir}/dbus-1/system.d/org.freedesktop.hostname1_no_polkit.conf', '', d)} \
-- 
2.47.0


