Return-Path: <juro.bystricky@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id DEE1978864
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:48:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 14:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,432,1511856000"; d="scan'208";a="170120207"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 29 Jan 2018 14:39:32 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:39:45 -0800
Message-Id: <1517265587-84623-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
References: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
MIME-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/3] tzcode: remove unused patch files
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
X-List-Received-Date: Mon, 29 Jan 2018 22:48:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../files/0001-Fix-Makefile-quoting-bug.patch      | 174 ---------------------
 .../files/0002-Port-zdump-to-C90-snprintf.patch    | 115 --------------
 2 files changed, 289 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
 delete mode 100644 meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch

diff --git a/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch b/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
deleted file mode 100644
index e49fa09..0000000
--- a/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From b520d20b8122a783f99f088758b78d928f70ee34 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 23 Oct 2017 11:42:45 -0700
-Subject: [PATCH] Fix Makefile quoting bug
-
-Problem with INSTALLARGS reported by Zefram in:
-https://mm.icann.org/pipermail/tz/2017-October/025360.html
-Fix similar problems too.
-* Makefile (ZIC_INSTALL, VALIDATE_ENV, CC, install)
-(INSTALL, version, INSTALLARGS, right_posix, posix_right)
-(check_public): Use apostrophes to prevent undesirable
-interpretation of names by the shell.  We still do not support
-directory names containing apostrophes or newlines, but this is
-good enough.
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-* NEWS: Mention this.
----
- Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
- NEWS     |  8 ++++++++
- 2 files changed, 40 insertions(+), 32 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c92edc0..97649ca 100644
---- a/Makefile
-+++ b/Makefile
-@@ -313,7 +313,7 @@ ZFLAGS=
- 
- # How to use zic to install tz binary files.
- 
--ZIC_INSTALL=	$(ZIC) -d $(DESTDIR)$(TZDIR) $(LEAPSECONDS)
-+ZIC_INSTALL=	$(ZIC) -d '$(DESTDIR)$(TZDIR)' $(LEAPSECONDS)
- 
- # The name of a Posix-compliant 'awk' on your system.
- AWK=		awk
-@@ -341,8 +341,8 @@ SGML_CATALOG_FILES= \
- VALIDATE = nsgmls
- VALIDATE_FLAGS = -s -B -wall -wno-unused-param
- VALIDATE_ENV = \
--  SGML_CATALOG_FILES=$(SGML_CATALOG_FILES) \
--  SGML_SEARCH_PATH=$(SGML_SEARCH_PATH) \
-+  SGML_CATALOG_FILES='$(SGML_CATALOG_FILES)' \
-+  SGML_SEARCH_PATH='$(SGML_SEARCH_PATH)' \
-   SP_CHARSET_FIXED=YES \
-   SP_ENCODING=UTF-8
- 
-@@ -396,7 +396,7 @@ GZIPFLAGS=	-9n
- #MAKE=		make
- 
- cc=		cc
--CC=		$(cc) -DTZDIR=\"$(TZDIR)\"
-+CC=		$(cc) -DTZDIR='"$(TZDIR)"'
- 
- AR=		ar
- 
-@@ -473,29 +473,29 @@ all:		tzselect yearistype zic zdump libtz.a $(TABDATA)
- ALL:		all date $(ENCHILADA)
- 
- install:	all $(DATA) $(REDO) $(MANS)
--		mkdir -p $(DESTDIR)$(ETCDIR) $(DESTDIR)$(TZDIR) \
--			$(DESTDIR)$(LIBDIR) \
--			$(DESTDIR)$(MANDIR)/man3 $(DESTDIR)$(MANDIR)/man5 \
--			$(DESTDIR)$(MANDIR)/man8
-+		mkdir -p '$(DESTDIR)$(ETCDIR)' '$(DESTDIR)$(TZDIR)' \
-+			'$(DESTDIR)$(LIBDIR)' \
-+			'$(DESTDIR)$(MANDIR)/man3' '$(DESTDIR)$(MANDIR)/man5' \
-+			'$(DESTDIR)$(MANDIR)/man8'
- 		$(ZIC_INSTALL) -l $(LOCALTIME) -p $(POSIXRULES)
--		cp -f $(TABDATA) $(DESTDIR)$(TZDIR)/.
--		cp tzselect zic zdump $(DESTDIR)$(ETCDIR)/.
--		cp libtz.a $(DESTDIR)$(LIBDIR)/.
--		$(RANLIB) $(DESTDIR)$(LIBDIR)/libtz.a
--		cp -f newctime.3 newtzset.3 $(DESTDIR)$(MANDIR)/man3/.
--		cp -f tzfile.5 $(DESTDIR)$(MANDIR)/man5/.
--		cp -f tzselect.8 zdump.8 zic.8 $(DESTDIR)$(MANDIR)/man8/.
-+		cp -f $(TABDATA) '$(DESTDIR)$(TZDIR)/.'
-+		cp tzselect zic zdump '$(DESTDIR)$(ETCDIR)/.'
-+		cp libtz.a '$(DESTDIR)$(LIBDIR)/.'
-+		$(RANLIB) '$(DESTDIR)$(LIBDIR)/libtz.a'
-+		cp -f newctime.3 newtzset.3 '$(DESTDIR)$(MANDIR)/man3/.'
-+		cp -f tzfile.5 '$(DESTDIR)$(MANDIR)/man5/.'
-+		cp -f tzselect.8 zdump.8 zic.8 '$(DESTDIR)$(MANDIR)/man8/.'
- 
- INSTALL:	ALL install date.1
--		mkdir -p $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1
--		cp date $(DESTDIR)$(BINDIR)/.
--		cp -f date.1 $(DESTDIR)$(MANDIR)/man1/.
-+		mkdir -p '$(DESTDIR)$(BINDIR)' '$(DESTDIR)$(MANDIR)/man1'
-+		cp date '$(DESTDIR)$(BINDIR)/.'
-+		cp -f date.1 '$(DESTDIR)$(MANDIR)/man1/.'
- 
- version:	$(VERSION_DEPS)
- 		{ (type git) >/dev/null 2>&1 && \
- 		  V=`git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
- 				--abbrev=7 --dirty` || \
--		  V=$(VERSION); } && \
-+		  V='$(VERSION)'; } && \
- 		printf '%s\n' "$$V" >$@.out
- 		mv $@.out $@
- 
-@@ -529,12 +529,12 @@ leapseconds:	$(LEAP_DEPS)
- # Arguments to pass to submakes of install_data.
- # They can be overridden by later submake arguments.
- INSTALLARGS = \
-- BACKWARD=$(BACKWARD) \
-- DESTDIR=$(DESTDIR) \
-+ BACKWARD='$(BACKWARD)' \
-+ DESTDIR='$(DESTDIR)' \
-  LEAPSECONDS='$(LEAPSECONDS)' \
-  PACKRATDATA='$(PACKRATDATA)' \
-- TZDIR=$(TZDIR) \
-- YEARISTYPE=$(YEARISTYPE) \
-+ TZDIR='$(TZDIR)' \
-+ YEARISTYPE='$(YEARISTYPE)' \
-  ZIC='$(ZIC)'
- 
- # 'make install_data' installs one set of tz binary files.
-@@ -558,16 +558,16 @@ right_only:
- # You must replace all of $(TZDIR) to switch from not using leap seconds
- # to using them, or vice versa.
- right_posix:	right_only
--		rm -fr $(DESTDIR)$(TZDIR)-leaps
--		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-leaps || \
--		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
--		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
-+		rm -fr '$(DESTDIR)$(TZDIR)-leaps'
-+		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-leaps' || \
-+		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
-+		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
- 
- posix_right:	posix_only
--		rm -fr $(DESTDIR)$(TZDIR)-posix
--		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-posix || \
--		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
--		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
-+		rm -fr '$(DESTDIR)$(TZDIR)-posix'
-+		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-posix' || \
-+		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
-+		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
- 
- # This obsolescent rule is present for backwards compatibility with
- # tz releases 2014g through 2015g.  It should go away eventually.
-@@ -764,7 +764,7 @@ set-timestamps.out: $(ENCHILADA)
- 
- check_public:
- 		$(MAKE) maintainer-clean
--		$(MAKE) "CFLAGS=$(GCC_DEBUG_FLAGS)" ALL
-+		$(MAKE) CFLAGS='$(GCC_DEBUG_FLAGS)' ALL
- 		mkdir -p public.dir
- 		for i in $(TDATA) tzdata.zi; do \
- 		  $(zic) -v -d public.dir $$i 2>&1 || exit; \
-diff --git a/NEWS b/NEWS
-index bd2bec2..75ab095 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,5 +1,13 @@
- News for the tz database
- 
-+Unreleased, experimental changes
-+
-+  Changes to build procedure
-+
-+    The Makefile now quotes values like BACKWARD more carefully when
-+    passing them to the shell.  (Problem reported by Zefram.)
-+
-+
- Release 2017c - 2017-10-20 14:49:34 -0700
- 
-   Briefly:
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch b/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
deleted file mode 100644
index 87afe47..0000000
--- a/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From e231da4fb2beb17c60b4b1a5c276366d6a6e433f Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 23 Oct 2017 17:58:36 -0700
-Subject: [PATCH] Port zdump to C90 + snprintf
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Jon Skeet in:
-https://mm.icann.org/pipermail/tz/2017-October/025362.html
-* NEWS: Mention this.
-* zdump.c (my_snprintf): New macro or function.  If a macro, it is
-just snprintf.  If a function, it is the same as the old snprintf
-static function, with an ATTRIBUTE_FORMAT to pacify modern GCC.
-All uses of snprintf changed to use my_snprintf.  This way,
-installers don’t need to specify -DHAVE_SNPRINTF if they are using
-a pre-C99 compiler with a library that has snprintf.
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- NEWS    |  4 ++++
- zdump.c | 29 ++++++++++++++++-------------
- 2 files changed, 20 insertions(+), 13 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index 75ab095..dea08b8 100644
---- a/NEWS
-+++ b/NEWS
-@@ -7,6 +7,10 @@ Unreleased, experimental changes
-     The Makefile now quotes values like BACKWARD more carefully when
-     passing them to the shell.  (Problem reported by Zefram.)
- 
-+    Builders no longer need to specify -DHAVE_SNPRINTF on platforms
-+    that have snprintf and use pre-C99 compilers.  (Problem reported
-+    by Jon Skeet.)
-+
- 
- Release 2017c - 2017-10-20 14:49:34 -0700
- 
-diff --git a/zdump.c b/zdump.c
-index 8e3bf3e..d4e6084 100644
---- a/zdump.c
-+++ b/zdump.c
-@@ -795,12 +795,14 @@ show(timezone_t tz, char *zone, time_t t, bool v)
- 		abbrok(abbr(tmp), zone);
- }
- 
--#if !HAVE_SNPRINTF
-+#if HAVE_SNPRINTF
-+# define my_snprintf snprintf
-+#else
- # include <stdarg.h>
- 
- /* A substitute for snprintf that is good enough for zdump.  */
--static int
--snprintf(char *s, size_t size, char const *format, ...)
-+static int ATTRIBUTE_FORMAT((printf, 3, 4))
-+my_snprintf(char *s, size_t size, char const *format, ...)
- {
-   int n;
-   va_list args;
-@@ -839,10 +841,10 @@ format_local_time(char *buf, size_t size, struct tm const *tm)
- {
-   int ss = tm->tm_sec, mm = tm->tm_min, hh = tm->tm_hour;
-   return (ss
--	  ? snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
-+	  ? my_snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
- 	  : mm
--	  ? snprintf(buf, size, "%02d:%02d", hh, mm)
--	  : snprintf(buf, size, "%02d", hh));
-+	  ? my_snprintf(buf, size, "%02d:%02d", hh, mm)
-+	  : my_snprintf(buf, size, "%02d", hh));
- }
- 
- /* Store into BUF, of size SIZE, a formatted UTC offset for the
-@@ -877,10 +879,10 @@ format_utc_offset(char *buf, size_t size, struct tm const *tm, time_t t)
-   mm = off / 60 % 60;
-   hh = off / 60 / 60;
-   return (ss || 100 <= hh
--	  ? snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
-+	  ? my_snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
- 	  : mm
--	  ? snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
--	  : snprintf(buf, size, "%c%02ld", sign, hh));
-+	  ? my_snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
-+	  : my_snprintf(buf, size, "%c%02ld", sign, hh));
- }
- 
- /* Store into BUF (of size SIZE) a quoted string representation of P.
-@@ -983,15 +985,16 @@ istrftime(char *buf, size_t size, char const *time_fmt,
- 	    for (abp = ab; is_alpha(*abp); abp++)
- 	      continue;
- 	    len = (!*abp && *ab
--		   ? snprintf(b, s, "%s", ab)
-+		   ? my_snprintf(b, s, "%s", ab)
- 		   : format_quoted_string(b, s, ab));
- 	    if (s <= len)
- 	      return false;
- 	    b += len, s -= len;
- 	  }
--	  formatted_len = (tm->tm_isdst
--			   ? snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
--			   : 0);
-+	  formatted_len
-+	    = (tm->tm_isdst
-+	       ? my_snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
-+	       : 0);
- 	}
- 	break;
-       }
--- 
-2.7.4
-
-- 
2.7.4


