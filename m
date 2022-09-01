Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE53C0502C
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 12:40:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.11524.1662036052719863600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 05:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BLvVCx/4;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id ay12so8943435wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=nnrWjM2FqZ//t3OdnUkB0REz+xDEceihEJUk61d8s5s=;
        b=BLvVCx/4J4sv5iKLFXLFJdA0XKxEHdgvtsSSZ4L6HoDjEuhTYWvv4fPE9wd8J8/aa9
         p4AL5SofFv2erYd93S6lDDO8pA9h97y85ZGyRBdesHwGZY1WNSmFQO+8KEEfJ9QnYmoC
         as240Sb6sRlxEsD1MRxCz+Lm6RmBv/PT4y5PvgfM6Z/HQjYV0hB0ZxPFmy8M4+Vj60WP
         8VQY44iwc31iJ0vI8GgLZwu3sv2uORGuSky65Fxe7+wlI+9lwCyNYp5yttNCpR8T4gYq
         wKF6TiLwcps7c+jdC5iIz7DsxSX1oSdEYVoJaX2F8y+axr815bQVjkbNLpuoZJn1YlYW
         Q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=nnrWjM2FqZ//t3OdnUkB0REz+xDEceihEJUk61d8s5s=;
        b=PjAvLO3JFR6EQVjZTMJJGwWoh5EJn4B7I3s+NNOanNdqWEiCOONJ9/ERIXat5V+q/+
         4hvuFYGfdIpVd7AUUYNlUsGPCH+k8X5IFtm9fCRJBseUEttCiVdn3gUHKdPFFjltKD/v
         KgkTU5R+/1zu3QWAKpBc3cSxa6N3Q4/9e38aSEjRcNKp5hmdvluTxInrwfn26Xy5G+C1
         x/sDWTGUk2TQr3JebOCjZSmAZXJx5/SUkzpRRTwEU7Ny4NFzHfb5i3s0Usc1LyfaDiWO
         Ctgnk3nLVijC3Xg72gval6gVjzjNdVYMzHOIw2B1AMefmVPK82ZCEiMgbuq6QKx/e5/W
         JIzA==
X-Gm-Message-State: ACgBeo1WZkSEPfnmhC1QrO7lm7aN18dlWLYOoUXAkDp3jxI43rPPV7BO
	p/LQpL8wiKVdlOMHVvM1ZlXtlVbzPF4=
X-Google-Smtp-Source: 
 AA6agR4ogv7Ei6KbmCUmrBHB4687Wj5933gPnyd1ykHHqAxnRI9MVZZIkUDgeZemz7F0VrkGQzWxfw==
X-Received: by 2002:a1c:4c18:0:b0:3a5:3ddd:2f29 with SMTP id
 z24-20020a1c4c18000000b003a53ddd2f29mr5065494wmf.91.1662036050976;
        Thu, 01 Sep 2022 05:40:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4688000000b00226f2ab6e2asm2321866wrq.68.2022.09.01.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:40:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] llvm: remove
 0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
Date: Thu,  1 Sep 2022 14:40:46 +0200
Message-Id: <20220901124046.267482-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 12:40:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170163

At some point this became unnecessary as llvm builds with with musl without it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ryInfo-Undefine-libc-functions-if-th.patch | 90 -------------------
 meta/recipes-devtools/llvm/llvm_git.bb        |  1 -
 2 files changed, 91 deletions(-)
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
deleted file mode 100644
index d02b7ba6ab..0000000000
--- a/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From dbeecdb307be8b783b42cbc89dcb9c5e7f528989 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 May 2016 00:33:20 +0000
-Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they are macros
-
-musl defines some functions as macros and not inline functions
-if this is the case then make sure to undefine them
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../llvm/Analysis/TargetLibraryInfo.def       | 21 +++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-index afed404f04c..876888656f2 100644
---- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-+++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-@@ -782,6 +782,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
- TLI_DEFINE_ENUM_INTERNAL(fopen)
- TLI_DEFINE_STRING_INTERNAL("fopen")
- /// FILE *fopen64(const char *filename, const char *opentype)
-+#ifdef fopen64
-+#undef fopen64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(fopen64)
- TLI_DEFINE_STRING_INTERNAL("fopen64")
- /// int fork();
-@@ -829,6 +832,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
- /// int fseeko(FILE *stream, off_t offset, int whence);
- TLI_DEFINE_ENUM_INTERNAL(fseeko)
- TLI_DEFINE_STRING_INTERNAL("fseeko")
-+#ifdef fseeko64
-+#undef fseeko64
-+#endif
- /// int fseeko64(FILE *stream, off64_t offset, int whence)
- TLI_DEFINE_ENUM_INTERNAL(fseeko64)
- TLI_DEFINE_STRING_INTERNAL("fseeko64")
-@@ -839,6 +845,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
- TLI_DEFINE_ENUM_INTERNAL(fstat)
- TLI_DEFINE_STRING_INTERNAL("fstat")
- /// int fstat64(int filedes, struct stat64 *buf)
-+#ifdef fstat64
-+#undef fstat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(fstat64)
- TLI_DEFINE_STRING_INTERNAL("fstat64")
- /// int fstatvfs(int fildes, struct statvfs *buf);
-@@ -854,6 +863,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
- TLI_DEFINE_ENUM_INTERNAL(ftello)
- TLI_DEFINE_STRING_INTERNAL("ftello")
- /// off64_t ftello64(FILE *stream)
-+#ifdef ftello64
-+#undef ftello64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(ftello64)
- TLI_DEFINE_STRING_INTERNAL("ftello64")
- /// int ftrylockfile(FILE *file);
-@@ -980,6 +992,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
- TLI_DEFINE_ENUM_INTERNAL(lstat)
- TLI_DEFINE_STRING_INTERNAL("lstat")
- /// int lstat64(const char *path, struct stat64 *buf);
-+#ifdef lstat64
-+#undef lstat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(lstat64)
- TLI_DEFINE_STRING_INTERNAL("lstat64")
- /// void *malloc(size_t size);
-@@ -1205,6 +1220,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
- TLI_DEFINE_ENUM_INTERNAL(stat)
- TLI_DEFINE_STRING_INTERNAL("stat")
- /// int stat64(const char *path, struct stat64 *buf);
-+#ifdef stat64
-+#undef stat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(stat64)
- TLI_DEFINE_STRING_INTERNAL("stat64")
- /// int statvfs(const char *path, struct statvfs *buf);
-@@ -1340,6 +1358,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
- TLI_DEFINE_ENUM_INTERNAL(tmpfile)
- TLI_DEFINE_STRING_INTERNAL("tmpfile")
- /// FILE *tmpfile64(void)
-+#ifdef tmpfile64
-+#undef tmpfile64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
- TLI_DEFINE_STRING_INTERNAL("tmpfile64")
- /// int toascii(int c);
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 4c7fadb667..25c0a433d3 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -28,7 +28,6 @@ LLVM_RELEASE = "${PV}"
 BRANCH = "release/${MAJOR_VERSION}.x"
 SRCREV = "f28c006a5895fc0e329fe15fead81e37457cb1d1"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
-           file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
-- 
2.30.2


