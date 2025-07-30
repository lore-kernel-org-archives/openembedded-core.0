Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB70C87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:44 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.46726.1753909715754407694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bB7xW6aT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76b77a97a04so254093b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909715; x=1754514515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGgcG1Bw0MvRyse5p2H1oXwKh090JjwjpoOo5LQxWZ0=;
        b=bB7xW6aTfKwRiKLxoiGD1dhA/SXNUAHDiwvMFnDtoYpYNokhVmgeTZmhRSZ03eFdvW
         MO1/zSOjq7NsTOY4h/+Oxq8KDcVzKiZeJQd7h1TYv0LcbuQW9GeHMajrfaV8Q+p5Y4QI
         ktM8y5n6VWGHgSpubrBe4zgpqCRNQo9zYb6rBdqTdRmsDAaoK07y/DGGZLVUMMuxNCum
         IBoUOUi9RyqZX4KwZ1d56gPy0V45Dq93dUBYqb4amer+cH4SFzHPXST+g12yb3kaqytT
         PlnODK/W0fktT9RHlUUYwlkoVbvmgEkh9fyaUEetzN1JG8q/e3uj+jNXSJMHFBYyAcSj
         xP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909715; x=1754514515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGgcG1Bw0MvRyse5p2H1oXwKh090JjwjpoOo5LQxWZ0=;
        b=xD1jGXO2/CeJuWLK3QRj7L0yh7fYPZDyMV5DxJAV+sQ9Fti92grspUPM47qpfQi6s/
         h8bVw7w2aNoz72u3VRTXrasq6d1Rv9sKDKzHy+vLRqrJi2c+xgAybIkTIjl/j8EdetVy
         JJWalaxfPrMC1fWXoZBUPLFlTUuE3QnBIyW8GPsdt71rZL9CHRJWrXkyNWtPzpZw/e3I
         a8YBptrcUQkixV3Kl+SAAhC/Zw6hFGOh5w1A6JYsf4HlApf2NIWLoepJFcc3A0zyQLZ5
         0GHve7xzCcTJ4dauAiZUOI2MfvdJ/bYiARu12z4n3GjNEAby7WPCzZmu77eEiNfpOeB7
         qePA==
X-Gm-Message-State: AOJu0YzINMewCon+vvyr3frpWL/MDD9gqGMHOjuRMbdJgRDifiDou29P
	dv2AUbRAS8JdAMMm7Yj6HGr3IMBxNxqOuqni3pT4RtqLgw6/TO9GxZcEICrYhdDd2QbYH3TbonO
	H/3tN
X-Gm-Gg: ASbGncuXboxtqAgnJmMOWsaCZrqBhTqoXrR/ttgJfWbk0gkWPak2N2BlpEx9xUdKxJM
	DsSMnIzaIzxfpKqRkpoSwagR7BdgGWyrIbDUrD4rapQAs66ky/b5fVaKFhZQscbp9MbCP49i+Le
	u2Vq+DiBpXcq2GzbS77OicgKqeLUHfW3sCCaTHQ6HbC61tMd7nIZeT0HCkeE1ZvU6OfgDpYhxcr
	JacEjaO530uVHXjxpgVs+Ft7zqyzZJ1BbCyvSer5eWv6b6wde0Qsmjrkd5J6wqjmdECf9xzjGuw
	+SxcOxm+M+Ws3VwTly3ilfWX8mHjQcs9EIglsW3LDo+a/PIuu2MzNhsnu0pYiK4CYlATSpJeO1X
	/IN1CQRO1W03J
X-Google-Smtp-Source: AGHT+IFh8UZCf1lMM0AB5Pl5QyhxlYjlEx54LD614psHxxU9tJBBvIc/xm98REQqJdqUTr/h/Jfdsw==
X-Received: by 2002:a05:6a00:4601:b0:75e:bd57:59c4 with SMTP id d2e1a72fcca58-76ab101f18fmr6526327b3a.9.1753909714951;
        Wed, 30 Jul 2025 14:08:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/8] coreutils: fix CVE-2025-5278
Date: Wed, 30 Jul 2025 14:08:21 -0700
Message-ID: <239cadfd4642e7f7ad4c76df2eb70f16021c3164.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221152

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 112 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.6.bb  |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
new file mode 100644
index 0000000000..41be1635b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
@@ -0,0 +1,112 @@
+From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
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
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/sort/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index b10183b6f..7af1a2512 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfield const *key)
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
+@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfield const *key)
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
+index 4da6756ac..642d225fa 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -388,6 +388,7 @@ all_tests =					\
+   tests/sort/sort-debug-keys.sh			\
+   tests/sort/sort-debug-warn.sh			\
+   tests/sort/sort-discrim.sh			\
++  tests/sort/sort-field-limit.sh		\
+   tests/sort/sort-files0-from.pl		\
+   tests/sort/sort-float.sh			\
+   tests/sort/sort-h-thousands-sep.sh		\
+diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limit.sh
+new file mode 100755
+index 000000000..52d8e1d17
+--- /dev/null
++++ b/tests/sort/sort-field-limit.sh
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
++_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index b876a8fdd0..34c6246ed3 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://intermittent-testfailure.patch \
            file://0001-ls-fix-crash-with-context.patch \
            file://0001-cksum-port-to-32-bit-uint_fast32_t.patch \
+           file://CVE-2025-5278.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283"
-- 
2.43.0


