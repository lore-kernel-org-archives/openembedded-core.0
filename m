Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC98C41513
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:28 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.15281.1720960766446322149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n0VLMOd5;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3dab349467dso708719b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960765; x=1721565565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp9A8IkZKHlWOsNgEw0epN5jh+3lEZnK+A2mjSjxZus=;
        b=n0VLMOd5wGCks4fudu9E/XbA01ddwAH7h347tvZQATUH9a23kKLvF/65Qp7RKM/TdV
         8aFqpKBrARNYIt3n9hJ5zjZFAhW3i/M0uXFcr6oaYMMdtHvMUSI7px9CpJlXpCcAScjE
         yAPyJr8EjG4nh85CoDRL2wVqg35lKh12po0MxXI/iUwt+eWSffd6AOJQ0OX2xUYw5qmO
         2IRz0EUYjrkWoQ1AByJhAmQrJN0ZwFso1zwVUzpmvfUVF8KERBz94RjXU6aDfk4aNzwu
         b5rtMZ+R8OxC2Wdo7CB2QkqRiWIRfYQolUyPDoilV7L8buq1GRx8mVVcpN86iS1y6iAR
         0Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960765; x=1721565565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kp9A8IkZKHlWOsNgEw0epN5jh+3lEZnK+A2mjSjxZus=;
        b=jF4pU9oNep59gKyg5VZ7TSxV/FGLXxt9aXgcBbO7gROysiXj0aYfhL9hVjpzM28Py3
         9DDFNpP082UoDc1APZIFBJ05/ajQTf4+3iYrJMA05GkZZNt5bLm2AnYxOkKwtKs7EQ2G
         mfY5c4CLAS/bW+CgJYrrTkHANsLr82F79S1YTTPL9JYwOGFNLMdB7HOcEeaslOGMMKAr
         4ICCDpmPO2ZJFR9KdN5b4z63oCUmprlOCA77L0khlU1MT163LEINU8vNljOZfOHtjQsH
         achksL8wWIaR4wC/DyCSNeHdIS1dljokRZ0mLcUyRu47yzMNpmFgJenNShrH+Vkar0lG
         Y+nQ==
X-Gm-Message-State: AOJu0Yx1nJqPYLaG3qsau7Z/U2S05wUmD/ytgGm8v7qj9UASzHt/anQB
	AAgWXw29N7OwPh0+5Wda4o2aOM7RNVF3nEaAhqHydhaP8119UjfowGkRfHASjS5jLWkTrzye098
	nUg8=
X-Google-Smtp-Source: AGHT+IHjZZR7sf3USWEomRGLcVSClmwfNHVWSD0kD2QNJnSsFv4tfI8zAQjB6gkVbNAxooQD4I8Yvw==
X-Received: by 2002:a05:6808:198a:b0:3d9:2c5a:c81a with SMTP id 5614622812f47-3d93c0a76e5mr19706741b6e.50.1720960765500;
        Sun, 14 Jul 2024 05:39:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/27] libportal: fix rare build race
Date: Sun, 14 Jul 2024 05:38:39 -0700
Message-Id: <d7019c20a6516b1b98c1ce92eae8a536eddf379a.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201869

From: Ross Burton <ross.burton@arm.com>

There is a build race where the libportal.vapi is not always generated
before it is needed to build libportal-gtk*.vapi. Backport the fix from
upstream.

[ YOCTO #15479 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d984e52cded09647b210bd79cfec9deb4b7b589)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...build-race-when-building-GTK-vapi-fi.patch | 49 +++++++++++++++++++
 .../libportal/libportal_0.7.1.bb              |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/libportal/files/0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch

diff --git a/meta/recipes-gnome/libportal/files/0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch b/meta/recipes-gnome/libportal/files/0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch
new file mode 100644
index 0000000000..fb015d3632
--- /dev/null
+++ b/meta/recipes-gnome/libportal/files/0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch
@@ -0,0 +1,49 @@
+From 26f96a178f8a0afded00bdd7238728c0b6e42a6b Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 9 May 2024 18:44:41 +0000
+Subject: [PATCH] meson.build: fix build race when building GTK vapi files
+
+There's a build race when building the GTK vapi files:
+
+FAILED: libportal/libportal-gtk4.vapi
+error: Package `libportal' not found in specified Vala API directories or GObject-Introspection GIR directories
+
+This can be verified by adding "sleep 10;" to the command for the
+libportal/libportal.vapi target in the generated build.ninja file.
+
+The GTK vapi files need to have access to the generic libportal.vapi file,
+but there is no explicit dependency.  Switch the dependency name 'libportal'
+to the dependency object libportal_vapi so that Meson generates the
+dependency correctly.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libportal/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libportal/meson.build b/libportal/meson.build
+index fff7603..4e67f40 100644
+--- a/libportal/meson.build
++++ b/libportal/meson.build
+@@ -168,7 +168,7 @@ if gtk3_dep.found()
+     if vapi
+       libportal_gtk3_vapi = gnome.generate_vapi('libportal-gtk3',
+         sources: libportal_gtk3_gir[0],
+-        packages: ['gio-2.0', 'gtk+-3.0', 'libportal'],
++        packages: ['gio-2.0', 'gtk+-3.0', libportal_vapi],
+         gir_dirs: [meson.current_build_dir()],
+         vapi_dirs: [meson.current_build_dir()],
+         install: true,
+@@ -227,7 +227,7 @@ if gtk4_dep.found()
+     if vapi
+       libportal_gtk4_vapi = gnome.generate_vapi('libportal-gtk4',
+         sources: libportal_gtk4_gir[0],
+-        packages: ['gio-2.0', 'gtk4', 'libportal'],
++        packages: ['gio-2.0', 'gtk4', libportal_vapi],
+         gir_dirs: [meson.current_build_dir()],
+         vapi_dirs: [meson.current_build_dir()],
+         install: true,
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/libportal/libportal_0.7.1.bb b/meta/recipes-gnome/libportal/libportal_0.7.1.bb
index 22e45559c9..6ddfef76d3 100644
--- a/meta/recipes-gnome/libportal/libportal_0.7.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.7.1.bb
@@ -6,7 +6,8 @@ BUGTRACKER = "https://github.com/flatpak/libportal/issues"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main \
+           file://0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch"
 SRCREV = "e9ed3a50cdde321eaf42361212480a66eb94a57a"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


