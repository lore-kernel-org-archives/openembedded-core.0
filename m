Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FD8C83F1B
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 00:06:21 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.27223.1752278772183772788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 17:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNIldDE/;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e85e06a7f63so2305725276.1;
        Fri, 11 Jul 2025 17:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752278771; x=1752883571; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLSLHvgOzYH4ScffwjzyzgzS92rl8wHcH6OYgdsEy4Q=;
        b=XNIldDE/1WKbBJFcyYfYeq6vhoiJX8HvswM9jU7uIGJVuoRhRjo/e9Q7txo10DKTXG
         L6lGkpNXpEsda/76VC29imgkY2xqfEwGy1mkyV+5FA2+7/8lduX8OFDv7TvhIXEd6+8W
         Lh+9eU6mg4Y2xz/P/vmrfmA+JCogP9Jm2Pdr1DFKwJmv44tddW/u/dz7F9jpMFVfi9Fw
         ee17P2Ff6JMesYdVEk1FJVQjU0ugCAtHWRf9GqVYlH+auqMElhSwBP3Ac62Rt1G93WeU
         p+9R4kLubaIRDcLKlZYZMqA12SEneB2EjGtUoZBngJWhBr02XVomiQGlgGw4uT30aOuk
         Yn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752278771; x=1752883571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLSLHvgOzYH4ScffwjzyzgzS92rl8wHcH6OYgdsEy4Q=;
        b=gBAdPpYCZjj5lkNzztf7YBd5qie7lcG0qha9hij1Bww+CIqSFU1aIQNC9CLSShe+Af
         qfw8DgTITwn4TU+goSOFd69fBBrEYeZ/GQBf9wMjMWzUGU0BAYQtVtg/pzWSh1N/qUVG
         +jLWkFEdShNO+uSBV6yBUGYmmFPn5Fk5sQkM7J9Cbs7vljpQ71Q4/wJQD6qxAPWcPbnM
         5q5z+Ui/RhDxnSQxJGdwNb6HWZU9cmE4v6C//O0rQff2cyW8EKj0vD6MYFWLuqJr44HJ
         +OMNT2ncUcTcxz3v3lIEPXnCfoanGvZSZIwfhisftzNpn19JjADc4OzxqDCrScYKpeuR
         an1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcUXcfvWw9LAoagpmYxEbUaH0pdASSBTrJmVLC4ZoUVWOUQE1hDKaMLcRE/vnA3E3D2Bhq3wh/0+yr+QaH74mDBQ==@lists.openembedded.org, AJvYcCXu5rF+/NsbIh1SDjVs40jlG0TmKD2S2Bhyddofj/O/wKg/954IwN0All32YbhaTQtxAjdFDvF9kfw4c5lNwp9GE/u3@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYgt98NBRwefOFWwTU/EQxEVTTcxA2FvizZHmuGMbATwxit97H
	1FSaZb8HfkSXxuhNJkiXXOytr4N4qLJyplQCGFxwznIUMYlfGGnpzQafsB7Uk6wovXwHPi1lMJs
	otYE1c4CDkd2T+YfMOI26+0+Lq7pqlVW2JWcw
X-Gm-Gg: ASbGnctkdfa5UUwheNrkeR5q2BMq13fyUcSLRJH8JOObZnuYrmjuMVREdU90VeKHCeM
	LfQR2A/WrVzc2LHImqzwUVyd2zlgggPpBFjv9Bq3ZYpBWkWu2HhclLIzdFRT67G2nPhuCLiTFO+
	0Aa7OAopzfoI4dk2xC+wXAJymQm7VXyU+PYyFm618loD5KxNamByJIu+ZB3jo7kie9ZzGitf3Wt
	RFSH2k=
X-Google-Smtp-Source: AGHT+IE8e6e4qdQeIijBPsdGdp5xMfCIdgiSuCRIMyjZYdaw42zvsqtT0peHVntJlA2r6i17GvPLbWTdjjdkLpNzqbg=
X-Received: by 2002:a05:690c:a6d0:b0:70e:2cf0:f66a with SMTP id
 00721157ae682-717d5b8175amr62299247b3.6.1752278771117; Fri, 11 Jul 2025
 17:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250630172224.18568-1-wen.yang@linux.dev> <CA+chaQe2goaCtC6dN2dDf7SG9RpHZA_A5DTVeycB46SC4rQ5Dw@mail.gmail.com>
In-Reply-To: <CA+chaQe2goaCtC6dN2dDf7SG9RpHZA_A5DTVeycB46SC4rQ5Dw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jul 2025 17:05:44 -0700
X-Gm-Features: Ac12FXz22TzxdD8GMnWgMSGH7bcoYicF68hsIzos8TcwJtsw7oo8j_0JzHOMAuQ
Message-ID: <CAMKF1so679WfQewA2+Cg2M=TbtXCk-0yQFzJK0opRkXMDbNh6w@mail.gmail.com>
Subject: Re: [OE-core] [oe] [meta-oe][PATCH] pstack: add recipe
To: martin.jansa@gmail.com
Cc: wen.yang@linux.dev, openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 00:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220171

On Fri, Jul 11, 2025 at 1:20=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> libxt and libx11 are available only with x11 in DISTRO_FEATURES, this
> should declare the REQUIRED_DISTRO_FEATURES as well.
>
> Will send a fix later.
>

Thanks

> On Mon, Jun 30, 2025 at 7:40=E2=80=AFPM Wen Yang via lists.openembedded.o=
rg
> <wen.yang=3Dlinux.dev@lists.openembedded.org> wrote:
> >
> > This recipe provides pstack for C/C++, Go, Rust, and Python.
> >
> > Signed-off-by: Wen Yang <wen.yang@linux.dev>
> > ---
> >  ...e-issue-of-cross-compilation-failure.patch | 28 +++++++++++++
> >  meta-oe/recipes-devtools/pstack/pstack.inc    | 39 +++++++++++++++++++
> >  .../recipes-devtools/pstack/pstack_2.10.bb    | 33 ++++++++++++++++
> >  meta-oe/recipes-devtools/pstack/pstack_git.bb |  8 ++++
> >  4 files changed, 108 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/pstack/files/0001-tests-fi=
x-the-issue-of-cross-compilation-failure.patch
> >  create mode 100644 meta-oe/recipes-devtools/pstack/pstack.inc
> >  create mode 100644 meta-oe/recipes-devtools/pstack/pstack_2.10.bb
> >  create mode 100644 meta-oe/recipes-devtools/pstack/pstack_git.bb
> >
> > diff --git a/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-i=
ssue-of-cross-compilation-failure.patch b/meta-oe/recipes-devtools/pstack/f=
iles/0001-tests-fix-the-issue-of-cross-compilation-failure.patch
> > new file mode 100644
> > index 0000000000..2b54750e7a
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of=
-cross-compilation-failure.patch
> > @@ -0,0 +1,28 @@
> > +From a8c3996d3f8d9b8f3a2888b7062c1139263c5aba Mon Sep 17 00:00:00 2001
> > +From: Wen Yang <yellowriver2010@hotmail.com>
> > +Date: Mon, 23 Jun 2025 02:06:53 +0800
> > +Subject: [PATCH] tests: fix the issue of cross compilation failure
> > +
> > +By replacing objcopy with MAKE_OBJCOPY, pstack could support both
> > +native and cross compilation.
> > +
> > +Upstream-Status: Backport [https://github.com/peadar/pstack/pull/38]
> > +---
> > + tests/CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> > +index 71a62a7..bf11a04 100644
> > +--- a/tests/CMakeLists.txt
> > ++++ b/tests/CMakeLists.txt
> > +@@ -38,7 +38,7 @@ SET_TARGET_PROPERTIES(noreturn PROPERTIES COMPILE_FL=
AGS "-O2 -g")
> > +
> > + add_custom_command(
> > +    OUTPUT basic-no-unwind-gen
> > +-   COMMAND objcopy --strip-debug --remove-section .eh_frame basic bas=
ic-no-unwind
> > ++   COMMAND ${CMAKE_OBJCOPY} --strip-debug --remove-section .eh_frame =
basic basic-no-unwind
> > +    VERBATIM )
> > +
> > + add_custom_target(basic-no-unwind ALL DEPENDS basic basic-no-unwind-g=
en)
> > +--
> > +2.25.1
> > diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recip=
es-devtools/pstack/pstack.inc
> > new file mode 100644
> > index 0000000000..9831a74d1a
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/pstack/pstack.inc
> > @@ -0,0 +1,39 @@
> > +SUMMARY =3D "A utility to print stack traces of running processes"
> > +DESCRIPTION =3D "A from-scratch implementation of pstack using DWARF d=
ebugging and unwind information. \
> > +Works for C/C++, Go, Rust, and Python. A traditional pstack command ca=
n generally print a backtrace \
> > +of each thread in a running program, and sometimes from a core file. T=
his version of pstack uses its \
> > +own self contained ELF and DWARF parsing library, libdwelf to parse th=
e DWARF debug and unwind \
> > +information, to get a stack trace."
> > +HOMEPAGE =3D "https://github.com/peadar/pstack"
> > +SECTION =3D "devel"
> > +LICENSE =3D "BSD-2-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D671019a96ba80415b696240ed2c=
a5e80"
> > +
> > +inherit cmake
> > +
> > +S =3D "${UNPACKDIR}/${BPN}-${PV}"
> > +DEPENDS +=3D "zlib xz libunwind elfutils"
> > +
> > +RDEPENDS:${PN} +=3D "elfutils"
> > +
> > +do_install() {
> > +    install -d ${D}${bindir}
> > +    install -m 0755 ${B}/pstack ${D}${bindir}/pstack
> > +
> > +    install -d ${D}${libdir}
> > +    install -m 0755 ${B}/libprocman.so.${PV} ${D}${libdir}/libprocman.=
so.${PV}
> > +    ln -sf libprocman.so.${PV} ${D}${libdir}/libprocman.so
> > +    install -m 0755 ${B}/libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so.=
${PV}
> > +    ln -sf libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so
> > +}
> > +
> > +PACKAGES =3D "${PN}"
> > +FILES:${PN} =3D "${bindir}/pstack"
> > +FILES:${PN} +=3D "${libdir}/libprocman.so.${PV}"
> > +FILES:${PN} +=3D "${libdir}/libdwelf.so.${PV}"
> > +
> > +PACKAGES +=3D "${PN}-dbg"
> > +FILES:${PN}-dbg +=3D "${base_bindir}/.debug ${base_sbindir}/.debug ${b=
indir}/.debug ${sbindir}/.debug"
> > +
> > +PACKAGES +=3D "${PN}-dev"
> > +FILES:${PN}-dev +=3D "${base_libdir}/*.so"
> > diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb b/meta-oe/r=
ecipes-devtools/pstack/pstack_2.10.bb
> > new file mode 100644
> > index 0000000000..cebc13d36c
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
> > @@ -0,0 +1,33 @@
> > +SUMMARY =3D "A from-scratch implementation of pstack using DWARF debug=
ging \
> > +and unwind information. Works for C/C++, Go, Rust, and Python."
> > +
> > +HOMEPAGE =3D "https://github.com/peadar/pstack"
> > +SECTION =3D "devel/pstack"
> > +
> > +LICENSE =3D "BSD-2-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea061f8731d5e6a5761dfad951e=
f5f5f"
> > +
> > +DEPENDS =3D "tcl virtual/libx11 libxt zip-native"
> > +
> > +SRC_URI =3D "git://github.com/peadar/pstack;branch=3Dmaster;tag=3Dv${P=
V};protocol=3Dhttps"
> > +SRCREV =3D "a310df637d74917a1d3570c540bf3aef899d7e63"
> > +
> > +S =3D "${WORKDIR}/${BPN}${PV}"
> > +
> > +PACKAGES =3D+ "${PN}-lib"
> > +
> > +SOLIBS =3D ".so"
> > +FILES_SOLIBSDEV =3D ""
> > +
> > +# isn't getting picked up by shlibs code
> > +RDEPENDS:${PN} +=3D "tk-lib"
> > +RDEPENDS:${PN}:class-native =3D ""
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +inherit binconfig
> > +
> > +SYSROOT_DIRS +=3D "${bindir_crossscripts}"
> > +
> > +# Fix some paths that might be used by Tcl extensions
> > +BINCONFIG_GLOB =3D "*Config.sh"
> > diff --git a/meta-oe/recipes-devtools/pstack/pstack_git.bb b/meta-oe/re=
cipes-devtools/pstack/pstack_git.bb
> > new file mode 100644
> > index 0000000000..cc6721f9e3
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/pstack/pstack_git.bb
> > @@ -0,0 +1,8 @@
> > +require pstack.inc
> > +
> > +SRCREV =3D "1e1734be3adb6d9c81b57c5cc3d0c8fbc43bdee3"
> > +PV =3D "2.11"
> > +
> > +SRC_URI =3D "git://github.com/peadar/pstack.git;branch=3Dmaster;protoc=
ol=3Dhttps \
> > +           file://0001-tests-fix-the-issue-of-cross-compilation-failur=
e.patch \
> > +          "
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220167): https://lists.openembedded.org/g/openembedde=
d-core/message/220167
> Mute This Topic: https://lists.openembedded.org/mt/114107395/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

