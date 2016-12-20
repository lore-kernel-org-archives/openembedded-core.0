Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1E0D6007A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 05:53:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBK5rMoR019498
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Dec 2016 21:53:22 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 19 Dec 2016 21:53:21 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 13:53:16 +0800
Message-ID: <47053394f7baedc5e343fc82bb144d6d7abae7e8.1482212391.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482212391.git.dengke.du@windriver.com>
References: <cover.1482212391.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 2/2] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Tue, 20 Dec 2016 05:53:25 -0000
Content-Type: text/plain

When subversion run on x86 and lib32 on x86-64, it use the APR's
apr.h header file. But when configure the APR, APR meets the cross
compiling, it was hardcoded in configure.in in apr source code. As
the following:

	APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)

It pass 8 bytes to off_t when meets cross compiling, but on x86 or lib32
the off_t in glibc was 4 bytes, so it let the application who use apr.h
go to wrong.

Such as subversion:

	svnadmin create test

So we should let the APR detect the correct off_t when cross compiling,
change it to the following:

	AC_CHECK_SIZEOF(off_t)

The same for the following hardcoded types for cross compiling:

	pid_t	8
	size_t	8
	ssize_t	8

Change the above correspondingly.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch | 76 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch

diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
new file mode 100644
index 0000000..1237142
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
@@ -0,0 +1,76 @@
+From f26e8b88d2c90ed7eb9d4e276412b0923c23d10f Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 14 Dec 2016 18:13:08 +0800
+Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
+ compiling
+
+In configure.in, it contains the following:
+
+	APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
+
+the macro "APR_CHECK_SIZEOF_EXTENDED" was defined in build/apr_common.m4,
+it use the "AC_TRY_RUN" macro, this macro let the off_t to 8, when cross
+compiling enable.
+
+So it was hardcoded for cross compiling, we should detect it dynamic based on
+the sysroot's glibc. We change it to the following:
+
+	AC_CHECK_SIZEOF(off_t)
+
+The same for the following hardcoded types for cross compiling:
+
+	pid_t	8
+	ssize_t	8
+	size_t	8
+	off_t	8
+
+Change the above correspondingly.
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ configure.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 9d57ae6..5b19940 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1681,7 +1681,7 @@ else
+     socklen_t_value="int"
+ fi
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], pid_t, 8)
++AC_CHECK_SIZEOF(pid_t)
+ 
+ if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short"; then
+     pid_t_fmt='#define APR_PID_T_FMT "hd"'
+@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long, [ssize_t_fmt="ld"])
+ APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt="u"])
+ APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt="lu"])
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], ssize_t, 8)
++AC_CHECK_SIZEOF(ssize_t)
+ 
+ AC_MSG_CHECKING([which format to use for apr_ssize_t])
+ if test -n "$ssize_t_fmt"; then
+@@ -1767,7 +1767,7 @@ fi
+ 
+ ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <stddef.h>], size_t, 8)
++AC_CHECK_SIZEOF(size_t)
+ 
+ AC_MSG_CHECKING([which format to use for apr_size_t])
+ if test -n "$size_t_fmt"; then
+@@ -1784,7 +1784,7 @@ fi
+ 
+ size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
++AC_CHECK_SIZEOF(off_t)
+ 
+ if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" = "4yes"; then
+     # Enable LFS
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index 302c935..f560c8b 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://upgrade-and-fix-1.5.1.patch \
            file://Fix-packet-discards-HTTP-redirect.patch \
            file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
+           file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
 "
 
 SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
-- 
2.7.4


