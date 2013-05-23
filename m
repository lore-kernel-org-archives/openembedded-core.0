Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 551386086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 18:38:44 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id bi5so3337991pad.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YgAewiUVswmOXBK5Trc68unX98w3DC39oumf+4h9K3s=;
	b=EfMxC091t1m5UC5vSpDuzrLMXEvNSqGUkDE7r9Uc8uKnGsn8oXeleeFXSzklkBZph2
	yf+f9dTIkkzyX8LDXa4tsk4OzKNVTQsDC/0mr6D8wYOxr0ixIvHrgPspPGeRtaIL+CHJ
	bTJ7TqKt5ymPeH6zXLYKbSwPAz/ULrzTzKAjHdFyGV+vUI/MMTf4+s0LOYDkhBooJv/I
	CekaDNsNvl3SkNG5U2T0zuzpDi/WNrTCI8LSbcdWMeu5jnLlTrFzhKsJwaCxrpseMUuB
	z0Db4w9I5nKth4EhhnHOfTYz2ET34fQB5L+kRWMY+w6Zci5xgvl1rL3lKUU5IOr4vIfb
	BuLA==
X-Received: by 10.66.253.74 with SMTP id zy10mr14625671pac.123.1369334325097; 
	Thu, 23 May 2013 11:38:45 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	rn7sm12708542pbc.12.2013.05.23.11.38.43 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 11:38:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 11:36:55 -0700
Message-Id: <1369334215-22193-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd: forward port uclibc patches to 204
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
X-List-Received-Date: Thu, 23 May 2013 18:38:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  110 ++++++++++----------
 .../systemd/systemd/systemd-pam-fix-msformat.patch |   86 +++++++--------
 2 files changed, 99 insertions(+), 97 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
index fb8443d..0ea2da3 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
@@ -1,72 +1,74 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/src/journal/journal-send.c
+Index: systemd-204/src/journal/journal-send.c
 ===================================================================
---- git.orig/src/journal/journal-send.c	2012-09-02 00:10:08.748768268 -0700
-+++ git/src/journal/journal-send.c	2012-09-02 00:10:10.508768335 -0700
-@@ -34,6 +34,8 @@
- 
- #define SNDBUF_SIZE (8*1024*1024)
+--- systemd-204.orig/src/journal/journal-send.c	2013-05-06 12:06:04.000000000 -0700
++++ systemd-204/src/journal/journal-send.c	2013-05-23 11:21:14.500338688 -0700
+@@ -46,6 +46,8 @@
+                 memcpy(*_f + 10, _func, _fl);     \
+         } while(false)
  
 +#include "config.h"
 +
  /* We open a single fd, and we'll share it with the current process,
   * all its threads, and all its subprocesses. This means we need to
   * initialize it atomically, and need to operate on it atomically
-@@ -293,7 +295,12 @@
+@@ -312,8 +314,13 @@
+         /* Message doesn't fit... Let's dump the data in a temporary
           * file and just pass a file descriptor of it to the other
           * side */
- 
+-
 +#ifdef HAVE_MKOSTEMP
          buffer_fd = mkostemp(path, O_CLOEXEC|O_RDWR);
 +#else
-+	buffer_fd = mkstemp(path);
-+	if (buffer_fd >= 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
-+#endif	/* HAVE_MKOSTEMP */
-         if (buffer_fd < 0) {
-                 r = -errno;
-                 goto finish;
-Index: git/src/core/manager.c
++        buffer_fd = mkstemp(path);
++        if (buffer_fd >= 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
++#endif /* HAVE_MKOSTEMP */
++
+         if (buffer_fd < 0)
+                 return -errno;
+ 
+Index: systemd-204/src/core/manager.c
 ===================================================================
---- git.orig/src/core/manager.c	2012-09-02 00:10:08.732768266 -0700
-+++ git/src/core/manager.c	2012-09-02 00:10:10.512768334 -0700
-@@ -67,6 +67,8 @@
- #include "cgroup-util.h"
- #include "path-util.h"
+--- systemd-204.orig/src/core/manager.c	2013-04-25 17:53:56.000000000 -0700
++++ systemd-204/src/core/manager.c	2013-05-23 11:23:15.864340878 -0700
+@@ -72,6 +72,8 @@
+ #include "audit-fd.h"
+ #include "env-util.h"
  
 +#include "config.h"
 +
  /* As soon as 16 units are in our GC queue, make sure to run a gc sweep */
  #define GC_QUEUE_ENTRIES_MAX 16
  
-@@ -1701,7 +1703,12 @@
+@@ -1973,7 +1975,12 @@
                  return -ENOMEM;
  
-         saved_umask = umask(0077);
+         RUN_WITH_UMASK(0077) {
 +#ifdef HAVE_MKOSTEMP
-         fd = mkostemp(path, O_RDWR|O_CLOEXEC);
+                 fd = mkostemp(path, O_RDWR|O_CLOEXEC);
 +#else
-+	fd = mkstemp(path);
-+	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
-+#endif	/* HAVE_MKOSTEMP */
-         umask(saved_umask);
++                fd = mkstemp(path);
++                if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif /* HAVE_MKOSTEMP */
+         }
  
          if (fd < 0) {
-Index: git/src/shared/util.c
+Index: systemd-204/src/shared/util.c
 ===================================================================
---- git.orig/src/shared/util.c	2012-09-02 00:10:08.784768269 -0700
-+++ git/src/shared/util.c	2012-09-02 00:10:10.512768334 -0700
-@@ -68,6 +68,8 @@
- #include "exit-status.h"
- #include "hashmap.h"
+--- systemd-204.orig/src/shared/util.c	2013-05-07 12:07:22.000000000 -0700
++++ systemd-204/src/shared/util.c	2013-05-23 11:19:35.028336822 -0700
+@@ -74,6 +74,8 @@
+ #include "env-util.h"
+ #include "fileio.h"
  
 +#include "config.h"
 +
  int saved_argc = 0;
  char **saved_argv = NULL;
  
-@@ -4519,7 +4521,12 @@
+@@ -3921,7 +3923,12 @@
          t[k] = '.';
          stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
  
@@ -79,10 +81,10 @@ Index: git/src/shared/util.c
          if (fd < 0) {
                  free(t);
                  return -errno;
-Index: git/src/shared/ask-password-api.c
+Index: systemd-204/src/shared/ask-password-api.c
 ===================================================================
---- git.orig/src/shared/ask-password-api.c	2012-09-02 00:10:08.772768268 -0700
-+++ git/src/shared/ask-password-api.c	2012-09-02 00:10:10.512768334 -0700
+--- systemd-204.orig/src/shared/ask-password-api.c	2013-04-08 08:26:34.000000000 -0700
++++ systemd-204/src/shared/ask-password-api.c	2013-05-23 11:24:43.456342451 -0700
 @@ -37,6 +37,8 @@
  
  #include "ask-password-api.h"
@@ -92,24 +94,24 @@ Index: git/src/shared/ask-password-api.c
  static void backspace_chars(int ttyfd, size_t p) {
  
          if (ttyfd < 0)
-@@ -326,7 +328,12 @@
+@@ -325,7 +327,12 @@
          mkdir_p_label("/run/systemd/ask-password", 0755);
  
-         u = umask(0022);
+         RUN_WITH_UMASK(0022) {
 +#ifdef HAVE_MKOSTEMP
-         fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
+                 fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
 +#else
-+	fd = mkstemp(temp);
-+	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
-+#endif	/* HAVE_MKOSTEMP */
-         umask(u);
++                fd = mkstemp(temp);
++                if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif /* HAVE_MKOSTEMP */
+         }
  
          if (fd < 0) {
-Index: git/src/journal/journalctl.c
+Index: systemd-204/src/journal/journalctl.c
 ===================================================================
---- git.orig/src/journal/journalctl.c	2012-09-02 00:10:08.752768267 -0700
-+++ git/src/journal/journalctl.c	2012-09-02 00:18:41.928787779 -0700
-@@ -540,7 +540,13 @@
+--- systemd-204.orig/src/journal/journalctl.c	2013-05-07 12:07:22.000000000 -0700
++++ systemd-204/src/journal/journalctl.c	2013-05-23 11:19:35.028336822 -0700
+@@ -755,7 +755,13 @@
          n /= arg_interval;
  
          close_nointr_nofail(fd);
@@ -123,11 +125,11 @@ Index: git/src/journal/journalctl.c
          if (fd < 0) {
                  log_error("Failed to open %s: %m", k);
                  r = -errno;
-Index: git/src/journal/journal-verify.c
+Index: systemd-204/src/journal/journal-verify.c
 ===================================================================
---- git.orig/src/journal/journal-verify.c	2012-09-02 00:10:08.752768267 -0700
-+++ git/src/journal/journal-verify.c	2012-09-02 00:24:10.268800268 -0700
-@@ -693,8 +693,12 @@
+--- systemd-204.orig/src/journal/journal-verify.c	2012-11-20 13:42:23.000000000 -0800
++++ systemd-204/src/journal/journal-verify.c	2013-05-23 11:19:35.032336822 -0700
+@@ -700,8 +700,12 @@
  #endif
          } else if (f->seal)
                  return -ENOKEY;
@@ -141,7 +143,7 @@ Index: git/src/journal/journal-verify.c
          if (data_fd < 0) {
                  log_error("Failed to create data file: %m");
                  r = -errno;
-@@ -702,7 +706,12 @@
+@@ -709,7 +713,12 @@
          }
          unlink(data_path);
  
@@ -154,7 +156,7 @@ Index: git/src/journal/journal-verify.c
          if (entry_fd < 0) {
                  log_error("Failed to create entry file: %m");
                  r = -errno;
-@@ -710,7 +719,12 @@
+@@ -717,7 +726,12 @@
          }
          unlink(entry_path);
  
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
index 8d1aa7d..77bb305 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: systemd-198/src/fsck/fsck.c
+Index: systemd-204/src/fsck/fsck.c
 ===================================================================
---- systemd-198.orig/src/fsck/fsck.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/fsck/fsck.c	2013-03-09 14:49:03.756572873 -0800
+--- systemd-204.orig/src/fsck/fsck.c	2013-04-02 05:48:49.000000000 -0700
++++ systemd-204/src/fsck/fsck.c	2013-05-23 11:26:51.776345015 -0700
 @@ -37,6 +37,8 @@
  #include "virt.h"
  #include "fileio.h"
@@ -14,7 +14,7 @@ Index: systemd-198/src/fsck/fsck.c
  static bool arg_skip = false;
  static bool arg_force = false;
  static bool arg_show_progress = false;
-@@ -203,9 +205,16 @@
+@@ -198,9 +200,16 @@
                  char *device;
                  double p;
                  usec_t t;
@@ -33,10 +33,10 @@ Index: systemd-198/src/fsck/fsck.c
  
                  /* Only show one progress counter at max */
                  if (!locked) {
-Index: systemd-198/src/core/swap.c
+Index: systemd-204/src/core/swap.c
 ===================================================================
---- systemd-198.orig/src/core/swap.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/core/swap.c	2013-03-09 14:49:03.756572873 -0800
+--- systemd-204.orig/src/core/swap.c	2013-05-06 12:06:04.000000000 -0700
++++ systemd-204/src/core/swap.c	2013-05-23 11:26:51.780345015 -0700
 @@ -41,6 +41,8 @@
  #include "path-util.h"
  #include "virt.h"
@@ -46,7 +46,7 @@ Index: systemd-198/src/core/swap.c
  static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
          [SWAP_DEAD] = UNIT_INACTIVE,
          [SWAP_ACTIVATING] = UNIT_ACTIVATING,
-@@ -1037,6 +1039,7 @@
+@@ -1055,6 +1057,7 @@
                  char *dev = NULL, *d;
                  int prio = 0, k;
  
@@ -54,7 +54,7 @@ Index: systemd-198/src/core/swap.c
                  k = fscanf(m->proc_swaps,
                             "%ms "  /* device/file */
                             "%*s "  /* type of swap */
-@@ -1044,6 +1047,16 @@
+@@ -1062,6 +1065,16 @@
                             "%*s "  /* used */
                             "%i\n", /* priority */
                             &dev, &prio);
@@ -71,10 +71,10 @@ Index: systemd-198/src/core/swap.c
                  if (k != 2) {
                          if (k == EOF)
                                  break;
-Index: systemd-198/src/core/mount-setup.c
+Index: systemd-204/src/core/mount-setup.c
 ===================================================================
---- systemd-198.orig/src/core/mount-setup.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/core/mount-setup.c	2013-03-09 14:49:03.760572872 -0800
+--- systemd-204.orig/src/core/mount-setup.c	2013-04-24 06:34:38.000000000 -0700
++++ systemd-204/src/core/mount-setup.c	2013-05-23 11:26:51.780345015 -0700
 @@ -28,6 +28,7 @@
  #include <assert.h>
  #include <unistd.h>
@@ -92,7 +92,7 @@ Index: systemd-198/src/core/mount-setup.c
  #ifndef TTY_GID
  #define TTY_GID 5
  #endif
-@@ -231,9 +234,12 @@
+@@ -233,9 +236,12 @@
          for (;;) {
                  char *controller;
                  int enabled = 0;
@@ -107,11 +107,11 @@ Index: systemd-198/src/core/mount-setup.c
                          if (feof(f))
                                  break;
  
-Index: systemd-198/src/core/mount.c
+Index: systemd-204/src/core/mount.c
 ===================================================================
---- systemd-198.orig/src/core/mount.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/core/mount.c	2013-03-09 14:49:03.760572872 -0800
-@@ -42,6 +42,8 @@
+--- systemd-204.orig/src/core/mount.c	2013-05-06 12:06:04.000000000 -0700
++++ systemd-204/src/core/mount.c	2013-05-23 11:26:51.780345015 -0700
+@@ -43,6 +43,8 @@
  #include "exit-status.h"
  #include "def.h"
  
@@ -120,7 +120,7 @@ Index: systemd-198/src/core/mount.c
  static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
          [MOUNT_DEAD] = UNIT_INACTIVE,
          [MOUNT_MOUNTING] = UNIT_ACTIVATING,
-@@ -1584,7 +1586,7 @@
+@@ -1626,7 +1628,7 @@
                  int k;
  
                  device = path = options = options2 = fstype = d = p = o = NULL;
@@ -129,7 +129,7 @@ Index: systemd-198/src/core/mount.c
                  if ((k = fscanf(m->proc_self_mountinfo,
                                  "%*s "       /* (1) mount id */
                                  "%*s "       /* (2) parent id */
-@@ -1603,7 +1605,31 @@
+@@ -1645,7 +1647,31 @@
                                  &fstype,
                                  &device,
                                  &options2)) != 5) {
@@ -162,10 +162,10 @@ Index: systemd-198/src/core/mount.c
                          if (k == EOF)
                                  break;
  
-Index: systemd-198/src/core/umount.c
+Index: systemd-204/src/core/umount.c
 ===================================================================
---- systemd-198.orig/src/core/umount.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/core/umount.c	2013-03-09 14:49:03.760572872 -0800
+--- systemd-204.orig/src/core/umount.c	2013-04-18 08:14:11.000000000 -0700
++++ systemd-204/src/core/umount.c	2013-05-23 11:26:51.780345015 -0700
 @@ -36,6 +36,8 @@
  #include "util.h"
  #include "virt.h"
@@ -235,10 +235,10 @@ Index: systemd-198/src/core/umount.c
                          if (k == EOF)
                                  break;
  
-Index: systemd-198/src/shared/socket-util.c
+Index: systemd-204/src/shared/socket-util.c
 ===================================================================
---- systemd-198.orig/src/shared/socket-util.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/shared/socket-util.c	2013-03-09 14:49:03.760572872 -0800
+--- systemd-204.orig/src/shared/socket-util.c	2013-04-18 08:14:11.000000000 -0700
++++ systemd-204/src/shared/socket-util.c	2013-05-23 11:30:53.528348084 -0700
 @@ -40,6 +40,8 @@
  #include "missing.h"
  #include "fileio.h"
@@ -252,25 +252,25 @@ Index: systemd-198/src/shared/socket-util.c
          a->type = SOCK_RAW;
  
          errno = 0;
--        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
 +#ifdef HAVE_MSFORMAT
-+	if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
+         if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
+-                return errno > 0 ? -errno : -EINVAL;
 +                return errno ? -errno : -EINVAL;
 +#else
-+	sfamily = malloc(257);
-+	if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
-+		free(sfamily);
-                 return errno ? -errno : -EINVAL;
-+	}
++        sfamily = malloc(257);
++        if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
++                 free(sfamily);
++                 return errno ? -errno : -EINVAL;
++        }
 +#endif /* HAVE_MSFORMAT */
  
          family = netlink_family_from_string(sfamily);
          if (family < 0)
-Index: systemd-198/src/tmpfiles/tmpfiles.c
+Index: systemd-204/src/tmpfiles/tmpfiles.c
 ===================================================================
---- systemd-198.orig/src/tmpfiles/tmpfiles.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/tmpfiles/tmpfiles.c	2013-03-09 14:55:40.772566599 -0800
-@@ -51,6 +51,8 @@
+--- systemd-204.orig/src/tmpfiles/tmpfiles.c	2013-04-24 06:34:38.000000000 -0700
++++ systemd-204/src/tmpfiles/tmpfiles.c	2013-05-23 11:26:51.784345016 -0700
+@@ -52,6 +52,8 @@
  #include "conf-files.h"
  #include "capability.h"
  
@@ -279,7 +279,7 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -993,6 +995,7 @@
+@@ -1029,6 +1031,7 @@
          if (!i)
                  return log_oom();
  
@@ -287,7 +287,7 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c
          r = sscanf(buffer,
                     "%c %ms %ms %ms %ms %ms %n",
                     &type,
-@@ -1002,6 +1005,29 @@
+@@ -1038,6 +1041,29 @@
                     &group,
                     &age,
                     &n);
@@ -316,11 +316,11 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c
 +
          if (r < 2) {
                  log_error("[%s:%u] Syntax error.", fname, line);
-                 r = -EIO;
-Index: systemd-198/src/cryptsetup/cryptsetup-generator.c
+                 return -EIO;
+Index: systemd-204/src/cryptsetup/cryptsetup-generator.c
 ===================================================================
---- systemd-198.orig/src/cryptsetup/cryptsetup-generator.c	2013-03-07 13:18:34.000000000 -0800
-+++ systemd-198/src/cryptsetup/cryptsetup-generator.c	2013-03-09 14:51:33.080571639 -0800
+--- systemd-204.orig/src/cryptsetup/cryptsetup-generator.c	2013-05-06 12:06:04.000000000 -0700
++++ systemd-204/src/cryptsetup/cryptsetup-generator.c	2013-05-23 11:26:51.784345016 -0700
 @@ -31,6 +31,8 @@
  #include "strv.h"
  #include "fileio.h"
@@ -330,7 +330,7 @@ Index: systemd-198/src/cryptsetup/cryptsetup-generator.c
  static const char *arg_dest = "/tmp";
  static bool arg_enabled = true;
  static bool arg_read_crypttab = true;
-@@ -395,7 +397,16 @@
+@@ -398,7 +400,16 @@
                          if (*l == '#' || *l == 0)
                                  continue;
  
-- 
1.7.9.5


