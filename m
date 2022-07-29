Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A903DC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:36:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.1194.1659123378986847664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jlsamLV4;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id b9so5461981pfp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y1BhriJvhiHtQt3aAMN1z/SLssRzW3qXVM2PJRp7cZ4=;
        b=jlsamLV4sCQqDRm07RT7I30dydw8VfASaY/LpuwS3D8+LFm8xL0dQNEUz4a/9vMHgd
         sP/0I4zg6O0mgnQrQ9cXdw7BsW+kBccN+9oEJA1qBHu1aKgFmzIi/PEYUwo7AhXfyPxB
         vMdnkm0uDxAlZqempBth5kjTanpnXc5vElDjlcoy9ZRI5dc5/yUc6jXQFA+J37Poq/Gv
         RJre2wPu7eIi3gDh0E4mCa6g/GWxGTyZMcVBW2YQqX6wK8inHbGbzWLRcHLRRGaT/3gP
         GwX2e8y1hJ6VzYQ8/5Anlig/deMufoYQQLtyfHyP0OvE3h9zTrjYATi0gQK11mPTm2qE
         YwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y1BhriJvhiHtQt3aAMN1z/SLssRzW3qXVM2PJRp7cZ4=;
        b=xp5ZXzuU9pdqsxDaBoD+evz2RNZIWbA1rydZhEuLe/+IGwsspu9HpD3EUyHf2XMvYt
         RflOFhm3xaalXD32FnmFr/80BZBEBv6KoC9ChtYTcV/to/tccPKO3hZIiPDG01UcghKj
         9WGBaQypr5iP7XfbXvjPJbJREe4tgKr/b9W+kk/DkO496FC0anSiIq0tFy5Lwhc/xCk7
         hI4YphceWn/MqnrdVKzJz7KyzL5Vx6kloxRnyCMC77xBKMtL2eiERDkzZUjrT/4nj5LT
         pRqf1HdXeacyC2HiaiIhaN7Q30RYIyZ2/yPX87ui6TUQZJfGoV15hA290BQ2UsA2L6UV
         gX+g==
X-Gm-Message-State: AJIora92ehPjwpABy0xh5fHbbnFCtMxNRxK722lGTJQT2hl6eFIrTeop
	mL3WAyphTQUWjNQChgU7+jLp77dzPM0qKw==
X-Google-Smtp-Source: 
 AGRyM1t1YwZU6zLvETpFSF96BHc0mHihF9x88v8MVVzLssUCqPjQK7rLLROUWEoVvA1RKvCSsFs4Ug==
X-Received: by 2002:a65:60d4:0:b0:419:9871:9cf with SMTP id
 r20-20020a6560d4000000b00419987109cfmr4169342pgv.214.1659123378019;
        Fri, 29 Jul 2022 12:36:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 ij19-20020a170902ab5300b0016daee46b72sm754260plb.237.2022.07.29.12.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 12:36:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-sanitizers: Fix mount.h glibc 2.36 conflict
Date: Fri, 29 Jul 2022 12:36:14 -0700
Message-Id: <20220729193614.708740-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 19:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168673

backport a sanitizers upstream patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
 ...rry-pick-9cf13067cb5088626ba7-from-u.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
index 8c6c4a03051..56678c78bef 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
@@ -64,6 +64,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Fix-install-path-of-linux64.h.patch \
            file://0025-Move-sched.h-include-ahead-of-user-headers.patch \
            file://0026-rust-recursion-limit.patch \
+           file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch \
 "
 SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch b/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
new file mode 100644
index 00000000000..6bbc95aa00c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch
@@ -0,0 +1,45 @@
+From 2701442d0cf6292f6624443c15813d6d1a3562fe Mon Sep 17 00:00:00 2001
+From: Martin Liska <mliska@suse.cz>
+Date: Mon, 11 Jul 2022 22:03:14 +0200
+Subject: [PATCH] libsanitizer: cherry-pick 9cf13067cb5088626ba7 from upstream
+
+9cf13067cb5088626ba7ee1ec4c42ec59c7995a0 [sanitizer] Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=2701442d0cf6292f6624443c15813d6d1a3562fe]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../sanitizer_platform_limits_posix.cpp                | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index 8ed3e92d270..97fd07acf9d 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -73,7 +73,9 @@
+ #include <sys/vt.h>
+ #include <linux/cdrom.h>
+ #include <linux/fd.h>
++#if SANITIZER_ANDROID
+ #include <linux/fs.h>
++#endif
+ #include <linux/hdreg.h>
+ #include <linux/input.h>
+ #include <linux/ioctl.h>
+@@ -869,10 +871,10 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned IOCTL_EVIOCGPROP = IOCTL_NOT_PRESENT;
+   unsigned IOCTL_EVIOCSKEYCODE_V2 = IOCTL_NOT_PRESENT;
+ #endif
+-  unsigned IOCTL_FS_IOC_GETFLAGS = FS_IOC_GETFLAGS;
+-  unsigned IOCTL_FS_IOC_GETVERSION = FS_IOC_GETVERSION;
+-  unsigned IOCTL_FS_IOC_SETFLAGS = FS_IOC_SETFLAGS;
+-  unsigned IOCTL_FS_IOC_SETVERSION = FS_IOC_SETVERSION;
++  unsigned IOCTL_FS_IOC_GETFLAGS = _IOR('f', 1, long);
++  unsigned IOCTL_FS_IOC_GETVERSION = _IOR('v', 1, long);
++  unsigned IOCTL_FS_IOC_SETFLAGS = _IOW('f', 2, long);
++  unsigned IOCTL_FS_IOC_SETVERSION = _IOW('v', 2, long);
+   unsigned IOCTL_GIO_CMAP = GIO_CMAP;
+   unsigned IOCTL_GIO_FONT = GIO_FONT;
+   unsigned IOCTL_GIO_UNIMAP = GIO_UNIMAP;
+-- 
+2.37.1
+
-- 
2.37.1


