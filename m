Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id B657C7002B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:52:59 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id b67so98780364qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 12:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AhZwdCH4Q5RKw123BpfaXXAaDkyrZ6FcpminRMX3/8o=;
	b=Mo5cGJkPu9l6b+G6h3qh5ZYH0IjlMuwINDhRW0mbYrWitqH+E4jKzQVz6NXCloXrvD
	V/f2aI/dEfu7AG9N9sYWTC7oIayVd3oxK8Kv8P/4vnemiB3L1VuSytZWkTgdo12YiW80
	RRMhJev7KpaASLNLVlNYM0MN/oN+/6pZp+GZF6IInIazRZdzfAl9CJBdDnbJDp22Hdim
	9ulEMhLzN52DSZ7AWhhxLvrtSGNm5JHjlgbRv/AzwggBUewePsovSHQ/205G6vboCWS+
	vbZYIZR2gCLze4pIxiEiz71u4VZq1wQvXcCriW+DWWcNXY4wlZWn06pM7Glb5fb5R50I
	Rt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AhZwdCH4Q5RKw123BpfaXXAaDkyrZ6FcpminRMX3/8o=;
	b=kuPWpXWkb97GD37eYlYL4V0YrinrErYbzGFnaFb1L2uG8wM6IJAjAsOueRKaJ/RkxH
	6vP0eHhAnmYboiHCM5gh7XVO9f89NnHJkiX8+gi4X2cNMtoQBCQ+aGbnsvn24clwY0AD
	rSlSBIyeo/tnEBQrhzKyb4IN2i6I+xyl1FuAbFu4ftowDQ6/riz37Iywj6XMH13TPlej
	pCJvmJoDjRaYZvG9CBza7rsXHLXb8zpFFVjvF5GkPnHNx/0f2vvsnpFx+eYUxV5OmPcg
	G87YynxcrA9XxAGt+k3DccipD1/HHoWVGi/3K4vmlxTpxQbdSv1szECu4yTiRdJujzVR
	86gQ==
X-Gm-Message-State: AG10YOR6ZLg3Kl0q8G3mTOw/YHmFXokMsRjDnldeK3nd2FPmNqNxyP8YbgCqF1unXIAiig==
X-Received: by 10.140.18.114 with SMTP id 105mr16267988qge.41.1455483180239;
	Sun, 14 Feb 2016 12:53:00 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	q22sm9893272qkl.19.2016.02.14.12.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 12:52:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Feb 2016 20:52:49 +0000
Message-Id: <1455483171-66851-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
References: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/5] rpm: Fix build with musl
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
X-List-Received-Date: Sun, 14 Feb 2016 20:53:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpm/rpm/0001-rpm-Fix-build-on-musl.patch       | 162 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |   5 +-
 2 files changed, 166 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch b/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
new file mode 100644
index 0000000..763dc57
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
@@ -0,0 +1,162 @@
+From 0af17c2ae86c1e8e42b96f6dface08f535bb55ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Feb 2016 08:33:24 +0000
+Subject: [PATCH] rpm: Fix build on musl
+
+Provide alternatives to assumptions about glibc
+on linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ rpmio/fts.c       |  4 ++++
+ rpmqv.c           |  6 +++++-
+ system.h          |  2 +-
+ tools/debugedit.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
+ tools/rpmfind.c   |  6 +++---
+ 5 files changed, 60 insertions(+), 5 deletions(-)
+
+diff --git a/rpmio/fts.c b/rpmio/fts.c
+index 2d7594c..b7aa9b8 100644
+--- a/rpmio/fts.c
++++ b/rpmio/fts.c
+@@ -124,6 +124,10 @@ static char sccsid[] = "@(#)fts.c	8.6 (Berkeley) 8/14/94";
+ #   define __fxstat64(_stat_ver, _fd, _sbp)    fstat((_fd), (_sbp))
+ #endif
+ 
++#ifndef _STAT_VER
++#   define _STAT_VER      0
++#endif
++
+ #if !defined(_D_EXACT_NAMLEN)
+ #   define _D_EXACT_NAMLEN(d) (strlen((d)->d_name))
+ #endif
+diff --git a/rpmqv.c b/rpmqv.c
+index 14c73e2..b2d3e24 100644
+--- a/rpmqv.c
++++ b/rpmqv.c
+@@ -523,7 +523,11 @@ int main(int argc, const char ** argv)
+     (void) initproctitle(argc, (char **)argv, environ);
+ #endif
+ #endif  
+-
++    /* XXX glibc churn sanity */
++    if (__progname == NULL) {
++        if ((__progname = strrchr(argv[0], '/')) != NULL) __progname++;
++        else __progname = argv[0];
++    }
+     /* Set the major mode based on argv[0] */
+     /*@-nullpass@*/
+ #ifdef	IAM_RPMBT
+diff --git a/system.h b/system.h
+index 72851c0..05f7553 100644
+--- a/system.h
++++ b/system.h
+@@ -791,5 +791,5 @@ static inline const char *rcsid(const char *p) { \
+  * Permit ar(1) payloads. Disabled while rpmio/iosm.c is under development.
+  */
+ #undef	SUPPORT_AR_PAYLOADS
+-
+ #endif	/* H_SYSTEM */
++const char *program_name;
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index 29e8ee9..b2a8918 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -23,7 +23,12 @@
+ #include <byteswap.h>
+ #include <endian.h>
+ #include <errno.h>
++#ifdef __GLIBC__
+ #include <error.h>
++#else
++#include <stdarg.h>
++void error(int, int, const char *, ...);
++#endif
+ #include <limits.h>
+ #include <string.h>
+ #include <stdlib.h>
+@@ -1531,6 +1536,48 @@ handle_build_id (DSO *dso, Elf_Data *build_id,
+     puts (hex);
+   }
+ }
++#ifndef __GLIBC__
++extern char *__progname;
++
++void (*error_print_progname)(void) = 0;
++unsigned int error_message_count = 0;
++int error_one_per_line = 0;
++
++static void eprint(int status, int e, const char *file, unsigned int line, const char *fmt, va_list ap)
++{
++       if (file && error_one_per_line) {
++               static const char *oldfile;
++               static unsigned int oldline;
++               if (line == oldline && strcmp(file, oldfile) == 0)
++                       return;
++               oldfile = file;
++               oldline = line;
++       }
++       if (error_print_progname)
++               error_print_progname();
++       else
++               fprintf(stderr, "%s: ", __progname);
++       if (file)
++               fprintf(stderr, "%s:%u: ", file, line);
++       vfprintf(stderr, fmt, ap);
++      if (e)
++               fprintf(stderr, ": %s", strerror(e));
++       putc('\n', stderr);
++       fflush(stderr);
++       error_message_count++;
++       if (status)
++               exit(status);
++}
++
++void error(int status, int e, const char *fmt, ...)
++{
++       va_list ap;
++       va_start(ap,fmt);
++       eprint(status, e, 0, 0, fmt, ap);
++       va_end(ap);
++}
++
++#endif
+ 
+ /* It avoided the segment fault while file's bss offset have a large number.
+    See https://bugzilla.redhat.com/show_bug.cgi?id=1019707
+diff --git a/tools/rpmfind.c b/tools/rpmfind.c
+index 816aeef..327fab0 100644
+--- a/tools/rpmfind.c
++++ b/tools/rpmfind.c
+@@ -1174,7 +1174,7 @@ find_parsenum(PLAN *plan, const char *option, char *vp, char *endch)
+      * and endchar points to the beginning of the string we know we have
+      * a syntax error.
+      */
+-#if defined(__sun)
++#if defined(__sun) || !defined(__GLIBC_)
+     value = strtoll(str, &endchar, 10);
+ #else
+     value = strtoq(str, &endchar, 10);
+@@ -1214,7 +1214,7 @@ find_parsetime(PLAN *plan, const char *option, char *vp)
+ 	break;
+     }
+ 
+-#if defined(__sun)
++#if defined(__sun) || !defined(__GLIBC_)
+     value = strtoll(str, &unit, 10);
+ #else
+     value = strtoq(str, &unit, 10);
+@@ -1252,7 +1252,7 @@ find_parsetime(PLAN *plan, const char *option, char *vp)
+ 	str = unit + 1;
+ 	if (*str == '\0')	/* EOS */
+ 	    break;
+-#if defined(__sun)
++#if defined(__sun) || !defined(__GLIBC_)
+ 	value = strtoll(str, &unit, 10);
+ #else
+ 	value = strtoq(str, &unit, 10);
+-- 
+2.7.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 24aaf65..261b280 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -103,8 +103,11 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://0001-define-EM_AARCH64.patch \
 	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
 	   file://rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch \
-	  "
+"
 
+SRC_URI_append_libc-musl = "\
+           file://0001-rpm-Fix-build-on-musl.patch \
+"
 # Uncomment the following line to enable platform score debugging
 # This is useful when identifying issues with Smart being unable
 # to process certain package feeds.
-- 
2.7.1


