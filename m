Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 681B4608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 02:49:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBG2nQR5017274
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 18:49:26 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 15 Dec 2016 18:49:25 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2016 10:49:20 +0800
Message-ID: <125a9f473857252cd440aa292e10dab2d95555dc.1481856470.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1481856470.git.dengke.du@windriver.com>
References: <cover.1481856470.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Fri, 16 Dec 2016 02:49:26 -0000
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

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch | 52 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch

diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
new file mode 100644
index 0000000..56673f4
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
@@ -0,0 +1,52 @@
+From 537f5b415677b49a52f01bca9f60937654fb9cca Mon Sep 17 00:00:00 2001
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
+I have send a discussing for the upstream, the maintainer said the macro in
+APR designed with only any attention paid to the build platform, considering
+cross compiling less, we can check the discussing from:
+
+	http://mail-archives.apache.org/mod_mbox/apr-dev/201612.mbox/browser
+
+text/plain:
+
+	http://mail-archives.apache.org/mod_mbox/apr-dev/201612.mbox/raw/%3CCACsi250oDaqf%2BG4-KoT_0QWhSZdKCJhNZYhWRBqOx5WcmtYO8Q%40mail.gmail.com%3E/1
+
+Upstream-Status: Submitted
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 9d57ae6..fcc647e 100644
+--- a/configure.in
++++ b/configure.in
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


