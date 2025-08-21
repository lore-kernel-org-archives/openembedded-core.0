Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A905CA0FEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.2523.1755816208582258931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ES35i4KF;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61a8b640e34so3089529a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816207; x=1756421007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nlm6ofmbb8ze5KB+j2PUXuYBXfsEJbkTSdCl/RR+iqs=;
        b=ES35i4KF2J04zLdOC+BPddB2pWxZ8Rd3Bnb0tQl78uriHmHRm9gjF73joHGxmK7Tm1
         bu6jW1sXIKXcUFey/UE84EgrYZqfWBZue4z0D9EM7TgQz+lHpcEkJeF6bB51azO68kLI
         s6mlFqDckpRxE+pW62x4+oEvl7e11kiXb7a/VgDtsWqUVNaVofA0Xi15DqcD1tYpmETc
         LtanSNxrOPZuLhyuaAAZyBj9REWJMs/mfsr3HaZvPfFu3u7aQrY8opIroTxN7tpxAOY/
         SQXI+sVn4KmJJ1ohGBIfrJTNpUKOGmeX8MbQDAEgEAh6b1kevMd3DfkE5i2A61N0Eu4U
         e/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816207; x=1756421007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nlm6ofmbb8ze5KB+j2PUXuYBXfsEJbkTSdCl/RR+iqs=;
        b=fFH53AMpwWYi5Hltb/cSclHZfOEL5wSJjfwKpBXWwU0ZNf0HHK6tfQv8rI7JB+ec2q
         sl9EireRDcAw2LJSz5faFjmqaVsAP9dySAE8hXuBxVMDvzIVqRIu0JepU97+jza8GJwQ
         4DA9lxcVYBy+UpGzrJsgD63/MBuQ1lwPyAkK5w2Q0RU7/8tqXjE1onlQVsgJU2DK4Oyr
         K5bNdvqQGH7nysVYvRk2j4fndxSsJdfGUnO82dNOLi6J+aJR1yxmTSdB1uvlC5+Bltre
         X9boxs9Ms7yl/Qbf34Pg9exCheWhC7D0cdJGkmsHBa6SnPMmekm+Gyp68Nklr6htG5v+
         qaig==
X-Gm-Message-State: AOJu0Yyu6w3wfqugbII0UGTU4IdQFIaP6+HL+l+Zu8IEk6F/IGFogwLY
	vDwS3EBFChOsRZDwmLsjqythoiIyCoWIY3Ty1YaVa2gZY/PCL1NyXj6tYkjSDg==
X-Gm-Gg: ASbGncuczdeyAQ2u6Lwdno2sEvgJ3HQBhyQ5sh+5XWbRmvFU8/H469qPdAuLweCKx0T
	HpEs2QThVprMn4HLJ7uWWJIj6Zl9C1I3JL/rodhVpTW3WiUopkHktYEYeBemxl0bJtZqPrVq1Hp
	ny21JfeKkb1bf+UOabjs7JonWatkLO3WzG3qYbVNFNMvw70VjUY5S9iG2BYb2cGtHQ/YNmHhQTS
	C62B6xRbVR2QIL1bGsLbyfsnjvFChpwwc6LrUsbeUWGF4MP6+QEV2vya23uLSaLnDtF1HFd9v8S
	IVtKJhv+gHCIAY0OAmbV08GDy7AxBaUhC+rQoW1u4QM+04+E7h0yhTq1N5S+1lG0scDLqrRVLll
	mDtneIA4qcMuH5cQn4NG78ppKbUZIXNcVaAcc3i5SWRaqG9Gr/z+MwuLm
X-Google-Smtp-Source: AGHT+IHNbUMf5H9fJId3665RcKQYHWSVay1Ek0b/ISmkhEpEFz6a1A5ZSNhRTjPFPONkyfElLx0N7A==
X-Received: by 2002:a17:907:1c99:b0:afd:d994:7d1b with SMTP id a640c23a62f3a-afe29749978mr62883666b.64.1755816206876;
        Thu, 21 Aug 2025 15:43:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded478d5esm472304266b.72.2025.08.21.15.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:26 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 07/15] pkgconfig: fix build with gcc-15
Date: Fri, 22 Aug 2025 00:43:01 +0200
Message-ID: <20250821224314.1690103-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222292

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

