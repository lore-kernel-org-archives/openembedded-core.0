Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE2086B7CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 22:40:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sABMeHdG029544
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 14:40:17 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Nov 2014 14:40:17 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Nov 2014 16:40:14 -0600
Message-ID: <4428520b29b0b779da72a529ae2912b687fd85b5.1415745561.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1415745561.git.peter.seebach@windriver.com>
References: <cover.1415745561.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eglibc-use-option-groups.patch: Minor fixups.
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
X-List-Received-Date: Tue, 11 Nov 2014 22:40:19 -0000
Content-Type: text/plain

This incorporates suggested changes for issues 6797 and 6809 from
bugzilla, and a revised change for 6796. For 6796, the issue is
that you can't just include <gnu/option-groups.h> in libc-symbols,
so we may not always have the option group defines available.
If it's always visible, glibc won't build for poky-tiny, because
some code assumes that it can link against locale code if it
finds HAVE_MBSTATE_T. So, for now, test defined() before testing
the value of the option group feature test macro. It's possible
that this will result in some code being compiled without
HAVE_MBSTATE_T when it should in cases where option-groups.h wasn't
included before libc-symbols.h, but I haven't found an actual
example of a failure.

The reason HAVE_MBSTATE_T wasn't conditionalized in 2.19 is that
it didn't exist in 2.19.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch     |   25 +++----------------
 1 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 40c7832..6ab4f21 100644
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
  
@@ -5065,8 +5048,8 @@ Index: git/posix/Makefile
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
@@ -16469,7 +16452,7 @@ Index: git/include/libc-symbols.h
 -#define HAVE_MBSTATE_T	1
 -#define HAVE_MBSRTOWCS	1
 +
-+#if __OPTION_EGLIBC_LOCALE_CODE
++#if defined(__OPTION_EGLIBC_LOCALE_CODE) && __OPTION_EGLIBC_LOCALE_CODE
 +# define HAVE_MBSTATE_T	1
 +# define HAVE_MBSRTOWCS	1
 +#endif
-- 
1.7.1


