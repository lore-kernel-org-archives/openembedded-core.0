Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T8a1e-0001zE-R9
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 19:01:27 +0200
Received: by pbcwy7 with SMTP id wy7so8633927pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=EA8pTNpzFHRQWzg27T3HZ/VRNi7wrFboELCwVgEfZLA=;
	b=umyjY6Ft+a4oc5fddIfkL6UxKsat8lXdSEjaR71akAG8Tx/ZYI31Ljvbe4OFFxYNLB
	Zt0tQGVRGN+RSKpqsavNpB+MXKbtfhO9Cji7Z7nBv2oPECVfoJJociJA4jimboiYpfrh
	dioLUe0latNWPFz6+jGB0P533srfiTSs3TBls7HFkdgYLo54VaxhtZ72u/wKvMiGO0ds
	zSpTtFJ8VD5sR30EDJL1LAmz3A94Q5i06D22LnRXyos1RpLSbElpHxi7iESIZ6tOD7ME
	d+dt79R7oApUdCErTCwFOdplVXvlr2Zv+ludjiks5a1rtgoPfz6uOqaUET+CyRfDNdqB
	CLxg==
Received: by 10.68.228.100 with SMTP id sh4mr39307727pbc.45.1346690945412;
	Mon, 03 Sep 2012 09:49:05 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vh7sm10255419pbc.22.2012.09.03.09.49.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 09:49:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 09:48:15 -0700
Message-Id: <1346690895-11290-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] uclibc-0.9.33: Update to latest on 0.9.33 branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 17:01:27 -0000

Apply mount.h sync patch which is needed for
systemd to work.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-0.9.33.inc         |    5 +-
 .../uclibc/uclibc-0.9.33/mount.h-update.patch      |   83 ++++++++++++++++++++
 .../uclibc/uclibc-0.9.33/posix_fallocate.patch     |   37 +++++----
 3 files changed, 104 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/mount.h-update.patch

diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33.inc b/meta/recipes-core/uclibc/uclibc-0.9.33.inc
index f03dd2e..653f3c6 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.33.inc
+++ b/meta/recipes-core/uclibc/uclibc-0.9.33.inc
@@ -1,6 +1,6 @@
-SRCREV="7810e4f8027b5c4c8ceec6fefec4eb779362ebb5"
+SRCREV = "fec308fdfaf9f557ef5fb17c308c48259012b825"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
 	file://uClibc.machine \
@@ -17,6 +17,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
 	file://dup3.patch \
 	file://define-MSG_CMSG_CLOEXEC.patch \
 	file://posix_fallocate.patch \
+	file://mount.h-update.patch \
 	"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/mount.h-update.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/mount.h-update.patch
new file mode 100644
index 0000000..41a410c
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-0.9.33/mount.h-update.patch
@@ -0,0 +1,83 @@
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+sync mount.h with glibc
+
+Index: git/include/sys/mount.h
+===================================================================
+--- git.orig/include/sys/mount.h	2012-08-23 21:26:51.038825295 -0700
++++ git/include/sys/mount.h	2012-08-23 21:27:09.914826014 -0700
+@@ -1,5 +1,5 @@
+ /* Header file for mounting/unmount Linux filesystems.
+-   Copyright (C) 1996,1997,1998,1999,2000,2004 Free Software Foundation, Inc.
++   Copyright (C) 1996-2000, 2004, 2010 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -47,23 +47,46 @@
+ #define MS_REMOUNT	MS_REMOUNT
+   MS_MANDLOCK = 64,		/* Allow mandatory locks on an FS.  */
+ #define MS_MANDLOCK	MS_MANDLOCK
+-  S_WRITE = 128,		/* Write on file/directory/symlink.  */
+-#define S_WRITE		S_WRITE
+-  S_APPEND = 256,		/* Append-only file.  */
+-#define S_APPEND	S_APPEND
+-  S_IMMUTABLE = 512,		/* Immutable file.  */
+-#define S_IMMUTABLE	S_IMMUTABLE
++  MS_DIRSYNC = 128,		/* Directory modifications are synchronous.  */
++#define MS_DIRSYNC	MS_DIRSYNC
+   MS_NOATIME = 1024,		/* Do not update access times.  */
+ #define MS_NOATIME	MS_NOATIME
+   MS_NODIRATIME = 2048,		/* Do not update directory access times.  */
+ #define MS_NODIRATIME	MS_NODIRATIME
+   MS_BIND = 4096,		/* Bind directory at different place.  */
+ #define MS_BIND		MS_BIND
++  MS_MOVE = 8192,
++#define MS_MOVE		MS_MOVE
++  MS_REC = 16384,
++#define MS_REC		MS_REC
++  MS_SILENT = 32768,
++#define MS_SILENT	MS_SILENT
++  MS_POSIXACL = 1 << 16,	/* VFS does not apply the umask.  */
++#define MS_POSIXACL	MS_POSIXACL
++  MS_UNBINDABLE = 1 << 17,	/* Change to unbindable.  */
++#define MS_UNBINDABLE	MS_UNBINDABLE
++  MS_PRIVATE = 1 << 18,		/* Change to private.  */
++#define MS_PRIVATE	MS_PRIVATE
++  MS_SLAVE = 1 << 19,		/* Change to slave.  */
++#define MS_SLAVE	MS_SLAVE
++  MS_SHARED = 1 << 20,		/* Change to shared.  */
++#define MS_SHARED	MS_SHARED
++  MS_RELATIME = 1 << 21,	/* Update atime relative to mtime/ctime.  */
++#define MS_RELATIME	MS_RELATIME
++  MS_KERNMOUNT = 1 << 22,	/* This is a kern_mount call.  */
++#define MS_KERNMOUNT	MS_KERNMOUNT
++  MS_I_VERSION =  1 << 23,	/* Update inode I_version field.  */
++#define MS_I_VERSION	MS_I_VERSION
++  MS_STRICTATIME = 1 << 24,	/* Always perform atime updates.  */
++#define MS_STRICTATIME	MS_STRICTATIME
++  MS_ACTIVE = 1 << 30,
++#define MS_ACTIVE	MS_ACTIVE
++  MS_NOUSER = 1 << 31
++#define MS_NOUSER	MS_NOUSER
+ };
+ 
+ /* Flags that can be altered by MS_REMOUNT  */
+-#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_NOATIME \
+-		     |MS_NODIRATIME)
++#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)
+ 
+ 
+ /* Magic mount flag number. Has to be or-ed to the flag values.  */
+@@ -100,8 +123,10 @@
+ #define MNT_FORCE MNT_FORCE
+   MNT_DETACH = 2,		/* Just detach from the tree.  */
+ #define MNT_DETACH MNT_DETACH
+-  MNT_EXPIRE = 4		/* Mark for expiry.  */
++  MNT_EXPIRE = 4,		/* Mark for expiry.  */
+ #define MNT_EXPIRE MNT_EXPIRE
++  UMOUNT_NOFOLLOW = 8		/* Don't follow symlink on umount.  */
++#define UMOUNT_NOFOLLOW UMOUNT_NOFOLLOW
+ };
+ 
+ 
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch b/meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch
index 6dfd16f..b55fbbd 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch
+++ b/meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch
@@ -101,8 +101,8 @@ Upstream-Status: Pending
 
 Index: git/include/fcntl.h
 ===================================================================
---- git.orig/include/fcntl.h	2012-06-26 14:51:04.000000000 -0700
-+++ git/include/fcntl.h	2012-06-26 14:51:36.361767240 -0700
+--- git.orig/include/fcntl.h	2012-09-02 17:00:26.000000000 -0700
++++ git/include/fcntl.h	2012-09-02 17:01:51.567076705 -0700
 @@ -210,9 +210,7 @@
  
  #endif
@@ -116,22 +116,21 @@ Index: git/include/fcntl.h
  
 Index: git/libc/sysdeps/linux/common/Makefile.in
 ===================================================================
---- git.orig/libc/sysdeps/linux/common/Makefile.in	2012-06-26 14:51:04.000000000 -0700
-+++ git/libc/sysdeps/linux/common/Makefile.in	2012-06-26 14:52:33.153769997 -0700
-@@ -81,7 +81,8 @@
+--- git.orig/libc/sysdeps/linux/common/Makefile.in	2012-09-02 17:00:26.000000000 -0700
++++ git/libc/sysdeps/linux/common/Makefile.in	2012-09-02 17:03:02.739079369 -0700
+@@ -81,7 +81,7 @@
  	sched_get_priority_max.c sched_get_priority_min.c sched_getscheduler.c \
  	sched_rr_get_interval.c sched_setparam.c sched_setscheduler.c sigqueue.c
  # clock_getcpuclockid|clock_nanosleep|mq_timedreceive|mq_timedsend|posix_fadvise|posix_fallocate|posix_madvise|posix_memalign|posix_mem_offset|posix_spawnattr_destroy|posix_spawnattr_init|posix_spawnattr_getflags|posix_spawnattr_setflags|posix_spawnattr_getpgroup|posix_spawnattr_setpgroup|posix_spawnattr_getschedparam|posix_spawnattr_setschedparam|posix_spawnattr_getschedpolicy|posix_spawnattr_setschedpolicy|posix_spawnattr_getsigdefault|posix_spawnattr_setsigdefault|posix_spawnattr_getsigmask|posix_spawnattr_setsigmask|posix_spawnattr_init|posix_spawnattr_setflags|posix_spawnattr_setpgroup|posix_spawnattr_setschedparam|posix_spawnattr_setschedpolicy|posix_spawnattr_setsigdefault|posix_spawnattr_setsigmask|posix_spawn_file_actions_addclose|posix_spawn_file_actions_addopen|posix_spawn_file_actions_adddup2|posix_spawn_file_actions_addopen|posix_spawn_file_actions_destroy|posix_spawn_file_actions_init|posix_spawn_file_actions_init|posix_spawn|posix_spawnp|posix_spawnp|posix_typed_mem_get_info|pthread_mutex_timedlock|sem_timedwait
--CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c
-+CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c \
-+	posix_fallocate.c posix_fallocate64.c
+-CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c
++CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c posix_fallocate.c posix_fallocate64.c
  CSRC-$(UCLIBC_SUSV4_LEGACY) += utime.c
  CSRC-$(UCLIBC_HAS_EPOLL) += epoll.c
  CSRC-$(UCLIBC_HAS_XATTR) += xattr.c
 Index: git/libc/sysdeps/linux/common/bits/kernel-features.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/common/bits/kernel-features.h	2012-06-26 14:51:04.000000000 -0700
-+++ git/libc/sysdeps/linux/common/bits/kernel-features.h	2012-06-26 14:51:36.361767240 -0700
+--- git.orig/libc/sysdeps/linux/common/bits/kernel-features.h	2012-09-02 17:00:26.000000000 -0700
++++ git/libc/sysdeps/linux/common/bits/kernel-features.h	2012-09-02 17:01:51.567076705 -0700
 @@ -494,6 +494,14 @@
  # define __ASSUME_PRIVATE_FUTEX	1
  #endif
@@ -150,7 +149,7 @@ Index: git/libc/sysdeps/linux/common/bits/kernel-features.h
 Index: git/libc/sysdeps/linux/common/posix_fallocate.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/common/posix_fallocate.c	2012-06-26 14:51:36.373767243 -0700
++++ git/libc/sysdeps/linux/common/posix_fallocate.c	2012-09-02 17:01:51.579076667 -0700
 @@ -0,0 +1,43 @@
 +/* vi: set sw=4 ts=4: */
 +/*
@@ -198,7 +197,7 @@ Index: git/libc/sysdeps/linux/common/posix_fallocate.c
 Index: git/libc/sysdeps/linux/common/posix_fallocate64.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/common/posix_fallocate64.c	2012-06-26 14:51:36.373767243 -0700
++++ git/libc/sysdeps/linux/common/posix_fallocate64.c	2012-09-02 17:01:51.579076667 -0700
 @@ -0,0 +1,39 @@
 +/* vi: set sw=4 ts=4: */
 +/*
@@ -241,8 +240,8 @@ Index: git/libc/sysdeps/linux/common/posix_fallocate64.c
 +#endif
 Index: git/libc/sysdeps/linux/common/stubs.c
 ===================================================================
---- git.orig/libc/sysdeps/linux/common/stubs.c	2012-06-26 14:51:04.000000000 -0700
-+++ git/libc/sysdeps/linux/common/stubs.c	2012-06-26 14:53:48.997773660 -0700
+--- git.orig/libc/sysdeps/linux/common/stubs.c	2012-09-02 17:00:26.000000000 -0700
++++ git/libc/sysdeps/linux/common/stubs.c	2012-09-02 17:01:51.579076667 -0700
 @@ -209,6 +209,10 @@
  make_stub(madvise)
  #endif
@@ -256,8 +255,8 @@ Index: git/libc/sysdeps/linux/common/stubs.c
  #endif
 Index: git/test/.gitignore
 ===================================================================
---- git.orig/test/.gitignore	2012-06-26 14:51:04.000000000 -0700
-+++ git/test/.gitignore	2012-06-26 14:51:36.373767243 -0700
+--- git.orig/test/.gitignore	2012-09-02 17:00:26.000000000 -0700
++++ git/test/.gitignore	2012-09-02 17:01:51.579076667 -0700
 @@ -302,6 +302,7 @@
  unistd/getopt
  unistd/getopt_long
@@ -268,8 +267,8 @@ Index: git/test/.gitignore
  unistd/vfork
 Index: git/test/unistd/Makefile.in
 ===================================================================
---- git.orig/test/unistd/Makefile.in	2012-06-26 14:51:05.000000000 -0700
-+++ git/test/unistd/Makefile.in	2012-06-26 14:51:36.373767243 -0700
+--- git.orig/test/unistd/Makefile.in	2012-09-02 17:00:26.000000000 -0700
++++ git/test/unistd/Makefile.in	2012-09-02 17:01:51.579076667 -0700
 @@ -4,6 +4,9 @@
  ifeq ($(UCLIBC_HAS_LFS),)
  TESTS_DISABLED := tst-preadwrite64
@@ -283,7 +282,7 @@ Index: git/test/unistd/Makefile.in
 Index: git/test/unistd/tst-posix_fallocate.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/unistd/tst-posix_fallocate.c	2012-06-26 14:51:36.373767243 -0700
++++ git/test/unistd/tst-posix_fallocate.c	2012-09-02 17:01:51.579076667 -0700
 @@ -0,0 +1,121 @@
 +#include <fcntl.h>
 +#include <sys/stat.h>
-- 
1.7.9.5



