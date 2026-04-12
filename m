Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E82CE937E3
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 11:17:26 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.238687.1775992643345810766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 04:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UoqoA/l6;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38dd9194d8eso29432361fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 04:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775992641; cv=none;
        d=google.com; s=arc-20240605;
        b=BkCsXlY9VGFAG63Hts+z9krlQxLEfGC4my6W399y4KGgleOdpkDd2DxAkQAQ9I13JM
         QSnpmJNCzNpR1TORh4RJPwArI62cETYvIHinNuo2ptFm/lK5iiDXFXySswSOitxTigmt
         NaNZMttCirbmVh1Tr/iIsnanZM6oZte2Gn9dOdsiIsBjtdTKcBW/J7nnC3edOYtVvnrv
         zfAI1G32uw71tvwdo7X6q8b03isG/haz7G4/6nOBp2Q4GjDg/CVfj670B1Hlz00Tzcjs
         RfH0To2/YKkepKCXYwxcrZ1qllmtiw1lLz4gfBdKghsSPsZy0WGYu9+kIvab+T/kIdjB
         1ZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KJbJReE0vbn70ysogri687ue5e3VS0u5V+inMVbnblw=;
        fh=ikd14p3Hl7uMJU/2Nr1ewU2BcGdP9niUkTjAXiSXruE=;
        b=O2VsWlSt+e4rKvYLj9K4dA/Uo7maS3gCEnlvR8YcvFqVr0iemZMSRohwG0l0ri6Bvu
         cqK/MC8yK/OG1TCegX4s7XgOVMjS1XZMSnzol6wIA4++CvaGsVnDgw5sa6j9p12mYSR/
         NwcRydyTA0cHOZBFy+ZOWu4HLfXnDJc+kuVCb8dFdblKsT9Nffx5vBJgbNHws+hQMzsL
         AURm7OuCjiDvrMQlBjq5p9P+/J4rRmcdlnYDxXVR6KzDCbErRcrEWINrNEiTt2WEa2hc
         6H2+5fCrynO7Nf0qnRzJ3hLYwC4vVnAHgjbpkWVj3GPkggtOIZcJHFiuE/x51zrnAIIA
         T1Nw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775992641; x=1776597441; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJbJReE0vbn70ysogri687ue5e3VS0u5V+inMVbnblw=;
        b=UoqoA/l60Tw9Q0yghqrDpJGNdETEmF2tAS+mL9jLA0TLb/K8sTHFnM09c7hVAbBlrQ
         5ps/2FmSrTJTiaVAV5HLlUfhUkBbWf5+TQ/DhixZ/Lp7297MS2TUU5yIfo3tZ/d7gsjS
         aeFvKjZJ21gWa37TnnvlCKV/zbDwk5rrZ+qH+IRgpXAPDQSv4dwHDllNf9MzDprkIIp8
         2xlXqN1brqRE+rGpuQX+pPr8TnsPC6y/6ttN0SopYHvJ39SsdjsIo7ePFQOWLVHh/ckv
         LAtV46cWivq5AS50eX7PYv9aJYW1XjpNmmvt1oxJH8yh1TGJSiWzDqakMCWlZgdBZIId
         NoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775992641; x=1776597441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJbJReE0vbn70ysogri687ue5e3VS0u5V+inMVbnblw=;
        b=gMZvKoFzmyknUZ1fbxOcYaxHo/Ds+ewM7yj0ZFyckfX1hfqOCli+tysCRW0IfKdUUS
         51/2Fzb3LZEQBsv+s9GzWlLIxbFbTv6y0hiPycaXxnhJGVaHFwkkFtQOpSRf2sCJ+ZNV
         Z7O5Btycmo2SRdfV0Lqn86KexbcOJLntxYW5l4KaYqjZ6gALzOv31R72inSn4fsonWSL
         LRahRR595ebvEX77P04IWjx9o8hRiXQazpo0hSg0RGp4BbG98BOBJ3uOqq209ypxxpBz
         En2ePZI3B27HU8zY9LPJvdAkIvRIdXSuY1Fj/prvEcYFlYa9tSk8SW9lg5BO4wCXP2tS
         8bdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RhQ9UnkLH7UjKSQZJFq3UZFf5kxn3gDfMkszk1+u9PRkqz709W+I7zHHvsmtCJq9YTlGhw8b17dhuiGnn13+FkA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQyndRjYJzxvj95pURlihJbXh6Vn/zqAjSAj602Kz4RELu+s/b
	4ovbLZbqTjPmWMiA3pDfg9MzJ5pI8lAQEs16jSZGGUH0gfsJDMUEvcmXNPAP79Mg6VRgXyIwZpm
	ZIICLTsjIM7le/VQgBYjUdqycEPfsq2I=
X-Gm-Gg: AeBDieuz6UNpj9r4f3mckUpbWh/OeIasr4O45ex7ge5M7af2zECH85ZbRnNwI/EyHzI
	7YNAMyGQqNhZRFbkEGQUVg5KPqH004yk2O0yWYpUlAjtVvt3LpbvMeZfAi1KiJ4Nf4da1Wouxvz
	HE6kV83kkQZDszi03GZDWAybBsBAill/Uow0RHD0m8qMOsBigYBkwHb3uwOQMVUaBRnnHYCAAjF
	biQ2Nv0tex5Zq0YAhy0r92c7YixmINFckoau+bTnsYBzdgYWe72pcKRh5FS+R3aGsw6O5nlhWPC
	WYH1j5AHXgbBrleLwJwfotCjoZfBBYTXwgdMKRA9VHbpBqPeJePphqbFFvZ81QYssQ==
X-Received: by 2002:a05:6512:a94:b0:5a2:b2de:d166 with SMTP id
 2adb3069b0e04-5a3efd805ecmr2932295e87.32.1775992640702; Sun, 12 Apr 2026
 04:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260410134915.3936107-1-martin.jansa@gmail.com>
 <8ffabe3414bdb206a716aa9ee5db2fc964d07e79.camel@linuxfoundation.org> <CAMKF1soX-iCuuf_ygqXU7PAwryUw5NS7fJCpr_J5mezVF_3oyg@mail.gmail.com>
In-Reply-To: <CAMKF1soX-iCuuf_ygqXU7PAwryUw5NS7fJCpr_J5mezVF_3oyg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 12 Apr 2026 13:17:08 +0200
X-Gm-Features: AQROBzBnUNFJJN9JrIe_ZtUuBY5QQUaZC94nLKPEx1LlPr-Y6mI1LpKgo-EkLrs
Message-ID: <CA+chaQfRM1A_gDHzdOm_uPcXpz7TR_gwtVwt1g5yVPmN81_bdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apr: fix build with autoconf-2.73
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 11:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235066

On Sun, Apr 12, 2026 at 9:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Sat, Apr 11, 2026 at 11:01=E2=80=AFPM Richard Purdie via lists.openemb=
edded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wro=
te:
>>
>> On Fri, 2026-04-10 at 15:49 +0200, Martin Jansa via lists.openembedded.o=
rg wrote:
>> > From: Martin Jansa <martin.jansa@gmail.com>
>> >
>> > On hosts with gcc-13 it was trying to use -std=3Dgnu23 and failing
>> > with unrecognized command-line option (gnu23 needs gcc-14 and newer)
>> >
>> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> > ---
>> >  ...rog_cc_for_build.m4-update-to-latest.patch | 189 +++++++++++++++++=
+
>> >  meta/recipes-support/apr/apr_1.7.6.bb         |   1 +
>> >  2 files changed, 190 insertions(+)
>> >  create mode 100644 meta/recipes-support/apr/apr/0001-ax_prog_cc_for_b=
uild.m4-update-to-latest.patch
>> >
>> > diff --git a/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4=
-update-to-latest.patch b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_=
build.m4-update-to-latest.patch
>> > new file mode 100644
>> > index 0000000000..2607f6f860
>> > --- /dev/null
>> > +++ b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update=
-to-latest.patch
>> > @@ -0,0 +1,189 @@
>> > +From 24eb9fd3469e610b6887517a80b8e038c200e807 Mon Sep 17 00:00:00 200=
1
>> > +From: Martin Jansa <martin.jansa@gmail.com>
>> > +Date: Fri, 10 Apr 2026 15:04:43 +0200
>> > +Subject: [PATCH] ax_prog_cc_for_build.m4: update to latest
>> > +MIME-Version: 1.0
>> > +Content-Type: text/plain; charset=3DUTF-8
>> > +Content-Transfer-Encoding: 8bit
>> > +
>> > +After the autoconf update to 2.73 this was using -std=3Dgnu23
>> > +even on hosts with gcc-13 which doesn't support it:
>> > +
>> > +ac_cv_prog_ac_ct_CC_FOR_BUILD=3D'gcc '
>> > +CC_FOR_BUILD=3D'gcc  -std=3Dgnu23'
>> > +ac_ct_CC_FOR_BUILD=3D'gcc '
>> > +
>> > +Leading to:
>> > +gcc: error: unrecognized command-line option =E2=80=98-std=3Dgnu23=E2=
=80=99; did you mean =E2=80=98-std=3Dgnu2x=E2=80=99?
>> > +
>> > +Needs the updated ac_cv_prog_cc_c23 from:
>> > +https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96=
721f516fef4226e5eca8da341159765
>> > +
>> > +Upstream-Status: Submitted [https://github.com/apache/apr/pull/72]
>> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> > +---
>> > + build/ax_prog_cc_for_build.m4 | 99 ++++++++++++++++++++++++++-------=
--
>> > + 1 file changed, 74 insertions(+), 25 deletions(-)
>> > +
>> > +diff --git a/build/ax_prog_cc_for_build.m4 b/build/ax_prog_cc_for_bui=
ld.m4
>> > +index 26daf36..4d1de99 100644
>> > +--- a/build/ax_prog_cc_for_build.m4
>> > ++++ b/build/ax_prog_cc_for_build.m4
>> > +@@ -32,28 +32,32 @@
>> > + #   and this notice are preserved. This file is offered as-is, witho=
ut any
>> > + #   warranty.
>> > +
>> > +-#serial 9
>> > ++#serial 26
>> > +
>> > + AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
>> > + AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
>> > + AC_REQUIRE([AC_PROG_CC])dnl
>> > + AC_REQUIRE([AC_PROG_CPP])dnl
>> > +-AC_REQUIRE([AC_EXEEXT])dnl
>> > +-AC_REQUIRE([AC_CANONICAL_HOST])dnl
>> > ++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
>> > +
>> > + dnl Use the standard macros, but make them use other variable names
>> > + dnl
>> > + pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
>> > + pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
>> > ++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
>> > ++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
>> > ++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
>> > ++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
>> > ++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
>> > + pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
>> > + pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
>> > + pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
>> > +-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
>> > +-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
>> > ++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
>> > + pushdef([ac_exeext], ac_build_exeext)dnl
>> > + pushdef([ac_objext], ac_build_objext)dnl
>> > + pushdef([CC], CC_FOR_BUILD)dnl
>> > + pushdef([CPP], CPP_FOR_BUILD)dnl
>> > ++pushdef([GCC], GCC_FOR_BUILD)dnl
>> > + pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
>> > + pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
>> > + pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
>> > +@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
>> > + pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
>> > + pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
>> > + pushdef([ac_cv_host_os], ac_cv_build_os)dnl
>> > +-pushdef([ac_cpp], ac_build_cpp)dnl
>> > +-pushdef([ac_compile], ac_build_compile)dnl
>> > +-pushdef([ac_link], ac_build_link)dnl
>> > ++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
>> > ++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_depend=
encies_compiler_type)dnl
>> > ++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
>> > ++pushdef([cross_compiling], cross_compiling_build)dnl
>> > ++dnl
>> > ++dnl These variables are problematic to rename by M4 macros, so we sa=
ve
>> > ++dnl their values in alternative names, and restore the values later.
>> > ++dnl
>> > ++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
>> > ++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
>> > ++dnl variables. It's not a good idea to rename ac_cv_exeext and
>> > ++dnl ac_cv_objext either as they're related.
>> > ++dnl Renaming ac_exeext and ac_objext is safe though.
>> > ++dnl
>> > ++ac_cv_host_exeext=3D$ac_cv_exeext
>> > ++AS_VAR_SET_IF([ac_cv_build_exeext],
>> > ++  [ac_cv_exeext=3D$ac_cv_build_exeext],
>> > ++  [AS_UNSET([ac_cv_exeext])])
>> > ++ac_cv_host_objext=3D$ac_cv_objext
>> > ++AS_VAR_SET_IF([ac_cv_build_objext],
>> > ++  [ac_cv_objext=3D$ac_cv_build_objext],
>> > ++  [AS_UNSET([ac_cv_objext])])
>> > ++dnl
>> > ++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
>> > ++dnl AC_PROG_CC) indirectly.
>> > ++dnl
>> > ++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu
>> > ++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
>> > ++  [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],
>> > ++  [AS_UNSET([ac_cv_c_compiler_gnu])])
>> > +
>> > +-save_cross_compiling=3D$cross_compiling
>> > +-save_ac_tool_prefix=3D$ac_tool_prefix
>> > +-cross_compiling=3Dno
>> > +-ac_tool_prefix=3D
>> > ++cross_compiling_build=3Dno
>> > +
>> > ++ac_build_tool_prefix=3D
>> > ++AS_IF([test -n "$build"],      [ac_build_tool_prefix=3D"$build-"],
>> > ++      [test -n "$build_alias"],[ac_build_tool_prefix=3D"$build_alias=
-"])
>> > ++
>> > ++AC_LANG_PUSH([C])
>> > + AC_PROG_CC
>> > ++_AC_COMPILER_EXEEXT
>> > ++_AC_COMPILER_OBJEXT
>> > + AC_PROG_CPP
>> > +-AC_EXEEXT
>> > +
>> > +-ac_tool_prefix=3D$save_ac_tool_prefix
>> > +-cross_compiling=3D$save_cross_compiling
>> > ++BUILD_EXEEXT=3D$ac_cv_exeext
>> > ++BUILD_OBJEXT=3D$ac_cv_objext
>> > +
>> > + dnl Restore the old definitions
>> > + dnl
>> > +-popdef([ac_link])dnl
>> > +-popdef([ac_compile])dnl
>> > +-popdef([ac_cpp])dnl
>> > ++popdef([cross_compiling])dnl
>> > ++popdef([am_cv_prog_cc_c_o])dnl
>> > ++popdef([am_cv_CC_dependencies_compiler_type])dnl
>> > ++popdef([ac_tool_prefix])dnl
>> > + popdef([ac_cv_host_os])dnl
>> > + popdef([ac_cv_host_vendor])dnl
>> > + popdef([ac_cv_host_cpu])dnl
>> > +@@ -101,26 +136,40 @@ popdef([host])dnl
>> > + popdef([LDFLAGS])dnl
>> > + popdef([CPPFLAGS])dnl
>> > + popdef([CFLAGS])dnl
>> > ++popdef([GCC])dnl
>> > + popdef([CPP])dnl
>> > + popdef([CC])dnl
>> > + popdef([ac_objext])dnl
>> > + popdef([ac_exeext])dnl
>> > +-popdef([ac_cv_objext])dnl
>> > +-popdef([ac_cv_exeext])dnl
>> > ++popdef([ac_prog_cc_stdc])dnl
>> > + popdef([ac_cv_prog_cc_g])dnl
>> > + popdef([ac_cv_prog_cc_cross])dnl
>> > + popdef([ac_cv_prog_cc_works])dnl
>> > ++popdef([ac_cv_prog_cc_stdc])dnl
>> > ++popdef([ac_cv_prog_cc_c23])dnl
>> > ++popdef([ac_cv_prog_cc_c11])dnl
>> > ++popdef([ac_cv_prog_cc_c99])dnl
>> > ++popdef([ac_cv_prog_cc_c89])dnl
>> > + popdef([ac_cv_prog_gcc])dnl
>> > + popdef([ac_cv_prog_CPP])dnl
>> > ++dnl
>> > ++ac_cv_exeext=3D$ac_cv_host_exeext
>> > ++EXEEXT=3D$ac_cv_host_exeext
>> > ++ac_cv_objext=3D$ac_cv_host_objext
>> > ++OBJEXT=3D$ac_cv_host_objext
>> > ++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
>> > ++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
>> > ++
>> > ++dnl restore global variables ac_ext, ac_cpp, ac_compile,
>> > ++dnl ac_link, ac_compiler_gnu (dependent on the current
>> > ++dnl language after popping):
>> > ++AC_LANG_POP([C])
>> > +
>> > + dnl Finally, set Makefile variables
>> > + dnl
>> > +-BUILD_EXEEXT=3D$ac_build_exeext
>> > +-BUILD_OBJEXT=3D$ac_build_objext
>> > +-AC_SUBST(BUILD_EXEEXT)dnl
>> > +-AC_SUBST(BUILD_OBJEXT)dnl
>> > ++AC_SUBST([BUILD_EXEEXT])dnl
>> > ++AC_SUBST([BUILD_OBJEXT])dnl
>> > + AC_SUBST([CFLAGS_FOR_BUILD])dnl
>> > + AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
>> > + AC_SUBST([LDFLAGS_FOR_BUILD])dnl
>> > + ])
>> > +-
>> > diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-supp=
ort/apr/apr_1.7.6.bb
>> > index 13fa5daa3c..86fac1e4c8 100644
>> > --- a/meta/recipes-support/apr/apr_1.7.6.bb
>> > +++ b/meta/recipes-support/apr/apr_1.7.6.bb
>> > @@ -22,6 +22,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.b=
z2 \
>> >             file://0001-configure-Remove-runtime-test-for-mmap-that-ca=
n-map-.patch \
>> >             file://autoconf-2.73.patch \
>> >             file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch=
 \
>> > +           file://0001-ax_prog_cc_for_build.m4-update-to-latest.patch=
 \
>> >             "
>> >
>> >  SRC_URI[sha256sum] =3D "49030d92d2575da735791b496dc322f3ce5cff9494779=
ba8cc28c7f46c5deb32"
>>
>> I think this caused a reproducibility issue:
>>
>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-a5w4mc=
rk/packages/diff-html/
>>
>
> I think we should sed -std=3Dgnu23 out from CC_FOR_BUILD in the mk file i=
n do_install

Surprisingly the native build behaves a bit differently than target
and neither of my systems used -std=3Dgnu23 in CC_FOR_BUILD in native
build (even when gcc on host is new enough).

I've sent the sed as suggested:
https://lists.openembedded.org/g/openembedded-core/message/235065

Cheers,

