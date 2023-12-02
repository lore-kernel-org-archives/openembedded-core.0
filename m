Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344FEC4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 00:11:23 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.8325.1701475881055882931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 16:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R7Jb8BWa;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d8029dae41so719662a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 16:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701475880; x=1702080680; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4CUL7+2fMSnk6MCfLkwmrbyHcTsWd4gHDnHrJ53KuQ=;
        b=R7Jb8BWaI/hwAp2Le76riEcWb6uEmPyuJKMF5UMJJ2LpaJ7txtNXuecShbVI5RJd65
         gI7vyMUJrA4+fJ+GBiYky9Mo/MQ+f8KfDZhkjk0lMtKhV39pnjAZzgbx0UYJpk78suA8
         ius7HWfqi0TD2Gh7fD/FgAJkKZPXbbQkBOVWOegKKpQgzuwz6HVsaM/mEDI2Wr2uRb6I
         5nPF5ZkG5AD/xPIkhnXjrro6Z/Sske1e+2qNRvLlXhPcik9Byio53tae2BbsrexO0+ri
         Gj2/aaHemGlwjagIlxsmP01Zg84Q+6B60LYYUMOc1OtbQWtSdnW0LdNLV6Zj0RX9ePGU
         X55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701475880; x=1702080680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4CUL7+2fMSnk6MCfLkwmrbyHcTsWd4gHDnHrJ53KuQ=;
        b=CdHyBaJNozKeEoXwJCwsDH0IDJRFH0RY6OSe82kVN2xRQBdigi2+y/vnxS1FeAAfEx
         Cu80/1OXF0kZn9JlCuiuVJHqR83vFjVb1CbDZZGUSDNxrt2hk0dj7H4+Lh08cGrTI0c6
         v+fXlaWEyAWzvnvz9wrSrFP+s4YiTVF5OmpTXgPHE4I5Qba9ZxcTcjJKQmejDhSHXzk8
         qcZYc7c/T3A2ep1u9pP945eIDfPYRQi0ToKMzWXp7VqnJR+X/pzUcB0TlARxTtBScC6i
         HlMGS827BXiP60wXkibBFZokLeTvABDt7vk5KLrgaVphKNZwBwcEjxihe2vhYcWBhNrZ
         PkhA==
X-Gm-Message-State: AOJu0YwEI3dGD9rfoWX9ovSqYGDe6QyIV+JHpTxQxsk7Dt7Dxw3aZGpp
	fNzxbOuYX97UzMOqip4oMApCNVMiyWTtNsfi0kwo1Q+v
X-Google-Smtp-Source: AGHT+IEFsiGNtHU7D/vfG95sB5GQsou4iQdS01W3bhMRPQkQgBqTlQgMqNxNQBEDNZ89TKM+QE8ODmjnvamRHgoREZ8=
X-Received: by 2002:a05:6870:7020:b0:1fa:e785:f491 with SMTP id
 u32-20020a056870702000b001fae785f491mr528505oae.32.1701475879355; Fri, 01 Dec
 2023 16:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20231201183356.311137-1-raj.khem@gmail.com> <20231201183356.311137-6-raj.khem@gmail.com>
 <179CD8EAC4F00896.18076@lists.openembedded.org> <2023120123550896838280@mail.local>
 <CAMKF1spbYvCj-XkJWmboM_11wBdRdMXjWF_bjr_sUDboLKfY9A@mail.gmail.com>
In-Reply-To: <CAMKF1spbYvCj-XkJWmboM_11wBdRdMXjWF_bjr_sUDboLKfY9A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2023 16:10:53 -0800
Message-ID: <CAMKF1spvB6aiyAzzUgQRm5ALDSVi1YYFHyeeqEv7MK5Scae=bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] llvm: Upgrade to 17.0.6
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191697

On Fri, Dec 1, 2023 at 4:03=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Dec 1, 2023 at 3:55=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 02/12/2023 00:27:39+0100, Alexandre Belloni via lists.openembedded.o=
rg wrote:
> > > This breaks:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/71=
90/steps/11/logs/stdio
> >
> > Actually, this one reproduced without the patch
> >
>
> how is llvm used by rust ?

The problem was in the rust patch for x32, I have sent a v2 please use
that patch with rest of the series.

>
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/96=
0/steps/12/logs/stdio
> >
> > But not this one.
> >
> > >
> > > On 01/12/2023 10:33:54-0800, Khem Raj wrote:
> > > > Bring in these changes
> > > >
> > > > * 6009708b4367 Revert "[runtimes] Add missing test dependencies to =
check-all (#72955)"
> > > > * 04caadc61fa2 [Driver] Enable __float128 support on X86 on FreeBSD=
 / NetBSD (#72788)
> > > > * e919a83f96fe eliminate python SyntaxWarnings from check-all outpu=
t.
> > > > * f6c231c15ec8 [clang-format] Fix crashes in AlignArrayOfStructures=
 (#72520)
> > > > * f74f3e6f58d3 [clang] Fix sorting module headers (#73146)
> > > > * 7e30ce9528d9 [JITLink][aarch32] Change writeRegister's return typ=
e to void.
> > > > * 03373fd9cb6c [CMake] Support building shared library for NetBSD
> > > > * 21af3b62b632 workflows/release-binaries: Do a preliminary build t=
o fill ccache (#72576)
> > > > * 201faeca595e Add RV64 constraint to SRLIW (#69416)
> > > > * e957e6dcb29d [runtimes] Add missing test dependencies to check-al=
l (#72955)
> > > > * f8575ff46f89 [clang-format] Fix a bug in aligning comments above =
PPDirective (#72791)
> > > > * a71237b9f67f [clangd] Avoid null result in FindRecordTypeAt()
> > > > * 308c816de5a4 Bump version to 17.0.6
> > > > * 442401f7c0ca remove tests from bad merge
> > > > * 76c7e0e1e2d1 Use the correct namespace for looking up matching op=
erator!=3D (#68922)
> > > > * b5cbb35408a3 [libc++] Use correct size for deallocation of arrays=
 in shared_ptr (#68233)
> > > > * e6de86cb9ef8 Revert "Reland [clang] Canonicalize system headers i=
n dependency file when -canonical-prefixes" (#71697)
> > > > * bb66d8f8f73b [clang][WebAssembly] Link crt1 even in case of -shar=
ed
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-=
devtools/llvm/llvm_git.bb
> > > > index de8d4116868..9a88549260a 100644
> > > > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > > > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > > > @@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target =3D " ncurse=
s-terminfo"
> > > >
> > > >  inherit cmake pkgconfig
> > > >
> > > > -PV =3D "17.0.5"
> > > > +PV =3D "17.0.6"
> > > >
> > > >  MAJOR_VERSION =3D "${@oe.utils.trim_version("${PV}", 1)}"
> > > >
> > > >  LLVM_RELEASE =3D "${PV}"
> > > >
> > > >  BRANCH =3D "release/${MAJOR_VERSION}.x"
> > > > -SRCREV =3D "98bfdac5ce82d1679f8af9a57501471812ab68d7"
> > > > +SRCREV =3D "6009708b4367171ccdbf4b5905cb6a803753fe18"
> > > >  SRC_URI =3D "git://github.com/llvm/llvm-project.git;branch=3D${BRA=
NCH};protocol=3Dhttps \
> > > >             file://0007-llvm-allow-env-override-of-exe-path.patch;s=
triplevel=3D2 \
> > > >             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-n=
ame-as-we.patch;striplevel=3D2 \
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#191693): https://lists.openembedded.org/g/openemb=
edded-core/message/191693
> > > Mute This Topic: https://lists.openembedded.org/mt/102921840/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alexandre.belloni@bootlin.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

