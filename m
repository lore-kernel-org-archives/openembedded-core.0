Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E919C3ABA5
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:27 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.8215.1745981659336181256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3FubhBIB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301c4850194so5522888a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981658; x=1746586458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1KUZF6gfgZN4WGnoZE4k31FMMjBqKj5JPmBx8MwGVk=;
        b=3FubhBIBGShYB0ov1hIs10yVy6XXXHpldzUZjRT8Tneu8paiwEo37kXpvHuDmZEcNo
         UufS32ZyPajnwZoblXIscsCAv9hWf9+Nyzjx/rncAd77OeRovc95z+JGTeYd36ELPSu1
         +UFq2Jsm67dpDP/64ONQRsBMyXLR7g5RWSKHgSlzBvUuGxfGgZ5FrTWkU81oYm44Z5YY
         0k7Nkl4RVWvjA3mWt1nzvPyVhHzm+kUGwklLBbmg0zA16YFsYgxgs3qdV0OZr0R+iPpf
         BPZCyCncn52X/L/igxWdDqEkNhZMdqU07oqVUCdm7WhHqr4fGkCdrAu/jAyB/RNup38c
         nbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981658; x=1746586458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1KUZF6gfgZN4WGnoZE4k31FMMjBqKj5JPmBx8MwGVk=;
        b=eaVHedR1NvQYbx47VC30DzPd/rSxMJQmicJhS2cz8KeQoibYK6oFf8wJrXgpuTV1uk
         9YDNnl6Emik9sO5Wa6JT2X/bPtJ2faMVvETMLD3d6E4HuK3MqaiExHN6i3j9u0ozgfBZ
         VDQauGuILIvbyOBcuX783RK3o1oQdgmOUcryPd13fBWxlZYefCpUTZw1oHhiTvaX5afv
         91yMxcRDRqR1mKQZkt+iyzcla1YqHJf5wVJd1v8LK4iSWU7MiaFNi+2YpQRyhpT2PRON
         rw3mgIx6h++Yr+gahYr9/2KYmznCYX97rzcpaA0b/yyZXaCic7mypeldXbfuogBEsiZN
         hZfA==
X-Gm-Message-State: AOJu0YwCFmTCqYTXBbPNEOwy1QdZEVL94WIY5A6eEYTGfCMLQOnGSOC/
	90Kl/p02VU4Yibx07FB4bbwglDDav+05XtKX37wZ0xOQuLdQ+yquuQ0vjb51DU5nm6+OkiqV29C
	a
X-Gm-Gg: ASbGncs4MbxsitSpn9f6UBlNvaZIk85vdTfPAxf/+N1rWlPG+lTk90oajzvIQI/mmTZ
	x/cVat7/t+3X8bmdqWki+hbX9hvObSuYI43xf4uuidvkyIah0uySQQtWzL7vvN+9wlXMpZaUHBX
	YzLT4UzYj478HOIAZbxSbrE6h1csTRMf/extz9E75ajkCeYG2BNLPT/vlL58rZXx+S6kx4iWGb0
	bNwDeBlFoeEiUqOd5rSLqVsPqrCasQpxMKo9cVsjVeBSYKhhPaeGLql0HQvyWnZFnoYfnwpmdj2
	5yqzrFSdyzGNiooQ0AMqw2Ud52E9KmY=
X-Google-Smtp-Source: AGHT+IG0dHsM3Wkap8ZL3EnX7wOcmK20Hs8cCrz6q4dm7b9p3r/y/NYFgDSmjRUEMXjb/L4ZDHenoA==
X-Received: by 2002:a17:90b:3c86:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-30a34486f2dmr1420901a91.35.1745981658375;
        Tue, 29 Apr 2025 19:54:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/14] systemd: systemd-journald fails to setup LogNamespace
Date: Tue, 29 Apr 2025 19:53:38 -0700
Message-ID: <8eb185024f9a9e57a9b710c70f09552729558892.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215704

From: Haitao Liu <haitao.liu@windriver.com>

A LogNamespace error for systemd v250:

"""
Apr 28 17:44:00 a-rinline2b systemd[467]:
systemd-journald@tester.service: Failed to set up special execution
directory in /var/log: Not a directory
Apr 28 17:44:00 a-rinline2b systemd[467]:
systemd-journald@tester.service: Failed at step LOGS_DIRECTORY spawning
/lib/systemd/systemd-journald: Not a directory
"""
That's because that "/var/log/journal" couldn't be created during
program runtime.

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...n-in-mkdir_p-when-parent-directory-e.patch | 78 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch b/meta/recipes-core/systemd/systemd/0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch
new file mode 100644
index 0000000000..723b8ca4f7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch
@@ -0,0 +1,78 @@
+From e01e68e70ae1db9fe61adec3e7bdcced7adc1930 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Thu, 10 Feb 2022 08:30:08 +0100
+Subject: [PATCH] basic: do not warn in mkdir_p() when parent directory exists
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This effectively disables warnings about type/mode/ownership of existing
+directories when recursively creating parent directories. (Or files. If there's
+a file in a place we expect a directory, the code will later try to create
+a file and fail. This follows the general pattern where we do (void)mkdir()
+if the mkdir() is immediately followed by opening of a file.)
+
+I was recently debugging an issue with the fstab-generator [1], and it says:
+'Directory "/tmp" already exists, but has mode 0777 that is too permissive (0644 was requested), refusing.'
+which is very specific but totally wrong in this context.
+This output was added in 37c1d5e97dbc869edd8fc178427714e2d9428d2b, and I still
+think it is worth to do it, because if you actually *do* want the directory, if
+there's something wrong, the precise error message will make it much easier to
+diagnose. And we can't easily pass the information what failed up the call chain
+because there are multiple things we check (ownership, permission mask, type)…
+So passing a param whether to warn or not down into the library code seems like
+the best solution, despite not being very elegant.
+
+[1] https://bugzilla.redhat.com/show_bug.cgi?id=2051285
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/e01e68e70ae1db9fe61adec3e7bdcced7adc1930]
+
+Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/basic/mkdir.c | 5 ++++-
+ src/basic/mkdir.h | 5 +++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 27144dd45a..cf7cf4a357 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -55,6 +55,9 @@ int mkdir_safe_internal(
+                         return -errno;
+         }
+ 
++        if (flags & MKDIR_IGNORE_EXISTING)
++                return 0;
++
+         if (!S_ISDIR(st.st_mode))
+                 return log_full_errno(flags & MKDIR_WARN_MODE ? LOG_WARNING : LOG_DEBUG, SYNTHETIC_ERRNO(ENOTDIR),
+                                       "Path \"%s\" already exists and is not a directory, refusing.", path);
+@@ -142,7 +145,7 @@ int mkdir_parents_internal(const char *prefix, const char *path, mode_t mode, ui
+                 s[n] = '\0';
+ 
+                 if (!prefix || !path_startswith_full(prefix, path, /* accept_dot_dot= */ false)) {
+-                        r = mkdir_safe_internal(path, mode, uid, gid, flags, _mkdirat);
++                        r = mkdir_safe_internal(path, mode, uid, gid, flags | MKDIR_IGNORE_EXISTING, _mkdirat);
+                         if (r < 0 && r != -EEXIST)
+                                 return r;
+                 }
+diff --git a/src/basic/mkdir.h b/src/basic/mkdir.h
+index 34a5227577..c0c0ea6c4f 100644
+--- a/src/basic/mkdir.h
++++ b/src/basic/mkdir.h
+@@ -4,8 +4,9 @@
+ #include <sys/types.h>
+ 
+ typedef enum MkdirFlags {
+-        MKDIR_FOLLOW_SYMLINK = 1 << 0,
+-        MKDIR_WARN_MODE      = 1 << 1,
++        MKDIR_FOLLOW_SYMLINK  = 1 << 0,
++        MKDIR_IGNORE_EXISTING = 1 << 1,  /* Quietly accept a preexisting directory (or file) */
++        MKDIR_WARN_MODE       = 1 << 2,  /* Log at LOG_WARNING when mode doesn't match */
+ } MkdirFlags;
+ 
+ int mkdirat_errno_wrapper(int dirfd, const char *pathname, mode_t mode);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
index b79284d79c..b3e31e1f23 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://touchscreen.rules \
            file://fix-vlan-qos-mapping.patch \
            file://0001-core-fix-build-when-seccomp-is-off.patch \
            file://0001-journal-Make-sd_journal_previous-next-return-0-at-HE.patch \
+           file://0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


