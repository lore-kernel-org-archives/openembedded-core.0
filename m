Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxL-0001O3-9b
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:27 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so4635855pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=P4PaOB0trxEridi1vc3oTv+DNmm4M8IVCMTgG/JUhl8=;
	b=t2LEGFSVr47VO38I1p2Z2Rs+be17XqYQfFwMK0j/JYVe8WpJPQ/Z1cRP0WaLSttsvy
	8bOEVE86eKIlC4FF53KPK+QONYftxZ95KqzHWN3s4NtXb4x/suXS1y3AahgFEHsRkx+j
	ypB3qi178EEkq9OMPGWOoC2VktjX1v4tVPE+jXVXOjp6FFSISurU6Kz7lqHhMWSg866B
	zHUIWelDVfenqSKSMxq4A+aPMeF1lPMLfDiPu3J9QS0WtWMFNLYalR502VItPtXhrfaT
	MloIR8v1NVRgbkjRoLKWN42nce5FQB/gqhqKbHRPSxUkb64GBN8PQPtpwBQKqDsKHC7J
	TXCg==
Received: by 10.68.226.73 with SMTP id rq9mr16117239pbc.145.1339740831105;
	Thu, 14 Jun 2012 23:13:51 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:30 -0700
Message-Id: <838a9e6aee4389eb04390cb2026d223fee577958.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 3/9] rpm: Fix compilation on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 06:24:27 -0000

rpmatch is not there in uclibc therefore add logic to configure
to detect it.

x* wrappers need to be defined for uclibc as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   42 +++++++++++++
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   63 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    4 +-
 3 files changed, 108 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpmatch.patch b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
new file mode 100644
index 0000000..8ea3490
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
@@ -0,0 +1,42 @@
+Add configure check for rpmatch() and 
+creates a compatable macro if it is not provided by the C library.
+
+This is needed for uclibc since it does not have the above function
+implemented.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: rpm-5.4.0/configure.ac
+===================================================================
+--- rpm-5.4.0.orig/configure.ac	2012-05-31 15:40:05.985990822 -0700
++++ rpm-5.4.0/configure.ac	2012-05-31 15:41:15.601995311 -0700
+@@ -800,7 +800,7 @@
+     ftok getaddrinfo getattrlist getcwd getdelim getline getmode getnameinfo dnl
+     getpassphrase getxattr getwd iconv inet_aton lchflags lchmod lchown dnl
+     lgetxattr lsetxattr lutimes madvise mempcpy mkdtemp mkstemp mtrace dnl
+-    posix_fadvise posix_fallocate putenv realpath regcomp __secure_getenv dnl
++    posix_fadvise posix_fallocate putenv realpath regcomp rpmatch __secure_getenv dnl
+     setattrlist setenv setlocale setmode setxattr dnl
+     sigaddset sigdelset sigemptyset sighold sigrelse sigpause dnl
+     sigprocmask sigsuspend sigaction dnl
+Index: rpm-5.4.0/system.h
+===================================================================
+--- rpm-5.4.0.orig/system.h	2012-05-31 15:40:05.997991504 -0700
++++ rpm-5.4.0/system.h	2012-05-31 15:42:04.941997731 -0700
+@@ -410,6 +410,14 @@
+ #endif /* defined(__GNUC__) */
+ #endif	/* HAVE_MCHECK_H */
+ 
++#ifndef HAVE_RPMATCH
++#define rpmatch(line) \
++	( (line == NULL)? -1 : \
++	  (*line == 'y' || *line == 'Y')? 1 : \
++	  (*line == 'n' || *line == 'N')? 0 : \
++	  -1 )
++#endif
++
+ /* Retrofit glibc __progname */
+ #if defined __GLIBC__ && __GLIBC__ >= 2
+ #if __GLIBC_MINOR__ >= 1
diff --git a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
new file mode 100644
index 0000000..64746ce
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
@@ -0,0 +1,63 @@
+Define the x* wrappers for uclibc as well
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: rpm-5.4.9/rpmio/rpmio.h
+===================================================================
+--- rpm-5.4.9.orig/rpmio/rpmio.h	2010-09-29 07:54:30.000000000 -0700
++++ rpm-5.4.9/rpmio/rpmio.h	2012-06-12 07:29:19.610745014 -0700
+@@ -23,7 +23,8 @@
+  */
+ /*@{*/
+ #if !defined(__LCLINT__) && !defined(__UCLIBC__) && defined(__GLIBC__) && \
+-	(__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2))
++	(__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2)) && \
++	!defined(__UCLIBC__)
+ #define USE_COOKIE_SEEK_POINTER 1
+ typedef _IO_off64_t 	_libio_off_t;
+ typedef _libio_off_t *	_libio_pos_t;
+Index: rpm-5.4.9/system.h
+===================================================================
+--- rpm-5.4.9.orig/system.h	2012-04-26 10:46:49.000000000 -0700
++++ rpm-5.4.9/system.h	2012-06-12 07:30:08.242747422 -0700
+@@ -410,7 +410,7 @@
+ #endif /* defined(__LCLINT__) */
+ 
+ /* Memory allocation via macro defs to get meaningful locations from mtrace() */
+-#if defined(__GNUC__)
++#if defined(__GNUC__) || defined(__UCLIBC__)
+ #define	xmalloc(_size) 		(malloc(_size) ? : vmefail(_size))
+ #define	xcalloc(_nmemb, _size)	(calloc((_nmemb), (_size)) ? : vmefail(_size))
+ #define	xrealloc(_ptr, _size)	(realloc((_ptr), (_size)) ? : vmefail(_size))
+Index: rpm-5.4.9/lib/librpm.vers
+===================================================================
+--- rpm-5.4.9.orig/lib/librpm.vers	2011-04-10 15:55:23.000000000 -0700
++++ rpm-5.4.9/lib/librpm.vers	2012-06-12 07:29:19.610745014 -0700
+@@ -405,6 +405,10 @@
+     specedit;
+     strict_erasures;
+     XrpmtsiInit;
++    xmalloc;
++    xrealloc;
++    xcalloc;
++    xstrdup;
+   local:
+     *;
+ };
+Index: rpm-5.4.9/rpmio/librpmio.vers
+===================================================================
+--- rpm-5.4.9.orig/rpmio/librpmio.vers	2012-05-07 07:38:23.000000000 -0700
++++ rpm-5.4.9/rpmio/librpmio.vers	2012-06-12 07:29:19.626745024 -0700
+@@ -994,6 +994,10 @@
+     mongo_simple_int_command;
+     mongo_simple_str_command;
+     mongo_update;
++    xmalloc;
++    xrealloc;
++    xcalloc;
++    xstrdup;
+   local:
+     *;
+ };
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 51cf93b..404916a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r43"
+PR = "r44"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -72,6 +72,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-ossp-uuid.patch \
 	   file://rpm-packageorigin.patch \
 	   file://rpm-pkgconfigdeps.patch \
+	   file://uclibc-support.patch \
+	   file://rpmatch.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.5.4



