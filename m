Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ToMxg-0002qN-V6
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 00:34:05 +0100
Received: by mail-bk0-f41.google.com with SMTP id jg9so4450298bkc.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 15:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=SXf+NFXV9CjJY2/RCR+U+OvlZWLmAR66iwFqzfU1kUU=;
	b=nTgJyOEQBUVBZrGgAys/WdTzo4yh/UCT7q2CQnw+CgrJVe9R8GwAM2qasQ3jTigtMq
	s85g3PUP158zALzK39L/whSwsOniiZEt9mFjIj9ySpL/dW5vVuQbteZp0ou14cFBsRHX
	BTpsrOWSKVah6ArxarIdOLFF7fy864PRQfHNvIK6MG2KeuUkbt63ryQ2kdYTwJXk9OVy
	BlAbH1qmkaZ6y6bZAhaxTZR+J0KKEM8G+4HqLwwOxwJZQ77gaOB1lN4moe9K6hjPI+ho
	siFlpnWPwuyXndRKcB7P/KS26lByhiAp6i8DuXqMskZg9Bn/qDPhV9H5l/zoxWxiw4/K
	82sg==
X-Received: by 10.204.11.142 with SMTP id t14mr15623138bkt.9.1356650350076;
	Thu, 27 Dec 2012 15:19:10 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id o7sm21709309bkv.13.2012.12.27.15.19.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 15:19:09 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1ToMjC-0005AG-Dw; Fri, 28 Dec 2012 01:19:06 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 01:19:05 +0200
Message-Id: <1356650345-19419-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] gettext: update to upstream version 0.18.2
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
X-List-Received-Date: Thu, 27 Dec 2012 23:34:05 -0000

remove_gets.patch dropped as upstream now contains
fix for the problem.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 --------------------
 .../gnulib-uclibc-sched_param-def.patch            |    0
 .../parallel.patch                                 |    0
 .../wchar-uclibc.patch                             |    0
 .../{gettext_0.18.1.1.bb => gettext_0.18.2.bb}     |    7 +--
 5 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/gnulib-uclibc-sched_param-def.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/wchar-uclibc.patch (100%)
 rename meta/recipes-core/gettext/{gettext_0.18.1.1.bb => gettext_0.18.2.bb} (96%)

diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
deleted file mode 100644
index 3d3c400..0000000
--- a/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-eglibc 2.16 has removed gets so we need to check for it
-being there before using it.
-
-
-From glibc stdio.h
-
-The function has been officially removed in ISO C11.  This opportunity
-   is used to also remove it from the GNU feature list.  It is now only
-   available when explicitly using an old ISO C, Unix, or POSIX standard.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-runtime/gnulib-lib/stdio.in.h	2010-05-17 12:56:12.000000000 -0700
-+++ gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h	2012-07-02 22:42:21.292223316 -0700
-@@ -140,8 +140,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
-Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/stdio.in.h	2010-05-24 02:42:46.000000000 -0700
-+++ gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h	2012-07-02 23:02:33.476281979 -0700
-@@ -140,8 +140,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
-Index: gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-tools/libgettextpo/stdio.in.h	2010-05-17 12:58:03.000000000 -0700
-+++ gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h	2012-07-02 23:01:57.440280253 -0700
-@@ -140,8 +140,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch b/meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
rename to meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.18.2/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.18.2/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch b/meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch
rename to meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.2.bb
similarity index 96%
rename from meta/recipes-core/gettext/gettext_0.18.1.1.bb
rename to meta/recipes-core/gettext/gettext_0.18.2.bb
index 4639481..3e93089 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.2.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r19"
+PR = "r0"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -13,7 +13,6 @@ PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
-	   file://remove_gets.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
@@ -21,8 +20,8 @@ SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
                              "
 LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
-SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
-SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
+SRC_URI[md5sum] = "0c86e5af70c195ab8bd651d17d783928"
+SRC_URI[sha256sum] = "516a6370b3b3f46e2fc5a5e222ff5ecd76f3089bc956a7587a6e4f89de17714c"
 
 inherit autotools
 
-- 
1.7.10.4



