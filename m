Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A789EC63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:52:02 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.147213.1673808720337827403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lJ9yKSjy;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so31842352pjk.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiLmCTixg5KbxsYbSgLyC4jY8nkP22EyklJZ0D8P3vg=;
        b=lJ9yKSjyu354nmpvCVA+8U1el8HJPe2Bsdr33rH/8r8e7QzZk+4YTYRKR0mVewBwic
         8dS49oBRqns4XGdHR9NFd/VAz6zu2fT+jdN1Lk6BJMv0OsFK+5aTHwIHbDE7WUBAjt8K
         QkcNjdi1yasBtipjp9p1Aejjg9vBuc62W3NOMSE8k9SrNiF6IsxplIxmqvqUoNKgY7FF
         wSArq3SarS+JOdftyGpUKu53GIO/Obz7pQQ6QYgGMX18etAHP6ZZj0bmSu9g4kGUZmrL
         IjgX5DMKEH6uTfYyu8HNEjw3CVA2q+YGivZ8DJnYzP0/zC1wCEZYq4PLh8nWO/Pzuz7K
         FqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiLmCTixg5KbxsYbSgLyC4jY8nkP22EyklJZ0D8P3vg=;
        b=WxLxykCzt6yUXDwDrhbJ5Zn0jake7Npk6NenNeWYnWO+OhzcFESv43mq/2a9vPXd3+
         Y9V1QFPelyP14kMO7JfCnVU8tltQB1w7MVNZhw9uog/VXc8/niPz+UwMzCFnOmf2cGH7
         0JoQ/HKnIY4B+kVucF5G7NFW+6A83c25mmKhLEPD2ADL3USSANIJwidvt6RLT+Fbsbmv
         B4/CaovypWdH3i6HW8vXac5ElB5Ub7DKZemeg5jthkGX/rtbx/ZA0lbZw/4JKos3StVI
         xsiSFf1bxpEcfCK2wK7st4f3R65SEeAZ7ozjNrsb5miyyn+oOdsIT0yaYRJLfZtRddwQ
         h+gQ==
X-Gm-Message-State: AFqh2krU6hCiRl8cYZZ36/rr731VQjukEHHuL5Ltg3/gaCqE+BOUKkFb
	PQiIXtmzh+YW0utEf64zSA3/hJAAzly2xA==
X-Google-Smtp-Source: AMrXdXun71sdLfaeOkGu6NenfJW4L72S5LkIOX1ypyk6Jg4VffZsbnzAUQBtPGvOtKR5k5JSgrzSrw==
X-Received: by 2002:a17:902:bd8d:b0:192:8cd1:5e79 with SMTP id q13-20020a170902bd8d00b001928cd15e79mr19269512pls.41.1673808719493;
        Sun, 15 Jan 2023 10:51:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019468fe44d3sm5417127pll.25.2023.01.15.10.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:51:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] opkg: Define alignof using _Alignof when using C11 or newer
Date: Sun, 15 Jan 2023 10:51:52 -0800
Message-Id: <20230115185153.2277534-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115185153.2277534-1-raj.khem@gmail.com>
References: <20230115185153.2277534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175954

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sing-_Alignof-when-using-C11-or-newe.patch | 51 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
new file mode 100644
index 0000000000..3406878a1d
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -0,0 +1,51 @@
+From 4089affd371e6d62dd8c1e57b344f8cc329005ea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jan 2023 23:11:08 -0800
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
+Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/gjcQPZgT_jI]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libopkg/md5.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libopkg/md5.c b/libopkg/md5.c
+index 981b9b8..ccb645e 100644
+--- a/libopkg/md5.c
++++ b/libopkg/md5.c
+@@ -237,7 +237,17 @@ void md5_process_bytes(const void *buffer, size_t len, struct md5_ctx *ctx)
+     /* Process available complete blocks.  */
+     if (len >= 64) {
+ #if !_STRING_ARCH_unaligned
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++         && !defined __clang__) \
++     || (defined __clang__ && __clang_major__ < 8))
+ #define alignof(type) offsetof (struct { char c; type x; }, x)
++#else
++#define alignof(type) _Alignof(type)
++#endif
+ #define UNALIGNED_P(p) (((size_t) p) % alignof (uint32_t) != 0)
+         if (UNALIGNED_P(buffer))
+             while (len > 64) {
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
index 712f066f0e..c95a40d268 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch \
+           file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://run-ptest \
 "
 
-- 
2.39.0


