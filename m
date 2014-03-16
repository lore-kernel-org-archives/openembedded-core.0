Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 84EC36F5B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:41:12 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so4324365pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mABHb1f5f4fTzGtEWvfqVCWVp4mHEP/Ws37jrErrYPI=;
	b=CYmLs53DktsAapJD6hSBAE5SMD87jyrpdiDejEUMA8CUmXbpanNsNEqDQqLTKzuGlh
	AYLT0zc4fiionlLVfXNU53yuBcxRB+t/LZ4nTK6XnJW/4bpaQu3rEL/1v6UY6oK5kMtE
	+eAzmp7nBJyuSzNCXuiJLIRjPTsBmN9Rmmfce6JlaEF7D4f/MkkHd7idRaXz3kXdOexJ
	RjEPrrrx+DXm99qDpb270RJUCxtiZkaOhDcEBM52nL9lBJhb8gg1HqQRTAFxl9rDKVag
	nsTvnodCGedNQOYqDXLc7lOzEECDwmL17AXG2xp9w4NNUJ41P6FL4M6+0niWbGcIinFs
	QyQw==
X-Received: by 10.68.189.5 with SMTP id ge5mr18444448pbc.42.1394948473604;
	Sat, 15 Mar 2014 22:41:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vo1sm51397193pab.32.2014.03.15.22.41.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:41:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:32 -0700
Message-Id: <2cc3249a26c648d6090b78de3034b1a9581346ef.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
References: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] Upgrade to systemd 211+
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:12 -0000

Fixes [YOCTO #5940]

Fix checks for %ms format to be a link time check
runtime checks wont work in cross compiling

Add a patch to workaround missing _SC_PHYS_PAGES
in uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  15 +-
 .../systemd-pam-configure-check-uclibc.patch       |  25 +-
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |  22 +-
 .../systemd/systemd-pam-fix-fallocate.patch        |  16 +-
 .../systemd/systemd-pam-fix-getty-unit.patch       |  20 +-
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch | 166 +---------
 .../systemd/systemd/systemd-pam-fix-msformat.patch | 348 ---------------------
 .../systemd/systemd/uclibc-get-physmem.patch       |  37 +++
 .../systemd/systemd/uclibc-sysinfo_h.patch         |  19 ++
 .../systemd/{systemd_208.bb => systemd_211.bb}     |  31 +-
 10 files changed, 136 insertions(+), 563 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch
 create mode 100644 meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
 rename meta/recipes-core/systemd/{systemd_208.bb => systemd_211.bb} (93%)

diff --git a/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch b/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
index e204a50..9fdb3c9 100644
--- a/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
+++ b/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
@@ -12,11 +12,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/libsystemd-bus/test-bus-memfd.c | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/src/libsystemd-bus/test-bus-memfd.c b/src/libsystemd-bus/test-bus-memfd.c
-index 05ef555..45e5e44 100644
---- a/src/libsystemd-bus/test-bus-memfd.c
-+++ b/src/libsystemd-bus/test-bus-memfd.c
-@@ -145,6 +145,7 @@ int main(int argc, char *argv[]) {
+Index: systemd-209/src/libsystemd/sd-bus/test-bus-memfd.c
+===================================================================
+--- systemd-209.orig/src/libsystemd/sd-bus/test-bus-memfd.c	2014-02-19 15:03:09.983254602 -0800
++++ systemd-209/src/libsystemd/sd-bus/test-bus-memfd.c	2014-02-19 23:42:10.636652864 -0800
+@@ -151,6 +151,7 @@
          /* check content */
          assert_se(memcmp(buf, "ll", 2) == 0);
  
@@ -24,7 +24,7 @@ index 05ef555..45e5e44 100644
          /* writev it out*/
          iov[0].iov_base = (char *)"ABC";
          iov[0].iov_len = 3;
-@@ -167,6 +168,7 @@ int main(int argc, char *argv[]) {
+@@ -173,6 +174,7 @@
          assert_se(memcmp(bufv[0], "ABC", 3) == 0);
          assert_se(memcmp(bufv[1], "DEF", 3) == 0);
          assert_se(memcmp(bufv[2], "GHI", 3) == 0);
@@ -32,6 +32,3 @@ index 05ef555..45e5e44 100644
  
          sd_memfd_free(m);
  
--- 
-1.8.3.4
-
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
index d096983..4639532 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
@@ -1,11 +1,13 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
---- systemd-185.orig/configure.ac	2012-06-04 14:15:16.000000000 -0400
-+++ systemd-pam-185/configure.ac	2012-06-21 22:57:10.000000000 -0400
-@@ -63,6 +63,23 @@
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2014-03-15 17:53:51.756340454 -0700
++++ git/configure.ac	2014-03-15 18:07:34.888355897 -0700
+@@ -78,6 +78,24 @@
  
- AC_PATH_PROG([M4], [m4])
+ M4_DEFINES=
  
 +# check for few functions not implemented in uClibc
 +
@@ -15,15 +17,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +AC_MSG_CHECKING([whether %ms format is supported by *scanf])
 +
-+AC_RUN_IFELSE(
-+	[AC_LANG_PROGRAM([[ include <stdio.h> ]],
-+			[[ char *buf1, *buf2, *buf3, str="1 2.3 abcde" ;
-+			   int rc = sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
-+			   return (rc==3)?0:1;]])],
++AC_LINK_IFELSE(
++	[AC_LANG_PROGRAM([ 
++	 #include <stdio.h>
++	 ],[
++	    char *buf1, *buf2, *buf3, str="1 2.3 abcde" ;
++	    int rc = sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
++	    return (rc==3)?0:1;])],
 +	[AC_DEFINE([HAVE_MSFORMAT], [1], [Define if %ms format is supported by *scanf.])],
-+	[AC_MSG_RESULT([no])],
 +	[AC_MSG_RESULT([no])])
 +
  # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
  m4_ifdef([GTK_DOC_CHECK], [
- GTK_DOC_CHECK([1.18],[--flavour no-tmpl])
+ GTK_DOC_CHECK([1.18],[--flavour no-tmpl])],
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
index 1d4f273..7170a38 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
@@ -1,11 +1,11 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/src/nspawn/nspawn.c
+Index: systemd-209/src/nspawn/nspawn.c
 ===================================================================
---- git.orig/src/nspawn/nspawn.c	2012-09-22 17:57:05.000000000 -0700
-+++ git/src/nspawn/nspawn.c	2012-09-22 18:01:41.541405768 -0700
-@@ -63,6 +63,8 @@
+--- systemd-209.orig/src/nspawn/nspawn.c	2014-02-19 15:03:09.000000000 -0800
++++ systemd-209/src/nspawn/nspawn.c	2014-02-19 23:20:38.720628627 -0800
+@@ -91,6 +91,8 @@
          LINK_GUEST
  } LinkJournal;
  
@@ -13,17 +13,17 @@ Index: git/src/nspawn/nspawn.c
 +
  static char *arg_directory = NULL;
  static char *arg_user = NULL;
- static char **arg_controllers = NULL;
-@@ -1373,7 +1375,12 @@
+ static sd_id128_t arg_uuid = {};
+@@ -2045,7 +2047,12 @@
                                  a[0] = (char*) "/sbin/init";
-                                 execve(a[0], a, (char**) envp);
+                                 execve(a[0], a, env_use);
                          } else if (argc > optind)
 +#ifdef HAVE_EXECVPE
-                                 execvpe(argv[optind], argv + optind, (char**) envp);
+                                 execvpe(argv[optind], argv + optind, env_use);
 +#else
-+                                environ = (char **)envp;
++                                environ = env_use;
 +                                execvp(argv[optind], argv + optind);
-+#endif /* HAVE_EXECVPE */			
++#endif /* HAVE_EXECVPE */                      
                          else {
                                  chdir(home ? home : "/root");
-                                 execle("/bin/bash", "-bash", NULL, (char**) envp);
+                                 execle("/bin/bash", "-bash", NULL, env_use);
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index 05223d3..de73be9 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/src/journal/journal-file.c
+Index: systemd-209/src/journal/journal-file.c
 ===================================================================
---- git.orig/src/journal/journal-file.c	2014-03-02 16:25:38.000000000 -0800
-+++ git/src/journal/journal-file.c	2014-03-02 16:27:24.151238740 -0800
+--- systemd-209.orig/src/journal/journal-file.c	2014-02-12 18:42:33.000000000 -0800
++++ systemd-209/src/journal/journal-file.c	2014-02-19 23:23:19.464631643 -0800
 @@ -38,6 +38,8 @@
  #include "compress.h"
  #include "fsprg.h"
@@ -48,11 +48,11 @@ Index: git/src/journal/journal-file.c
  
          if (fstat(f->fd, &f->last_stat) < 0)
                  return -errno;
-Index: git/src/journal/journald-kmsg.c
+Index: systemd-209/src/journal/journald-kmsg.c
 ===================================================================
---- git.orig/src/journal/journald-kmsg.c	2014-03-02 16:25:38.000000000 -0800
-+++ git/src/journal/journald-kmsg.c	2014-03-02 16:26:35.419237826 -0800
-@@ -408,6 +408,7 @@
+--- systemd-209.orig/src/journal/journald-kmsg.c	2014-02-19 15:03:09.000000000 -0800
++++ systemd-209/src/journal/journald-kmsg.c	2014-02-19 23:22:14.396630422 -0800
+@@ -441,6 +441,7 @@
  
  int server_open_kernel_seqnum(Server *s) {
          int fd;
@@ -60,7 +60,7 @@ Index: git/src/journal/journald-kmsg.c
          uint64_t *p;
  
          assert(s);
-@@ -421,8 +422,19 @@
+@@ -454,8 +455,19 @@
                  log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
                  return 0;
          }
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
index ceb8483..9b4c940 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
@@ -7,29 +7,29 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
  units/serial-getty@.service.m4 |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: systemd-206/units/getty@.service.m4
+Index: git/units/getty@.service.m4
 ===================================================================
---- systemd-206.orig/units/getty@.service.m4	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/units/getty@.service.m4	2013-08-21 08:45:48.569886828 -0700
+--- git.orig/units/getty@.service.m4	2014-03-15 08:16:17.000000000 -0700
++++ git/units/getty@.service.m4	2014-03-15 08:21:11.007695825 -0700
 @@ -27,7 +27,7 @@
  
  [Service]
  # the VT is cleared by TTYVTDisallocate
--ExecStart=-/sbin/agetty --noclear %I
-+ExecStart=-/sbin/getty -L %I
+-ExecStart=-/sbin/agetty --noclear %I $TERM
++ExecStart=-/sbin/getty -L %I $TERM
  Type=idle
  Restart=always
  RestartSec=0
-Index: systemd-206/units/serial-getty@.service.m4
+Index: git/units/serial-getty@.service.m4
 ===================================================================
---- systemd-206.orig/units/serial-getty@.service.m4	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/units/serial-getty@.service.m4	2013-08-21 08:48:52.337890275 -0700
+--- git.orig/units/serial-getty@.service.m4	2014-03-15 08:16:17.000000000 -0700
++++ git/units/serial-getty@.service.m4	2014-03-15 08:22:31.291697331 -0700
 @@ -22,7 +22,7 @@
  IgnoreOnIsolate=yes
  
  [Service]
--ExecStart=-/sbin/agetty --keep-baud %I 115200,38400,9600
-+ExecStart=-/sbin/getty -L %I 115200
+-ExecStart=-/sbin/agetty --keep-baud 115200,38400,9600 %I $TERM
++ExecStart=-/sbin/getty -L 115200 %I $TERM
  Type=idle
  Restart=always
  RestartSec=0
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
index 99ea573..8c7aa07 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
@@ -1,170 +1,30 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: systemd-206/src/journal/journal-send.c
+Index: git/src/shared/util.c
 ===================================================================
---- systemd-206.orig/src/journal/journal-send.c	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/src/journal/journal-send.c	2013-08-21 08:50:50.825892498 -0700
-@@ -46,6 +46,8 @@
-                 memcpy(*_f + 10, _func, _fl);     \
-         } while(false)
- 
-+#include "config.h"
-+
- /* We open a single fd, and we'll share it with the current process,
-  * all its threads, and all its subprocesses. This means we need to
-  * initialize it atomically, and need to operate on it atomically
-@@ -311,8 +313,13 @@
-         /* Message doesn't fit... Let's dump the data in a temporary
-          * file and just pass a file descriptor of it to the other
-          * side */
--
-+#ifdef HAVE_MKOSTEMP
-         buffer_fd = mkostemp(path, O_CLOEXEC|O_RDWR);
-+#else
-+        buffer_fd = mkstemp(path);
-+        if (buffer_fd >= 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
-+#endif /* HAVE_MKOSTEMP */
-+
-         if (buffer_fd < 0)
-                 return -errno;
- 
-Index: systemd-206/src/core/manager.c
-===================================================================
---- systemd-206.orig/src/core/manager.c	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/src/core/manager.c	2013-08-21 08:51:35.209893331 -0700
-@@ -71,6 +71,7 @@
- #include "audit-fd.h"
- #include "efivars.h"
- #include "env-util.h"
-+#include "config.h"
- 
- /* As soon as 5s passed since a unit was added to our GC queue, make sure to run a gc sweep */
- #define GC_QUEUE_USEC_MAX (10*USEC_PER_SEC)
-@@ -2058,7 +2059,12 @@
-                 return -ENOMEM;
- 
-         RUN_WITH_UMASK(0077) {
-+#ifdef HAVE_MKOSTEMP
-                 fd = mkostemp(path, O_RDWR|O_CLOEXEC);
-+#else
-+                fd = mkstemp(path);
-+                if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
-+#endif /* HAVE_MKOSTEMP */
-         }
- 
-         if (fd < 0) {
-Index: systemd-206/src/shared/util.c
-===================================================================
---- systemd-206.orig/src/shared/util.c	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/src/shared/util.c	2013-08-21 08:50:50.829892498 -0700
-@@ -74,6 +74,8 @@
- #include "env-util.h"
- #include "fileio.h"
+--- git.orig/src/shared/util.c	2014-03-15 15:14:21.368160908 -0700
++++ git/src/shared/util.c	2014-03-15 15:44:21.988194688 -0700
+@@ -85,6 +85,8 @@
+ #include "def.h"
+ #include "missing.h"
  
 +#include "config.h"
 +
  int saved_argc = 0;
  char **saved_argv = NULL;
  
-@@ -3980,7 +3982,12 @@
-         t[k] = '.';
-         stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
- 
-+#ifdef HAVE_MKOSTEMP
-         fd = mkostemp(t, O_WRONLY|O_CLOEXEC);
-+#else
-+	fd = mkstemp(t);
-+	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
-+#endif	/* HAVE_MKOSTEMP */
-         if (fd < 0) {
-                 free(t);
-                 return -errno;
-Index: systemd-206/src/shared/ask-password-api.c
-===================================================================
---- systemd-206.orig/src/shared/ask-password-api.c	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/src/shared/ask-password-api.c	2013-08-21 08:50:50.829892498 -0700
-@@ -37,6 +37,8 @@
- 
- #include "ask-password-api.h"
- 
-+#include "config.h"
-+
- static void backspace_chars(int ttyfd, size_t p) {
+@@ -6222,7 +6224,13 @@
  
-         if (ttyfd < 0)
-@@ -325,7 +327,12 @@
-         mkdir_p_label("/run/systemd/ask-password", 0755);
+         u = umask(077);
  
-         RUN_WITH_UMASK(0022) {
 +#ifdef HAVE_MKOSTEMP
-                 fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
+         fd = mkostemp(pattern, flags);
 +#else
-+                fd = mkstemp(temp);
-+                if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
-+#endif /* HAVE_MKOSTEMP */
-         }
- 
-         if (fd < 0) {
-Index: systemd-206/src/journal/journalctl.c
-===================================================================
---- systemd-206.orig/src/journal/journalctl.c	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/src/journal/journalctl.c	2013-08-21 08:50:50.833892498 -0700
-@@ -1005,7 +1005,13 @@
-         n /= arg_interval;
- 
-         close_nointr_nofail(fd);
-+#ifdef HAVE_MKOSTEMP
-         fd = mkostemp(k, O_WRONLY|O_CLOEXEC|O_NOCTTY);
-+#else
-+	fd = mkstemp(k);
-+	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++        fd = mkstemp(pattern);
++        if (fd >= 0) fcntl(fd, F_SETFD, flags);
 +#endif /* HAVE_MKOSTEMP */
 +
-         if (fd < 0) {
-                 log_error("Failed to open %s: %m", k);
-                 r = -errno;
-Index: systemd-206/src/journal/journal-verify.c
-===================================================================
---- systemd-206.orig/src/journal/journal-verify.c	2013-07-21 15:43:28.000000000 -0700
-+++ systemd-206/src/journal/journal-verify.c	2013-08-21 08:50:50.833892498 -0700
-@@ -811,8 +811,12 @@
- #endif
-         } else if (f->seal)
-                 return -ENOKEY;
--
-+#ifdef HAVE_MKOSTEMP
-         data_fd = mkostemp(data_path, O_CLOEXEC);
-+#else
-+	data_fd = mkstemp(data_path);
-+	if (data_fd >= 0) fcntl(data_fd, F_SETFD, FD_CLOEXEC);
-+#endif	/* HAVE_MKOSTEMP */
-         if (data_fd < 0) {
-                 log_error("Failed to create data file: %m");
-                 r = -errno;
-@@ -820,7 +824,12 @@
-         }
-         unlink(data_path);
- 
-+#ifdef HAVE_MKOSTEMP
-         entry_fd = mkostemp(entry_path, O_CLOEXEC);
-+#else
-+	entry_fd = mkstemp(entry_path);
-+	if (entry_fd >= 0) fcntl(entry_fd, F_SETFD, FD_CLOEXEC);
-+#endif	/* HAVE_MKOSTEMP */
-         if (entry_fd < 0) {
-                 log_error("Failed to create entry file: %m");
-                 r = -errno;
-@@ -828,7 +837,12 @@
-         }
-         unlink(entry_path);
+         if (fd < 0)
+                 return -errno;
  
-+#ifdef HAVE_MKOSTEMP
-         entry_array_fd = mkostemp(entry_array_path, O_CLOEXEC);
-+#else
-+	entry_array_fd = mkstemp(entry_array_path);
-+	if (entry_array_fd >= 0) fcntl(entry_array_fd, F_SETFD, FD_CLOEXEC);
-+#endif  /* HAVE_MKOSTEMP */
-         if (entry_array_fd < 0) {
-                 log_error("Failed to create entry array file: %m");
-                 r = -errno;
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
deleted file mode 100644
index e8a9144..0000000
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
+++ /dev/null
@@ -1,348 +0,0 @@
-Upstream-Status: Denied [no desire for uclibc support]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: systemd-208/src/fsck/fsck.c
-===================================================================
---- systemd-208.orig/src/fsck/fsck.c	2013-08-13 13:02:46.000000000 -0700
-+++ systemd-208/src/fsck/fsck.c	2013-11-05 22:01:26.776490078 -0800
-@@ -37,6 +37,8 @@
- #include "virt.h"
- #include "fileio.h"
- 
-+#include "config.h"
-+
- static bool arg_skip = false;
- static bool arg_force = false;
- static bool arg_show_progress = false;
-@@ -198,9 +200,16 @@
-                 char *device;
-                 double p;
-                 usec_t t;
--
-+#ifdef HAVE_MSFORMAT
-                 if (fscanf(f, "%i %lu %lu %ms", &pass, &cur, &max, &device) != 4)
--                        break;
-+#else
-+		device = malloc(257);
-+		if (fscanf(f, "%i %lu %lu %256s", &pass, &cur, &max, device) != 4) {
-+			free(device);
-+		}
-+
-+#endif /* HAVE_MSFORMAT */
-+			break;
- 
-                 /* Only show one progress counter at max */
-                 if (!locked) {
-Index: systemd-208/src/core/swap.c
-===================================================================
---- systemd-208.orig/src/core/swap.c	2013-09-26 11:20:30.000000000 -0700
-+++ systemd-208/src/core/swap.c	2013-11-05 22:01:26.776490078 -0800
-@@ -41,6 +41,8 @@
- #include "path-util.h"
- #include "virt.h"
- 
-+#include "config.h"
-+
- static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
-         [SWAP_DEAD] = UNIT_INACTIVE,
-         [SWAP_ACTIVATING] = UNIT_ACTIVATING,
-@@ -1041,6 +1043,7 @@
-                 _cleanup_free_ char *dev = NULL, *d = NULL;
-                 int prio = 0, k;
- 
-+#ifdef HAVE_MSFORMAT
-                 k = fscanf(m->proc_swaps,
-                            "%ms "  /* device/file */
-                            "%*s "  /* type of swap */
-@@ -1048,6 +1051,16 @@
-                            "%*s "  /* used */
-                            "%i\n", /* priority */
-                            &dev, &prio);
-+#else
-+                dev = malloc(257);
-+                k = fscanf(m->proc_swaps,
-+                           "%256s "/* device/file */
-+                           "%*s "  /* type of swap */
-+                           "%*s "  /* swap size */
-+                           "%*s "  /* used */
-+                           "%i\n", /* priority */
-+                           dev, &prio);
-+#endif /* HAVE_MSFORMAT */
-                 if (k != 2) {
-                         if (k == EOF)
-                                 break;
-Index: systemd-208/src/core/mount-setup.c
-===================================================================
---- systemd-208.orig/src/core/mount-setup.c	2013-08-13 13:02:46.000000000 -0700
-+++ systemd-208/src/core/mount-setup.c	2013-11-05 22:01:26.776490078 -0800
-@@ -28,6 +28,7 @@
- #include <assert.h>
- #include <unistd.h>
- #include <ftw.h>
-+#include <linux/fs.h>
- 
- #include "mount-setup.h"
- #include "dev-setup.h"
-@@ -43,6 +44,8 @@
- #include "virt.h"
- #include "efivars.h"
- 
-+#include "config.h"
-+
- #ifndef TTY_GID
- #define TTY_GID 5
- #endif
-@@ -233,9 +236,12 @@
-         for (;;) {
-                 char *controller;
-                 int enabled = 0;
--
-+#ifdef HAVE_MSFORMAT
-                 if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) != 2) {
--
-+#else
-+		controller = malloc(257);
-+                if (fscanf(f, "%256s %*i %*i %i", controller, &enabled) != 2) {
-+#endif /* HAVE_MSFORMAT */
-                         if (feof(f))
-                                 break;
- 
-Index: systemd-208/src/core/mount.c
-===================================================================
---- systemd-208.orig/src/core/mount.c	2013-09-26 11:20:30.000000000 -0700
-+++ systemd-208/src/core/mount.c	2013-11-05 22:07:43.784497482 -0800
-@@ -43,6 +43,8 @@
- #include "exit-status.h"
- #include "def.h"
- 
-+#include "config.h"
-+
- static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
-         [MOUNT_DEAD] = UNIT_INACTIVE,
-         [MOUNT_MOUNTING] = UNIT_ACTIVATING,
-@@ -1559,6 +1561,7 @@
-                 _cleanup_free_ char *device = NULL, *path = NULL, *options = NULL, *options2 = NULL, *fstype = NULL, *d = NULL, *p = NULL, *o = NULL;
-                 int k;
- 
-+#ifdef HAVE_MSFORMAT
-                 k = fscanf(m->proc_self_mountinfo,
-                            "%*s "       /* (1) mount id */
-                            "%*s "       /* (2) parent id */
-@@ -1577,7 +1580,31 @@
-                            &fstype,
-                            &device,
-                            &options2);
--
-+#else
-+                path = malloc(257);
-+                options = malloc(257);
-+                fstype = malloc(257);
-+                device = malloc(257);
-+                options2 = malloc(257);
-+                k = fscanf(m->proc_self_mountinfo,
-+                           "%*s "       /* (1) mount id */
-+                           "%*s "       /* (2) parent id */
-+                           "%*s "       /* (3) major:minor */
-+                           "%*s "       /* (4) root */
-+                           "%256s "     /* (5) mount point */
-+                           "%256s"      /* (6) mount options */
-+                           "%*[^-]"     /* (7) optional fields */
-+                           "- "         /* (8) separator */
-+                           "%256s "     /* (9) file system type */
-+                           "%256s"      /* (10) mount source */
-+                           "%256s"      /* (11) mount options 2 */
-+                           "%*[^\n]",   /* some rubbish at the end */
-+                           path,
-+                           options,
-+                           fstype,
-+                           device,
-+                           options2);
-+#endif /* HAVE_MSFORMAT */
-                 if (k == EOF)
-                         break;
- 
-Index: systemd-208/src/core/umount.c
-===================================================================
---- systemd-208.orig/src/core/umount.c	2013-08-13 13:02:46.000000000 -0700
-+++ systemd-208/src/core/umount.c	2013-11-05 22:01:26.776490078 -0800
-@@ -36,6 +36,8 @@
- #include "util.h"
- #include "virt.h"
- 
-+#include "config.h"
-+
- typedef struct MountPoint {
-         char *path;
-         dev_t devnum;
-@@ -75,7 +77,7 @@
-                 MountPoint *m;
- 
-                 path = p = NULL;
--
-+#ifdef HAVE_MSFORMAT
-                 if ((k = fscanf(proc_self_mountinfo,
-                                 "%*s "       /* (1) mount id */
-                                 "%*s "       /* (2) parent id */
-@@ -90,6 +92,23 @@
-                                 "%*s"        /* (11) mount options 2 */
-                                 "%*[^\n]",   /* some rubbish at the end */
-                                 &path)) != 1) {
-+#else
-+		path = malloc(257);
-+                if ((k = fscanf(proc_self_mountinfo,
-+                                "%*s "       /* (1) mount id */
-+                                "%*s "       /* (2) parent id */
-+                                "%*s "       /* (3) major:minor */
-+                                "%*s "       /* (4) root */
-+                                "%256s "     /* (5) mount point */
-+                                "%*s"        /* (6) mount options */
-+                                "%*[^-]"     /* (7) optional fields */
-+                                "- "         /* (8) separator */
-+                                "%*s "       /* (9) file system type */
-+                                "%*s"        /* (10) mount source */
-+                                "%*s"        /* (11) mount options 2 */
-+                                "%*[^\n]",   /* some rubbish at the end */
-+                                path)) != 1) {
-+#endif /* HAVE_MSFORMAT */
-                         if (k == EOF)
-                                 break;
- 
-@@ -151,7 +170,7 @@
-                 MountPoint *swap;
-                 char *dev = NULL, *d;
-                 int k;
--
-+#ifdef HAVE_MSFORMAT
-                 if ((k = fscanf(proc_swaps,
-                                 "%ms " /* device/file */
-                                 "%*s " /* type of swap */
-@@ -159,7 +178,16 @@
-                                 "%*s " /* used */
-                                 "%*s\n", /* priority */
-                                 &dev)) != 1) {
--
-+#else
-+		dev = malloc(257);
-+                if ((k = fscanf(proc_swaps,
-+                                "%256s " /* device/file */
-+                                "%*s " /* type of swap */
-+                                "%*s " /* swap size */
-+                                "%*s " /* used */
-+                                "%*s\n", /* priority */
-+                                dev)) != 1) {
-+#endif /* HAVE_MSFORMAT */
-                         if (k == EOF)
-                                 break;
- 
-Index: systemd-208/src/shared/socket-util.c
-===================================================================
---- systemd-208.orig/src/shared/socket-util.c	2013-09-26 11:20:30.000000000 -0700
-+++ systemd-208/src/shared/socket-util.c	2013-11-05 22:01:26.776490078 -0800
-@@ -40,6 +40,8 @@
- #include "missing.h"
- #include "fileio.h"
- 
-+#include "config.h"
-+
- int socket_address_parse(SocketAddress *a, const char *s) {
-         int r;
-         char *e, *n;
-@@ -203,8 +205,16 @@
-         a->type = SOCK_RAW;
- 
-         errno = 0;
-+#ifdef HAVE_MSFORMAT
-         if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
--                return errno > 0 ? -errno : -EINVAL;
-+                return errno ? -errno : -EINVAL;
-+#else
-+        sfamily = malloc(257);
-+        if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
-+                 free(sfamily);
-+                 return errno ? -errno : -EINVAL;
-+        }
-+#endif /* HAVE_MSFORMAT */
- 
-         family = netlink_family_from_string(sfamily);
-         if (family < 0)
-Index: systemd-208/src/tmpfiles/tmpfiles.c
-===================================================================
---- systemd-208.orig/src/tmpfiles/tmpfiles.c	2013-09-17 14:55:37.000000000 -0700
-+++ systemd-208/src/tmpfiles/tmpfiles.c	2013-11-05 22:01:26.776490078 -0800
-@@ -53,6 +53,8 @@
- #include "capability.h"
- #include "specifier.h"
- 
-+#include "config.h"
-+
- /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
-  * them in the file system. This is intended to be used to create
-  * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1082,6 +1084,7 @@
-         assert(line >= 1);
-         assert(buffer);
- 
-+#ifdef HAVE_MSFORMAT
-         r = sscanf(buffer,
-                    "%c %ms %ms %ms %ms %ms %n",
-                    &type,
-@@ -1091,6 +1094,29 @@
-                    &group,
-                    &age,
-                    &n);
-+#else
-+        i->path = malloc(257);
-+        mode = malloc(257);
-+        user = malloc(257);
-+        group = malloc(257);
-+        age = malloc(257);
-+        r = sscanf(buffer,
-+                   "%c "
-+                   "%256s "
-+                   "%256s "
-+                   "%256s "
-+                   "%256s "
-+                   "%256s "
-+                   "%n",
-+                   &type,
-+                   i->path,
-+                   mode,
-+                   user,
-+                   group,
-+                   age,
-+                   &n);
-+#endif /* HAVE_MSFORMAT */
-+
-         if (r < 2) {
-                 log_error("[%s:%u] Syntax error.", fname, line);
-                 return -EIO;
-Index: systemd-208/src/cryptsetup/cryptsetup-generator.c
-===================================================================
---- systemd-208.orig/src/cryptsetup/cryptsetup-generator.c	2013-09-30 09:57:04.000000000 -0700
-+++ systemd-208/src/cryptsetup/cryptsetup-generator.c	2013-11-05 22:01:26.776490078 -0800
-@@ -31,6 +31,8 @@
- #include "strv.h"
- #include "fileio.h"
- 
-+#include "config.h"
-+
- static const char *arg_dest = "/tmp";
- static bool arg_enabled = true;
- static bool arg_read_crypttab = true;
-@@ -420,7 +422,16 @@
-                         if (*l == '#' || *l == 0)
-                                 continue;
- 
-+#ifdef HAVE_MSFORMAT
-                         k = sscanf(l, "%ms %ms %ms %ms", &name, &device, &password, &options);
-+#else
-+                        name = malloc(257);
-+                        device = malloc(257);
-+                        password = malloc(257);
-+                        options = malloc(257);
-+                        k = sscanf(l, "%256s %256s %256s %256s", name, device, password, options);
-+#endif /* HAVE_MSFORMAT */
-+
-                         if (k < 2 || k > 4) {
-                                 log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
-                                 r = EXIT_FAILURE;
diff --git a/meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch b/meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch
new file mode 100644
index 0000000..39dfc9e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/uclibc-get-physmem.patch
@@ -0,0 +1,37 @@
+bypass unimplemented _SC_PHYS_PAGES system configuration API in uclibc
+
+Upstream-Status: Inappropriate [uclibc-specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/src/shared/util.c
+===================================================================
+--- git.orig/src/shared/util.c	2014-03-15 18:09:34.796358146 -0700
++++ git/src/shared/util.c	2014-03-15 20:16:33.836501084 -0700
+@@ -6332,11 +6332,24 @@
+ 
+         /* We return this as uint64_t in case we are running as 32bit
+          * process on a 64bit kernel with huge amounts of memory */
+-
++#ifdef __UCLIBC__
++        char line[128];
++        FILE *f = fopen("/proc/meminfo", "r");
++        if (f == NULL)
++                return 0;
++        while (!feof(f) && fgets(line, sizeof(line)-1, f)) {
++                if (sscanf(line, "MemTotal: %l kB", &mem) == 1) {
++                        mem *= 1024;
++                        break;
++                }
++        }
++        fclose(f);
++        return (uint64_t) mem;
++#else
+         mem = sysconf(_SC_PHYS_PAGES);
+         assert(mem > 0);
+-
+         return (uint64_t) mem * (uint64_t) page_size();
++#endif
+ }
+ 
+ char* mount_test_option(const char *haystack, const char *needle) {
diff --git a/meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch b/meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
new file mode 100644
index 0000000..15645de
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
@@ -0,0 +1,19 @@
+Dont include sys/sysinfo.h on uclibc it conflicts with linux/sysinfo.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [uclibc specific]
+
+Index: systemd-209/src/readahead/readahead-common.c
+===================================================================
+--- systemd-209.orig/src/readahead/readahead-common.c	2014-02-12 18:42:33.810685053 -0800
++++ systemd-209/src/readahead/readahead-common.c	2014-02-19 23:49:31.856661142 -0800
+@@ -22,7 +22,9 @@
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <string.h>
++#ifndef __UCLIBC__
+ #include <sys/sysinfo.h>
++#endif
+ #include <sys/inotify.h>
+ #include <fcntl.h>
+ #include <sys/mman.h>
diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_211.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd_208.bb
rename to meta/recipes-core/systemd/systemd_211.bb
index 98da15c..044aab5 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -17,14 +17,22 @@ SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
 
-SRCREV = "255eb046a7bcb90e60a3a54302bc1250c1aed26a"
+SRCREV = "3a450ec5c6adf3057bcedd6cc19c10617abc35a5"
 
-PV = "208+git${SRCPV}"
+PV = "211+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v208-stable;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
            file://binfmt-install.patch \
+           file://systemd-pam-configure-check-uclibc.patch \
+           file://systemd-pam-fix-execvpe.patch \
+           file://systemd-pam-fix-fallocate.patch \
+           file://systemd-pam-fix-mkostemp.patch \
+           file://optional_secure_getenv.patch \
+           file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
+           file://uclibc-sysinfo_h.patch \
+           file://uclibc-get-physmem.patch \
+           \
            file://touchscreen.rules \
-           ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
@@ -32,17 +40,10 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v208-stab
 
 S = "${WORKDIR}/git"
 
-UCLIBCPATCHES = ""
-UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
-                             file://systemd-pam-fix-execvpe.patch \
-                             file://systemd-pam-fix-fallocate.patch \
+SRC_URI_append_libc-uclibc = "\
                              file://systemd-pam-fix-getty-unit.patch \
-                             file://systemd-pam-fix-mkostemp.patch \
-                             file://systemd-pam-fix-msformat.patch \
-                             file://optional_secure_getenv.patch \
-                             file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
                             "
-LDFLAGS_libc-uclibc_append = " -lrt"
+LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
@@ -74,6 +75,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --disable-manpages \
                  --disable-coredump \
                  --disable-introspection \
+                 --disable-kdbus \
                  --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
@@ -92,6 +94,8 @@ do_configure_prepend() {
 		cp -r ${S}/units ${S}/units.pre_sed
 	fi
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
+	sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
+	sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
 }
 
 do_install() {
@@ -215,6 +219,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${libdir}/libnss_myhostname.so.2 \
                 /cgroup \
                 ${bindir}/systemd* \
+                ${bindir}/busctl \
                 ${bindir}/localectl \
                 ${bindir}/hostnamectl \
                 ${bindir}/timedatectl \
-- 
1.9.0


