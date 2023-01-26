Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E749FC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:24:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.86839.1674768256575917625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qvdY5ojV;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c6so3063068pls.4
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wa4a5CZW/s+vVy6sNYePyFvXPKS6SsliZ5ScIG0y3M8=;
        b=qvdY5ojVO1H+JxEV+YWEKNHF2pO/3HaNUCPrC0eZQCItCD2x/XT+kuDNJxipk18XNY
         OVgZlS+wLhY63ntRtyuVUhYi9ddcggXxsmEPWMrLQPhnHry2ovtYqZ6MgzBV7qJYgI+t
         Wahs6eosAzMtf9SdTi7mxydpqOahZqqH0dz42/uxG/c1dMxtri5DlH1VgQe7VrxseV/1
         HWKQNt8oW6sEDHbXMB3doPwmlFI/ltvPccv64zHrHYvZL/KuclWNsZivTTw1YKS/w99C
         lz6sh6AyKhKyPTIVSIZPQJqSBeQpyclH9tMfRRrPJ0Prm+4YH7Ht80fvnIFqv+W/F6aF
         a+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wa4a5CZW/s+vVy6sNYePyFvXPKS6SsliZ5ScIG0y3M8=;
        b=wGlC7o75YIg5nt1e3EUj8n7QmnkHMD8pphCBkab2PbmBlbPBPDKTe9FO+Ag+wOKddE
         mUp+dvSQxlnxIm8LFXPzQcVU7eNH+Aff0B6jWGRHhyZlqvFJC6LnGLcUaW2VysZm8Aeb
         HSHl4BuVGEEhYNMnuJyPBaPY/B9XTubhm/asVhZaEkacPn4NHSi2aMU6R4xH77PcfBGL
         DtB5nkbsZlJTRtSd5P6rIFjZPy+4Z99miPAq/JLpk1W9AmVvAmqFyH0AZ55RppGagNwC
         rvoazT9p+zkz0L6/Se0Vt1FVkoFZ2xmyTeiqoy1+7Xh9ZjIIGdiG/Zq9ZBsseJ5V/EwK
         MQiA==
X-Gm-Message-State: AFqh2kqFC0RWHA8R3U2A4BDHANCgBClwGAk+VQex7QzeMGS/1XdU6ziu
	hoXyhA3kEbsjh4bKxFPlh8q88DLBl93tDQ==
X-Google-Smtp-Source: AMrXdXv10qGuwlCV58fp843j4f6hz3V1e+LKjRr49iVNEhGzcqGrB2sgjLXa1MSLQV6DI+rEP6WQQA==
X-Received: by 2002:a17:902:dad0:b0:195:e577:231c with SMTP id q16-20020a170902dad000b00195e577231cmr30669662plx.31.1674768255644;
        Thu, 26 Jan 2023 13:24:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id m22-20020aa79016000000b005810c4286d6sm1318555pfo.0.2023.01.26.13.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:24:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Define alignof using _Alignof when using C11 or newer
Date: Thu, 26 Jan 2023 13:24:13 -0800
Message-Id: <20230126212413.3026000-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 21:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176426

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 ...sing-_Alignof-when-using-C11-or-newe.patch | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 5a9fe271b9..a5dc554581 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0008-Fix-invalid-sigprocmask-call.patch \
            file://0009-gdbserver-ctrl-c-handling.patch \
            file://readline-8.2.patch \
+           file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            "
 SRC_URI[sha256sum] = "0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed"
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
new file mode 100644
index 0000000000..3e29327613
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -0,0 +1,55 @@
+From 48906e1038e469b429aa35d0f967730a929c3880 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 00:16:25 -0800
+Subject: [PATCH 8/8] Define alignof using _Alignof when using C11 or newer
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
+gnulib needs this fix and then it will be applied to downstream packages
+like gdb [3]
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+[3] https://public-inbox.org/bug-gnulib/20230114232744.215167-1-raj.khem@gmail.com/T/#u
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=2d404c7dd974cc65f894526f4a1b76bc1dcd8d82]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libiberty/sha1.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libiberty/sha1.c b/libiberty/sha1.c
+index 504f06d3b9b..790ada82443 100644
+--- a/libiberty/sha1.c
++++ b/libiberty/sha1.c
+@@ -229,7 +229,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
+   if (len >= 64)
+     {
+ #if !_STRING_ARCH_unaligned
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
++   clang versions < 8.0.0 have the same bug.  */
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
++	&& !defined __clang__) \
++     || (defined __clang__ && __clang_major__ < 8))
+ # define alignof(type) offsetof (struct { char c; type x; }, x)
++#else
++# define alignof(type) _Alignof(type)
++#endif
+ # define UNALIGNED_P(p) (((size_t) p) % alignof (sha1_uint32) != 0)
+       if (UNALIGNED_P (buffer))
+ 	while (len > 64)
+-- 
+2.39.0
+
-- 
2.39.1


