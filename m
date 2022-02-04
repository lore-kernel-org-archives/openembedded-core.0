Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF71C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=SZ+bWeg7;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983979; x=1675519979;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0iHIdi+kRne/6sC50RPm5q7ArQD/lgKu0D7rLB3jaAk=;
  b=SZ+bWeg7G5O/SNmLzjfODXURNitybcc/cVtuwMUM840RkHYyXNrNZ5J3
   fDcOdFpTFLZ9PyOqo+zR5OSq9URUFIk2h1y4d1yPkAkcIKm6RwZzE74d/
   UTxv1sLSzLgLYpTMNNUs9qYOFcXQKtFUj7+eWgANIbEJnmG0urZUaMJ2w
   2M/pR7suqgSKD3Twzk2x4ijUUD5Czu8XoP5+VoSlLN7hPDJXxJDu+uP2Z
   TNPD6p3mLt/A9E5KM01sYg/NjzFROIwN9ENnZ4EHpyJL3TmT1Z0C2Q8iK
   oN4XQB74aT6tI3yrocxzif+DTloh5YXRmRkweaWEtO6XoW3+LgnyFaF2e
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321602"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321602"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750031"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:57 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/17] glibc : Fix CVE-2021-3998
Date: Fri,  4 Feb 2022 22:12:31 +0800
Message-Id: 
 <184125f7213fc2fc024c4055d269a3a812504f60.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161352

From: Pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=062ff490c1467059f6cd64bb9c3d85f6cc6cf97a]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f7a79879c0b2bef0dadd6caaaeeb0d26423e04e5]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 20cc83dd8d323d7ea86b3625f4e8da94c160def9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glibc/glibc/0001-CVE-2021-3998.patch      | 282 ++++++++++++++++++
 .../glibc/glibc/0002-CVE-2021-3998.patch      | 138 +++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |   2 +
 3 files changed, 422 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
new file mode 100644
index 0000000000..c6bd5916e3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
@@ -0,0 +1,282 @@
+From fb7bff12e81c677a6622f724edd4d4987dd9d971 Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Tue, 18 Jan 2022 13:29:36 +0530
+Subject: [PATCH] support: Add helpers to create paths longer than PATH_MAX
+
+Add new helpers support_create_and_chdir_toolong_temp_directory and
+support_chdir_toolong_temp_directory to create and descend into
+directory trees longer than PATH_MAX.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=062ff490c1467059f6cd64bb9c3d85f6cc6cf97a]
+CVE: CVE-2021-3998
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ support/temp_file.c | 159 +++++++++++++++++++++++++++++++++++++++++---
+ support/temp_file.h |   9 +++
+ 2 files changed, 159 insertions(+), 9 deletions(-)
+
+diff --git a/support/temp_file.c b/support/temp_file.c
+index e7bb8aadb9..e41128c2d4 100644
+--- a/support/temp_file.c
++++ b/support/temp_file.c
+@@ -1,5 +1,6 @@
+ /* Temporary file handling for tests.
+    Copyright (C) 1998-2021 Free Software Foundation, Inc.
++   Copyright The GNU Tools Authors.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -20,15 +21,17 @@
+    some 32-bit platforms. */
+ #define _FILE_OFFSET_BITS 64
+ 
++#include <support/check.h>
+ #include <support/temp_file.h>
+ #include <support/temp_file-internal.h>
+ #include <support/support.h>
+ 
++#include <errno.h>
+ #include <paths.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <unistd.h>
++#include <xunistd.h>
+ 
+ /* List of temporary files.  */
+ static struct temp_name_list
+@@ -36,14 +39,20 @@ static struct temp_name_list
+   struct temp_name_list *next;
+   char *name;
+   pid_t owner;
++  bool toolong;
+ } *temp_name_list;
+ 
+ /* Location of the temporary files.  Set by the test skeleton via
+    support_set_test_dir.  The string is not be freed.  */
+ static const char *test_dir = _PATH_TMP;
+ 
+-void
+-add_temp_file (const char *name)
++/* Name of subdirectories in a too long temporary directory tree.  */
++static char toolong_subdir[NAME_MAX + 1];
++static bool toolong_initialized;
++static size_t toolong_path_max;
++
++static void
++add_temp_file_internal (const char *name, bool toolong)
+ {
+   struct temp_name_list *newp
+     = (struct temp_name_list *) xcalloc (sizeof (*newp), 1);
+@@ -53,12 +62,19 @@ add_temp_file (const char *name)
+       newp->name = newname;
+       newp->next = temp_name_list;
+       newp->owner = getpid ();
++      newp->toolong = toolong;
+       temp_name_list = newp;
+     }
+   else
+     free (newp);
+ }
+ 
++void
++add_temp_file (const char *name)
++{
++  add_temp_file_internal (name, false);
++}
++
+ int
+ create_temp_file_in_dir (const char *base, const char *dir, char **filename)
+ {
+@@ -90,8 +106,8 @@ create_temp_file (const char *base, char
+   return create_temp_file_in_dir (base, test_dir, filename);
+ }
+ 
+-char *
+-support_create_temp_directory (const char *base)
++static char *
++create_temp_directory_internal (const char *base, bool toolong)
+ {
+   char *path = xasprintf ("%s/%sXXXXXX", test_dir, base);
+   if (mkdtemp (path) == NULL)
+@@ -99,16 +115,132 @@ support_create_temp_directory (const cha
+       printf ("error: mkdtemp (\"%s\"): %m", path);
+       exit (1);
+     }
+-  add_temp_file (path);
++  add_temp_file_internal (path, toolong);
+   return path;
+ }
+ 
+-/* Helper functions called by the test skeleton follow.  */
++char *
++support_create_temp_directory (const char *base)
++{
++  return create_temp_directory_internal (base, false);
++}
++
++static void
++ensure_toolong_initialized (void)
++{
++  if (!toolong_initialized)
++    FAIL_EXIT1 ("uninitialized toolong directory tree\n");
++}
++
++static void
++initialize_toolong (const char *base)
++{
++  long name_max = pathconf (base, _PC_NAME_MAX);
++  name_max = (name_max < 0 ? 64
++	      : (name_max < sizeof (toolong_subdir) ? name_max
++		 : sizeof (toolong_subdir) - 1));
++
++  long path_max = pathconf (base, _PC_PATH_MAX);
++  path_max = (path_max < 0 ? 1024
++	      : path_max <= PTRDIFF_MAX ? path_max : PTRDIFF_MAX);
++
++  /* Sanity check to ensure that the test does not create temporary directories
++     in different filesystems because this API doesn't support it.  */
++  if (toolong_initialized)
++    {
++      if (name_max != strlen (toolong_subdir))
++	FAIL_UNSUPPORTED ("name_max: Temporary directories in different"
++			  " filesystems not supported yet\n");
++      if (path_max != toolong_path_max)
++	FAIL_UNSUPPORTED ("path_max: Temporary directories in different"
++			  " filesystems not supported yet\n");
++      return;
++    }
++
++  toolong_path_max = path_max;
++
++  size_t len = name_max;
++  memset (toolong_subdir, 'X', len);
++  toolong_initialized = true;
++}
++
++char *
++support_create_and_chdir_toolong_temp_directory (const char *basename)
++{
++  char *base = create_temp_directory_internal (basename, true);
++  xchdir (base);
++
++  initialize_toolong (base);
++
++  size_t sz = strlen (toolong_subdir);
++
++  /* Create directories and descend into them so that the final path is larger
++     than PATH_MAX.  */
++  for (size_t i = 0; i <= toolong_path_max / sz; i++)
++    {
++      int ret = mkdir (toolong_subdir, S_IRWXU);
++      if (ret != 0 && errno == ENAMETOOLONG)
++	FAIL_UNSUPPORTED ("Filesystem does not support creating too long "
++			  "directory trees\n");
++      else if (ret != 0)
++	FAIL_EXIT1 ("Failed to create directory tree: %m\n");
++      xchdir (toolong_subdir);
++    }
++  return base;
++}
+ 
+ void
+-support_set_test_dir (const char *path)
++support_chdir_toolong_temp_directory (const char *base)
+ {
+-  test_dir = path;
++  ensure_toolong_initialized ();
++
++  xchdir (base);
++
++  size_t sz = strlen (toolong_subdir);
++  for (size_t i = 0; i <= toolong_path_max / sz; i++)
++    xchdir (toolong_subdir);
++}
++
++/* Helper functions called by the test skeleton follow.  */
++
++static void
++remove_toolong_subdirs (const char *base)
++{
++  ensure_toolong_initialized ();
++
++  if (chdir (base) != 0)
++    {
++      printf ("warning: toolong cleanup base failed: chdir (\"%s\"): %m\n",
++	      base);
++      return;
++    }
++
++  /* Descend.  */
++  int levels = 0;
++  size_t sz = strlen (toolong_subdir);
++  for (levels = 0; levels <= toolong_path_max / sz; levels++)
++    if (chdir (toolong_subdir) != 0)
++      {
++	printf ("warning: toolong cleanup failed: chdir (\"%s\"): %m\n",
++		toolong_subdir);
++	break;
++      }
++
++  /* Ascend and remove.  */
++  while (--levels >= 0)
++    {
++      if (chdir ("..") != 0)
++	{
++	  printf ("warning: toolong cleanup failed: chdir (\"..\"): %m\n");
++	  return;
++	}
++      if (remove (toolong_subdir) != 0)
++	{
++	  printf ("warning: could not remove subdirectory: %s: %m\n",
++		  toolong_subdir);
++	  return;
++	}
++    }
+ }
+ 
+ void
+@@ -123,6 +255,9 @@ support_delete_temp_files (void)
+ 	 around, to prevent PID reuse.)  */
+       if (temp_name_list->owner == pid)
+ 	{
++	  if (temp_name_list->toolong)
++	    remove_toolong_subdirs (temp_name_list->name);
++
+ 	  if (remove (temp_name_list->name) != 0)
+ 	    printf ("warning: could not remove temporary file: %s: %m\n",
+ 		    temp_name_list->name);
+@@ -147,3 +282,9 @@ support_print_temp_files (FILE *f)
+       fprintf (f, ")\n");
+     }
+ }
++
++void
++support_set_test_dir (const char *path)
++{
++  test_dir = path;
++}
+diff --git a/support/temp_file.h b/support/temp_file.h
+index 50a443abe4..8459ddda72 100644
+--- a/support/temp_file.h
++++ b/support/temp_file.h
+@@ -44,6 +44,15 @@ int create_temp_file_in_dir (const char
+    returns.  The caller should free this string.  */
+ char *support_create_temp_directory (const char *base);
+ 
++/* Create a temporary directory tree that is longer than PATH_MAX and schedule
++   it for deletion.  BASENAME is used as a prefix for the unique directory
++   name, which the function returns.  The caller should free this string.  */
++char *support_create_and_chdir_toolong_temp_directory (const char *basename);
++
++/* Change into the innermost directory of the directory tree BASE, which was
++   created using support_create_and_chdir_toolong_temp_directory.  */
++void support_chdir_toolong_temp_directory (const char *base);
++
+ __END_DECLS
+ 
+ #endif /* SUPPORT_TEMP_FILE_H */
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
new file mode 100644
index 0000000000..0a4c34452d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
@@ -0,0 +1,138 @@
+From f7a79879c0b2bef0dadd6caaaeeb0d26423e04e5 Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Thu, 13 Jan 2022 11:28:36 +0530
+Subject: [PATCH] realpath: Set errno to ENAMETOOLONG for result larger than
+ PATH_MAX [BZ #28770]
+
+realpath returns an allocated string when the result exceeds PATH_MAX,
+which is unexpected when its second argument is not NULL.  This results
+in the second argument (resolved) being uninitialized and also results
+in a memory leak since the caller expects resolved to be the same as the
+returned value.
+
+Return NULL and set errno to ENAMETOOLONG if the result exceeds
+PATH_MAX.  This fixes [BZ #28770], which is CVE-2021-3998.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+(cherry picked from commit ee8d5e33adb284601c00c94687bc907e10aec9bb)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f7a79879c0b2bef0dadd6caaaeeb0d26423e04e5]
+CVE: CVE-2021-3998
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ NEWS                          |  4 +++
+ stdlib/Makefile               |  1 +
+ stdlib/canonicalize.c         | 12 +++++++--
+ stdlib/tst-realpath-toolong.c | 49 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 64 insertions(+), 2 deletions(-)
+ create mode 100644 stdlib/tst-realpath-toolong.c
+
+diff --git a/NEWS b/NEWS
+index 7e773bd005..b4f81c2668 100644
+--- a/NEWS
++++ b/NEWS
+@@ -210,6 +210,10 @@ Security related changes:
+   legacy function could result in a stack-based buffer overflow when
+   using the "unix" protocol.  Reported by Martin Sebor.
+ 
++  CVE-2021-3998: Passing a path longer than PATH_MAX to the realpath
++  function could result in a memory leak and potential access of
++  uninitialized memory.  Reported by Qualys.
++
+ The following bugs are resolved with this release:
+ 
+   [4737] libc: fork is not async-signal-safe
+diff --git a/stdlib/canonicalize.c b/stdlib/canonicalize.c
+index 698f9ede25..7a23a51b3a 100644
+--- a/stdlib/canonicalize.c
++++ b/stdlib/canonicalize.c
+@@ -400,8 +400,16 @@ realpath_stk (const char *name, char *re
+ 
+ error:
+   *dest++ = '\0';
+-  if (resolved != NULL && dest - rname <= get_path_max ())
+-    rname = strcpy (resolved, rname);
++  if (resolved != NULL)
++    {
++      if (dest - rname <= get_path_max ())
++	rname = strcpy (resolved, rname);
++      else
++	{
++	  failed = true;
++	  __set_errno (ENAMETOOLONG);
++	}
++    }
+ 
+ error_nomem:
+   scratch_buffer_free (&extra_buffer);
+diff --git a/stdlib/Makefile b/stdlib/Makefile
+index 9bb5c221e8..a4ac30d1f6 100644
+--- a/stdlib/Makefile
++++ b/stdlib/Makefile
+@@ -88,7 +88,8 @@ tests		:= tst-strtol tst-strtod testmb t
+ 		   tst-swapcontext1 tst-setcontext4 tst-setcontext5 \
+ 		   tst-setcontext6 tst-setcontext7 tst-setcontext8 \
+ 		   tst-setcontext9 tst-bz20544 tst-canon-bz26341 \
+-		   tst-realpath
++		   tst-realpath \
++		   tst-realpath-toolong
+ 
+ tests-internal	:= tst-strtod1i tst-strtod3 tst-strtod4 tst-strtod5i \
+ 		   tst-tls-atexit tst-tls-atexit-nodelete
+diff --git a/stdlib/tst-realpath-toolong.c b/stdlib/tst-realpath-toolong.c
+new file mode 100644
+index 0000000000..8bed772460
+--- /dev/null
++++ b/stdlib/tst-realpath-toolong.c
+@@ -0,0 +1,49 @@
++/* Verify that realpath returns NULL with ENAMETOOLONG if the result exceeds
++   NAME_MAX.
++   Copyright The GNU Toolchain Authors.
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
++   <https://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <limits.h>
++#include <stdlib.h>
++#include <string.h>
++#include <unistd.h>
++#include <support/check.h>
++#include <support/temp_file.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++
++#define BASENAME "tst-realpath-toolong."
++
++int
++do_test (void)
++{
++  char *base = support_create_and_chdir_toolong_temp_directory (BASENAME);
++
++  char buf[PATH_MAX + 1];
++  const char *res = realpath (".", buf);
++
++  /* canonicalize.c states that if the real path is >= PATH_MAX, then
++     realpath returns NULL and sets ENAMETOOLONG.  */
++  TEST_VERIFY (res == NULL);
++  TEST_VERIFY (errno == ENAMETOOLONG);
++
++  free (base);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 92787097aa..3504cf45a9 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -63,6 +63,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0002-CVE-2022-23218.patch \
            file://0001-CVE-2022-23219.patch \
            file://0002-CVE-2022-23219.patch \
+           file://0001-CVE-2021-3998.patch \
+           file://0002-CVE-2021-3998.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


