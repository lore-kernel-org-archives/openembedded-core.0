Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.4531.1604880150994133638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ifqc9sTC;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id i13so538256pgm.9
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9zFbfMR1uMeCHlLLKPlqu3qMmjp2FOSCLLlaO6NOPug=;
        b=Ifqc9sTCOZn+JiKGLdewGtE7Ln32V79WfXlI4xQp17QB7yITS+feCqs290/KTcAO8k
         MjmPAa+swjlqnIQccHRBnQH9ZypFOxjGsQDEu7VPJt/HHIk2IUtnoo00Di8bCkxqRqk0
         nz1fIfh66Ax0TX+3cyNQjlH/TQulktGRqY0cnyOEuZzHcYyQ3q4ksIm9uwvm+PPtUOY+
         EQR4dP0hbl00yVagyPT8Tc87J0IXFhrlqsH8R4b9V3oDo8rVV0767i1dfFPMRfcd8o+x
         D4MWZ4XizmkJXK+SKUKEdM0py5KOa/T4UQV/jUQmy4HKcqvNRpkzXpuz3q/kSpTFrlmf
         ae5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9zFbfMR1uMeCHlLLKPlqu3qMmjp2FOSCLLlaO6NOPug=;
        b=sKhKwUyKM+9CudjaXq75j+vvGShjpcnhyA1G2dy+lh0JQjaEmmKHqGh4ny9088jjxJ
         6iiTIhr2bAbVDzqidm4aB9Nu+uqIRBIeAy6UQ3wOJcIj4QiwpQsUioCMQWgG5MPaAMaO
         bww36G6Nm4+bb4zjDB7wygLNLhjS3+vQdydTfZvdpSo5mfEeP67gr46y5amT4z6GT4KB
         KkpcNiQSVUfjhkM1xhjn64XVkWmmb9FfvTWdC/7KMjrGmy5TYLx4k5I1SE1u42SVzTQH
         iJ9G2A0qZydQhblGQh8x/wpgTHdHuQXwKbjIZppo+bVJnOlxHmQiz+vL994hQtxV+kQj
         yYQw==
X-Gm-Message-State: AOAM531KIkxO6rbHWrsGAZQscP58moj6LKsvgTaxUhSEbVWxElR7SdlZ
	/4/QTNkSnC886HYDJYafhGSpU4s8nSbkww==
X-Google-Smtp-Source: ABdhPJxQW8AOwkoeOWJO0+3W4E94KCU7VSyJyB4p1cb40HxvWMU2tCUP7Y0QFnbFVV8OzqccwvOJag==
X-Received: by 2002:a63:354c:: with SMTP id c73mr11136833pga.315.1604880150330;
        Sun, 08 Nov 2020 16:02:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 09/11] puzzles: Check for excessive constant arguments
Date: Sun,  8 Nov 2020 16:02:15 -0800
Message-Id: <20201109000217.3008448-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes an issue found with LTO builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Check-for-excessive-values-to-malloc.patch | 49 +++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch b/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
new file mode 100644
index 0000000000..66af6afa2f
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
@@ -0,0 +1,49 @@
+From 1c01a5bc9ac7f8aaa484b1a8e0e74aa5f8899d0e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 8 Nov 2020 11:17:59 -0800
+Subject: [PATCH] malloc: Check for excessive values to malloc
+
+with whole program optimizers like lto smalloc()
+is inlined the excessive constant argument is propagated to
+malloc() and ultimately triggers the warning.
+
+malloc.c:15:9: error: argument 1 range [18446744065119617024, 18446744073709551580] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
+
+therefore add a check before excessive constant argument before calling
+malloc
+
+Note that this will not happen with normal compile since they happen to
+be in different translation units and compiler can not semantically
+analyze as much
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ malloc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/malloc.c b/malloc.c
+index a7fa7c5..520377c 100644
+--- a/malloc.c
++++ b/malloc.c
+@@ -2,6 +2,7 @@
+  * malloc.c: safe wrappers around malloc, realloc, free, strdup
+  */
+ 
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include "puzzles.h"
+@@ -12,6 +13,8 @@
+  */
+ void *smalloc(size_t size) {
+     void *p;
++    if (size > PTRDIFF_MAX)
++	fatal("exceeds maximum object size");
+     p = malloc(size);
+     if (!p)
+ 	fatal("out of memory");
+-- 
+2.29.2
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index a0f3b5d9cd..8e4d5b3349 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
            file://fix-ki-uninitialized.patch \
+           file://0001-malloc-Check-for-excessive-values-to-malloc.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.29.2

