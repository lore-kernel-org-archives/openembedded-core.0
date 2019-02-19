Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3AB7C8E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 01:44:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1J1iHtK015892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 17:44:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 17:44:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 09:53:13 +0800
Message-ID: <734a9b69897089eec5cd2d28b7b4f621771d2e8f.1550541019.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1550541019.git.Qi.Chen@windriver.com>
References: <cover.1550541019.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] diffutils: upgrade to 3.7
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
X-List-Received-Date: Tue, 19 Feb 2019 01:44:16 -0000
Content-Type: text/plain

The following two patches are removed as they are not needed anymore.

  0001-Unset-need_charset_alias-when-building-for-musl.patch
  0001-explicitly-disable-replacing-getopt.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 33 ----------------------
 .../0001-explicitly-disable-replacing-getopt.patch | 30 --------------------
 .../{diffutils-3.6 => diffutils}/run-ptest         |  0
 .../{diffutils_3.6.bb => diffutils_3.7.bb}         |  6 ++--
 4 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.6/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
 rename meta/recipes-extended/diffutils/{diffutils-3.6 => diffutils}/run-ptest (100%)
 rename meta/recipes-extended/diffutils/{diffutils_3.6.bb => diffutils_3.7.bb} (77%)

diff --git a/meta/recipes-extended/diffutils/diffutils-3.6/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/diffutils/diffutils-3.6/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4ba..0000000
--- a/meta/recipes-extended/diffutils/diffutils-3.6/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch b/meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
deleted file mode 100644
index 351f87c..0000000
--- a/meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Subject: explicitly disable replacing getopt
-
-Explicitly disable replacing getopt to avoid compilation error like below.
-
-  xstrtol-error.c:84:26: error: invalid use of undefined type 'struct rpl_option'
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- m4/getopt.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/getopt.m4 b/m4/getopt.m4
-index 3ebc7b7..8934426 100644
---- a/m4/getopt.m4
-+++ b/m4/getopt.m4
-@@ -22,8 +22,8 @@ AC_DEFUN([gl_FUNC_GETOPT_POSIX],
-     fi
-   ])
-   if test $REPLACE_GETOPT = 1; then
--    dnl Arrange for getopt.h to be created.
--    gl_GETOPT_SUBSTITUTE_HEADER
-+    dnl Explicitly disable replacing getopt
-+    :
-   fi
- ])
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/diffutils/diffutils-3.6/run-ptest b/meta/recipes-extended/diffutils/diffutils/run-ptest
similarity index 100%
rename from meta/recipes-extended/diffutils/diffutils-3.6/run-ptest
rename to meta/recipes-extended/diffutils/diffutils/run-ptest
diff --git a/meta/recipes-extended/diffutils/diffutils_3.6.bb b/meta/recipes-extended/diffutils/diffutils_3.7.bb
similarity index 77%
rename from meta/recipes-extended/diffutils/diffutils_3.6.bb
rename to meta/recipes-extended/diffutils/diffutils_3.7.bb
index 8ba897d..7daeee3 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.6.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
@@ -4,13 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 require diffutils.inc
 
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://run-ptest \
 "
-SRC_URI_append_libc-glibc = " file://0001-explicitly-disable-replacing-getopt.patch"
 
-SRC_URI[md5sum] = "07cf286672ced26fba54cd0313bdc071"
-SRC_URI[sha256sum] = "d621e8bdd4b573918c8145f7ae61817d1be9deb4c8d2328a65cea8e11d783bd6"
+SRC_URI[md5sum] = "4824adc0e95dbbf11dfbdfaad6a1e461"
+SRC_URI[sha256sum] = "b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
1.9.1


