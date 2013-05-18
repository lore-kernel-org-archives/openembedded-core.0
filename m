Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UdX3t-000435-94
	for openembedded-core@lists.openembedded.org;
	Sat, 18 May 2013 04:40:04 +0200
Received: by mail-pb0-f52.google.com with SMTP id xa7so3809415pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 19:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=CZTHoYUi0SH22D3twA8iBY/o+ezNcNEh9IDtevY9sdI=;
	b=wcfkUjiojjkh+jt5az6Ei3aejLBAzlvZlphVLdpHIAk62R/IJLklriYZGlNkDpeeex
	hzak0iSQe18rz1wb01v9qXEXXK4lQ5vfH/DJrb98pIgUB98r2yeVrQYe13SuzYDpL3Qp
	iikhuPWkFyp5J/oUzqR8JTHnKvhXkPWSlBqiEBOlULRyDQRtwoJRJeXpOsN3W9SMx3Hs
	L76r3KQD3lftFofmIysHtre3RQDWGuXZds1MFx679SuQDnyzdIGV8NGKFhxJbMaYdoS1
	gkWSjYCKVejQZZ8aszUL/BWmzdBLcsb2yVdEY/Ggq/dU6ciCfWecSToOir24c51AgiII
	YXTQ==
X-Received: by 10.66.190.234 with SMTP id gt10mr41781680pac.136.1368843700086; 
	Fri, 17 May 2013 19:21:40 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id sg4sm13501881pbc.7.2013.05.17.19.21.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 19:21:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2013 12:34:40 +1000
Message-Id: <1368844480-3963-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] util-linux: Update to 2.23
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
X-List-Received-Date: Sat, 18 May 2013 02:40:10 -0000

Remove license patch as it is integrated upstream.
Add backports of upstream loopdev regression fixes.
Updated uclibc-__progname-conflict.patch because it didn't apply.
Added bash-completion and partx sub-packages.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |  5 +-
 ...-fix-loopcxt_check_size-to-work-with-blkd.patch | 60 +++++++++++++++++
 ...etup-use-warn_size-for-regular-files-only.patch | 29 ++++++++
 .../util-linux/util-linux/mbsalign-license.patch   | 78 ----------------------
 .../util-linux/uclibc-__progname-conflict.patch    | 15 +++--
 .../{util-linux_2.22.2.bb => util-linux_2.23.bb}   | 11 +--
 6 files changed, 107 insertions(+), 91 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/mbsalign-license.patch
 rename meta/recipes-core/util-linux/{util-linux_2.22.2.bb => util-linux_2.23.bb} (55%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c783385..b4e64b5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -34,7 +34,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-libmount util-linux-libmount-dev \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-             util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-uuidd"
+             util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-uuidd \
+             util-linux-partx ${PN}-bash-completion"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-makeinstall-chown --enable-elvtune --enable-init \
@@ -52,6 +53,7 @@ EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemds
 
 EXTRA_OECONF_append_class-native = " --disable-login --disable-su"
 
+FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
@@ -67,6 +69,7 @@ FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-reset = "${base_bindir}/reset"
+FILES_util-linux-partx = "${sbindir}/partx"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch b/meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
new file mode 100644
index 0000000..d1093f2
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+From e3b6cb87e0ba1304fa07ec316784de1c6243b28e Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 13 May 2013 10:54:41 +0200
+Subject: [PATCH] lib/loopdev: fix loopcxt_check_size() to work with blkdevs
+
+The loopcxt_check_size() is workaround for kernels < v3.9, kernel has
+been fixed by commit 541c742a7559eb65f0e36d3e2338c2ca532a3e61.
+
+The function sets loopdev size according to backing file size. The
+problem is that the backing file could be a block device where
+stat.st_size is zero, so we have to use blkdev_get_size() for block
+devices.
+
+Addresses: https://bugs.archlinux.org/task/35193
+Reported-by: Dave Reisner <d@falconindy.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ lib/loopdev.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index c35e306..3b65b5d 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1097,7 +1097,17 @@ static int loopcxt_check_size(struct loopdev_cxt *lc, int file_fd)
+ 	if (fstat(file_fd, &st))
+ 		return -errno;
+ 
+-	expected_size = st.st_size;
++	if (S_ISBLK(st.st_mode)) {
++		if (blkdev_get_size(file_fd,
++				(unsigned long long *) &expected_size))
++			return -errno;
++	} else
++		expected_size = st.st_size;
++
++	if (expected_size == 0 || expected_size <= lc->info.lo_offset) {
++		DBG(lc, loopdev_debug("failed to determine expected size"));
++		return 0;	/* ignore this error */
++	}
+ 
+ 	if (lc->info.lo_offset > 0)
+ 		expected_size -= lc->info.lo_offset;
+@@ -1113,6 +1123,10 @@ static int loopcxt_check_size(struct loopdev_cxt *lc, int file_fd)
+ 		return -errno;
+ 
+ 	if (expected_size != size) {
++		DBG(lc, loopdev_debug("warning: loopdev and expected "
++				      "size dismatch (%ju/%ju)",
++				      size, expected_size));
++
+ 		if (loopcxt_set_capacity(lc)) {
+ 			/* ioctl not available */
+ 			if (errno == ENOTTY || errno == EINVAL)
+-- 
+1.8.2.3
+
diff --git a/meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch b/meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
new file mode 100644
index 0000000..3382e7f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+From b048b8af3a5568c90f6e0c2d56f6cb399dedb0d1 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 13 May 2013 11:00:47 +0200
+Subject: [PATCH] losetup: use warn_size() for regular files only
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ sys-utils/losetup.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/losetup.c b/sys-utils/losetup.c
+index ccf120e..b44c9e5 100644
+--- a/sys-utils/losetup.c
++++ b/sys-utils/losetup.c
+@@ -380,7 +380,7 @@ static void warn_size(const char *filename, uint64_t size)
+ 	struct stat st;
+ 
+ 	if (!size) {
+-		if (stat(filename, &st))
++		if (stat(filename, &st) || S_ISBLK(st.st_mode))
+ 			return;
+ 		size = st.st_size;
+ 	}
+-- 
+1.8.2.3
+
diff --git a/meta/recipes-core/util-linux/util-linux/mbsalign-license.patch b/meta/recipes-core/util-linux/util-linux/mbsalign-license.patch
deleted file mode 100644
index b2c3652..0000000
--- a/meta/recipes-core/util-linux/util-linux/mbsalign-license.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-
-Upstream-Status: Backport
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Notes from Pdraig (via email) :
-
-Actually LGPLv2+ is most appropriate for that.
-The intent is that it's licensed under the LGPL anyway:
-
-$ gnulib/gnulib-tool --local-dir gl --extract-license mbsalign
-LGPL
-
-When extracting this to util-linux I should have adjusted
-the boilerplate default license in the file (which gnulib-tool
-can do on import).
-
-
-From 16d8546964db1f6a27ae0f1d1cd24ce42704111d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Fri, 15 Mar 2013 09:48:37 +0000
-Subject: [PATCH] lib/mbsalign: correct license header from GPLv[23] to
- LGPLv2+
-
-* lib/mbsalign.c: s/GPLv3/LGPLv2+/
-* include/mbsalign.h: s/GPLv2/LGPLv2+/
-* README.licensing: Remove mention GPLv3 as it's not actually used.
----
- README.licensing   |    2 --
- include/mbsalign.h |    4 ++--
- lib/mbsalign.c     |    4 ++--
- 3 files changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/README.licensing b/README.licensing
-index b29883c..ab60004 100644
---- a/README.licensing
-+++ b/README.licensing
-@@ -2,8 +2,6 @@
- The project util-linux doesn't use the same license for all of the code.
- There is code under:
- 
--   * GPLv3+ (GNU General Public License version 3, or any later version)
--
-    * GPLv2+ (GNU General Public License version 2, or any later version)
- 
-    * GPLv2 (GNU General Public License version 2)
-diff --git a/include/mbsalign.h b/include/mbsalign.h
-index fd957b3..8c9f2db 100644
---- a/include/mbsalign.h
-+++ b/include/mbsalign.h
-@@ -2,8 +2,8 @@
-    Copyright (C) 2009-2010 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify
--   it under the terms of the GNU General Public License as published by
--   the Free Software Foundation, either version 2 of the License, or
-+   it under the terms of the GNU Lesser General Public License as published by
-+   the Free Software Foundation, either version 2.1 of the License, or
-    (at your option) any later version.
- 
-    This program is distributed in the hope that it will be useful,
-diff --git a/lib/mbsalign.c b/lib/mbsalign.c
-index d97bbd5..05c4650 100644
---- a/lib/mbsalign.c
-+++ b/lib/mbsalign.c
-@@ -2,8 +2,8 @@
-    Copyright (C) 2009-2010 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify
--   it under the terms of the GNU General Public License as published by
--   the Free Software Foundation, either version 3 of the License, or
-+   it under the terms of the GNU Lesser General Public License as published by
-+   the Free Software Foundation, either version 2.1 of the License, or
-    (at your option) any later version.
- 
-    This program is distributed in the hope that it will be useful,
--- 
-1.7.7.6
-
diff --git a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
index 5b743cb..5031a73 100644
--- a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
+++ b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
@@ -14,6 +14,7 @@ make[3]: *** [cache.lo] Error 1
 
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
 
 Upstream-Status: Pending
 Index: util-linux-2.22.1/configure.ac
@@ -22,10 +23,10 @@ Index: util-linux-2.22.1/configure.ac
 +++ util-linux-2.22.1/configure.ac
 @@ -372,7 +372,7 @@ esac
  
- 
- AC_MSG_CHECKING(whether program_invocation_short_name is defined)
--AC_TRY_COMPILE([#include <argp.h>],
-+AC_TRY_COMPILE([#include <errno.h>],
- 	       [program_invocation_short_name = "test";],
- 	       AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
- 			 [Define if program_invocation_short_name is defined])
+ AC_MSG_CHECKING([whether program_invocation_short_name is defined])
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+-	#include <argp.h>
++	#include <errno.h>
+ ]], [[
+ 	program_invocation_short_name = "test";
+ ]])], [
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.23.bb
similarity index 55%
rename from meta/recipes-core/util-linux/util-linux_2.22.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.23.bb
index 43a55a6..d80b382 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.23.bb
@@ -1,5 +1,5 @@
-MAJOR_VERSION = "2.22"
-PR = "r3"
+MAJOR_VERSION = "2.23"
+PR = "r0"
 require util-linux.inc
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
@@ -7,11 +7,12 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
             file://fix-configure.patch \
-            file://mbsalign-license.patch \
+            file://0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch \
+            file://0001-losetup-use-warn_size-for-regular-files-only.patch \
 "
 
-SRC_URI[md5sum] = "3e379b4d8b9693948d751c154614c73e"
-SRC_URI[sha256sum] = "7463a17a01a77cee36d8ce845d8148208f553c9abdd67b446324bf42968bc36d"
+SRC_URI[md5sum] = "7bd10387f1aa00efaa4b07dfa13215bc"
+SRC_URI[sha256sum] = "19ee024b4c6678eaa928d38edc011c332b088e0ff06239575f6b7e00a1855959"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
-- 
1.8.2.3



