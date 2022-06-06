Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CADC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:15 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.32827.1654526350547988315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rl7ynGzj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id r71so13101703pgr.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aJ1yLLJ92tqSnx9rWIRrFltwlNxZGMUKwQ2fGpeb/tc=;
        b=rl7ynGzjzJ+4+ljaIAprlV3okSG7sU8ZFZZYfY61OdrmYJiRWWU5IwXhYlpl6abPj4
         neFkHVyGMPpKGQifoI9AW9Jlpols9n6C28Ik7qSIPReYsO6QUALiuW3HAClZ3bdMc0ls
         CnWYidQk6/mUaPfIKXzLnMA+4ugeS6w81AX80meBnFsBchhsPSUDLEl02fd55HT7g4hY
         ihnMdYekjp6v9X2HBvi91VDU8qctOmKIV+bPtur9Iyn0T+tJDWbRP8nZcWqh79gNGIi+
         WbIVV1A6SRDKicGrjVTDNQP23ZRrVskfTWeVul2Sr/IQOStZ35N4dVjr/yB9Iw8XcIsE
         V+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJ1yLLJ92tqSnx9rWIRrFltwlNxZGMUKwQ2fGpeb/tc=;
        b=o0A20J3LQqvQJvUQUiARM76XB6iO6YWVR334u5lAo9zKDpYsuU/57s7sAm6Ggsurvc
         jLOlBA5Ogd3ii+SdbTRoDwop4TIXvcBnwZ9PxhsOoiP9RuSr9XkSVWWZ87MJOjnIX1db
         COfA6eJXeCyS9g8GPAUoPUpm8nh311R5PsBtzNQ/sisaLnZAw3/hK8VWJmZgK1jDezqx
         LXwDb1jnyuYjS4AsJmL7ZUWvepTHvi8fAUNY3ZFeY314eOXDzId4PZrnmh6xV8LdBcXZ
         1WWVRibGlMu5oP7oANjEXHo2orjPUXAutgA8FNJmzt5prrAHpPEz3HKCw9pxln0zSu+4
         VG2A==
X-Gm-Message-State: AOAM530KPfsVfCc48eiKzFGmLBEJP3oiR1ibmHg9yvyJcvA5A1IfYSgx
	HUMezkQGXa8c4kQyP/I8NFjx+jNaxbFpBnhO
X-Google-Smtp-Source: 
 ABdhPJyGDbPwlBaWd7GuL4kuQxKx6vRWLUMiX2ZR/r7RH8JEtd4xAHnSPsxu/S+Fm2YdScF15mg7iw==
X-Received: by 2002:a63:305:0:b0:3fc:7f18:8d7 with SMTP id
 5-20020a630305000000b003fc7f1808d7mr21256906pgd.186.1654526349531;
        Mon, 06 Jun 2022 07:39:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.39.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/13] systemd: Correct path returned in
 sd_path_lookup()
Date: Mon,  6 Jun 2022 04:38:26 -1000
Message-Id: 
 <4851c836529a47210934d865ed6bdc724ed50a2f.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166641

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

In oe-core, sysusers.d/sysctl.d/binfmt.d/modules-load.d are still kept
under /usr/lib instead of /lib changed in systemd v246. This patch
corrects the SD_PATH_{SYSUSERS,SYSCTL,BINFMT,MODULES_LOAD} returned
in sd_path_lookup() back to the /usr/lib ones.

Also updates the patch description and upstream status.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8d913ab6db3ae4b2786a64a086d519a40dcb8c4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 +++++++++++++++++++
 ...se-ROOTPREFIX-without-suffixed-slash.patch | 42 -----------
 meta/recipes-core/systemd/systemd_250.5.bb    |  2 +-
 3 files changed, 74 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
new file mode 100644
index 0000000000..31efc4cc4b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
@@ -0,0 +1,73 @@
+From beb0219b71510bc63aed81d2a970a04349d6c616 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Sep 2020 18:01:41 -0700
+Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
+
+These directories are moved to /lib since systemd v246, commit
+4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
+the old /usr/lib is still being used.
+
+Upstream-Status: Inappropriate (OE-specific)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+---
+ src/core/systemd.pc.in           | 8 ++++----
+ src/libsystemd/sd-path/sd-path.c | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
+index fc0f8c34fa..65996bbed8 100644
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
+index ff1e0d5f8e..19a001f47e 100644
+--- a/src/libsystemd/sd-path/sd-path.c
++++ b/src/libsystemd/sd-path/sd-path.c
+@@ -362,19 +362,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
+                 return 0;
+ 
+         case SD_PATH_SYSUSERS:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/sysusers.d";
++                *ret = "/usr/lib/sysusers.d";
+                 return 0;
+ 
+         case SD_PATH_SYSCTL:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/sysctl.d";
++                *ret = "/usr/lib/sysctl.d";
+                 return 0;
+ 
+         case SD_PATH_BINFMT:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/binfmt.d";
++                *ret = "/usr/lib/binfmt.d";
+                 return 0;
+ 
+         case SD_PATH_MODULES_LOAD:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/modules-load.d";
++                *ret = "/usr/lib/modules-load.d";
+                 return 0;
+ 
+         case SD_PATH_CATALOG:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
deleted file mode 100644
index 752824688f..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 58860e0f248576a80ff2af256ba42713c186ae93 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Sep 2020 18:01:41 -0700
-Subject: [PATCH] systemd.pc.in: use ROOTPREFIX without suffixed slash
-
-This complements the commit
-https://github.com/poettering/systemd/commit/b612c26ceb9f56af0271fc9f07c1724d2d260a8a
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/core/systemd.pc.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
-index b5cc8f9..21dbf30 100644
---- a/src/core/systemd.pc.in
-+++ b/src/core/systemd.pc.in
-@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
- tmpfiles_dir=${prefix}/lib/tmpfiles.d
- tmpfilesdir=${tmpfiles_dir}
- 
--sysusers_dir=${rootprefix}/lib/sysusers.d
-+sysusers_dir=${prefix}/lib/sysusers.d
- sysusersdir=${sysusers_dir}
- 
--sysctl_dir=${rootprefix}/lib/sysctl.d
-+sysctl_dir=${prefix}/lib/sysctl.d
- sysctldir=${sysctl_dir}
- 
--binfmt_dir=${rootprefix}/lib/binfmt.d
-+binfmt_dir=${prefix}/lib/binfmt.d
- binfmtdir=${binfmt_dir}
- 
--modules_load_dir=${rootprefix}/lib/modules-load.d
-+modules_load_dir=${prefix}/lib/modules-load.d
- modulesloaddir=${modules_load_dir}
- 
- catalog_dir=${prefix}/lib/systemd/catalog
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 81fe0c88e0..006b2f86ea 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -23,7 +23,7 @@ SRC_URI += "file://touchscreen.rules \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
+           file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            "
 
-- 
2.25.1


