Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2282C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 06:00:24 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.3059.1718085623002821976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 23:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SKHmB9v0;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c9cc681ee4so350989b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 23:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718085622; x=1718690422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rmkCASFIZIYDAT+nJl+oI50L6O16FsdttMUPNshGTY=;
        b=SKHmB9v0o789fQHX6flFTOUua/2fp4bIlRuoKF1CPtzGT7O+CZWtD0TIeTZ94zzwhQ
         0bihvBx/n7GgVxbJIszN0BRSFbrUkrL/JfY5sYIusOgTnQXWZe5q6xZOcXeGfwN6S/sR
         7AADLkExqLQknWPaceh6pFZDNhbrrirAbwartVLBkasVfgWQuFga3vLD1gXjBqtpbAwz
         tRsDxoYukVbWbrmq3cjwtQv+JIKlPv+Qn6ztZrplSCsjiIKe+mZf4FjlnsF+J/wGH+s8
         uwAq4gl07rojpi9v1W+cv44BxKYulgJ8O0Ux9nbR9xF3J3P+hru9JkyFj11HbfIB9nKZ
         teQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718085622; x=1718690422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rmkCASFIZIYDAT+nJl+oI50L6O16FsdttMUPNshGTY=;
        b=eX9lc00GKIcDNuVUuykWw2OcPzUMDetA5bGbqtWqLwkEVecy3L9+r7zGWkZ1Dgpt57
         +GKFBgzUsp2FQL6LZA2bZ/00DGiMt023rxES8DotKNN7d4yoRd1EW7dl5wsVG9IfUPqW
         wm5gRO0iRaFhomB8okb4F9AmpEggndavULJnn9M2kjiAVQ69SDHdQ2ShosTenKtsbcT5
         tjfBJZoW9e92/Y8mhrPNYGSdhTF3LoD8r9rgZ8G+H7w2NA40tZhHTPvti8ISRS7kvZ9G
         xAOJByPyrRNnyQuHBRtFFCAwpjhWD7sBwLh9nt2n7c1GlgMeNssKm6PS8ywJnV5JS4Pp
         rRLA==
X-Gm-Message-State: AOJu0YyAVY8xGiSHL3ocGaLuG30RDfVwD/b1daBsb89y9ZhkySJTEVtP
	jwOvGjTPKkcMS9aqSS+A899UGyZ2sc7QY9SLZbvd4LWWXQxRmEBtIWyUog==
X-Google-Smtp-Source: AGHT+IFfV8RUcYQEqHvd3S7mmzG1AKLnZ5Q+tv6Gc/YTsEAbabJiy0WpX5Yae/FyuY1MN3hLgnTeZA==
X-Received: by 2002:a05:6870:8186:b0:254:cbaf:1214 with SMTP id 586e51a60fabf-254cbaf17dcmr4768536fac.4.1718085621469;
        Mon, 10 Jun 2024 23:00:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd372a82sm7664741b3a.27.2024.06.10.23.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 23:00:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ltp: Fix build break with clang on risv64
Date: Mon, 10 Jun 2024 23:00:17 -0700
Message-ID: <20240611060017.618296-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200492

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-__clear_cache-declaration-for-clang.patch | 32 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240524.bb     |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
new file mode 100644
index 00000000000..ade6a52b63f
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -0,0 +1,32 @@
+From 2d384f268791ecd5ff0f26c8137dd4de0a1c4566 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Jun 2024 22:52:56 -0700
+Subject: [PATCH] Add __clear_cache declaration for clang
+
+__clear_cache was enabled on RISCV recently with 7352ba02390116f1cd6a9b583860ba28aa0a1b7a
+however it fails to compile with clang19 on RISCV
+With this error
+
+  hugemmap15.c:51:2: error: call to undeclared function '__clear_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+      51 |         __clear_cache(p, p + COPY_SIZE);
+         |         ^
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-June/038762.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Hui Min Mina Chou <minachou@andestech.com>
+---
+ testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+index a84ba6476..856e22ff3 100644
+--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
++++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+@@ -21,6 +21,7 @@
+ 
+ #if defined(__clang__)
+ 	#pragma clang optimize off
++	void __clear_cache(void *start, void *end);
+ #endif
+ 
+ #define _GNU_SOURCE
diff --git a/meta/recipes-extended/ltp/ltp_20240524.bb b/meta/recipes-extended/ltp/ltp_20240524.bb
index 1aafed0bf59..41d86b736ab 100644
--- a/meta/recipes-extended/ltp/ltp_20240524.bb
+++ b/meta/recipes-extended/ltp/ltp_20240524.bb
@@ -14,6 +14,7 @@ DEPENDS:append:libc-musl = " fts "
 EXTRA_OEMAKE:append:libc-musl = " LIBC=musl "
 EXTRA_OECONF:append:libc-musl = " LIBS=-lfts "
 
+LDFLAGS:append:riscv64:toolchain-clang = " -rtlib=compiler-rt"
 # since ltp contains x86-64 assembler which uses the frame-pointer register,
 # set -fomit-frame-pointer x86-64 to handle cases where optimisation
 # is set to -O0 or frame pointers have been enabled by -fno-omit-frame-pointer
@@ -28,6 +29,7 @@ SRCREV = "8f21ebba42216dbb7e8d44c23b4a977d6823f7a1"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://0001-Add-__clear_cache-declaration-for-clang.patch \
            "
 
 S = "${WORKDIR}/git"

