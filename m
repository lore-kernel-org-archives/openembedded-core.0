Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080CFD58B06
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 07:22:20 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.229089.1775978536400674644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 00:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pBBxnfnY;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6507a833e68so3361331d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 00:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775978535; cv=none;
        d=google.com; s=arc-20240605;
        b=JcZl2CoA4d/EaVtGbFaxlUjCwryDh9t7S/4oWPySnW8xjNN5E2rJIbIdMBXDg+VNrb
         Q7YYvAqfHi+oDpHqRWfJf0CVWqyJU002OzVVMVnB6k+/IqsnDc0xtWlQYzsSn+fWkob6
         LTY3ViTa+wpkFMlLKMvNJDHPrV+5AyyLd+0ddL3F9BZibTxO3yaJFhq2zPZcx/rDMurl
         lwn++78yXnzy/fYZwlSuDqLwRQFX3SAQQtUczHx2isaNZ6FFVhsJ7VTyJJYx4VBJonh7
         qIjSyHQ6zS0tb6Hy3YcQW6QAm94P3jkhUOCAU8qvm/pbvyKQtgr5ebixqeOhUyglPvkL
         9yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W8tOAcAFTz6dEdT5sW5B6xCwQYc3b6IHugCtAdjkmAg=;
        fh=MCdpyjX8oJIGdnUgA6LSOKxSvtudQZuzC5/qVjDrn6A=;
        b=ijz1o4pKRXkX61LxC2QIszMUTpNhZeKf+qqa+m/8wCHvXh9uyQn6qlF/tCyh4p39w4
         rN0X9BGQwEWlzT0Bh90PkXcMyB3kKGIDZienDiiyS9lpNLhqqWbzmWE2U+h2KHAt7IcA
         +WGShuVtuHqI6hWt8y2aptGQd4u/PZ016YFsNiE8nbYtsCyrSDmgN9Dae6Auup6WKcGr
         sF9gEy4+y7DCA9/DLKSEguHwqmRkxXw516n53v+Yfc5TAMueDl+ylzX1Sm+ZVKltIrNS
         iMElF7odxW2WZKs8qgCslxbpC3zB2PMPZfP7r5Au3l4AZUZusjyro7byojlDxI9vpKI4
         DzLQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775978535; x=1776583335; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W8tOAcAFTz6dEdT5sW5B6xCwQYc3b6IHugCtAdjkmAg=;
        b=pBBxnfnYe7M/Nyb7RNmQTPFN280SZoPvI73WY/Xl4ph3lk36fSpRj8OcoRQQnbxxg4
         9X/0+j5H+h7S0EerVIY16D0ll8NfCTFP+LYqtM4cREEOoMMKYCtezahU/RhCIy/wlfAV
         6bJ+5iZ7XMZAUCteLGqwwYXEzXZ2pqRr719i+ccnrktjnB6O9GBcsnrb858cOBcLyJn+
         fzQJ1N6gKPPXxhqadl7lqeXk15CDUSZGVSUUdddzVb9EbcPh0RK9qPTnw16DYgIq9xWv
         yyirwfBY5D1I59WlmRcDbYcQRPDr99HQf2bDdop+8pC4ghkt3OiBu4HP7bsXgt3buIya
         7ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775978535; x=1776583335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8tOAcAFTz6dEdT5sW5B6xCwQYc3b6IHugCtAdjkmAg=;
        b=hJlU8DQLIj6lZD5Gk+QuHhztCZ/ccOMEabmuhy3GNngPUzL13hqlwIL1Ee8qZ+4mU4
         CnkBqoRih2FP80J58jUXTtvlOrYyp8CIbhBKUK6V9DCBEPxJpF7wLGrel0ip38SUUAi4
         xiYV9CusniytEFQ7S3WvhIu39Yg1ntzEWX0BszEC1F6VyoICpmVrrXTcW3PfExjvqbPr
         nnphXAWEyFagimoU9/p1uTAmkk7B7scpKOaQ2cWjrBZTvMePzRw3lWAq6sfDKky6piS3
         k1F4fAadCvKJPVzWtRaTz37w89r7fhEt3iU85cwrg20LnZznMrFK1bhZOKH+RQ3dq27Z
         j8nQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CGdOhOhnXYbo3yTF2r2/KFW1Sa/rrMi98ThJ8ce6u7/u7cXCdZb5U2ec4qG3WY7XVkeQn+WE05RZ7RcgPXvv08Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwupRKO8zQFyKvMjnwRF3nd7PG9tHu6/1CnA6bwYJMRqUZckGZX
	xXyEji5yFoBzqeVDmSsVfpkyJmmImsaFfEK5LlXga6EbibZD9raFYGkIJ+fIGyoJdCIY+eIlIqK
	SeB3Rs8Afl4OfjQlIAwjipxbsWRba57w=
X-Gm-Gg: AeBDietXxaQQsJ6/FoTSjeFd11eCrVtLluGiGi4nGrRe3Ay3AehvHKCbogfN30FXn0d
	6ybdamyIQeyXfKtzVsMrxgDrDs9J1PMGEOeIgjs0WoIkWMEYrx0SVp+cAdTgxobBglwlCXDcPo7
	64Ylc7Nc64w+JWzHdeQk/vu4We3LXn01FcZmil1XLGHS7Bk9vSvwFJwRivLwXfKC3xrqEjbmUkV
	Uy5jFbbXhwmDL3UFPAgSJjq01PWJps6Z0PehEznP5ofIb1VgTFO8gwN66ZZEcojl/gc+tYZJcJE
	DwSDeJjharuNXVwZAkL+6p378Blc0clU/nJjr6CKlWyMudP8D7TAOgZWyFFTfe2nO99Q1qVoe4j
	2AO8Wn+n95hVipYvprLWXc1k0jg7E93aBWTHUcxkn+qaen62pB+sp0182QxKy9H4EiFx713vOY8
	Q9Mrw3pSYfjLQetOc=
X-Received: by 2002:a05:690e:4011:b0:651:c7c7:3a8c with SMTP id
 956f58d0204a3-651c7c746acmr14726d50.45.1775978535353; Sun, 12 Apr 2026
 00:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260410134915.3936107-1-martin.jansa@gmail.com> <8ffabe3414bdb206a716aa9ee5db2fc964d07e79.camel@linuxfoundation.org>
In-Reply-To: <8ffabe3414bdb206a716aa9ee5db2fc964d07e79.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Apr 2026 00:21:48 -0700
X-Gm-Features: AQROBzCqz_kCmoPrkMwI4pluRBCQYbfJzYfvbGuvUpOUl5OeTkVKXa8NoPHnR94
Message-ID: <CAMKF1soX-iCuuf_ygqXU7PAwryUw5NS7fJCpr_J5mezVF_3oyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apr: fix build with autoconf-2.73
To: richard.purdie@linuxfoundation.org
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ba82cb064f3e3962"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 07:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235054

--000000000000ba82cb064f3e3962
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 11:01=E2=80=AFPM Richard Purdie via lists.openembed=
ded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Fri, 2026-04-10 at 15:49 +0200, Martin Jansa via lists.openembedded.or=
g
> wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > On hosts with gcc-13 it was trying to use -std=3Dgnu23 and failing
> > with unrecognized command-line option (gnu23 needs gcc-14 and newer)
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  ...rog_cc_for_build.m4-update-to-latest.patch | 189 ++++++++++++++++++
> >  meta/recipes-support/apr/apr_1.7.6.bb         |   1 +
> >  2 files changed, 190 insertions(+)
> >  create mode 100644
> meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-lates=
t.patch
> >
> > diff --git
> a/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-lat=
est.patch
> b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-lat=
est.patch
> > new file mode 100644
> > index 0000000000..2607f6f860
> > --- /dev/null
> > +++
> b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-lat=
est.patch
> > @@ -0,0 +1,189 @@
> > +From 24eb9fd3469e610b6887517a80b8e038c200e807 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <martin.jansa@gmail.com>
> > +Date: Fri, 10 Apr 2026 15:04:43 +0200
> > +Subject: [PATCH] ax_prog_cc_for_build.m4: update to latest
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +After the autoconf update to 2.73 this was using -std=3Dgnu23
> > +even on hosts with gcc-13 which doesn't support it:
> > +
> > +ac_cv_prog_ac_ct_CC_FOR_BUILD=3D'gcc '
> > +CC_FOR_BUILD=3D'gcc  -std=3Dgnu23'
> > +ac_ct_CC_FOR_BUILD=3D'gcc '
> > +
> > +Leading to:
> > +gcc: error: unrecognized command-line option =E2=80=98-std=3Dgnu23=E2=
=80=99; did you mean
> =E2=80=98-std=3Dgnu2x=E2=80=99?
> > +
> > +Needs the updated ac_cv_prog_cc_c23 from:
> > +
> https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f=
516fef4226e5eca8da341159765
> > +
> > +Upstream-Status: Submitted [https://github.com/apache/apr/pull/72]
> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > +---
> > + build/ax_prog_cc_for_build.m4 | 99 ++++++++++++++++++++++++++--------=
-
> > + 1 file changed, 74 insertions(+), 25 deletions(-)
> > +
> > +diff --git a/build/ax_prog_cc_for_build.m4
> b/build/ax_prog_cc_for_build.m4
> > +index 26daf36..4d1de99 100644
> > +--- a/build/ax_prog_cc_for_build.m4
> > ++++ b/build/ax_prog_cc_for_build.m4
> > +@@ -32,28 +32,32 @@
> > + #   and this notice are preserved. This file is offered as-is, withou=
t
> any
> > + #   warranty.
> > +
> > +-#serial 9
> > ++#serial 26
> > +
> > + AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
> > + AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
> > + AC_REQUIRE([AC_PROG_CC])dnl
> > + AC_REQUIRE([AC_PROG_CPP])dnl
> > +-AC_REQUIRE([AC_EXEEXT])dnl
> > +-AC_REQUIRE([AC_CANONICAL_HOST])dnl
> > ++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
> > +
> > + dnl Use the standard macros, but make them use other variable names
> > + dnl
> > + pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
> > + pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
> > ++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
> > ++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
> > ++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
> > ++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
> > ++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
> > + pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
> > + pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
> > + pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
> > +-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
> > +-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
> > ++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
> > + pushdef([ac_exeext], ac_build_exeext)dnl
> > + pushdef([ac_objext], ac_build_objext)dnl
> > + pushdef([CC], CC_FOR_BUILD)dnl
> > + pushdef([CPP], CPP_FOR_BUILD)dnl
> > ++pushdef([GCC], GCC_FOR_BUILD)dnl
> > + pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
> > + pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
> > + pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
> > +@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
> > + pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
> > + pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
> > + pushdef([ac_cv_host_os], ac_cv_build_os)dnl
> > +-pushdef([ac_cpp], ac_build_cpp)dnl
> > +-pushdef([ac_compile], ac_build_compile)dnl
> > +-pushdef([ac_link], ac_build_link)dnl
> > ++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
> > ++pushdef([am_cv_CC_dependencies_compiler_type],
> am_cv_build_CC_dependencies_compiler_type)dnl
> > ++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
> > ++pushdef([cross_compiling], cross_compiling_build)dnl
> > ++dnl
> > ++dnl These variables are problematic to rename by M4 macros, so we sav=
e
> > ++dnl their values in alternative names, and restore the values later.
> > ++dnl
> > ++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
> > ++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
> > ++dnl variables. It's not a good idea to rename ac_cv_exeext and
> > ++dnl ac_cv_objext either as they're related.
> > ++dnl Renaming ac_exeext and ac_objext is safe though.
> > ++dnl
> > ++ac_cv_host_exeext=3D$ac_cv_exeext
> > ++AS_VAR_SET_IF([ac_cv_build_exeext],
> > ++  [ac_cv_exeext=3D$ac_cv_build_exeext],
> > ++  [AS_UNSET([ac_cv_exeext])])
> > ++ac_cv_host_objext=3D$ac_cv_objext
> > ++AS_VAR_SET_IF([ac_cv_build_objext],
> > ++  [ac_cv_objext=3D$ac_cv_build_objext],
> > ++  [AS_UNSET([ac_cv_objext])])
> > ++dnl
> > ++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
> > ++dnl AC_PROG_CC) indirectly.
> > ++dnl
> > ++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu
> > ++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
> > ++  [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],
> > ++  [AS_UNSET([ac_cv_c_compiler_gnu])])
> > +
> > +-save_cross_compiling=3D$cross_compiling
> > +-save_ac_tool_prefix=3D$ac_tool_prefix
> > +-cross_compiling=3Dno
> > +-ac_tool_prefix=3D
> > ++cross_compiling_build=3Dno
> > +
> > ++ac_build_tool_prefix=3D
> > ++AS_IF([test -n "$build"],      [ac_build_tool_prefix=3D"$build-"],
> > ++      [test -n "$build_alias"],[ac_build_tool_prefix=3D"$build_alias-=
"])
> > ++
> > ++AC_LANG_PUSH([C])
> > + AC_PROG_CC
> > ++_AC_COMPILER_EXEEXT
> > ++_AC_COMPILER_OBJEXT
> > + AC_PROG_CPP
> > +-AC_EXEEXT
> > +
> > +-ac_tool_prefix=3D$save_ac_tool_prefix
> > +-cross_compiling=3D$save_cross_compiling
> > ++BUILD_EXEEXT=3D$ac_cv_exeext
> > ++BUILD_OBJEXT=3D$ac_cv_objext
> > +
> > + dnl Restore the old definitions
> > + dnl
> > +-popdef([ac_link])dnl
> > +-popdef([ac_compile])dnl
> > +-popdef([ac_cpp])dnl
> > ++popdef([cross_compiling])dnl
> > ++popdef([am_cv_prog_cc_c_o])dnl
> > ++popdef([am_cv_CC_dependencies_compiler_type])dnl
> > ++popdef([ac_tool_prefix])dnl
> > + popdef([ac_cv_host_os])dnl
> > + popdef([ac_cv_host_vendor])dnl
> > + popdef([ac_cv_host_cpu])dnl
> > +@@ -101,26 +136,40 @@ popdef([host])dnl
> > + popdef([LDFLAGS])dnl
> > + popdef([CPPFLAGS])dnl
> > + popdef([CFLAGS])dnl
> > ++popdef([GCC])dnl
> > + popdef([CPP])dnl
> > + popdef([CC])dnl
> > + popdef([ac_objext])dnl
> > + popdef([ac_exeext])dnl
> > +-popdef([ac_cv_objext])dnl
> > +-popdef([ac_cv_exeext])dnl
> > ++popdef([ac_prog_cc_stdc])dnl
> > + popdef([ac_cv_prog_cc_g])dnl
> > + popdef([ac_cv_prog_cc_cross])dnl
> > + popdef([ac_cv_prog_cc_works])dnl
> > ++popdef([ac_cv_prog_cc_stdc])dnl
> > ++popdef([ac_cv_prog_cc_c23])dnl
> > ++popdef([ac_cv_prog_cc_c11])dnl
> > ++popdef([ac_cv_prog_cc_c99])dnl
> > ++popdef([ac_cv_prog_cc_c89])dnl
> > + popdef([ac_cv_prog_gcc])dnl
> > + popdef([ac_cv_prog_CPP])dnl
> > ++dnl
> > ++ac_cv_exeext=3D$ac_cv_host_exeext
> > ++EXEEXT=3D$ac_cv_host_exeext
> > ++ac_cv_objext=3D$ac_cv_host_objext
> > ++OBJEXT=3D$ac_cv_host_objext
> > ++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
> > ++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
> > ++
> > ++dnl restore global variables ac_ext, ac_cpp, ac_compile,
> > ++dnl ac_link, ac_compiler_gnu (dependent on the current
> > ++dnl language after popping):
> > ++AC_LANG_POP([C])
> > +
> > + dnl Finally, set Makefile variables
> > + dnl
> > +-BUILD_EXEEXT=3D$ac_build_exeext
> > +-BUILD_OBJEXT=3D$ac_build_objext
> > +-AC_SUBST(BUILD_EXEEXT)dnl
> > +-AC_SUBST(BUILD_OBJEXT)dnl
> > ++AC_SUBST([BUILD_EXEEXT])dnl
> > ++AC_SUBST([BUILD_OBJEXT])dnl
> > + AC_SUBST([CFLAGS_FOR_BUILD])dnl
> > + AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
> > + AC_SUBST([LDFLAGS_FOR_BUILD])dnl
> > + ])
> > +-
> > diff --git a/meta/recipes-support/apr/apr_1.7.6.bb
> b/meta/recipes-support/apr/apr_1.7.6.bb
> > index 13fa5daa3c..86fac1e4c8 100644
> > --- a/meta/recipes-support/apr/apr_1.7.6.bb
> > +++ b/meta/recipes-support/apr/apr_1.7.6.bb
> > @@ -22,6 +22,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz=
2 \
> >
> file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
> >             file://autoconf-2.73.patch \
> >             file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch =
\
> > +           file://0001-ax_prog_cc_for_build.m4-update-to-latest.patch =
\
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32"
>
> I think this caused a reproducibility issue:
>
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-a5w4mcr=
k/packages/diff-html/
>
>
I think we should sed -std=3Dgnu23 out from CC_FOR_BUILD in the mk file in
do_install


> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235053):
> https://lists.openembedded.org/g/openembedded-core/message/235053
> Mute This Topic: https://lists.openembedded.org/mt/118759816/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ba82cb064f3e3962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 11,=
 2026 at 11:01=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mail=
to:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, 2026-04-10 at 15:49 +0200, Martin Jansa via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; <br>
&gt; On hosts with gcc-13 it was trying to use -std=3Dgnu23 and failing<br>
&gt; with unrecognized command-line option (gnu23 needs gcc-14 and newer)<b=
r>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...rog_cc_for_build.m4-update-to-latest.patch | 189 ++++++++++++=
++++++<br>
&gt; =C2=A0meta/recipes-support/apr/<a href=3D"http://apr_1.7.6.bb" rel=3D"=
noreferrer" target=3D"_blank">apr_1.7.6.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
&gt; =C2=A02 files changed, 190 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-support/apr/apr/0001-ax_prog_cc_=
for_build.m4-update-to-latest.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4=
-update-to-latest.patch b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_=
build.m4-update-to-latest.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2607f6f860<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update=
-to-latest.patch<br>
&gt; @@ -0,0 +1,189 @@<br>
&gt; +From 24eb9fd3469e610b6887517a80b8e038c200e807 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targ=
et=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 10 Apr 2026 15:04:43 +0200<br>
&gt; +Subject: [PATCH] ax_prog_cc_for_build.m4: update to latest<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +After the autoconf update to 2.73 this was using -std=3Dgnu23<br>
&gt; +even on hosts with gcc-13 which doesn&#39;t support it:<br>
&gt; +<br>
&gt; +ac_cv_prog_ac_ct_CC_FOR_BUILD=3D&#39;gcc &#39;<br>
&gt; +CC_FOR_BUILD=3D&#39;gcc=C2=A0 -std=3Dgnu23&#39;<br>
&gt; +ac_ct_CC_FOR_BUILD=3D&#39;gcc &#39;<br>
&gt; +<br>
&gt; +Leading to:<br>
&gt; +gcc: error: unrecognized command-line option =E2=80=98-std=3Dgnu23=E2=
=80=99; did you mean =E2=80=98-std=3Dgnu2x=E2=80=99?<br>
&gt; +<br>
&gt; +Needs the updated ac_cv_prog_cc_c23 from:<br>
&gt; +<a href=3D"https://github.com/autoconf-archive/autoconf-archive/commi=
t/8a970ce96721f516fef4226e5eca8da341159765" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96=
721f516fef4226e5eca8da341159765</a><br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/apache/apr/=
pull/72" rel=3D"noreferrer" target=3D"_blank">https://github.com/apache/apr=
/pull/72</a>]<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + build/ax_prog_cc_for_build.m4 | 99 ++++++++++++++++++++++++++-------=
--<br>
&gt; + 1 file changed, 74 insertions(+), 25 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/build/ax_prog_cc_for_build.m4 b/build/ax_prog_cc_for_bui=
ld.m4<br>
&gt; +index 26daf36..4d1de99 100644<br>
&gt; +--- a/build/ax_prog_cc_for_build.m4<br>
&gt; ++++ b/build/ax_prog_cc_for_build.m4<br>
&gt; +@@ -32,28 +32,32 @@<br>
&gt; + #=C2=A0=C2=A0 and this notice are preserved. This file is offered as=
-is, without any<br>
&gt; + #=C2=A0=C2=A0 warranty.<br>
&gt; + <br>
&gt; +-#serial 9<br>
&gt; ++#serial 26<br>
&gt; + <br>
&gt; + AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])<br>
&gt; + AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl<br>
&gt; + AC_REQUIRE([AC_PROG_CC])dnl<br>
&gt; + AC_REQUIRE([AC_PROG_CPP])dnl<br>
&gt; +-AC_REQUIRE([AC_EXEEXT])dnl<br>
&gt; +-AC_REQUIRE([AC_CANONICAL_HOST])dnl<br>
&gt; ++AC_REQUIRE([AC_CANONICAL_BUILD])dnl<br>
&gt; + <br>
&gt; + dnl Use the standard macros, but make them use other variable names<=
br>
&gt; + dnl<br>
&gt; + pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl<br>
&gt; + pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl<br>
&gt; ++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl<br>
&gt; ++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl<br>
&gt; ++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl<br>
&gt; ++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl<br>
&gt; ++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl<br>
&gt; + pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl<br>
&gt; + pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl<br>
&gt; + pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl<br>
&gt; +-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl<br>
&gt; +-pushdef([ac_cv_objext], ac_cv_build_objext)dnl<br>
&gt; ++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl<br>
&gt; + pushdef([ac_exeext], ac_build_exeext)dnl<br>
&gt; + pushdef([ac_objext], ac_build_objext)dnl<br>
&gt; + pushdef([CC], CC_FOR_BUILD)dnl<br>
&gt; + pushdef([CPP], CPP_FOR_BUILD)dnl<br>
&gt; ++pushdef([GCC], GCC_FOR_BUILD)dnl<br>
&gt; + pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl<br>
&gt; + pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl<br>
&gt; + pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl<br>
&gt; +@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl=
<br>
&gt; + pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl<br>
&gt; + pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl<br>
&gt; + pushdef([ac_cv_host_os], ac_cv_build_os)dnl<br>
&gt; +-pushdef([ac_cpp], ac_build_cpp)dnl<br>
&gt; +-pushdef([ac_compile], ac_build_compile)dnl<br>
&gt; +-pushdef([ac_link], ac_build_link)dnl<br>
&gt; ++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl<br>
&gt; ++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_depend=
encies_compiler_type)dnl<br>
&gt; ++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl<br>
&gt; ++pushdef([cross_compiling], cross_compiling_build)dnl<br>
&gt; ++dnl<br>
&gt; ++dnl These variables are problematic to rename by M4 macros, so we sa=
ve<br>
&gt; ++dnl their values in alternative names, and restore the values later.=
<br>
&gt; ++dnl<br>
&gt; ++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call<br>
&gt; ++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT<br>
&gt; ++dnl variables. It&#39;s not a good idea to rename ac_cv_exeext and<b=
r>
&gt; ++dnl ac_cv_objext either as they&#39;re related.<br>
&gt; ++dnl Renaming ac_exeext and ac_objext is safe though.<br>
&gt; ++dnl<br>
&gt; ++ac_cv_host_exeext=3D$ac_cv_exeext<br>
&gt; ++AS_VAR_SET_IF([ac_cv_build_exeext],<br>
&gt; ++=C2=A0 [ac_cv_exeext=3D$ac_cv_build_exeext],<br>
&gt; ++=C2=A0 [AS_UNSET([ac_cv_exeext])])<br>
&gt; ++ac_cv_host_objext=3D$ac_cv_objext<br>
&gt; ++AS_VAR_SET_IF([ac_cv_build_objext],<br>
&gt; ++=C2=A0 [ac_cv_objext=3D$ac_cv_build_objext],<br>
&gt; ++=C2=A0 [AS_UNSET([ac_cv_objext])])<br>
&gt; ++dnl<br>
&gt; ++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by=
<br>
&gt; ++dnl AC_PROG_CC) indirectly.<br>
&gt; ++dnl<br>
&gt; ++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu<br>
&gt; ++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],<br>
&gt; ++=C2=A0 [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],<br>
&gt; ++=C2=A0 [AS_UNSET([ac_cv_c_compiler_gnu])])<br>
&gt; + <br>
&gt; +-save_cross_compiling=3D$cross_compiling<br>
&gt; +-save_ac_tool_prefix=3D$ac_tool_prefix<br>
&gt; +-cross_compiling=3Dno<br>
&gt; +-ac_tool_prefix=3D<br>
&gt; ++cross_compiling_build=3Dno<br>
&gt; + <br>
&gt; ++ac_build_tool_prefix=3D<br>
&gt; ++AS_IF([test -n &quot;$build&quot;],=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [a=
c_build_tool_prefix=3D&quot;$build-&quot;],<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [test -n &quot;$build_alias&quot;],[a=
c_build_tool_prefix=3D&quot;$build_alias-&quot;])<br>
&gt; ++<br>
&gt; ++AC_LANG_PUSH([C])<br>
&gt; + AC_PROG_CC<br>
&gt; ++_AC_COMPILER_EXEEXT<br>
&gt; ++_AC_COMPILER_OBJEXT<br>
&gt; + AC_PROG_CPP<br>
&gt; +-AC_EXEEXT<br>
&gt; + <br>
&gt; +-ac_tool_prefix=3D$save_ac_tool_prefix<br>
&gt; +-cross_compiling=3D$save_cross_compiling<br>
&gt; ++BUILD_EXEEXT=3D$ac_cv_exeext<br>
&gt; ++BUILD_OBJEXT=3D$ac_cv_objext<br>
&gt; + <br>
&gt; + dnl Restore the old definitions<br>
&gt; + dnl<br>
&gt; +-popdef([ac_link])dnl<br>
&gt; +-popdef([ac_compile])dnl<br>
&gt; +-popdef([ac_cpp])dnl<br>
&gt; ++popdef([cross_compiling])dnl<br>
&gt; ++popdef([am_cv_prog_cc_c_o])dnl<br>
&gt; ++popdef([am_cv_CC_dependencies_compiler_type])dnl<br>
&gt; ++popdef([ac_tool_prefix])dnl<br>
&gt; + popdef([ac_cv_host_os])dnl<br>
&gt; + popdef([ac_cv_host_vendor])dnl<br>
&gt; + popdef([ac_cv_host_cpu])dnl<br>
&gt; +@@ -101,26 +136,40 @@ popdef([host])dnl<br>
&gt; + popdef([LDFLAGS])dnl<br>
&gt; + popdef([CPPFLAGS])dnl<br>
&gt; + popdef([CFLAGS])dnl<br>
&gt; ++popdef([GCC])dnl<br>
&gt; + popdef([CPP])dnl<br>
&gt; + popdef([CC])dnl<br>
&gt; + popdef([ac_objext])dnl<br>
&gt; + popdef([ac_exeext])dnl<br>
&gt; +-popdef([ac_cv_objext])dnl<br>
&gt; +-popdef([ac_cv_exeext])dnl<br>
&gt; ++popdef([ac_prog_cc_stdc])dnl<br>
&gt; + popdef([ac_cv_prog_cc_g])dnl<br>
&gt; + popdef([ac_cv_prog_cc_cross])dnl<br>
&gt; + popdef([ac_cv_prog_cc_works])dnl<br>
&gt; ++popdef([ac_cv_prog_cc_stdc])dnl<br>
&gt; ++popdef([ac_cv_prog_cc_c23])dnl<br>
&gt; ++popdef([ac_cv_prog_cc_c11])dnl<br>
&gt; ++popdef([ac_cv_prog_cc_c99])dnl<br>
&gt; ++popdef([ac_cv_prog_cc_c89])dnl<br>
&gt; + popdef([ac_cv_prog_gcc])dnl<br>
&gt; + popdef([ac_cv_prog_CPP])dnl<br>
&gt; ++dnl<br>
&gt; ++ac_cv_exeext=3D$ac_cv_host_exeext<br>
&gt; ++EXEEXT=3D$ac_cv_host_exeext<br>
&gt; ++ac_cv_objext=3D$ac_cv_host_objext<br>
&gt; ++OBJEXT=3D$ac_cv_host_objext<br>
&gt; ++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu<br>
&gt; ++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu<br>
&gt; ++<br>
&gt; ++dnl restore global variables ac_ext, ac_cpp, ac_compile,<br>
&gt; ++dnl ac_link, ac_compiler_gnu (dependent on the current<br>
&gt; ++dnl language after popping):<br>
&gt; ++AC_LANG_POP([C])<br>
&gt; + <br>
&gt; + dnl Finally, set Makefile variables<br>
&gt; + dnl<br>
&gt; +-BUILD_EXEEXT=3D$ac_build_exeext<br>
&gt; +-BUILD_OBJEXT=3D$ac_build_objext<br>
&gt; +-AC_SUBST(BUILD_EXEEXT)dnl<br>
&gt; +-AC_SUBST(BUILD_OBJEXT)dnl<br>
&gt; ++AC_SUBST([BUILD_EXEEXT])dnl<br>
&gt; ++AC_SUBST([BUILD_OBJEXT])dnl<br>
&gt; + AC_SUBST([CFLAGS_FOR_BUILD])dnl<br>
&gt; + AC_SUBST([CPPFLAGS_FOR_BUILD])dnl<br>
&gt; + AC_SUBST([LDFLAGS_FOR_BUILD])dnl<br>
&gt; + ])<br>
&gt; +-<br>
&gt; diff --git a/meta/recipes-support/apr/<a href=3D"http://apr_1.7.6.bb" =
rel=3D"noreferrer" target=3D"_blank">apr_1.7.6.bb</a> b/meta/recipes-suppor=
t/apr/<a href=3D"http://apr_1.7.6.bb" rel=3D"noreferrer" target=3D"_blank">=
apr_1.7.6.bb</a><br>
&gt; index 13fa5daa3c..86fac1e4c8 100644<br>
&gt; --- a/meta/recipes-support/apr/<a href=3D"http://apr_1.7.6.bb" rel=3D"=
noreferrer" target=3D"_blank">apr_1.7.6.bb</a><br>
&gt; +++ b/meta/recipes-support/apr/<a href=3D"http://apr_1.7.6.bb" rel=3D"=
noreferrer" target=3D"_blank">apr_1.7.6.bb</a><br>
&gt; @@ -22,6 +22,7 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-${PV}.=
tar.bz2 \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch=C2=A0\<=
br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://autoconf-2.73.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-ax_prog_cc_for_build.m4-update-to-latest.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &qu=
ot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0SRC_URI[sha256sum] =3D &quot;49030d92d2575da735791b496dc322f3ce5=
cff9494779ba8cc28c7f46c5deb32&quot;<br>
<br>
I think this caused a reproducibility issue:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-2026041=
2-a5w4mcrk/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">https:=
//valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-a5w4mcrk/packag=
es/diff-html/</a><br>
<br></blockquote><div><br></div><div>I think we should sed -std=3Dgnu23 out=
 from CC_FOR_BUILD in the mk file in do_install</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#235053): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/235053" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/235053</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118759816/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118759816/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ba82cb064f3e3962--

