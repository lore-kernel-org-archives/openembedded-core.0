Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABCECA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:27 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.726.1755790827149874851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z1Ny/UTf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2461864f7f8so5202305ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790826; x=1756395626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WWxqp3vD8HqDl2oxZr+HimFyCmGEw89I0y/p8RIceI=;
        b=Z1Ny/UTf58M51JQpoH2DjvhvizoJjm6cOdWLT40DYYaHFEjwweYku/40MArxEaxiO2
         nwqDjZF1qqkAfaR2rme4kN9VIAcScaiDim9E8/TUps8iakqephsbDo2hlCQirdcUgsLQ
         gz41mxkYnQ0s6isqIw//OYhhbZ00jfotpfvLHglq0WGnBAb0YjIZUKBtY8D4r6VleAuQ
         dGRkX9EviGGtV5ttkFGzKzX57OhLJx8GGVdhmVaKkuV3ZuGF5+zGDP6HlPSrpiuO+P86
         TSrb0zwOkgh6Lb6jBzqXxAeHWHJJ4M9VPJP6qhfhDTN+VmRn38GR5byxGGrgQOkn3/ki
         GtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790826; x=1756395626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WWxqp3vD8HqDl2oxZr+HimFyCmGEw89I0y/p8RIceI=;
        b=tMitsqGpiH3Yc7zs7tyxmuiw+3eL8ARi3vA7qVp2LGiu4khxjVab6uS3JV1OJATd70
         iWkE0ZuygAo9mdtgaR1LJNlntuiEhL0LalqQaO/2RsiOwD7cJRAglaO3C2ykN5nrloHn
         dgEIe402tgC2euUWCYrLpfAUlLzBWz5lChieqpDhXmrXNTXD1HFVbar/34YMbDSY/MPf
         4A7Zh60qOJofmHS8yrTqkI6TYgC54fpeZGV81hT4BArwxLi7khQMP+PwZAxrPgipgN94
         tCkDWTH6Vtw9MBbNshTXQVGdHBeMwo25URgkH/SYMbr7j/xQJaFdXHI1IeSIv50XX3AF
         pOiQ==
X-Gm-Message-State: AOJu0Yw6JQd70U4jj4hsBtKU50WBtLC8Q9El2VKwScCnSWpyDMcFUlUx
	KA2mHpSP2erVsYWAPQ4N/iV//ETvOaIxg/ovRHlo9ZpQu78TEeOTpS2y10fAWuXPnp42sY3C6E1
	YeOpY
X-Gm-Gg: ASbGncvbuzxr9qCAfHeQdapr78fL+KbI96SYTO2oTgqvFmtDr5nVmZitinz8d8uvGG5
	X9xeGSpbQtsES8ATCLNDQH4rw+uws8181T9yg02FaUPEM6G/b5UhgVQ7v/MNlqp8nSqdzyZdDkg
	v1b8wgzdorn/tHCLmQRlPNli0zV9/SM/OdphVWkwx6+bZcMvkaXChrosD3tEtlZ0svOtGw4u1cK
	Ky+rvc0OLPgrR0NL52pOsCSETg6BqYsNImmagMlpC+OlBCssKF64gjEM2cR1jejl7pKGL5oxQtY
	EGQpJpNAfCdJ6AN6sh3MksXioB+W/oM7xdhF3sIeJMThpHm0PixQ8WcSpDKDlHbk5aXX9aM8quV
	cDBJ/7dA7huCPuA==
X-Google-Smtp-Source: AGHT+IFFv5mOVV0XPW5xT06LGYH10i4ceTzaE46OEebebzfJX1GNbeM0tcK4yM5nty2wTdYBxa2BRg==
X-Received: by 2002:a17:903:1b26:b0:240:a889:554d with SMTP id d9443c01a7336-245fedaee4bmr45752715ad.45.1755790826362;
        Thu, 21 Aug 2025 08:40:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 13/15] pkgconfig: fix build with gcc-15
Date: Thu, 21 Aug 2025 08:39:54 -0700
Message-ID: <092ee1703d81b8aaed452189dd329320483087d3.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222262

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
index baf37b0a9b..af512a42b4 100644
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


