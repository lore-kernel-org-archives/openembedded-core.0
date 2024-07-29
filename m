Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE85DC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:06 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.55645.1722258782144275226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Mlt29/9x;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a0e8b76813so2254635a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258781; x=1722863581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXFNuR0DVCax0aTE0wD9rymRHg4C8ByN88XnyK62fsE=;
        b=Mlt29/9xZ6kOrjBSMFRnUcDYlw6OXi1lNjsHM4QwvcISqOQPy4BTwyhoq8+xosfg5p
         SC4X9+LuFoq7bwL4HYAKj8JX89+wxF496cd6UFdy5O8KWswQnID/Ipk+XUW5KcLSodDZ
         PSyTUpkPalHg6O5r2GUN4csbti+a4BcZc3bJAwdd3MHw4VhVuVB2jmdzNvQWPM2xIX0N
         qKaVrXFd36+z5Wzw9pTKDhp929jX5KEkKEWzsf0H+y8Ncr0GRRUSDz+2TZbi4HoBp2Gu
         0oZxjS+uH8kUbnG9BPRD/Izkwo7MCn1NLzhG4+2745LqILz6PuZYj1HBqdlRFssaEN1I
         rrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258781; x=1722863581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXFNuR0DVCax0aTE0wD9rymRHg4C8ByN88XnyK62fsE=;
        b=jt17WgEwctVX858r0lWubilboeR8SuXuwk6FDladUNzc3JiS6Al99LBmhMgQXapt5R
         ZnY23R2zPDpp2YxcXav5FgqEBwgXFerbiM0bdZSEETb/jjbhbibyMfZzkVBmm69ViXvW
         gQci0nRAnXHlOMt9aYelL7zHGMpW9cnP160F4F7qKuEzHwzg/Kgp9XRih/4jx5QoGup6
         t6kC2HHc7LPegvhD6Kyu6tUoZZaRbjTDgFpU6XbMyee9CDCU2syuNKE1dF6JwPmUQ/hu
         1sq3o3ciW3A5sxAOwPHlX5lIGbXHQtRxL6ruKHrLmofj3/8SiQe0WT8I8PwORax8gC0q
         BH0Q==
X-Gm-Message-State: AOJu0YwAHCAm7rVYZ3t42YeCML5N61jrFXuxxQs4vsAR9p5CQHqSpVMD
	ncXCLPN4bK6pBDMbVvVufrhOlMPIo7VptiQsZ/BsSR2ppdkCEpfUJSfQ5xSwlq/kg5e+O+krqKe
	kutmGrg==
X-Google-Smtp-Source: AGHT+IG2Kf9HAlFBgMcG2IZOXarxEAuVXZEGdtOxUHBsYKSHjdN5UiQPORPAODMYuJXw+Tujr/GJ7g==
X-Received: by 2002:a17:90b:350d:b0:2c8:db8b:7247 with SMTP id 98e67ed59e1d1-2cf7e19e202mr8405451a91.9.1722258781286;
        Mon, 29 Jul 2024 06:13:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/37] pam: Fix for CVE-2024-22365
Date: Mon, 29 Jul 2024 06:12:14 -0700
Message-Id: <6d4c14e1053089a67a38a8de95625e4ba3fbc32a.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202618

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


