Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29387C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 04:07:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.15155.1706069269583843285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 20:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XLuE+L9H;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6dd84fe7aebso838364b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 20:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1706069268; x=1706674068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=egknFAbjhubun81Scy5dtfiocw3mnJiIymfvEZXMOqA=;
        b=XLuE+L9HiNQe4IvlXci9U5cd6F7oi3Rp5rCYuZW0UgqY6y1NFgAOfSSc58yKN5+T8O
         Syb1Ce+KYcdzZiTeMuJWhcOZl+mWTDciqYMftGXXp+kDGvTCtLWftCIvmCvb38BIHNJe
         Jkt1tcFhXXqK47hRPrN9Otkjxtb2Y1qtpPxOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706069268; x=1706674068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egknFAbjhubun81Scy5dtfiocw3mnJiIymfvEZXMOqA=;
        b=xVVE1URq9JPrxt7VI+y/bn+XV5fa57Feopimu80xTXxnOFMhfdf/qJHPJWMuskjhP2
         upBLe/5yHWBqlkHH6nHXiBG+Z2sAIqg08Zb5k13KVNvInSh2r2h2iK8830uOR2JJOKjt
         dAaNoxWBbBGws3rrwnxG1gF71rpgHmU0dpVPnXNJlSFM0ZiWwxZA1RB8/kX7J89sAsuM
         ZAb7vD/ab+kRy2NVkm77phhcrT7lITHQbQt+DrOPuUF5wXANE+WH0AxsRKSaULSW0lRn
         yJwKIRwoRitn9XoWHyvcBmh+AGJ62BKJUq8KMYbbX7oJViAV6yKXnu1Ib2vuWKbVcM9n
         syBw==
X-Gm-Message-State: AOJu0Yw8wFkkGnWbT4Fo7dcQiFh4RCqWb7BaROKUAsran6IMtV67TbXo
	sFbpGUf1JPX5K1fbl0PCtqYRs8pEwkAR28SqlWoIRVhN6d6maJJ8HCFUQiu8NDwVRiD/Gc3GI2q
	E
X-Google-Smtp-Source: AGHT+IG+DyUog8ujKhiRAiNI4trMtLq337YMk//eoh043Y+sO2DcZpGmJ5cM7RDXMjuprJZ1J/VGeA==
X-Received: by 2002:a05:6a00:3cca:b0:6db:da28:6c54 with SMTP id ln10-20020a056a003cca00b006dbda286c54mr3331311pfb.34.1706069268070;
        Tue, 23 Jan 2024 20:07:48 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.43.219.193])
        by smtp.gmail.com with ESMTPSA id x126-20020a626384000000b006dbd7e5bd1esm5968960pfb.52.2024.01.23.20.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 20:07:47 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] pam: Fix for CVE-2024-22365
Date: Wed, 24 Jan 2024 09:35:24 +0530
Message-Id: <20240124040524.4332-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 04:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194260

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../pam/libpam/CVE-2024-22365.patch           | 59 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.3.1.bb     |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-22365.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
new file mode 100644
index 0000000000..33ac37b7f0
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
@@ -0,0 +1,59 @@
+From 031bb5a5d0d950253b68138b498dc93be69a64cb Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Wed, 27 Dec 2023 14:01:59 +0100
+Subject: [PATCH] pam_namespace: protect_dir(): use O_DIRECTORY to prevent
+ local DoS situations
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ modules/pam_namespace/pam_namespace.c | 18 +-----------------
+ 1 file changed, 1 insertion(+), 17 deletions(-)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index 2528cff86..f72d67189 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -1201,7 +1201,7 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 	int dfd = AT_FDCWD;
+ 	int dfd_next;
+ 	int save_errno;
+-	int flags = O_RDONLY;
++	int flags = O_RDONLY | O_DIRECTORY;
+ 	int rv = -1;
+ 	struct stat st;
+ 
+@@ -1255,22 +1255,6 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
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
diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
index bc72afe6ad..527a368e2d 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam-security-abstract-securetty-handling.patch \
            file://pam-unix-nullok-secure.patch \
            file://crypt_configure.patch \
+           file://CVE-2024-22365.patch \
           "
 
 SRC_URI[md5sum] = "558ff53b0fc0563ca97f79e911822165"
-- 
2.25.1


