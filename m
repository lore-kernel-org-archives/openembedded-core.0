Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D758BC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 21:20:42 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.6511.1678742433692273708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 14:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hakXEidd;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id o12so54215450edb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678742432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX7yF1xu4Ry1Vj/1zkwGBO6qLvOfWmuhhDsKKVK3QGs=;
        b=hakXEiddYlMgfQoC7Im5AO2cv3ZEhjcBNFnLoOOVp6U55j7hllZzAMMuLAjBX0kZ/j
         gEbCk1XUdC/1/LcyxC0k5KZIZmD5XDzM9NqinDfOpw5ULn1GqgwxT9HShT+hsazp36bo
         7Yorx6lXt9JWKCY0Ei072cRE07ROro9szoM1WzGAG7MVBJ5Y+WeVen18eutCvndjNzOC
         i42iZICj4AebghNeBrQ8Zx4H8TiK8lJ5p3UEh/S8MUqtRfkCmegKETWYo21tTDyeqnRB
         J0hFkylzTzZP0bQbs6lZfZYuutmXkpjFI687uv0ENErjRWwtb1l436xk1UYABGaXoRKF
         hneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678742432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WX7yF1xu4Ry1Vj/1zkwGBO6qLvOfWmuhhDsKKVK3QGs=;
        b=vbZM2xbABx96aVrahUdpT221cCd7luGkx4JfxpuQOo5D/nxkxStAX35WTvIdrmDzsJ
         mHSlFrBqGkbD5FBAjP8DaSJVyYooK2Ha4+rvswQFGtfKkE2mNLyDC3Ri/xKieumRNfuE
         OErrrVrZKp31YjjUi461BwjokGRddVnBixEiBrA1RSEICbKJei9Wri/yJJpMlEzfyG/u
         p2ou9sNbzeKu6+iotxe/KlcqwsgKUzA6Xw9b/4P5QN2F/KyT90lnA2yvtfXyz1ET8o44
         ykpYzr2iZHdkjsLyOo1awVT0qP04MJ7WeQi6IvuASdueKnHfIxN22s1/HsI38FUvdFjF
         F90w==
X-Gm-Message-State: AO0yUKVGeuE61EBQOBNP7XP5wbjmu5yYDssBaBvkvtjYcQolwXBTUBu1
	wMRY8ROiv66X2HpFU3Jbk1IbcuZy3Sc=
X-Google-Smtp-Source: AK7set9yfUc1rNGUQT0/nwD/bvQC5mqldJ9uk00bCQyyAiPNyd6rn/kdHsgI0K3Qh0E/1zllhPlvGg==
X-Received: by 2002:a17:906:1d01:b0:923:1714:b3d0 with SMTP id n1-20020a1709061d0100b009231714b3d0mr8065816ejh.19.1678742431809;
        Mon, 13 Mar 2023 14:20:31 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qt22-20020a170906ecf600b009240a577b38sm261270ejb.14.2023.03.13.14.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:20:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] tzcode-native: fix build with gcc-13 on host
Date: Mon, 13 Mar 2023 21:20:22 +0000
Message-Id: <20230313212022.2345585-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <174BF5DA86C3B185.25836@lists.openembedded.org>
References: <174BF5DA86C3B185.25836@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 21:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178466

* passing -std=c2x to avoid build failure with gcc-13 on host
  works as well, but the resulting zic then segfaults when
  used in tzdata, use a fix from upstream instead

* reported upstream in https://mm.icann.org/pipermail/tz/2023-March/032690.html

* fixes:
  http://errors.yoctoproject.org/Errors/Details/697913/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../timezone/tzcode-native.bb                 |   2 +
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ++++++++++++++++++
 2 files changed, 303 insertions(+)
 create mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch

diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index d0b23a9d80..6d52b3c422 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -2,6 +2,8 @@ require timezone.inc
 
 SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
+SRC_URI += "file://0001-Fix-C23-related-conformance-bug.patch"
+
 inherit native
 
 EXTRA_OEMAKE += "cc='${CC}'"
diff --git a/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch b/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
new file mode 100644
index 0000000000..c91ef93e95
--- /dev/null
+++ b/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
@@ -0,0 +1,301 @@
+From 509c5974398952618abdd17f39117b88e3f50057 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 1 Dec 2022 10:28:04 -0800
+Subject: [PATCH] Fix C23-related conformance bug
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Houge Langley for ‘gcc -std=gnu99’ in:
+https://bugs.gentoo.org/show_bug.cgi?id=883719
+* NEWS: Mention this.
+* date.c, localtime.c, private.h, zdump.c, zic.c:
+Use ATTRIBUTE_* at the start of function declarations,
+not later (such as after the keyword ‘static’).
+This is required for strict conformance to C23.
+
+Upstream-Status: Backport [https://github.com/eggert/tz/commit/9cfe9507fcc22cd4a0c4da486ea1c7f0de6b075f]
+
+NEWS change skipped to avoid conflicts.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ date.c      |  2 +-
+ localtime.c |  4 ++--
+ private.h   |  6 +++---
+ zdump.c     | 12 ++++++------
+ zic.c       | 34 +++++++++++++++++-----------------
+ 5 files changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/date.c b/date.c
+index 11c5e5fe..97df6ab0 100644
+--- a/date.c
++++ b/date.c
+@@ -42,7 +42,7 @@ static void		display(const char *, time_t);
+ static void		dogmt(void);
+ static void		errensure(void);
+ static void		timeout(FILE *, const char *, const struct tm *);
+-static ATTRIBUTE_NORETURN void usage(void);
++ATTRIBUTE_NORETURN static void usage(void);
+ 
+ int
+ main(const int argc, char *argv[])
+diff --git a/localtime.c b/localtime.c
+index 1d22d351..3bf1b911 100644
+--- a/localtime.c
++++ b/localtime.c
+@@ -838,7 +838,7 @@ is_digit(char c)
+ ** Return a pointer to that character.
+ */
+ 
+-static ATTRIBUTE_REPRODUCIBLE const char *
++ATTRIBUTE_REPRODUCIBLE static const char *
+ getzname(register const char *strp)
+ {
+ 	register char	c;
+@@ -859,7 +859,7 @@ getzname(register const char *strp)
+ ** We don't do any checking here; checking is done later in common-case code.
+ */
+ 
+-static ATTRIBUTE_REPRODUCIBLE const char *
++ATTRIBUTE_REPRODUCIBLE static const char *
+ getqzname(register const char *strp, const int delim)
+ {
+ 	register int	c;
+diff --git a/private.h b/private.h
+index 7a73eff7..ae522986 100644
+--- a/private.h
++++ b/private.h
+@@ -628,7 +628,7 @@ char *asctime(struct tm const *);
+ char *asctime_r(struct tm const *restrict, char *restrict);
+ char *ctime(time_t const *);
+ char *ctime_r(time_t const *, char *);
+-double difftime(time_t, time_t) ATTRIBUTE_UNSEQUENCED;
++ATTRIBUTE_UNSEQUENCED double difftime(time_t, time_t);
+ size_t strftime(char *restrict, size_t, char const *restrict,
+ 		struct tm const *restrict);
+ # if HAVE_STRFTIME_L
+@@ -740,10 +740,10 @@ timezone_t tzalloc(char const *);
+ void tzfree(timezone_t);
+ # ifdef STD_INSPIRED
+ #  if TZ_TIME_T || !defined posix2time_z
+-time_t posix2time_z(timezone_t, time_t) ATTRIBUTE_REPRODUCIBLE;
++ATTRIBUTE_REPRODUCIBLE time_t posix2time_z(timezone_t, time_t);
+ #  endif
+ #  if TZ_TIME_T || !defined time2posix_z
+-time_t time2posix_z(timezone_t, time_t) ATTRIBUTE_REPRODUCIBLE;
++ATTRIBUTE_REPRODUCIBLE time_t time2posix_z(timezone_t, time_t);
+ #  endif
+ # endif
+ #endif
+diff --git a/zdump.c b/zdump.c
+index 7acb3e2d..3e482ba3 100644
+--- a/zdump.c
++++ b/zdump.c
+@@ -89,7 +89,7 @@ static bool	warned;
+ static bool	errout;
+ 
+ static char const *abbr(struct tm const *);
+-static intmax_t	delta(struct tm *, struct tm *) ATTRIBUTE_REPRODUCIBLE;
++ATTRIBUTE_REPRODUCIBLE static intmax_t delta(struct tm *, struct tm *);
+ static void dumptime(struct tm const *);
+ static time_t hunt(timezone_t, time_t, time_t, bool);
+ static void show(timezone_t, char *, time_t, bool);
+@@ -97,7 +97,7 @@ static void showextrema(timezone_t, char *, time_t, struct tm *, time_t);
+ static void showtrans(char const *, struct tm const *, time_t, char const *,
+ 		      char const *);
+ static const char *tformat(void);
+-static time_t yeartot(intmax_t) ATTRIBUTE_REPRODUCIBLE;
++ATTRIBUTE_REPRODUCIBLE static time_t yeartot(intmax_t);
+ 
+ /* Is C an ASCII digit?  */
+ static bool
+@@ -125,7 +125,7 @@ is_alpha(char a)
+ 	}
+ }
+ 
+-static ATTRIBUTE_NORETURN void
++ATTRIBUTE_NORETURN static void
+ size_overflow(void)
+ {
+   fprintf(stderr, _("%s: size overflow\n"), progname);
+@@ -134,7 +134,7 @@ size_overflow(void)
+ 
+ /* Return A + B, exiting if the result would overflow either ptrdiff_t
+    or size_t.  */
+-static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
++ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
+ sumsize(size_t a, size_t b)
+ {
+ #ifdef ckd_add
+@@ -151,7 +151,7 @@ sumsize(size_t a, size_t b)
+ 
+ /* Return a pointer to a newly allocated buffer of size SIZE, exiting
+    on failure.  SIZE should be nonzero.  */
+-static void * ATTRIBUTE_MALLOC
++ATTRIBUTE_MALLOC static void *
+ xmalloc(size_t size)
+ {
+   void *p = malloc(size);
+@@ -920,7 +920,7 @@ showextrema(timezone_t tz, char *zone, time_t lo, struct tm *lotmp, time_t hi)
+ # include <stdarg.h>
+ 
+ /* A substitute for snprintf that is good enough for zdump.  */
+-static int ATTRIBUTE_FORMAT((printf, 3, 4))
++ATTRIBUTE_FORMAT((printf, 3, 4)) static int
+ my_snprintf(char *s, size_t size, char const *format, ...)
+ {
+   int n;
+diff --git a/zic.c b/zic.c
+index 892414af..f143fcef 100644
+--- a/zic.c
++++ b/zic.c
+@@ -459,20 +459,20 @@ static char		roll[TZ_MAX_LEAPS];
+ ** Memory allocation.
+ */
+ 
+-static ATTRIBUTE_NORETURN void
++ATTRIBUTE_NORETURN static void
+ memory_exhausted(const char *msg)
+ {
+ 	fprintf(stderr, _("%s: Memory exhausted: %s\n"), progname, msg);
+ 	exit(EXIT_FAILURE);
+ }
+ 
+-static ATTRIBUTE_NORETURN void
++ATTRIBUTE_NORETURN static void
+ size_overflow(void)
+ {
+   memory_exhausted(_("size overflow"));
+ }
+ 
+-static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
++ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
+ size_sum(size_t a, size_t b)
+ {
+ #ifdef ckd_add
+@@ -487,7 +487,7 @@ size_sum(size_t a, size_t b)
+   size_overflow();
+ }
+ 
+-static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
++ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
+ size_product(ptrdiff_t nitems, ptrdiff_t itemsize)
+ {
+ #ifdef ckd_mul
+@@ -502,7 +502,7 @@ size_product(ptrdiff_t nitems, ptrdiff_t itemsize)
+   size_overflow();
+ }
+ 
+-static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
++ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
+ align_to(ptrdiff_t size, ptrdiff_t alignment)
+ {
+   ptrdiff_t lo_bits = alignment - 1, sum = size_sum(size, lo_bits);
+@@ -526,7 +526,7 @@ memcheck(void *ptr)
+ 	return ptr;
+ }
+ 
+-static void * ATTRIBUTE_MALLOC
++ATTRIBUTE_MALLOC static void *
+ emalloc(size_t size)
+ {
+   return memcheck(malloc(size));
+@@ -538,7 +538,7 @@ erealloc(void *ptr, size_t size)
+   return memcheck(realloc(ptr, size));
+ }
+ 
+-static char * ATTRIBUTE_MALLOC
++ATTRIBUTE_MALLOC static char *
+ estrdup(char const *str)
+ {
+   return memcheck(strdup(str));
+@@ -608,7 +608,7 @@ eat(int fnum, lineno num)
+ 	eats(fnum, num, 0, -1);
+ }
+ 
+-static void ATTRIBUTE_FORMAT((printf, 1, 0))
++ATTRIBUTE_FORMAT((printf, 1, 0)) static void
+ verror(const char *const string, va_list args)
+ {
+ 	/*
+@@ -626,7 +626,7 @@ verror(const char *const string, va_list args)
+ 	fprintf(stderr, "\n");
+ }
+ 
+-static void ATTRIBUTE_FORMAT((printf, 1, 2))
++ATTRIBUTE_FORMAT((printf, 1, 2)) static void
+ error(const char *const string, ...)
+ {
+ 	va_list args;
+@@ -636,7 +636,7 @@ error(const char *const string, ...)
+ 	errors = true;
+ }
+ 
+-static void ATTRIBUTE_FORMAT((printf, 1, 2))
++ATTRIBUTE_FORMAT((printf, 1, 2)) static void
+ warning(const char *const string, ...)
+ {
+ 	va_list args;
+@@ -666,7 +666,7 @@ close_file(FILE *stream, char const *dir, char const *name,
+   }
+ }
+ 
+-static ATTRIBUTE_NORETURN void
++ATTRIBUTE_NORETURN static void
+ usage(FILE *stream, int status)
+ {
+   fprintf(stream,
+@@ -3597,7 +3597,7 @@ lowerit(char a)
+ }
+ 
+ /* case-insensitive equality */
+-static ATTRIBUTE_REPRODUCIBLE bool
++ATTRIBUTE_REPRODUCIBLE static bool
+ ciequal(register const char *ap, register const char *bp)
+ {
+ 	while (lowerit(*ap) == lowerit(*bp++))
+@@ -3606,7 +3606,7 @@ ciequal(register const char *ap, register const char *bp)
+ 	return false;
+ }
+ 
+-static ATTRIBUTE_REPRODUCIBLE bool
++ATTRIBUTE_REPRODUCIBLE static bool
+ itsabbr(register const char *abbr, register const char *word)
+ {
+ 	if (lowerit(*abbr) != lowerit(*word))
+@@ -3622,7 +3622,7 @@ itsabbr(register const char *abbr, register const char *word)
+ 
+ /* Return true if ABBR is an initial prefix of WORD, ignoring ASCII case.  */
+ 
+-static ATTRIBUTE_REPRODUCIBLE bool
++ATTRIBUTE_REPRODUCIBLE static bool
+ ciprefix(char const *abbr, char const *word)
+ {
+   do
+@@ -3725,14 +3725,14 @@ getfields(char *cp, char **array, int arrayelts)
+ 	return nsubs;
+ }
+ 
+-static ATTRIBUTE_NORETURN void
++ATTRIBUTE_NORETURN static void
+ time_overflow(void)
+ {
+   error(_("time overflow"));
+   exit(EXIT_FAILURE);
+ }
+ 
+-static ATTRIBUTE_REPRODUCIBLE zic_t
++ATTRIBUTE_REPRODUCIBLE static zic_t
+ oadd(zic_t t1, zic_t t2)
+ {
+ #ifdef ckd_add
+@@ -3746,7 +3746,7 @@ oadd(zic_t t1, zic_t t2)
+   time_overflow();
+ }
+ 
+-static ATTRIBUTE_REPRODUCIBLE zic_t
++ATTRIBUTE_REPRODUCIBLE static zic_t
+ tadd(zic_t t1, zic_t t2)
+ {
+ #ifdef ckd_add

