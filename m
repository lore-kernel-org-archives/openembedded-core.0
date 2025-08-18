Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5CCCA0EEB
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 14:39:38 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.77029.1755527968758073862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 07:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jylMn9IM;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b690517so6220587a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755527967; x=1756132767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwsR03Uue8dsaQ4uKW0J7Xrx2OmNjBgu/8RuQqw7h3M=;
        b=jylMn9IMKfKFVxqD/WkSCtpFrGOfi0k2mj8Y+U5nSDHWzENl40zg8h1G19UmtJwITr
         nsWNPpL0+mbGL2iIN82oQY4H/qlE19mefw/pe7XRaqywZrbckl+dIol7n/hsrQYatSAu
         EaZAOczdFnrAf/6p7yFdkrA+FuHSjw5XJt09b5+4cohBAee3Wc1OEXD/CST+GUeg9O1W
         3fHPCoEhUZrQwMMy3QRMlLaSTE+BqaWoilL2rXtG6yOobnxsHIVo9Be0pdxyIJVOFYLR
         7LCzL4OtlR44gaBt1v5DOhRry6ExIdTRw2Sufr9FsJtb/6w4TifsQcvrq3aR+7CDa31i
         u0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527967; x=1756132767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwsR03Uue8dsaQ4uKW0J7Xrx2OmNjBgu/8RuQqw7h3M=;
        b=LLSNiuYo6XmcxIYDFq5VDgPYszY663Z+E4NnhU3ONKDWDQ3v/6NKaa5fUybPqJ7fvU
         fuzKaEayZtIuRLzYe1AE9AF2GL2b6Amd0Ty+/fSQz/l0M63ZRxLwXrRxYijYzrmafMcl
         OZqJPjDXT7Ibv9oy4KCb2dPJ4+oUSs1CTx9Bbp450piluQegho0tgrC5S7g9rzhNHStC
         LhR0VIdgrk+DyUsEzSr6bc9cbmeWfcFudvrZvpgxsLDvj/4XSmYxwBewpYxfUyDjcWVi
         C4T7o8K6K1OKgWEGEGB4nqRfLJFpTyRo8XztgljNm27OYOpnznGnsctHxVePYAja4FcW
         g2sQ==
X-Gm-Message-State: AOJu0YzSROtx95RfTzGKFvUvhZWlZmRB9cbLzfd+UYM8lBYQMPaKQVJx
	MHCrDhZyq0ediKkGRuIQVooxJ11PVs41dMfsy9VYhUsf7xwGqyR5jRMdzFDTGA==
X-Gm-Gg: ASbGncsEV7jh6u7ToxnqCFxEw4V6dHjREySTngomBYoaEQ2tqR6/GDMdyLYmL08NkIb
	zOwLsO5jUMiNv+7G2tsxFAtD4WfhtbIFZgA/XXcYgxigspMGPZV7RStoQ8GEc7gSeQNCF1rofj8
	CapnAh3Q7M3PbJVV6syWkxnWemwkYUmgtdGg0SOzRfSwuC8ZnEQz6actpRC4W0e5QJEOnlKylxb
	UtUM3dPAbXqej1wL7Geo7gLagwJvrFuBlwq/E4JMImB2caK7pVtLjjZ4L8FFbrP/fF7FVuaTfJT
	bhWNXCyi13bJ9ZBMu8FYEOyI17DS0MS6XyXt3bNYpSVGMRM+70Zk5YtZcl2N12iRHcyLzMHXHAA
	D9iEb7wCMdK4JopWJtvhV4vLZzw==
X-Google-Smtp-Source: AGHT+IG0MkM+u4yACNRwoBicHwjkhllIZKSl6nE9m4QnSvnIOnCLlg/0fkfPnrc2rkFDNShKF+UBCA==
X-Received: by 2002:a05:6402:3508:b0:618:5f4c:894e with SMTP id 4fb4d7f45d1cf-618b0514d34mr9907360a12.8.1755527966756;
        Mon, 18 Aug 2025 07:39:26 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-618b01ae593sm7303092a12.32.2025.08.18.07.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:39:26 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 1/2] pkgconfig: fix build with gcc-15
Date: Mon, 18 Aug 2025 16:39:22 +0200
Message-ID: <20250818143923.908157-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 14:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222038

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

