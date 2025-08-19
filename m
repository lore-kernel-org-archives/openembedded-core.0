Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE506CA0EFC
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.4501.1755636613680065163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tZBqZqYU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-244580591b0so41622345ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636613; x=1756241413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9fZJ02LS0xBPixc8a32lnbcQpD6NKvMDb43dHjrwc0=;
        b=tZBqZqYUTGxXy1whwi9tzuk3X4UuJxmpjZ0iLLjMWQVJy70m33vKuAXZDLNS5e8vtr
         LRocUurEwkRtto1liUYCHxLOuKLUu5XsjIUgiFX5/tZ7Ectat4rE948s6PnGHlgxcOg9
         SEPdjoofbO2q5dbBmc8CCcJL5tb3ZMq2mpH77+ncOOEgWDb1TXwUtjuEu4hDI4K2EpNm
         C7yeW9IMTq68Ke2i0mPAUfg259TfXQ0Gx65Zo8GlsQZhow9cJ5smYADux39UTh/hcWKm
         wzSBOADv4hj1AtTGRiII9ca0ox8FGIFdWwlowjdzbHvB2ETBovjMQzbZfbdwSuq7avl0
         rxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636613; x=1756241413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9fZJ02LS0xBPixc8a32lnbcQpD6NKvMDb43dHjrwc0=;
        b=GGE6xwrlAwlpmobdoW2PUvKlhbvpyO9w0gwso7Xqukedyyz1XkgyAMzyaVcEuWAyg/
         G9x6Kpu5qBWmxNzlrjU7ucIfhRUHUxVzTZ6Vok7UYQdreamUBxpIv0oD4Yl6fVbSjOjk
         ORxnONpssjIs89z/NZ7wAARcZZ9gYvJJzUQr6Of/8jctnb6NlYPHbsUqCezqbPrVeYXc
         7qY2WhNH+fvga+6H14PvdcLe4RhcpyoT0EPXzfsv3kQPc1hLfh74+OvNs4ruEJY0ran0
         1q7kiFa7Yy1bObTBScXX0zTrBLffTMgVLJF3yyY7Su4b+Bd+T8QOJS5AUQKixV1ItZ5G
         k37Q==
X-Gm-Message-State: AOJu0Yx2A0LiFTmdz+bxAst/+dYKBixjHpmn/Bb3Bm8Bfyq7eivHz/zh
	9xZwbGxhVJkvVKOu0KyBDhIhawTZTO131OXY5ob3ELaMkG/o8NGpEV6MUcc8L9/XBwdNGM06hD9
	gxlIH
X-Gm-Gg: ASbGncsWBt9kXInfTD2DEm+MsxAsJ+wdN/Ka6aNNWGNhjNfcL4rTRBHJ9dTbgZ6L3f3
	mfkirC56aq9UDPGVjYsZs4mdeytXkv3E3IUHSh2esVgSdoVYk3FsZasfMLxtCghB9Pr/zAsv9jP
	gemAXbOdrig5nzLf0RtWCWO1aN2R8YZPcwavxmQHgkWMYncT3GWoHvNFUlsvx4HNDdQDpw6vH4P
	54e3kNyJ620qcCK/1Kz+3IGpvVhk3cJ3ZfB8rgGdmOiJVJ5hLc/Xn3Zhf2PpNBIKLnLxk6QbIyx
	PaO7YhbZ24QO+hAl9XOUKA3qsqrhxuaTZWjxewm0zzSuhrABGcDRu0yg2yK8dZlPd4OQvSSeftW
	PL252X5yj6GwMng==
X-Google-Smtp-Source: AGHT+IGswe1vyeb1puWzvivHer2q4YYKgsNab0UGQgEHupDJ3HXar141jY1QxQ8SpvqVrqVRh8JM6A==
X-Received: by 2002:a17:902:d492:b0:241:ff36:552d with SMTP id d9443c01a7336-245ef10344bmr5923635ad.1.1755636612834;
        Tue, 19 Aug 2025 13:50:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.50.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] libubootenv: backport patch to fix unknown type name 'size_t'
Date: Tue, 19 Aug 2025 13:49:48 -0700
Message-ID: <e401a16d8e26d25cec95fcea98d6530036cffca1.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222148

From: Youngseok Jeong <youngseok1.jeong@lge.com>

Fix:
../recipe-sysroot/usr/include/libuboot.h:29:2: error: unknown type name 'size_t'
size_t          envsize;
^

This error can be avoided by using CXXFLAGS:append = " -include cstddef"
but this way would be needed in all recipes that use libuboot.h.
Therefore, Backport the patch to include <cstddef> in C++ builds.

Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Include-cstddef-in-the-header-for-C.patch | 27 +++++++++++++++++++
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb  |  6 ++++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch b/meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch
new file mode 100644
index 0000000000..9a006e2cfd
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Include-cstddef-in-the-header-for-C.patch
@@ -0,0 +1,27 @@
+From 10c9a571f1c0472799f72b1924b039aab231e95f Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Date: Thu, 16 Dec 2021 16:19:50 +0100
+Subject: [PATCH] Include cstddef in the header for C++
+
+So C++ compiler always has access to the definition of size_t.
+
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+Signed-off-by: Youngseok Jeong <youngseok1.jeong@lge.com>
+Upstream-Status: Backport [v0.3.3 https://github.com/sbabic/libubootenv/pull/19/commits/764226a7de2ea79b182d92829922489537c766fa]
+---
+ src/libuboot.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libuboot.h b/src/libuboot.h
+index 88f0558..1f305f4 100644
+--- a/src/libuboot.h
++++ b/src/libuboot.h
+@@ -6,6 +6,8 @@
+  */
+ 
+ #ifdef __cplusplus
++#include <cstddef>
++
+ extern "C" {
+ #endif
+ 
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index e8f58941cf..7ff57ae157 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -10,7 +10,11 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/sbabic/libubootenv;protocol=https;branch=master \
+    file://0001-Include-cstddef-in-the-header-for-C.patch \
+"
+
 SRCREV = "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


