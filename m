Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DC1C678D7
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:52:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.147212.1673808719503905427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ef5c0Tzf;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so10323651pjm.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn70orqqyWieroVIwIoqRA3ywcJ6lv4m6C3blwZ9Nd4=;
        b=Ef5c0TzfzyOkG/YdRzydAexNSW1vSmn7ht0JRkrEoOjvFlhd1su+HmXxeQ3zY/rf57
         LoDfuzN99Xh72D0/inK0ph32dVb3E+RVJHZaFgLuBSfnMd+6ugiTLtDmTWdMgZcgaLwQ
         EWgy5BOTgbcZY7grYbquqa03Rlhpk5o64SFY7JgOnSfiuvwYB+eW5tMyYtFsWcqkT0Bg
         cdBk53dFGAIIbtA6u4xJ2wRsqLJa4Lk57+4oA2q5BkKiZ9qTeih1JQp/BMNRhewQB32/
         D6Col/KwAj1NTon2nCUDST7wAjEbb0WKQX/d7h+XlL6bVCtmRmtnWpKc5u6gXqtkFn8s
         KWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn70orqqyWieroVIwIoqRA3ywcJ6lv4m6C3blwZ9Nd4=;
        b=hpZMqvxI9GFayzuToHQqfnjuoScSR9wiZuu91YzjK3yFzU9T+VwffSb4nQd3oRBPf2
         Ohlufqy62qh6fXzMAimuY1GuzdCuEk/L6xfmg6xEvLk/WdUcD2mDU+VDjfXzM0v/Yq+/
         YrG26N4EfRc4SiDPuJ6Hks/o9HKMR0YYhnYfUY44MEZ45ODDiDncqj36NUh32YzwTjEU
         srvuWB7Tt4V3ZQb25FcC6YfeKLyTzv8VC+cFoLs3Sk6NAN8WAv9fuAfYyMSw/ZV6lIe/
         /jVR0HBY0Z+MYR6VRQTPN22w07e1S0BWLGPtM9535RDkCNvnkbIEHlB9u4zpYHoSBXH9
         pEpQ==
X-Gm-Message-State: AFqh2kqXwR8o/78O9xaODOpZb5SKPrl8u+U+gZ2FNLxASIohDivrFY1e
	f64iltOG1vFsfQliPj/MtdRA4Eh2tiC+Dw==
X-Google-Smtp-Source: AMrXdXt2kMetkR4EMTcx74VS8rnBNf2c+Phlkczy+lZIQJ+LvSLUUFZVLFawZeSQGzO6XWHsF/qVNg==
X-Received: by 2002:a17:902:e3d2:b0:192:fd1e:a96c with SMTP id r18-20020a170902e3d200b00192fd1ea96cmr16138504ple.26.1673808718709;
        Sun, 15 Jan 2023 10:51:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019468fe44d3sm5417127pll.25.2023.01.15.10.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:51:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] m4: Define alignof_slot using _Alignof when using C11 or newer
Date: Sun, 15 Jan 2023 10:51:51 -0800
Message-Id: <20230115185153.2277534-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115185153.2277534-1-raj.khem@gmail.com>
References: <20230115185153.2277534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175953

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc        |  1 +
 ...lot-using-_Alignof-when-using-C11-or.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 6ee9742277..c098a4077e 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -9,6 +9,7 @@ inherit autotools texinfo ptest gettext
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
            file://0001-sigsegv-Fix-build-on-ppc-musl.patch \
+           file://0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://serial-tests-config.patch \
diff --git a/meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch b/meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch
new file mode 100644
index 0000000000..8757abd7a0
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-Define-alignof_slot-using-_Alignof-when-using-C11-or.patch
@@ -0,0 +1,49 @@
+From b0fd3a58354b1f5ead891907979dfd3dd36840d5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jan 2023 14:55:03 -0800
+Subject: [PATCH] Define alignof_slot using _Alignof when using C11 or newer
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within "offsetof" [1]. This patch enhances the implementation of macro
+alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
+when using std=c11 or newer
+
+clang 16+ has started to flag this [2]
+
+Fixes build when using -std >= gnu11 and using clang16+ [3]
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+[3] https://public-inbox.org/bug-gnulib/20230114232744.215167-1-raj.khem@gmail.com/T/#u
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=2d404c7dd974cc65f894526f4a1b76bc1dcd8d82]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/alignof.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/lib/alignof.h
++++ b/lib/alignof.h
+@@ -18,19 +18,19 @@
+ #define _ALIGNOF_H
+ 
+ #include <stddef.h>
++#include "stdalign.h"
+ 
+ /* alignof_slot (TYPE)
+    Determine the alignment of a structure slot (field) of a given type,
+    at compile time.  Note that the result depends on the ABI.
+-   This is the same as alignof (TYPE) and _Alignof (TYPE), defined in
+-   <stdalign.h> if __alignof_is_defined is 1.
++   This is the same as alignof (TYPE).
+    Note: The result cannot be used as a value for an 'enum' constant,
+    due to bugs in HP-UX 10.20 cc and AIX 3.2.5 xlc.  */
+ #if defined __cplusplus
+   template <class type> struct alignof_helper { char __slot1; type __slot2; };
+ # define alignof_slot(type) offsetof (alignof_helper<type>, __slot2)
+ #else
+-# define alignof_slot(type) offsetof (struct { char __slot1; type __slot2; }, __slot2)
++# define alignof_slot(type) alignof (type)
+ #endif
+ 
+ /* alignof_type (TYPE)
-- 
2.39.0


