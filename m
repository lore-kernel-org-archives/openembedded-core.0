Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 92C3E78650
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 03:27:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y5so3723283pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 19:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S6cudfNfJKHyv+f+9+1PHdbTY/nQE+bqcKtbunDhHF0=;
	b=pRNwVGcATDAFKXLkcVK37cmGzLTUIFHpznXyadAB8R64w/8efnXuR7CwA411UAxNq2
	bsDrSQ3NdMXIGmJRKVpgfBfwH70HWkZjkhJ3ajVmFnFXMOemYdD+zgX9QPl7d1DcdOYx
	rDpaoR2bBVeVUAU/PWka4fnxs8bf8icYGnc85rporjT3x49e1omSsFkcr/vlu1km+dXh
	z7bjwVKIRKdiKlskcCzf9/SHsdM47FLEm3QitH8pQd9U0QKRfvqJxRIgBWSIJxZT19Tz
	rVJFSCTfnHaksyR1j77u1wDItXdRNrJ0ZcW6JBC29hS5A9eLHe1qxEluM/CTtKX8sHTF
	CL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S6cudfNfJKHyv+f+9+1PHdbTY/nQE+bqcKtbunDhHF0=;
	b=uOe8u6WEfXx5UeP80/nuWMOHdyy4yQr2eegfno1UbWh/S8LUMY7v7YvmzSf+a3kwFb
	rOnLPiAPHSXBSB0R9LZE4q7jIAkmHmLmq8B8S0J9naQS+ooxDjrEH2M+NAKoserBcOWS
	Rbhlzms6lqcdxoslYvGp1yKkt/rUuNZuT8jGH0JLtNVEy36/C5WSc9xvHSKv5SV/EEtt
	1DFiNM3TtHfocKO6XixtUoUqQ/xfilSUwnL/f1NKIRS4UAG5LsL7qp7vat8h1QEqdv4v
	uiBLU/jqGSLJYe48vr5ZG6M1bA/jcvAo7z7uH58eV9GBnLIrX3svaoZc1Yc5l2GwkG2x
	+AmA==
X-Gm-Message-State: AKwxyteZfVVfbCESk+4bjJyPwZB6vR5mZ6EEswiGD9HZEA1PdSIxeb9u
	xfkHIjY/H8J1nbuAbkXjhF0/yw==
X-Google-Smtp-Source: AH8x227ObTqmdJC1Mdk+v2wbC/Z9mpW+wOIdrMWADOdbRUgRfsKJW2QGYXZQCX0Godi7Dngv4dQjOw==
X-Received: by 10.99.105.72 with SMTP id e69mr20942733pgc.239.1517196448839;
	Sun, 28 Jan 2018 19:27:28 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	y5sm29184689pfd.163.2018.01.28.19.27.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 19:27:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 19:27:13 -0800
Message-Id: <ef224dd0c18515dce7e63a0d7d231d9d6e7ce96a.1517196242.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517196242.git.raj.khem@gmail.com>
References: <cover.1517196242.git.raj.khem@gmail.com>
Subject: [PATCH 2/8] make: Backport fixes to not assume glibc internal glob implementation
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
X-List-Received-Date: Mon, 29 Jan 2018 03:27:28 -0000

Exposed with glibc 2.27

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/make/make.inc                |  5 +-
 ...1-glob-Do-not-assume-glibc-glob-internals.patch | 69 ++++++++++++++++++++++
 ...2-glob-Do-not-assume-glibc-glob-internals.patch | 38 ++++++++++++
 3 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
 create mode 100644 meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch

diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 849b74299c..b8905bc6d3 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -5,7 +5,10 @@ called the makefile, which lists each of the non-source files and how to compute
 HOMEPAGE = "http://www.gnu.org/software/make/"
 SECTION = "devel"
 
-SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
+           file://0001-glob-Do-not-assume-glibc-glob-internals.patch \
+           file://0002-glob-Do-not-assume-glibc-glob-internals.patch \
+           "
 
 inherit autotools gettext pkgconfig texinfo
 
diff --git a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch b/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
new file mode 100644
index 0000000000..5839d2ddd1
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
@@ -0,0 +1,69 @@
+From c90a7dda6c572f79b8e78da44b6ebf8704edef65 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sun, 24 Sep 2017 09:12:58 -0400
+Subject: [PATCH 1/2] glob: Do not assume glibc glob internals.
+
+It has been proposed that glibc glob start using gl_lstat,
+which the API allows it to do.  GNU 'make' should not get in
+the way of this.  See:
+https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
+
+* dir.c (local_lstat): New function, like local_stat.
+(dir_setup_glob): Use it to initialize gl_lstat too, as the API
+requires.
+---
+Upstream-Status: Backport
+
+ dir.c | 29 +++++++++++++++++++++++++++--
+ 1 file changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/dir.c b/dir.c
+index f34bbf5..12eef30 100644
+--- a/dir.c
++++ b/dir.c
+@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat *buf)
+ }
+ #endif
+ 
++/* Similarly for lstat.  */
++#if !defined(lstat) && !defined(WINDOWS32) || defined(VMS)
++# ifndef VMS
++#  ifndef HAVE_SYS_STAT_H
++int lstat (const char *path, struct stat *sbuf);
++#  endif
++# else
++    /* We are done with the fake lstat.  Go back to the real lstat */
++#   ifdef lstat
++#     undef lstat
++#   endif
++# endif
++# define local_lstat lstat
++#elif defined(WINDOWS32)
++/* Windows doesn't support lstat().  */
++# define local_lstat local_stat
++#else
++static int
++local_lstat (const char *path, struct stat *buf)
++{
++  int e;
++  EINTRLOOP (e, lstat (path, buf));
++  return e;
++}
++#endif
++
+ void
+ dir_setup_glob (glob_t *gl)
+ {
+   gl->gl_opendir = open_dirstream;
+   gl->gl_readdir = read_dirstream;
+   gl->gl_closedir = free;
++  gl->gl_lstat = local_lstat;
+   gl->gl_stat = local_stat;
+-  /* We don't bother setting gl_lstat, since glob never calls it.
+-     The slot is only there for compatibility with 4.4 BSD.  */
+ }
+ 
+ void
+-- 
+2.16.1
+
diff --git a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch b/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
new file mode 100644
index 0000000000..d49acd9f6e
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
@@ -0,0 +1,38 @@
+From 9858702dbd1e137262c06765919937660879f63c Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sun, 24 Sep 2017 09:12:58 -0400
+Subject: [PATCH 2/2] glob: Do not assume glibc glob internals.
+
+It has been proposed that glibc glob start using gl_lstat,
+which the API allows it to do.  GNU 'make' should not get in
+the way of this.  See:
+https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
+
+* dir.c (local_lstat): New function, like local_stat.
+(dir_setup_glob): Use it to initialize gl_lstat too, as the API
+requires.
+---
+Upstream-Status: Backport
+
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 64ec870..e87901c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -399,10 +399,9 @@ AC_CACHE_CHECK([if system libc has GNU glob], [make_cv_sys_gnu_glob],
+ #include <glob.h>
+ #include <fnmatch.h>
+ 
+-#define GLOB_INTERFACE_VERSION 1
+ #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
+ # include <gnu-versions.h>
+-# if _GNU_GLOB_INTERFACE_VERSION == GLOB_INTERFACE_VERSION
++if _GNU_GLOB_INTERFACE_VERSION == 1 || _GNU_GLOB_INTERFACE_VERSION == 2
+    gnu glob
+ # endif
+ #endif],
+-- 
+2.16.1
+
-- 
2.16.1


