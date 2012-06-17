Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nx-0008Qo-UY
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103292"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:50 -0700
Message-Id: <d91d9497ef1d606197d65ebfc76c98398f1a6543.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 06/23] rpm: Fix compilation on uclibc
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:54 -0000

From: Khem Raj <raj.khem@gmail.com>

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
1.7.7.6



