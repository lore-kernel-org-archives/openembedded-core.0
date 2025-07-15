Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F30C83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.5339.1752611787882715313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=egiOYn7p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2349f096605so75037325ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611787; x=1753216587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jE1lOu62qCDDMy9zGmUnVRWYmP2FbWv3cNBVk7R5ZWY=;
        b=egiOYn7pcfWgJrfAUd+MJPz2X+LNtAAbcdU/T8K4wqjpYTE2oix9ws7W4r22wUnerI
         MUCHl6+k0wOr3+Yvwp6aDEGv01j7yQHmJHyyOtGKnbNOczh0tOXK6O4605XoSQCvAOs9
         Z+wFDj12+y30V+BYl57l8p+qDT9uQBhupqUDZluLCCat4fSkEFk9D2CYeQKUb8d3QZMB
         t0Fh8wfZtXj3u/SlCxdzeySM6iX24PoYrptskvRS5DisHMRvLry16LB8ASAvA4OSnttl
         nbWzMt87LvPe8ey0qKf0Auxq5YRz0ia+tCm9ZUyBBq/AF4QHBETrcktKEJNu0ESIlJR4
         K8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611787; x=1753216587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jE1lOu62qCDDMy9zGmUnVRWYmP2FbWv3cNBVk7R5ZWY=;
        b=Y6P4v7sUDdr47Kh9Re3Co07TekZymEFYCOgxbZwv2pgGM+ykSyQh/+Pjq2dNC5IxPS
         /hUSiRPEMf6oD70Tc3KyWIDvlR6IDm2z73GVLQs89L5Ba1iYtsHEuxyNj2CMY49xeVQ1
         Vtu9uXz2pHf0wFsabEIo3L3PyQ07mSryY656BGeULU9A2zbXVfijpp1y9wXXAEddZKRw
         gb/sd6dGG6AV3SswKjs9/yzyW6TySXDItHNRtj52Z8QdvPrGnJscREMyfVUS8svAmIDe
         Qpz5GOKTkSQtYH5t0pE123UDusVE2kMbtvdNQxwr4nE10MxSWkapYxBgM6lcBtjO2PJ+
         dpEQ==
X-Gm-Message-State: AOJu0Yy10iNjPIG2fBA5nUmRJoZHhzN8eu3mxhmZAPRUigpK0qegZ/9b
	f2iExwm1ZUD/zxOcz1p7wHYWf6ZJJ8UmC+IwgLyMzHweDczIngpPyZlxH3rZAcEvsYTIexFcDVj
	7oNB3
X-Gm-Gg: ASbGncuxvNp3uFk9cmH4tMhjLfM4d8IqTjKjACFnpCoJx7bYHHRp2hRzZMPtPI+pYX0
	ITCemhpREKYWyFjifn9IvaCL7sWe9JGQs3/Vkdye71n61yxzSHjrKw3C3yWM2jFmNQQy8zqa4VW
	NJDCyQXf+GVbHPthvW6lu3bXZoyYImqwLM8ZsXFDhQ2uFSD55tYg+pMQhHb+cmPsicBe3VIsi4Q
	NinKS9XSU2unB9C+5h/ySOczQihX58V1M6j0xYwBUB0ocN/DorZIqCQEPeT1I8k/fIs567JovP0
	p71J53ln+iPauaVVeHe33nKjjjz3d+CJiKsG8VKIZipR8M3gChUK2206F/nDpKNbSGTjtZ1AnEI
	lMyDVyuPLIK9rcg==
X-Google-Smtp-Source: AGHT+IFpsqoFUSHoW0w8JkSMVsoGXQHZgrbKj66fdw6kQj0d++X0YeUhb6zQCctLvLieaO1P6j3LoQ==
X-Received: by 2002:a17:903:1b6c:b0:234:8ec1:4aea with SMTP id d9443c01a7336-23e2579eed1mr1550525ad.52.1752611787042;
        Tue, 15 Jul 2025 13:36:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] coreutils: fix CVE-2025-5278
Date: Tue, 15 Jul 2025 13:36:03 -0700
Message-ID: <bb7dbb195b55d9aaa0180906843f5af2dcf7509f.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220411

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.
The patch is adjusted to fit 9.0 version. And the test case is
also adjusted to avoid using valgrind. valgrind in kirkstone is
reporting errors for coreutils' sort utility with/without this patch.
To avoid ptest failure, we disable valgrind explicitly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 113 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
new file mode 100644
index 0000000000..2f262ea0b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
@@ -0,0 +1,113 @@
+From ed9ae6a4a02d322378739a895ae2090ca2bf6cdc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 20 May 2025 16:03:44 +0100
+Subject: [PATCH] sort: fix buffer under-read (CWE-127)
+
+* src/sort.c (begfield): Check pointer adjustment
+to avoid Out-of-range pointer offset (CWE-823).
+(limfield): Likewise.
+* tests/sort/sort-field-limit.sh: Add a new test,
+which triggers with ASAN or Valgrind.
+* tests/local.mk: Reference the new test.
+* NEWS: Mention bug fix introduced in v7.2 (2009).
+Fixes https://bugs.gnu.org/78507
+
+CVE: CVE-2025-5278
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
+[Adjusted for 9.0 version and adjusted test case to not use valgrind.]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/misc/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/misc/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index 5f4c817de..07b96d34b 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct keyfield const *key)
+       ++ptr;
+ 
+   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
+-  ptr = MIN (lim, ptr + schar);
++  size_t remaining_bytes = lim - ptr;
++  if (schar < remaining_bytes)
++    ptr += schar;
++  else
++    ptr = lim;
+ 
+   return ptr;
+ }
+@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct keyfield const *key)
+           ++ptr;
+ 
+       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
+-      ptr = MIN (lim, ptr + echar);
++      size_t remaining_bytes = lim - ptr;
++      if (echar < remaining_bytes)
++        ptr += echar;
++      else
++        ptr = lim;
+     }
+ 
+   return ptr;
+diff --git a/tests/local.mk b/tests/local.mk
+index 228d0e368..ced85c44c 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -373,6 +373,7 @@ all_tests =					\
+   tests/misc/sort-debug-keys.sh			\
+   tests/misc/sort-debug-warn.sh			\
+   tests/misc/sort-discrim.sh			\
++  tests/misc/sort-field-limit.sh		\
+   tests/misc/sort-files0-from.pl		\
+   tests/misc/sort-float.sh			\
+   tests/misc/sort-h-thousands-sep.sh		\
+diff --git a/tests/misc/sort-field-limit.sh b/tests/misc/sort-field-limit.sh
+new file mode 100755
+index 000000000..dc5b4c964
+--- /dev/null
++++ b/tests/misc/sort-field-limit.sh
+@@ -0,0 +1,35 @@
++#!/bin/sh
++# From 7.2-9.7, this would trigger an out of bounds mem read
++
++# Copyright (C) 2025 Free Software Foundation, Inc.
++
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
++print_ver_ sort
++getlimits_
++
++# This issue triggers with valgrind or ASAN
++valgrind --error-exitcode=1 sort --version 2>/dev/null &&
++  VALGRIND='valgrind --error-exitcode=1'
++
++{ printf '%s\n' aa bb; } > in || framework_failure_
++
++_POSIX2_VERSION=200809 sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index 1cce9192ec..7c975708f4 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
+           file://CVE-2025-5278.patch \
            file://run-ptest \
            file://0001-split-do-not-shrink-hold-buffer.patch \
            "
-- 
2.43.0


