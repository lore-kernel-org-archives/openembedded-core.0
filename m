Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDEBF3ED6D
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 06:01:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.226660.1775973671104182785
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 23:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X8qQN2MR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2135996f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 23:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775973669; x=1776578469; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj2dOkNDJHU1iTPxR07IOUpdZTWYRfGpjttj12Y8Esc=;
        b=X8qQN2MRTYVbFUs3ckOVq3WiMvYzPL3wI5omuBIHkQbLgDtsTqjDvuPkwEnu/ZGvoM
         KIYtvsdPEHSa3CdpHx37Iq4JkGYNFwlwskYLIW9QxruC7vFiKFpHcl4GNWpl1MKxKxJ7
         fKdT0gNKggAMyj7PjxDLanIRHnIrxa5h792GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775973669; x=1776578469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aj2dOkNDJHU1iTPxR07IOUpdZTWYRfGpjttj12Y8Esc=;
        b=npksj5uSE9zAHPT/wGZb1YAeyeq8x8sWfIXlso4NHWmSexHmXPUG4gPkL3iDvmvbbY
         H2Q/0BWKQGim9275gNrGEeau1KtuuoVIvCBbHD0H0XSYiKvU7OHNhiG8REPqWg9FpOAy
         Xugg4yJT5rKTz0u46LXaTH+ucz7C52342L4UC7rTLs4lJs71dw+eOyaC4Ii3gh5SMxfJ
         TBilkqvTYB2tO1N3KR6bdtK0XXT334q0Q/7GKnTJyczmZVoZPB+uQspEfzDhRXUJ8PW6
         uXrnQhd0a17etyuvG3AHq9SifhdgJolwAdq6W0746HEktidYHOR6KjoWo0akwYkBQx9r
         ow0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/TgiBR4AqLgzNXkDjs6FbQ7ZaLr9TjWk1Sa5ochKPdVonQE4JbPbo9P0vHq7+VoFbzymtLncN8/EVFzZNl592vrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFnDqW7sr7XjsxjDUlKaar3XzJQV7mu+tSLSCAJYZcIqrU17yQ
	6LP7rnl6W3RU+h+gzQ6+O3Yep2sC/pIQSspQEktuvwr46dtNqZIcKrNU/7WKyqnxvMQ=
X-Gm-Gg: AeBDieuF0gA8CiT6bm1CLG/FDLy5Q16Dv/B6ZbL7Wu6DOkuUIXInR2y30kcT+JrBSPK
	N+g8DUc3nATDqHoEM/xaNcfQVmX83POxnM51tDg0OQpqpqLhT1uKFCOMInxpIh9qCqPcyvgzToA
	Z0qDr+wXzRusTmggRq5FxlXY4i9nX/EDPbEToCp0mwFcIZ2AJO4dJPmvZmZTl3O5yoQIB4imBQb
	zuIvuNai0K//CjIBMAropFk+mATbHp7+oQHK//EdNgi2SpDfNK2zjdKDRYBWG9/bu2RMF32El0D
	GPGUCY81/+OKr/o8y8L53vS2RaqJZMR+vIVP43Q/bMT//E87SdMQpLbOMFILM+oZ788tDzZbHXH
	H/2fF07W0K7A/RDNBdxucAfSv3fbZn29dnyQv3VulFrfTleYOp3ZD481/GqpLZuUcQH2/X4CXrf
	3ERKa3ro9ibw5k+FA9fwRG4aCgPf2I9RkZSV8h1M8hcjlkqzP7SQcMOIjZGhdHROi1oixog25Dw
	RFCZp79ldVfaHLYGJ42fg==
X-Received: by 2002:a5d:5f46:0:b0:43d:1cec:4766 with SMTP id ffacd0b85a97d-43d642b6b9cmr12965434f8f.23.1775973669050;
        Sat, 11 Apr 2026 23:01:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:26:62b6:88b1:6815? ([2001:8b0:aba:5f3c:26:62b6:88b1:6815])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46a85sm22318510f8f.24.2026.04.11.23.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 23:01:08 -0700 (PDT)
Message-ID: <8ffabe3414bdb206a716aa9ee5db2fc964d07e79.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] apr: fix build with autoconf-2.73
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 12 Apr 2026 07:01:06 +0100
In-Reply-To: <20260410134915.3936107-1-martin.jansa@gmail.com>
References: <20260410134915.3936107-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 06:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235053

On Fri, 2026-04-10 at 15:49 +0200, Martin Jansa via lists.openembedded.org =
wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>=20
> On hosts with gcc-13 it was trying to use -std=3Dgnu23 and failing
> with unrecognized command-line option (gnu23 needs gcc-14 and newer)
>=20
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> =C2=A0...rog_cc_for_build.m4-update-to-latest.patch | 189 +++++++++++++++=
+++
> =C2=A0meta/recipes-support/apr/apr_1.7.6.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A02 files changed, 190 insertions(+)
> =C2=A0create mode 100644 meta/recipes-support/apr/apr/0001-ax_prog_cc_for=
_build.m4-update-to-latest.patch
>=20
> diff --git a/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-up=
date-to-latest.patch b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_bui=
ld.m4-update-to-latest.patch
> new file mode 100644
> index 0000000000..2607f6f860
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to=
-latest.patch
> @@ -0,0 +1,189 @@
> +From 24eb9fd3469e610b6887517a80b8e038c200e807 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <martin.jansa@gmail.com>
> +Date: Fri, 10 Apr 2026 15:04:43 +0200
> +Subject: [PATCH] ax_prog_cc_for_build.m4: update to latest
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +After the autoconf update to 2.73 this was using -std=3Dgnu23
> +even on hosts with gcc-13 which doesn't support it:
> +
> +ac_cv_prog_ac_ct_CC_FOR_BUILD=3D'gcc '
> +CC_FOR_BUILD=3D'gcc=C2=A0 -std=3Dgnu23'
> +ac_ct_CC_FOR_BUILD=3D'gcc '
> +
> +Leading to:
> +gcc: error: unrecognized command-line option =E2=80=98-std=3Dgnu23=E2=80=
=99; did you mean =E2=80=98-std=3Dgnu2x=E2=80=99?
> +
> +Needs the updated ac_cv_prog_cc_c23 from:
> +https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721=
f516fef4226e5eca8da341159765
> +
> +Upstream-Status: Submitted [https://github.com/apache/apr/pull/72]
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + build/ax_prog_cc_for_build.m4 | 99 ++++++++++++++++++++++++++---------
> + 1 file changed, 74 insertions(+), 25 deletions(-)
> +
> +diff --git a/build/ax_prog_cc_for_build.m4 b/build/ax_prog_cc_for_build.=
m4
> +index 26daf36..4d1de99 100644
> +--- a/build/ax_prog_cc_for_build.m4
> ++++ b/build/ax_prog_cc_for_build.m4
> +@@ -32,28 +32,32 @@
> + #=C2=A0=C2=A0 and this notice are preserved. This file is offered as-is=
, without any
> + #=C2=A0=C2=A0 warranty.
> +=20
> +-#serial 9
> ++#serial 26
> +=20
> + AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
> + AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
> + AC_REQUIRE([AC_PROG_CC])dnl
> + AC_REQUIRE([AC_PROG_CPP])dnl
> +-AC_REQUIRE([AC_EXEEXT])dnl
> +-AC_REQUIRE([AC_CANONICAL_HOST])dnl
> ++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
> +=20
> + dnl Use the standard macros, but make them use other variable names
> + dnl
> + pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
> + pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
> ++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
> ++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
> ++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
> ++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
> ++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
> + pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
> + pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
> + pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
> +-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
> +-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
> ++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
> + pushdef([ac_exeext], ac_build_exeext)dnl
> + pushdef([ac_objext], ac_build_objext)dnl
> + pushdef([CC], CC_FOR_BUILD)dnl
> + pushdef([CPP], CPP_FOR_BUILD)dnl
> ++pushdef([GCC], GCC_FOR_BUILD)dnl
> + pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
> + pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
> + pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
> +@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
> + pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
> + pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
> + pushdef([ac_cv_host_os], ac_cv_build_os)dnl
> +-pushdef([ac_cpp], ac_build_cpp)dnl
> +-pushdef([ac_compile], ac_build_compile)dnl
> +-pushdef([ac_link], ac_build_link)dnl
> ++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
> ++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependenc=
ies_compiler_type)dnl
> ++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
> ++pushdef([cross_compiling], cross_compiling_build)dnl
> ++dnl
> ++dnl These variables are problematic to rename by M4 macros, so we save
> ++dnl their values in alternative names, and restore the values later.
> ++dnl
> ++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
> ++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
> ++dnl variables. It's not a good idea to rename ac_cv_exeext and
> ++dnl ac_cv_objext either as they're related.
> ++dnl Renaming ac_exeext and ac_objext is safe though.
> ++dnl
> ++ac_cv_host_exeext=3D$ac_cv_exeext
> ++AS_VAR_SET_IF([ac_cv_build_exeext],
> ++=C2=A0 [ac_cv_exeext=3D$ac_cv_build_exeext],
> ++=C2=A0 [AS_UNSET([ac_cv_exeext])])
> ++ac_cv_host_objext=3D$ac_cv_objext
> ++AS_VAR_SET_IF([ac_cv_build_objext],
> ++=C2=A0 [ac_cv_objext=3D$ac_cv_build_objext],
> ++=C2=A0 [AS_UNSET([ac_cv_objext])])
> ++dnl
> ++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
> ++dnl AC_PROG_CC) indirectly.
> ++dnl
> ++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu
> ++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
> ++=C2=A0 [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],
> ++=C2=A0 [AS_UNSET([ac_cv_c_compiler_gnu])])
> +=20
> +-save_cross_compiling=3D$cross_compiling
> +-save_ac_tool_prefix=3D$ac_tool_prefix
> +-cross_compiling=3Dno
> +-ac_tool_prefix=3D
> ++cross_compiling_build=3Dno
> +=20
> ++ac_build_tool_prefix=3D
> ++AS_IF([test -n "$build"],=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ac_build_tool_=
prefix=3D"$build-"],
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [test -n "$build_alias"],[ac_build_tool_=
prefix=3D"$build_alias-"])
> ++
> ++AC_LANG_PUSH([C])
> + AC_PROG_CC
> ++_AC_COMPILER_EXEEXT
> ++_AC_COMPILER_OBJEXT
> + AC_PROG_CPP
> +-AC_EXEEXT
> +=20
> +-ac_tool_prefix=3D$save_ac_tool_prefix
> +-cross_compiling=3D$save_cross_compiling
> ++BUILD_EXEEXT=3D$ac_cv_exeext
> ++BUILD_OBJEXT=3D$ac_cv_objext
> +=20
> + dnl Restore the old definitions
> + dnl
> +-popdef([ac_link])dnl
> +-popdef([ac_compile])dnl
> +-popdef([ac_cpp])dnl
> ++popdef([cross_compiling])dnl
> ++popdef([am_cv_prog_cc_c_o])dnl
> ++popdef([am_cv_CC_dependencies_compiler_type])dnl
> ++popdef([ac_tool_prefix])dnl
> + popdef([ac_cv_host_os])dnl
> + popdef([ac_cv_host_vendor])dnl
> + popdef([ac_cv_host_cpu])dnl
> +@@ -101,26 +136,40 @@ popdef([host])dnl
> + popdef([LDFLAGS])dnl
> + popdef([CPPFLAGS])dnl
> + popdef([CFLAGS])dnl
> ++popdef([GCC])dnl
> + popdef([CPP])dnl
> + popdef([CC])dnl
> + popdef([ac_objext])dnl
> + popdef([ac_exeext])dnl
> +-popdef([ac_cv_objext])dnl
> +-popdef([ac_cv_exeext])dnl
> ++popdef([ac_prog_cc_stdc])dnl
> + popdef([ac_cv_prog_cc_g])dnl
> + popdef([ac_cv_prog_cc_cross])dnl
> + popdef([ac_cv_prog_cc_works])dnl
> ++popdef([ac_cv_prog_cc_stdc])dnl
> ++popdef([ac_cv_prog_cc_c23])dnl
> ++popdef([ac_cv_prog_cc_c11])dnl
> ++popdef([ac_cv_prog_cc_c99])dnl
> ++popdef([ac_cv_prog_cc_c89])dnl
> + popdef([ac_cv_prog_gcc])dnl
> + popdef([ac_cv_prog_CPP])dnl
> ++dnl
> ++ac_cv_exeext=3D$ac_cv_host_exeext
> ++EXEEXT=3D$ac_cv_host_exeext
> ++ac_cv_objext=3D$ac_cv_host_objext
> ++OBJEXT=3D$ac_cv_host_objext
> ++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
> ++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
> ++
> ++dnl restore global variables ac_ext, ac_cpp, ac_compile,
> ++dnl ac_link, ac_compiler_gnu (dependent on the current
> ++dnl language after popping):
> ++AC_LANG_POP([C])
> +=20
> + dnl Finally, set Makefile variables
> + dnl
> +-BUILD_EXEEXT=3D$ac_build_exeext
> +-BUILD_OBJEXT=3D$ac_build_objext
> +-AC_SUBST(BUILD_EXEEXT)dnl
> +-AC_SUBST(BUILD_OBJEXT)dnl
> ++AC_SUBST([BUILD_EXEEXT])dnl
> ++AC_SUBST([BUILD_OBJEXT])dnl
> + AC_SUBST([CFLAGS_FOR_BUILD])dnl
> + AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
> + AC_SUBST([LDFLAGS_FOR_BUILD])dnl
> + ])
> +-
> diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support=
/apr/apr_1.7.6.bb
> index 13fa5daa3c..86fac1e4c8 100644
> --- a/meta/recipes-support/apr/apr_1.7.6.bb
> +++ b/meta/recipes-support/apr/apr_1.7.6.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 =
\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/autoconf-2.73.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-ax_prog_cc_for_build.m4-update-to-latest.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> =C2=A0SRC_URI[sha256sum] =3D "49030d92d2575da735791b496dc322f3ce5cff94947=
79ba8cc28c7f46c5deb32"

I think this caused a reproducibility issue:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-a5w4mcrk/=
packages/diff-html/

Cheers,

Richard

