Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8C76E668
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 03:27:41 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l65so155146360wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 19:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IS6JBefnqJPeHCsaPM6lOdOTCTGS9cP56nk91Vlxyjw=;
	b=0XKlGSvPyTgRojFAmG26Nv4UQM3PaRqoF1Ys3xKGY1LVIJ88CCIXceP0Cpsk97C/++
	FIUpTb6cFmWURdMvpGwuTYyHx1/9aEhoI1rcAxa1HsdPhN9in34XSZ8MJeBCJH1v+5CW
	Axk5WLa8eVoAEZk53BsqhoSnmLvDEz00x1Ex7cSDau3o25HBMpKpdIJWqkKY7HJRUakc
	ljzeSxRoGyi5fUF3R3Zqpxpzu0kdJ187S1JaYdQWiwcdmCfiAy2oYOatJF1Mf6/UXj93
	BnpryCoysHV9SXh+3tt1gSFlroeHvZkmZs7sNcukz64R3MyldouBZzm+J+H5xez8f7a1
	EPYw==
MIME-Version: 1.0
X-Received: by 10.28.86.196 with SMTP id k187mr1950336wmb.61.1452310061417;
	Fri, 08 Jan 2016 19:27:41 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 8 Jan 2016 19:27:41 -0800 (PST)
In-Reply-To: <555844c65d44169bb4478d4470a802ebc2fe2f94.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
	<555844c65d44169bb4478d4470a802ebc2fe2f94.1452248145.git.raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 19:27:41 -0800
Message-ID: <CAJ86T=X=s81M+2ywKV4T63A31sfmcRnHHar5oUMd4JsS+UFezw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/53] directfb: Fix build with musl
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
X-List-Received-Date: Sat, 09 Jan 2016 03:27:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 2:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
> compar_fn_t, sigval_t and non-posix recursive mutexes
> are not available in musl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/directfb/directfb.inc        |  5 ++
>  .../directfb/directfb/compar_fn_t.patch            | 62 ++++++++++++++++++++++
>  .../directfb/directfb/union-sigval.patch           | 19 +++++++
>  .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     | 19 +++++++
>  4 files changed, 105 insertions(+)
>  create mode 100644 meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
>  create mode 100644 meta/recipes-graphics/directfb/directfb/union-sigval.patch
>  create mode 100644 meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
>
> diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
> index 603aba3..3a79a8f 100644
> --- a/meta/recipes-graphics/directfb/directfb.inc
> +++ b/meta/recipes-graphics/directfb/directfb.inc
> @@ -16,7 +16,12 @@ SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.ta
>             file://fusion.patch \
>             file://bashism.patch \
>             file://0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch \
> +           file://compar_fn_t.patch \
>            "
> +SRC_URI_append_libc-musl = "\
> +                            file://union-sigval.patch \
> +                            file://use-PTHREAD_MUTEX_RECURSIVE.patch \
> +                           "

For patches which fix 'correctness' issues uncovered by musl maybe
it's better to apply the patches unconditionally, so they get some
test cover from non-musl builds?

Especially true in this case - see below.

>  S = "${WORKDIR}/DirectFB-${PV}"
>
> diff --git a/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch b/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
> new file mode 100644
> index 0000000..ee4d900
> --- /dev/null
> +++ b/meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
> @@ -0,0 +1,62 @@
> +test for __compar_fn_t and if not defined by libc then define it
> +help make directfb compile with musl
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: DirectFB-1.7.7/configure.in
> +===================================================================
> +--- DirectFB-1.7.7.orig/configure.in
> ++++ DirectFB-1.7.7/configure.in
> +@@ -112,6 +112,17 @@ AC_CHECK_SIZEOF(long)
> + AC_CHECK_SIZEOF(long long)
> + AC_CHECK_FUNCS(fork)
> +
> ++AC_CACHE_CHECK([for compar_fn_t in stdlib.h],ccache_cv_COMPAR_FN_T, [
> ++    AC_TRY_COMPILE(
> ++        [#include <stdlib.h>],
> ++        [void test_fn(void) { qsort(NULL, 0, 0, (__compar_fn_t)NULL); }],
> ++        ccache_cv_COMPAR_FN_T=yes,
> ++        ccache_cv_COMPAR_FN_T=no)])
> ++if test x"$ccache_cv_COMPAR_FN_T" = x"yes"; then
> ++   AC_DEFINE(HAVE_COMPAR_FN_T, 1,
> ++             Define to 1 if you have the `__compar_fn_t' typedef.)
> ++fi
> ++
> + AC_PATH_PROGS(PERL, perl5 perl)
> +
> + AC_PATH_PROG(MAN2HTML, man2html, no)
> +Index: DirectFB-1.7.7/inputdrivers/lirc/lirc.c
> +===================================================================
> +--- DirectFB-1.7.7.orig/inputdrivers/lirc/lirc.c
> ++++ DirectFB-1.7.7/inputdrivers/lirc/lirc.c
> +@@ -59,6 +59,11 @@
> +
> + #include <core/input_driver.h>
> +
> ++#if HAVE_COMPAR_FN_T
> ++#define COMPAR_FN_T __compar_fn_t
> ++#else
> ++typedef int (*COMPAR_FN_T)(const void *, const void *);
> ++#endif
> +
> + DFB_INPUT_DRIVER( lirc )
> +
> +@@ -97,7 +102,7 @@ static DFBInputDeviceKeySymbol lirc_pars
> +           qsort ( keynames,
> +                   D_ARRAY_SIZE( keynames ),
> +                   sizeof(keynames[0]),
> +-                  (__compar_fn_t) keynames_sort_compare );
> ++                  (COMPAR_FN_T) keynames_sort_compare );
> +           keynames_sorted = true;
> +      }
> +
> +@@ -124,7 +129,7 @@ static DFBInputDeviceKeySymbol lirc_pars
> +                symbol_name = bsearch( name, keynames,
> +                                       D_ARRAY_SIZE( keynames ),
> +                                       sizeof(keynames[0]),
> +-                                      (__compar_fn_t) keynames_compare );
> ++                                      (COMPAR_FN_T) keynames_compare );
> +                if (symbol_name)
> +                     return symbol_name->symbol;
> +                break;
> diff --git a/meta/recipes-graphics/directfb/directfb/union-sigval.patch b/meta/recipes-graphics/directfb/directfb/union-sigval.patch
> new file mode 100644
> index 0000000..29f45c7
> --- /dev/null
> +++ b/meta/recipes-graphics/directfb/directfb/union-sigval.patch
> @@ -0,0 +1,19 @@
> +This patch is taken from gentoo musl overlay
> +sigval_t is glibc only construct, we use a union of sigval
> +which pretty much is same effect as sigval_t
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c DirectFB-1.7.6/lib/direct/os/linux/glibc/system.c
> +--- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/system.c     2014-07-15 02:54:58.000000000 -0400
> ++++ DirectFB-1.7.6/lib/direct/os/linux/glibc/system.c  2015-07-18 16:55:35.077989166 -0400
> +@@ -111,7 +111,7 @@
> + void
> + direct_trap( const char *domain, int sig )
> + {
> +-     sigval_t val;
> ++     union sigval val;
> +
> +      if (direct_config->delay_trap_ms) {
> +           D_LOG( Direct_Trap, VERBOSE, "NOT RAISING signal %d from %s, waiting for %dms... attach gdb --pid=%d\n", sig, domain, direct_config->delay_trap_ms, getpid() );
> diff --git a/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch b/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
> new file mode 100644
> index 0000000..e65f59e
> --- /dev/null
> +++ b/meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
> @@ -0,0 +1,19 @@
> +This patch is taken from gentoo musl overlay
> +uses recursive mutex directly instead of non-posix version
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +
> +diff -Naur DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h
> +--- DirectFB-1.7.6.orig/lib/direct/os/linux/glibc/mutex.h      2013-12-18 19:16:24.000000000 -0500
> ++++ DirectFB-1.7.6/lib/direct/os/linux/glibc/mutex.h   2015-07-18 16:57:47.178982835 -0400
> +@@ -46,7 +46,7 @@
> + /**********************************************************************************************************************/
> +
> + #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITIALIZER }
> +-#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP }
> ++#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_MUTEX_RECURSIVE }

This looks completely bogus.

PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP initialises a pthread_mutex_t
structure and PTHREAD_MUTEX_RECURSIVE is an enum. You can't just
replace one with the other.

> +
> + #endif
> +
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

