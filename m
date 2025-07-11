Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B708FC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 20:20:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.23319.1752265218162813590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 13:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fkqQQpjN;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553bcf41440so2642347e87.3;
        Fri, 11 Jul 2025 13:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752265216; x=1752870016; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG2d5+4Bj2hC4A2hGg4Q7U8uD/Xi2klkId0MPFnqLm0=;
        b=fkqQQpjN2SHAbVPCLXKMhTGQIfkyj9fdwjLZLl5jusCcarC3Oq7looRN/qjp1O811z
         MkRVzsTO5O8XwbM0LqPO0vmcS2pQkPTcg6Na825J2A3L+o59Urjf1SB+CvD9ZnDw4bGB
         q4NtSjoEy21daRN3UQtThI1eJx4/GvrDVcF8xAVtTwaaNKGV+2XpEFtRqp5OIIspKKJW
         2DgZapBfr5b2iv6g6xp/+0Ima2FwyVi7ConhYMjmjWZ6uQv9nz2QZt63UY6ZIHQZYdTW
         h0tLjbzFuzIL6RXUimCHSE441viMvSsnhwZdn3gdE3pSkr7IwL22YN3ZvAe5VMj7leiQ
         lQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752265216; x=1752870016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BG2d5+4Bj2hC4A2hGg4Q7U8uD/Xi2klkId0MPFnqLm0=;
        b=V/342vokfSdJMLtYiWm7k+heo08yO1oeWt1/T51dKrN1tHG1h9h6ENpoUgGIR5c1Wl
         KCg4KYYGxc+Bw1JWWg49HtzxGOeg+MvDEDe2eFy/78ZtZrfvNv1wlk7idjGYatN3htb3
         QXTkoFw5XOyiP6zLj1K1L9P1w1wMKGzLWyyd/8Bkh05lvhbaW4pjz41drfFXRLZP8gka
         54eQYWtAkhc4SjQ6x7GYKULLiKHw/QBr3DNiow1IKRj+ddkKMRIHYtidcOPEvjxa/m5D
         LdGVJ8q9rHLdnoTJJ3qs1noYP8dfBUCyFa9MpKsCElESe42GXaFU48RA55nUp/7E+zVq
         +g3g==
X-Forwarded-Encrypted: i=1; AJvYcCXHCeJ6/DNsoPZWGnkM5vRhvRRvAjDQXvoqkkLwB7/XKSu4BIsHopVK7TPC0VMDpY4xGRrJ3dXkcKkUa+sBrMPl77g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwjJwQshdxh7LeuRm9Ed9OGpGaVbfcF0J/okZMpI3hsvSgpgVWg
	ghg6CC7IowVvVUOkPhG670aKjX2qQYMw4hP+o0/c9g3UuD4XFaWHupgd0WUffyCr/941G32hePH
	h4ckyw0vFPZzYjFhBPy7BVGubLKfH2o8=
X-Gm-Gg: ASbGncsL7oJYtnQe+Wr4BNhDFVHFauEapnbTyYUu6J9N5YSG1ZmW2bSCIqPegfKCN07
	gaTd6gJkVrWWC06FlwbNDeteSVHMuXh/iFg40Ye4nQ+/RR2oc+/dFAfy9724bRDuaanKe+HP4WC
	wBTaoocUpacJB8rYOGPbgjm73hHFzYVKG7CLrEhZThw3VE9V7QEk2LWp8UIpsI3s4jDAvkB7kS1
	bTkotWBxZOZ7fbiratA
X-Google-Smtp-Source: AGHT+IGDrFPBr1rM+NX+zi8cDS+I+NufB8ztAJy+pqBPZKE80ZGVq/QRfcdneBFdkUj5VyOH9TDF6Hgn0EowvfmemLc=
X-Received: by 2002:a05:6512:a84:b0:555:61e:ca7e with SMTP id
 2adb3069b0e04-55a044c8f0fmr1340552e87.10.1752265215871; Fri, 11 Jul 2025
 13:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250630172224.18568-1-wen.yang@linux.dev>
In-Reply-To: <20250630172224.18568-1-wen.yang@linux.dev>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Jul 2025 22:20:04 +0200
X-Gm-Features: Ac12FXx5zmO-blXJ3l3mh6le-QouL7dvdUhI1vIz57G6y7qD-SsMbA4lsIM6ZGM
Message-ID: <CA+chaQe2goaCtC6dN2dDf7SG9RpHZA_A5DTVeycB46SC4rQ5Dw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pstack: add recipe
To: wen.yang@linux.dev
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 20:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220167

libxt and libx11 are available only with x11 in DISTRO_FEATURES, this
should declare the REQUIRED_DISTRO_FEATURES as well.

Will send a fix later.

On Mon, Jun 30, 2025 at 7:40=E2=80=AFPM Wen Yang via lists.openembedded.org
<wen.yang=3Dlinux.dev@lists.openembedded.org> wrote:
>
> This recipe provides pstack for C/C++, Go, Rust, and Python.
>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
>  ...e-issue-of-cross-compilation-failure.patch | 28 +++++++++++++
>  meta-oe/recipes-devtools/pstack/pstack.inc    | 39 +++++++++++++++++++
>  .../recipes-devtools/pstack/pstack_2.10.bb    | 33 ++++++++++++++++
>  meta-oe/recipes-devtools/pstack/pstack_git.bb |  8 ++++
>  4 files changed, 108 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/pstack/files/0001-tests-fix-=
the-issue-of-cross-compilation-failure.patch
>  create mode 100644 meta-oe/recipes-devtools/pstack/pstack.inc
>  create mode 100644 meta-oe/recipes-devtools/pstack/pstack_2.10.bb
>  create mode 100644 meta-oe/recipes-devtools/pstack/pstack_git.bb
>
> diff --git a/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-iss=
ue-of-cross-compilation-failure.patch b/meta-oe/recipes-devtools/pstack/fil=
es/0001-tests-fix-the-issue-of-cross-compilation-failure.patch
> new file mode 100644
> index 0000000000..2b54750e7a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of-c=
ross-compilation-failure.patch
> @@ -0,0 +1,28 @@
> +From a8c3996d3f8d9b8f3a2888b7062c1139263c5aba Mon Sep 17 00:00:00 2001
> +From: Wen Yang <yellowriver2010@hotmail.com>
> +Date: Mon, 23 Jun 2025 02:06:53 +0800
> +Subject: [PATCH] tests: fix the issue of cross compilation failure
> +
> +By replacing objcopy with MAKE_OBJCOPY, pstack could support both
> +native and cross compilation.
> +
> +Upstream-Status: Backport [https://github.com/peadar/pstack/pull/38]
> +---
> + tests/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index 71a62a7..bf11a04 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -38,7 +38,7 @@ SET_TARGET_PROPERTIES(noreturn PROPERTIES COMPILE_FLAG=
S "-O2 -g")
> +
> + add_custom_command(
> +    OUTPUT basic-no-unwind-gen
> +-   COMMAND objcopy --strip-debug --remove-section .eh_frame basic basic=
-no-unwind
> ++   COMMAND ${CMAKE_OBJCOPY} --strip-debug --remove-section .eh_frame ba=
sic basic-no-unwind
> +    VERBATIM )
> +
> + add_custom_target(basic-no-unwind ALL DEPENDS basic basic-no-unwind-gen=
)
> +--
> +2.25.1
> diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recipes=
-devtools/pstack/pstack.inc
> new file mode 100644
> index 0000000000..9831a74d1a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pstack/pstack.inc
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "A utility to print stack traces of running processes"
> +DESCRIPTION =3D "A from-scratch implementation of pstack using DWARF deb=
ugging and unwind information. \
> +Works for C/C++, Go, Rust, and Python. A traditional pstack command can =
generally print a backtrace \
> +of each thread in a running program, and sometimes from a core file. Thi=
s version of pstack uses its \
> +own self contained ELF and DWARF parsing library, libdwelf to parse the =
DWARF debug and unwind \
> +information, to get a stack trace."
> +HOMEPAGE =3D "https://github.com/peadar/pstack"
> +SECTION =3D "devel"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D671019a96ba80415b696240ed2ca5=
e80"
> +
> +inherit cmake
> +
> +S =3D "${UNPACKDIR}/${BPN}-${PV}"
> +DEPENDS +=3D "zlib xz libunwind elfutils"
> +
> +RDEPENDS:${PN} +=3D "elfutils"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/pstack ${D}${bindir}/pstack
> +
> +    install -d ${D}${libdir}
> +    install -m 0755 ${B}/libprocman.so.${PV} ${D}${libdir}/libprocman.so=
.${PV}
> +    ln -sf libprocman.so.${PV} ${D}${libdir}/libprocman.so
> +    install -m 0755 ${B}/libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so.${=
PV}
> +    ln -sf libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so
> +}
> +
> +PACKAGES =3D "${PN}"
> +FILES:${PN} =3D "${bindir}/pstack"
> +FILES:${PN} +=3D "${libdir}/libprocman.so.${PV}"
> +FILES:${PN} +=3D "${libdir}/libdwelf.so.${PV}"
> +
> +PACKAGES +=3D "${PN}-dbg"
> +FILES:${PN}-dbg +=3D "${base_bindir}/.debug ${base_sbindir}/.debug ${bin=
dir}/.debug ${sbindir}/.debug"
> +
> +PACKAGES +=3D "${PN}-dev"
> +FILES:${PN}-dev +=3D "${base_libdir}/*.so"
> diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb b/meta-oe/rec=
ipes-devtools/pstack/pstack_2.10.bb
> new file mode 100644
> index 0000000000..cebc13d36c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "A from-scratch implementation of pstack using DWARF debuggi=
ng \
> +and unwind information. Works for C/C++, Go, Rust, and Python."
> +
> +HOMEPAGE =3D "https://github.com/peadar/pstack"
> +SECTION =3D "devel/pstack"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea061f8731d5e6a5761dfad951ef5=
f5f"
> +
> +DEPENDS =3D "tcl virtual/libx11 libxt zip-native"
> +
> +SRC_URI =3D "git://github.com/peadar/pstack;branch=3Dmaster;tag=3Dv${PV}=
;protocol=3Dhttps"
> +SRCREV =3D "a310df637d74917a1d3570c540bf3aef899d7e63"
> +
> +S =3D "${WORKDIR}/${BPN}${PV}"
> +
> +PACKAGES =3D+ "${PN}-lib"
> +
> +SOLIBS =3D ".so"
> +FILES_SOLIBSDEV =3D ""
> +
> +# isn't getting picked up by shlibs code
> +RDEPENDS:${PN} +=3D "tk-lib"
> +RDEPENDS:${PN}:class-native =3D ""
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +inherit binconfig
> +
> +SYSROOT_DIRS +=3D "${bindir_crossscripts}"
> +
> +# Fix some paths that might be used by Tcl extensions
> +BINCONFIG_GLOB =3D "*Config.sh"
> diff --git a/meta-oe/recipes-devtools/pstack/pstack_git.bb b/meta-oe/reci=
pes-devtools/pstack/pstack_git.bb
> new file mode 100644
> index 0000000000..cc6721f9e3
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pstack/pstack_git.bb
> @@ -0,0 +1,8 @@
> +require pstack.inc
> +
> +SRCREV =3D "1e1734be3adb6d9c81b57c5cc3d0c8fbc43bdee3"
> +PV =3D "2.11"
> +
> +SRC_URI =3D "git://github.com/peadar/pstack.git;branch=3Dmaster;protocol=
=3Dhttps \
> +           file://0001-tests-fix-the-issue-of-cross-compilation-failure.=
patch \
> +          "
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118182): https://lists.openembedded.org/g/openembedde=
d-devel/message/118182
> Mute This Topic: https://lists.openembedded.org/mt/113912625/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

