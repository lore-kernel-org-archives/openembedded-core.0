Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06697EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:30 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.9100.1689690389815579747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rwQZBi2N;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6686c74183cso5772246b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690389; x=1692282389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsAAXkhSia67lYmUiW39q3nSzzFD17qNN+iZGar2KLE=;
        b=rwQZBi2NQbqaF5Gmf7XgUhpymMmRJ5w77AphP8P8tWbKr4O/FAPPUKnTEI03Oe19Ci
         E5D0SfeJQWCuvnnrRyH67I0i3r/OKraiQTGkc4QK/YDqjtwYiFtrTKtNwY/byZwo2qXJ
         XvJ19i/DdVmo1Vk01ZD+TjJQMsstVx4qzkcItogEwiXPnRfnhiPP83Zy+03WAN3XG74r
         oohZL8yyy5YPdGW4wmeZjVvTlzAGZeJ5pPPcPxh02w/+XA2IFBONEqv/s/54FpTQ//XP
         rP1iubfSldcFG2ImIf78CilVJTt8keRp3ExlL2uZsdF+KoPW5wCf2VUfvLNfd6/ebhGy
         Eq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690389; x=1692282389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsAAXkhSia67lYmUiW39q3nSzzFD17qNN+iZGar2KLE=;
        b=UfpbGz8uLrHlrGzGYO6bJ6/VY9KUiKFXK50Rhny79wJeFzDvNWIF4Y9PmrLgh72qQZ
         zpcPy+HBbBirl0AMPBeRVHmQcNKn2pM70l/gj6ItsgNRG4zMd9V3aR+yfg3Ly/RRLjab
         eSRFyBpb0rNyoWLrJOYs8NPXHhyEicyMwAuIY5Ch+0B+i3KsmZx60oLnSwlvI8LR9wdD
         HvAxjb7vP1R+SEE3gpW9LH58vlglMT8FxmmplW8pqjB82Z1jnra2PEh2bLG5HUuySfyf
         cblsIGk13aUJBQZ+xOKzEoVCPrTaofUA+zxComI5pWSmXGZhCX1MeLIo1blSsG+UVz+y
         6Utw==
X-Gm-Message-State: ABy/qLbbV36PSjcSj/i2dnPGiG9eYMLNK8ponWS/2jlV/+GThOxEmJdU
	dLxCJbSBJYc4BpiN9/3+VF2c5RQLTAt5vnUnKT0=
X-Google-Smtp-Source: APBJJlHJeO2zr782rD59Xtjr/gpR/Dux27y5YTDnjgYHdSOx3eTj8NjrEyyaIZu0ibYz1cbIgGN10w==
X-Received: by 2002:a05:6a00:846:b0:684:6bd8:4e3b with SMTP id q6-20020a056a00084600b006846bd84e3bmr13723744pfk.19.1689690388788;
        Tue, 18 Jul 2023 07:26:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/27] tzdata: upgrade to 2023c
Date: Tue, 18 Jul 2023 04:25:41 -1000
Message-Id: <134bac52904722cd63fde07f5784c0cca3fbcb05.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184511

From: Ross Burton <ross.burton@arm.com>

Drop a backport patch as it is now integrated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 80d26d1da47dcd9213a7083d9493a7bce0897a57)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   2 -
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ------------------
 3 files changed, 3 insertions(+), 306 deletions(-)
 delete mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index eec7177228..14a1ce18f3 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022g"
+PV = "2023c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
-SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
+SRC_URI[tzcode.sha256sum] = "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
+SRC_URI[tzdata.sha256sum] = "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index 6d52b3c422..d0b23a9d80 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -2,8 +2,6 @@ require timezone.inc
 
 SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
-SRC_URI += "file://0001-Fix-C23-related-conformance-bug.patch"
-
 inherit native
 
 EXTRA_OEMAKE += "cc='${CC}'"
diff --git a/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch b/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
deleted file mode 100644
index c91ef93e95..0000000000
--- a/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
+++ /dev/null
@@ -1,301 +0,0 @@
-From 509c5974398952618abdd17f39117b88e3f50057 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 1 Dec 2022 10:28:04 -0800
-Subject: [PATCH] Fix C23-related conformance bug
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Houge Langley for ‘gcc -std=gnu99’ in:
-https://bugs.gentoo.org/show_bug.cgi?id=883719
-* NEWS: Mention this.
-* date.c, localtime.c, private.h, zdump.c, zic.c:
-Use ATTRIBUTE_* at the start of function declarations,
-not later (such as after the keyword ‘static’).
-This is required for strict conformance to C23.
-
-Upstream-Status: Backport [https://github.com/eggert/tz/commit/9cfe9507fcc22cd4a0c4da486ea1c7f0de6b075f]
-
-NEWS change skipped to avoid conflicts.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- date.c      |  2 +-
- localtime.c |  4 ++--
- private.h   |  6 +++---
- zdump.c     | 12 ++++++------
- zic.c       | 34 +++++++++++++++++-----------------
- 5 files changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/date.c b/date.c
-index 11c5e5fe..97df6ab0 100644
---- a/date.c
-+++ b/date.c
-@@ -42,7 +42,7 @@ static void		display(const char *, time_t);
- static void		dogmt(void);
- static void		errensure(void);
- static void		timeout(FILE *, const char *, const struct tm *);
--static ATTRIBUTE_NORETURN void usage(void);
-+ATTRIBUTE_NORETURN static void usage(void);
- 
- int
- main(const int argc, char *argv[])
-diff --git a/localtime.c b/localtime.c
-index 1d22d351..3bf1b911 100644
---- a/localtime.c
-+++ b/localtime.c
-@@ -838,7 +838,7 @@ is_digit(char c)
- ** Return a pointer to that character.
- */
- 
--static ATTRIBUTE_REPRODUCIBLE const char *
-+ATTRIBUTE_REPRODUCIBLE static const char *
- getzname(register const char *strp)
- {
- 	register char	c;
-@@ -859,7 +859,7 @@ getzname(register const char *strp)
- ** We don't do any checking here; checking is done later in common-case code.
- */
- 
--static ATTRIBUTE_REPRODUCIBLE const char *
-+ATTRIBUTE_REPRODUCIBLE static const char *
- getqzname(register const char *strp, const int delim)
- {
- 	register int	c;
-diff --git a/private.h b/private.h
-index 7a73eff7..ae522986 100644
---- a/private.h
-+++ b/private.h
-@@ -628,7 +628,7 @@ char *asctime(struct tm const *);
- char *asctime_r(struct tm const *restrict, char *restrict);
- char *ctime(time_t const *);
- char *ctime_r(time_t const *, char *);
--double difftime(time_t, time_t) ATTRIBUTE_UNSEQUENCED;
-+ATTRIBUTE_UNSEQUENCED double difftime(time_t, time_t);
- size_t strftime(char *restrict, size_t, char const *restrict,
- 		struct tm const *restrict);
- # if HAVE_STRFTIME_L
-@@ -740,10 +740,10 @@ timezone_t tzalloc(char const *);
- void tzfree(timezone_t);
- # ifdef STD_INSPIRED
- #  if TZ_TIME_T || !defined posix2time_z
--time_t posix2time_z(timezone_t, time_t) ATTRIBUTE_REPRODUCIBLE;
-+ATTRIBUTE_REPRODUCIBLE time_t posix2time_z(timezone_t, time_t);
- #  endif
- #  if TZ_TIME_T || !defined time2posix_z
--time_t time2posix_z(timezone_t, time_t) ATTRIBUTE_REPRODUCIBLE;
-+ATTRIBUTE_REPRODUCIBLE time_t time2posix_z(timezone_t, time_t);
- #  endif
- # endif
- #endif
-diff --git a/zdump.c b/zdump.c
-index 7acb3e2d..3e482ba3 100644
---- a/zdump.c
-+++ b/zdump.c
-@@ -89,7 +89,7 @@ static bool	warned;
- static bool	errout;
- 
- static char const *abbr(struct tm const *);
--static intmax_t	delta(struct tm *, struct tm *) ATTRIBUTE_REPRODUCIBLE;
-+ATTRIBUTE_REPRODUCIBLE static intmax_t delta(struct tm *, struct tm *);
- static void dumptime(struct tm const *);
- static time_t hunt(timezone_t, time_t, time_t, bool);
- static void show(timezone_t, char *, time_t, bool);
-@@ -97,7 +97,7 @@ static void showextrema(timezone_t, char *, time_t, struct tm *, time_t);
- static void showtrans(char const *, struct tm const *, time_t, char const *,
- 		      char const *);
- static const char *tformat(void);
--static time_t yeartot(intmax_t) ATTRIBUTE_REPRODUCIBLE;
-+ATTRIBUTE_REPRODUCIBLE static time_t yeartot(intmax_t);
- 
- /* Is C an ASCII digit?  */
- static bool
-@@ -125,7 +125,7 @@ is_alpha(char a)
- 	}
- }
- 
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- size_overflow(void)
- {
-   fprintf(stderr, _("%s: size overflow\n"), progname);
-@@ -134,7 +134,7 @@ size_overflow(void)
- 
- /* Return A + B, exiting if the result would overflow either ptrdiff_t
-    or size_t.  */
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- sumsize(size_t a, size_t b)
- {
- #ifdef ckd_add
-@@ -151,7 +151,7 @@ sumsize(size_t a, size_t b)
- 
- /* Return a pointer to a newly allocated buffer of size SIZE, exiting
-    on failure.  SIZE should be nonzero.  */
--static void * ATTRIBUTE_MALLOC
-+ATTRIBUTE_MALLOC static void *
- xmalloc(size_t size)
- {
-   void *p = malloc(size);
-@@ -920,7 +920,7 @@ showextrema(timezone_t tz, char *zone, time_t lo, struct tm *lotmp, time_t hi)
- # include <stdarg.h>
- 
- /* A substitute for snprintf that is good enough for zdump.  */
--static int ATTRIBUTE_FORMAT((printf, 3, 4))
-+ATTRIBUTE_FORMAT((printf, 3, 4)) static int
- my_snprintf(char *s, size_t size, char const *format, ...)
- {
-   int n;
-diff --git a/zic.c b/zic.c
-index 892414af..f143fcef 100644
---- a/zic.c
-+++ b/zic.c
-@@ -459,20 +459,20 @@ static char		roll[TZ_MAX_LEAPS];
- ** Memory allocation.
- */
- 
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- memory_exhausted(const char *msg)
- {
- 	fprintf(stderr, _("%s: Memory exhausted: %s\n"), progname, msg);
- 	exit(EXIT_FAILURE);
- }
- 
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- size_overflow(void)
- {
-   memory_exhausted(_("size overflow"));
- }
- 
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- size_sum(size_t a, size_t b)
- {
- #ifdef ckd_add
-@@ -487,7 +487,7 @@ size_sum(size_t a, size_t b)
-   size_overflow();
- }
- 
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- size_product(ptrdiff_t nitems, ptrdiff_t itemsize)
- {
- #ifdef ckd_mul
-@@ -502,7 +502,7 @@ size_product(ptrdiff_t nitems, ptrdiff_t itemsize)
-   size_overflow();
- }
- 
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- align_to(ptrdiff_t size, ptrdiff_t alignment)
- {
-   ptrdiff_t lo_bits = alignment - 1, sum = size_sum(size, lo_bits);
-@@ -526,7 +526,7 @@ memcheck(void *ptr)
- 	return ptr;
- }
- 
--static void * ATTRIBUTE_MALLOC
-+ATTRIBUTE_MALLOC static void *
- emalloc(size_t size)
- {
-   return memcheck(malloc(size));
-@@ -538,7 +538,7 @@ erealloc(void *ptr, size_t size)
-   return memcheck(realloc(ptr, size));
- }
- 
--static char * ATTRIBUTE_MALLOC
-+ATTRIBUTE_MALLOC static char *
- estrdup(char const *str)
- {
-   return memcheck(strdup(str));
-@@ -608,7 +608,7 @@ eat(int fnum, lineno num)
- 	eats(fnum, num, 0, -1);
- }
- 
--static void ATTRIBUTE_FORMAT((printf, 1, 0))
-+ATTRIBUTE_FORMAT((printf, 1, 0)) static void
- verror(const char *const string, va_list args)
- {
- 	/*
-@@ -626,7 +626,7 @@ verror(const char *const string, va_list args)
- 	fprintf(stderr, "\n");
- }
- 
--static void ATTRIBUTE_FORMAT((printf, 1, 2))
-+ATTRIBUTE_FORMAT((printf, 1, 2)) static void
- error(const char *const string, ...)
- {
- 	va_list args;
-@@ -636,7 +636,7 @@ error(const char *const string, ...)
- 	errors = true;
- }
- 
--static void ATTRIBUTE_FORMAT((printf, 1, 2))
-+ATTRIBUTE_FORMAT((printf, 1, 2)) static void
- warning(const char *const string, ...)
- {
- 	va_list args;
-@@ -666,7 +666,7 @@ close_file(FILE *stream, char const *dir, char const *name,
-   }
- }
- 
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- usage(FILE *stream, int status)
- {
-   fprintf(stream,
-@@ -3597,7 +3597,7 @@ lowerit(char a)
- }
- 
- /* case-insensitive equality */
--static ATTRIBUTE_REPRODUCIBLE bool
-+ATTRIBUTE_REPRODUCIBLE static bool
- ciequal(register const char *ap, register const char *bp)
- {
- 	while (lowerit(*ap) == lowerit(*bp++))
-@@ -3606,7 +3606,7 @@ ciequal(register const char *ap, register const char *bp)
- 	return false;
- }
- 
--static ATTRIBUTE_REPRODUCIBLE bool
-+ATTRIBUTE_REPRODUCIBLE static bool
- itsabbr(register const char *abbr, register const char *word)
- {
- 	if (lowerit(*abbr) != lowerit(*word))
-@@ -3622,7 +3622,7 @@ itsabbr(register const char *abbr, register const char *word)
- 
- /* Return true if ABBR is an initial prefix of WORD, ignoring ASCII case.  */
- 
--static ATTRIBUTE_REPRODUCIBLE bool
-+ATTRIBUTE_REPRODUCIBLE static bool
- ciprefix(char const *abbr, char const *word)
- {
-   do
-@@ -3725,14 +3725,14 @@ getfields(char *cp, char **array, int arrayelts)
- 	return nsubs;
- }
- 
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- time_overflow(void)
- {
-   error(_("time overflow"));
-   exit(EXIT_FAILURE);
- }
- 
--static ATTRIBUTE_REPRODUCIBLE zic_t
-+ATTRIBUTE_REPRODUCIBLE static zic_t
- oadd(zic_t t1, zic_t t2)
- {
- #ifdef ckd_add
-@@ -3746,7 +3746,7 @@ oadd(zic_t t1, zic_t t2)
-   time_overflow();
- }
- 
--static ATTRIBUTE_REPRODUCIBLE zic_t
-+ATTRIBUTE_REPRODUCIBLE static zic_t
- tadd(zic_t t1, zic_t t2)
- {
- #ifdef ckd_add
-- 
2.34.1


