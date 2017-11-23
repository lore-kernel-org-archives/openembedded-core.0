Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7464786E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 03:52:20 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 61so1959935plf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 19:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lij9CKHWjZT0GJ4QGJxhmq2Z4jXqXSZDgejnuCCGp7E=;
	b=uEN27Fka8S/FsJTe2RmGi6KWY2jmE6iugz0C7tppk4QaZBDKST/SiaujpQV756DFBh
	FQQNs7o0Ez8Obtxtu2KJ7hT+Yl5Jg/nUkz3msc6HDbc9Yx5sMVnU0tFKtcPpQDinwLTz
	mFtp3BQD/yKIWPB2gD+N22WM6lVJkpFKcloDvKNIxPq1lRblVC0Oab92DRibl/3L13q9
	wXdPS5F+NHCUvoQGnrbgLdxLjywd9PwJRC7c4rmd9e0k6DcLSTVcITI509I8EdsNuuiS
	I+z13Vmn/Bews4/jS6yuUI3y8ui1NXG3sVSM344sIrbC5pH3Bajm0AC2rr9xSxqOLTWb
	Rc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lij9CKHWjZT0GJ4QGJxhmq2Z4jXqXSZDgejnuCCGp7E=;
	b=W/e1OFGvzXrFj7ykTSIVUJJPfydG0rzT2Ripkta5ia0yzpXfOooWzWLCeYhZ11PMEk
	wkN9wruCbFXbKvoL0VkYdioFW8qKfZS96J85QSxwjoMpBh2h5/CahG0Jq49PcUlF/stZ
	/ry27p6C+J49mfzE0PCVxsvDNTqgma3tPKCsMKR58FAeSqg8otw63SwSQEiXj866Xkzt
	efksSJiqbNB+H6db4qETrdZKvhyiScxpewmDcyHTsGIgrEvBqvy5anJS/hKS+RPHDBaz
	2lowKpHI2UWtzfCRMuGq0xfMqDC03rIhVZXqc6+nffjtEZlbfX6FuhetPMYNBV5nlhIW
	An0w==
X-Gm-Message-State: AJaThX7TzAyPNNCydyNUQLgXV8tQgVUttn+yFRYlS0sksZvDFdZ0rCCk
	6NKc0X/UOq3E79rIdrEJzO81tw==
X-Google-Smtp-Source: AGs4zMbihuQm41GLbp2VhN0RUonlEaLUCnzVxaCR2dOjdAqY8a6BWvVE6h9+qU54dxR2gGOAWkNoVw==
X-Received: by 10.159.216.142 with SMTP id s14mr17329624plp.173.1511409141751; 
	Wed, 22 Nov 2017 19:52:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	n2sm25625481pgv.69.2017.11.22.19.52.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 19:52:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 19:52:16 -0800
Message-Id: <1511409137-30823-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
References: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/3] glibc: Security fix CVE-2017-15671
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Nov 2017 03:52:20 -0000

From: Armin Kuster <akuster@mvista.com>

The glob function in glob.c in the GNU C Library (aka glibc or libc6) before 2.27, when invoked with GLOB_TILDE, could skip freeing allocated memory when processing the ~ operator with a long user name, potentially leading to a denial of service (memory leak).

Affects: glibc < 2.27

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch | 215 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |   1 +
 2 files changed, 216 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch b/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
new file mode 100644
index 0000000..425aaa7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
@@ -0,0 +1,215 @@
+From 6182b3708b7af316454c81467538a8c20c1b046d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Sat, 21 Oct 2017 18:03:30 +0200
+Subject: [PATCH] glob: Add new test tst-glob-tilde
+
+The new test checks for memory leaks (see bug 22325) and attempts
+to trigger the buffer overflow in bug 22320.
+
+(cherry picked from commit e80fc1fc98bf614eb01cf8325503df3a1451a99c)
+
+Upstream-Status: Backport
+CVE: CVE-2017-15671
+Affects: glibx < 2.27
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog              |   8 +++
+ posix/Makefile         |  11 +++-
+ posix/tst-glob-tilde.c | 136 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 153 insertions(+), 2 deletions(-)
+ create mode 100644 posix/tst-glob-tilde.c
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,11 @@
++2017-10-21  Florian Weimer  <fweimer@redhat.com>
++
++	* posix/Makefile (tests): Add tst-glob-tilde.
++	(tests-special): Add tst-glob-tilde-mem.out
++	(tst-glob-tilde-ENV): Set MALLOC_TRACE.
++	(tst-glob-tilde-mem.out): Add mtrace check.
++	* posix/tst-glob-tilde.c: New file.
++
+ 2017-10-20  Paul Eggert <eggert@cs.ucla.edu>
+ 
+        [BZ #22320]
+Index: git/posix/Makefile
+===================================================================
+--- git.orig/posix/Makefile
++++ git/posix/Makefile
+@@ -93,7 +93,7 @@ tests		:= test-errno tstgetopt testfnm r
+ 		   tst-fnmatch3 bug-regex36 tst-getaddrinfo5 \
+ 		   tst-posix_spawn-fd tst-posix_spawn-setsid \
+ 		   tst-posix_fadvise tst-posix_fadvise64 \
+-		   tst-sysconf-empty-chroot
++		   tst-sysconf-empty-chroot tst-glob-tilde
+ tests-internal	:= bug-regex5 bug-regex20 bug-regex33 \
+ 		   tst-rfc3484 tst-rfc3484-2 tst-rfc3484-3
+ xtests		:= bug-ga2
+@@ -141,7 +141,8 @@ tests-special += $(objpfx)bug-regex2-mem
+ 		 $(objpfx)tst-rxspencer-no-utf8-mem.out $(objpfx)tst-pcre-mem.out \
+ 		 $(objpfx)tst-boost-mem.out $(objpfx)tst-getconf.out \
+ 		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork3-mem.out \
+-		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out
++		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out \
++		 $(objpfx)tst-glob-tilde-mem.out
+ xtests-special += $(objpfx)bug-ga2-mem.out
+ endif
+ 
+@@ -350,6 +351,12 @@ $(objpfx)bug-glob2-mem.out: $(objpfx)bug
+ 	$(common-objpfx)malloc/mtrace $(objpfx)bug-glob2.mtrace > $@; \
+ 	$(evaluate-test)
+ 
++tst-glob-tilde-ENV = MALLOC_TRACE=$(objpfx)tst-glob-tilde.mtrace
++
++$(objpfx)tst-glob-tilde-mem.out: $(objpfx)tst-glob-tilde.out
++	$(common-objpfx)malloc/mtrace $(objpfx)tst-glob-tilde.mtrace > $@; \
++	$(evaluate-test)
++
+ $(inst_libexecdir)/getconf: $(inst_bindir)/getconf \
+ 			    $(objpfx)getconf.speclist FORCE
+ 	$(addprefix $(..)./scripts/mkinstalldirs ,\
+Index: git/posix/tst-glob-tilde.c
+===================================================================
+--- /dev/null
++++ git/posix/tst-glob-tilde.c
+@@ -0,0 +1,136 @@
++/* Check for GLOB_TIDLE heap allocation issues (bug 22320, bug 22325).
++   Copyright (C) 2017 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <glob.h>
++#include <mcheck.h>
++#include <nss.h>
++#include <pwd.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/support.h>
++
++/* Flag which indicates whether to pass the GLOB_ONLYDIR flag.  */
++static int do_onlydir;
++
++/* Flag which indicates whether to pass the GLOB_NOCHECK flag.  */
++static int do_nocheck;
++
++/* Flag which indicates whether to pass the GLOB_MARK flag.  */
++static int do_mark;
++
++static void
++one_test (const char *prefix, const char *middle, const char *suffix)
++{
++  char *pattern = xasprintf ("%s%s%s", prefix, middle, suffix);
++  int flags = GLOB_TILDE;
++  if (do_onlydir)
++    flags |= GLOB_ONLYDIR;
++  if (do_nocheck)
++    flags |= GLOB_NOCHECK;
++  if (do_mark)
++    flags |= GLOB_MARK;
++  glob_t gl;
++  /* This glob call might result in crashes or memory leaks.  */
++  if (glob (pattern, flags, NULL, &gl) == 0)
++    globfree (&gl);
++  free (pattern);
++}
++
++enum
++  {
++    /* The largest base being tested.  */
++    largest_base_size = 500000,
++
++    /* The actual size is the base size plus a variable whose absolute
++       value is not greater than this.  This helps malloc to trigger
++       overflows.  */
++    max_size_skew = 16,
++
++    /* The maximum string length supported by repeating_string
++       below.  */
++    repeat_size = largest_base_size + max_size_skew,
++  };
++
++/* Used to construct strings which repeat a single character 'x'.  */
++static char *repeat;
++
++/* Return a string of SIZE characters.  */
++const char *
++repeating_string (int size)
++{
++  TEST_VERIFY (size >= 0);
++  TEST_VERIFY (size <= repeat_size);
++  const char *repeated_shifted = repeat + repeat_size - size;
++  TEST_VERIFY (strlen (repeated_shifted) == size);
++  return repeated_shifted;
++}
++
++static int
++do_test (void)
++{
++  /* Avoid network-based NSS modules and initialize nss_files with a
++     dummy lookup.  This has to come before mtrace because NSS does
++     not free all memory.  */
++  __nss_configure_lookup ("passwd", "files");
++  (void) getpwnam ("root");
++
++  mtrace ();
++
++  repeat = xmalloc (repeat_size + 1);
++  memset (repeat, 'x', repeat_size);
++  repeat[repeat_size] = '\0';
++
++  /* These numbers control the size of the user name.  The values
++     cover the minimum (0), a typical size (8), a large
++     stack-allocated size (100000), and a somewhat large
++     heap-allocated size (largest_base_size).  */
++  static const int base_sizes[] = { 0, 8, 100, 100000, largest_base_size, -1 };
++
++  for (do_onlydir = 0; do_onlydir < 2; ++do_onlydir)
++    for (do_nocheck = 0; do_nocheck < 2; ++do_nocheck)
++      for (do_mark = 0; do_mark < 2; ++do_mark)
++        for (int base_idx = 0; base_sizes[base_idx] >= 0; ++base_idx)
++          {
++            for (int size_skew = -max_size_skew; size_skew <= max_size_skew;
++                 ++size_skew)
++              {
++                int size = base_sizes[base_idx] + size_skew;
++                if (size < 0)
++                  continue;
++
++                const char *user_name = repeating_string (size);
++                one_test ("~", user_name, "/a/b");
++              }
++
++            const char *user_name = repeating_string (base_sizes[base_idx]);
++            one_test ("~", user_name, "");
++            one_test ("~", user_name, "/");
++            one_test ("~", user_name, "/a");
++            one_test ("~", user_name, "/*/*");
++            one_test ("~", user_name, "\\/");
++            one_test ("/~", user_name, "");
++            one_test ("*/~", user_name, "/a/b");
++          }
++
++  free (repeat);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index ed4ea4f..e4ba28f 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
            file://CVE-2017-15670.patch \
+           file://CVE-2017-15671.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


