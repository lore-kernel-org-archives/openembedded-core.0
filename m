Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257DED68BFE
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 17:59:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.1641.1732471180182107410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 09:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AIMLVsbO;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2124ccf03edso34972885ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 09:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732471179; x=1733075979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5blW304xlVY693k0AH/E3LdJOEfo5MT9DOSstiyWDk0=;
        b=AIMLVsbORku/6/eKH+5lAg2FQF1qxJNIwRAuo18wQen0wYDkOedIXByGOuNCcYdJym
         kSMQ0z+eWDnz9z5vxSw4UNUjC7gwIBXvB2QFB2muME1M7V+LLGx92n33zTGOUj2sj2Ib
         TBNS5PxDmh0sjl+arSs6kIwX/NNiCx6clT9LRtD4le7E4h0vz6Nx+6euv3tZih5hnYIo
         QcI3+qJ2U+W6NZV7MUCt+nxXgHTBxOUBjW3lm2AkdM+F0Yd4OKW6hsS/1fO/51bvN/Yf
         /I0Cp1i3XcqGKtlmr8TqoYRoR8lK8DAL8gfEmks6Ruvlz2SpqXLLEDVXOW0hPGmMTGmw
         6qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732471179; x=1733075979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5blW304xlVY693k0AH/E3LdJOEfo5MT9DOSstiyWDk0=;
        b=oNEaleOV3fIWFPuy0Afjs0KqXAvK8XrqNNRexuHffSv6DP9Laxk9IOfwQdtt6Onk7f
         HrvpDSEbYoT3oK4vXVbWAbEjcjmkM+02wSJC2Np4kdPfAgPwKM2lHaYw5Xge0MZyR3kK
         E5Ai66fO0MQVtRlFdSu0s+ihikG+E8uCvQ0xBl6bYhJFpBtPDGcYRLpSbfOkHWA0ePhv
         oZwHkBWUXaEznLZzgytW32do2N1K1YrztS2JyxNDt8ilnvl9oK8k6AuejF1d1QBVJ7nW
         LPA6FtZDCFAVF4NQ7s4o+mjcwLHFdyvRPSyKE/2CdnoP7QbwGxREXeq7QhYLJm72u1+k
         B7WQ==
X-Gm-Message-State: AOJu0Yx/oEH2EGW/PV9lfMvZIxsL9K9EQDGSnQKChFilCPcdOd3rVUA2
	52E94mxKSb0tycSgIoYTPyfXeWqsvmj71BxXc19jiTG5UmG6CtSRp3L3sQ==
X-Gm-Gg: ASbGncvWIyeDMbq63baR0ZNuPB45q/gtQlYHJh+4hUnQSL+etRoC6skHtKCgSH5ostr
	f1moTUj4VQaXhY4+UxAbZC/P2/bSaL/Oqfmtu/uJ0h8Tdq5l1VEpavemSaRc0XmsJfatBp0mY00
	kUzs+kGj8nWab5F7X0WbJ2+7H1xkPm5v2fDdImv/BPpWyHP7Hsx9K8ey4v1RG/hThGrv2YZxIpN
	j0ssf6pYNYNSlIN5PbL82ASUdtHneYcoxrFVvfsLUnGfYF4brQV
X-Google-Smtp-Source: AGHT+IFjMWY02vvqBG0UTv3EW3QFnZyoVyjYIJdDpsy5ofRGsfVLGfUUVty4chQ9k2mOaA4aJADtFw==
X-Received: by 2002:a17:902:ecc5:b0:20c:c704:629e with SMTP id d9443c01a7336-2129f838c2emr138912445ad.56.1732471179291;
        Sun, 24 Nov 2024 09:59:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4338])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724ea6a23a4sm4035357b3a.60.2024.11.24.09.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 09:59:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Fix build on riscv64
Date: Sun, 24 Nov 2024 09:59:35 -0800
Message-ID: <20241124175936.3682310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 17:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207712

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...o-riscv.c-fix-riscv64-build-on-musl-.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 02cd7c8dc8f..041a24e711c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
+           file://0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch b/meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch
new file mode 100644
index 00000000000..16762e033eb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-util-util-cpuinfo-riscv.c-fix-riscv64-build-on-musl-.patch
@@ -0,0 +1,41 @@
+From f60ea4ae2298f0f077a97648c138283357337370 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Milan=20P=2E=20Stani=C4=87?= <mps@arvanta.net>
+Date: Thu, 5 Sep 2024 16:17:50 +0200
+Subject: [PATCH] util/util/cpuinfo-riscv.c: fix riscv64 build on musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+build fails on musl libc (alpine linux) with this error:
+
+../util/cpuinfo-riscv.c: In function 'cpuinfo_init':
+../util/cpuinfo-riscv.c:63:21: error: '__NR_riscv_hwprobe' undeclared (first use in this function); did you mean 'riscv_hwprobe'?
+   63 |         if (syscall(__NR_riscv_hwprobe, &pair, 1, 0, NULL, 0) == 0
+      |                     ^~~~~~~~~~~~~~~~~~
+      |                     riscv_hwprobe
+../util/cpuinfo-riscv.c:63:21: note: each undeclared identifier is reported only once for each function it appears in
+ninja: subcommand failed
+
+add '#include "asm/unistd.h"' to util/cpuinfo-riscv.c fixes build
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/c5757f808bd74db7ef1a90ee28334f3b5afb8179]
+Signed-off-by: Milan P. Stanić <mps@arvanta.net>
+---
+ util/cpuinfo-riscv.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
+index 497ce12680..8cacc67645 100644
+--- a/util/cpuinfo-riscv.c
++++ b/util/cpuinfo-riscv.c
+@@ -9,6 +9,7 @@
+ #ifdef CONFIG_ASM_HWPROBE_H
+ #include <asm/hwprobe.h>
+ #include <sys/syscall.h>
++#include <asm/unistd.h>
+ #endif
+ 
+ unsigned cpuinfo;
+-- 
+2.46.0
+

