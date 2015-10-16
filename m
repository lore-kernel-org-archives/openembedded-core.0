Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B122C7570D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:11 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so15287262pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=56NFXoSKQyouEXEOJNr8dYjhNStnVVGNe/j4HVboI78=;
	b=h30y1iQaN5pCJuW4LkdKmZbAYnBJXVIJbf3O08OSKM+0GDb7shSU867p0E9je1SGmQ
	0RyRwpi90MZ/aVintb/70Si3jeyYXKk6m6LgFfgZlg7JcnhKpywScYi11BYDd390ITRK
	cHKfyAbTdnzjCkMAB67+R5pyUYFjW7iTqPbgend9sHkBBUK1EowMxmMtyFsa6nTpjjRL
	p6HWbTApLxBuCINH91M5ru7BxuXP9oSwmlnsvgJbcVV3OPYFRKvWN/BpuG+tjO7x6mNQ
	hyPtTv1Z91gBzT5L8MfDneos7KB3vvDs7S5CC657kd0pfz8Ho5Ql86730Y6I9TaWPA8v
	a1Mw==
X-Received: by 10.66.226.37 with SMTP id rp5mr15060526pac.49.1444982411914;
	Fri, 16 Oct 2015 01:00:11 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 01:00:03 -0700
Message-Id: <aa2862d38cab4fda701166a859ebbede6c6fb40c.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 9/9] uclibc: Implement syncfs and AT_EMPTY_PATH for all and O_PATH for arm
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:11 -0000

needed for systemd 225 to compile with uclibc

Change-Id: Id5f990edf4a773de49742f9f9ea5139e55e21f69
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  2 +
 ...-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch | 42 +++++++++++++++++++
 .../uclibc/uclibc-git/0001-wire-in-syncfs.patch    | 49 ++++++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 9e3d644..dcb616d 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -17,5 +17,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
         file://0006-ldso-limited-support-for-ORIGIN-in-rpath.patch \
         file://0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
         file://0001-gcc5-optimizes-away-the-write-only-static-functions-.patch \
+        file://0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch \
+        file://0001-wire-in-syncfs.patch \
 "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch b/meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
new file mode 100644
index 0000000..6942db4
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
@@ -0,0 +1,42 @@
+From 4c8f5fe7d41493e8e181941ae5a01713155f44d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Oct 2015 15:34:39 +0000
+Subject: [PATCH] fcntl: Add AT_EMPTY_PATH for all and O_PATH for arm
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ include/fcntl.h                     | 3 +++
+ libc/sysdeps/linux/arm/bits/fcntl.h | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/include/fcntl.h b/include/fcntl.h
+index 11000dd..8a7ad9b 100644
+--- a/include/fcntl.h
++++ b/include/fcntl.h
+@@ -65,6 +65,9 @@ __BEGIN_DECLS
+ # define AT_SYMLINK_FOLLOW	0x400	/* Follow symbolic links.  */
+ # define AT_EACCESS		0x200	/* Test access permitted for
+ 					   effective IDs, not real IDs.  */
++# ifdef __USE_GNU
++#  define AT_EMPTY_PATH         0x1000  /* Allow empty relative pathname.  */
++# endif
+ #endif
+ 
+ /* Do the file control operation described by CMD on FD.
+diff --git a/libc/sysdeps/linux/arm/bits/fcntl.h b/libc/sysdeps/linux/arm/bits/fcntl.h
+index aedc154..c6ba958 100644
+--- a/libc/sysdeps/linux/arm/bits/fcntl.h
++++ b/libc/sysdeps/linux/arm/bits/fcntl.h
+@@ -50,6 +50,7 @@
+ # define O_DIRECT	0200000	/* Direct disk access.	*/
+ # define O_NOATIME     01000000 /* Do not set atime.  */
+ # define O_CLOEXEC     02000000 /* Set close_on_exec.  */
++# define O_PATH       010000000 /* Resolve pathname but do not open file.  */
+ #endif
+ 
+ /* For now Linux has synchronisity options for data and read operations.
+-- 
+2.6.1
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch b/meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
new file mode 100644
index 0000000..079ad6b
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
@@ -0,0 +1,49 @@
+From 4f2db1b46bda5e376245ec36198b137709f069e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Oct 2015 17:03:37 +0000
+Subject: [PATCH] wire in syncfs
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ include/unistd.h                   |  2 +-
+ libc/sysdeps/linux/common/syncfs.c | 13 +++++++++++++
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+ create mode 100644 libc/sysdeps/linux/common/syncfs.c
+
+diff --git a/include/unistd.h b/include/unistd.h
+index 3793d2d..d01bb08 100644
+--- a/include/unistd.h
++++ b/include/unistd.h
+@@ -1073,7 +1073,7 @@ extern char *getpass (const char *__prompt) __nonnull ((1));
+ extern int fsync (int __fd);
+ #endif /* Use BSD || X/Open || Unix98.  */
+ 
+-#if 0 /*def __USE_GNU */
++#ifdef __USE_GNU
+ /* Make all changes done to all files on the file system associated
+  *    with FD actually appear on disk.  */
+ extern int syncfs (int __fd) __THROW;
+diff --git a/libc/sysdeps/linux/common/syncfs.c b/libc/sysdeps/linux/common/syncfs.c
+new file mode 100644
+index 0000000..d2eed05
+--- /dev/null
++++ b/libc/sysdeps/linux/common/syncfs.c
+@@ -0,0 +1,13 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * fsync() for uClibc
++ *
++ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <unistd.h>
++
++_syscall1(int, syncfs, int, fd)
+-- 
+2.6.1
+
-- 
2.6.1


