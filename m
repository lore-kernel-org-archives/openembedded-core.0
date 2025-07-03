Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C9AC83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 23:02:43 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.703.1751583755915543831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 16:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ncgTtouZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-712be7e034cso2959687b3.0;
        Thu, 03 Jul 2025 16:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751583755; x=1752188555; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuR1i4rIocxnpU0liKTHa+MW+T0XH7gZSCKU5cgd/kc=;
        b=ncgTtouZtxqWBM5XLXqVVzUxOVphzRLnd9P9g2lk/Rtkwh+Hwa8eSWk+Sm3yKuoCmL
         D62VfKmG2WJ5ff3yGpwbNGoozVxYgP8fdptWTAm9O9ujNT83p7cTUQ5eF/TzP8Apipw2
         N8inI2e9qupapCS2HA1PoEyiU8B/b7JGp7kKIJ84USGHPx1tGeKqlBu//YEF+xp90vKP
         rulG6kA1KAcFOvHhRs3w22t7X/5P5K7jws4mLqMf8EsK5iuJq845bgHjmTnkmhI5pA7s
         4yCSgML1KTHpSy/3T6A3XghC1099UE6amaMpzdbFKpXL12wpb+MqaMQF6/8IC9iHyRKA
         WVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751583755; x=1752188555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuR1i4rIocxnpU0liKTHa+MW+T0XH7gZSCKU5cgd/kc=;
        b=WkVOrbWfLPgu17uk/Ku79CC3yYuYHj4yMuR9m1nLR9hM6+ZXxIZZtk6OAyBxCM0vEO
         FxDEhdaS3zxA9Qfpz/H+zJgH5hxjFV3aAN39cOuzMadTsf8OGsmuMcfSFwWjPN2+KNZZ
         UOV3EJXpuNYmRsUPqysyBUNy/pkY0GP7MfcjX4fFRtushv37esnxHUd1RAGeiStL7CM5
         RfL3lVsBuwX98AWh9Zgmg6SVYP8F3J7taf2lVyI6q75gu01tpLE9fbsyAr6v6bQavPMP
         bZM5Pu4oDtfhq29Nglqs66lU5zQRtvu9R8vTFtVoR/LqpWgLzEyXTn+JpBzug3XeKBKh
         WohA==
X-Forwarded-Encrypted: i=1; AJvYcCVI9iKAmZH8yXhpyTXaPGekey/s8omZuMBRil+lFwZjcJXJ8ZpS/D1nwejr9EUyMqdliY8+1q651Smz2eIoIeJ9KPk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTjrK9xncxr9BebE06et1dE8pqEI92JE+IWfiWEYhN4GkFgp7i
	lqiS2KFliI3BX7Yz1pdvNnoaTWoquMtr7DwJpJIqSuYXqgw2CUOIQuC8mGA3nZbURgrT24tdLxP
	HEqDpp6NZjcYxU7E/kagFfR/yFn9+5xRTvdxNreA=
X-Gm-Gg: ASbGnctaVAOCHIdLtz6er4c0D+A4Tn6nxK6XZ/naqd/jNxtG9STwLA8B8QS13ZHXFz/
	BjL319tswqA6rFTOibXIG47JEjguJ9whd9Ts7aHvCZCeWHFNI2PP4PpW2kJCFCPIcm8WPb3vFrq
	ylL28YZeZzSg5s6tdg/RaQ0ux81mwS66Ap/OX7sURPd6l67BImYK1Q
X-Google-Smtp-Source: AGHT+IEAWcK1qqxmbbpjUxcWWLvMHYioptjT3u8mCchO34UOLFGsOlq3wzxgJ+PyFO5ArHaTB6qk6OOvOWrw4Bnx99I=
X-Received: by 2002:a05:690c:3610:b0:714:232:df38 with SMTP id
 00721157ae682-71668e1a244mr5297177b3.25.1751583754559; Thu, 03 Jul 2025
 16:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250630172224.18568-1-wen.yang@linux.dev>
In-Reply-To: <20250630172224.18568-1-wen.yang@linux.dev>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jul 2025 16:02:08 -0700
X-Gm-Features: Ac12FXypoFsMZ1193wvCPEEPy1Ac3lKpif3XDUKy8Uc7miF52q8AhLt-BJvZ8uI
Message-ID: <CAMKF1spCrejyVWU0Te5TiReBKVgkQj7_QKtA-zOAPyPy0aRDBA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pstack: add recipe
To: wen.yang@linux.dev
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 23:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219894

It fails to build with clang -
https://errors.yoctoproject.org/Errors/Details/868022/

On Mon, Jun 30, 2025 at 10:40=E2=80=AFAM Wen Yang via lists.openembedded.or=
g
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
> Mute This Topic: https://lists.openembedded.org/mt/113912625/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

