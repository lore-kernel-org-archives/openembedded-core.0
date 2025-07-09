Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0C0C83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:35 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.18419.1752074365265137169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0O/1cJcg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so61057a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074364; x=1752679164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NfiUGgjFCLjSW2ysKVHYiOZJsNfXeA3HQhosmrULZo=;
        b=0O/1cJcgdNO/DWdNCw11+PoAdmngj8qxvkPAiSg1EScEmc0AGP9KzimuvewzSoLAeW
         pEOIghFUJAdpwCus5Esau5pbepgIIOj6xW525mesguFGZNkWHYzIVMwd8W2Hi+rjY1gP
         NU4kyUIH2u0XT6w7qTov0ncENeVoE3NMLk27X/tcl19r78PYUNihoss0wWujrOyh2VTb
         ocsMOOy1BWVtLnFpW4a9fY3THATB74PvVfBWLgQ8ZaWIRIcfTt+TuGU9tDaIHN3ro9Jp
         fi+r0rDAbUGqd4pxyK3ONtSX/o3c8NwsV2ZY1haiCvz7fN2pgHohaGRi7MkBLKm2py2c
         1DHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074364; x=1752679164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NfiUGgjFCLjSW2ysKVHYiOZJsNfXeA3HQhosmrULZo=;
        b=iGIrvWIPhbbCY5WWRVThDYiVgeORhcQGQqNzg9dWFyMxWV6rOgiJ6sHRm9QS7SXelD
         OLs4Cl/0PoeFiuu5gfrVTo2p/Wa0IryOM5DNhXFho0k/zI0MPwNgzjgb3MskoLvxdggr
         kev5QI9yA8b7x8SC4ndTyr29M57fNYgGKDUCOAWJJoiuXNnTGXKCfueknudr4MNfS7oF
         fW5bdLk7dRU+DySCEYAJX9Rae+ttKi9H3apcu+9aCq0NBm2IaBIMeyP1cOTclCNOmO8T
         EylyNpaLqvxNdnNm1W60zaDtQq8K+uvCZXC9X0kw8VLeE6z04guWqffa7yu9fDszKDjT
         ucNA==
X-Gm-Message-State: AOJu0Yx5appBDjBs0GRUH5GuASfaTN08QigRGIUZAtG10uV48a73xcY+
	z7JwpYJEdbKQZk+sLeMzoCMI5kv9BZXRwJvv3AvC4KkIp+5TI06tJH5KtXzBloIniz4NWB701Hd
	AtdHz
X-Gm-Gg: ASbGncs8JFL8CMZ3vjcAg49gp1RT65BHCj2EKv0AgA1mWvGnq6budsQFA96Uq8fRyy1
	pfyGzcAziiQfPl0kwd3CEzu7qG1WvwryBsXRSNAX+0nORpQOIt+JH4YSxLPtrtVX6MyfMqPf8ek
	Dbeq7Ks1sh/xFIlT8txhDBuzi6k7HutGS4vZM9463Ufs+wYvG7IthaT2HXE2G/vN6SaiWysEjT9
	Y4ANgy07dT7syINJ3RY6O+y+2xRBtHUEQczOtmGAoFQg1NmYAo1aKyP6K46f34AieZjSYMEsNwX
	03n1rp7V13mZK3fKlCLqbCJrp185e6uyWn3GCrFIs/JM1bq0JfKSJw==
X-Google-Smtp-Source: AGHT+IFtgRYGMU4Zy9m0j7A7J+00/+ZIcmD099mblAEN5vIpYG2TSsYO89gPbYg/DZJ61z62NWWnvA==
X-Received: by 2002:a17:90b:3c87:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-31c2fdd15d0mr5531450a91.24.1752074364184;
        Wed, 09 Jul 2025 08:19:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/11] coreutils: fix CVE-2025-5278
Date: Wed,  9 Jul 2025 08:19:06 -0700
Message-ID: <4e55668ef07d99d8c1141c2f4270f43f5b280159.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220094

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.
The patch is adjusted to fit 9.0 version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 113 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
new file mode 100644
index 0000000000..34434a65fa
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
@@ -0,0 +1,113 @@
+From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 2001
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
+[Adjusted for 9.0 version]
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
+index 000000000..52d8e1d17
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


