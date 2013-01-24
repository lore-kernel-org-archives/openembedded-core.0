Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGY-0000rI-Oh
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so4453530dan.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9X/9sM/awLAsAEqW5aq1BpwxoPLH8VILyFgiwSuSLjg=;
	b=gfo4FD6Vz+YHRTaMUjbXs+UMJlDEgxPXRS1fDa/Rm3UDplYgfbCdnlbFFVbtL7FrsM
	aqS0CAae5+/S5q6SXeF3h1ldKvcLFWgaqsBIO+eUorr/wA67S64M4YK5GhA+KMCO9KKI
	dVDetpGez9C2v99ezRtexMOmkulkdNtwkAZm+QzFYjP8B1zj1usz3IaXoFQJR4i8JCJx
	jAxDZXGAV7r0xLiGcgjo6U4I3BI7RLoEStn8b0w77L0cyC6GIoasgcZXqoFxZTlX9SuJ
	J5o6anX3p9jMUFVNJPbPxSREbN7j2WYme26nbubzwoew5P98r+C5k18G9Vrnt6+O1tag
	5+zQ==
X-Received: by 10.68.129.40 with SMTP id nt8mr8493444pbb.113.1359061668303;
	Thu, 24 Jan 2013 13:07:48 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.47
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:23 -0800
Message-Id: <5f0a615126a39601a44025e2242a9a3627122bdc.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 02/11] gettext: Fix build with uclibc remove upstreamed patches
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
X-List-Received-Date: Thu, 24 Jan 2013 21:23:32 -0000

uclibc specific patches are not needed now as they are
available in 0.18.2 gettext now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnulib-uclibc-sched_param-def.patch            |   21 ------
 .../gettext/gettext-0.18.2/wchar-uclibc.patch      |   74 --------------------
 meta/recipes-core/gettext/gettext_0.18.2.bb        |    3 -
 3 files changed, 98 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch

diff --git a/meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch b/meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
deleted file mode 100644
index d8d10db..0000000
--- a/meta/recipes-core/gettext/gettext-0.18.2/gnulib-uclibc-sched_param-def.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
-and is not needed too per standard. gnulib attempts to use it but we have to account
-for it because in this case uclibc does not behave like glibc.
-
--Khem
-
-Upstream-Status: Pending
-
-Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/spawn.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/spawn.in.h
-+++ gettext-0.18.1.1/gettext-tools/gnulib-lib/spawn.in.h
-@@ -31,7 +31,7 @@
- 
- /* Get definitions of 'struct sched_param' and 'sigset_t'.
-    But avoid namespace pollution on glibc systems.  */
--#ifndef __GLIBC__
-+#if !defined __GLIBC__ || defined __UCLIBC__
- # include <sched.h>
- # include <signal.h>
- #endif
diff --git a/meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch b/meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch
deleted file mode 100644
index 34e3f1a..0000000
--- a/meta/recipes-core/gettext/gettext-0.18.2/wchar-uclibc.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Upstream-Status: Pending
-
-Index: gettext-0.18.1.1/gettext-runtime/gnulib-lib/wchar.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-runtime/gnulib-lib/wchar.in.h	2010-05-08 18:36:16.000000000 -0700
-+++ gettext-0.18.1.1/gettext-runtime/gnulib-lib/wchar.in.h	2011-05-25 16:28:38.656220937 -0700
-@@ -48,6 +48,14 @@
- #else
- /* Normal invocation convention.  */
- 
-+#ifdef __need_mbstate_t
-+/* Special invocation convention inside uClibc header files.  */
-+
-+#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
-+
-+#else
-+/* Normal invocation convention.  */
-+
- #ifndef _GL_WCHAR_H
- 
- #define _GL_ALREADY_INCLUDING_WCHAR_H
-@@ -426,3 +434,4 @@
- #endif /* _GL_WCHAR_H */
- #endif /* _GL_WCHAR_H */
- #endif
-+#endif
-Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/wchar.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/wchar.in.h	2010-05-24 02:42:48.000000000 -0700
-+++ gettext-0.18.1.1/gettext-tools/gnulib-lib/wchar.in.h	2011-05-25 16:28:15.717360791 -0700
-@@ -48,6 +48,14 @@
- #else
- /* Normal invocation convention.  */
- 
-+#ifdef __need_mbstate_t
-+/* Special invocation convention inside uClibc header files.  */
-+
-+#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
-+
-+#else
-+/* Normal invocation convention.  */
-+
- #ifndef _GL_WCHAR_H
- 
- #define _GL_ALREADY_INCLUDING_WCHAR_H
-@@ -426,3 +434,4 @@
- #endif /* _GL_WCHAR_H */
- #endif /* _GL_WCHAR_H */
- #endif
-+#endif
-Index: gettext-0.18.1.1/gettext-tools/libgettextpo/wchar.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-tools/libgettextpo/wchar.in.h	2010-05-08 18:38:04.000000000 -0700
-+++ gettext-0.18.1.1/gettext-tools/libgettextpo/wchar.in.h	2011-05-25 16:28:26.998721087 -0700
-@@ -48,6 +48,14 @@
- #else
- /* Normal invocation convention.  */
- 
-+#ifdef __need_mbstate_t
-+/* Special invocation convention inside uClibc header files.  */
-+
-+#@INCLUDE_NEXT@ @NEXT_WCHAR_H@
-+
-+#else
-+/* Normal invocation convention.  */
-+
- #ifndef _GL_WCHAR_H
- 
- #define _GL_ALREADY_INCLUDING_WCHAR_H
-@@ -426,3 +434,4 @@
- #endif /* _GL_WCHAR_H */
- #endif /* _GL_WCHAR_H */
- #endif
-+#endif
diff --git a/meta/recipes-core/gettext/gettext_0.18.2.bb b/meta/recipes-core/gettext/gettext_0.18.2.bb
index 3e93089..086f7fa 100644
--- a/meta/recipes-core/gettext/gettext_0.18.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.2.bb
@@ -15,9 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
           "
 
-SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
-                               file://gnulib-uclibc-sched_param-def.patch \
-                             "
 LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
 SRC_URI[md5sum] = "0c86e5af70c195ab8bd651d17d783928"
-- 
1.7.9.5



