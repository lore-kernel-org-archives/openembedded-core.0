Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39F5C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 22:22:25 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.3027.1646864544186819816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 14:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CaG5HjiW;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id yy13so8212395ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 14:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5S6VoLMcsCTx8mkfe4Hf0XTmmv5FchybF/DU/MDXyc=;
        b=CaG5HjiWqNtz2nzA4bjpRPT7tAN2k5+Ia/ofswlIaZEDmIUAutuazwEcdFwlIfnzUu
         NDimrlQcx0tJ1Tr+RN09BSAq/iTejy/PcHXJDiD5xKV2xReV7FJuYfA/azomC2WT57Cd
         LDLEIsX5Shy11rJRDlJoKtYHe3ELPhFO2UdwTQ/VEo0JIx8RTT/gmSHRQc9YKPYKt+ye
         l0HDVXaWq9ucctQLuNKoFSkDRbp5eKUsAXNhXf8dzrCc7hqc7ukGAT2gk8DQZ6Bs5vGw
         2uSCAyI9T4JL/jYiDpKSrhnws7We6ZhJfr/8FCKs5DS8hjDJy0eS6RYo1Jjg0vSXndpw
         Mk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5S6VoLMcsCTx8mkfe4Hf0XTmmv5FchybF/DU/MDXyc=;
        b=qBtxwdBLiVnmi45kQ41rMGE7HlIbGMqhjnk+K8yeRgo+1j8m2nQpUWYMrQgQEfFAP/
         QMkXeYUmn80OHd2hzUGrJeWJmCxUwZ8xPKcFdaTUtmWl9463lemlqjfH9v2in2psiOWb
         ZA/OX32PVSKIll0lzQBYwFQB//vOdUtJw4MvhTuq5InJ7pCwj6wTw4lbnUyd3hxV/erN
         Xb7N7NAKH+rKIIhkjIxywAX5arbrZOr3NYmmyS9quZkjEpT3UWDgIbelsckg0uVTMMgx
         qOwoz+LNoW/CCl9ChFMCycbd8CF1agatU7hmTsExKKxDqRidxIDA6FeD8nm6okPt5su2
         5AoQ==
X-Gm-Message-State: AOAM531PQq/iu/RwY8BHMo9usLvSQ20Bv3ph34Brv3HCVtuM0zlIqku8
	I6O6knvB+e2/j01pP4UeURnh5wXOxqU=
X-Google-Smtp-Source: 
 ABdhPJyZszvJ+5TWjnDtgGqx6eHAzGRyJeUSndxLf4XN7Ut36PPOSfIekqCzYE4OHbNie5StxL576A==
X-Received: by 2002:a17:906:b201:b0:6b5:58c8:e43c with SMTP id
 p1-20020a170906b20100b006b558c8e43cmr1674663ejz.441.1646864542689;
        Wed, 09 Mar 2022 14:22:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 me17-20020a170906aed100b006db0dcf6746sm1173699ejb.216.2022.03.09.14.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:22:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] dbus: merge dbus.inc into the recipe
Date: Wed,  9 Mar 2022 23:22:13 +0100
Message-Id: <20220309222214.4040432-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309222214.4040432-1-alex@linutronix.de>
References: <20220309222214.4040432-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 22:22:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162994

The content is unchanged.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/dbus/dbus.inc        | 39 -------------------------
 meta/recipes-core/dbus/dbus_1.12.22.bb | 40 +++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus.inc

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
deleted file mode 100644
index 8e6f597c0a..0000000000
--- a/meta/recipes-core/dbus/dbus.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
-
-LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
-
-SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
-           file://run-ptest \
-           file://python-config.patch \
-           file://tmpdir.patch \
-           file://dbus-1.init \
-           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           file://stop_using_selinux_set_mapping.patch \
-"
-
-SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
-
-EXTRA_OECONF = "--disable-xml-docs \
-                --disable-doxygen-docs \
-                --enable-largefile \
-                --with-system-socket=/run/dbus/system_bus_socket \
-                --enable-tests \
-                --enable-checks \
-                --enable-asserts \
-                "
-EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
-                   user-session \
-                  "
-PACKAGECONFIG:class-native = ""
-PACKAGECONFIG:class-nativesdk = ""
-
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
-PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
-PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
-PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
-PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
diff --git a/meta/recipes-core/dbus/dbus_1.12.22.bb b/meta/recipes-core/dbus/dbus_1.12.22.bb
index e611e7d98a..792f34c7ef 100644
--- a/meta/recipes-core/dbus/dbus_1.12.22.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.22.bb
@@ -3,7 +3,45 @@ DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to t
 HOMEPAGE = "https://dbus.freedesktop.org"
 SECTION = "base"
 
-require dbus.inc
+inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
+
+LICENSE = "AFL-2.1 | GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+
+SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://run-ptest \
+           file://python-config.patch \
+           file://tmpdir.patch \
+           file://dbus-1.init \
+           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://stop_using_selinux_set_mapping.patch \
+"
+
+SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
+
+EXTRA_OECONF = "--disable-xml-docs \
+                --disable-doxygen-docs \
+                --enable-largefile \
+                --with-system-socket=/run/dbus/system_bus_socket \
+                --enable-tests \
+                --enable-checks \
+                --enable-asserts \
+                "
+EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   user-session \
+                  "
+PACKAGECONFIG:class-native = ""
+PACKAGECONFIG:class-nativesdk = ""
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
+PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
+PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 DEPENDS = "expat virtual/libintl autoconf-archive glib-2.0"
 RDEPENDS:${PN} += "${PN}-common ${PN}-tools"
-- 
2.30.2


