Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id AADE9724DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 10:31:16 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hy4so5385032vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aBUPLzFVyPIx6Fhryd+c0O0HyGcJqQtF4mjd5sGioLo=;
	b=HNMlkO6BNYPYUAABwj1Rw6ZoZ78+alVg5RgGrZrumXj2xP2hFz0cfh3HuiQvP3lvd7
	JVknWa6gfdaK8uYgoHK7CxD/jKUgDJ6+RvIMPFMtFTph6wT+tyZvh91ekI8OodJoksSk
	WQJdFtjJ5qkvNl7tbqn+qnTEeWFbuJ4aVJz8XrBZFamon1F3Pe6AwnloiUIpLjEZeLr5
	MpQcypy4ffn2gGuE0aFTsvXi/AgeC4O4a1uHuVQhluH/9EaP8DwtOWxeCBkhizwAQ88j
	GMTzi91Qu+B78RvLY7mr5saw8hVcOzG8dTWGQh8JXXmcW11/z6PpyEs/yVHWnCL9X69Y
	VX+Q==
MIME-Version: 1.0
X-Received: by 10.220.205.2 with SMTP id fo2mr19125558vcb.8.1418639477322;
	Mon, 15 Dec 2014 02:31:17 -0800 (PST)
Received: by 10.52.237.165 with HTTP; Mon, 15 Dec 2014 02:31:17 -0800 (PST)
In-Reply-To: <1417610456-788-3-git-send-email-schnitzeltony@googlemail.com>
References: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
	<1417610456-788-3-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 15 Dec 2014 11:31:17 +0100
Message-ID: <CALbNGRQtBV0CLhsoXoLDdFoFf9zW3Q_qEOJX639YRvw+7KPzmw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH][V2 3/3] fix cross-localedef build with gettext-native in sysroot
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
X-List-Received-Date: Mon, 15 Dec 2014 10:31:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2014 at 1:40 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> with previous patch applied and gettext build before cross-localedef,
> cross-localedef failed with.
>
> /usr/bin/ld: cannot find -lintl
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...d-dragging-in-gettext-s-libintl.h-libintl.patch | 104 +++++++++++++++=
++++++
>  .../glibc/cross-localedef-native_2.20.bb           |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/cross-localedef-native/avoid-=
dragging-in-gettext-s-libintl.h-libintl.patch
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native/avoid-draggin=
g-in-gettext-s-libintl.h-libintl.patch b/meta/recipes-core/glibc/cross-loca=
ledef-native/avoid-dragging-in-gettext-s-libintl.h-libintl.patch
> new file mode 100644
> index 0000000..e19be03
> --- /dev/null
> +++ b/meta/recipes-core/glibc/cross-localedef-native/avoid-dragging-in-ge=
ttext-s-libintl.h-libintl.patch
> @@ -0,0 +1,104 @@
> +From d90df9d5f818df18ddccaf5405ffa65a63ea70a7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Wed, 3 Dec 2014 12:57:14 +0100
> +Subject: [PATCH] avoid dragging in gettext's libintl.h / libintl
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +modify configure.ac and configure to make sure that we don't need to rev=
isit in
> +case autoconf is run in localedef subdirectory
> +
> +Upstream-Status: submitted [1]
> +
> +[1] https://github.com/kraj/localedef/pull/1
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + localedef/configure         | 45 --------------------------------------=
-------
> + localedef/configure.ac      |  1 -
> + include/libintl.h |  2 +-
> + 3 files changed, 1 insertion(+), 47 deletions(-)
> +
> +diff --git a/localedef/configure b/localedef/configure
> +index 10f5f77..e4bb869 100755
> +--- a/localedef/configure
> ++++ b/localedef/configure
> +@@ -3893,51 +3893,6 @@ $as_echo "#define HAVE_PROGRAM_INVOCATION_SHORT_N=
AME 1" >>confdefs.h
> +
> + fi
> +
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for gettext in -lintl=
" >&5
> +-$as_echo_n "checking for gettext in -lintl... " >&6; }
> +-if ${ac_cv_lib_intl_gettext+:} false; then :
> +-  $as_echo_n "(cached) " >&6
> +-else
> +-  ac_check_lib_save_LIBS=3D$LIBS
> +-LIBS=3D"-lintl  $LIBS"
> +-cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +-/* end confdefs.h.  */
> +-
> +-/* Override any GCC internal prototype to avoid an error.
> +-   Use char because int might match the return type of a GCC
> +-   builtin and then its argument prototype would still apply.  */
> +-#ifdef __cplusplus
> +-extern "C"
> +-#endif
> +-char gettext ();
> +-int
> +-main ()
> +-{
> +-return gettext ();
> +-  ;
> +-  return 0;
> +-}
> +-_ACEOF
> +-if ac_fn_c_try_link "$LINENO"; then :
> +-  ac_cv_lib_intl_gettext=3Dyes
> +-else
> +-  ac_cv_lib_intl_gettext=3Dno
> +-fi
> +-rm -f core conftest.err conftest.$ac_objext \
> +-    conftest$ac_exeext conftest.$ac_ext
> +-LIBS=3D$ac_check_lib_save_LIBS
> +-fi
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_intl_gettex=
t" >&5
> +-$as_echo "$ac_cv_lib_intl_gettext" >&6; }
> +-if test "x$ac_cv_lib_intl_gettext" =3D xyes; then :
> +-  cat >>confdefs.h <<_ACEOF
> +-#define HAVE_LIBINTL 1
> +-_ACEOF
> +-
> +-  LIBS=3D"-lintl $LIBS"
> +-
> +-fi
> +-
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for nanosleep in -lpo=
six4" >&5
> + $as_echo_n "checking for nanosleep in -lposix4... " >&6; }
> + if ${ac_cv_lib_posix4_nanosleep+:} false; then :
> +diff --git a/configure.ac b/configure.ac
> +index 33c8ff9..0004168 100644
> +--- a/localedef/configure.ac
> ++++ b/localedef/configure.ac
> +@@ -58,7 +58,6 @@ LOCAL_CHECK_FUNC([stpcpy], [#include <string.h>])
> + LOCAL_CHECK_FUNC([strsep], [#include <string.h>])
> + LOCAL_CHECK_VAR([program_invocation_name], [#include <errno.h>])
> + LOCAL_CHECK_VAR([program_invocation_short_name], [#include <errno.h>])
> +-AC_CHECK_LIB([intl], [gettext])
> + AC_CHECK_LIB([posix4], [nanosleep])
> +
> + # These two macros are taken from GCC's config/acx.m4.
> +diff --git a/include/libintl.h b/include/libintl.h
> +index 096aa8c..86143b6 100644
> +--- a/localedef/include/libintl.h
> ++++ b/localedef/include/libintl.h
> +@@ -1,5 +1,5 @@
> + #ifdef HAVE_LIBINTL_H
> +-#include_next <libintl.h>
> ++#include "../intl/libintl.h"
> + #endif
> +
> + #ifndef _
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb b/met=
a/recipes-core/glibc/cross-localedef-native_2.20.bb
> index ccf56a9..50a280b 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
> @@ -19,6 +19,7 @@ PV =3D "2.20"
>  SRC_URI =3D "git://sourceware.org/git/glibc.git;branch=3Drelease/${PV}/m=
aster;name=3Dglibc \
>             git://github.com/kraj/localedef;branch=3Dmaster;name=3Dlocale=
def;destsuffix=3Dgit/localedef \
>            file://fix_for_centos_5.8.patch \
> +           file://avoid-dragging-in-gettext-s-libintl.h-libintl.patch \
>             ${EGLIBCPATCHES} \
>            "
>  EGLIBCPATCHES =3D "\
> --
> 1.8.3.1
>
ping

