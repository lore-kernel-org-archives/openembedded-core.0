Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6F5C77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:06 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.51329.1682788860083944918
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ptF/dJQJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63b78b344d5so806973b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788859; x=1685380859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3v8PZ07xEkCRTKorZIXpE3GHrM/U0CooqmpUM0lZ2Q=;
        b=ptF/dJQJnRLogyAcxxQZTAAZF1GLX2tdVnmqm4czN3pydOULQgyebBqrnNnBPqsgpw
         Bipi2iBKhcVHRzwHamR7OFcIuwcoOHCEHrk+aRNAN2/1Tn01zLZJCE/MDrUirecPEhnz
         jAESoR5R2a1egc2MQUzQ3U36cmjiZhk/1ib8QBvBjgAJ7dUaaYhGJVEKgdJegTFg7Ugo
         1w/0a0KfoRFk4XDOaYzMZf93FO2T1eY5xeG6uyHudFoUK9UexhNGdt6H7JF+WuwopeJw
         j6Id9yGttnYMnw/69SjEDpnEhSwWQmyip2tF+pvyjB2NPR9SpYW2f1KvcWvTkJhG5wOg
         ygCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788859; x=1685380859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3v8PZ07xEkCRTKorZIXpE3GHrM/U0CooqmpUM0lZ2Q=;
        b=U7aGu4LEN6IaMWZ0wt+AXJyVeQOLnIpwKkiYGf/F9bWaxWxMj04r/XclQvmycIdwbb
         OB4Dkd+0/UZCiiWDtcbmHpcQTm1dX3pGB0u3Q5wmTG4nAP4+lfl127yeXpIUMt9h093e
         rkLfDxiG1ZYOYX9rniHVw9DcQt49dqlnKLwAitJnKaLAH2mJYFgjMJgM9PBQZ6QAftjt
         /Xn2Z8TAa4AY9j4x6Wooj6WSu+sYbH4GTu4VvGQXih6SazAzvJ0+UIQ6kpXBveQ/ViId
         OymUuuD+eMyQYOMAWF2Td5dPUMhLVCcNqKu6f2Ws9hhytc+cJ83zkFViHm6JHLnNy8AU
         FtxA==
X-Gm-Message-State: AC+VfDxakeIAuzv8jWDZoc/6xiDFdt/zbFyg0lCkWrBTA5NiLjovVQnC
	W7xOg2OhOpmJAP4IBCemlp3DBY7u3GVucT0G5wc=
X-Google-Smtp-Source: ACHHUZ5P7fjp4qE/p2LqJgmCO4Y2N/F/5qC5i8PMGIW+1Z3eV/lbbmNljooL9UMTePwaIW2x4ZnCFQ==
X-Received: by 2002:a17:902:f68c:b0:1aa:d9c5:9cd5 with SMTP id l12-20020a170902f68c00b001aad9c59cd5mr1886144plg.11.1682788859078;
        Sat, 29 Apr 2023 10:20:59 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:20:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/13] nasm: fix CVE-2022-44370
Date: Sat, 29 Apr 2023 07:20:24 -1000
Message-Id: <1568df72136f46f0767bba56c10c48bf2a1ec259.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180547

From: Archana Polampalli <archana.polampalli@windriver.com>

NASM v2.16 was discovered to contain a heap buffer overflow in the
component quote_for_pmake() asm/nasm.c:856

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44370

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nasm/nasm/CVE-2022-44370.patch            | 104 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |   1 +
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
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index edc17aeebf..59b1121bd4 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2022-44370.patch \
            "
 
 SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
-- 
2.34.1


