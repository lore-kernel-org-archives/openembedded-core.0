Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3152365CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 19:59:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA7Jxmoe023401
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 11:59:49 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Nov 2014 11:59:48 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Nov 2014 13:59:45 -0600
Message-ID: <d2ce73488a8afb7a8d10286da138810d30b4a4be.1415390286.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1415390286.git.peter.seebach@windriver.com>
References: <cover.1415390286.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eglibc-use-option-groups.patch: Several fixups
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
X-List-Received-Date: Fri, 07 Nov 2014 19:59:54 -0000
Content-Type: text/plain

This incorporates suggested changes for issues 6797 and 6809 from
bugzilla, and a proposed change for 6796. For 6796, the issue is
that you can't just include <gnu/option-groups.h> in libc-symbols,
so we may not always have the option group defines available. The
workaround is to just leave the HAVE_MBSTATE_T definition visible;
the obvious relevant usage is already also conditionalized on
the option group locale define by this patch. This might not fix
all the cases if the locale group isn't enabled, but it eliminates a
pretty large raft of -Wundef warnings.

The reason HAVE_MBSTATE_T wasn't conditionalized in 2.19 is that
it didn't exist in 2.19.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch     |   40 +------------------
 1 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 40c7832..e4a0502 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -2434,24 +2434,8 @@ Index: git/localedata/Makefile
  
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
  $(addsuffix .out,$(addprefix $(objpfx),$(tests))): %: \
-@@ -213,6 +235,11 @@
+@@ -213,6 +231,11 @@
  
  include SUPPORTED
  
@@ -5065,8 +5049,8 @@ Index: git/posix/Makefile
  		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork3-mem.out \
  		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out
 +ifeq (y,$(OPTION_POSIX_REGEXP_GLIBC))
-+tests-special += $(objpfx)bug-regex14-mem $(objpfx)tst-rxspencer-no-utf8-mem \
-+  		 $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem
++tests-special += $(objpfx)bug-regex14-mem.out $(objpfx)tst-rxspencer-no-utf8-mem.out \
++  		 $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem.out
 +endif
 +
  xtests-special += $(objpfx)bug-ga2-mem.out
@@ -16458,24 +16442,6 @@ Index: git/sysdeps/nptl/small-macros-fns.c
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
1.7.1


