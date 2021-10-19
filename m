Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA2BC4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.11404.1634657700549203857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VDT1J4bE;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id g2so12487424wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V455byf++nqPaoEj5UNbpdS51g9MyK/hDJuq2IyS3aU=;
        b=VDT1J4bE8uIuWnvZ1KMzCaB9MKzOwPxsgVZysRHTmQfi6JFrTmqEyMrsT/Ojh1DnEo
         kNMdYkMNCc2/smcVRLXYo4eBAYKHwdRuxAVdQqVViQUPAHugKzvjVIdy82+Z1BGdbz1f
         pbwvxSnuGjw4+7FAjjU+03ASlTkh7aaZNFDbtdR577Z14joM95b7GgJDwhg3hqEbDVwf
         cn5O6Qe9xxpdBmUGX08Ka8RbzeBcUg42/Z1GGPB+WmcVovG/l5UU3dqCmTnC+61KTqr6
         hC65JBkiV7n/OknPjTFE+69iKh/Z8KmWYmniKO0fUlxuHTyv/d8ZhA6Z4+WlINUsb91M
         qoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V455byf++nqPaoEj5UNbpdS51g9MyK/hDJuq2IyS3aU=;
        b=zhWDBq+Z5ciJkvTsLNf/VVr6HNb7sHk0btKmDFpRlpyAFtl+MU7GNjqIP3iN+C+Dw/
         SzVPU6yhawmOyF5YoDrhZCxphxJ5TxorfeV0cW9Ep0YBri41+D4rOpsM0SnvXcsIWPpU
         JsJMaYNqdCrxrEtKeC+5qVcIBrBjPqxYbSGtkweyl4HAv+TZM33C7cyqwAhtOJIRdTpz
         k/K0XnDEGRGkOCSZHd2g0KjpI0g+NM6kKnLQxyqedgcR9cehfmHXdZExElYLEnl4InQN
         4Q7ET7eza6N9BuDPFfyrhgldgPSGWdv8uXYu2WDKuzAe1pZVpGN+nBG3x+omJ9qj757/
         jdhQ==
X-Gm-Message-State: AOAM533iPEh3BYBv6MfD8dSU4oso/wU6QN92hQdK0R137LqEHuT2hzkg
	tImlpPlOUo/TXMINBuPDprCe7tN5GCw=
X-Google-Smtp-Source: 
 ABdhPJyN7Uo0HpZHrz/Q1hGu9puJaVf7ZOq+mwjWd+BYbOxb2gz7x2Jn/U5s5frdih5GanpUeT9Z8w==
X-Received: by 2002:a05:600c:4e94:: with SMTP id
 f20mr6987452wmq.52.1634657699142;
        Tue, 19 Oct 2021 08:34:59 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 48/65] mesa: upgrade 21.2.1 -> 21.2.4
Date: Tue, 19 Oct 2021 17:34:02 +0200
Message-Id: <20211019153419.3319802-48-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157167

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/files/without-neon.patch             | 53 -------------------
 .../{mesa-gl_21.2.1.bb => mesa-gl_21.2.4.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 .../mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb}   |  0
 4 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/without-neon.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_21.2.1.bb => mesa-gl_21.2.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/without-neon.patch b/meta/recipes-graphics/mesa/files/without-neon.patch
deleted file mode 100644
index 56e4aa7769..0000000000
--- a/meta/recipes-graphics/mesa/files/without-neon.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Since 80923e8d ("util/format: Add some NEON intrinsics-based u_format_unpack.")
-upstream the build fails on Arm platforms which use the soft-float ABI, such as
-qemuarmv5:
-
- arm_neon.h:31:2: error: #error "NEON intrinsics not available with the
- soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
-
-Take a patch from upstream to check the ABI being used before trying to
-use NEON instructions.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12569]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 5dcce985a6dd3b7856d65e21db753e2c7a0f5dd5 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@debian.org>
-Date: Thu, 26 Aug 2021 22:35:49 +0300
-Subject: [PATCH] util/format: NEON is not available with the soft-float ABI
-
-Fixes: 80923e8d58cc ("util/format: Add some NEON intrinsics-based u_format_unpack.")
----
- src/util/format/u_format.c             | 2 +-
- src/util/format/u_format_unpack_neon.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
-index c49b3788c82..31f1f240efc 100644
---- a/src/util/format/u_format.c
-+++ b/src/util/format/u_format.c
-@@ -1138,7 +1138,7 @@ static void
- util_format_unpack_table_init(void)
- {
-    for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined NO_FORMAT_ASM
-+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-       const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
-       if (unpack) {
-          util_format_unpack_table[format] = unpack;
-diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
-index 7456d7aaa88..a4a5cb1f723 100644
---- a/src/util/format/u_format_unpack_neon.c
-+++ b/src/util/format/u_format_unpack_neon.c
-@@ -23,7 +23,7 @@
- 
- #include <u_format.h>
- 
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined NO_FORMAT_ASM
-+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
- 
- /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
-  * unless you tell it "no really".
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.2.1.bb b/meta/recipes-graphics/mesa/mesa-gl_21.2.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.2.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.2.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4e95911165..f1a1e57062 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,10 +19,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
-           file://without-neon.patch \
            "
 
-SRC_URI[sha256sum] = "2c65e6710b419b67456a48beefd0be827b32db416772e0e363d5f7d54dc01787"
+SRC_URI[sha256sum] = "fe6ede82d1ac02339da3c2ec1820a379641902fd351a52cc01153f76eff85b44"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.2.1.bb b/meta/recipes-graphics/mesa/mesa_21.2.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.2.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.2.4.bb
-- 
2.20.1


