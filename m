Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.107637.1597919095853903929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RDHCThT9;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id c16so1823255ejx.12
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 03:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ar6KlAKtyzWDcFIbAa/lYVrGWX8deU+h+CXNvDWDP2c=;
        b=RDHCThT9re9NaOzfakXEIdEzVyXk1mIdDrtDe8mgEuRLk9BVIQkBiYg5yuY+aFwjTw
         NVCkaPSq+iStqeIf1sa0z+lYfXbzk86i4B8uK/HENK7xvZF8ArGoufZDZekaxgawX5+j
         ZDZ2+0Aoh/ng+Fu4w20W8NkwhpRyqOuw6qlSNAYY1HDR+9kDrLadxA0Q/2XxSv/c6PU3
         hZ5ixWxVX1zjX5hLWPDBUcdOqmAT7Ba8sO6o4YBwQ9VlKJyLj+zTKhuBMdexDlGf29s3
         tYrtq8duKcIWl9BqROirk97l6iG4JguDY5WcyITY0NcxbZbqTJJu+YhSb6GZ7vsIMu3Q
         K9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ar6KlAKtyzWDcFIbAa/lYVrGWX8deU+h+CXNvDWDP2c=;
        b=tl9lAtmljZbX+k1vJRZ7IVpK4ToC7ZdOA6uLUPfvneTKf6rMh7g3s4WVhq3c0Qu0H8
         1J79QKPDRbFjlCujvUOtFBXyiFhmpJ+lstJ6xaah3K67gJwfpBMp+kXXdDo4UlFEY/Wo
         sY8gNcwJZpEzawHu94AoDx3rknd+i0tupuCs8oumOHexdA4Q9RkzADu3J8biGoo7PZoH
         Uxc3B71SSJCKplcQagutzbJtosfPT/uXfPX5DXgPMX4u8TXUAvflUtyEapF6yR37mGOL
         H0qrM6AyqXZy7U0RUaFFA/Md3LVpvWjjaxFEP6GIsrX3iDUDBIZNkrJIFxITPiqHDMca
         cncg==
X-Gm-Message-State: AOAM5338qyfYRiL6R6w47sCiodNhKdyDJiEe5z5P/+w7qh/Ddg7jUT83
	XdnjjnxhAxvfHBMGUvNpvhSiorvALcc=
X-Google-Smtp-Source: ABdhPJy0HgvWk4yPYD+/vOLG8cH4D36SGBZQB9fUQesNv3MQvOUKssjkARRS7bOmaGydNBRp2q9NHg==
X-Received: by 2002:a17:906:fc10:: with SMTP id ov16mr2645845ejb.171.1597919093240;
        Thu, 20 Aug 2020 03:24:53 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-76-105-136.eu-west-1.compute.amazonaws.com. [54.76.105.136])
        by smtp.gmail.com with ESMTPSA id du2sm1230795ejc.2.2020.08.20.03.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 03:24:52 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/7] systemd: Fix path to modules-load.d et al
Date: Thu, 20 Aug 2020 10:20:36 +0000
Message-Id: <20200820102041.28077-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820102041.28077-1-alex.kiernan@gmail.com>
References: <20200820102041.28077-1-alex.kiernan@gmail.com>

Following 4a56315a990b ("path: use ROOTPREFIX properly"), the paths to
sysusers.d, sysctl.d binfmt.d and modules-load.d changed to /lib when
building without usrmerge, which aoppears to be an inadvertent ABI
change. Undo this change and track upstream:

  https://github.com/systemd/systemd/issues/16773

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...0001-Use-PREFIX-ROOTPREFIX-correctly.patch | 81 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_246.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch b/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch
new file mode 100644
index 000000000000..c61941df9181
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch
@@ -0,0 +1,81 @@
+From 2868e3b72d4ac02860e380d70c9af0d61a985790 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sun, 16 Aug 2020 16:07:12 +0000
+Subject: [PATCH] Use PREFIX/ROOTPREFIX correctly
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-status: Pending [https://github.com/systemd/systemd/issues/16773]
+---
+ meson.build                      | 1 +
+ src/core/systemd.pc.in           | 8 ++++----
+ src/libsystemd/sd-path/sd-path.c | 8 ++++----
+ 3 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index dbbddb68e232..18618dba0623 100644
+--- a/meson.build
++++ b/meson.build
+@@ -226,6 +226,7 @@ conf.set_quoted('SYSTEMD_SHUTDOWN_BINARY_PATH',               join_paths(rootlib
+ conf.set_quoted('SYSTEMCTL_BINARY_PATH',                      join_paths(rootbindir, 'systemctl'))
+ conf.set_quoted('SYSTEMD_TTY_ASK_PASSWORD_AGENT_BINARY_PATH', join_paths(rootbindir, 'systemd-tty-ask-password-agent'))
+ conf.set_quoted('SYSTEMD_STDIO_BRIDGE_BINARY_PATH',           join_paths(bindir, 'systemd-stdio-bridge'))
++conf.set_quoted('PREFIX',                                     prefixdir)
+ conf.set_quoted('ROOTPREFIX',                                 rootprefixdir)
+ conf.set_quoted('RANDOM_SEED_DIR',                            randomseeddir)
+ conf.set_quoted('RANDOM_SEED',                                join_paths(randomseeddir, 'random-seed'))
+diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
+index 8424837824b5..410a126317ad 100644
+--- a/src/core/systemd.pc.in
++++ b/src/core/systemd.pc.in
+@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
+ tmpfiles_dir=${prefix}/lib/tmpfiles.d
+ tmpfilesdir=${tmpfiles_dir}
+ 
+-sysusers_dir=${rootprefix}/lib/sysusers.d
++sysusers_dir=${prefix}/lib/sysusers.d
+ sysusersdir=${sysusers_dir}
+ 
+-sysctl_dir=${rootprefix}/lib/sysctl.d
++sysctl_dir=${prefix}/lib/sysctl.d
+ sysctldir=${sysctl_dir}
+ 
+-binfmt_dir=${rootprefix}/lib/binfmt.d
++binfmt_dir=${prefix}/lib/binfmt.d
+ binfmtdir=${binfmt_dir}
+ 
+-modules_load_dir=${rootprefix}/lib/modules-load.d
++modules_load_dir=${prefix}/lib/modules-load.d
+ modulesloaddir=${modules_load_dir}
+ 
+ catalog_dir=${prefix}/lib/systemd/catalog
+diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
+index 736795d1d797..3572916dc073 100644
+--- a/src/libsystemd/sd-path/sd-path.c
++++ b/src/libsystemd/sd-path/sd-path.c
+@@ -371,19 +371,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
+                 return 0;
+ 
+         case SD_PATH_SYSUSERS:
+-                *ret = ROOTPREFIX "/lib/sysusers.d";
++                *ret = PREFIX "/lib/sysusers.d";
+                 return 0;
+ 
+         case SD_PATH_SYSCTL:
+-                *ret = ROOTPREFIX "/lib/sysctl.d";
++                *ret = PREFIX "/lib/sysctl.d";
+                 return 0;
+ 
+         case SD_PATH_BINFMT:
+-                *ret = ROOTPREFIX "/lib/binfmt.d";
++                *ret = PREFIX "/lib/binfmt.d";
+                 return 0;
+ 
+         case SD_PATH_MODULES_LOAD:
+-                *ret = ROOTPREFIX "/lib/modules-load.d";
++                *ret = PREFIX "/lib/modules-load.d";
+                 return 0;
+ 
+         case SD_PATH_CATALOG:
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_246.bb b/meta/recipes-core/systemd/systemd_246.bb
index 11e3cd29665b..704a36e75d6d 100644
--- a/meta/recipes-core/systemd/systemd_246.bb
+++ b/meta/recipes-core/systemd/systemd_246.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
+           file://0001-Use-PREFIX-ROOTPREFIX-correctly.patch \
            "
 
 # patches needed by musl
-- 
2.17.1

