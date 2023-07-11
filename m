Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B45EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 07:29:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2308.1689060562289895698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 00:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FYpC/ePV;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-314417861b9so5412131f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 00:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689060561; x=1691652561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c4tbFHcqMBWU6/+uNgwqXtl12N3p4yxb6MmWGBYK7Gg=;
        b=FYpC/ePVfvaCHUxh2cjIsdPJW1+nw3osUE/1hJmmiRvoXvdCekgGF9Xsjh60dSJUp1
         IDUlpJa470n75zVLFr35NcZNtfjsoorcYJ6iFaCAEoa+S47PloqGkcsFYtzHeN84Ietp
         +/VVCL5zgoNq/hLZm9RbrSa9xP2r0UVExFuiYSPPXBl+05fp/E3RQFb/WXOk5v3Xae16
         ZSXlbuFWAK4U/S3RFhmhg5g31/gmEAriy3TB4qltfSf5uVbdwF6o2NfQ4+vzWExZckQh
         43GzxY6V/UqRmNLSfur2olp4N4rH1EeW/L+x38BcLwsaHNi7PnYBCW71OmpywAe4tKc5
         hKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689060561; x=1691652561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4tbFHcqMBWU6/+uNgwqXtl12N3p4yxb6MmWGBYK7Gg=;
        b=Kay7VXzkrYjvM4xbL4ZmcTqzopA2vlHFjAnXhrLr3w3XZcfFBPkEaIpl2+ls+2YFp6
         o8uMKr7YTJtM/2P0c0x9X0+GS1Zx3NETyQyoKzQRkWmtxCbDd1voa0aZGwKvRfrhjeOL
         Cy04RYtqsQpmyt54dPwKBSawjK20lze7wzdQJg4Hr/UlQe/qUXNr99hd/I4ZykV76TWo
         IeU98eawHuSvzRR5sQ6fSOdk9aPGcMV7lJtkF0pdOOxxMtbvc/IRogA6kXCReh2H7WBK
         CwbHHHHjHCEm7ttXgHiwwhIvC6GxavZUP+QYjQyCvsRkZKR5zcRHWTIv525FPaT74yDC
         Ks0Q==
X-Gm-Message-State: ABy/qLZ+Gpo8NwVs9e05/ZJ9YVLQt88Hw3uuogOFZ73iavlV4of+EDNx
	21Ah+ZgmwAxLudQZmF+vneVpZ8dREV1ONWOkiLs=
X-Google-Smtp-Source: APBJJlHR2jrBBkzhZ2egO3X2Y7o6FFWwFhCfZzw4QoDlloj9r7gIzgROi1gmeDWwxHpx6eJAmFTgjoWBaTeIc7CQK1Y=
X-Received: by 2002:adf:fe01:0:b0:314:23b:dc56 with SMTP id
 n1-20020adffe01000000b00314023bdc56mr10691213wrr.71.1689060560339; Tue, 11
 Jul 2023 00:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230710171504.867425-1-alexander.sverdlin@siemens.com>
 <CANPvuRkp4vJhTDADs93mBQG+keCsKBfz+N5E0tYr+TDYHBjciA@mail.gmail.com> <dc8e26c1c115aca3fdc23158c36daa201498b988.camel@siemens.com>
In-Reply-To: <dc8e26c1c115aca3fdc23158c36daa201498b988.camel@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jul 2023 09:29:09 +0200
Message-ID: <CA+chaQcFSRD8jw8fcwECe=8jd8Jb-s37KXqBW3EbxdCohBP39w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] rust-llvm: backport a fix for
 build with gcc-13
To: alexander.sverdlin@siemens.com
Cc: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b40a050600310e16"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 07:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184118

--000000000000b40a050600310e16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: the uninative with gcc-13 means only that it is compatible with
gcc-13 on host, it doesn't include gcc-native (which doesn't exist).

I'm using already newer rust with kirkstone, so I cannot confirm this issue
with gcc-13 on host, but I'm not so surprised if it wasn't caught on AB yet=
.

Regards,

On Tue, Jul 11, 2023 at 9:05=E2=80=AFAM A. Sverdlin via lists.openembedded.=
org
<alexander.sverdlin=3Dsiemens.com@lists.openembedded.org> wrote:

> Hello Jose,
>
> On Mon, 2023-07-10 at 23:58 +0100, Jose Quaresma wrote:
> > Hi Alexander,
> >
> > The uninative release with the gcc 13 was released a few weeks ago,
> > what is the reason for this issue not being found on the autobuild when
> using the uninative?
>
> I'm not sure why it wasn't found by (and what actually is being meant as)
> autobuild, but the issue is real:
>
> DEBUG: Executing shell function do_compile
> NOTE: VERBOSE=3D1 cmake --build
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/build --target all -=
-
> [1/2283] .../tmp/hosttools/g++ -DGTEST_HAS_RTTI=3D0 -D_GNU_SOURCE
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-
> r0/build/utils/TableGen
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/s=
rc/llvm-project/llvm/utils/TableGen
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-
> r0/build/include
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/s=
rc/llvm-project/llvm/include
> -isystem.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/recipe-sysro=
ot-
> native/usr/include -O2 -pipe -fPIC -fno-semantic-interposition
> -fvisibility-inlines-hidden -Werror=3Ddate-time -Wall -Wextra
> -Wno-unused-parameter -Wwrite-strings -Wcast-qual -Wno-missing-field-
> initializers -pedantic -Wno-long-long -Wimplicit-fallthrough
> -Wno-maybe-uninitialized -Wno-class-memaccess -Wno-redundant-move
> -Wno-pessimizing-move -Wno-noexcept-type -Wdelete-non-virtual-dtor -
> Wsuggest-override -Wno-comment -Wmisleading-indentation
> -fdiagnostics-color -ffunction-sections -fdata-sections -DNDEBUG
> -fno-exceptions -fno-rtti -std=3Dc++14 -MD -MT utils/TableGen/CMakeFiles/=
llvm-
> tblgen.dir/Attributes.cpp.o -MF
> utils/TableGen/CMakeFiles/llvm-tblgen.dir/Attributes.cpp.o.d -o
> utils/TableGen/CMakeFiles/llvm-tblgen.dir/Attributes.cpp.o -c
> .../tmp/work/x86_64-linux/rust-llvm-
>
> native/1.59.0-r0/rustc-1.59.0-src/src/llvm-project/llvm/utils/TableGen/At=
tributes.cpp
> [2/2283] .../tmp/hosttools/g++ -DGTEST_HAS_RTTI=3D0 -D_GNU_SOURCE
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-
> r0/build/lib/Support
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/s=
rc/llvm-project/llvm/lib/Support
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/build/include -
> I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/sr=
c/llvm-project/llvm/include
> -isystem.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/recipe-sysro=
ot-native/usr/include
> -O2
> -pipe -fPIC -fno-semantic-interposition -fvisibility-inlines-hidden
> -Werror=3Ddate-time -Wall -Wextra -Wno-unused-parameter -Wwrite-strings
> -Wcast-qual -Wno-missing-field-initializers -pedantic -Wno-
> long-long -Wimplicit-fallthrough -Wno-maybe-uninitialized
> -Wno-class-memaccess -Wno-redundant-move -Wno-pessimizing-move
> -Wno-noexcept-type -Wdelete-non-virtual-dtor -Wsuggest-override
> -Wno-comment -
> Wmisleading-indentation -fdiagnostics-color -ffunction-sections
> -fdata-sections -DNDEBUG -std=3Dc++14  -fno-exceptions -fno-rtti -MD -MT
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o -MF
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o.d -o
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o -c
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-
> project/llvm/lib/Support/Signals.cpp
> FAILED: lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
> .../tmp/hosttools/g++ -DGTEST_HAS_RTTI=3D0 -D_GNU_SOURCE
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/build/lib/Support =
-
> I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/sr=
c/llvm-project/llvm/lib/Support
> -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/build/include
> -I.../tmp/work/x86_64-
> linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/llvm-project/llvm/i=
nclude
> -isystem.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/recipe-sysro=
ot-native/usr/include
> -O2 -pipe -fPIC -fno-
> semantic-interposition -fvisibility-inlines-hidden -Werror=3Ddate-time -W=
all
> -Wextra -Wno-unused-parameter -Wwrite-strings -Wcast-qual
> -Wno-missing-field-initializers -pedantic -Wno-long-long -
> Wimplicit-fallthrough -Wno-maybe-uninitialized -Wno-class-memaccess
> -Wno-redundant-move -Wno-pessimizing-move -Wno-noexcept-type
> -Wdelete-non-virtual-dtor -Wsuggest-override -Wno-comment -Wmisleading-
> indentation -fdiagnostics-color -ffunction-sections -fdata-sections
> -DNDEBUG -std=3Dc++14  -fno-exceptions -fno-rtti -MD -MT
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o -MF
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o.d -o
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o -c
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-
> project/llvm/lib/Support/Signals.cpp
> In file included from
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-project/llvm/lib/Support/Signals.cpp:14:
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-project/llvm/include/llvm/Support/Signals.h:119:8:
> error: variable or field =E2=80=98CleanupOnSignal=E2=80=99 declared void
>   119 |   void CleanupOnSignal(uintptr_t Context);
>       |        ^~~~~~~~~~~~~~~
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-project/llvm/include/llvm/Support/Signals.h:119:24:
> error: =E2=80=98uintptr_t=E2=80=99 was not declared in this scope
>   119 |   void CleanupOnSignal(uintptr_t Context);
>       |                        ^~~~~~~~~
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-project/llvm/include/llvm/Support/Signals.h:18:1:
> note: =E2=80=98uintptr_t=E2=80=99 is defined in header =E2=80=98<cstdint>=
=E2=80=99; did you forget to
> =E2=80=98#include <cstdint>=E2=80=99?
>    17 | #include <string>
>   +++ |+#include <cstdint>
>    18 |
> In file included from
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-project/llvm/lib/Support/Signals.cpp:251:
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src=
/llvm-project/llvm/lib/Support/Unix/Signals.inc:348:44:
> error: =E2=80=98void llvm::sys::CleanupOnSignal(uintptr_t)=E2=80=99 shoul=
d have been
> declared inside =E2=80=98llvm::sys=E2=80=99
>   348 | void sys::CleanupOnSignal(uintptr_t Context) {
>       |                                            ^
>
> ...
>
> ninja: build stopped: subcommand failed.
> WARNING:
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/temp/run.do_compile.=
556945:162
> exit 1 from 'eval ${DESTDIR:+DESTDIR=3D${DESTDIR} }VERBOSE=3D1 cmake --bu=
ild
> '.../tmp/work/x86_64-linux/rust-
> llvm-native/1.59.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
> WARNING: Backtrace (BB generated script):
>         #1: cmake_runcmake_build,
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/temp/run.do_compile.=
556945,
> line 162
>         #2: cmake_do_compile,
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/temp/run.do_compile.=
556945,
> line 156
>         #3: do_compile,
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/temp/run.do_compile.=
556945,
> line 151
>         #4: main,
> .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/temp/run.do_compile.=
556945,
> line 175
>
>
> > With the clang toolchain this issue [1] comes right after the uninative
> with gcc-13 was released.
> > [1] https://github.com/kraj/meta-clang/pull/816
> >
> > Jose
> >
> > A. Sverdlin via lists.openembedded.org <alexander.sverdlin=3D
> siemens.com@lists.openembedded.org> escreveu no dia segunda, 10/07/2023
> =C3=A0(s) 18:15:
> > > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > >
> > > * needed for rust-llvm-native on hosts with gcc-13
> > >
> > > Based on commit 3382759cb6c5 ("llvm: backport a fix for build with
> gcc-13")
> > >
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > > ---
> > > Changelog:
> > > v2: rebase onto 2022-04.11-kirkstone
> > >
> > >  meta/recipes-devtools/rust/rust-llvm.inc      |  4 ++-
> > >  ...-missing-cstdint-header-to-Signals.h.patch | 32 +++++++++++++++++=
++
> > >  2 files changed, 35 insertions(+), 1 deletion(-)
> > >  create mode 100644
> meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-hea=
der-to-Signals.h.patch
> > >
> > > diff --git a/meta/recipes-devtools/rust/rust-llvm.inc
> b/meta/recipes-devtools/rust/rust-llvm.inc
> > > index 5c2ccdac9a..e645e7a7ac 100644
> > > --- a/meta/recipes-devtools/rust/rust-llvm.inc
> > > +++ b/meta/recipes-devtools/rust/rust-llvm.inc
> > > @@ -3,7 +3,9 @@ LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
> > >  HOMEPAGE =3D "http://www.rust-lang.org"
> > >
> > >  SRC_URI +=3D
> "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=3D2 \
> > > -
> file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;st=
riplevel=3D2"
> > > +
> file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;st=
riplevel=3D2
> \
> > > +
> file://0003-Support-Add-missing-cstdint-header-to-Signals.h.patch;striple=
vel=3D2
> \
> > > +"
> > >
> > >  S =3D "${RUSTSRC}/src/llvm-project/llvm"
> > >
> > > diff --git
> a/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-h=
eader-to-Signals.h.patch
> b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-h=
eader-to-
> > > Signals.h.patch
> > > new file mode 100644
> > > index 0000000000..6ed23aa9c5
> > > --- /dev/null
> > > +++
> b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-h=
eader-to-Signals.h.patch
> > > @@ -0,0 +1,32 @@
> > > +From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:00 20=
01
> > > +From: Sergei Trofimovich <slyich@gmail.com>
> > > +Date: Mon, 23 May 2022 08:03:23 +0100
> > > +Subject: [PATCH] [Support] Add missing <cstdint> header to Signals.h
> > > +
> > > +Without the change llvm build fails on this week's gcc-13 snapshot a=
s:
> > > +
> > > +    [  0%] Building CXX object
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
> > > +    In file included from llvm/lib/Support/Signals.cpp:14:
> > > +    llvm/include/llvm/Support/Signals.h:119:8: error: variable or
> field 'CleanupOnSignal' declared void
> > > +      119 |   void CleanupOnSignal(uintptr_t Context);
> > > +          |        ^~~~~~~~~~~~~~~
> > > +
> > > +Upstream-Status: Backport [llvmorg-15.0.0
> ff1681ddb303223973653f7f5f3f3435b48a1983]
> > > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > +Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > > +---
> > > + llvm/include/llvm/Support/Signals.h | 1 +
> > > + 1 file changed, 1 insertion(+)
> > > +
> > > +diff --git a/llvm/include/llvm/Support/Signals.h
> b/llvm/include/llvm/Support/Signals.h
> > > +index 44f5a750ff5c..937e0572d4a7 100644
> > > +--- a/llvm/include/llvm/Support/Signals.h
> > > ++++ b/llvm/include/llvm/Support/Signals.h
> > > +@@ -14,6 +14,7 @@
> > > + #ifndef LLVM_SUPPORT_SIGNALS_H
> > > + #define LLVM_SUPPORT_SIGNALS_H
> > > +
> > > ++#include <cstdint>
> > > + #include <string>
> > > +
> > > + namespace llvm {
>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184117):
> https://lists.openembedded.org/g/openembedded-core/message/184117
> Mute This Topic: https://lists.openembedded.org/mt/100062248/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b40a050600310e16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: the uninative with gcc-13 means only that it is comp=
atible with gcc-13 on host, it doesn&#39;t include gcc-native (which doesn&=
#39;t exist).<div><br></div><div>I&#39;m using already newer rust with kirk=
stone, so I cannot confirm this issue with gcc-13 on host, but I&#39;m not =
so surprised if it wasn&#39;t caught on AB yet.</div><div><br></div><div>Re=
gards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Jul 11, 2023 at 9:05=E2=80=AFAM A. Sverdlin via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alexander=
.sverdlin=3D<a href=3D"mailto:siemens.com@lists.openembedded.org">siemens.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hello Jose,<br>
<br>
On Mon, 2023-07-10 at 23:58 +0100, Jose Quaresma wrote:<br>
&gt; Hi Alexander,<br>
&gt; <br>
&gt; The uninative release with the gcc 13=C2=A0was released a few weeks ag=
o,<br>
&gt; what is the reason for this issue not being found on the autobuild whe=
n using the uninative?<br>
<br>
I&#39;m not sure why it wasn&#39;t found by (and what actually is being mea=
nt as) autobuild, but the issue is real:<br>
<br>
DEBUG: Executing shell function do_compile<br>
NOTE: VERBOSE=3D1 cmake --build .../tmp/work/x86_64-linux/rust-llvm-native/=
1.59.0-r0/build --target all --<br>
[1/2283] .../tmp/hosttools/g++ -DGTEST_HAS_RTTI=3D0 -D_GNU_SOURCE -D__STDC_=
CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I.../tmp/work=
/x86_64-linux/rust-llvm-native/1.59.0-<br>
r0/build/utils/TableGen -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0=
-r0/rustc-1.59.0-src/src/llvm-project/llvm/utils/TableGen -I.../tmp/work/x8=
6_64-linux/rust-llvm-native/1.59.0-<br>
r0/build/include -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rus=
tc-1.59.0-src/src/llvm-project/llvm/include -isystem.../tmp/work/x86_64-lin=
ux/rust-llvm-native/1.59.0-r0/recipe-sysroot-<br>
native/usr/include -O2 -pipe -fPIC -fno-semantic-interposition -fvisibility=
-inlines-hidden -Werror=3Ddate-time -Wall -Wextra -Wno-unused-parameter -Ww=
rite-strings -Wcast-qual -Wno-missing-field-<br>
initializers -pedantic -Wno-long-long -Wimplicit-fallthrough -Wno-maybe-uni=
nitialized -Wno-class-memaccess -Wno-redundant-move -Wno-pessimizing-move -=
Wno-noexcept-type -Wdelete-non-virtual-dtor -<br>
Wsuggest-override -Wno-comment -Wmisleading-indentation -fdiagnostics-color=
 -ffunction-sections -fdata-sections -DNDEBUG=C2=A0 -fno-exceptions -fno-rt=
ti -std=3Dc++14 -MD -MT utils/TableGen/CMakeFiles/llvm-<br>
tblgen.dir/Attributes.cpp.o -MF utils/TableGen/CMakeFiles/llvm-tblgen.dir/A=
ttributes.cpp.o.d -o utils/TableGen/CMakeFiles/llvm-tblgen.dir/Attributes.c=
pp.o -c .../tmp/work/x86_64-linux/rust-llvm-<br>
native/1.59.0-r0/rustc-1.59.0-src/src/llvm-project/llvm/utils/TableGen/Attr=
ibutes.cpp<br>
[2/2283] .../tmp/hosttools/g++ -DGTEST_HAS_RTTI=3D0 -D_GNU_SOURCE -D__STDC_=
CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I.../tmp/work=
/x86_64-linux/rust-llvm-native/1.59.0-<br>
r0/build/lib/Support -I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0=
/rustc-1.59.0-src/src/llvm-project/llvm/lib/Support -I.../tmp/work/x86_64-l=
inux/rust-llvm-native/1.59.0-r0/build/include -<br>
I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/=
llvm-project/llvm/include -isystem.../tmp/work/x86_64-linux/rust-llvm-nativ=
e/1.59.0-r0/recipe-sysroot-native/usr/include -O2<br>
-pipe -fPIC -fno-semantic-interposition -fvisibility-inlines-hidden -Werror=
=3Ddate-time -Wall -Wextra -Wno-unused-parameter -Wwrite-strings -Wcast-qua=
l -Wno-missing-field-initializers -pedantic -Wno-<br>
long-long -Wimplicit-fallthrough -Wno-maybe-uninitialized -Wno-class-memacc=
ess -Wno-redundant-move -Wno-pessimizing-move -Wno-noexcept-type -Wdelete-n=
on-virtual-dtor -Wsuggest-override -Wno-comment -<br>
Wmisleading-indentation -fdiagnostics-color -ffunction-sections -fdata-sect=
ions -DNDEBUG -std=3Dc++14=C2=A0 -fno-exceptions -fno-rtti -MD -MT lib/Supp=
ort/CMakeFiles/LLVMSupport.dir/Signals.cpp.o -MF<br>
lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o.d -o lib/Support/CMake=
Files/LLVMSupport.dir/Signals.cpp.o -c .../tmp/work/x86_64-linux/rust-llvm-=
native/1.59.0-r0/rustc-1.59.0-src/src/llvm-<br>
project/llvm/lib/Support/Signals.cpp<br>
FAILED: lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o <br>
.../tmp/hosttools/g++ -DGTEST_HAS_RTTI=3D0 -D_GNU_SOURCE -D__STDC_CONSTANT_=
MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I.../tmp/work/x86_64-l=
inux/rust-llvm-native/1.59.0-r0/build/lib/Support -<br>
I.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/=
llvm-project/llvm/lib/Support -I.../tmp/work/x86_64-linux/rust-llvm-native/=
1.59.0-r0/build/include -I.../tmp/work/x86_64-<br>
linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/llvm-project/llvm/inc=
lude -isystem.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/recipe-sy=
sroot-native/usr/include -O2 -pipe -fPIC -fno-<br>
semantic-interposition -fvisibility-inlines-hidden -Werror=3Ddate-time -Wal=
l -Wextra -Wno-unused-parameter -Wwrite-strings -Wcast-qual -Wno-missing-fi=
eld-initializers -pedantic -Wno-long-long -<br>
Wimplicit-fallthrough -Wno-maybe-uninitialized -Wno-class-memaccess -Wno-re=
dundant-move -Wno-pessimizing-move -Wno-noexcept-type -Wdelete-non-virtual-=
dtor -Wsuggest-override -Wno-comment -Wmisleading-<br>
indentation -fdiagnostics-color -ffunction-sections -fdata-sections -DNDEBU=
G -std=3Dc++14=C2=A0 -fno-exceptions -fno-rtti -MD -MT lib/Support/CMakeFil=
es/LLVMSupport.dir/Signals.cpp.o -MF<br>
lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o.d -o lib/Support/CMake=
Files/LLVMSupport.dir/Signals.cpp.o -c .../tmp/work/x86_64-linux/rust-llvm-=
native/1.59.0-r0/rustc-1.59.0-src/src/llvm-<br>
project/llvm/lib/Support/Signals.cpp<br>
In file included from .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/=
rustc-1.59.0-src/src/llvm-project/llvm/lib/Support/Signals.cpp:14:<br>
.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/l=
lvm-project/llvm/include/llvm/Support/Signals.h:119:8: error: variable or f=
ield =E2=80=98CleanupOnSignal=E2=80=99 declared void<br>
=C2=A0 119 |=C2=A0 =C2=A0void CleanupOnSignal(uintptr_t Context);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~<br>
.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/l=
lvm-project/llvm/include/llvm/Support/Signals.h:119:24: error: =E2=80=98uin=
tptr_t=E2=80=99 was not declared in this scope<br>
=C2=A0 119 |=C2=A0 =C2=A0void CleanupOnSignal(uintptr_t Context);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~<br>
.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/l=
lvm-project/llvm/include/llvm/Support/Signals.h:18:1: note: =E2=80=98uintpt=
r_t=E2=80=99 is defined in header =E2=80=98&lt;cstdint&gt;=E2=80=99; did yo=
u forget to<br>
=E2=80=98#include &lt;cstdint&gt;=E2=80=99?<br>
=C2=A0 =C2=A017 | #include &lt;string&gt;<br>
=C2=A0 +++ |+#include &lt;cstdint&gt;<br>
=C2=A0 =C2=A018 | <br>
In file included from .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/=
rustc-1.59.0-src/src/llvm-project/llvm/lib/Support/Signals.cpp:251:<br>
.../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/rustc-1.59.0-src/src/l=
lvm-project/llvm/lib/Support/Unix/Signals.inc:348:44: error: =E2=80=98void =
llvm::sys::CleanupOnSignal(uintptr_t)=E2=80=99 should have been<br>
declared inside =E2=80=98llvm::sys=E2=80=99<br>
=C2=A0 348 | void sys::CleanupOnSignal(uintptr_t Context) {<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
<br>
...<br>
<br>
ninja: build stopped: subcommand failed.<br>
WARNING: .../tmp/work/x86_64-linux/rust-llvm-native/1.59.0-r0/temp/run.do_c=
ompile.556945:162 exit 1 from &#39;eval ${DESTDIR:+DESTDIR=3D${DESTDIR} }VE=
RBOSE=3D1 cmake --build &#39;.../tmp/work/x86_64-linux/rust-<br>
llvm-native/1.59.0-r0/build&#39; &quot;$@&quot; -- ${EXTRA_OECMAKE_BUILD}&#=
39;<br>
WARNING: Backtrace (BB generated script): <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #1: cmake_runcmake_build, .../tmp/work/x86_64-l=
inux/rust-llvm-native/1.59.0-r0/temp/run.do_compile.556945, line 162<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #2: cmake_do_compile, .../tmp/work/x86_64-linux=
/rust-llvm-native/1.59.0-r0/temp/run.do_compile.556945, line 156<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #3: do_compile, .../tmp/work/x86_64-linux/rust-=
llvm-native/1.59.0-r0/temp/run.do_compile.556945, line 151<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #4: main, .../tmp/work/x86_64-linux/rust-llvm-n=
ative/1.59.0-r0/temp/run.do_compile.556945, line 175<br>
<br>
<br>
&gt; With the clang=C2=A0toolchain this issue [1] comes right=C2=A0after th=
e uninative with gcc-13 was released.<br>
&gt; [1] <a href=3D"https://github.com/kraj/meta-clang/pull/816" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/kraj/meta-clang/pull/816</a><=
br>
&gt; <br>
&gt; Jose<br>
&gt; <br>
&gt; A. Sverdlin via <a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">lists.openembedded.org</a> &lt;alexander.sverdlin=
=3D<a href=3D"mailto:siemens.com@lists.openembedded.org" target=3D"_blank">=
siemens.com@lists.openembedded.org</a>&gt; escreveu no dia segunda, 10/07/2=
023 =C3=A0(s) 18:15:<br>
&gt; &gt; From: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.sverdlin=
@siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; * needed for rust-llvm-native on hosts with gcc-13<br>
&gt; &gt; <br>
&gt; &gt; Based on commit 3382759cb6c5 (&quot;llvm: backport a fix for buil=
d with gcc-13&quot;)<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexander=
.sverdlin@siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>=
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Changelog:<br>
&gt; &gt; v2: rebase onto 2022-04.11-kirkstone<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0meta/recipes-devtools/rust/rust-llvm.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 ++-<br>
&gt; &gt; =C2=A0...-missing-cstdint-header-to-Signals.h.patch | 32 ++++++++=
+++++++++++<br>
&gt; &gt; =C2=A02 files changed, 35 insertions(+), 1 deletion(-)<br>
&gt; &gt; =C2=A0create mode 100644 meta/recipes-devtools/rust/rust-llvm/000=
3-Support-Add-missing-cstdint-header-to-Signals.h.patch<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/reci=
pes-devtools/rust/rust-llvm.inc<br>
&gt; &gt; index 5c2ccdac9a..e645e7a7ac 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/rust/rust-llvm.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/rust/rust-llvm.inc<br>
&gt; &gt; @@ -3,7 +3,9 @@ LICENSE ?=3D &quot;Apache-2.0-with-LLVM-exception=
&quot;<br>
&gt; &gt; =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.rust-lang.org" rel=
=3D"noreferrer" target=3D"_blank">http://www.rust-lang.org</a>&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0SRC_URI +=3D &quot;file://0002-llvm-allow-env-override-of-e=
xe-path.patch;striplevel=3D2 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-AsmMatcher=
Emitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=3D2&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-AsmMatcher=
Emitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=3D2=C2=A0 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Support-Ad=
d-missing-cstdint-header-to-Signals.h.patch;striplevel=3D2=C2=A0 \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0S =3D &quot;${RUSTSRC}/src/llvm-project/llvm&quot;<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-llvm/0003-Support-Ad=
d-missing-cstdint-header-to-Signals.h.patch b/meta/recipes-devtools/rust/ru=
st-llvm/0003-Support-Add-missing-cstdint-header-to-<br>
&gt; &gt; Signals.h.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..6ed23aa9c5<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missi=
ng-cstdint-header-to-Signals.h.patch<br>
&gt; &gt; @@ -0,0 +1,32 @@<br>
&gt; &gt; +From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Sergei Trofimovich &lt;<a href=3D"mailto:slyich@gmail.com"=
 target=3D"_blank">slyich@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 23 May 2022 08:03:23 +0100<br>
&gt; &gt; +Subject: [PATCH] [Support] Add missing &lt;cstdint&gt; header to=
 Signals.h<br>
&gt; &gt; +<br>
&gt; &gt; +Without the change llvm build fails on this week&#39;s gcc-13 sn=
apshot as:<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 [=C2=A0 0%] Building CXX object lib/Support/CMakeF=
iles/LLVMSupport.dir/Signals.cpp.o<br>
&gt; &gt; +=C2=A0 =C2=A0 In file included from llvm/lib/Support/Signals.cpp=
:14:<br>
&gt; &gt; +=C2=A0 =C2=A0 llvm/include/llvm/Support/Signals.h:119:8: error: =
variable or field &#39;CleanupOnSignal&#39; declared void<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 119 |=C2=A0 =C2=A0void CleanupOnSignal(uint=
ptr_t Context);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
^~~~~~~~~~~~~~~<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [llvmorg-15.0.0 ff1681ddb303223973653f=
7f5f3f3435b48a1983]<br>
&gt; &gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@g=
mail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; +Signed-off-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexande=
r.sverdlin@siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a=
>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + llvm/include/llvm/Support/Signals.h | 1 +<br>
&gt; &gt; + 1 file changed, 1 insertion(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/llvm/include/llvm/Support/Signals.h b/llvm/include/=
llvm/Support/Signals.h<br>
&gt; &gt; +index 44f5a750ff5c..937e0572d4a7 100644<br>
&gt; &gt; +--- a/llvm/include/llvm/Support/Signals.h<br>
&gt; &gt; ++++ b/llvm/include/llvm/Support/Signals.h<br>
&gt; &gt; +@@ -14,6 +14,7 @@<br>
&gt; &gt; + #ifndef LLVM_SUPPORT_SIGNALS_H<br>
&gt; &gt; + #define LLVM_SUPPORT_SIGNALS_H<br>
&gt; &gt; + <br>
&gt; &gt; ++#include &lt;cstdint&gt;<br>
&gt; &gt; + #include &lt;string&gt;<br>
&gt; &gt; + <br>
&gt; &gt; + namespace llvm {<br>
<br>
-- <br>
Alexander Sverdlin<br>
Siemens AG<br>
<a href=3D"http://www.siemens.com" rel=3D"noreferrer" target=3D"_blank">www=
.siemens.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184117): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184117" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184117</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100062248/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100062248/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b40a050600310e16--

