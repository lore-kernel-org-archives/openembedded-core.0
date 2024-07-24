Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20667C3DA70
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 10:11:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.7485.1721815909812008665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 03:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkiaKVkx;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-426526d30aaso49450765e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 03:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721815908; x=1722420708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajFYQ9YiH0to4aon2tmTPLUaqc1zJj0vcB9XUjZd41I=;
        b=mkiaKVkxddn34hAV1A94CYD9kTo9JAQUz7RkDByPqGA+VBqxNQq/40AbukCbpmDz8N
         oM2SubZTgWg2nnRDa0TdZ6rwbK181yTUXvftco1ENQ04koz0V0nO86FjWJrWghLYzmFj
         1CK4eCbHZ8A6eY+8bN5h566UWSQjGVsOBBr5VIGwhpaxA1zP1nuovkoBhFkuSxxJ0H20
         N/S4y2temcwqRf8Gsevu3EMsXn3BHSxMiXXBqSbd8oKE5/GdQPr03DXxOiqb8jtvGvGd
         NB2OQN14q8bTbkbeevulsyDuvO4PYUhMJI+brPtAw4MNWM5BcM4YB6f/Lm3MoYWIYY3/
         kctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721815908; x=1722420708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajFYQ9YiH0to4aon2tmTPLUaqc1zJj0vcB9XUjZd41I=;
        b=fuPrvToY15w0Eu4eGY14fzNSBShk7Fdfdq6cjVNAK+rEf+VAZdOa7Hn+FznVCnPRRU
         xXLdBil3/0rzOQ8TbICrCdiDXBSJPX2A6e+0GF/+wXJ48qFJKGhDqa1BRNEnFRlsA05O
         pdVfCI+yQHvx+jEEFTqlzSDWIPdwm2Vhyd3iP51bii6aItoPZX0/NyLLmcEuuSrf19P1
         ZWz8SBKKdvpPpx+k19BPgEzDW6S/IBwvJc5XHckdZd8TyM9RwOerOzuciKVCcUz+/mBr
         g2d14rEZNDjYEEFIbdtwMUZZUFmNJxsx636BDf3U58clkYHc3ae4N6uUMB2BfWKXZj9z
         esvA==
X-Gm-Message-State: AOJu0Yw/aBaXypoO4608zoePU1bq9GZUtIwxYdOM/J1yXVt+E+Qt3mQ9
	iHfuh4l7cE6AP2aIVEsEH70VwqV22LjQ1zXkEPMBD9U9NES5VoAvebj4EA==
X-Google-Smtp-Source: AGHT+IEqss2RuxGJIyNNXhRQjY50p8FSDJCbbBt3eU0bJJqMvsx09wdva6fiiOf7ebGZtNUi+tBqPg==
X-Received: by 2002:a05:600c:4752:b0:426:5dd0:a1ea with SMTP id 5b1f17b1804b1-427f95ac43fmr11849235e9.28.1721815907613;
        Wed, 24 Jul 2024 03:11:47 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e6871sm23349985e9.30.2024.07.24.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 03:11:46 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH] pam: Fix for CVE-2024-22365
Date: Wed, 24 Jul 2024 10:11:35 +0000
Message-Id: <20240724101135.845417-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202438

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../pam/libpam/CVE-2024-22365.patch           | 65 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-22365.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
new file mode 100644
index 0000000000..e4ec862dc5
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
@@ -0,0 +1,65 @@
+From 84f378d3b8573828e7ccc54b54b5e128aa993748 Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Wed, 27 Dec 2023 14:01:59 +0100
+Subject: [PATCH] pam_namespace: protect_dir(): use O_DIRECTORY to prevent
+ local DoS situations
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without O_DIRECTORY the path crawling logic is subject to e.g. FIFOs
+being placed in user controlled directories, causing the PAM module to
+block indefinitely during `openat()`.
+
+Pass O_DIRECTORY to cause the `openat()` to fail if the path does not
+refer to a directory.
+
+With this the check whether the final path element is a directory
+becomes unnecessary, drop it.
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb]
+CVE: CVE-2024-22365
+Signed-off-by: Guðni Már Gilbert  <gudni.m.g@gmail.com>
+---
+ modules/pam_namespace/pam_namespace.c | 18 +-----------------
+ 1 file changed, 1 insertion(+), 17 deletions(-)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index f34ce934..ef856443 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -1194,7 +1194,7 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 	int dfd = AT_FDCWD;
+ 	int dfd_next;
+ 	int save_errno;
+-	int flags = O_RDONLY;
++	int flags = O_RDONLY | O_DIRECTORY;
+ 	int rv = -1;
+ 	struct stat st;
+ 
+@@ -1248,22 +1248,6 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 		rv = openat(dfd, dir, flags);
+ 	}
+ 
+-	if (rv != -1) {
+-		if (fstat(rv, &st) != 0) {
+-			save_errno = errno;
+-			close(rv);
+-			rv = -1;
+-			errno = save_errno;
+-			goto error;
+-		}
+-		if (!S_ISDIR(st.st_mode)) {
+-			close(rv);
+-			errno = ENOTDIR;
+-			rv = -1;
+-			goto error;
+-		}
+-	}
+-
+ 	if (flags & O_NOFOLLOW) {
+ 		/* we are inside user-owned dir - protect */
+ 		if (protect_mount(rv, p, idata) == -1) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index ef32d19f3d..bcaa84c9a5 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            file://0001-pam_namespace-include-stdint-h.patch \
            file://0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch \
+           file://CVE-2024-22365.patch \
            "
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
-- 
2.34.1


