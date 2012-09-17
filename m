Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TDiUe-0001p3-FU
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 23:04:36 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so9391052pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HcNU9dAjWzQ0gU0P3PJWeRdYorOnN34FLChvXFF6KUc=;
	b=qlFxzKxKpfCnp24XorKd1M00dZUO0wRW4IGB9h8xn6AyrhY0SW0/XHsxxt06P3zr8p
	L6xI2Uz6TAoQCECTSeNn/b/QJdTpeyHKxfqbuhDkEJsvDD5CFf2RBIrCvMVRJLezmG1T
	Pa4+Aoo3+5gf9owenpUMO5SH1xqbFIeMn37LBMVpYy4XuyT8fLhLTcyTJjZOYEe9OZi7
	laVZqkQsh9hrEGR5zwiXGQ3U+Ql88RPVU91a2b680m0nOzr/7Oof69O6dE9WDbeSPzYL
	KCNMlF73GBM6avlMuPmnOJsyapHC7I/HnPFCiijTLseGvcLytVn69ZOG0uOMegMXr0YE
	A2sw==
Received: by 10.68.242.10 with SMTP id wm10mr24389372pbc.61.1347915119232;
	Mon, 17 Sep 2012 13:51:59 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gv1sm7498229pbc.38.2012.09.17.13.51.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 13:51:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 13:50:47 -0700
Message-Id: <feb59cfcb48be1f8ad1e767a0a236f4f4fd92670.1347914898.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347914898.git.raj.khem@gmail.com>
References: <cover.1347914898.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] eglibc: Fix fcntl.h for powerpc
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
X-List-Received-Date: Mon, 17 Sep 2012 21:04:36 -0000

This fix is needed for systemd to work on powerpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
new file mode 100644
index 0000000..48b3c56
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
@@ -0,0 +1,65 @@
+Upstream-Status: Submitted
+
+
+From 4b2716f902c117490285e39deb6ef7925fdc846e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Sep 2012 19:54:03 -0700
+Subject: [PATCH] Add name_to_handle_at, open_by_handle etc. to PowerPC
+ bits/fcntl.h.
+
+---
+ ChangeLog                                    |    7 +++++++
+ sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h |   28 +++++++++++++++++++++++++-
+ 2 files changed, 34 insertions(+), 1 deletion(-)
+
+Index: libc/sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h
+===================================================================
+--- libc.orig/sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h	2012-09-08 10:27:08.000000000 -0700
++++ libc/sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h	2012-09-08 19:57:44.219191560 -0700
+@@ -1,5 +1,5 @@
+ /* O_*, F_*, FD_* bit values for Linux/PowerPC.
+-   Copyright (C) 1995-1998, 2000, 2003, 2004, 2006, 2007, 2009, 2010, 2011
++   Copyright (C) 1995-2012
+    Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+@@ -232,6 +232,19 @@
+ 					   we splice from/to).  */
+ # define SPLICE_F_MORE		4	/* Expect more data.  */
+ # define SPLICE_F_GIFT		8	/* Pages passed in are a gift.  */
++
++
++/* File handle structure.  */
++struct file_handle
++{
++  unsigned int handle_bytes;
++  int handle_type;
++  /* File identifier.  */
++  unsigned char f_handle[0];
++};
++
++/* Maximum handle size (for now).  */
++# define MAX_HANDLE_SZ  128
+ #endif
+ 
+ __BEGIN_DECLS
+@@ -278,6 +291,19 @@
+ 			__off64_t __len);
+ # endif
+ 
++
++/* Map file name to file handle.  */
++extern int name_to_handle_at (int __dfd, const char *__name,
++			      struct file_handle *__handle, int *__mnt_id,
++			      int __flags) __THROW;
++
++/* Open file using the file handle.
++
++   This function is a possible cancellation point and therefore not
++   marked with __THROW.  */
++extern int open_by_handle_at (int __mountdirfd, struct file_handle *__handle,
++			      int __flags);
++
+ #endif
+ 
+ __END_DECLS
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 78dc44a..8f3d159 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -29,6 +29,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://0001-eglibc-menuconfig-support.patch \
            file://0002-eglibc-menuconfig-hex-string-options.patch \
            file://0003-eglibc-menuconfig-build-instructions.patch \
+           file://0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.9.5



