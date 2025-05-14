Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5E2C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 16:48:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.107549.1747241272242206547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 09:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQ1zDQIo;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e033a3a07so570375ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747241271; x=1747846071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kVxUt5DBVoBoHLXJDS14yCIa5pJmgwSHJbuKnySiQaE=;
        b=TQ1zDQIodCalYuDuZwMwPyp6fm2BdAXpOWIU7k/v+vuy6z5QDMGJs5bJptk+N7ccpH
         Jhs33Ye8m1+6YQrur2XiAm/CtBqq7uTWzVH2Bj/SGNlNNfIbNOF2lVJ/nhEkWv2vEpCz
         ySR3OkYktjIxNpYpPVkbC3jK3hxrhbgCWFv10xLlwyp2zQFFQ2ZRkDDlAKJhrXynAuJD
         +9S4zTTb/k8xQe371ozJS9dpplCtSacIsEVQCtamjzyIhwWOlPaGM/aElfEurkuIlk+F
         B32qc+or2jXu8vYbEMFf8uJG9ZjFKTn/WhCfxXa6VnPPbLJTt8O3hrCGcjYaAFr/d0rQ
         A8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747241271; x=1747846071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVxUt5DBVoBoHLXJDS14yCIa5pJmgwSHJbuKnySiQaE=;
        b=mwZTcgFRDBV+HDdZbNI/4LZwPhxojEv1sU/gQpW/6O2yQDofRQWIDoaZa9CjSKTQ95
         MjF2qWeu78fuoryr5qzaa6V6rXT/VDnS/1Nkqd7qf2oSLiFClLkIiYfVshcsNcxfpZEk
         4InJLvJ1PQc/oE65nekDzMAEIevbxJ3/PE4iTtebwXFqOQaGwzO4kfLncXUQ4T1nYanY
         Cbt8fzsGBD1seKZ+2v3qFZeMUWt69okSvIjLG5aOEqIi8x+6rdO4l/BscwriKx9XMTA7
         d6Jk1uVMlndgtib2IJYAVsMWTL8rNuChy4PIzgaadT5SP8MzJ6uAnhoqnvfjNhEb4iTb
         XlBA==
X-Gm-Message-State: AOJu0Yx43Ed8NjXs7yKJdPTWf+zDlL+t7NNmv74Ziv4K27HvUoKk7TRo
	4vwX2ST9MTwpCtzV6rFgNgSAjPP8UjCM3cMpmFg+zx4ODIgqSWEUl4J2idm+
X-Gm-Gg: ASbGncvn7RggZ8HD5fwjH6d5oKAOHenxbrrYiSAvnYpXbpGIKiAb8iayst9ZlFWiW56
	HsxvPH18o3XY9vn20YkBgxTgPQXoirDlg6/w9GkP77HfS0cDNcLY1J7fgK4Er2tRGF1IkizhwQn
	sV/NXmlNwkzimdegFBQEjGUk4pFmDREtL/pui1y/wGoix9lmq5AQllLm7AXGOmm572oAaySuNE3
	MNzI6eGVStIdy/K3Cl3zokaK35wolzULAS1+uxGjKpAPLbhDxm5H45vUHqFxXDewHvh+ZL30Z8f
	4390KGvrqz/tGXXoZZLwPWMzC39ke9pIorhHTqrhorY=
X-Google-Smtp-Source: AGHT+IGHVW5VrvJbm/lM6/U7K3X+QshzElBjUuvmcTiRVb7cms8m/VS7LGIcaNFkzUAO+ps2+nCC5g==
X-Received: by 2002:a17:903:1252:b0:220:ea90:191e with SMTP id d9443c01a7336-231980cde33mr57401755ad.4.1747241271250;
        Wed, 14 May 2025 09:47:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271d70sm101351435ad.110.2025.05.14.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:47:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] valgrind: Fix build with clang
Date: Wed, 14 May 2025 09:47:42 -0700
Message-ID: <20250514164742.2104915-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 16:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216518

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tax-for-pushsection-directive-in-inl.patch | 31 +++++++++++++++++++
 .../valgrind/valgrind_3.25.0.bb               |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
new file mode 100644
index 00000000000..b59c5442231
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
@@ -0,0 +1,31 @@
+From 2089383a0e3a50f527337ea05188b3e302069888 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 May 2025 09:29:33 -0700
+Subject: [PATCH] Use portable syntax for pushsection directive in inline
+ assembly
+
+'@' does not work with clang inline assembler, but '%' works with both
+gcc and clang. Therefore use '%' to make it more portable
+
+Fixes
+<inline asm>:1:41: error: expected '%<type>' or "<type>"
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=504222]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ coregrind/vg_preloaded.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
+index 5bec51d..e4c2dbc 100644
+--- a/coregrind/vg_preloaded.c
++++ b/coregrind/vg_preloaded.c
+@@ -55,7 +55,7 @@
+ /* Note: The "MS" section flags are to remove duplicates.  */
+ #define DEFINE_GDB_PY_SCRIPT(script_name) \
+   asm("\
+-.pushsection \".debug_gdb_scripts\", \"MS\",@progbits,1\n\
++.pushsection \".debug_gdb_scripts\", \"MS\",%progbits,1\n\
+ .byte 1 /* Python */\n\
+ .asciz \"" script_name "\"\n\
+ .popsection \n\
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
index 67166a4ef0e..6650dcedbfd 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
+           file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch \
            "
 SRC_URI[sha256sum] = "295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"

