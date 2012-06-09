Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOw2-000468-VO
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:47 +0200
Received: by dalh21 with SMTP id h21so3401893dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=q+Bcr5NJSTBzrbc4sUwqvujgXmLQybcIGfDtJJK5ZCQ=;
	b=FJEmnlc+5u2ykyX3FQTJJo1FcR/XDhRsjOWf3ygIMh4IxCxq8xkqNNF4tCJVVsJmsI
	n8U3Y1w8/6uVNCnuZUsv3FhNlqF1rNj+YY4eQreMx1EtqqlBuLA/pxqTQFTDA3XP22aS
	b62GzV2A7g36chDnE1Vvk6qfO3tYPSOWpkAgNar1jWR+NOk3d0G3v73YTTSJu0ng04Sy
	LnBHGjLUNaEH7/a/NrQyUYX0rqWPa4F4vZ/bOcvigK5Z6mqPNul9m3WQR5Nt242s8D1X
	d1zuQ6eyXjo0+0yUV9I9wVZoMg/UZfZIzRYT5kHDxMUKya5FiV1m2IuTfyWxGhuqANpU
	rVVg==
Received: by 10.68.226.226 with SMTP id rv2mr9372171pbc.101.1339260255193;
	Sat, 09 Jun 2012 09:44:15 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:00 -0700
Message-Id: <2d36539b46ab417e562351cc9628a4327e060e5e.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 02/16] rpm: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 09 Jun 2012 16:54:47 -0000

rpmatch is not there in uclibc therefore add logic to configure
to detect it.

x* wrappers need to be defined for uclibc as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   42 ++++++++++++
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   69 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    4 +-
 3 files changed, 114 insertions(+), 1 deletions(-)
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
index 0000000..f863669
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
@@ -0,0 +1,69 @@
+Define the x* wrappers for uclibc as well
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: rpm-5.4.0/rpmio/rpmio.h
+===================================================================
+--- rpm-5.4.0.orig/rpmio/rpmio.h	2010-09-29 07:54:30.000000000 -0700
++++ rpm-5.4.0/rpmio/rpmio.h	2012-05-31 16:05:26.042065540 -0700
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
+Index: rpm-5.4.0/system.h
+===================================================================
+--- rpm-5.4.0.orig/system.h	2010-09-27 14:24:39.000000000 -0700
++++ rpm-5.4.0/system.h	2012-05-31 16:08:07.334073348 -0700
+@@ -402,12 +402,12 @@
+ #endif /* defined(__LCLINT__) */
+ 
+ /* Memory allocation via macro defs to get meaningful locations from mtrace() */
+-#if defined(__GNUC__)
++#if defined(__GNUC__) || defined(__UCLIBC__)
+ #define	xmalloc(_size) 		(malloc(_size) ? : vmefail(_size))
+ #define	xcalloc(_nmemb, _size)	(calloc((_nmemb), (_size)) ? : vmefail(_size))
+ #define	xrealloc(_ptr, _size)	(realloc((_ptr), (_size)) ? : vmefail(_size))
+ #define	xstrdup(_str)	(strcpy((malloc(strlen(_str)+1) ? : vmefail(strlen(_str)+1)), (_str)))
+-#endif	/* defined(__GNUC__) */
++#endif /* defined(__GNUC__) */
+ #endif	/* HAVE_MCHECK_H */
+ 
+ /* Retrofit glibc __progname */
+Index: rpm-5.4.0/lib/librpm.vers
+===================================================================
+--- rpm-5.4.0.orig/lib/librpm.vers	2010-09-27 16:12:48.000000000 -0700
++++ rpm-5.4.0/lib/librpm.vers	2012-05-31 16:05:26.042065540 -0700
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
+Index: rpm-5.4.0/rpmio/librpmio.vers
+===================================================================
+--- rpm-5.4.0.orig/rpmio/librpmio.vers	2012-05-31 16:13:34.034089141 -0700
++++ rpm-5.4.0/rpmio/librpmio.vers	2012-05-31 16:13:56.542090245 -0700
+@@ -881,6 +881,10 @@
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
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 43999e5..f4938fd 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl file"
 extrarpmdeps_virtclass-native = "python-native file-native"
-PR = "r38"
+PR = "r39"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -72,6 +72,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-resolvedep.patch \
 	   file://rpm-respect-arch.patch \
 	   file://rpm_fix_for_automake-1.12.patch \
+	   file://uclibc-support.patch \
+	   file://rpmatch.patch \
 	  "
 
 #	   file://rpm-autoconf.patch \
-- 
1.7.5.4



