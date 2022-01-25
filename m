Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB7CC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 11:26:49 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.5794.1643110008567906897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 03:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iUxg7Jgb;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id w6so23198693qtk.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 03:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=93PFEl1L20lcpPahjuFGJDTVIjarFF2CaW4uF9zqMHg=;
        b=iUxg7JgbVMsmCMT2Urk2kxDWBzibnPazdzhEYXbSo4RTenbxCswkJMFp67GSXK3so0
         3lLMjqUZ34VBDdadkTPCtn7MGc8y0gZjUBIgqF77L7z50LY7rRJW2B9zo0t6SHPNbge+
         R4k0fbcoKrzjyOJbvISjkSSGoiqXNOQ1uY2uPw/s8JSPfope8v5qqfZkJ/CZZNfzPRca
         7spf6BLmSDsTD5102sXYGUbDmsMzOSvqC6BbRGiNWST9RKrbGn9m+zMU8mFgyWRRnBTC
         h/A5ijSzqjspBlOc7bw5naj885C9mYobvcddRc37MlFxLW0NsE8L/LSOjBWrOo5Su/51
         JAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=93PFEl1L20lcpPahjuFGJDTVIjarFF2CaW4uF9zqMHg=;
        b=Ew3Xx2LSvt1wAe5kzYAhlHW5O4KnkQy9eUpBvNjlFqD7Jr6ak8MFGHoB0BF4mBR5+4
         1AKLJhoLarAO+LfLZRlzV5hvCAr2Ngo3yfgHSX1xpzrHrra8JFJwOvl/lrmCN6NHNSHK
         5IRRtt389Evfd4m4XyUHn9AiGo6V2KlTU6aRPBHfW8gYIOf+u8oeh2Tpy3KDomhGfiVW
         IRYaQ1vHVtzeEoz0PNJIEUosLMaO1eXHGXO793nkJSuoZ1Gz9Q5Axcy6tkQPiJQuVetb
         eeFm6XSignZ9SNYwxzJeujpsNoYcNfWvGocfGfCGBBgOlCx3O/JCU2zJXl1Kaq2jKHve
         zINg==
X-Gm-Message-State: AOAM530LZAUxD5JlSEuQi9F6NMuOLSeWfuWWC5Vm+M2Wxj4lnujSwRHR
	m7TelmpDgaGoPUUZHpQhR8U3gOUbCRTvhQ==
X-Google-Smtp-Source: 
 ABdhPJyX95I7trMB3QfQ82c1oIPRWPh9qzc93kVXWqbeVB8lUu9Gy32PXpaMEgvXaHTZAlNSAowhhA==
X-Received: by 2002:ac8:5f11:: with SMTP id x17mr2457304qta.539.1643110007344;
        Tue, 25 Jan 2022 03:26:47 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 j186sm8669999qkd.32.2022.01.25.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 03:26:47 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH 2/2] glibc : Fix CVE-2021-3999
Date: Tue, 25 Jan 2022 03:26:40 -0800
Message-Id: <20220125112640.109373-2-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125112640.109373-1-pgowda.cve@gmail.com>
References: <20220125112640.109373-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 11:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160916

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=976db046bc3a3738f69255ae00b0a09b8e77fd9c]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=23e0e8f5f1fb5ed150253d986ecccdc90c2dcd5e]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=1b9cd6a7214db1812a20eb3591cf42f9190a5d1a]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../glibc/glibc/0001-CVE-2021-3999.patch      |  35 ++
 .../glibc/glibc/0002-CVE-2021-3999.patch      | 356 ++++++++++++++++++
 .../glibc/glibc/0003-CVE-2021-3999.patch      |  28 ++
 meta/recipes-core/glibc/glibc_2.33.bb         |   3 +
 4 files changed, 422 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0003-CVE-2021-3999.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch
new file mode 100644
index 0000000000..dfe6cfb426
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2021-3999.patch
@@ -0,0 +1,35 @@
+From 976db046bc3a3738f69255ae00b0a09b8e77fd9c Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Mon, 24 Jan 2022 10:57:09 +0530
+Subject: [PATCH] tst-realpath-toolong: Fix hurd build
+
+Define PATH_MAX to a constant if it isn't already defined, like in hurd.
+
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=976db046bc3a3738f69255ae00b0a09b8e77fd9c]
+CVE: CVE-2021-3999
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ stdlib/tst-realpath-toolong.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/stdlib/tst-realpath-toolong.c b/stdlib/tst-realpath-toolong.c
+index 8bed772460..4388890294 100644
+--- a/stdlib/tst-realpath-toolong.c
++++ b/stdlib/tst-realpath-toolong.c
+@@ -29,6 +29,10 @@
+ 
+ #define BASENAME "tst-realpath-toolong."
+ 
++#ifndef PATH_MAX
++# define PATH_MAX 1024
++#endif
++
+ int
+ do_test (void)
+ {
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch
new file mode 100644
index 0000000000..c56856e82b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2021-3999.patch
@@ -0,0 +1,356 @@
+From 23e0e8f5f1fb5ed150253d986ecccdc90c2dcd5e Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Fri, 21 Jan 2022 23:32:56 +0530
+Subject: [PATCH] getcwd: Set errno to ERANGE for size == 1 (CVE-2021-3999)
+
+No valid path returned by getcwd would fit into 1 byte, so reject the
+size early and return NULL with errno set to ERANGE.  This change is
+prompted by CVE-2021-3999, which describes a single byte buffer
+underflow and overflow when all of the following conditions are met:
+
+- The buffer size (i.e. the second argument of getcwd) is 1 byte
+- The current working directory is too long
+- '/' is also mounted on the current working directory
+
+Sequence of events:
+
+- In sysdeps/unix/sysv/linux/getcwd.c, the syscall returns ENAMETOOLONG
+  because the linux kernel checks for name length before it checks
+  buffer size
+
+- The code falls back to the generic getcwd in sysdeps/posix
+
+- In the generic func, the buf[0] is set to '\0' on line 250
+
+- this while loop on line 262 is bypassed:
+
+    while (!(thisdev == rootdev && thisino == rootino))
+
+  since the rootfs (/) is bind mounted onto the directory and the flow
+  goes on to line 449, where it puts a '/' in the byte before the
+  buffer.
+
+- Finally on line 458, it moves 2 bytes (the underflowed byte and the
+  '\0') to the buf[0] and buf[1], resulting in a 1 byte buffer overflow.
+
+- buf is returned on line 469 and errno is not set.
+
+This resolves BZ #28769.
+
+Reviewed-by: Andreas Schwab <schwab@linux-m68k.org>
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+Signed-off-by: Qualys Security Advisory <qsa@qualys.com>
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=23e0e8f5f1fb5ed150253d986ecccdc90c2dcd5e]
+CVE: CVE-2021-3999
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ NEWS                                          |   6 +
+ sysdeps/posix/getcwd.c                        |   7 +
+ sysdeps/unix/sysv/linux/Makefile              |   7 +-
+ .../unix/sysv/linux/tst-getcwd-smallbuff.c    | 241 ++++++++++++++++++
+ 4 files changed, 260 insertions(+), 1 deletion(-)
+ create mode 100644 sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c
+
+diff --git a/NEWS b/NEWS
+index b4f81c2668..8d7467d2c1 100644
+--- a/NEWS
++++ b/NEWS
+@@ -152,6 +152,12 @@ Security related changes:
+   function could result in a memory leak and potential access of
+   uninitialized memory.  Reported by Qualys.
+ 
++  CVE-2021-3999: Passing a buffer of size exactly 1 byte to the getcwd
++  function may result in an off-by-one buffer underflow and overflow
++  when the current working directory is longer than PATH_MAX and also
++  corresponds to the / directory through an unprivileged mount
++  namespace.  Reported by Qualys.
++
+ The following bugs are resolved with this release:
+ 
+   [10635] libc: realpath portability patches
+diff --git a/sysdeps/posix/getcwd.c b/sysdeps/posix/getcwd.c
+index 13680026ff..b6984a382c 100644
+--- a/sysdeps/posix/getcwd.c
++++ b/sysdeps/posix/getcwd.c
+@@ -187,6 +187,13 @@ __getcwd_generic (char *buf, size_t size
+   size_t allocated = size;
+   size_t used;
+ 
++  /* A size of 1 byte is never useful.  */
++  if (allocated == 1)
++    {
++      __set_errno (ERANGE);
++      return NULL;
++    }
++
+ #if HAVE_MINIMALLY_WORKING_GETCWD
+   /* If AT_FDCWD is not defined, the algorithm below is O(N**2) and
+      this is much slower than the system getcwd (at least on
+diff --git a/sysdeps/unix/sysv/linux/Makefile b/sysdeps/unix/sysv/linux/Makefile
+index 76ad06361c..9380d3848d 100644
+--- a/sysdeps/unix/sysv/linux/Makefile
++++ b/sysdeps/unix/sysv/linux/Makefile
+@@ -282,7 +282,12 @@ sysdep_routines += xstatconv internal_st
+ 
+ sysdep_headers += bits/fcntl-linux.h
+ 
+-tests += tst-fallocate tst-fallocate64 tst-o_path-locks
++tests += \
++  tst-fallocate \
++  tst-fallocate64 \
++  tst-getcwd-smallbuff \
++  tst-o_path-locks \
++# tests
+ endif
+ 
+ ifeq ($(subdir),elf)
+diff --git a/sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c b/sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c
+new file mode 100644
+index 0000000000..d460d6e766
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/tst-getcwd-smallbuff.c
+@@ -0,0 +1,241 @@
++/* Verify that getcwd returns ERANGE for size 1 byte and does not underflow
++   buffer when the CWD is too long and is also a mount target of /.  See bug
++   #28769 or CVE-2021-3999 for more context.
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
++#include <fcntl.h>
++#include <intprops.h>
++#include <limits.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/mount.h>
++#include <sys/stat.h>
++#include <sys/types.h>
++#include <sys/wait.h>
++
++#include <sys/socket.h>
++#include <sys/un.h>
++#include <support/check.h>
++#include <support/temp_file.h>
++#include <support/xsched.h>
++#include <support/xunistd.h>
++
++static char *base;
++#define BASENAME "tst-getcwd-smallbuff"
++#define MOUNT_NAME "mpoint"
++static int sockfd[2];
++
++static void
++do_cleanup (void)
++{
++  support_chdir_toolong_temp_directory (base);
++  TEST_VERIFY_EXIT (rmdir (MOUNT_NAME) == 0);
++  free (base);
++}
++
++static void
++send_fd (const int sock, const int fd)
++{
++  struct msghdr msg = {0};
++  union
++    {
++      struct cmsghdr hdr;
++      char buf[CMSG_SPACE (sizeof (int))];
++    } cmsgbuf = {0};
++  struct cmsghdr *cmsg;
++  struct iovec vec;
++  char ch = 'A';
++  ssize_t n;
++
++  msg.msg_control = &cmsgbuf.buf;
++  msg.msg_controllen = sizeof (cmsgbuf.buf);
++
++  cmsg = CMSG_FIRSTHDR (&msg);
++  cmsg->cmsg_len = CMSG_LEN (sizeof (int));
++  cmsg->cmsg_level = SOL_SOCKET;
++  cmsg->cmsg_type = SCM_RIGHTS;
++  memcpy (CMSG_DATA (cmsg), &fd, sizeof (fd));
++
++  vec.iov_base = &ch;
++  vec.iov_len = 1;
++  msg.msg_iov = &vec;
++  msg.msg_iovlen = 1;
++
++  while ((n = sendmsg (sock, &msg, 0)) == -1 && errno == EINTR);
++
++  TEST_VERIFY_EXIT (n == 1);
++}
++
++static int
++recv_fd (const int sock)
++{
++  struct msghdr msg = {0};
++  union
++    {
++      struct cmsghdr hdr;
++      char buf[CMSG_SPACE(sizeof(int))];
++    } cmsgbuf = {0};
++  struct cmsghdr *cmsg;
++  struct iovec vec;
++  ssize_t n;
++  char ch = '\0';
++  int fd = -1;
++
++  vec.iov_base = &ch;
++  vec.iov_len = 1;
++  msg.msg_iov = &vec;
++  msg.msg_iovlen = 1;
++
++  msg.msg_control = &cmsgbuf.buf;
++  msg.msg_controllen = sizeof (cmsgbuf.buf);
++
++  while ((n = recvmsg (sock, &msg, 0)) == -1 && errno == EINTR);
++  if (n != 1 || ch != 'A')
++    return -1;
++
++  cmsg = CMSG_FIRSTHDR (&msg);
++  if (cmsg == NULL)
++    return -1;
++  if (cmsg->cmsg_type != SCM_RIGHTS)
++    return -1;
++  memcpy (&fd, CMSG_DATA (cmsg), sizeof (fd));
++  if (fd < 0)
++    return -1;
++  return fd;
++}
++
++static int
++child_func (void * const arg)
++{
++  xclose (sockfd[0]);
++  const int sock = sockfd[1];
++  char ch;
++
++  TEST_VERIFY_EXIT (read (sock, &ch, 1) == 1);
++  TEST_VERIFY_EXIT (ch == '1');
++
++  if (mount ("/", MOUNT_NAME, NULL, MS_BIND | MS_REC, NULL))
++    FAIL_EXIT1 ("mount failed: %m\n");
++  const int fd = xopen ("mpoint",
++			O_RDONLY | O_PATH | O_DIRECTORY | O_NOFOLLOW, 0);
++
++  send_fd (sock, fd);
++  xclose (fd);
++
++  TEST_VERIFY_EXIT (read (sock, &ch, 1) == 1);
++  TEST_VERIFY_EXIT (ch == 'a');
++
++  xclose (sock);
++  return 0;
++}
++
++static void
++update_map (char * const mapping, const char * const map_file)
++{
++  const size_t map_len = strlen (mapping);
++
++  const int fd = xopen (map_file, O_WRONLY, 0);
++  xwrite (fd, mapping, map_len);
++  xclose (fd);
++}
++
++static void
++proc_setgroups_write (const long child_pid, const char * const str)
++{
++  const size_t str_len = strlen(str);
++
++  char setgroups_path[sizeof ("/proc//setgroups") + INT_STRLEN_BOUND (long)];
++
++  snprintf (setgroups_path, sizeof (setgroups_path),
++	    "/proc/%ld/setgroups", child_pid);
++
++  const int fd = open (setgroups_path, O_WRONLY);
++
++  if (fd < 0)
++    {
++      TEST_VERIFY_EXIT (errno == ENOENT);
++      FAIL_UNSUPPORTED ("/proc/%ld/setgroups not found\n", child_pid);
++    }
++
++  xwrite (fd, str, str_len);
++  xclose(fd);
++}
++
++static char child_stack[1024 * 1024];
++
++int
++do_test (void)
++{
++  base = support_create_and_chdir_toolong_temp_directory (BASENAME);
++
++  xmkdir (MOUNT_NAME, S_IRWXU);
++  atexit (do_cleanup);
++
++  TEST_VERIFY_EXIT (socketpair (AF_UNIX, SOCK_STREAM, 0, sockfd) == 0);
++  pid_t child_pid = xclone (child_func, NULL, child_stack,
++			    sizeof (child_stack),
++			    CLONE_NEWUSER | CLONE_NEWNS | SIGCHLD);
++
++  xclose (sockfd[1]);
++  const int sock = sockfd[0];
++
++  char map_path[sizeof ("/proc//uid_map") + INT_STRLEN_BOUND (long)];
++  char map_buf[sizeof ("0  1") + INT_STRLEN_BOUND (long)];
++
++  snprintf (map_path, sizeof (map_path), "/proc/%ld/uid_map",
++	    (long) child_pid);
++  snprintf (map_buf, sizeof (map_buf), "0 %ld 1", (long) getuid());
++  update_map (map_buf, map_path);
++
++  proc_setgroups_write ((long) child_pid, "deny");
++  snprintf (map_path, sizeof (map_path), "/proc/%ld/gid_map",
++	    (long) child_pid);
++  snprintf (map_buf, sizeof (map_buf), "0 %ld 1", (long) getgid());
++  update_map (map_buf, map_path);
++
++  TEST_VERIFY_EXIT (send (sock, "1", 1, MSG_NOSIGNAL) == 1);
++  const int fd = recv_fd (sock);
++  TEST_VERIFY_EXIT (fd >= 0);
++  TEST_VERIFY_EXIT (fchdir (fd) == 0);
++
++  static char buf[2 * 10 + 1];
++  memset (buf, 'A', sizeof (buf));
++
++  /* Finally, call getcwd and check if it resulted in a buffer underflow.  */
++  char * cwd = getcwd (buf + sizeof (buf) / 2, 1);
++  TEST_VERIFY (cwd == NULL);
++  TEST_VERIFY (errno == ERANGE);
++
++  for (int i = 0; i < sizeof (buf); i++)
++    if (buf[i] != 'A')
++      {
++	printf ("buf[%d] = %02x\n", i, (unsigned int) buf[i]);
++	support_record_failure ();
++      }
++
++  TEST_VERIFY_EXIT (send (sock, "a", 1, MSG_NOSIGNAL) == 1);
++  xclose (sock);
++  TEST_VERIFY_EXIT (xwaitpid (child_pid, NULL, 0) == child_pid);
++
++  return 0;
++}
++
++#define CLEANUP_HANDLER do_cleanup
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/0003-CVE-2021-3999.patch b/meta/recipes-core/glibc/glibc/0003-CVE-2021-3999.patch
new file mode 100644
index 0000000000..75711080f7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-CVE-2021-3999.patch
@@ -0,0 +1,28 @@
+From 1b9cd6a7214db1812a20eb3591cf42f9190a5d1a Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Mon, 24 Jan 2022 23:45:03 +0100
+Subject: [PATCH] NEWS: add bug entry for BZ #28769 and BZ #28770
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=1b9cd6a7214db1812a20eb3591cf42f9190a5d1a]
+CVE: CVE-2021-3999
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ NEWS | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 8d7467d2c1..c063c78b15 100644
+--- a/NEWS
++++ b/NEWS
+@@ -34,6 +34,10 @@ The following bugs are resolved with thi
+   [27706] select fails to update timeout on error
+   [27744] Support different libpthread/ld.so load orders for gdb -p
+   [27892] powerpc: scv ABI error handling fails to check IS_ERR_VALUE
++  [28768] CVE-2022-23218: Buffer overflow in sunrpc svcunix_create
++  [28769] CVE-2021-3999: Off-by-one buffer overflow/underflow in getcwd()
++  [28770] CVE-2021-3998: Unexpected return value from realpath() for too long results
++
+ 
+ Version 2.33
+ 
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 55ca4ce2d3..a6ae02d205 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -60,6 +60,9 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-CVE-2021-3998.patch \
            file://0002-CVE-2021-3998.patch \
            file://0003-CVE-2021-3998.patch \
+           file://0001-CVE-2021-3999.patch \
+           file://0002-CVE-2021-3999.patch \
+           file://0003-CVE-2021-3999.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1


