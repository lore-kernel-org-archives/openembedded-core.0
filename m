Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F552FEEF4E
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 14:08:40 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82105.1775570913809108178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 07:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DG8s8kDA;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so5300084e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775570912; cv=none;
        d=google.com; s=arc-20240605;
        b=ej+QJ+BnS1mVpe7Yqtn/QPS8BDNWQ9xocyUgkR2MrD8IsHh5jL7y2GsV3YHk9qFiUJ
         Yolm9P7r6/Xeq62xIrGNqgGA+IlkxgUg0hsRbYgZITZLSuJCGHQjExn4FvEXeUErPa7w
         JA2R2Six9YG9LhnFHHuUmKrHN0otR38obRVkyIi99KpAi41AhL4Z4TJC397r0OacnPfg
         pb/EyNBsyK+P8qjV5hctbminsEWT4LMYcMUJjZDgA465o6B/bryzqCh8T4Mskene/BAD
         AOxzleg7DPWOdwLi2bSNuUPD4bG/0fEhNK8mwCkmd0XuObzPX4r61wrkuNsj/PqPwN0h
         hodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yQIScb8+R+NlfjtFW47cQ1wppEijGJ1u7C39kPmpgCg=;
        fh=eloAb1AYyJr+haIf6vSKENwaav3NPT7KVECbzIbanW8=;
        b=LBC8DGJYSSlwgXadDr4vYvTkninMipw2vLNxM80L4WcYEANfI7bSbOfOoZ9GbSKkwR
         n6yHjhcA2Ap9fxiLBL3q8p4DomIpLWIgllg7pAFrOxt4EOrYCLa9fbJebwgVmNMdWqBX
         y9ARGE+CQ+DRE5/68xdB83r3FBI0s0kxXv8xsL2My6sRt58zOeIK9xJAvT9QPkmarFk5
         ZRKSkgc2OCyZM6OiPKYBgFrHboewVjY8dpOv0SNODeSA3EwOFKzZbIashWIGr2R6tfdu
         1O81vCSnqd0nuRoIQ7rA9j5NnSO8mp2YzmMxyZYGgCCuURUFVljFVoYex6w5sLXAvBZ2
         JiLQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775570912; x=1776175712; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQIScb8+R+NlfjtFW47cQ1wppEijGJ1u7C39kPmpgCg=;
        b=DG8s8kDA+iHErwvskIKkkb001eKlLeeiKQo19ow6Imm22ACMH2mAQGmgqyyrOYxs1x
         iuWfIK4MGbsxFAIziQGHZjtcRdo81XHJ8dpG2Oy2GL49fslBU1LU7PcbO5ts85/za69O
         FS/JPewFYhN0J9ns49YjYAlHNuQW+yUIlHzNiWBccn0f9wkGr7+OSP7Wn5FGpnQDVy7O
         r5mqmCZN22YmLrTmcdvl9MlOJeR+FNQJo+jMXUB/WkxYV8jRqnw8jqknGcGnP6fsRZDU
         rxga9V7iDTQRRU6m3Rud/di9/0P4luU7kq+cbluXR3sW0nzkw9P6LIJ5BloEINB+CkVZ
         u4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570912; x=1776175712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQIScb8+R+NlfjtFW47cQ1wppEijGJ1u7C39kPmpgCg=;
        b=QE93DOdEk7OER0cOFHcgyv7UdS5TdYbwl5vFT/8E+8ckXqt2H8tKVY1xtDivMYEZKS
         QjrtVP+NH01xzELrQxiDpoOS9edA2UuJNjxANPUEVQzu6SDzYHOTtaYmj3agu6DKlDix
         4bTB5k+hJobc2Ptb9j4Kcv6cLrGrBmN3hBLXGLfnSgCtlW1HK1gMIVBVZeI1B9hOSmJy
         xMJ2e8HwRs2h5pTsIBmhTCyvqqHcJhVJvFOHW5LzHStPLvQNh+wxMUVuPKyIGo3kDCq/
         h0U8hI+hMs4oypvQ1fmTXs4SpFLCToeqLsaw+fRuHmsKg8fHMODTSgtJyc3ctogCzQM5
         3m5A==
X-Forwarded-Encrypted: i=1; AJvYcCV5G2tlBaNg8P3/ArrplEehDLxNqrr65Hik8JMDU74cwALNSTwtHU9EZ7rqYleKNOQPhyscxB5Ms0Yug1bBwKDTdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyibh3t7Klfwwc7b600b7RXWNoGeMMwtLkWnMeeEf3nW9im6ZVN
	4KVO0k3QUpCp6i4UBiWr/ealQHyWEMoLeTmibs3n8A8PCl2rmKfYHRW3pYUZv2QCFIvo9dJuMW/
	lGgZeuTJ8eXYetF52ZP0JqM0bhB8es3M=
X-Gm-Gg: AeBDietsdum5LZYQmtq0xhcFibQWmYAvi6IWWnPqAQmHKye+dm6np0eBughklNIEtPA
	XB49JyqMPZyKq25977glfVhcIDiStYgdvDbKbOb6D8FfNoooFERcOOnoVM8C37cEuQ31DJ/q2gk
	3670XzvFs44THEUTWFXIRtpRZ6EwUNobPqaKGdBf6Afd4DzLYfvJRPr9p0qUtNg9GusxLRMGcsX
	C8Et4jD9B45P5Gq0r11rI1GWxpTYWMueN4nF78nwZmmF9xITmWiXpmktKwF3CIUwk8bHse+mcVT
	vbeO0aHYGA==
X-Received: by 2002:a05:6512:6d2:b0:5a1:3e69:b186 with SMTP id
 2adb3069b0e04-5a337560300mr5673353e87.19.1775570911511; Tue, 07 Apr 2026
 07:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com> <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
 <18A40738790ACBCC.657799@lists.openembedded.org> <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
In-Reply-To: <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 Apr 2026 16:08:18 +0200
X-Gm-Features: AQROBzAyH_u-i0TXznb7X2pzDJ69K11LnaqY7744N7WzVMRFw-NL7ZYd-hh6BYk
Message-ID: <CA+chaQdDkMUDBO8G=cku8SVe=Ow+Hgt606mZO863rCaNaznDrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 14:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234740

For me this works with both ubuntu-26.04 and gentoo both with
glibc-2.43. I'm able to build images with scarthgap, whinlatter with
ubuntu (gentoo probably works as well, just haven't tried) and wrynose
with both ubuntu and gentoo.

On Tue, Apr 7, 2026 at 1:39=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2026. 04. 07. 10:54 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openem=
bedded.org =C3=ADrta:
> > Hi,
> >
> > something is still wrong with pseudo on Fedora 44 (beta) after this cha=
nge.
> > Besides GLIBC 2.43, GCC 16 is on Fedora 44.
> >
> > Packaging fails for every file and directory shipped by the recipe with=
:
> >
> > Cannot open: Function not implemented
> >
> > or
> >
> > Cannot mkdir: Function not implemented
>
> It's not GCC. I forced to build pseudo-native with GCC 15 and packaging
> linux-libc-headers and others still failed with the same problem.
>
> GLIBC is glibc-2.43-2.fc44.x86_64, which uses commit
> 48f5a05a7a1eeb9e0567ab429f654648f831307f from
> the release/2.43/master branch. It's a post-2.43 commit.
>
> > 2026. 03. 08. 17:37 keltez=C3=A9ssel, Martin Jansa via lists.openembedd=
ed.org =C3=ADrta:
> >> Hi,
> >>
> >> this is already merged in the repo and there is SRCREV bump which
> >> includes that change from Richard in master-next.
> >>
> >> Regards,
> >>
> >> On Sun, Mar 8, 2026 at 4:09=E2=80=AFPM Hemanth Kumar M D via
> >> lists.openembedded.org
> >> <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
> >>> From: Martin Jansa <martin.jansa@gmail.com>
> >>>
> >>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> >>> ---
> >>>   ...01-openat2-use-const-struct-open_how.patch | 54 ++++++++++++++++=
+++
> >>>   meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
> >>>   2 files changed, 55 insertions(+)
> >>>   create mode 100644
> >>> meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open=
_how.patch
> >>>
> >>> diff --git
> >>> a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-op=
en_how.patch
> >>> b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-op=
en_how.patch
> >>> new file mode 100644
> >>> index 0000000000..eda2593bdf
> >>> --- /dev/null
> >>> +++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struc=
t-open_how.patch
> >>> @@ -0,0 +1,54 @@
> >>> +From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 20=
01
> >>> +From: Martin Jansa <martin.jansa@gmail.com>
> >>> +Date: Thu, 5 Mar 2026 17:53:34 +0100
> >>> +Subject: [PATCH] openat2: use const struct open_how
> >>> +MIME-Version: 1.0
> >>> +Content-Type: text/plain; charset=3DUTF-8
> >>> +Content-Transfer-Encoding: 8bit
> >>> +
> >>> +To match
> >>> +https://sourceware.org/cgit/glibc/commit/?id=3D0f0a5cd338998f4b603f5=
2f3ce2163df0db7b814
> >>> +
> >>> +Otherwise it fails to build with glibc-2.43:
> >>> +
> >>> +In file included from pseudo_wrappers.c:300:
> >>> +pseudo_wrapfuncs.c: At top level:
> >>> +pseudo_wrapfuncs.c:11537:1: error: conflicting types for =E2=80=98op=
enat2=E2=80=99; have =E2=80=98int(int,
> >>> const char *, struct open_how *, size_t)=E2=80=99 {aka =E2=80=98int(i=
nt,  const char *, struct
> >>> open_how *, long unsigned int)=E2=80=99}
> >>> +11537 | openat2(int dirfd, const char *path, struct open_how *how, s=
ize_t size) {
> >>> +      | ^~~~~~~
> >>> +In file included from /usr/include/bits/fcntl-linux.h:492,
> >>> +                 from /usr/include/bits/fcntl.h:61,
> >>> +                 from /usr/include/fcntl.h:35,
> >>> +                 from pseudo_wrappers.c:23:
> >>> +/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definit=
ion of =E2=80=98openat2=E2=80=99
> >>> with type =E2=80=98int(int,  const char *, const struct open_how *, l=
ong unsigned int)=E2=80=99
> >>> +   36 | openat2 (int __dfd, const char *__filename, const struct ope=
n_how *__how,
> >>> +      | ^~~~~~~
> >>> +make: *** [Makefile:162: pseudo_wrappers.o] Error 1
> >>> +
> >>> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> >>> +Upstream-Status: Pending
> >>> +---
> >>> + ports/linux/openat2/guts/openat2.c | 2 +-
> >>> + ports/linux/openat2/wrapfuncs.in   | 2 +-
> >>> + 2 files changed, 2 insertions(+), 2 deletions(-)
> >>> +
> >>> +diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat=
2/guts/openat2.c
> >>> +index da01b31..366fb95 100644
> >>> +--- a/ports/linux/openat2/guts/openat2.c
> >>> ++++ b/ports/linux/openat2/guts/openat2.c
> >>> +@@ -4,7 +4,7 @@
> >>> +  *
> >>> +  * SPDX-License-Identifier: LGPL-2.1-only
> >>> +  *
> >>> +- * int openat2(int dirfd, const char *path, struct open_how *how, s=
ize_t size)
> >>> ++ * int openat2(int dirfd, const char *path, const struct open_how *=
how, size_t size)
> >>> +  *    int rc =3D -1;
> >>> +  */
> >>> +
> >>> +diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/=
wrapfuncs.in
> >>> +index 96ae8a7..2f1e716 100644
> >>> +--- a/ports/linux/openat2/wrapfuncs.in
> >>> ++++ b/ports/linux/openat2/wrapfuncs.in
> >>> +@@ -1 +1 @@
> >>> +-int openat2(int dirfd, const char *path, struct open_how *how, size=
_t size);
> >>> ++int openat2(int dirfd, const char *path, const struct open_how *how=
, size_t size);
> >>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
> >>> b/meta/recipes-devtools/pseudo/pseudo_git.bb
> >>> index a26a205a16..b34525055d 100644
> >>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> >>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> >>> @@ -1,6 +1,7 @@
> >>>   require pseudo.inc
> >>>
> >>>   SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;prot=
ocol=3Dhttps \
> >>> + file://0001-openat2-use-const-struct-open_how.patch \
> >>>              file://fallback-passwd \
> >>>              file://fallback-group \
> >>>              "
> >>> --
> >>> 2.49.0
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#234724): https://lists.openembedded.org/g/openembed=
ded-core/message/234724
> > Mute This Topic: https://lists.openembedded.org/mt/118204632/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

