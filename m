Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8379DCA0FF7
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6609.1756330232855330976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wZuUXkBy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-248cb0b37dfso2685755ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330232; x=1756935032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6yEYo3jr9hMgTKfHtIjgmWiehvxzw7aG7+rB5Xx5Mk=;
        b=wZuUXkBymKsy3Fqe7V0QCUpHKUlXgPJG7Rve7u/ZA2+PV5xCrD4etoGV87I7jr41yI
         7pPZi5/n58KKDRHWV3pxZN0X71yEEQusqd1cEh5KqRckhryfMI7Q3Wo8QgrE7OMHVo4d
         1OLSanhktotk5Whbj2Xc7SpKyIklHS080OM9Go457bWW99Re2ZtC9kinFTkU6pS2Ganf
         +sPtEbbSvXamDoRJrIu9a9CEYv1eLwykjqmAfvrXvD+ELduH8C4beV5pgWjTfGZIkDLa
         X5HphTdRskVWx0DTWjKsGYgFRMr1IvmG/iIIoLoMbu5DWMid5KzXChRYwFaWja+m+ZMG
         gmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330232; x=1756935032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6yEYo3jr9hMgTKfHtIjgmWiehvxzw7aG7+rB5Xx5Mk=;
        b=N3LsZovZzfe7OgkPSQNWg1WwFE+kELE0g6SoxVUPuuNyhPr0xg87YyU/ZGYq4MKnqe
         tu2URuYka8bmf+0AAo+G9jCEGbiTwXTiqiEafYMlMlwThRUgiOQRGCOI9ZagvnB3FbIJ
         SIDft45n4Nx8zvwqfnImyGtdMdT8z7LHEzTwboway8Rl0RpCwij7nsecY9M4LLRLUPim
         RWOs7LnJRPPyws+qIS3Frgi0L+r/ut16n+UmkQFFpAZqANgblKqgbXKDae7APkI3lsXC
         SsXUFAmLlPuRXbyO3HvrIBVzzGotbpZisi0CctGocQ9QyM0z20fBoNihVf9jAyzjJbu8
         A0+Q==
X-Gm-Message-State: AOJu0Yy9miD/dO/gF2qC6OQL+xxp6rUX8Yl9+dCTtlne+jiV1BVajoWI
	080sXu8LjkZQXVkc+Vb30S02QdR9RChWCb7sSwMiZiV/UQ5LKowSjZTvlojfD9kEvfKyt/gNLkt
	qp7OM
X-Gm-Gg: ASbGnctnXoNpjmkt4xgCcVTLNnTMT1IdmWbF4Bocb6KyKRHEHg+NSoj2NNaGeObsmFV
	2net3Bh7h0zaTi9SFNOqoLIdyRMURt2enHcuL3x6FFq//vPsK8lLVyqJmTFmtxXzRhkPAQSGciE
	Oe2LmHtE0XHdGeqxhY0ynXIKYfak0W52qd+0ZMSBt/78hBOxRVsVnfdudoMViXR9Wm0Awpk7OeH
	qNmpLOuQwphDxtZb0ZSiBpkNEOqM3Pl2JsXjKVx0MYDT4YW5/1YQtal7vQZtRQBV2y64xFPuVCe
	/Eu93GrVLXl5RaURcJfeQjlF4JqQnESm51YFRKvJqUc+ObTD8c6z90G6r7dddu91VD51XCSzdQ2
	poFMVT4sMCzj8dA==
X-Google-Smtp-Source: AGHT+IHtwJ2uVJnVbf8/dLWRLqGaSUE03U/B/GT7iRiFxK0TVaIph3eqJxscom0Kai44k1GgLrwDgA==
X-Received: by 2002:a17:903:32cb:b0:226:38ff:1d6a with SMTP id d9443c01a7336-2462edd7db5mr289072725ad.7.1756330232053;
        Wed, 27 Aug 2025 14:30:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/33] pkgconfig: fix build with gcc-15
Date: Wed, 27 Aug 2025 14:29:29 -0700
Message-ID: <948e0170d83949e2d5a676afb81edc44f07c5ba4.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222530

From: Martin Jansa <martin.jansa@gmail.com>

* on hosts with gcc-15 or whenever glib PACKAGECONFIG isn't enabled
  and pkgconfig uses own old bundled glib

* fixes:
  http://errors.yoctoproject.org/Errors/Details/853015/
../../../git/glib/glib/goption.c:169:14: error: two or more data types in declaration specifiers
  169 |     gboolean bool;
      |              ^~~~
../../../git/glib/glib/goption.c:169:18: warning: declaration does not declare anything
  169 |     gboolean bool;
      |                  ^

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-Do-not-use-bool-as-a-field-name.patch | 36 +++++++++++++++++++
 .../pkgconfig/pkgconfig_git.bb                |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bool-as-a-field-name.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bool-as-a-field-name.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bool-as-a-field-name.patch
new file mode 100644
index 0000000000..bcb7e94d69
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bool-as-a-field-name.patch
@@ -0,0 +1,36 @@
+From b3b26a7e125e5e4f5b69975cc17eb6d33198ebaa Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Thu, 11 Apr 2024 14:40:21 +0100
+Subject: [PATCH] Do not use bool as a field name
+
+C99 aliases `bool` to `_Bool`, and C23 introduces `bool` as a reserved
+keyword. Let's avoid using `bool` as a field name.
+
+Upstream-Status: Backport [Backport from glib to bunlded version in pkg-config https://github.com/GNOME/glib/commit/9e320e1c43a4770ed1532248fe5416eb0c618120]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ glib/glib/goption.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/glib/goption.c b/glib/glib/goption.c
+index 0a22f6f..f439fd4 100644
+--- a/glib/glib/goption.c
++++ b/glib/glib/goption.c
+@@ -166,7 +166,7 @@ typedef struct
+   gpointer arg_data;
+   union
+   {
+-    gboolean bool;
++    gboolean boolean;
+     gint integer;
+     gchar *str;
+     gchar **array;
+@@ -1600,7 +1600,7 @@ free_changes_list (GOptionContext *context,
+           switch (change->arg_type)
+             {
+             case G_OPTION_ARG_NONE:
+-              *(gboolean *)change->arg_data = change->prev.bool;
++              *(gboolean *)change->arg_data = change->prev.boolean;
+               break;
+             case G_OPTION_ARG_INT:
+               *(gint *)change->arg_data = change->prev.integer;
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 16e6c5b609..c67c526aa5 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=master;
            file://pkg-config-esdk.in \
            file://pkg-config-native.in \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
+           file://0001-Do-not-use-bool-as-a-field-name.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


