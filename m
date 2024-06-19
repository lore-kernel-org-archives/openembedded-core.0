Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F98C2BA1A
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.16264.1718787610187071079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFYY7tqT;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-361a8ebcba3so1087282f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787608; x=1719392408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y6rVhGm4inVc8Jb6k9IMKfuxeJ6aNgWwtJWBP75hsY=;
        b=VFYY7tqT16LKLbb8WyXCTfZJhv1BLlu6+ZVmSTxQBv1wAZqbbk9YLg2T8sa9E2vOUz
         RRhb7RJMskymElWW0oAdqVHtxvocLgXqgS3LGnDsYo2Zv18Wmes9RqKS5IUg6Ogf1DFN
         MHH6/DyF7lYHiCoDh5EJs4x6xrct59Yxz1JEQ4lDMiuvW9khZaNBW9nH/rf+5fMjzokT
         YhfewCTd/CFwBgzPDunh0cgW1hqGhvNUkKVZ9h6hzyKM2nh7gHtwf2/j8jd5ynAFlNlf
         0VOpJqZ0+ExnsTJZEtSvQF4DZB2lTjFqqz2M6QjEwINbloX0ojTvJmut3tH1/9rBHBaH
         UQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787608; x=1719392408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y6rVhGm4inVc8Jb6k9IMKfuxeJ6aNgWwtJWBP75hsY=;
        b=SjoPbBFw/7Bd9a61eGvgni31VKTpP4Bo/ahYlRWNHXdu4ES2we9vZD0XX4agdQCcm1
         qJzdkfOqYBsICz2uvNPY4WZwPtlSoP2uVO6fN/iiRgcvhv9/DUapzA+9Y9UHuodrssS5
         UmUr8NStpksunPy+0JW/dcdJuKtaasv8t5aDdtnaQvF+LrH9a5MjCk3V4SbLOuPRsiNd
         kHoDzpPSParzrBLvZTPbucUnYoI8NhJ4chJ42RGB9vdXThVw+kXsiRVmMGaB9nzx/4OL
         ONZcUsv+eW+zf8Rx7+LhHdxGlUXOKYLr0urTbmcT2nQlfM5nQXTt/NXGLw0/tYSkzMo5
         RkGg==
X-Gm-Message-State: AOJu0YxZAdQGIbREWLLJ1av3KF5SM1kWu+m2OnfOR8zM+7qCMaEiJhm+
	qojXYipvbSMiTD9Qh/J+p6QxlfbvpFNg0eXYa0VbIomgwXc30mbxpMU2yA==
X-Google-Smtp-Source: AGHT+IF9V0UtaRxJWLJQpXP08GNSA7BT7M9zEXVYAnIhaA2SMP+fTSARaCM/QcZR5aB2SJXQtE7fPA==
X-Received: by 2002:a5d:4709:0:b0:361:fd04:95ed with SMTP id ffacd0b85a97d-363176ad7ebmr1481221f8f.15.1718787608540;
        Wed, 19 Jun 2024 02:00:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/15] settings-daemon: submit addsoundkeys.patch upstream and update to a revision that has it
Date: Wed, 19 Jun 2024 10:59:55 +0200
Message-Id: <20240619085957.2787700-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200899

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../settings-daemon/files/addsoundkeys.patch  | 49 -------------------
 .../settings-daemon/settings-daemon_0.0.2.bb  |  8 +--
 2 files changed, 4 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-sato/settings-daemon/files/addsoundkeys.patch

diff --git a/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch b/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch
deleted file mode 100644
index baf06d6b845..00000000000
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
index fb00de9bc95..aee89b2f57c 100644
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
2.39.2


