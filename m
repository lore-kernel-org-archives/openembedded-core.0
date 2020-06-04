Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.17702.1591287178097505099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 09:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YA8xIr+i;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id 185so3643348pgb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/hoDBxs50aZbowanKCKm91QsrNVsId5WkDkB0aAG1w=;
        b=YA8xIr+ibz0Ouvr9pLuS3nHBIjNYRQw2soyCMAtu/0Yl8I9Jkuq2oBABXUMh9ixquQ
         wfu/zVwdcaXGXH0qO8FrUm1/2cGuEPPDFj5a/Fi389rdxJp9qJ9+aGTnEESbVnnzZXyr
         PwhQTdP3h0LipwOLuI2d6ZSCSGM4f0NIFbJYqXpPbL6HsYyKLoURDonNCu69xtUEMnGV
         0jEBAE3r/9RcrqO1oVF6yR/Hh7+vPwe28BCJLONCOHxe+AQ9QgxWZvaRh4yIVJ+1zu+9
         iaT9jIgsihmgUsmZRZZ5poGTRYZczxXjujUD+f/jicjfWCxifl4JCkQvDjNVzMT4R8Q1
         YPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6/hoDBxs50aZbowanKCKm91QsrNVsId5WkDkB0aAG1w=;
        b=JYF9KAjlv4fZDcoieSFrfy9f1aiwlO3nZTEbmBZM6bUr8kIZrVBZVxqweKBCAoBorZ
         hHMrDqukXwWhuU4B3wJaKy7WynO+ss+GMnYjlbYdQUjxPjJYZF6pEIZXtt2/NcEBwUa3
         /23/N139NfiCgeZT+ZCN521uw/2VUGx+4EbQ/E87jGBQ4aGWkHfJHhc9Amt9bCXCN1vW
         l5cG8hAqZo8OmFUcOrYqQDHFVF8gHM+ZIm3+UGsjx9i8ApH/vzKXwfkxrouoGoaI0wbd
         27BTfpVQ/P++W8GslVEHgNwjmD9tImDmLl2r2toSPar6DEt960WWyRg4XESgy6zrFn1u
         txtA==
X-Gm-Message-State: AOAM531OowhVQq27JAsb+pmZTnxqWpudusQ/0OdZyuwciCLNtGTAfVqT
	7xmJUS2wjzEbLqw8Q/9m1f7+NPyuzOk=
X-Google-Smtp-Source: ABdhPJw6oohBo9199wKwIqT/mz0cpC9H86LDYaYIqYBEP7s/Hq+idIi1vy0gh3SkorBylne+qoUN0A==
X-Received: by 2002:aa7:97bd:: with SMTP id d29mr4766334pfq.262.1591287177238;
        Thu, 04 Jun 2020 09:12:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id q8sm6230681pjj.51.2020.06.04.09.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 09:12:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libunwind: Fix build on aarch64/musl
Date: Thu,  4 Jun 2020 09:12:46 -0700
Message-Id: <20200604161246.2595187-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although this patch should be applied irrespective of libc but
kept it musl specific to avoid extra testing.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libunwind/libunwind/sigset_t.patch        | 29 +++++++++++++++++++
 .../libunwind/libunwind_1.4.0.bb              |  5 +++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libunwind/libunwind/sigset_t.patch

diff --git a/meta/recipes-support/libunwind/libunwind/sigset_t.patch b/meta/recipes-support/libunwind/libunwind/sigset_t.patch
new file mode 100644
index 0000000000..4fb7744cdf
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/sigset_t.patch
@@ -0,0 +1,29 @@
+Do no use __sigset_t which is in private libc namespace
+replace it with sigset_t, This also makes it portable
+to musl.
+
+Fixes
+
+../../libunwind-1.4.0/include/libunwind-aarch64.h:195:2: error: unknown type name '__sigset_t'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/include/libunwind-aarch64.h
++++ b/include/libunwind-aarch64.h
+@@ -34,6 +34,7 @@ extern "C" {
+ #include <inttypes.h>
+ #include <stddef.h>
+ #include <ucontext.h>
++#include <signal.h>
+ 
+ #define UNW_TARGET      aarch64
+ #define UNW_TARGET_AARCH64      1
+@@ -192,7 +193,7 @@ typedef struct
+ 	unsigned long uc_flags;
+ 	struct ucontext *uc_link;
+ 	stack_t uc_stack;
+-	__sigset_t uc_sigmask;
++	sigset_t uc_sigmask;
+ 	struct unw_sigcontext uc_mcontext;
+   } unw_tdep_context_t;
+ 
diff --git a/meta/recipes-support/libunwind/libunwind_1.4.0.bb b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
index f50205f1b9..f9036326d5 100644
--- a/meta/recipes-support/libunwind/libunwind_1.4.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
@@ -8,7 +8,10 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
            "
-SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
+SRC_URI_append_libc-musl = "\
+           file://musl-header-conflict.patch \
+           file://sigset_t.patch \                   
+           "
 
 SRC_URI[md5sum] = "5114504c74ac3992ac06aa551cd55678"
 SRC_URI[sha256sum] = "df59c931bd4d7ebfd83ee481c943edf015138089b8e50abed8d9c57ba9338435"
-- 
2.27.0

