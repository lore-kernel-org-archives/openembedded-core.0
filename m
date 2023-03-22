Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12002C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:14 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.44319.1679494932576874597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mot/rSi2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id h31so10657989pgl.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOCrAd5MwzKOgoAraP4kDcucYPo68ravRFD6Cdz5f+w=;
        b=mot/rSi2uihH2n1wgB49cpbujh3EzuhejYWDEDVhjdLO8Y0UmQTsWFWfb4aqojf8JT
         DONGNxNx8KQswXnMRGKnWbL8fx8rr3blw3HFADMamLy47fksgPpg9MBPn8C8a6il9Jf2
         dwErAdQvDmp1QMw1H90iPG4t/4LNk0Tomq/XeUk5yC8GXBRKTt6p01X4PuLpGPwC7fJg
         /YY8MO1I1zzf0RJPewqxVbKWDDvkfen4mGyWIhhhiZcIrjiJ9RpXjuWWLFEuPzQGIjQQ
         jtXeq8ZE0JlJHU08rShyhhO17iJ/U9CD3u594bA9JY92NvH5NhKkPIoMxUcls0LP0UZE
         L8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOCrAd5MwzKOgoAraP4kDcucYPo68ravRFD6Cdz5f+w=;
        b=jIplZhhVYv78EscDN7OAeyc00Iy4lfpim1w44AFTgOTJi53j8rx38lOdTXhFLqte5Y
         wiG1gtj/gK0ZtzA1/YfXYmVc+jpowe8za/2vp8JJN+8W4ee9YWfgM/4oJj+aUEHE2voZ
         /dlXPfS/e/yYNfxmxTIRCuWQWt2rzgkGSiwAFKDXzRhZC2+q2H2J/F3LBKdh/KeKuTSE
         Z6UfWXYebjZeFEVQ2oHldfbo7WWM8QSg9/fDpwqywtothWNd+lvZWn2c4lppH980e69T
         tQkakI/+sX/LhIEviKYXTuaW/vTUGniG/+jRu3HAkMoMPfEpXE7/mEx22YcAriEjoMUJ
         gMnw==
X-Gm-Message-State: AO0yUKXCbag7TGsaT5epDpIAu6m/bD10uvnyCe26pY+PMEsFqE9eeGf6
	wgn62GjyVwajhphMI++rP+ZKT0QMHAvoe4g+x9E=
X-Google-Smtp-Source: AK7set8iCWrHCxV8kKJS6SKiVh5xybYDC2ungf482+Ik3kiVaNvFz6xSHgFDV3osNmrHe9Lak80t3Q==
X-Received: by 2002:aa7:9e04:0:b0:625:500c:35bd with SMTP id y4-20020aa79e04000000b00625500c35bdmr2571088pfq.6.1679494931482;
        Wed, 22 Mar 2023 07:22:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/21] tzcode-native: fix build with gcc-13 on host
Date: Wed, 22 Mar 2023 04:21:32 -1000
Message-Id: <8aa68cd570212969959131578d105b53d0859e47.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178938

From: Martin Jansa <Martin.Jansa@gmail.com>

* passing -std=c2x to avoid build failure with gcc-13 on host
  works as well, but the resulting zic then segfaults when
  used in tzdata, use a fix from upstream instead

* reported upstream in https://mm.icann.org/pipermail/tz/2023-March/032690.html

* fixes:
  http://errors.yoctoproject.org/Errors/Details/697913/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dabf677f38c209fb6a8ba837d5a66fd89f57d4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.34.1


