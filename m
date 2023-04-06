Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D45CC761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:26 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.162485.1680796920610777600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3mZT3kDj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id u38so26062683pfg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796944; x=1683388944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsAAXkhSia67lYmUiW39q3nSzzFD17qNN+iZGar2KLE=;
        b=3mZT3kDjeOrh7jCkel1DNWSsHm7LRRs4GUsM/+jQZTD1Cuf/0Od2pK1xlBFUCIeldQ
         paJMrxMEclyvHqKlsWaAWspz702j+zKT1xaqUCEVAJruLl510vAtjZrTAVTtS6VBt7EH
         rhjjwDwVgS5uqY/sRAtbrJfGuoLEj3Xnvz+G1aNsQYtMQR6L0YGT8zzhzJO69dUIWCfs
         kJfYAb67h+6kXRV1jr4rrwb/Z7CiUOHVKuwasjJIAGsJ9sLn+2teWCsNnEpuGPh+29Ey
         BJs1ttN1AjBuhKfo2r52wuMYosD79KMMITVqPjFXomEw2NrazBPN0U9BUdlXxCtdrX+U
         kYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796944; x=1683388944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsAAXkhSia67lYmUiW39q3nSzzFD17qNN+iZGar2KLE=;
        b=qNqAuMgzHIFCiRKZi8wWCWkBOm4QCx62QhD+3Cy6vyyKTBOt+06QyDf/cz/PqgDd4g
         jzk0q7XLJQwkWW1ElnmMJKAmugytR/gFvM/VQ6uHBtTDrhxl558IqaA744NYVR001RmW
         XIfreTdOrAjaViOzUzbbYXp/yrIY3ql+CbjC2/OXTYzOPVWj77ynrKIc/Sb2vkFrWrB1
         ehLp/2syLB0lLSEfbahawKi1nkB3Mh3Ph4jzpcCQzuEnOJbzBcDN9Xg8q6Ko8Un5JlUt
         nTZSqbKGkqRC8byiS297aumYaaXJt7MX2TtFeD3IM55djKkUAY0aoHelqbc68DnzT33+
         VJ4g==
X-Gm-Message-State: AAQBX9cdFqUx+HcM3Z5dj8iLx7P6QoIy1GHg+OrAWtYZq5kV1QX7CiRx
	YYsNOF6LOY655xFQgG5ILylGqE59WGJKzw0CkdY=
X-Google-Smtp-Source: AKy350aDeaYRwEQFUqiJQbWqFH+IecOQGQekwHoYogVIyE2fWrmQeuDUkV2MBR9ZffiG9hYQfircIg==
X-Received: by 2002:aa7:9734:0:b0:627:e61e:1ae with SMTP id k20-20020aa79734000000b00627e61e01aemr9423400pfg.12.1680796943833;
        Thu, 06 Apr 2023 09:02:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/26] tzdata: upgrade to 2023c
Date: Thu,  6 Apr 2023 06:01:30 -1000
Message-Id: <b8c2ec59f0cf18f5bfaea87d4cef3e8be093d98b.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179781

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


