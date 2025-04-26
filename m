Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66B6C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 13:42:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9053.1745674922702792448
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPwIjPVd;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39129fc51f8so2445563f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745674921; x=1746279721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CXfLo567pNbqbNtbnXr0zvNaXLP++1f8SG1CdIrK7FI=;
        b=VPwIjPVdbQcbflYJ28DmgxmHYrZVAfgO+1a7ZyDBd9GmLPlNYvd6pyfoL3f/uENrxI
         pq86phcFYLQ9aXx+zKDWZr8sARDD7XOEM+wng101cD2fjnyZ9DwdTI/oEgahvxei1JRy
         lJins0b1TqFpIW08v7qQON+W8WnlKanHz32N9MjmIMlVVFV0EhuYHlqHkcKXLAv5nI9T
         wEC8siwEcfc0MB1xeXnW85I46bo6f0cXxFx9j6UxQua3vzzTk/3Ucr/uyQN2KnxcRNWL
         ri3r+nTykiyuhukE/6ruGc1+NN/MXpmq8LEPz5K3o7Cwx9iQJSymTXbEFKT3CnkTnTMG
         bXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745674921; x=1746279721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXfLo567pNbqbNtbnXr0zvNaXLP++1f8SG1CdIrK7FI=;
        b=Q5Z9pDtwbkG6R7l0+zJcZs71apxiiGuEUuNUQVBtKKAKqrt7cUqx3KmEH5OO+AJda1
         aeJLQWXmLIw9MWinpF4RtPxnmwvRT8LEPsiJtMahLFH+6ntuESIlxlcdjhOgUeTdK3Cn
         Hv2z+Fm7yXiOnyQzQHQ9F2jniLLS8yMpFX9EASFECoQxwYrRyKrgEvhbrWEbNpr2ZP8H
         e2cUBN4syuQ2nOA+a+bQGLTdjKqWDSpZFtIkho54BWUGv7+5VlQvSc/KT03K56o0HQV+
         GMJR+4DRFK1miEhJL7lj9rpD2W7TDh8kgGQXjve0XtxFOhQRg+z9ZaIOihFkAOtuXmjP
         UxvA==
X-Gm-Message-State: AOJu0YxxpVX/G9PP97mc7ZwjJYe7E3v3KX0PHzwzuGyoNXodvdwi59v+
	CjOaRqM5nxsbdpUU+Swj6+APqO6YqsyDU2/mWBLdFalhrjIYHn65orxQQPZF
X-Gm-Gg: ASbGncvm/nT8VH9YJrCym/Og1F2J5btIVNhuZ+c1EPAcZEuuOhCWwhclLGdjV14K7al
	9ZD0j/o2fXILjWeLR8+C4D5C8Sq+RCCxpvCuZNvblh+4ylSNuy2n9N6jcKiNIXKJ1hPgRy+quDl
	YPB1GAefQ5GIb7YLsYstPH5AoCuWhYKfiKVN70zExY1hh1ljCmfpeQnB65DWDy31LS9LybGslRg
	YX/qzbJ1z4JnGJM39EjN5nl1gqAvrB5Fd2jOExlewToMj6dAw87JtXorN2pqIfDOrxggltpiX6+
	wFuk4zJ94c95R0UWyAE1X7wPc4WFwklkaEEbbo/NXyTECl9lQ80wAQL+BTjs8m7CyIu3lGY+hA=
	=
X-Google-Smtp-Source: AGHT+IGkt7IVvnGsCfl4EIOi7YFc/CDF2YiQQY9WWzm/0eAvUknNcqvceA7yMuVjW6qe5kaEjnvnkA==
X-Received: by 2002:a5d:5986:0:b0:391:2e31:c7e1 with SMTP id ffacd0b85a97d-3a074e146d1mr4205582f8f.4.1745674920938;
        Sat, 26 Apr 2025 06:42:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8c973sm5639969f8f.5.2025.04.26.06.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 06:42:00 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] pkgconfig: fix build with gcc-15
Date: Sat, 26 Apr 2025 15:41:53 +0200
Message-ID: <20250426134153.2801555-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215519

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

