Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD48C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 08:14:07 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.34748.1707034446984444050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 00:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QXg0jSV5;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-204f50f305cso2311597fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 00:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707034446; x=1707639246; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWxpodHrw6v2bJnOwlZt50rA8oMa5WwjHXeExklJ3Y8=;
        b=QXg0jSV5/+t20vY8LD3YqOb0UU0l4JWiuKCOHKpQcwuLt4hvYxpnmEdktbBPASjXGm
         Wt75L0AyUp9PsC62XDyO+ejayBRBLb4RO+RvuTeUzLFB6FRrCg7Z+hWnTtEF3fWsldvj
         8S4TeQuqydCgMMCx4lTJpD3U1+PbiKWpPVwLocjgFmJtudlKrFAuFp8j5Mgnq2nPRyNM
         ymKgWehVhxA8psHhAtdUvo41XM+tYjGwjb96IAUQJVGAKuboKrtNLWC6F9NzYYe5Fvoc
         P/gUY+F5b/xYIsLpeCRhi9kmrfDble1ZZHTHumIEZZPGWSBA+eADTIH6dB9eEAJ5bqMP
         0shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707034446; x=1707639246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWxpodHrw6v2bJnOwlZt50rA8oMa5WwjHXeExklJ3Y8=;
        b=dENZubWvoWsugbQxqS0dPpq7hReImFxnm2Tl2nMVKUmOubMQkxAcqzikeiQeVHwfQx
         kOz1WJY3C8epi3tcZaeu2PhgXfto0vWEfuqVtIbQc5aet9+EdYBF3kzc+ixEFnAVps2l
         YXZ2pZ7TApmepme2djVx2EJDAITdXqxxyKAif6RhTAW56BHYEN1VustvL3S+efivc+Y2
         K1PUhAQXi7mRGkU50PU4j+epPGF/yQfYiB48/TYrVUakAOuOpc+m75wBXZIHcURcwlr8
         WJ1CMWp1c3PNykQmi5Cm/GP49Ut4YLVjtYKuA+czYkKZ9kv6HENkgeHs/87XYTwUXssR
         diaQ==
X-Gm-Message-State: AOJu0YyWI09gaQ5Mq9N675BIH1D6ImjYNLz+jx8wdnb2eaPXVPCY53SF
	CxLkYNoxXpIcS/HLscIP1/LphLAnzl8UPXWeYYlPNDsVmuPKvEN0/lEI2PZl3e0NmokCDMYOYS5
	n1OT0Pau733HD2IA1uGnW50fT7Fc=
X-Google-Smtp-Source: AGHT+IFYdUT3poXtmeoevfVZP9Awc+P1s+BlkTzSok3lapZ4dHXdxxdFUwDQL0x+hOtXTOLZiERm3vDDrCIE8/vm+sM=
X-Received: by 2002:a05:6870:10:b0:206:79a6:24d1 with SMTP id
 a16-20020a056870001000b0020679a624d1mr4215097oaa.55.1707034446086; Sun, 04
 Feb 2024 00:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20240105165554.1401517-1-tim.orling@konsulko.com>
 <2024020223125655b936ef@mail.local> <17B031E2E1DE7669.13964@lists.openembedded.org>
 <CANx9H-A1MwJ1crmJLJ51mrxp0oEazc7QXCqEv1VWUUKwPTuSBg@mail.gmail.com> <CAMKF1srNM1GMm2D9dYnozm+59vV9oqBHVC7oFfOZEdwwY-rCzw@mail.gmail.com>
In-Reply-To: <CAMKF1srNM1GMm2D9dYnozm+59vV9oqBHVC7oFfOZEdwwY-rCzw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Feb 2024 00:13:39 -0800
Message-ID: <CAMKF1spLPKYEeHR36oEMCKZA_ZFGKTR9qskm-na-Pe8saS=6nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 08:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194879

On Sat, Feb 3, 2024 at 7:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Feb 3, 2024 at 5:20=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wr=
ote:
> >
> > The errors on mips32 are internal compiler errors (ICE):
> > moduli.c:814:1: internal compiler error: in int_mode_for_mode, at stor-=
layout.cc:407
> > progressmeter.c:238:1: internal compiler error: in int_mode_for_mode, a=
t stor-layout.cc:407
> > clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, at =
stor-layout.cc:407
> >
> > (There are also a lot of OpenSSL 3.0 deprecation warnings, but I think =
the ICE are what is failing the build).
> >
> > Full log.do_compile attached.
> >
> > There are a handful of similar bug reports like:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820
> >
> > Any advice to help report this properly is appreciated. Any ideas to fi=
x it are even better.
>
> Looks like gcc issue but try the patch proposed in this bug
> https://bugzilla.mindrot.org/show_bug.cgi?id=3D3645
>
> This patch - https://bugzilla.mindrot.org/attachment.cgi?id=3D3776&action=
=3Ddiff
>
> See if it helps.

Its also applied upstream see
https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f516b=
81b9928006848cbd

>
> >
> > --Tim
> >
> > On Fri, Feb 2, 2024 at 4:11=E2=80=AFPM Tim Orling via lists.openembedde=
d.org <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >>
> >>
> >> On Fri, Feb 2, 2024 at 3:12=E2=80=AFPM Alexandre Belloni <alexandre.be=
lloni@bootlin.com> wrote:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/57=
51/steps/13/logs/stdio
> >>
> >>
> >> Thank you, Alexandre. I=E2=80=99ll try to find a fix for this mips iss=
ue. If anyone else stumbles on it first, I=E2=80=99m happy to take guidance=
.
> >>>
> >>>
> >>> On 05/01/2024 08:55:55-0800, Tim Orling wrote:
> >>> > * Relocate Upstream-Status in 0001-regress-banner.sh-log-input-and-=
output-files-on-erro.patch
> >>> >   so it will not throw an error in AUH
> >>> >
> >>> > https://www.openssh.com/txt/release-9.6
> >>> > https://github.com/openssh/openssh-portable/compare/V_9_5_P1...V_9_=
6_P1
> >>> >
> >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-48795
> >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51384
> >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51385
> >>> >
> >>> > CVE: CVE-2023-48795
> >>> > CVE: CVE-2023-51384
> >>> > CVE: CVE-2023-51385
> >>> >
> >>> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> >>> > ---
> >>> > All ptests passed on core-image-ptest-openssh on qemux86-64
> >>> >
> >>> >  ...regress-banner.sh-log-input-and-output-files-on-erro.patch | 4 =
++--
> >>> >  .../openssh/{openssh_9.5p1.bb =3D> openssh_9.6p1.bb}            | =
2 +-
> >>> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >>> >  rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb =3D> op=
enssh_9.6p1.bb} (98%)
> >>> >
> >>> > diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress=
-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connecti=
vity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-e=
rro.patch
> >>> > index 2c14014fed8..8763f30f4b3 100644
> >>> > --- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner=
.sh-log-input-and-output-files-on-erro.patch
> >>> > +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner=
.sh-log-input-and-output-files-on-erro.patch
> >>> > @@ -34,13 +34,13 @@ return value: 1
> >>> >
> >>> >  See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
> >>> >
> >>> > +Upstream-Status: Denied [https://github.com/openssh/openssh-portab=
le/pull/437]
> >>> > +
> >>> >  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >>> >  ---
> >>> >   regress/banner.sh | 4 +++-
> >>> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >>> >
> >>> > -Upstream-Status: Denied [https://github.com/openssh/openssh-portab=
le/pull/437]
> >>> > -
> >>> >  diff --git a/regress/banner.sh b/regress/banner.sh
> >>> >  index a84feb5a..de84957a 100644
> >>> >  --- a/regress/banner.sh
> >>> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/m=
eta/recipes-connectivity/openssh/openssh_9.6p1.bb
> >>> > similarity index 98%
> >>> > rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> >>> > rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> >>> > index bbb8fb091ad..fa44eb0bd4e 100644
> >>> > --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> >>> > +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> >>> > @@ -28,7 +28,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/O=
penSSH/portable/openssh-${PV}.tar
> >>> >             file://0001-regress-banner.sh-log-input-and-output-file=
s-on-erro.patch \
> >>> >             file://0001-systemd-Add-optional-support-for-systemd-sd=
_notify.patch \
> >>> >             "
> >>> > -SRC_URI[sha256sum] =3D "f026e7b79ba7fb540f75182af96dc8a8f1db395f92=
2bbc9f6ca603672686086b"
> >>> > +SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd811=
9dd5362de09385aa7a777c"
> >>> >
> >>> >  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is =
specific to OpenSSH with the pam opie which we don't build/use here."
> >>> >
> >>> > --
> >>> > 2.34.1
> >>> >
> >>>
> >>> >
> >>> >
> >>> >
> >>>
> >>>
> >>> --
> >>> Alexandre Belloni, co-owner and COO, Bootlin
> >>> Embedded Linux and Kernel engineering
> >>> https://bootlin.com
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#194821): https://lists.openembedded.org/g/openembe=
dded-core/message/194821
> >> Mute This Topic: https://lists.openembedded.org/mt/103546397/924729
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[ticotimo@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

