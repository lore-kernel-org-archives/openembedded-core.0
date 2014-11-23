Return-Path: <jurobystricky@hotmail.com>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 23 Nov 2014 17:49:34 UTC
Received: from BLU004-OMC4S14.hotmail.com (blu004-omc4s14.hotmail.com
	[65.55.111.153])
	by mail.openembedded.org (Postfix) with ESMTP id 6053A6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Nov 2014 17:49:34 +0000 (UTC)
Received: from BLU437-SMTP65 ([65.55.111.136]) by BLU004-OMC4S14.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Sun, 23 Nov 2014 09:44:28 -0800
X-TMN: [vC0R89l3ITWzRl9fY54ZV6gljnsch+1f]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BLU437-SMTP65FA876B595D639FFD2DD6BB750@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Nov 2014 09:44:17 -0800
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 23 Nov 2014 17:44:27.0368 (UTC)
	FILETIME=[20883680:01D00745]
MIME-Version: 1.0
Subject: [PATCH] eglibc-use-option-groups.patch: Various fixups
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
X-List-Received-Date: Sun, 23 Nov 2014 17:49:36 -0000
Content-Type: text/plain

Build suppport for mutibyte character handling only when
__OPTION_EGLIBC_LOCALE_CODE evaluates to 1.
Fixes missing .out suffix for several tests to be built.
Fixes building of locales needed for several tests. Do not use
cross-localedef to build locales. Use localedef built with the
newly built libgc instead.

Fixes:
[YOCTO #6809] [YOCTO #6796] [YOCTO #6797]

Signed-off-by: Juro Bystricky <jurobystricky@hotmail.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch     | 43 ++--------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 40c7832..0e2f0c6 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -2434,24 +2434,7 @@ Index: git/localedata/Makefile
  
  ifeq ($(run-built-tests),yes)
  # We have to generate locales
-@@ -143,9 +161,13 @@
- $(addprefix $(objpfx),$(CTYPE_FILES)): %: \
-   gen-locale.sh $(common-objpfx)locale/localedef Makefile \
-   $(addprefix charmaps/,$(CHARMAPS)) $(addprefix locales/,$(LOCALE_SRCS))
--	@$(SHELL) gen-locale.sh $(common-objpfx) \
--		  '$(built-program-cmd-before-env)' '$(run-program-env)' \
--		  '$(built-program-cmd-after-env)' $@; \
-+	@$(SHELL) gen-locale.sh $(common-objpfx)	\
-+		 '$(if $(cross-localedef), 		\
-+		       $(cross-localedef),		\
-+		       $(built-program-cmd-before-env)  \
-+		       $(run-program-env)		\
-+		       $(built-program-cmd-after-env))' \
-+		       $@; \
- 	$(evaluate-test)
- 
- $(addsuffix .out,$(addprefix $(objpfx),$(tests))): %: \
-@@ -213,6 +235,11 @@
+@@ -213,6 +231,11 @@
  
  include SUPPORTED
  
@@ -4783,7 +4766,7 @@ Index: git/posix/fnmatch.c
  #  endif
  
 -#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS) || _LIBC
-+#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS) || (_LIBC && __OPTION_EGLIBC_LOCALE_CODE)
++#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS && _LIBC && __OPTION_EGLIBC_LOCALE_CODE)
  /* In this case we are implementing the multibyte character handling.  */
  #   define HANDLE_MULTIBYTE	1
  #  endif
@@ -5065,8 +5048,8 @@ Index: git/posix/Makefile
  		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork3-mem.out \
  		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out
 +ifeq (y,$(OPTION_POSIX_REGEXP_GLIBC))
-+tests-special += $(objpfx)bug-regex14-mem $(objpfx)tst-rxspencer-no-utf8-mem \
-+  		 $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem
++tests-special += $(objpfx)bug-regex14-mem.out $(objpfx)tst-rxspencer-no-utf8-mem.out \
++  		 $(objpfx)tst-pcre-mem.out $(objpfx)tst-boost-mem.out
 +endif
 +
  xtests-special += $(objpfx)bug-ga2-mem.out
@@ -16458,24 +16441,6 @@ Index: git/sysdeps/nptl/small-macros-fns.c
 +libc_hidden_def (__libc_lock_unlock_recursive_fn);
 +
 +#endif /*defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpthread)*/
-Index: git/include/libc-symbols.h
-===================================================================
---- git.orig/include/libc-symbols.h	2014-08-29 20:00:47.144070587 -0700
-+++ git/include/libc-symbols.h	2014-08-29 20:01:15.248070587 -0700
-@@ -60,8 +60,11 @@
- /* Define these macros for the benefit of portable GNU code that wants to check
-    them.  Of course, STDC_HEADERS is never false when building libc!  */
- #define STDC_HEADERS	1
--#define HAVE_MBSTATE_T	1
--#define HAVE_MBSRTOWCS	1
-+
-+#if __OPTION_EGLIBC_LOCALE_CODE
-+# define HAVE_MBSTATE_T	1
-+# define HAVE_MBSRTOWCS	1
-+#endif
- #define HAVE_LIBINTL_H	1
- #define HAVE_WCTYPE_H	1
- #define HAVE_ISWCTYPE	1
 Index: git/crypt/crypt_common.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-- 
1.9.1


