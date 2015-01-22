Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 360B371144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 22:02:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0MM2Cce004882
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 22 Jan 2015 14:02:12 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 Jan 2015 14:02:12 -0800
Date: Thu, 22 Jan 2015 16:02:09 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Juro Bystricky <jurobystricky@hotmail.com>
Message-ID: <20150122160209.2b16dd58@e6410-2>
In-Reply-To: <BAY179-W31475BA463A068FF83E83BB490@phx.gbl>
References: <BLU437-SMTP65FA876B595D639FFD2DD6BB750@phx.gbl>
	<BAY179-W31475BA463A068FF83E83BB490@phx.gbl>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc-use-option-groups.patch: Various fixups
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
X-List-Received-Date: Thu, 22 Jan 2015 22:02:21 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2015 12:52:37 -0800
Juro Bystricky <jurobystricky@hotmail.com> wrote:

> ping.

My memory (which is notoriously unreliable) was that we'd merged these
changes, but it may be we did thim in our local tree.

> 
> > From: jurobystricky@hotmail.com
> > To: openembedded-core@lists.openembedded.org
> > CC: sgw@linux.intel.com; peter.seebach@windriver.com
> > Subject: [PATCH] eglibc-use-option-groups.patch: Various fixups
> > Date: Sun, 23 Nov 2014 09:44:17 -0800
> > 
> > Build suppport for mutibyte character handling only when
> > __OPTION_EGLIBC_LOCALE_CODE evaluates to 1.
> > Fixes missing .out suffix for several tests to be built.
> > Fixes building of locales needed for several tests. Do not use
> > cross-localedef to build locales. Use localedef built with the
> > newly built libgc instead.
> > 
> > Fixes:
> > [YOCTO #6809] [YOCTO #6796] [YOCTO #6797]
> > 
> > Signed-off-by: Juro Bystricky <jurobystricky@hotmail.com>
> > ---
> >  .../glibc/glibc/eglibc-use-option-groups.patch     | 43 ++--------------------
> >  1 file changed, 4 insertions(+), 39 deletions(-)
> > 
> > diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> > index 40c7832..0e2f0c6 100644
> > --- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> > +++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> > @@ -2434,24 +2434,7 @@ Index: git/localedata/Makefile
> >   
> >   ifeq ($(run-built-tests),yes)
> >   # We have to generate locales
> > -@@ -143,9 +161,13 @@
> > - $(addprefix $(objpfx),$(CTYPE_FILES)): %: \
> > -   gen-locale.sh $(common-objpfx)locale/localedef Makefile \
> > -   $(addprefix charmaps/,$(CHARMAPS)) $(addprefix locales/,$(LOCALE_SRCS))
> > --	@$(SHELL) gen-locale.sh $(common-objpfx) \
> > --		  '$(built-program-cmd-before-env)' '$(run-program-env)' \
> > --		  '$(built-program-cmd-after-env)' $@; \
> > -+	@$(SHELL) gen-locale.sh $(common-objpfx)	\
> > -+		 '$(if $(cross-localedef), 		\
> > -+		       $(cross-localedef),		\
> > -+		       $(built-program-cmd-before-env)  \
> > -+		       $(run-program-env)		\
> > -+		       $(built-program-cmd-after-env))' \
> > -+		       $@; \
> > - 	$(evaluate-test)
> > - 
> > - $(addsuffix .out,$(addprefix $(objpfx),$(tests))): %: \
> > -@@ -213,6 +235,11 @@
> > +@@ -213,6 +231,11 @@
> >   
> >   include SUPPORTED
> >   
> > @@ -4783,7 +4766,7 @@ Index: git/posix/fnmatch.c
> >   #  endif
> >   
> >  -#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS) || _LIBC
> > -+#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS) || (_LIBC && __OPTION_EGLIBC_LOCALE_CODE)
> > ++#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS && _LIBC && __OPTION_EGLIBC_LOCALE_CODE)
> >   /* In this case we are implementing the multibyte character handling.  */
> >   #   define HANDLE_MULTIBYTE	1
> >   #  endif
> > @@ -5065,8 +5048,8 @@ Index: git/posix/Makefile
> >   		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork3-mem.out \
> >   		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out
> >  +ifeq (y,$(OPTION_POSIX_REGEXP_GLIBC))
> > -+tests-special += $(objpfx)bug-regex14-mem $(objpfx)tst-rxspencer-no-utf8-mem \
> > -+  		 $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem
> > ++tests-special += $(objpfx)bug-regex14-mem.out $(objpfx)tst-rxspencer-no-utf8-mem.out \
> > ++  		 $(objpfx)tst-pcre-mem.out $(objpfx)tst-boost-mem.out
> >  +endif
> >  +
> >   xtests-special += $(objpfx)bug-ga2-mem.out
> > @@ -16458,24 +16441,6 @@ Index: git/sysdeps/nptl/small-macros-fns.c
> >  +libc_hidden_def (__libc_lock_unlock_recursive_fn);
> >  +
> >  +#endif /*defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpthread)*/
> > -Index: git/include/libc-symbols.h
> > -===================================================================
> > ---- git.orig/include/libc-symbols.h	2014-08-29 20:00:47.144070587 -0700
> > -+++ git/include/libc-symbols.h	2014-08-29 20:01:15.248070587 -0700
> > -@@ -60,8 +60,11 @@
> > - /* Define these macros for the benefit of portable GNU code that wants to check
> > -    them.  Of course, STDC_HEADERS is never false when building libc!  */
> > - #define STDC_HEADERS	1
> > --#define HAVE_MBSTATE_T	1
> > --#define HAVE_MBSRTOWCS	1
> > -+
> > -+#if __OPTION_EGLIBC_LOCALE_CODE
> > -+# define HAVE_MBSTATE_T	1
> > -+# define HAVE_MBSRTOWCS	1
> > -+#endif
> > - #define HAVE_LIBINTL_H	1
> > - #define HAVE_WCTYPE_H	1
> > - #define HAVE_ISWCTYPE	1
> >  Index: git/crypt/crypt_common.c
> >  ===================================================================
> >  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> > -- 
> > 1.9.1
> > 
>  		 	   		  


-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

