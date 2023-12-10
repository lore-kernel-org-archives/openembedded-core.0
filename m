Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51E0C46CC5
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 20:25:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.63104.1702239952590929758
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 12:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7Ydh5RH;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ce939ecfc2so3145050b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 12:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702239951; x=1702844751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jO7A2PTVpybtGsQBvnypA23A2TCoIHZ9hsklKJx6+E=;
        b=c7Ydh5RH2GaeEa60VJt+p9MEtWRk0bUwqbzmOE1BO2ASgU2n9zICPT/nUcboZvsO6E
         3yr/tlL8AtaMFasdytY3xLTZgcYuvVWAqaLjlwqpXZSlGcwoh57rRDPJtOt1h1846MWz
         PNRrGP52WRDWJZY/WFuIL8W5dxJUpqyhD4docoY/wP5VUEMjHSxpC4aSn+wjROWI7Hqm
         3/uRiQq5Glos+8oYEd7koyoHaPc78UK9aA7vmFdgRwklnnN9xQaeLtqMqlN507gCtbfg
         GCRyzC3qlWL+H2Rp49Q1Hv6/xExrPhOwNevg85iWXaO/hL0gWdUNmmU3zzoWutWb8TmU
         +GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702239951; x=1702844751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jO7A2PTVpybtGsQBvnypA23A2TCoIHZ9hsklKJx6+E=;
        b=wvwhbxwnXMoWGc4TP8rcb4g+COkrCFcPJ39aDw6PfBJPcMfDxuAgDLQZ04OU+ogaNE
         56aaN3/YMpa7KEXhV8ycPD8NpkJ3wVgfFxG27lL3GD7KF+pIuMD4Tlvl2YkKLHjfxq/N
         HmDc70vk9PoGyVIPuv5zuQDXDgWg+6TQZkDciWmzD5Ln1esZd0pEN9qZhuu675A6CfZ1
         /Taq6PgDDqcH91RhwpTh9oxVysju9jQPZoI7buZ6rsgEwb0KLvmX8AsleGXkcTOUC6hB
         VPbv4aHspCglj+qxbzrVC/lYKo3jXMG3byKAnEXLzwEOeAghyXFDSHjeLeHlecLCN6x2
         umbw==
X-Gm-Message-State: AOJu0YyzDdF0dxqOtMYAfX1cKzUDloKL0tFyQc18xSbOt3lqX4BbcM+a
	okm9czxFD+Mv9DYi3kK6V7qcZjwqcao=
X-Google-Smtp-Source: AGHT+IFq1XnAsdAcXgAbRcwB1+lYkO3GqvvETLgtz1/VPLyJoUlLIQUgGO3N3byiDfxP+5fRWZYF7w==
X-Received: by 2002:a05:6a00:3906:b0:6ce:fb65:3ceb with SMTP id fh6-20020a056a00390600b006cefb653cebmr2208522pfb.51.1702239951533;
        Sun, 10 Dec 2023 12:25:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:3d00::76f0])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78558000000b006cee23e7677sm4246487pfn.210.2023.12.10.12.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 12:25:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] opkg: Use own version of portable basename function
Date: Sun, 10 Dec 2023 12:25:44 -0800
Message-ID: <20231210202549.155550-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 20:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192119

Fixes build with upcoming musl release.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Provide-basename-function-as-utility.patch | 131 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.2.bb      |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-Provide-basename-function-as-utility.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Provide-basename-function-as-utility.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Provide-basename-function-as-utility.patch
new file mode 100644
index 00000000000..91b00bb4085
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Provide-basename-function-as-utility.patch
@@ -0,0 +1,131 @@
+From c3770c1254a288f1312a66ebf4a5da60a1ae215b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Dec 2023 17:07:22 -0800
+Subject: [PATCH] libopkg: Provide basename function as utility
+
+glibc provides two implementations one when string.h is used and Posix
+compliant one from libgen.h when string.h is not included. Lets
+implement gnu compliant version using strchr and use it Everywhere for
+portability reasons. This will help compiling with next release of musl
+where signature is removed from strin.h [1]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/11]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libopkg/opkg_archive.c  | 2 +-
+ libopkg/opkg_download.c | 6 ++----
+ libopkg/opkg_remove.c   | 2 +-
+ libopkg/pkg.c           | 4 +---
+ libopkg/xfuncs.c        | 6 ++++++
+ libopkg/xfuncs.h        | 1 +
+ 6 files changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 03a4afb..da37d8a 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -797,7 +797,7 @@ int gz_write_archive(const char *filename, const char *gz_filename)
+     }
+ 
+     /* Remove path hierarchy, as we are only compressing a single file */
+-    archive_entry_set_pathname(entry, basename(filename));
++    archive_entry_set_pathname(entry, xbasename(filename));
+ 
+     r = archive_write_header(a, entry);
+     if (r != ARCHIVE_OK) {
+diff --git a/libopkg/opkg_download.c b/libopkg/opkg_download.c
+index 4086f83..130a8c1 100644
+--- a/libopkg/opkg_download.c
++++ b/libopkg/opkg_download.c
+@@ -158,7 +158,6 @@ static char *get_cache_location(const char *src)
+     char *md5sum_hex;
+     char *cache_location;
+     char *short_file_name;
+-    char *tmp = xstrdup(src);
+ 
+     md5_buffer(src, strlen(src), md5sum_bin);
+     md5sum_hex = md5_to_string(md5sum_bin);
+@@ -168,14 +167,13 @@ static char *get_cache_location(const char *src)
+      * MAX_SHORT_FILE_NAME_LENGTH to ensure that the total cache file name
+      * length is reasonable.
+      */
+-    short_file_name = basename(tmp);
++    short_file_name = xbasename(src);
+     if (strlen(short_file_name) > MAX_SHORT_FILE_NAME_LENGTH)
+         short_file_name[MAX_SHORT_FILE_NAME_LENGTH] = '\0';
+ 
+     sprintf_alloc(&cache_location, "%s/%s_%s", opkg_config->cache_dir,
+                   md5sum_hex, short_file_name);
+     free(md5sum_hex);
+-    free(tmp);
+     return cache_location;
+ }
+ 
+@@ -361,7 +359,7 @@ int opkg_download_pkg_to_dir(pkg_t * pkg, const char *dir)
+     char *url = NULL;
+     int err = 0;
+ 
+-    sprintf_alloc(&dest_file_name, "%s/%s", dir, basename(pkg->filename));
++    sprintf_alloc(&dest_file_name, "%s/%s", dir, xbasename(pkg->filename));
+ 
+     if (opkg_config->volatile_cache) {
+         url = get_pkg_url(pkg);
+diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
+index 889c672..e9d5714 100644
+--- a/libopkg/opkg_remove.c
++++ b/libopkg/opkg_remove.c
+@@ -215,7 +215,7 @@ void remove_maintainer_scripts(pkg_t * pkg)
+         return;
+ 
+     for (i = 0; i < globbuf.gl_pathc; i++) {
+-        filename = xstrdup(basename(globbuf.gl_pathv[i]));
++        filename = xstrdup(xbasename(globbuf.gl_pathv[i]));
+         lastdot = strrchr(filename, '.');
+         *lastdot = '\0';
+         // Only delete files that match the package name (the glob may match files
+diff --git a/libopkg/pkg.c b/libopkg/pkg.c
+index 6b1bd8f..3d13fed 100644
+--- a/libopkg/pkg.c
++++ b/libopkg/pkg.c
+@@ -271,10 +271,8 @@ int pkg_init_from_file(pkg_t * pkg, const char *filename)
+ 
+     pkg->local_filename = xstrdup(filename);
+ 
+-    tmp = xstrdup(filename);
+     sprintf_alloc(&control_path, "%s/%s.control.XXXXXX", opkg_config->tmp_dir,
+-                  basename(tmp));
+-    free(tmp);
++                  xbasename(filename));
+     fd = mkstemp(control_path);
+     if (fd == -1) {
+         opkg_perror(ERROR, "Failed to make temp file %s", control_path);
+diff --git a/libopkg/xfuncs.c b/libopkg/xfuncs.c
+index 9ee1a7d..11e3d92 100644
+--- a/libopkg/xfuncs.c
++++ b/libopkg/xfuncs.c
+@@ -110,3 +110,9 @@ extern char *xdirname(const char *path)
+     free(pathcopy);
+     return parent;
+ }
++/* implement Glibc basename behavior */
++const char *xbasename(const char *path)
++{
++    const char *tmp = strrchr(path, '/');
++    return tmp ? tmp+1 : path;
++}
+diff --git a/libopkg/xfuncs.h b/libopkg/xfuncs.h
+index 5d278b4..0d4ef32 100644
+--- a/libopkg/xfuncs.h
++++ b/libopkg/xfuncs.h
+@@ -30,5 +30,6 @@ extern void *xcalloc(size_t nmemb, size_t size);
+ extern char *xstrdup(const char *s);
+ extern char *xstrndup(const char *s, int n);
+ extern char *xdirname(const char *path);
++extern const char *xbasename(const char *path);
+ 
+ #endif                          /* XFUNCS_H */
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
index 46be137354c..02f4a46561e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -15,6 +15,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0001-libopkg-Provide-basename-function-as-utility.patch \
            file://run-ptest \
            "
 
-- 
2.43.0


