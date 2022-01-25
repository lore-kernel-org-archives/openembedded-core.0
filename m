Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D929FC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 11:26:47 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.5814.1643110006439824280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 03:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cib1E7zq;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 13so9757982qkd.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbxDMvJsKrxvHdpWUQQ1Ch54ORS0g3NkZrSXyD0dBbY=;
        b=Cib1E7zqvdYCunrVPaGD0I2fE2QmnexiDaAumwpWFZfhz60w/Do/S+PQEG+3rYYlEb
         8K42mSYtWbVDCtDB/kyuR/EYFSYmdu8T+MojMTSCDoG8ZlW6FAHojtirPYyYWZkGJjJh
         87xfAClkV+OrEbIFfILpHTRRjCeLC5d20yhUBnxvfG6btsiUZ4nhj1jHg3LZDMl2lT3b
         U6BTqKOHiq+jkHj/GZYXLZymxB8cAOBxPN0aUnvY0arrRJ94ur7XeUVv5tca5cltl21t
         2kU+BCQhgTisRXsvxBp/LWbtifLckYHM7XQsIWjDBUzefDaHJMq1sqVnaEra1mf7FWf4
         dflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbxDMvJsKrxvHdpWUQQ1Ch54ORS0g3NkZrSXyD0dBbY=;
        b=vTRJvNz4HMVK5otApvN/2liEsF4QARBX/zUV9DPAQOAlQ4Ed1bVjKgQ3DS4N1bGpy9
         5o/eH0hi5gftIooqEIACyk8nQY0Jae0kyETrGj04wT5t8ThL7f29LqiWk94NPCJgX7/I
         40iRyRoR8Wmo/ZDWLxpciHls+hPZ6Ag7o6fy0AO61zYjhW/TjmZ0G0vSIJvvmkz4bVgK
         NN777ZhLA0p6lRcLg4DT/RL+3Dd9wHCmnE7w9K02GhNNGqd0nYszoBWbiI257IFRevz5
         dnzjxvZ6FOLk9HmzINIqdm/hoIGgsHM9kxhRjeVaDhmenOCkPbBXyyMIIjrAhHsH3wlW
         U7Jw==
X-Gm-Message-State: AOAM530P75wGXW62FKvlSGU+f4FN6lnP1VAz03P/+HH7b1qDFKGNthnH
	Xhz0EZ1e+aTbR5CUTwHD+uhygRUqzZgfkA==
X-Google-Smtp-Source: 
 ABdhPJx22NG27xfLtwNdSUJRzysCdTMdfUMEbWXOYrdMMsvYOP1TDddZICmnoC74vDjkvJm9+X7cJQ==
X-Received: by 2002:a05:620a:24cb:: with SMTP id
 m11mr13994426qkn.387.1643110004845;
        Tue, 25 Jan 2022 03:26:44 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 j186sm8669999qkd.32.2022.01.25.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 03:26:44 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH 1/2] glibc : Fix CVE-2021-3998
Date: Tue, 25 Jan 2022 03:26:39 -0800
Message-Id: <20220125112640.109373-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 11:26:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160915

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=fb7bff12e81c677a6622f724edd4d4987dd9d971]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ee8d5e33adb284601c00c94687bc907e10aec9bb]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=84d2d0fe20bdf94feed82b21b4d7d136db471f03]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../glibc/glibc/0001-CVE-2021-3998.patch      | 282 ++++++++++++++++++
 .../glibc/glibc/0002-CVE-2021-3998.patch      | 138 +++++++++
 .../glibc/glibc/0003-CVE-2021-3998.patch      |  35 +++
 meta/recipes-core/glibc/glibc_2.33.bb         |   3 +
 4 files changed, 458 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0003-CVE-2021-3998.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-3998.patch
new file mode 100644
index 0000000000..32aa0eb348
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
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=fb7bff12e81c677a6622f724edd4d4987dd9d971]
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
index 0000000000..7be3c79faf
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2021-3998.patch
@@ -0,0 +1,138 @@
+From ee8d5e33adb284601c00c94687bc907e10aec9bb Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ee8d5e33adb284601c00c94687bc907e10aec9bb]
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
+@@ -148,6 +148,10 @@ Security related changes:
+   CVE-2019-25013: A buffer overflow has been fixed in the iconv function when
+   invoked with EUC-KR input containing invalid multibyte input sequences.
+ 
++  CVE-2021-3998: Passing a path longer than PATH_MAX to the realpath
++  function could result in a memory leak and potential access of
++  uninitialized memory.  Reported by Qualys.
++
+ The following bugs are resolved with this release:
+ 
+   [10635] libc: realpath portability patches
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
+@@ -86,7 +86,8 @@ tests		:= tst-strtol tst-strtod testmb t
+ 		   tst-makecontext-align test-bz22786 tst-strtod-nan-sign \
+ 		   tst-swapcontext1 tst-setcontext4 tst-setcontext5 \
+ 		   tst-setcontext6 tst-setcontext7 tst-setcontext8 \
+-		   tst-setcontext9 tst-bz20544 tst-canon-bz26341
++		   tst-setcontext9 tst-bz20544 tst-canon-bz26341 \
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
diff --git a/meta/recipes-core/glibc/glibc/0003-CVE-2021-3998.patch b/meta/recipes-core/glibc/glibc/0003-CVE-2021-3998.patch
new file mode 100644
index 0000000000..4e0423d0d3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-CVE-2021-3998.patch
@@ -0,0 +1,35 @@
+From 84d2d0fe20bdf94feed82b21b4d7d136db471f03 Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Mon, 24 Jan 2022 21:36:41 +0530
+Subject: [PATCH] realpath: Avoid overwriting preexisting error (CVE-2021-3998)
+
+Set errno and failure for paths that are too long only if no other error
+occurred earlier.
+
+Related: BZ #28770
+
+Reviewed-by: Andreas Schwab <schwab@linux-m68k.org>
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=84d2d0fe20bdf94feed82b21b4d7d136db471f03]
+CVE: CVE-2021-3998
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ stdlib/canonicalize.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stdlib/canonicalize.c b/stdlib/canonicalize.c
+index 732dc7ea46..6caed9e70e 100644
+--- a/stdlib/canonicalize.c
++++ b/stdlib/canonicalize.c
+@@ -404,7 +404,7 @@ error:
+     {
+       if (dest - rname <= get_path_max ())
+ 	rname = strcpy (resolved, rname);
+-      else
++      else if (!failed)
+ 	{
+ 	  failed = true;
+ 	  __set_errno (ENAMETOOLONG);
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index b7736359b1..55ca4ce2d3 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -57,6 +57,9 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0031-CVE-2021-43396.patch \
+           file://0001-CVE-2021-3998.patch \
+           file://0002-CVE-2021-3998.patch \
+           file://0003-CVE-2021-3998.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1


