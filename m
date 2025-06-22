Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC43C77B7F
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 13:37:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.26369.1750599468828068524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 06:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c9Pgp1TF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74931666cbcso506120b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750599468; x=1751204268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AMIgVpFCdDgFKe7u7uctXLWU+t+g/ep4Kt3OPwD4dA=;
        b=c9Pgp1TFuUHFC5z9aumJzuPHq0J2Tdvwf1+XhKGkZSwad9IGesn7ezC0FCCJ1uRRLZ
         Dl/MPQmJT3wEXvBlJGM0IbiYmNIaZZHPWuJTkrtvS7zqnsuEYbqG23cuakaGY6w7o1SJ
         0W8iSwVugRSpzb8TQKtoDz0QbbKQUZrvpw2SaeHAkcXfGcAhIRFQCJWHGb5fQDBRi1+p
         D/fM0VjQbWMeFoHi+xsT0ykmBxpQF5u/hKz6Sn8lX52qbAXF6MkkiiR2uiXHBejknTEl
         MSYkfwGIo3EE9pyzAjMGuNOcMibX2pCcheY1QU3w+BmMX8oZLcS/G0zEoBp5/RY8T0Ij
         FuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599468; x=1751204268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AMIgVpFCdDgFKe7u7uctXLWU+t+g/ep4Kt3OPwD4dA=;
        b=DQF9HQPHTQKZHD0M6Ec85JpiOnzpfFbjuDQ05FgLaXOVR1KAsvFk991Fg5EyQqFmmI
         nC8xfcPQezC5u2qyj70wMBxKzlCCdc8UzjC+jyXGkYKdTl6A1DzFalx3p+EPdk/d+odQ
         ymZhCYmd2aK0r/xXuFmpbL2IgbDgzRJ/GpsinYDevLWc5I0pg1PNQjbyjcmbTsiE0Rf+
         tpBshn10se+ODCDBq/m8m86qASgKelBkIkVJ8qrE8l2O7o6r8Uypn5O4kn2Z1ZlWlf62
         s0sNXiHOhWUFYvV+4XGPHtqcbprLzHze7HtprongDDdH6q0VxWAZd0LCqUY489OufWXT
         q3cA==
X-Gm-Message-State: AOJu0Yz3o7I9zUsFCGDc9k4pZ4R+zIU9REhI8d84pc4+QinTDY6F64F4
	ZC1oJw/+AmvmWiZTrLc3y/zxcXCbJLF6O+TQLlxZwdX2SFKU8104IxFf0mJnRnjWLlJTc4GY6uf
	inLxWrwQ=
X-Gm-Gg: ASbGncsuha+boKVG6pDp7uwCLINgPBfxjpMi+ns4G+5KZBVLmy8AaRAgfzv7naTXIeY
	tBGxn5OfTtnO6RYCcgZxcYSHqAD8gQXWD0WvKA8ktpUXDbQnNjhG4ZhoIvwFHJVpPfDedtmpyqM
	vUmf6r8G+xCCwkynUfYh+RfNK5+bod/c3pHxoDU4FP3Rs73Jt6kQbjyfOAxXxdwQWqMHbcTeTIp
	eSXkw3Zk1146E+ssFccz7RjV4E78oF29+uzL3YC2EMMreLmdVFuFnSRExrscPFEbGm1zdLk8VN3
	ub8v/YjqD4Tq14nCHT1E9CXIJgd9zHKgRsKRcai+gUmVNWaInxpM8Q==
X-Google-Smtp-Source: AGHT+IGzYZmDIcUM2Gu48Gtzemlo9d2SyiC8cmo9WJr+GG03sIF04z71bE38TOEsymIo22UD+jBhog==
X-Received: by 2002:a05:6a00:a87:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-7490d6044e5mr12397320b3a.12.1750599468020;
        Sun, 22 Jun 2025 06:37:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a72afsm5960189b3a.163.2025.06.22.06.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:37:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/4] coreutils: fix CVE-2025-5278
Date: Sun, 22 Jun 2025 06:37:30 -0700
Message-ID: <7af711c0a31359b57903503ab37bad53aad89c22.1750599311.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750599311.git.steve@sakoman.com>
References: <cover.1750599311.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 13:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219176

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 112 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.4.bb  |   1 +
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
diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index 62ecdea6ec..caed1f8c49 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://0001-posixtm-pacify-clang-18.patch \
            file://CVE-2024-0684.patch \
+           file://CVE-2025-5278.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
-- 
2.43.0


