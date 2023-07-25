Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947E7C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 03:56:31 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.13225.1690257389840287418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 20:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Lxvb64f7;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso2055578a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690257389; x=1690862189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CSYGiaUMmn0iyEEDbmOI4x76UmO7claw8vv3Gy37jE=;
        b=Lxvb64f7NQYbtAVameqZOQErT9r2PdQqE8GcT+WZpkCs1xhk4PaOFmEbuQCJN8Nf3z
         tVxFplK1sofDqa40A3GmzytldxS+u1xVGLr2QhviNxCmXSFgnTDukeGkZzJaBSfdCHg2
         0r23lWERm28TmksAMw/sbCeTL/cQtXfPvuA5HlOzOiW8OPGCjiqK6gQnYymI7NeAKULc
         LfvXqLlPF9SFC9Pt7fWgig5cUuCxDiB9FtbL/2sZx7vtp+/XkdnoTO2BQzmSzRPaj10I
         8DEOvxSpJWgjoV61wLYEBcNsc7VuxDihSomDCLQtQPrUeXeBZJnp7sZZ/pRaijiNeP/w
         mc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690257389; x=1690862189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CSYGiaUMmn0iyEEDbmOI4x76UmO7claw8vv3Gy37jE=;
        b=NRHOiyJ/OF4jQ2LciN3JSlP2B11g/JeaEZjK8WQci8OneVM/A17eNUkRCcG9Zcl+Vs
         VzCH21S+HV8AHG4RTqOJUqjL/+QEvHdt8IuHlThAS/EnouCACdPqryMgK9g7sAZyZPZF
         Y31nfIaTptQ9Zq3udvmpRpD4qigzsXc1tt5M5nFc0NBY3QHx5eQJW3ZG7Yt26AHb4inn
         0aOPgMh8/MSS1KXDi5TugnhDiuJaEiG9q1Fu/ej7e7fdXhIN4H7gICxmfHNASg0jmPch
         h9yqnL+WFz7UYGD5FmtsBVe6YX14OizqhUFexxGmOTBX8VCUvkvAbMUH29VXt/iCP5EB
         SOKg==
X-Gm-Message-State: ABy/qLYkYSMvSWj64wkDkFuVkV5IA/Il2uVhMssPbv2O+/ZQSO28Vrel
	mmRmUhEWE8T05bVfXl1FSKyTaM5D8vCeow==
X-Google-Smtp-Source: APBJJlGeO04UKFuDfq83RSpScaATbNSl3/zRHGWYUYVWC1XVEasrlHmUSHLvvJAkXBxtQ94QNu/ZGg==
X-Received: by 2002:a05:6a20:8e1b:b0:138:3302:1471 with SMTP id y27-20020a056a208e1b00b0013833021471mr12707450pzj.6.1690257388610;
        Mon, 24 Jul 2023 20:56:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6adc])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709029b8700b001b9de2b905asm9808668plp.231.2023.07.24.20.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 20:56:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] nfs-utils: Fix host path contamination building locktest
Date: Mon, 24 Jul 2023 20:56:25 -0700
Message-ID: <20230725035626.984709-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184819

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-Makefile.am-Do-not-use-build-flags.patch | 36 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.6.3.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
new file mode 100644
index 00000000000..351407ddcd4
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
@@ -0,0 +1,36 @@
+From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Jul 2023 20:39:16 -0700
+Subject: [PATCH] locktest: Makefile.am: Do not use build flags
+
+Using CFLAGS_FOR_BUILD etc. here means it is using wrong flags
+when thse flags are speficied different than target flags which
+is common when cross-building. It can pass wrong paths to linker
+and it would find incompatible libraries during link since they
+are from host system and target maybe not same as build host.
+
+Fixes subtle errors like
+| aarch64-yoe-linux-ld.lld: error: /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nfs-utils/2.6.3-r0/recipe-sysroot-native/usr/lib/libsqlite3.so is incompatible with elf64-littleaarch64
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=169025681008001&w=2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/locktest/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index e8914655..2fd36971 100644
+--- a/tools/locktest/Makefile.am
++++ b/tools/locktest/Makefile.am
+@@ -2,8 +2,5 @@
+ 
+ noinst_PROGRAMS = testlk
+ testlk_SOURCES = testlk.c
+-testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
+-testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+-testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+-- 
+2.41.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
index 44542857897..02b62e218c0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch \
+	   file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            "
 SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
 
-- 
2.41.0


