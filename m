Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F63C25B7D
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.11218.1715858822097193519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kq1sRddU;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a599c55055dso287454666b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858820; x=1716463620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2wv+cI/OhplZOduNf4j5yiNlFREniW7I8HRBWvlh9E=;
        b=kq1sRddU4vSw3a9X7dNfxV4M1GDCTdyNMjUFrFN7+lurEL4JBIIa51S2kfmqV+kH4G
         kG+EZO+0l/IKiFc9v9bGcp/Uc0m3xSIR1hDPahx/VeS+CX48AuI3IqJrhjvLRRP1dBHk
         NflJAyOP/Iipkjx0xwgmO6Z94J/2Hn3tRO1xYCYQO+thLgig9KOiZRiv86CGvfbX3U86
         TE8ZoOOHWA64ZOd/PS1RkqqTdYcZe5F60HUQgJAZZ2T9Nmd6C1wjBT8SvPn64GRy53sk
         yZ0g3fc+mR9sphgaRU5IMlnVJb2abGS5a9fIuaBBjlQ0DhmV9J/QmgVBXIh+hibTxzi4
         8/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858820; x=1716463620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2wv+cI/OhplZOduNf4j5yiNlFREniW7I8HRBWvlh9E=;
        b=eC9OZQkmxoL8QldlkIWgYmV21n391O+6wf5HUr0iij9s54spOKX9dL5jOkBkscI80o
         DwCRKXsvVEE7a3ptq/AzCtw3e0e8DgG/jXEDVCU0BAJBILvla1hcI7H5RJC9CXFeJZPo
         UJ7OGkAECWsoKW7q1UkOsDSUC7avm6OIHnYOul8b+Mf1JQR4vBM0Bd6zpEPCj2N6/qbd
         dpuYaBbyEY3j/ElDc7HExycy3N2QQV4cOhEQVIbv3PVACipv4SpJPsPCHSvikWD1QHXl
         fQtNOCcISKnDA6iLOvb+s9c7uI3mp99OFaKJkbMgMag70bmKzpl4g+OnicEJAM/Lc0ZI
         c9DQ==
X-Gm-Message-State: AOJu0YxnmHQrrCWm3g7Ycmq3UGJ1OQcfzxCLDwM4UbxCZSq1vzCwtuDJ
	t1M+USFTFzIbpxVFRwstSAuyFBhCPaN4A8qLmsrCoPyaY/oVvD6HD9yG0A==
X-Google-Smtp-Source: AGHT+IFJg9qd87O5i3eDHbZsxiHztYkQ2c/NTBFNv+mrMJ5P1dVpaoN2tnlQTjMWb5P+37TC0KNpLg==
X-Received: by 2002:a17:906:714a:b0:a5a:8ac4:3c4c with SMTP id a640c23a62f3a-a5a8ac43e15mr480397566b.68.1715858820423;
        Thu, 16 May 2024 04:27:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:27:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/13] elfutils: remove unneeded 0006-Fix-build-on-aarch64-musl.patch
Date: Thu, 16 May 2024 13:26:40 +0200
Message-Id: <20240516112640.2145789-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199480

From: Alexander Kanavin <alex@linutronix.de>

Verified on qemuarm64/musl (as the patch says).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../elfutils/elfutils_0.191.bb                |  1 -
 .../0006-Fix-build-on-aarch64-musl.patch      | 58 -------------------
 2 files changed, 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index c4d872430be..76bd2b3a99c 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -15,7 +15,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
-           file://0006-Fix-build-on-aarch64-musl.patch \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
deleted file mode 100644
index 149e0e6a7b9..00000000000
--- a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4409f128c81a9d76b9360b002a1d76043c77b53e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 17:27:30 +0800
-Subject: [PATCH] Fix build on aarch64/musl
-
-Errors
-
-invalid operands to binary & (have 'long double' and 'unsigned int')
-
-error: redefinition
- of 'struct iovec'
- struct iovec { void *iov_base; size_t iov_len; };
-        ^
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Rebase to 0.170
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/aarch64_initreg.c | 4 ++--
- backends/arm_initreg.c     | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/backends/aarch64_initreg.c b/backends/aarch64_initreg.c
-index daf6f37..6445276 100644
---- a/backends/aarch64_initreg.c
-+++ b/backends/aarch64_initreg.c
-@@ -33,7 +33,7 @@
- #include "system.h"
- #include <assert.h>
- #if defined(__aarch64__) && defined(__linux__)
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
-@@ -82,7 +82,7 @@ aarch64_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
- 
-   Dwarf_Word dwarf_fregs[32];
-   for (int r = 0; r < 32; r++)
--    dwarf_fregs[r] = fregs.vregs[r] & 0xFFFFFFFF;
-+    dwarf_fregs[r] = (unsigned int)fregs.vregs[r] & 0xFFFFFFFF;
- 
-   if (! setfunc (64, 32, dwarf_fregs, arg))
-     return false;
-diff --git a/backends/arm_initreg.c b/backends/arm_initreg.c
-index efcabaf..062bb9e 100644
---- a/backends/arm_initreg.c
-+++ b/backends/arm_initreg.c
-@@ -38,7 +38,7 @@
- #endif
- 
- #ifdef __aarch64__
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
-- 
2.39.2


