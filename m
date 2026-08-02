Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F6BC55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 21:30:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31046.1785706205637991203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 14:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IiIHf1rx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f6de72faso9494865e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 14:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785706204; x=1786311004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAEQPNX2R9RNRbgWE8cHEEH1wLvlKtNcQI5F51ysRiA=;
        b=IiIHf1rxg4hn98CQc2b6o62kSJGb2h3dJ79H7PZ19nvzswHGl4A1XvAKosZmXsK2hz
         bZn3GxZmPqR/9LKzOxOeQJVG7sGZTefM928A3pCSdNVU6+CuRm4TyZ8Wi5szcSaRv1dg
         FW5nGe+NypeZZ7bpeBUjYi5WaHlVO8B01F+Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785706204; x=1786311004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QAEQPNX2R9RNRbgWE8cHEEH1wLvlKtNcQI5F51ysRiA=;
        b=JoCQ9fSYEMhEs6tDCm73VP4gaTsSdQpTajCwJlz2R1KEUtIc0uWQUmKJSjtGnsGrpw
         5oeZWH/mm4KexsQBDF4cveUk4oNBcnyHlEzlXdb7cbctYq1gDNBHUgVgs0vJbX1gswT2
         5xaT3v1DmHcZLbUAKp1HZCgZ5cTk/wVt2HHCB7GTF+L7595CLrR3dZ2dy0+BN//BVlyF
         rtgdABJwtDCnrDBJ/+JoY+0oNWvpfeN8WA3TKS/7Qb/XWrPkqE2+H6iNxp9Zvs6/hYQu
         SKtFhxqcTh+LKmxvaUk7OBxkp1g94tfntIop+a34lHhMI2R52tNO2lvCUIgoDd1scHLM
         sAKA==
X-Gm-Message-State: AOJu0YzxANIlnOZd13VKFppzFsPv1AtfrHy3ujBfX7wgV9D9MxBd7LTr
	P8fZWWYoEkDzILo46Z+2Py8YQbdBnlbQxl5Tj8sJr3gxohVZRVENCFqmIR66nOnQVOww9UQdeRy
	iL+8HTCE=
X-Gm-Gg: AR+sD10ZwhbeZfdEZyBdkNunUE5VQtVIssL47cTjFbWHiLKJBpJc8BpskDuB7lIf+TK
	wSkesDd5P27w2oojRInwssDn9sD7YTLLGUtdkI/3XNWCW6egH7ARToGlZ4Rz1cIZYqNvc6ylvlo
	ihwG1iPY4olxY8Sy0iFH4oA9nO5ybvS3HUHGAACIsUZIimJM/6OL8/0VRiykIMzFjvLmtv2s6gP
	d8ai+LhIVY2Ro6Cf04PsTMYygSYTbeo3hJ14al25IkEl64izRWqgJmdFSk7fdiSV6ga6Irqm0kJ
	qVyHeUp/jRbufaaV48ANyQ6JTSlhuencliB7gmHZC1VTyhhNQNffQnRCxh/XxlA8TlnmtRQ5fx2
	V9UnFQo7cd/Qcl1Ke532x5uego+dFh3qn6/XKcyoeyTM/yGP1N1HlwxPMunJiB/cVoDZrYxH08Q
	vKKShgk05YucHHPirQS/kF3gusY8izC6U4EAZbzLsXuF5tSH9x4Y4Hj24JAe9Y636kr69Vy58E8
	JREsqr4tQm9x9WmIg==
X-Received: by 2002:a05:600c:4708:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-4980eb4e95dmr115428185e9.0.1785706203452;
        Sun, 02 Aug 2026 14:30:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm275720105e9.13.2026.08.02.14.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:30:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] coreutils: Backport a fix recommended by upstream
Date: Sun,  2 Aug 2026 22:29:59 +0100
Message-ID: <20260802213000.457180-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242588

Upstream suggested we may want this fix and other distros such
as SUSE are also adding it as it has caused problems for people.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...cb99d691d920961938e61c43478566ef626e.patch | 221 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.11.bb |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch b/meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch
new file mode 100644
index 00000000000..7d439f684ac
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch
@@ -0,0 +1,221 @@
+From 0d6fcb99d691d920961938e61c43478566ef626e Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Mon, 18 May 2026 20:40:28 -0700
+Subject: [PATCH] tee: fix infinite loop when write returns EAGAIN and short
+ write errors
+
+* NEWS: Mention the bug fixes.
+* THANKS.in: Add Bernhard M. Wiedemann for reporting the bugs.
+* src/iopoll.c (close_wait): Remove function.
+(write_wait): Don't call wait_for_nonblocking_write if write is
+successful. Handle errors more robustly.
+* src/iopoll.h (close_wait): Remove declaration.
+* src/tee.c (tee_files): Use close instead of close_wait.
+* tests/tee/short-write.sh: New test for the bug.
+* tests/tee/write-eagain.sh: Likewise.
+* tests/local.mk (all_tests): Add the new tests.
+Fixes https://bugs.gnu.org/81060
+---
+ NEWS                      |  7 +++++
+ THANKS.in                 |  1 +
+ src/iopoll.c              | 59 ++++++++++++++++++++++++---------------
+ src/iopoll.h              |  1 -
+ src/tee.c                 |  2 +-
+ tests/local.mk            |  2 ++
+ tests/tee/short-write.sh  | 33 ++++++++++++++++++++++
+ tests/tee/write-eagain.sh | 31 ++++++++++++++++++++
+ 8 files changed, 111 insertions(+), 25 deletions(-)
+ create mode 100755 tests/tee/short-write.sh
+ create mode 100755 tests/tee/write-eagain.sh
+
+Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/0d6fcb99d691d920961938e61c43478566ef626e.patch]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Index: coreutils-9.11/src/iopoll.c
+===================================================================
+--- coreutils-9.11.orig/src/iopoll.c
++++ coreutils-9.11/src/iopoll.c
+@@ -194,17 +194,6 @@ wait_for_nonblocking_write (int fd)
+   return true;
+ }
+ 
+-/* wrapper for close() that also waits for FD if non blocking.  */
+-
+-extern bool
+-close_wait (int fd)
+-{
+-  while (wait_for_nonblocking_write (fd))
+-    ;
+-  return close (fd) == 0;
+-}
+-
+-
+ /* wrapper for write() that also waits for FD if non blocking.  */
+ 
+ extern bool
+@@ -212,19 +201,43 @@ write_wait (int fd, void const *buffer,
+ {
+   unsigned char const *buf = buffer;
+ 
+-  while (true)
++  do
+     {
+-      ssize_t written = write (fd, buf, size);
+-      if (written < 0)
+-        written = 0;
+-
+-      size -= written;
+-      if (size <= 0)  /* everything written */
+-        return true;
+-
+-      if (! wait_for_nonblocking_write (fd))
+-        return false;
++      const ssize_t written = write (fd, buf, size);
++      /* POSIX says that calling write with SIZE of zero may detect and
++         return errors.  If no error occurs, or write makes no attempt
++         to detect errors, then write returns zero with no other
++         results.  write_fail will return successfully in this case.  */
++      if (written == 0)
++        {
++          if (size == 0)
++            return true;
++          else
++            {
++              /* If SIZE is greater than zero and write returns zero,
++                 treat it as an error.  Some buggy drivers behave this
++                 way.  See src/dd.c and Gnulib's lib/full-write.c for
++                 more details.  */
++              errno = ENOSPC;
++              return false;
++            }
++        }
+ 
+-      buf += written;
++      if (written < 0)
++        {
++          /* Return an error if write detected one with a SIZE of zero.
++             Otherwise, if SIZE is greater than zero, fail if it does
++             not become writable.  */
++          if (size == 0 || ! wait_for_nonblocking_write (fd))
++            return false;
++        }
++      else
++        {
++          buf += written;
++          size -= written;
++        }
+     }
++  while (0 < size);
++
++  return true;
+ }
+Index: coreutils-9.11/src/iopoll.h
+===================================================================
+--- coreutils-9.11.orig/src/iopoll.h
++++ coreutils-9.11/src/iopoll.h
+@@ -5,5 +5,4 @@ int iopoll (int fdin, int fdout, bool bl
+ bool iopoll_input_ok (int fdin);
+ bool iopoll_output_ok (int fdout);
+ 
+-bool close_wait (int fd);
+ bool write_wait (int fd, void const *buffer, size_t size);
+Index: coreutils-9.11/src/tee.c
+===================================================================
+--- coreutils-9.11.orig/src/tee.c
++++ coreutils-9.11/src/tee.c
+@@ -329,7 +329,7 @@ tee_files (int nfiles, char **files, boo
+ 
+   /* Close the files, but not standard output.  */
+   for (int i = 1; i <= nfiles; i++)
+-    if (0 <= descriptors[i] && ! close_wait (descriptors[i]))
++    if (0 <= descriptors[i] && close (descriptors[i]) < 0)
+       {
+         error (0, errno, "%s", quotef (files[i]));
+         ok = false;
+Index: coreutils-9.11/tests/local.mk
+===================================================================
+--- coreutils-9.11.orig/tests/local.mk
++++ coreutils-9.11/tests/local.mk
+@@ -485,7 +485,9 @@ all_tests =					\
+   tests/tac/tac-2-nonseekable.sh		\
+   tests/tail/tail.pl				\
+   tests/tee/append.sh				\
++  tests/tee/short-write.sh			\
+   tests/tee/tee.sh				\
++  tests/tee/write-eagain.sh			\
+   tests/test/test-N.sh				\
+   tests/test/test-diag.pl			\
+   tests/test/test-file.sh			\
+Index: coreutils-9.11/tests/tee/short-write.sh
+===================================================================
+--- /dev/null
++++ coreutils-9.11/tests/tee/short-write.sh
+@@ -0,0 +1,33 @@
++#!/bin/sh
++# Test 'tee' when a write is short.
++
++# Copyright (C) 2026 Free Software Foundation, Inc.
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
++print_ver_ tee
++require_strace_ write
++
++printf 'abcdef' >file1-exp || framework_failure_
++printf 'f' >out-exp || framework_failure_
++
++# In coreutils-9.11, a short write would be treated as an error.
++strace -qqq -o /dev/null --trace-fds=1 -e trace=write \
++  -e inject=write:retval=1:when=1..5 tee file1 >out 2>err <file1-exp || fail=1
++compare file1-exp file1 || fail=1
++compare out-exp out || fail=1
++compare /dev/null err || fail=1
++
++Exit $fail
+Index: coreutils-9.11/tests/tee/write-eagain.sh
+===================================================================
+--- /dev/null
++++ coreutils-9.11/tests/tee/write-eagain.sh
+@@ -0,0 +1,31 @@
++#!/bin/sh
++# Test 'tee' when a write fails with errno set to EAGAIN.
++
++# Copyright (C) 2026 Free Software Foundation, Inc.
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
++print_ver_ tee
++require_strace_ write
++
++# In coreutils-9.11 the following test would infinite loop.
++echo a >exp || framework_failure_
++timeout 10 strace -qqq -o /dev/null -e trace-fds=3 \
++  -e inject=write:error=EAGAIN:when=1 tee file1 <exp >out 2>err || fail=1
++compare exp file1 || fail=1
++compare exp out || fail=1
++compare /dev/null err || fail=1
++
++Exit $fail
diff --git a/meta/recipes-core/coreutils/coreutils_9.11.bb b/meta/recipes-core/coreutils/coreutils_9.11.bb
index 63f7810e883..bbef3263994 100644
--- a/meta/recipes-core/coreutils/coreutils_9.11.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.11.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://run-ptest \
            file://CVE-2026-56391.patch \
            file://CVE-2026-56392.patch \
+           file://0d6fcb99d691d920961938e61c43478566ef626e.patch \
            "
 SRC_URI[sha256sum] = "394024eda0a5955217ceda9cd1201e65dc8fa3aa29c2951135a49521d57c3cc3"
 

