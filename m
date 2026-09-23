Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30177C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:07:00 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7898.1790172411992128072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o9oBEW/Y;
 spf=pass (domain: konsulko.com, ip: 74.125.225.140, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so4842395e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790172410; x=1790777210; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLi0rsNPniUxP8lT4XCuXkUZ6xDSymgg9OPHg/oL7B4=;
        b=o9oBEW/YlMG0d5MqOljqL82C1dSCHvMgmhKQ/84PV8qaqo8kWnzSFYLl7gyywgviZe
         0NEFDuX29cxJT3AjwV49MLDAAFZh0I7JDoUrqIXzpDVwbuoWUtUmQKGrsHbg1zVoQ9WZ
         LnYq4xLJsaSAYRKPIHxuh9J9LZFdStgfajAjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172410; x=1790777210;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLi0rsNPniUxP8lT4XCuXkUZ6xDSymgg9OPHg/oL7B4=;
        b=uCZx5e09RgeJWzRu8SWLjmz9/3UkR11xy3u2s1A1a0PNWcRxPDSdWj/YE2a0xk6eeg
         laXM3cnzsZps38pd1u+QddPkjOpimdTWpEbYjjLOIyISUpxFBbIoLnz7XCgs/4aLRhZh
         gqye3H2UAr5pPSv3vcWnefhYofC3/W9ykZeh38gZcB339FG+wpZ43L2mscw8YQwafbJd
         /7s6Mic+1nSmV9GynD7Gur3v6uGLIOPTdOH9OKe+rvXyEO/NR+uqYHjs8NShl+bY0+jj
         DgHR9a8oEkucK0hpo0wcPL3k8CMwXzupla696C7c1p5ElzjixYiXCfvb9YouoHES50QZ
         Hymg==
X-Gm-Message-State: AFuF++mqrCorTWDMKDWSwaBBDiOXq0+5n1Y5bKWzpyfvn1uyEJftm6bd
	i64LNRBUZ+vUozFJDCgzvLPhFKYB2F6kcYq1fRfecKb4wsjMPMCIPjdOTL1B2VX0pKCe8W5SJjW
	3ONQZ
X-Gm-Gg: AYBFou3ey40sQ7HXBndEl3J/SXRG2fjONwwOpqYGj1D9mBv6TETFST+oxXVcPxKtRQS
	gcaOcVo7hZBsPWuhwW8hcrtkXXbyHRDEway/m1O9wQ3IyHe9vjNLcO28ICx9GAGyZ/hKBYE6M3a
	sAeuY5uqTOUESiGE5DrZghi5IrLsKkNXJ1ppD7p21itNBfNVifUN2V9rU2XTWEDEX2IZ4hmZCV7
	St2z6+Zv/8awTB5ElH5qbrc1qZ52j5tpUVAlJeQ3saox6DVMmuswPAmOwKjbWoHcaG+7f1nnoNf
	r5oZVRjvTdlEki6XebbAVtfyLqUXENqz7DzQbDlpuqKhfRxf+CxoxGfHmQvzAEAAULNKak3RZf5
	QW8mb3O9azwpETvEciqjAXxrCMSLn9swIXTdZfOjjT3GhGZ8x42EdvYpExJjyLRY18Pdr7amJRe
	e3KYO+WvJhwfsKiwBId3/nBhzrG+oAbuVFVK7RyhdS9Gu1AKngFc3356ena2zwZ8JdThsRPYkwS
	cmMCh1FFoXWL51M54J5KvkUw0LkVQKNC/jFH7nzToHwVkpy3rueCt7S43PBsOOTFcBCcBFiUxCt
	so29Z28mQ4i4sDqdKi+zwTkvcIFP35vzwFU=
X-Received: by 2002:a05:600c:4712:b0:49f:db7d:856 with SMTP id 5b1f17b1804b1-49fdf34b131mr38326315e9.33.1790172409961;
        Wed, 23 Sep 2026 07:06:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde13096csm88851145e9.0.2026.09.23.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:06:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] coreutils: Upgrade 9.11 -> 9.12
Date: Wed, 23 Sep 2026 17:06:43 +0300
Message-ID: <20260923140645.3200743-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246521

Upgrade to release 9.12. Drop backported patches that are now part
of this release. Notable changes include:

- env supports a new --env0-from=FILE option to support
  full persistence and restoration of the environment.
  This also supports e.g. filtering like:
    env -i --env0-from=<( env -0 | sed -z ... )

- Commands now have safer terminal output,
  avoiding confusing output or corrupted terminal state.

- Commands that traverse directories no longer
  fail merely if files are being removed in parallel.

- ptx has improved robustness, avoiding potential infinite loops.

- tee fixes robustness issues introduced in the previous release,
  where it could go into an infinite loop or incorrectly error
  in the presence of short writes.

- stty is more accepting of variations in requested speed.

- sort(1) will now better use available memory
  and parallel operation when reading from pipes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cb99d691d920961938e61c43478566ef626e.patch | 223 ------------------
 .../coreutils/coreutils/CVE-2026-56391.patch  |  66 ------
 .../coreutils/coreutils/CVE-2026-56392.patch  |  65 -----
 .../{coreutils_9.11.bb => coreutils_9.12.bb}  |   5 +-
 4 files changed, 1 insertion(+), 358 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch
 rename meta/recipes-core/coreutils/{coreutils_9.11.bb => coreutils_9.12.bb} (97%)

diff --git a/meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch b/meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch
deleted file mode 100644
index 245bdc67a9..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0d6fcb99d691d920961938e61c43478566ef626e.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From 0d6fcb99d691d920961938e61c43478566ef626e Mon Sep 17 00:00:00 2001
-From: Collin Funk <collin.funk1@gmail.com>
-Date: Mon, 18 May 2026 20:40:28 -0700
-Subject: [PATCH] tee: fix infinite loop when write returns EAGAIN and short
- write errors
-
-* NEWS: Mention the bug fixes.
-* THANKS.in: Add Bernhard M. Wiedemann for reporting the bugs.
-* src/iopoll.c (close_wait): Remove function.
-(write_wait): Don't call wait_for_nonblocking_write if write is
-successful. Handle errors more robustly.
-* src/iopoll.h (close_wait): Remove declaration.
-* src/tee.c (tee_files): Use close instead of close_wait.
-* tests/tee/short-write.sh: New test for the bug.
-* tests/tee/write-eagain.sh: Likewise.
-* tests/local.mk (all_tests): Add the new tests.
-Fixes https://bugs.gnu.org/81060
-
-Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/0d6fcb99d691d920961938e61c43478566ef626e.patch]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
----
- NEWS                      |  7 +++++
- THANKS.in                 |  1 +
- src/iopoll.c              | 59 ++++++++++++++++++++++++---------------
- src/iopoll.h              |  1 -
- src/tee.c                 |  2 +-
- tests/local.mk            |  2 ++
- tests/tee/short-write.sh  | 33 ++++++++++++++++++++++
- tests/tee/write-eagain.sh | 31 ++++++++++++++++++++
- 8 files changed, 111 insertions(+), 25 deletions(-)
- create mode 100755 tests/tee/short-write.sh
- create mode 100755 tests/tee/write-eagain.sh
-
-Index: coreutils-9.11/src/iopoll.c
-===================================================================
---- coreutils-9.11.orig/src/iopoll.c
-+++ coreutils-9.11/src/iopoll.c
-@@ -194,17 +194,6 @@ wait_for_nonblocking_write (int fd)
-   return true;
- }
- 
--/* wrapper for close() that also waits for FD if non blocking.  */
--
--extern bool
--close_wait (int fd)
--{
--  while (wait_for_nonblocking_write (fd))
--    ;
--  return close (fd) == 0;
--}
--
--
- /* wrapper for write() that also waits for FD if non blocking.  */
- 
- extern bool
-@@ -212,19 +201,43 @@ write_wait (int fd, void const *buffer,
- {
-   unsigned char const *buf = buffer;
- 
--  while (true)
-+  do
-     {
--      ssize_t written = write (fd, buf, size);
--      if (written < 0)
--        written = 0;
--
--      size -= written;
--      if (size <= 0)  /* everything written */
--        return true;
--
--      if (! wait_for_nonblocking_write (fd))
--        return false;
-+      const ssize_t written = write (fd, buf, size);
-+      /* POSIX says that calling write with SIZE of zero may detect and
-+         return errors.  If no error occurs, or write makes no attempt
-+         to detect errors, then write returns zero with no other
-+         results.  write_fail will return successfully in this case.  */
-+      if (written == 0)
-+        {
-+          if (size == 0)
-+            return true;
-+          else
-+            {
-+              /* If SIZE is greater than zero and write returns zero,
-+                 treat it as an error.  Some buggy drivers behave this
-+                 way.  See src/dd.c and Gnulib's lib/full-write.c for
-+                 more details.  */
-+              errno = ENOSPC;
-+              return false;
-+            }
-+        }
- 
--      buf += written;
-+      if (written < 0)
-+        {
-+          /* Return an error if write detected one with a SIZE of zero.
-+             Otherwise, if SIZE is greater than zero, fail if it does
-+             not become writable.  */
-+          if (size == 0 || ! wait_for_nonblocking_write (fd))
-+            return false;
-+        }
-+      else
-+        {
-+          buf += written;
-+          size -= written;
-+        }
-     }
-+  while (0 < size);
-+
-+  return true;
- }
-Index: coreutils-9.11/src/iopoll.h
-===================================================================
---- coreutils-9.11.orig/src/iopoll.h
-+++ coreutils-9.11/src/iopoll.h
-@@ -5,5 +5,4 @@ int iopoll (int fdin, int fdout, bool bl
- bool iopoll_input_ok (int fdin);
- bool iopoll_output_ok (int fdout);
- 
--bool close_wait (int fd);
- bool write_wait (int fd, void const *buffer, size_t size);
-Index: coreutils-9.11/src/tee.c
-===================================================================
---- coreutils-9.11.orig/src/tee.c
-+++ coreutils-9.11/src/tee.c
-@@ -329,7 +329,7 @@ tee_files (int nfiles, char **files, boo
- 
-   /* Close the files, but not standard output.  */
-   for (int i = 1; i <= nfiles; i++)
--    if (0 <= descriptors[i] && ! close_wait (descriptors[i]))
-+    if (0 <= descriptors[i] && close (descriptors[i]) < 0)
-       {
-         error (0, errno, "%s", quotef (files[i]));
-         ok = false;
-Index: coreutils-9.11/tests/local.mk
-===================================================================
---- coreutils-9.11.orig/tests/local.mk
-+++ coreutils-9.11/tests/local.mk
-@@ -485,7 +485,9 @@ all_tests =					\
-   tests/tac/tac-2-nonseekable.sh		\
-   tests/tail/tail.pl				\
-   tests/tee/append.sh				\
-+  tests/tee/short-write.sh			\
-   tests/tee/tee.sh				\
-+  tests/tee/write-eagain.sh			\
-   tests/test/test-N.sh				\
-   tests/test/test-diag.pl			\
-   tests/test/test-file.sh			\
-Index: coreutils-9.11/tests/tee/short-write.sh
-===================================================================
---- /dev/null
-+++ coreutils-9.11/tests/tee/short-write.sh
-@@ -0,0 +1,33 @@
-+#!/bin/sh
-+# Test 'tee' when a write is short.
-+
-+# Copyright (C) 2026 Free Software Foundation, Inc.
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
-+print_ver_ tee
-+require_strace_ write
-+
-+printf 'abcdef' >file1-exp || framework_failure_
-+printf 'f' >out-exp || framework_failure_
-+
-+# In coreutils-9.11, a short write would be treated as an error.
-+strace -qqq -o /dev/null --trace-fds=1 -e trace=write \
-+  -e inject=write:retval=1:when=1..5 tee file1 >out 2>err <file1-exp || fail=1
-+compare file1-exp file1 || fail=1
-+compare out-exp out || fail=1
-+compare /dev/null err || fail=1
-+
-+Exit $fail
-Index: coreutils-9.11/tests/tee/write-eagain.sh
-===================================================================
---- /dev/null
-+++ coreutils-9.11/tests/tee/write-eagain.sh
-@@ -0,0 +1,31 @@
-+#!/bin/sh
-+# Test 'tee' when a write fails with errno set to EAGAIN.
-+
-+# Copyright (C) 2026 Free Software Foundation, Inc.
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
-+print_ver_ tee
-+require_strace_ write
-+
-+# In coreutils-9.11 the following test would infinite loop.
-+echo a >exp || framework_failure_
-+timeout 10 strace -qqq -o /dev/null -e trace-fds=3 \
-+  -e inject=write:error=EAGAIN:when=1 tee file1 <exp >out 2>err || fail=1
-+compare exp file1 || fail=1
-+compare exp out || fail=1
-+compare /dev/null err || fail=1
-+
-+Exit $fail
diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch b/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
deleted file mode 100644
index 85745bf572..0000000000
--- a/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From dadd37b60ca43b436a2287d28d6497bcc5bf4b9a Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 28 Apr 2026 11:25:00 -0700
-Subject: [PATCH] uniq: fix read overrun with -w
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Michał Majchrowicz.
-* src/uniq.c (find_field): Fix typo.
-* tests/uniq/uniq.pl (add_z_variants): Test for the bug.
-
-CVE: CVE-2026-56391
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=d64e35a8a4c0e4608321433e0d84d917e4e36371]
-
-Backport Changes:
-- The NEWS file has not been updated.
-
-Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
----
- THANKS.in          | 1 +
- src/uniq.c         | 4 ++--
- tests/uniq/uniq.pl | 3 +++
- 3 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/THANKS.in b/THANKS.in
-index 35fee75..5a2fd35 100644
---- a/THANKS.in
-+++ b/THANKS.in
-@@ -459,6 +459,7 @@ Michail Litvak                      mci@owl.openwall.com
- Michal Politowski                   mpol@charybda.icm.edu.pl
- Michal Svec                         msvec@suse.cz
- Michal Trunecka                     mtruneck@redhat.com
-+Michał Majchrowicz                  mmajchrowicz@afine.com
- Michel Robitaille                   robitail@IRO.UMontreal.CA
- Michiel Bacchiani                   bacchian@raven.bu.edu
- Mike Castle                         dalgoda@ix.netcom.com
-diff --git a/src/uniq.c b/src/uniq.c
-index 3046359..5834596 100644
---- a/src/uniq.c
-+++ b/src/uniq.c
-@@ -285,8 +285,8 @@ find_field (struct linebuffer const *line, idx_t *plen)
-   else
-     {
-       char *ep = lp;
--      for (idx_t i = check_chars; 0 < i && lp < lim; i--)
--        ep += mcel_scan (lp, lim).len;
-+      for (idx_t i = check_chars; 0 < i && ep < lim; i--)
-+        ep += mcel_scan (ep, lim).len;
-       len = ep - lp;
-     }
- 
-diff --git a/tests/uniq/uniq.pl b/tests/uniq/uniq.pl
-index b558fb3..0df7ec6 100755
---- a/tests/uniq/uniq.pl
-+++ b/tests/uniq/uniq.pl
-@@ -234,6 +234,9 @@ my @Tests =
-         "  - 'separate'\n" .
-         "  - 'both'\n" .
-         "Try '$prog --help' for more information.\n"}],
-+ # Test for read buffer overrun.
-+ do { my $longline = "\360\237\230\200" . "A" x 255 . "\n";
-+      ['146', '-w256', {IN  => $longline x 2}, {OUT => $longline}] },
- );
- 
- # Locale related tests
diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch b/meta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch
deleted file mode 100644
index 8468b4d288..0000000000
--- a/meta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From aa3f6d91fdddcc45c5bb656168f7d20808991fe0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 28 Apr 2026 20:33:10 +0100
-Subject: [PATCH] unexpand: fix heap overflow
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* src/unexpand.c (unexpand): Use xinmalloc() to gracefully
-handle overflow.  Also use the runtime locale specific MB_CUR_MAX
-rather than the worst case MB_LEN_MAX.
-* tests/unexpand/mb.sh: Add a test case that fails in a default
-glibc build with either MB_CUR_MAX or MB_LEN_MAX.
-* NEWS: Mention the bug fix.
-Reported by Michał Majchrowicz.
-
-CVE: CVE-2026-56392
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=b60a159fdc5bfcf9988d3a4cb6f53abe8ad5d35d]
-
-Backport Changes:
-- The NEWS file has not been updated.
-
-Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
----
- src/unexpand.c       | 2 +-
- tests/unexpand/mb.sh | 8 ++++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/unexpand.c b/src/unexpand.c
-index 4fbf9d3..761c8ea 100644
---- a/src/unexpand.c
-+++ b/src/unexpand.c
-@@ -131,7 +131,7 @@ unexpand (void)
-   /* The worst case is a non-blank character, then one blank, then a
-      tab stop, then MAX_COLUMN_WIDTH - 1 blanks, then a non-blank; so
-      allocate MAX_COLUMN_WIDTH bytes to store the blanks.  */
--  pending_blank = ximalloc (max_column_width * sizeof (char) * MB_LEN_MAX);
-+  pending_blank = xinmalloc (max_column_width, MB_CUR_MAX);
- 
-   while (true)
-     {
-diff --git a/tests/unexpand/mb.sh b/tests/unexpand/mb.sh
-index 76a2679..076a1c1 100755
---- a/tests/unexpand/mb.sh
-+++ b/tests/unexpand/mb.sh
-@@ -17,6 +17,7 @@
- 
- . "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
- print_ver_ unexpand printf
-+getlimits_
- 
- test "$LOCALE_FR_UTF8" != none || skip_ "French UTF-8 locale not available"
- export LC_ALL="$LOCALE_FR_UTF8"
-@@ -161,4 +162,11 @@ EOF
- unexpand -a ./in ./in > out || fail=1
- compare exp out > /dev/null 2>&1 || fail=1
- 
-+# Ensure overflow is handed gracefully
-+# coreutils v9.11 induced a buffer overflow with mb_mul=4 (or 16).
-+for mb_mul in 4 6; do
-+  printf '   \n' | unexpand -t $(expr $SIZE_MAX / $mb_mul + 1) 2>err; ret=$?
-+  test "$ret" = 1 || test "$ret" = 0 || { cat err; fail=1; }
-+done
-+
- Exit $fail
diff --git a/meta/recipes-core/coreutils/coreutils_9.11.bb b/meta/recipes-core/coreutils/coreutils_9.12.bb
similarity index 97%
rename from meta/recipes-core/coreutils/coreutils_9.11.bb
rename to meta/recipes-core/coreutils/coreutils_9.12.bb
index b24a9ac996..bdad62c455 100644
--- a/meta/recipes-core/coreutils/coreutils_9.11.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.12.bb
@@ -16,11 +16,8 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://run-ptest \
-           file://CVE-2026-56391.patch \
-           file://CVE-2026-56392.patch \
-           file://0d6fcb99d691d920961938e61c43478566ef626e.patch \
            "
-SRC_URI[sha256sum] = "394024eda0a5955217ceda9cd1201e65dc8fa3aa29c2951135a49521d57c3cc3"
+SRC_URI[sha256sum] = "a480198559733e9b3da999e90543ac6f888a2caa544d8d664c5a1f17e528e210"
 
 CVE_PRODUCT = "gnu:coreutils"
 
-- 
2.47.3


