Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6A6C38159
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 17:51:15 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.23046.1674064273601374031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 09:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XN0VYaj+;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 7so25092264pga.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXEGu+z0/U5HZQ5Te1cOFJhf9PRBcgo1Z++YueSNiXo=;
        b=XN0VYaj+E+Ut93rzHUAsI2lcC2yTp+Cyr5kq7apkMIPgffCJY19g4zvLer6sXNHbXn
         EBWhHJhmuy/OrzWo4BFvSR8n5ht6FawLM68NMc/V2nZUTPJIo2cQR1Z9jS3lpa7e5Wvp
         1kZhs6QFkXWlkMV4F0pJ04vHp1zgd3Gn+kcZnBm1EwBaERzKRLsbeMYcWjgZAaKp3mkD
         fNSf1ZofxCscmO8FweaNS/4fO2FR6voQ47VuHXb+H4isWgvdb0/8JAFZpLV6IoWzcGob
         D/IAc45+v8qZbBNWVCcLxghi4uNkH/IUmxHHouZ/74ZLLKOsW47ZF51/gIsUj5ESkb5f
         og0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXEGu+z0/U5HZQ5Te1cOFJhf9PRBcgo1Z++YueSNiXo=;
        b=cJcTJbKHH5D70pdiwlisX0jwvt9qOn6T5fjJOUasrJqs2n7YF7ZFWO2DEevYCmZkkb
         tSZpplbR3sQ86hvOTQke8nRLP2mLAJiumAjNVYT3bUhLxoxFXB/vfYPynZnTDqG6Vd/a
         wyCcwp2k/BNTf8H8HutI3Zz+YAQVM/nVl4xuIwjToqO9NFwZSxBU7H2ddFAjn1ZFgc6N
         wYKgqMLHi9yNMLsaNZtAZAyc3VxhxQEn1REUAnA+xUEgNDB7LGb70j4s0/vWlxOqd9Jb
         tD2hpzciyE6D2Twlbwq2P1It0jDfwr12RaszJWgM77BzY26mK1E5n/5ZK77p68BQCgWy
         pcLg==
X-Gm-Message-State: AFqh2kolfZX0+b/S2FfDfL8gfaQknc7EJKhPXxOyH2n2Udr3Rl5dX5cL
	KW1PmV6drZJo522dwaI1tKHX+Z5uhkThzQ==
X-Google-Smtp-Source: AMrXdXslp+JhzwrPSJfLXLfTxxbNa7vv9cCH8vCPSUl/ZiXCT9W9d9dpGDFioATH5PXplqFS9I5f+A==
X-Received: by 2002:aa7:888f:0:b0:581:a55:d213 with SMTP id z15-20020aa7888f000000b005810a55d213mr31467167pfe.29.1674064272392;
        Wed, 18 Jan 2023 09:51:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id x2-20020aa79a42000000b0058d9730ede0sm6834419pfj.210.2023.01.18.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 09:51:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] mdadm: Define alignof using _Alignof when using C11 or newer
Date: Wed, 18 Jan 2023 09:51:09 -0800
Message-Id: <20230118175109.491186-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 17:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176112

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update patch status

 ...sing-_Alignof-when-using-C11-or-newe.patch | 52 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
new file mode 100644
index 0000000000..9e3a30be23
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -0,0 +1,52 @@
+From 82c893bb9e01f914a6bdef1bef943af746cfc3e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 12:42:18 -0800
+Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch enhances the implementation of macro
+alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
+when using std=c11 or newer
+
+clang 16+ has started to flag this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+
+
+Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
+may support C11, exclude those compilers too
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-raid/20230118083236.24418-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sha1.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/sha1.c b/sha1.c
+index 89b32f4..1e4ad5d 100644
+--- a/sha1.c
++++ b/sha1.c
+@@ -229,7 +229,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
+   if (len >= 64)
+     {
+ #if !_STRING_ARCH_unaligned
+-# define alignof(type) offsetof (struct { char c; type x; }, x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++# if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++      || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++   && !defined __clang__) \
++      || (defined __clang__ && __clang_major__ < 8))
++#  define alignof(type) offsetof (struct { char c; type x; }, x)
++# else
++#  define alignof(type) _Alignof(type)
++# endif
+ # define UNALIGNED_P(p) (((size_t) p) % alignof (sha1_uint32) != 0)
+       if (UNALIGNED_P (buffer))
+ 	while (len > 64)
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 7298860241..1c4397509b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            file://0001-Makefile-install-mdcheck.patch \
            file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
+           file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.39.1


