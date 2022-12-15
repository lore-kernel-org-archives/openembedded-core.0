Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B87C2D0CB
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:46:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.128336.1671093952569947442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IbkJJ235;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id m4so6142129pls.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYYKReEuavMWQkmcy31MuRKUZ67knRl3zDzPoUfRGC4=;
        b=IbkJJ235dSgjwUT3eo/Er1vcDM0HZQ3CE2ubb/BmC3MBjQ4NlzMWHMbc50vqCvr2yw
         odlL9LsdgUars1nFShRiu7fTL/BoyGby3btQc+Fn8sWi80L7VjpkZgqmddZe8ItU6lC+
         8LrrubRijwunAtJd8nON1DD+wC5QKiC2WqZ2kzglMIXXP0n9Jw9zBKkHdBMLS2ViF+4H
         lnoepJf1ex+Os3xiYhUckgUFlEHWYlKtpZepTIzth05IEOskRH4MyNXaUBVS//SMuimu
         Z9ujM3T7+NHNWjgC003KXwqljrzi6Ynqmi5ghb1bJWLJchNYtijdlBx2Abzt2Z4KgYqU
         NOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYYKReEuavMWQkmcy31MuRKUZ67knRl3zDzPoUfRGC4=;
        b=6varTCkh8oZYob4EOxuna9iM174zc+hM05v8prOq31Roenmy9oziLs7PVQ98C2gwjQ
         dC6KJQx6y685VGfL5dZ5BH7PE8rfN8nzQNGaz0bKpwfg7q3ogwxswgRCV2XAdfw57vSV
         dEL2gUjY1KGAeONaOohRpqSmdzezxHjv3X/hRDm4irHoi7/lteOHfYEVZKzyaD9BKkqD
         qI9hyjxpd/waYAJD2tUGWBlOiphi+R0w0K8GlcO8PsU+D/rclj08GpMyMzVIGR+Y3t7P
         C99+nnJdpsXwG89VcQgKiP+D9UbTwpbWL1YIbFHaJVflXkbuE+LqSEry7h2yKlPiWlg6
         mKfw==
X-Gm-Message-State: ANoB5pmBGvnFVUGNQf6FDg1W0CV+SSiFCi2929ierJefEQW3OlOjOy6P
	r8iRkuIGaBJx6vDWvAPQM5rEIIVVThE=
X-Google-Smtp-Source: AA0mqf5QXlnRm5pztk10NL4mT+TbpgZxfbXLNc2KyJTyaRPve1MhHsW+IDzVLMaI9xsNHT/1dzqO8Q==
X-Received: by 2002:a17:902:ccd0:b0:186:f57d:8573 with SMTP id z16-20020a170902ccd000b00186f57d8573mr31330024ple.2.1671093951732;
        Thu, 15 Dec 2022 00:45:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 05/11] efivar: Replace off64_t with off_t
Date: Thu, 15 Dec 2022 00:45:40 -0800
Message-Id: <20221215084546.125368-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174567

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-off_t-instead-of-off64_t.patch   | 39 +++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch b/meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch
new file mode 100644
index 0000000000..f47a457386
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch
@@ -0,0 +1,39 @@
+From 1eb0fa531301a5045af1b020fc093c4fcfd38680 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Dec 2022 16:55:51 -0800
+Subject: [PATCH] Use off_t instead of off64_t
+
+Pass _FILE_OFFSET_BITS=64 to ensure 64bit off_t
+
+Upstream-Status: Submitted [https://github.com/rhboot/efivar/pull/237]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/error.c             | 2 +-
+ src/include/defaults.mk | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/error.c b/src/error.c
+index fcbba0d..9530e22 100644
+--- a/src/error.c
++++ b/src/error.c
+@@ -191,7 +191,7 @@ dbglog_write(void *cookie, const char *buf, size_t size)
+ }
+ 
+ static int
+-dbglog_seek(void *cookie UNUSED, off64_t *offset, int whence)
++dbglog_seek(void *cookie UNUSED, off_t *offset, int whence)
+ {
+ 	FILE *log = efi_errlog ? efi_errlog : stderr;
+ 	int rc;
+diff --git a/src/include/defaults.mk b/src/include/defaults.mk
+index 632b155..95be8be 100644
+--- a/src/include/defaults.mk
++++ b/src/include/defaults.mk
+@@ -34,6 +34,7 @@ CPPFLAGS ?=
+ override _CPPFLAGS := $(CPPFLAGS)
+ override CPPFLAGS = $(_CPPFLAGS) -DLIBEFIVAR_VERSION=$(VERSION) \
+ 	    -D_GNU_SOURCE \
++	    -D_FILE_OFFSET_BITS=64 \
+ 	    -I$(TOPDIR)/src/include/
+ CFLAGS ?= $(OPTIMIZE) $(DEBUGINFO) $(WARNINGS) $(ERRORS)
+ CFLAGS_GCC ?= -specs=$(TOPDIR)/src/include/gcc.specs \
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 6a6918931b..5523329699 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://efisecdb-fix-build-with-musl-libc.patch \
            file://0001-Fix-invalid-free-in-main.patch \
            file://0001-Fix-glibc-2.36-build-mount.h-conflicts.patch \
+           file://0001-Use-off_t-instead-of-off64_t.patch \
            "
 SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
 
-- 
2.39.0


