Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4110.1794169807404587937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 12:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MwtJFZfx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202611082030052b8a58c2c8000207fa-rmitg9@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202611082030052b8a58c2c8000207fa
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 21:30:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=78XdjqHD80LDsycfSCAoWEBbYQWYhi/Hyr1OhGFQN28=;
 b=MwtJFZfxyYDJZc6EpXt7YRZI9x00JF0dNQSY8IsSEsm1kgEt3kxaGFkWfLHgLj9uh87yb4
 yXqBfPNHULTm0dmIUC1a3SAIL9FJP3yg6cj/vXfabfw5DS/oGNGBtLl59gbY2LeV6PNO1za2
 qBiiLN7d/oXCAW98OHSyniBTVWtYTjgx4D70T9Qe0PSJUzR37VFgoAmK1k0mSI2FUTXdtt8D
 pplR4Rf/OR1sPVGPPOKY0dy+y7iiMo8Q8/lu8AbZt+oCCU7aDepQ5yN1aJA5WC2kfM7jUI3C
 TvUH9yRoljQiqqQM+lQ9FXsToC4CstF+OlOTfTBc+d/wUdHrutpoIMog==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] popt: patch CVE-2026-18839
Date: Sun,  8 Nov 2026 21:29:04 +0100
Message-ID: <20261108202904.2743631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 20:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249766
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick commits from PR [1] referencing this CVE.
Modify the patch by converting cmake change to autotools.

[1] https://github.com/rpm-software-management/popt/pull/142

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../popt/popt/CVE-2026-18839-01.patch         |  89 ++++
 .../popt/popt/CVE-2026-18839-02.patch         | 419 ++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |   4 +-
 3 files changed, 511 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-02.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18839-01.patch b/meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
new file mode 100644
index 0000000000..c3cb7e319c
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
@@ -0,0 +1,89 @@
+From 4f5a070cd98aade2767677de22661f4854d4a195 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 20 Aug 2026 13:46:32 +0300
+Subject: [PATCH] Bring in our own allocating printf() variants
+
+These are brought mostly as-is from rpm under a new POPT_ name, just
+with a slight change return an error on memory alloc failure whereas
+rpm exits on error.
+As the author of rvasprintf() and rasprintf() there, I'm at liberty to
+(re)license them under MIT as well.
+
+No functional changes here, just needed for sanity going forward.
+
+CVE: CVE-2026-18839
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/4f5a070cd98aade2767677de22661f4854d4a195]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/poptint.c | 38 ++++++++++++++++++++++++++++++++++++++
+ src/poptint.h |  4 ++++
+ 2 files changed, 42 insertions(+)
+
+diff --git a/src/poptint.c b/src/poptint.c
+index b8dc90f..6b61ae3 100644
+--- a/src/poptint.c
++++ b/src/poptint.c
+@@ -192,3 +192,41 @@ POPT_fprintf (FILE * stream, const char * format, ...)
+ }
+ 
+ #endif	/* !defined(POPT_fprintf) */
++
++int POPT_vasprintf(char **strp, const char *fmt, va_list ap)
++{
++    char * p = NULL;
++    va_list aq;
++
++    if (strp == NULL)
++	return -1;
++
++    va_copy(aq, ap);
++    int n = vsnprintf(NULL, 0, fmt, aq);
++    va_end(aq);
++
++    if (n >= 0) {
++	size_t nb = (size_t)n + 1;
++	if ((p = malloc(nb))) {
++	    va_copy(aq, ap);
++	    n = vsnprintf(p, nb, fmt, aq);
++	    va_end(aq);
++	} else {
++	    n = -1;
++ 	}
++    }
++    *strp = p;
++
++    return n;
++}
++
++int POPT_asprintf(char **strp, const char *fmt, ...)
++{
++    va_list ap;
++
++    va_start(ap, fmt);
++    int n = POPT_vasprintf(strp, fmt, ap);
++    va_end(ap);
++
++    return n;
++}
+diff --git a/src/poptint.h b/src/poptint.h
+index 910d6f5..d4127b3 100644
+--- a/src/poptint.h
++++ b/src/poptint.h
+@@ -10,6 +10,7 @@
+ #define H_POPTINT
+ 
+ #include <stdint.h>
++#include <stdarg.h>
+ 
+ /**
+  * Wrapper to free(3), hides const compilation noise, permit NULL, return NULL.
+@@ -136,6 +137,9 @@ const char *POPT_next_char (const char *str);
+ 
+ #endif
+ 
++int POPT_vasprintf(char **strp, const char *fmt, va_list ap);
++int POPT_asprintf(char **strp, const char *fmt, ...);
++
+ #if defined(ENABLE_NLS) && defined(HAVE_LIBINTL_H)
+ #include <libintl.h>
+ #endif
diff --git a/meta/recipes-support/popt/popt/CVE-2026-18839-02.patch b/meta/recipes-support/popt/popt/CVE-2026-18839-02.patch
new file mode 100644
index 0000000000..702403c2b3
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18839-02.patch
@@ -0,0 +1,419 @@
+From af6f19e5968d48608a062d6d92d28b7fd248f8ea Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 20 Aug 2026 14:28:11 +0300
+Subject: [PATCH] Fix a bucketful of buffer overflows in popt --help printing
+
+singleOptionDefaultValue() based the default value string output buffer
+size on the available line length, without any sort of bounds checking
+for most data. This was trivial to overflow with longer option names.
+
+There was also this baffling ellipsizing of long string arguments, done
+done based on the rather arbitrary buffer size instead of screen limits.
+Ellipsizing of long values might be totally reasonable but that belongs
+to the display code that does all manner of formatting too.
+
+Just use our newly introduced allocating sprintf() to get it right for
+good. Drop the line length argument entirely, it was only used for
+a bad estimation of the needed buffer size.
+
+At the other end, make sure the indent length stays below available
+columns to avoid the underflow from help printing.
+
+Annoyingly we need multiple different test programs for this because
+the various crashes are quite sensitive to the max length of a single
+option in the table. There are more broken cases than these, but we
+can't test everything and these cover the CVE-2026-18839 case.
+Update the ellipsis test a bit because it no longer makes sense.
+
+Note: this depends on the previous commit.
+
+Fixes: CVE-2026-18839
+
+CVE: CVE-2026-18839
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/af6f19e5968d48608a062d6d92d28b7fd248f8ea]
+Convert cmake change to autotools.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/popthelp.c    | 55 ++++++++++++++++-------------------------------
+ tests/Makefile.am | 10 ++++++++-
+ tests/test1.c     |  2 +-
+ tests/test4-1.c   | 33 ++++++++++++++++++++++++++++
+ tests/test4-2.c   | 33 ++++++++++++++++++++++++++++
+ tests/test4-3.c   | 33 ++++++++++++++++++++++++++++
+ tests/test4-4.c   | 33 ++++++++++++++++++++++++++++
+ tests/testit.sh   | 36 +++++++++++++++++++++++++++++--
+ 8 files changed, 195 insertions(+), 40 deletions(-)
+ create mode 100644 tests/test4-1.c
+ create mode 100644 tests/test4-2.c
+ create mode 100644 tests/test4-3.c
+ create mode 100644 tests/test4-4.c
+
+diff --git a/src/popthelp.c b/src/popthelp.c
+index fa31901..3950975 100644
+--- a/src/popthelp.c
++++ b/src/popthelp.c
+@@ -197,79 +197,60 @@ getArgDescrip(const struct poptOption * opt,
+ 
+ /**
+  * Display default value for an option.
+- * @param lineLength	display positions remaining
+  * @param opt		option(s)
+  * @param translation_domain	translation domain
+  * @return
+  */
+ static char *
+-singleOptionDefaultValue(size_t lineLength,
++singleOptionDefaultValue(
+ 		const struct poptOption * opt,
+ 		/* FIX: i18n macros disabled with lclint */
+ 		const char * translation_domain)
+ {
+     const char * defstr = D_(translation_domain, "default");
+-    char * le = malloc(4*lineLength + 1);
+-    char * l = le;
++    char * l = NULL;
+ 
+-    if (le == NULL) return NULL;	/* XXX can't happen */
+-    *le = '\0';
+-    *le++ = '(';
+-    le = stpcpy(le, defstr);
+-    *le++ = ':';
+-    *le++ = ' ';
+   if (opt->arg) {	/* XXX programmer error */
+     poptArg arg = { .ptr = opt->arg };
+     switch (poptArgType(opt)) {
+     case POPT_ARG_VAL:
+     case POPT_ARG_INT:
+-	le += sprintf(le, "%d", arg.intp[0]);
++	POPT_asprintf(&l, "(%s: %d)", defstr, arg.intp[0]);
+ 	break;
+     case POPT_ARG_SHORT:
+-	le += sprintf(le, "%hd", arg.shortp[0]);
++	POPT_asprintf(&l, "(%s: %hd)", defstr, arg.shortp[0]);
+ 	break;
+     case POPT_ARG_LONG:
+-	le += sprintf(le, "%ld", arg.longp[0]);
++	POPT_asprintf(&l, "(%s: %ld)", defstr, arg.longp[0]);
+ 	break;
+     case POPT_ARG_LONGLONG:
+-	le += sprintf(le, "%lld", arg.longlongp[0]);
++	POPT_asprintf(&l, "(%s: %lld)", defstr, arg.longlongp[0]);
+ 	break;
+     case POPT_ARG_FLOAT:
+     {	double aDouble = (double) arg.floatp[0];
+-	le += sprintf(le, "%g", aDouble);
++	POPT_asprintf(&l, "(%s: %g)", defstr, aDouble);
+     }	break;
+     case POPT_ARG_DOUBLE:
+-	le += sprintf(le, "%g", arg.doublep[0]);
++	POPT_asprintf(&l, "(%s: %g)", defstr, arg.doublep[0]);
+ 	break;
+     case POPT_ARG_MAINCALL:
+-	le += sprintf(le, "%p", opt->arg);
++	POPT_asprintf(&l, "(%s: %p)", defstr, opt->arg);
+ 	break;
+     case POPT_ARG_ARGV:
+-	le += sprintf(le, "%p", opt->arg);
++	POPT_asprintf(&l, "(%s: %p)", defstr, opt->arg);
+ 	break;
+     case POPT_ARG_STRING:
+-    {	const char * s = arg.argv[0];
+-	if (s == NULL)
+-	    le = stpcpy(le, "null");
+-	else {
+-	    size_t limit = 4*lineLength - (le - l) - sizeof("\"\")");
+-	    size_t slen;
+-	    *le++ = '"';
+-	    strncpy(le, s, limit); le[limit] = '\0'; le += (slen = strlen(le));
+-	    if (slen == limit && s[limit])
+-		le[-1] = le[-2] = le[-3] = '.';
+-	    *le++ = '"';
+-	}
+-    }	break;
++	if (arg.argv[0])
++	    POPT_asprintf(&l, "(%s: \"%s\")", defstr, arg.argv[0]);
++	else
++	    POPT_asprintf(&l, "(%s: %s)", defstr, "null");
++	break;
+     case POPT_ARG_NONE:
+     default:
+-	l = _free(l);
+ 	return NULL;
+ 	break;
+     }
+   }
+-    *le++ = ')';
+-    *le = '\0';
+ 
+     return l;
+ }
+@@ -286,7 +267,9 @@ static void singleOptionHelp(FILE * fp, columns_t columns,
+ 		const char * translation_domain)
+ {
+     size_t maxLeftCol = columns->cur;
+-    size_t indentLength = maxLeftCol + 5;
++    size_t indentLength = maxLeftCol + 5 < columns->max ?
++			maxLeftCol + 5 :
++			columns->max - (maxLeftCol % columns->max) - 1;
+     size_t lineLength = columns->max - indentLength;
+     const char * help = D_(translation_domain, opt->descrip);
+     const char * argDescrip = getArgDescrip(opt, translation_domain);
+@@ -347,7 +330,7 @@ static void singleOptionHelp(FILE * fp, columns_t columns,
+ 
+ 	/* Choose type of output */
+ 	if (F_ISSET(opt, SHOW_DEFAULT)) {
+-	    defs = singleOptionDefaultValue(lineLength, opt, translation_domain);
++	    defs = singleOptionDefaultValue(opt, translation_domain);
+ 	    if (defs) {
+ 		char * t = malloc((help ? strlen(help) : 0) +
+ 				strlen(defs) + sizeof(" "));
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 99fbf64..dfc60e7 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -11,7 +11,7 @@ EXTRA_DIST = testit.sh \
+ 
+ AM_CPPFLAGS = -I. -I$(top_srcdir)/src
+ 
+-noinst_PROGRAMS = test1 test2 tdict test3 tstuff
++noinst_PROGRAMS = test1 test2 tdict test3 tstuff test4-1 test4-2 test4-3 test4-4
+ tstuff_SOURCES = tstuff.c
+ tstuff_LDFLAGS =
+ tstuff_LDADD = $(top_builddir)/src/libpopt.la
+@@ -24,6 +24,14 @@ test2_LDADD = $(top_builddir)/src/libpopt.la
+ test3_SOURCES = test3.c
+ test3_LDFLAGS = 
+ test3_LDADD = $(top_builddir)/src/libpopt.la
++test4_1_SOURCES = test4-1.c
++test4_1_LDADD = $(top_builddir)/src/libpopt.la
++test4_2_SOURCES = test4-2.c
++test4_2_LDADD = $(top_builddir)/src/libpopt.la
++test4_3_SOURCES = test4-3.c
++test4_3_LDADD = $(top_builddir)/src/libpopt.la
++test4_4_SOURCES = test4-4.c
++test4_4_LDADD = $(top_builddir)/src/libpopt.la
+ tdict_SOURCES = tdict.c
+ tdict_LDFLAGS = 
+ tdict_LDADD = $(top_builddir)/src/libpopt.la
+diff --git a/tests/test1.c b/tests/test1.c
+index 7a3e663..3007f27 100644
+--- a/tests/test1.c
++++ b/tests/test1.c
+@@ -49,7 +49,7 @@ static char * oStr = (char *) -1;
+ static int singleDash = 0;
+ 
+ static const char * lStr =
+-"This tests default strings and exceeds the ... limit. "
++"This tests default strings and exceeds the former ... limit. "
+ "123456789+123456789+123456789+123456789+123456789+ "
+ "123456789+123456789+123456789+123456789+123456789+ "
+ "123456789+123456789+123456789+123456789+123456789+ "
+diff --git a/tests/test4-1.c b/tests/test4-1.c
+new file mode 100644
+index 0000000..2a0f094
+--- /dev/null
++++ b/tests/test4-1.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg2 = "meh";
++
++static struct poptOption options[] = {
++    { "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaargh",
++	    '\0', POPT_ARG_STRING | POPT_ARGFLAG_SHOW_DEFAULT,
++	    &arg2, 0, "Second", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/test4-2.c b/tests/test4-2.c
+new file mode 100644
+index 0000000..f9cd13d
+--- /dev/null
++++ b/tests/test4-2.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg3 = NULL;
++
++static struct poptOption options[] = {
++    { "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgh",
++	    '\0', POPT_ARG_STRING | POPT_ARGFLAG_SHOW_DEFAULT,
++	    &arg3, 0, "Third", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/test4-3.c b/tests/test4-3.c
+new file mode 100644
+index 0000000..a29f359
+--- /dev/null
++++ b/tests/test4-3.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg2 = NULL;
++
++static struct poptOption options[] = {
++    { "aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrggggggh",
++	    '\0', POPT_ARG_STRING,
++	    &arg2, 0, "xxxxx", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/test4-4.c b/tests/test4-4.c
+new file mode 100644
+index 0000000..b1b1322
+--- /dev/null
++++ b/tests/test4-4.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg2 = NULL;
++
++static struct poptOption options[] = {
++    { "aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgggggghyyyyy",
++	    '\0', POPT_ARG_STRING,
++	    &arg2, 0, "xxxxx", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/testit.sh b/tests/testit.sh
+index d26be3a..b8357c8 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -149,8 +149,8 @@ Usage: test1 [OPTION...]
+       --nstr=STRING               POPT_ARG_STRING: (null) (default: null)
+       --lstr=STRING               POPT_ARG_STRING: \"123456789...\" (default:
+                                   \"This tests default strings and exceeds the
+-                                  ... limit.
+-                                  123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ 1234567...\")
++                                  former ... limit.
++                                  123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ \")
+ 
+ arg for cb2
+   -c, --cb2=STRING                Test argument callbacks
+@@ -183,5 +183,37 @@ run_diff test3 "test3 - 2" test3-data/02.input test3-data/02.answer
+ run_diff test3 "test3 - 3" test3-data/03.input test3-data/03.answer
+ run_diff test3 "test3 - 5" test3-data/05.input test3-data/05.answer
+ 
++run test4-1 "test 4-1 - 63" "\
++Usage: test4-1 [OPTION...]
++      --aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaargh=STRING     Second (default: \"meh\")
++
++Help options:
++  -?, --help                                                                Show this help message
++      --usage                                                               Display brief usage message" --help
++
++run test4-2 "test 4-2 - 64" "\
++Usage: test4-2 [OPTION...]
++      --brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgh=STRING     Third (default: null)
++
++Help options:
++  -?, --help                                                                                                              Show this help message
++      --usage                                                                                                             Display brief usage message" --help
++
++run test4-3 "test 4-3 - 65" "\
++Usage: test4-3 [OPTION...]
++      --aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrggggggh=STRING     xxxxx
++
++Help options:
++  -?, --help                                                                   Show this help message
++      --usage                                                                  Display brief usage message" --help
++
++run test4-4 "test 4-4 - 66" "\
++Usage: test4-4 [OPTION...]
++      --aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgggggghyyyyy=STRING     xxxxx
++
++Help options:
++  -?, --help                                                                        Show this help message
++      --usage                                                                       Display brief usage message" --help
++
+ echo ""
+ echo "Passed."
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index 10c4b4b0af..cd35ddcdc6 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-18743.patch \
            file://CVE-2026-18739.patch \
+           file://CVE-2026-18839-01.patch \
+           file://CVE-2026-18839-02.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
@@ -24,7 +26,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-    for f in test1 test2 tdict test3 tstuff testit.sh test-poptrc; do
+    for f in test1 test2 tdict test3 test4-1 test4-2 test4-3 test4-4 tstuff testit.sh test-poptrc; do
         ${B}/libtool --mode=install install ${B}/tests/$f ${D}/${PTEST_PATH}
     done
 }
