Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A77C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:17:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24900.1680182225864740024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 304862F4;
	Thu, 30 Mar 2023 06:17:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 688633F663;
	Thu, 30 Mar 2023 06:17:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] tzdata: upgrade to 2023c
Date: Thu, 30 Mar 2023 14:17:01 +0100
Message-Id: <20230330131701.2870400-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179320

Drop a backport patch as it is now integrated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   2 -
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ------------------
 3 files changed, 3 insertions(+), 306 deletions(-)
 delete mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-re=
lated-conformance-bug.patch

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-e=
xtended/timezone/timezone.inc
index eec7177228c..14a1ce18f33 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION =3D "base"
 LICENSE =3D "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43=
fba"
=20
-PV =3D "2022g"
+PV =3D "2023c"
=20
 SRC_URI =3D" http://www.iana.org/time-zones/repository/releases/tzcode${=
PV}.tar.gz;name=3Dtzcode;subdir=3Dtz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV=
}.tar.gz;name=3Dtzdata;subdir=3Dtz \
@@ -16,5 +16,5 @@ S =3D "${WORKDIR}/tz"
=20
 UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
=20
-SRC_URI[tzcode.sha256sum] =3D "9610bb0b9656ff404c361a41f3286da53064b5469=
d84f00c9cb2314c8614da74"
-SRC_URI[tzdata.sha256sum] =3D "4491db8281ae94a84d939e427bdd83dc389f26764=
d27d9a5c52d782c16764478"
+SRC_URI[tzcode.sha256sum] =3D "46d17f2bb19ad73290f03a203006152e0fa0d7b11=
e5b71467c4a823811b214e7"
+SRC_URI[tzdata.sha256sum] =3D "3f510b5d1b4ae9bb38e485aa302a776b317fb3637=
bdb6404c4adf7b6cadd965c"
diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recip=
es-extended/timezone/tzcode-native.bb
index 6d52b3c4221..d0b23a9d809 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -2,8 +2,6 @@ require timezone.inc
=20
 SUMMARY =3D "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
=20
-SRC_URI +=3D "file://0001-Fix-C23-related-conformance-bug.patch"
-
 inherit native
=20
 EXTRA_OEMAKE +=3D "cc=3D'${CC}'"
diff --git a/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-c=
onformance-bug.patch b/meta/recipes-extended/timezone/tzcode/0001-Fix-C23=
-related-conformance-bug.patch
deleted file mode 100644
index c91ef93e952..00000000000
--- a/meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conforma=
nce-bug.patch
+++ /dev/null
@@ -1,301 +0,0 @@
-From 509c5974398952618abdd17f39117b88e3f50057 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 1 Dec 2022 10:28:04 -0800
-Subject: [PATCH] Fix C23-related conformance bug
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Houge Langley for =E2=80=98gcc -std=3Dgnu99=E2=80=99=
 in:
-https://bugs.gentoo.org/show_bug.cgi?id=3D883719
-* NEWS: Mention this.
-* date.c, localtime.c, private.h, zdump.c, zic.c:
-Use ATTRIBUTE_* at the start of function declarations,
-not later (such as after the keyword =E2=80=98static=E2=80=99).
-This is required for strict conformance to C23.
-
-Upstream-Status: Backport [https://github.com/eggert/tz/commit/9cfe9507f=
cc22cd4a0c4da486ea1c7f0de6b075f]
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
-=20
- int
- main(const int argc, char *argv[])
-diff --git a/localtime.c b/localtime.c
-index 1d22d351..3bf1b911 100644
---- a/localtime.c
-+++ b/localtime.c
-@@ -838,7 +838,7 @@ is_digit(char c)
- ** Return a pointer to that character.
- */
-=20
--static ATTRIBUTE_REPRODUCIBLE const char *
-+ATTRIBUTE_REPRODUCIBLE static const char *
- getzname(register const char *strp)
- {
- 	register char	c;
-@@ -859,7 +859,7 @@ getzname(register const char *strp)
- ** We don't do any checking here; checking is done later in common-case=
 code.
- */
-=20
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
-=20
- static char const *abbr(struct tm const *);
--static intmax_t	delta(struct tm *, struct tm *) ATTRIBUTE_REPRODUCIBLE;
-+ATTRIBUTE_REPRODUCIBLE static intmax_t delta(struct tm *, struct tm *);
- static void dumptime(struct tm const *);
- static time_t hunt(timezone_t, time_t, time_t, bool);
- static void show(timezone_t, char *, time_t, bool);
-@@ -97,7 +97,7 @@ static void showextrema(timezone_t, char *, time_t, st=
ruct tm *, time_t);
- static void showtrans(char const *, struct tm const *, time_t, char con=
st *,
- 		      char const *);
- static const char *tformat(void);
--static time_t yeartot(intmax_t) ATTRIBUTE_REPRODUCIBLE;
-+ATTRIBUTE_REPRODUCIBLE static time_t yeartot(intmax_t);
-=20
- /* Is C an ASCII digit?  */
- static bool
-@@ -125,7 +125,7 @@ is_alpha(char a)
- 	}
- }
-=20
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- size_overflow(void)
- {
-   fprintf(stderr, _("%s: size overflow\n"), progname);
-@@ -134,7 +134,7 @@ size_overflow(void)
-=20
- /* Return A + B, exiting if the result would overflow either ptrdiff_t
-    or size_t.  */
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- sumsize(size_t a, size_t b)
- {
- #ifdef ckd_add
-@@ -151,7 +151,7 @@ sumsize(size_t a, size_t b)
-=20
- /* Return a pointer to a newly allocated buffer of size SIZE, exiting
-    on failure.  SIZE should be nonzero.  */
--static void * ATTRIBUTE_MALLOC
-+ATTRIBUTE_MALLOC static void *
- xmalloc(size_t size)
- {
-   void *p =3D malloc(size);
-@@ -920,7 +920,7 @@ showextrema(timezone_t tz, char *zone, time_t lo, st=
ruct tm *lotmp, time_t hi)
- # include <stdarg.h>
-=20
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
-=20
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- memory_exhausted(const char *msg)
- {
- 	fprintf(stderr, _("%s: Memory exhausted: %s\n"), progname, msg);
- 	exit(EXIT_FAILURE);
- }
-=20
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- size_overflow(void)
- {
-   memory_exhausted(_("size overflow"));
- }
-=20
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- size_sum(size_t a, size_t b)
- {
- #ifdef ckd_add
-@@ -487,7 +487,7 @@ size_sum(size_t a, size_t b)
-   size_overflow();
- }
-=20
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- size_product(ptrdiff_t nitems, ptrdiff_t itemsize)
- {
- #ifdef ckd_mul
-@@ -502,7 +502,7 @@ size_product(ptrdiff_t nitems, ptrdiff_t itemsize)
-   size_overflow();
- }
-=20
--static ATTRIBUTE_REPRODUCIBLE ptrdiff_t
-+ATTRIBUTE_REPRODUCIBLE static ptrdiff_t
- align_to(ptrdiff_t size, ptrdiff_t alignment)
- {
-   ptrdiff_t lo_bits =3D alignment - 1, sum =3D size_sum(size, lo_bits);
-@@ -526,7 +526,7 @@ memcheck(void *ptr)
- 	return ptr;
- }
-=20
--static void * ATTRIBUTE_MALLOC
-+ATTRIBUTE_MALLOC static void *
- emalloc(size_t size)
- {
-   return memcheck(malloc(size));
-@@ -538,7 +538,7 @@ erealloc(void *ptr, size_t size)
-   return memcheck(realloc(ptr, size));
- }
-=20
--static char * ATTRIBUTE_MALLOC
-+ATTRIBUTE_MALLOC static char *
- estrdup(char const *str)
- {
-   return memcheck(strdup(str));
-@@ -608,7 +608,7 @@ eat(int fnum, lineno num)
- 	eats(fnum, num, 0, -1);
- }
-=20
--static void ATTRIBUTE_FORMAT((printf, 1, 0))
-+ATTRIBUTE_FORMAT((printf, 1, 0)) static void
- verror(const char *const string, va_list args)
- {
- 	/*
-@@ -626,7 +626,7 @@ verror(const char *const string, va_list args)
- 	fprintf(stderr, "\n");
- }
-=20
--static void ATTRIBUTE_FORMAT((printf, 1, 2))
-+ATTRIBUTE_FORMAT((printf, 1, 2)) static void
- error(const char *const string, ...)
- {
- 	va_list args;
-@@ -636,7 +636,7 @@ error(const char *const string, ...)
- 	errors =3D true;
- }
-=20
--static void ATTRIBUTE_FORMAT((printf, 1, 2))
-+ATTRIBUTE_FORMAT((printf, 1, 2)) static void
- warning(const char *const string, ...)
- {
- 	va_list args;
-@@ -666,7 +666,7 @@ close_file(FILE *stream, char const *dir, char const=
 *name,
-   }
- }
-=20
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- usage(FILE *stream, int status)
- {
-   fprintf(stream,
-@@ -3597,7 +3597,7 @@ lowerit(char a)
- }
-=20
- /* case-insensitive equality */
--static ATTRIBUTE_REPRODUCIBLE bool
-+ATTRIBUTE_REPRODUCIBLE static bool
- ciequal(register const char *ap, register const char *bp)
- {
- 	while (lowerit(*ap) =3D=3D lowerit(*bp++))
-@@ -3606,7 +3606,7 @@ ciequal(register const char *ap, register const ch=
ar *bp)
- 	return false;
- }
-=20
--static ATTRIBUTE_REPRODUCIBLE bool
-+ATTRIBUTE_REPRODUCIBLE static bool
- itsabbr(register const char *abbr, register const char *word)
- {
- 	if (lowerit(*abbr) !=3D lowerit(*word))
-@@ -3622,7 +3622,7 @@ itsabbr(register const char *abbr, register const =
char *word)
-=20
- /* Return true if ABBR is an initial prefix of WORD, ignoring ASCII cas=
e.  */
-=20
--static ATTRIBUTE_REPRODUCIBLE bool
-+ATTRIBUTE_REPRODUCIBLE static bool
- ciprefix(char const *abbr, char const *word)
- {
-   do
-@@ -3725,14 +3725,14 @@ getfields(char *cp, char **array, int arrayelts)
- 	return nsubs;
- }
-=20
--static ATTRIBUTE_NORETURN void
-+ATTRIBUTE_NORETURN static void
- time_overflow(void)
- {
-   error(_("time overflow"));
-   exit(EXIT_FAILURE);
- }
-=20
--static ATTRIBUTE_REPRODUCIBLE zic_t
-+ATTRIBUTE_REPRODUCIBLE static zic_t
- oadd(zic_t t1, zic_t t2)
- {
- #ifdef ckd_add
-@@ -3746,7 +3746,7 @@ oadd(zic_t t1, zic_t t2)
-   time_overflow();
- }
-=20
--static ATTRIBUTE_REPRODUCIBLE zic_t
-+ATTRIBUTE_REPRODUCIBLE static zic_t
- tadd(zic_t t1, zic_t t2)
- {
- #ifdef ckd_add
--=20
2.34.1


