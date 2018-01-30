Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 080F278876
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:32:05 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id r19so6271241pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Stbyk86x1RKqufvYD2JmiSod/PfkZ/qnL/gXKBKmkaY=;
	b=tAGHhS2XeKGgGvc5ULVOd4HQndotSeTEIFXgD0ie7ZhWNCDx0JXXxTan7NDG7mL++E
	bVNF9HP2EzJ8JvcfHfCOEf7HfnoW1dwgx7cxBXxNp3fsTf7Cix9POfZLSVW4iB2amPkO
	JEcy7bQNqotDbAcFB0czNZ4Su9UtD2yqpPksrPc4QIujPKd8Jqh7x2cslY+3gbk09JuG
	+aff6YM6m2uto34U1YQ/hSMWYGxELHsmPpLn2p+X9JN25AMykSPJhdLmUP6/S31LEjHU
	RIhTurdFQ4ahJBYUeBzlUUKrDk9uAYR8Ikz5B7SFyVDM+3p2HBR1ybR4CB/aM8VvXxr3
	1GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Stbyk86x1RKqufvYD2JmiSod/PfkZ/qnL/gXKBKmkaY=;
	b=PwEF2cypeiOiOwz9O/LzCwbz8Zk/4oaQld6NxXDGpT2IfgyIRM5zfSiZf5B2fhZ4OR
	4FCjd4flrA+plK/gU5wp5tNrPGxjGul5Fb43xwuzhWNM9TgUedfXVlR3c310H2P8zyrB
	NdXItOQfh9YqmNqiPOPbFR+hqbf+rLwCOwtKKWPwLYttPdhIPX0VVms6F4LT7ZtL3J4n
	CxBK/YpBix3xWBo4KuPBQgwuz38pVz3pSrMWECFLWYn+3N/wi7n1tzGiZ5XWLEi+9DIb
	Ba/TRZdkTHxDx+gswrAhAEufIroY+JoszOEr7RP/K8ZoFfwddJSMOaSlDRDY6YIQC71I
	OtKA==
X-Gm-Message-State: AKwxytc99b8XWChxRjIxPcfDRt83uzWcDX+W4Y/lbczySyRMc7bU35Rg
	u9IZbmoDznYj9sIMp0E2qzJrrQ==
X-Google-Smtp-Source: AH8x226iKj4gSqSyLKlut9JcKRY4qhQbv7tO9Kyo0zqA1S+RRBDusyiERjx4o4r/cs/uLquY+2J4Mw==
X-Received: by 2002:a17:902:7d96:: with SMTP id
	a22-v6mr14575111plm.296.1517286726970; 
	Mon, 29 Jan 2018 20:32:06 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	u67sm1134233pfd.169.2018.01.29.20.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 20:32:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 20:31:50 -0800
Message-Id: <92a10eebd7525de6eeaa80701f4ae256500836b2.1517286478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
Subject: [PATCH V2 2/8] make: Backport fixes to not assume glibc internal glob implementation
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
X-List-Received-Date: Tue, 30 Jan 2018 04:32:06 -0000

Exposed with glibc 2.27

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/make/make.inc                |  5 +-
 ...1-glob-Do-not-assume-glibc-glob-internals.patch | 70 ++++++++++++++++++++++
 ...2-glob-Do-not-assume-glibc-glob-internals.patch | 38 ++++++++++++
 3 files changed, 112 insertions(+), 1 deletion(-)
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
index 0000000000..2b6e4d40c3
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
@@ -0,0 +1,70 @@
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
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


