Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6xUI-0002JM-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 07:40:19 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so2566884pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 22:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TK7NssvA0s6lDpe8jp9EWZX9kmGbVe8lUifBEduNmqM=;
	b=QbmfWzbeMQUkPXTiYzF9tcW2MTBDvKGoJIuSNVv/VPxKWxCf+gEhfFVJhLbDlUBVUv
	ETwVgxTuWU/L8Gh9zQhIlMUzAUiCvESp+siQ5OqeHgnP0jzL+iNu9hy7ohez9X5rvheE
	om+rpNsT+1kWG6oEopcOfBMECJLUfhx3ULs4tdxZNAo26Sj8Q49EGuLoYM/JFITk6oL3
	fDz0pfg2X3oXKY1pDbw37rQ0H2/Sfc4jthlIyAQPUb9QoCp8poWEZlTqkTC6dVXuWJHl
	S24c+YlkDgq6GkTzUUy4i6wNvTk0zOxH41zyijJwemOz9wv04/cWmNYTzTPT/Kplr8ez
	/3Uw==
Received: by 10.68.240.7 with SMTP id vw7mr9363177pbc.152.1346304485854;
	Wed, 29 Aug 2012 22:28:05 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uy3sm861924pbc.29.2012.08.29.22.28.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 22:28:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 22:27:20 -0700
Message-Id: <53bbfea3395479cc37ed842b29670758954a64c0.1346304324.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346304324.git.raj.khem@gmail.com>
References: <cover.1346304324.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] uclibc-git: Move to tip of master and sync mount.h
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
X-List-Received-Date: Thu, 30 Aug 2012 05:40:19 -0000

mount.h sync with glibc is needed to get new defines
which are needed for some packages like systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 .../uclibc/uclibc-git/mount.h-update.patch         |   83 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    2 -
 3 files changed, 86 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 60d36f4..eec4ded 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,9 +1,9 @@
-SRCREV="0dcc13bf7a61b1d0708e5dd103d5515e0ffec79a"
+SRCREV="555ae2e88cd16a83f854634b6c3f35715b11d3d4"
 
 DEFAULT_PREFERENCE = "-1"
 
 PV = "0.9.33+git${SRCPV}"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
@@ -25,5 +25,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch \
 	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
 	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
+	file://mount.h-update.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch b/meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch
new file mode 100644
index 0000000..41a410c
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch
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
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 2a60947..e8a6d68 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -1,5 +1,3 @@
-SRCREV="0dcc13bf7a61b1d0708e5dd103d5515e0ffec79a"
-
 require uclibc.inc
 require uclibc-package.inc
 require uclibc-git.inc
-- 
1.7.9.5



