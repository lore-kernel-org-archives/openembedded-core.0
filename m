Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EF9C52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.55961.1722258819178564840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jB9O/Y7W;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb4c584029so1976315a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258818; x=1722863618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BzBNPUib5IrHvwaPYqT+h7iUr4uiT4YOcriqmg82RA=;
        b=jB9O/Y7WnIeRpFfeY4TzuO/ui7Uh1A1NrnkL3G02VlGN2iiATFjWy6lG/ve1EplH1k
         6Qhe7fpngNbDEzoK1FvWS8Ec/2WkTJO0LUPtpQKz+Rfrol8X1eVkHVS90iLLn0mJzsJS
         EIT6C07UEqM6Id0HZactBfZoJO9Kt+mimH5NQqSzSulCwM7aJYp0wAcC0UUKbW+rFs+6
         zw0yxAr8H1pj6RWixTyWYH8OaZ+HWihAaUqHfAjJUOx8xDdGhvOJq+Gw0nno7H/tygTk
         jaARdgSg5G8c6WyS1sl/UlJNWpq3dHuIJVvvz3u0oAs/mPlpmY9nSI1vCqSHNpT8Qcfv
         xHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258818; x=1722863618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BzBNPUib5IrHvwaPYqT+h7iUr4uiT4YOcriqmg82RA=;
        b=gUideI4DIm/nMprJzy9lpRV2eCB1brOqT0cqpdCmdgvCUyiQr+reo9yJcWcIg31ZF0
         fBRIPXoKxUNi5JRhN2Fo9Nl5VQ5zZ3gHc56nE1keUePzYrrOEKkIiTxLsMIgyHcv3sD+
         I6GVobfVWe9pbOc6E4SG5E2Yk1ZPa1vEDEbESUzKpWJ3HMLTCBQy05CDUHUrOokorRUU
         ZooyPumKQZcvw5RXKnGTn+34FY/iA3Wd5AfuSerNfLoMZFUTipiArUvmnOUeODjJ6Aex
         lQo9ql0n0Pw2KtWspsAQ7thjxMPpqUnWhv7Lbr2blzV+RFDzgHY9LwR6a9xr+bR/kaH3
         OvjA==
X-Gm-Message-State: AOJu0YwLBW+R2sVuiiRTs9OU1TZY7sNvZtOuTRDpov/Aea/mfqQy9Tz1
	XodrI6jp4gm/5z9J9qDAztfICsvV2VG46JxQJzGHNAPH3rYcH2YY+xuzzYMI8cTw2y4Bz/OMr0g
	4DNU+KA==
X-Google-Smtp-Source: AGHT+IFjigDooLiA+nlhHb97V2n52mZw3J2aEmQwqtCPT72Jj1E1A8ieqRoCy3uUz7jmWGV4E++ryg==
X-Received: by 2002:a17:90b:1649:b0:2c9:6f91:fc43 with SMTP id 98e67ed59e1d1-2cf7e1a3e76mr5556235a91.3.1722258818357;
        Mon, 29 Jul 2024 06:13:38 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/37] settings-daemon: submit addsoundkeys.patch upstream and update to a revision that has it
Date: Mon, 29 Jul 2024 06:12:40 -0700
Message-Id: <ab532f6010a671e622a9451f6a5d2fe31dbc2f32.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202644

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d56c7b444d94778808cce8ede3374b8212b22a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../settings-daemon/files/addsoundkeys.patch  | 49 -------------------
 .../settings-daemon/settings-daemon_0.0.2.bb  |  8 +--
 2 files changed, 4 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-sato/settings-daemon/files/addsoundkeys.patch

diff --git a/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch b/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch
deleted file mode 100644
index baf06d6b84..0000000000
--- a/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status: Pending
-
-Index: settings-daemon/settings-daemon.c
-===================================================================
---- settings-daemon.orig/settings-daemon.c	2009-05-22 14:57:05.000000000 +0100
-+++ settings-daemon/settings-daemon.c	2009-05-22 14:58:22.000000000 +0100
-@@ -187,6 +187,10 @@
-     GCONF_VALUE_STRING, translate_string_string },
-   { "/desktop/poky/interface/gtk_color_scheme", "Gtk/ColorScheme",
-     GCONF_VALUE_STRING, translate_string_string },
-+  { "/desktop/gnome/sound/theme_name", "Net/SoundThemeName",
-+    GCONF_VALUE_STRING,   translate_string_string },
-+  { "/desktop/gnome/sound/event_sounds", "Net/EnableEventSounds" ,
-+    GCONF_VALUE_BOOL,     translate_bool_int },
- };
- 
- static const TranslationEntry*
-Index: settings-daemon/settings-daemon.schemas
-===================================================================
---- settings-daemon.orig/settings-daemon.schemas	2009-05-22 15:49:17.000000000 +0100
-+++ settings-daemon/settings-daemon.schemas	2009-05-22 15:51:31.000000000 +0100
-@@ -196,6 +196,27 @@
-     </locale>
-   </schema>
- 
-+  <schema>
-+    <key>/schemas/desktop/gnome/sound/theme_name</key>
-+    <applyto>/desktop/gnome/sound/theme_name</applyto>
-+    <owner>gnome</owner>
-+    <type>string</type>
-+    <default>freedesktop</default>
-+    <locale name="C">
-+      <short>Sound Theme Name</short>
-+    </locale>
-+  </schema>
-+
-+  <schema>
-+    <key>/schemas/desktop/gnome/sound/event_sounds</key>
-+    <applyto>/desktop/gnome/sound/event_sounds</applyto>
-+    <owner>gnome</owner>
-+    <type>bool</type>
-+    <default>true</default>
-+    <locale name="C">
-+      <short>Enable Sound Events</short>
-+    </locale>
-+  </schema>
- 
- </schemalist>
- </gconfschemafile>
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 4bdbefcb75..d38cd4e2dd 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc
 DEPENDS = "gconf glib-2.0 gtk+3"
 SECTION = "x11"
 
-# SRCREV tagged 0.0.2
-SRCREV = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
+PV .= "+git"
+# SRCREV tagged 0.0.2 + one patch
+SRCREV = "df669c6579a6ac7e1ef56be66617f35ae7d33d68"
 SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master;protocol=https \
-           file://addsoundkeys.patch \
            file://70settings-daemon.sh \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gconf features_check
 
-FILES:${PN} = 	"${bindir}/* ${sysconfdir}"
+FILES:${PN} = "${bindir}/* ${sysconfdir}"
 
 # Requires gdk-x11-2.0 which is provided by gtk when x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.34.1


