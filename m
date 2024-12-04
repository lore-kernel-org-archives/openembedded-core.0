Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7017E77177
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8191.1733294998979926329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cl4yKZ5j;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e06af753so2647902f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294997; x=1733899797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkfkVMLqqj5U2spG6eldCzXWKnya4Dv+cCLrzJC4+pI=;
        b=Cl4yKZ5jLZzlJ5L2Tpgb6HZLAz8UCW5AGZmKW+5bRMRtukOTE8Cb5VBC8oDWOpnIUG
         GeyLtWQatCijtZI3KONTF4oLZcXVXIk945zofmDSheilzFDlB6I2dMrGHnFts2BeOddx
         +qchQLQXyAk0GzOXgy6NvKd3jGz9VfwnkIEg0oyPC9xy+adPUCu83VdKnAEFizgbtCYD
         dNZzeg18Ecyf8fonJYx8utAWSJl5Dnvghbnc53W389Rxr6mw5Tn0blBYEqdy2DXpVuNO
         j8WtHI/m3iCYubA8BUSHrA9UfZefrkjFHXvs+HAKOk7bni2ZuaEsrgdwq599HBsXF+Fz
         d1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294997; x=1733899797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkfkVMLqqj5U2spG6eldCzXWKnya4Dv+cCLrzJC4+pI=;
        b=Fl7wzsjTDYVLEwpnUG0Xh//ZnSp3qYYMwQUr9C7wQ0+7NoRUqrDJxVugkCCGudF8Mr
         hw32/jiJ82Y8x+lqFQ+BtFu2/JkRz3VC3TDuK2Lvt8vxh/sNr0Osc1j2mpJwu++xbVyk
         szpDklJxcDdq2BI74AhHe9hEYOPVgpylj0lHDWzNOgusHmW6sgkbwctgC58Nh4tOBxK8
         4N2RZJA+eeTgVcEFXI0EwyH49OvsV919StoVn+Mquj2yuD+xDVB75RXkM24I9rJnD/nv
         YT9jcgLud7IA0nUhmwO2XQRFIOs2Ei8minS2hGmp2BrQ5FAy9AN6dWz+YgcRoKDR474R
         VTpg==
X-Gm-Message-State: AOJu0YxbDbBkRkWTogTVIi5EswtAGDDaxyRLI5rSq4uk6v8ts2uY1EJd
	GQDsucGJ9lRKb8aZSbinMZRlyT/fokvSRnZEm0qNXiNP1ED3mkJM0C9ptg==
X-Gm-Gg: ASbGncthqsP2wHwpiJvKOQYTj5jIGDHSkerbgkHwY6nPD9OVSnZO4LbdOoGcnk9Ynzt
	frbW3ubMAjpZxw3RuqQg6VStNczJH36Y8v8BLXpOJ23oST+pGLkJsBXWLbHQmc+KUt/C0QPCisP
	mkAWW5vk0txBUSDtJJTBB3yhpSjyiI8FO1I/cxXPJzmGLrKrZi9arBKcPDYCieoP9lnVn8ssUaJ
	Ym6suDHH9qeVysPWVwZIoQVxUHi73xVZQ3EpNk5uEJB/+HI1lx0xRV9wxKAN4tVzsz8L6+xNwSX
	A/op5RdwmoA=
X-Google-Smtp-Source: AGHT+IEvUYc8VHtVoMQ1PqJgO+aG5AsM3kXLFell/cFXno7qABrn6jnGrqigKD3ogaAEhFvDQDvBcA==
X-Received: by 2002:a05:6000:1787:b0:385:fa20:658b with SMTP id ffacd0b85a97d-385fd3cd9ccmr4994197f8f.24.1733294997231;
        Tue, 03 Dec 2024 22:49:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/37] vulkan-samples: update to latest revision
Date: Wed,  4 Dec 2024 07:49:11 +0100
Message-Id: <20241204064920.817016-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208257

From: Alexander Kanavin <alex@linutronix.de>

Drop patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ce-FORCE_INLINE_TEMPLATE-with-inline.patch | 52 -------------------
 .../vulkan/vulkan-samples_git.bb              |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch
deleted file mode 100644
index 22538d41194..00000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From a7bfe82a311c713b12bb83b8488574ad5c784f89 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 9 Jul 2024 04:29:11 +0000
-Subject: [PATCH] zstd.c: replace FORCE_INLINE_TEMPLATE with inline
-
-Refer [1], always-inline is not suggested to be used if you have indirect
-+calls. so replace FORCE_INLINE_TEMPLATE with inline to fix error:
-In function 'ZSTD_compressBlock_lazy_generic',
-    inlined from 'ZSTD_compressBlock_greedy' at TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21914:12:
-TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21551:30: error: inlining failed in call to 'always_inline' 'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlining
- | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
-      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21736:32: note: called from here
-|             size_t const ml2 = searchMax(ms, ip, iend, &offsetFound);
-
-Upstream-Status: Inappropriate [ Latest upstream ktx don't have this part code ]
-
-Has report this issue to upstream Vulkan-Samples, refer [2]
-
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107931
-[2] https://github.com/KhronosGroup/Vulkan-Samples/issues/1089
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- lib/basisu/zstd/zstd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/basisu/zstd/zstd.c b/lib/basisu/zstd/zstd.c
-index eaf13738..423f149e 100644
---- a/lib/basisu/zstd/zstd.c
-+++ b/lib/basisu/zstd/zstd.c
-@@ -21548,7 +21548,7 @@ size_t ZSTD_HcFindBestMatch_generic (
- }
- 
- 
--FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
-+static inline size_t ZSTD_HcFindBestMatch_selectMLS (
-                         ZSTD_matchState_t* ms,
-                         const BYTE* ip, const BYTE* const iLimit,
-                         size_t* offsetPtr)
-@@ -21596,7 +21596,7 @@ static size_t ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS (
- }
- 
- 
--FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
-+static inline size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
-                         ZSTD_matchState_t* ms,
-                         const BYTE* ip, const BYTE* const iLimit,
-                         size_t* offsetPtr)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 06e996d2435..2dd4bba5230 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
-           file://0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch;patchdir=third_party/ktx \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "fdce530c029514e2f66296288f9ee26a05058ec1"
+SRCREV = "4838e02a4b08236931bec0532fc26ee3871b466a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.39.5


