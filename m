Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4323E82CDE
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.47404.1696102827034421404
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sti0TCdl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso1307211b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102826; x=1696707626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctgLEJMbOrSAwiHt1OmQmqYRyn2JPy/Tgdrw1HczCT0=;
        b=sti0TCdlF8j9evdqINlgZIggVHn9AwiaVV8CgWQUSbEPPMUYMVDcqwTW17ss6XkHOD
         dcbQrxbg6SOHfOTfHoet/yIaq8amBZZY6b4Xp2IeViiAJcjVchj+9uj/T3j1Ypi0LVWK
         YWfvjc5suGJRvPA0owr9sQvcJEKdVn1QBvWExx6Xn++Y0EPJCa1Obpr4/Csq1MjgPFi5
         A5neZ1WUlTSxEcceTBFkUhBjcYhQoJiXGRvsu9qheqDXUjnujx5vh7oaC/LxL+Sl2A+l
         6KuKHBugXu4+iA/NXUTpN7ZD4tVrxZQbvoCOi2RZ7N7yF9+IbcCSERHyeVl+1vxFtU9Y
         6yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102826; x=1696707626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctgLEJMbOrSAwiHt1OmQmqYRyn2JPy/Tgdrw1HczCT0=;
        b=kdsjIKvrviXBxpoMFzPVQJ17CYUXT/CJdIesF+S3h9xfG6oLwuGuwgH4nnVyZVr+qq
         MmDoIovi+b3IDg7s8tOJ3QqMZaBJBgXmzgtreHXNsU6WUtPISnhWk/7iqTf2ZauIxJlI
         jgE2j7JxEtYOZ0uylzF43o/Z0mnWRm+YJ6hFdvkrNZGBeDF1nJGQhMD4Cl/csJNeM508
         syv/0aLJ/NhRjzi84doIgCrGwsDTTT7e9j+bAeWhnjrjSDvxGyt3D+ipNPMfcDSh4MPT
         ljFIXeQWgQqm3OCQhR8HvjQnp5nCndZRn7KxCVDlnippz/WSZ514vEPzYDZUUm+1wwW1
         UKYQ==
X-Gm-Message-State: AOJu0Yyrhs70jStn6z1mIKBLl57IUcO4vETfN0r91RGFp36Hs7yrNnp6
	mrgqCJFeBSMqn4cZlqhmaL70vLwE2nGVJojKjCU=
X-Google-Smtp-Source: AGHT+IHVwjDyRvePk1ZkP+J1bpac+ioaMsgZGn5ujGtTi0WSp3v6VMB8YozQjl3DUQys6YPdXSGg1A==
X-Received: by 2002:a05:6a20:7f96:b0:140:61f8:53f6 with SMTP id d22-20020a056a207f9600b0014061f853f6mr12855455pzj.29.1696102826057;
        Sat, 30 Sep 2023 12:40:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/13] nasm: fix CVE-2022-44370
Date: Sat, 30 Sep 2023 09:40:01 -1000
Message-Id: <91e716b75861f2a4acee58a0c3f95e511058f1dc.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188469

From: Archana Polampalli <archana.polampalli@windriver.com>

NASM v2.16 was discovered to contain a heap buffer overflow in the
component quote_for_pmake() asm/nasm.c:856

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44370

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d

( cherry picked from commit 1568df72136f46f0767bba56c10c48bf2a1ec259 )

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nasm/nasm/CVE-2022-44370.patch            | 104 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.03.bb    |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
new file mode 100644
index 0000000000..1bd49c9fd9
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
@@ -0,0 +1,104 @@
+From b37677f7e40276bd8f504584bcba2c092f1146a8 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@zytor.com>
+Date: Mon, 7 Nov 2022 10:26:03 -0800
+Subject: [PATCH] quote_for_pmake: fix counter underrun resulting in segfault
+
+while (nbs--) { ... } ends with nbs == -1. Rather than a minimal fix,
+introduce mempset() to make these kinds of errors less likely in the
+future.
+
+Fixes: https://bugzilla.nasm.us/show_bug.cgi?id=3392815
+Reported-by: <13579and24680@gmail.com>
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-4437
+
+Reference to upstream patch:
+[https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ asm/nasm.c         | 12 +++++-------
+ configure.ac       |  1 +
+ include/compiler.h |  7 +++++++
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 7a7f8b4..675cff4 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -1,6 +1,6 @@
+ /* ----------------------------------------------------------------------- *
+  *
+- *   Copyright 1996-2020 The NASM Authors - All Rights Reserved
++ *   Copyright 1996-2022 The NASM Authors - All Rights Reserved
+  *   See the file AUTHORS included with the NASM distribution for
+  *   the specific copyright holders.
+  *
+@@ -814,8 +814,7 @@ static char *quote_for_pmake(const char *str)
+     }
+
+     /* Convert N backslashes at the end of filename to 2N backslashes */
+-    if (nbs)
+-        n += nbs;
++    n += nbs;
+
+     os = q = nasm_malloc(n);
+
+@@ -824,10 +823,10 @@ static char *quote_for_pmake(const char *str)
+         switch (*p) {
+         case ' ':
+         case '\t':
+-            while (nbs--)
+-                *q++ = '\\';
++            q = mempset(q, '\\', nbs);
+             *q++ = '\\';
+             *q++ = *p;
++            nbs = 0;
+             break;
+         case '$':
+             *q++ = *p;
+@@ -849,9 +848,8 @@ static char *quote_for_pmake(const char *str)
+             break;
+         }
+     }
+-    while (nbs--)
+-        *q++ = '\\';
+
++    q = mempset(q, '\\', nbs);
+     *q = '\0';
+
+     return os;
+diff --git a/configure.ac b/configure.ac
+index 39680b1..940ebe2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -199,6 +199,7 @@ AC_CHECK_FUNCS(strrchrnul)
+ AC_CHECK_FUNCS(iscntrl)
+ AC_CHECK_FUNCS(isascii)
+ AC_CHECK_FUNCS(mempcpy)
++AC_CHECK_FUNCS(mempset)
+
+ AC_CHECK_FUNCS(getuid)
+ AC_CHECK_FUNCS(getgid)
+diff --git a/include/compiler.h b/include/compiler.h
+index db3d6d6..b64da6a 100644
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -256,6 +256,13 @@ static inline void *mempcpy(void *dst, const void *src, size_t n)
+ }
+ #endif
+
++#ifndef HAVE_MEMPSET
++static inline void *mempset(void *dst, int c, size_t n)
++{
++    return (char *)memset(dst, c, n) + n;
++}
++#endif
++
+ /*
+  * Hack to support external-linkage inline functions
+  */
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.03.bb b/meta/recipes-devtools/nasm/nasm_2.15.03.bb
index fc7046244a..6a8c57827d 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.03.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2022-44370.patch \
            "
 
 SRC_URI[sha256sum] = "04e7343d9bf112bffa9fda86f6c7c8b120c2ccd700b882e2db9f57484b1bd778"
-- 
2.34.1


