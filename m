Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E02CC83F34
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.5489.1752611786346301956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FNVaKKRW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dc5bcf49eso72634245ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611785; x=1753216585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDeYio8MvAyXkPMkOXDROXhSV8W6yRqoVpUbpGH+xMA=;
        b=FNVaKKRWC5ZXBQe9fKfjhlTjIUFWLXAXMBSggg6YJdQegL13fRa6oyqR1k4Vf7/J/m
         19hahMx8JrE/1BuhTsKlNV/kFCW0GAHniQ1VuTENUXET5l5BVYXh4xCYLbtPZX3hUKhQ
         4vF5KwW79frEYb20u3DrOJFEWAJaQt2gZEsdnOvUkvxv0E8ZVJCr4P9eNJyq9RTqn7rZ
         YIpGQmzGtkKpDt/EeKaw8ADpyo8ZOR4WI37P0oo/HIbw8pzsV2FhzOD3e4N31uPXFEG+
         z4HY4veJ9eVPeHg0mpqQfG8xhCCx51gOkeVuWJdpZo+opIBhXpZA4i8gO0ZWa1947Gvi
         nL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611785; x=1753216585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDeYio8MvAyXkPMkOXDROXhSV8W6yRqoVpUbpGH+xMA=;
        b=wjhYl3E24vIhgcaReow7ClnR+CglYgOkb8c/vEBtxgRFUuJVhwdqH+oxLTxPb+SJpw
         UWtdjSyWSO9dxwpvxrGayrZTFxRqLtE6l3/a0jp1kJTvGMR0yYQPr++7i6cJoO9aGL1k
         dwAO33DQLgenIZQk3s6JzEiJjUcbWLR+3F0+gGdYkRR9BPNtIqqoN6Uu9HrMnv23im4O
         6xLT8yIoqKwK4fV3X7/oBeEsaxNtgPYlIy3jUReIbQEXQiljJbKVL8FPtVUdW5Ri3mHY
         3laHlUUnZUoDhhcm8sLRfpvknE1k6D5pqeq2UmryX5s/UhtgNDn2kTEdCz2pM2wEIZyD
         y+8g==
X-Gm-Message-State: AOJu0YxNNoniDUY5vmtGodCFyTftQpb3uRzPWyR6uU4KX8bhOcgdaZny
	Y6Raut/mQgUZzEO4P2O3Thx25S7i6WjNgfea6z9Sx/zvY9WEjir07POZsEa47RbbP2/GBNNt1WC
	Dm1SW
X-Gm-Gg: ASbGnct12fH50VycD3B5ckZNN+5UYu5kHHKazq6Fqc8V4W2Rb1u+Xjj2+gliX7OH/JU
	o0u7JYjH2bc1JE9CDY1djas7Qv3RcJO7kJbhXVmakPx9a7R0+kfkiSrei2leMSUP9owBfrZ7xJX
	K1KMA/PCSasabTUilOZzAT9y006+A6EKN1SMitnslBqzBuvCaptr2rS+yfHwX40mDvvghMLeq9J
	gNnVOoSw6pcY/DHLIMdLrro18L86i6shjY8vAId7jy2rHFxx7qxChV5qCmbdtyPI10MtX1EIsMR
	/yc8VNsEUkv8OgEAONUY4kGS0dUwPMb5Q/bZ9+bN01EygRBe7z2CBAv/hA57JbKvzViFa8q/tX1
	s980evUTVUBFuCw==
X-Google-Smtp-Source: AGHT+IGIqepX65IKevSxdigBIM0uwDFBPt3aST0I2O9CyxA1tvKg7kK+6p23W/He5ZyZDP5mtgttgQ==
X-Received: by 2002:a17:903:3c6c:b0:236:8db5:7e50 with SMTP id d9443c01a7336-23e24ec0c69mr4885955ad.9.1752611785407;
        Tue, 15 Jul 2025 13:36:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/16] Revert "coreutils: fix CVE-2025-5278"
Date: Tue, 15 Jul 2025 13:36:02 -0700
Message-ID: <19502d089cbbdbbed9f53b85e01d86117388d6bf.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220410

Failing ptest with valgrind on target

This reverts commit 4e55668ef07d99d8c1141c2f4270f43f5b280159.
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 113 ------------------
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 -
 2 files changed, 114 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
deleted file mode 100644
index 34434a65fa..0000000000
--- a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 20 May 2025 16:03:44 +0100
-Subject: [PATCH] sort: fix buffer under-read (CWE-127)
-
-* src/sort.c (begfield): Check pointer adjustment
-to avoid Out-of-range pointer offset (CWE-823).
-(limfield): Likewise.
-* tests/sort/sort-field-limit.sh: Add a new test,
-which triggers with ASAN or Valgrind.
-* tests/local.mk: Reference the new test.
-* NEWS: Mention bug fix introduced in v7.2 (2009).
-Fixes https://bugs.gnu.org/78507
-
-CVE: CVE-2025-5278
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
-[Adjusted for 9.0 version]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/sort.c                     | 12 ++++++++++--
- tests/local.mk                 |  1 +
- tests/misc/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
- 3 files changed, 46 insertions(+), 2 deletions(-)
- create mode 100755 tests/misc/sort-field-limit.sh
-
-diff --git a/src/sort.c b/src/sort.c
-index 5f4c817de..07b96d34b 100644
---- a/src/sort.c
-+++ b/src/sort.c
-@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct keyfield const *key)
-       ++ptr;
- 
-   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
--  ptr = MIN (lim, ptr + schar);
-+  size_t remaining_bytes = lim - ptr;
-+  if (schar < remaining_bytes)
-+    ptr += schar;
-+  else
-+    ptr = lim;
- 
-   return ptr;
- }
-@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct keyfield const *key)
-           ++ptr;
- 
-       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
--      ptr = MIN (lim, ptr + echar);
-+      size_t remaining_bytes = lim - ptr;
-+      if (echar < remaining_bytes)
-+        ptr += echar;
-+      else
-+        ptr = lim;
-     }
- 
-   return ptr;
-diff --git a/tests/local.mk b/tests/local.mk
-index 228d0e368..ced85c44c 100644
---- a/tests/local.mk
-+++ b/tests/local.mk
-@@ -373,6 +373,7 @@ all_tests =					\
-   tests/misc/sort-debug-keys.sh			\
-   tests/misc/sort-debug-warn.sh			\
-   tests/misc/sort-discrim.sh			\
-+  tests/misc/sort-field-limit.sh		\
-   tests/misc/sort-files0-from.pl		\
-   tests/misc/sort-float.sh			\
-   tests/misc/sort-h-thousands-sep.sh		\
-diff --git a/tests/misc/sort-field-limit.sh b/tests/misc/sort-field-limit.sh
-new file mode 100755
-index 000000000..52d8e1d17
---- /dev/null
-+++ b/tests/misc/sort-field-limit.sh
-@@ -0,0 +1,35 @@
-+#!/bin/sh
-+# From 7.2-9.7, this would trigger an out of bounds mem read
-+
-+# Copyright (C) 2025 Free Software Foundation, Inc.
-+
-+# This program is free software: you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation, either version 3 of the License, or
-+# (at your option) any later version.
-+
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+
-+# You should have received a copy of the GNU General Public License
-+# along with this program.  If not, see <https://www.gnu.org/licenses/>.
-+
-+. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
-+print_ver_ sort
-+getlimits_
-+
-+# This issue triggers with valgrind or ASAN
-+valgrind --error-exitcode=1 sort --version 2>/dev/null &&
-+  VALGRIND='valgrind --error-exitcode=1'
-+
-+{ printf '%s\n' aa bb; } > in || framework_failure_
-+
-+_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
-+compare in out || fail=1
-+
-+_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
-+compare in out || fail=1
-+
-+Exit $fail
--- 
-2.34.1
-
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index 7c975708f4..1cce9192ec 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
-           file://CVE-2025-5278.patch \
            file://run-ptest \
            file://0001-split-do-not-shrink-hold-buffer.patch \
            "
-- 
2.43.0


