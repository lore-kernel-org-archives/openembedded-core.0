Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DD6C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 14:48:59 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.39740.1707058132937661005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 06:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NlscrdMB;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6d7e3b5bfso3124815276.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 06:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707058132; x=1707662932; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CxWCqaq/CHLQ6vqiYy/B+1QLCYfPLy4Op5GJ5TkNDPA=;
        b=NlscrdMB19q9W0QgObhUzIrowOPIZJpy06iw6nOxEmYbw/XJxyKN8VKFNFdUDNXD5P
         WeGlXO2TJ8fBD7VMIN+fhY47tAYA494h7LCbsCJ/p6qEQR/mmNRXtYqBhIHSZAlut5n9
         qrrwybBz2vflN/6tIyJaUh+di2MKMeAJAKYo1a1tgDIezObRD2qW56JYZZXJiQ5uzmg+
         mtdFG/4Op8Q8h/lU0kWFphAXGcLJtFTxUd6/fjdlvvgP92LOPeP7+gJSERsogiR8f6Lf
         AJs1aBVMxm1R1qf2Tz/ShW41k+x2rC0p7f42XcgcNywhXxptWohYlHMyl3OTy8aLt04w
         xcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707058132; x=1707662932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxWCqaq/CHLQ6vqiYy/B+1QLCYfPLy4Op5GJ5TkNDPA=;
        b=LP1xAwW0SrEF48vklTbkbKnbHzftfnBm16mvlWpXuo0RBv69IMnokEKoWqGZn//Wb+
         d+vVHL+BqH/Mu7GLUDalcajv1WhgNf8wKCCxf7cmPJrfc+RrA6q737NswRA9dqwGiwNF
         a43S+hm37MYeeF/lC25J7Sv3j4f8F7jkEizitaunym/R9RgFYui066RRK0WBy6X+xe99
         JU5hElq1kM+k30pFpM1S64oqk48PkzciUZiHSYLOEHewX2CHqoAMMHuKZfGopjNWdnEG
         ZfX2VRgGiYSMH29w5I520Ewroeqrxv1+gSr8mbqNkCtPK1UK3pb5NxLe2srZ4c6ictLl
         rrKg==
X-Gm-Message-State: AOJu0Ywrps68365XXssQN8AkC60uHVjEx/2GGE1Riut4aedVeacMjsZM
	aKyhmIADv2sNSE0zetE7DdAKbcV9TlKJ3ZyRYk+UrVVlHAZYN6iF1LZGVdl4Oazms4JXJUnPPOE
	yRc3oRzmhCqBB4GwXBbNY9tb3jxU=
X-Google-Smtp-Source: AGHT+IEv3yjLa3HsP4GppPriRpVH2wNHeHbu6wKfvMgqqyfif80W8zpxzTYCsGMsY1B2SlHrLNs7IZYNyqOLHHVQzcM=
X-Received: by 2002:a25:d6cb:0:b0:dc6:c367:f0e4 with SMTP id
 n194-20020a25d6cb000000b00dc6c367f0e4mr10226071ybg.52.1707058131136; Sun, 04
 Feb 2024 06:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20240105165554.1401517-1-tim.orling@konsulko.com>
 <2024020223125655b936ef@mail.local> <17B031E2E1DE7669.13964@lists.openembedded.org>
 <CANx9H-A1MwJ1crmJLJ51mrxp0oEazc7QXCqEv1VWUUKwPTuSBg@mail.gmail.com>
 <CAMKF1srNM1GMm2D9dYnozm+59vV9oqBHVC7oFfOZEdwwY-rCzw@mail.gmail.com> <CAMKF1spLPKYEeHR36oEMCKZA_ZFGKTR9qskm-na-Pe8saS=6nQ@mail.gmail.com>
In-Reply-To: <CAMKF1spLPKYEeHR36oEMCKZA_ZFGKTR9qskm-na-Pe8saS=6nQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 4 Feb 2024 06:48:40 -0800
Message-ID: <CANx9H-BHEFJk44naMWhqC0D2SW2rF1k0ggaNXGi36zzDAPHgyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tim Orling <tim.orling@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084782d06108f71a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 14:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194892

--00000000000084782d06108f71a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 12:14=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Sat, Feb 3, 2024 at 7:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > On Sat, Feb 3, 2024 at 5:20=E2=80=AFPM Tim Orling <ticotimo@gmail.com> =
wrote:
> > >
> > > The errors on mips32 are internal compiler errors (ICE):
> > > moduli.c:814:1: internal compiler error: in int_mode_for_mode, at
> stor-layout.cc:407
> > > progressmeter.c:238:1: internal compiler error: in int_mode_for_mode,
> at stor-layout.cc:407
> > > clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, a=
t
> stor-layout.cc:407
> > >
> > > (There are also a lot of OpenSSL 3.0 deprecation warnings, but I thin=
k
> the ICE are what is failing the build).
> > >
> > > Full log.do_compile attached.
> > >
> > > There are a handful of similar bug reports like:
> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820
> > >
> > > Any advice to help report this properly is appreciated. Any ideas to
> fix it are even better.
> >
> > Looks like gcc issue but try the patch proposed in this bug
> > https://bugzilla.mindrot.org/show_bug.cgi?id=3D3645
> >
> > This patch -
> https://bugzilla.mindrot.org/attachment.cgi?id=3D3776&action=3Ddiff
> >
> > See if it helps.
>
> Its also applied upstream see
>
> https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f51=
6b81b9928006848cbd


And that was merged after 9.6p1
https://github.com/openssh/openssh-portable/compare/V_9_6_P1...master

<https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f516=
b81b9928006848cbd>
>
> >
> > >
> > > --Tim
> > >
> > > On Fri, Feb 2, 2024 at 4:11=E2=80=AFPM Tim Orling via lists.openembed=
ded.org
> <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
> > >>
> > >>
> > >>
> > >> On Fri, Feb 2, 2024 at 3:12=E2=80=AFPM Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> > >>>
> > >>>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/5751/s=
teps/13/logs/stdio
> > >>
> > >>
> > >> Thank you, Alexandre. I=E2=80=99ll try to find a fix for this mips i=
ssue. If
> anyone else stumbles on it first, I=E2=80=99m happy to take guidance.
> > >>>
> > >>>
> > >>> On 05/01/2024 08:55:55-0800, Tim Orling wrote:
> > >>> > * Relocate Upstream-Status in
> 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
> > >>> >   so it will not throw an error in AUH
> > >>> >
> > >>> > https://www.openssh.com/txt/release-9.6
> > >>> >
> https://github.com/openssh/openssh-portable/compare/V_9_5_P1...V_9_6_P1
> > >>> >
> > >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-48795
> > >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51384
> > >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51385
> > >>> >
> > >>> > CVE: CVE-2023-48795
> > >>> > CVE: CVE-2023-51384
> > >>> > CVE: CVE-2023-51385
> > >>> >
> > >>> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > >>> > ---
> > >>> > All ptests passed on core-image-ptest-openssh on qemux86-64
> > >>> >
> > >>> >  ...regress-banner.sh-log-input-and-output-files-on-erro.patch | =
4
> ++--
> > >>> >  .../openssh/{openssh_9.5p1.bb =3D> openssh_9.6p1.bb}            =
|
> 2 +-
> > >>> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >>> >  rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb =3D>
> openssh_9.6p1.bb} (98%)
> > >>> >
> > >>> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > >>> > index 2c14014fed8..8763f30f4b3 100644
> > >>> > ---
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > >>> > +++
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > >>> > @@ -34,13 +34,13 @@ return value: 1
> > >>> >
> > >>> >  See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
> > >>> >
> > >>> > +Upstream-Status: Denied [
> https://github.com/openssh/openssh-portable/pull/437]
> > >>> > +
> > >>> >  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > >>> >  ---
> > >>> >   regress/banner.sh | 4 +++-
> > >>> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > >>> >
> > >>> > -Upstream-Status: Denied [
> https://github.com/openssh/openssh-portable/pull/437]
> > >>> > -
> > >>> >  diff --git a/regress/banner.sh b/regress/banner.sh
> > >>> >  index a84feb5a..de84957a 100644
> > >>> >  --- a/regress/banner.sh
> > >>> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > >>> > similarity index 98%
> > >>> > rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> > >>> > rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > >>> > index bbb8fb091ad..fa44eb0bd4e 100644
> > >>> > --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> > >>> > +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > >>> > @@ -28,7 +28,7 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
> > >>> >
>  file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> > >>> >
>  file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
> > >>> >             "
> > >>> > -SRC_URI[sha256sum] =3D
> "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
> > >>> > +SRC_URI[sha256sum] =3D
> "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
> > >>> >
> > >>> >  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE i=
s
> specific to OpenSSH with the pam opie which we don't build/use here."
> > >>> >
> > >>> > --
> > >>> > 2.34.1
> > >>> >
> > >>>
> > >>> >
> > >>> >
> > >>> >
> > >>>
> > >>>
> > >>> --
> > >>> Alexandre Belloni, co-owner and COO, Bootlin
> > >>> Embedded Linux and Kernel engineering
> > >>> https://bootlin.com
> > >>
> > >>
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> Links: You receive all messages sent to this group.
> > >> View/Reply Online (#194821):
> https://lists.openembedded.org/g/openembedded-core/message/194821
> > >> Mute This Topic: https://lists.openembedded.org/mt/103546397/924729
> > >> Group Owner: openembedded-core+owner@lists.openembedded.org
> > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [ticotimo@gmail.com]
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>
>

--00000000000084782d06108f71a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 4, 2024 at 12:14=E2=80=AFAM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">On Sat, Feb 3, 2024 at 7:39=E2=80=AFPM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; On Sat, Feb 3, 2024 at 5:20=E2=80=AFPM Tim Orling &lt;<a href=3D"mailt=
o:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt; The errors on mips32 are internal compiler errors (ICE):<br>
&gt; &gt; moduli.c:814:1: internal compiler error: in int_mode_for_mode, at=
 stor-layout.cc:407<br>
&gt; &gt; progressmeter.c:238:1: internal compiler error: in int_mode_for_m=
ode, at stor-layout.cc:407<br>
&gt; &gt; clientloop.c:1699:1: internal compiler error: in int_mode_for_mod=
e, at stor-layout.cc:407<br>
&gt; &gt;<br>
&gt; &gt; (There are also a lot of OpenSSL 3.0 deprecation warnings, but I =
think the ICE are what is failing the build).<br>
&gt; &gt;<br>
&gt; &gt; Full log.do_compile attached.<br>
&gt; &gt;<br>
&gt; &gt; There are a handful of similar bug reports like:<br>
&gt; &gt; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820"=
 rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug=
.cgi?id=3D104820</a><br>
&gt; &gt;<br>
&gt; &gt; Any advice to help report this properly is appreciated. Any ideas=
 to fix it are even better.<br>
&gt;<br>
&gt; Looks like gcc issue but try the patch proposed in this bug<br>
&gt; <a href=3D"https://bugzilla.mindrot.org/show_bug.cgi?id=3D3645" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.mindrot.org/show_bug.cgi?id=
=3D3645</a><br>
&gt;<br>
&gt; This patch - <a href=3D"https://bugzilla.mindrot.org/attachment.cgi?id=
=3D3776&amp;action=3Ddiff" rel=3D"noreferrer" target=3D"_blank">https://bug=
zilla.mindrot.org/attachment.cgi?id=3D3776&amp;action=3Ddiff</a><br>
&gt;<br>
&gt; See if it helps.<br>
<br>
Its also applied upstream see<br>
<a href=3D"https://github.com/openssh/openssh-portable/commit/1036d77b34a5f=
a15e56f516b81b9928006848cbd" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f516b81b992800=
6848cbd</a></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">And t=
hat was merged after 9.6p1</div><div dir=3D"auto"><div><a href=3D"https://g=
ithub.com/openssh/openssh-portable/compare/V_9_6_P1...master">https://githu=
b.com/openssh/openssh-portable/compare/V_9_6_P1...master</a></div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)" dir=3D"auto"><a href=3D"https://github.com/openssh/openss=
h-portable/commit/1036d77b34a5fa15e56f516b81b9928006848cbd" rel=3D"noreferr=
er" target=3D"_blank"></a><br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; --Tim<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Feb 2, 2024 at 4:11=E2=80=AFPM Tim Orling via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrot=
e:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Feb 2, 2024 at 3:12=E2=80=AFPM Alexandre Belloni &lt;=
<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">alexandr=
e.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#=
/builders/102/builds/5751/steps/13/logs/stdio" rel=3D"noreferrer" target=3D=
"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds=
/5751/steps/13/logs/stdio</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thank you, Alexandre. I=E2=80=99ll try to find a fix for this=
 mips issue. If anyone else stumbles on it first, I=E2=80=99m happy to take=
 guidance.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On 05/01/2024 08:55:55-0800, Tim Orling wrote:<br>
&gt; &gt;&gt;&gt; &gt; * Relocate Upstream-Status in 0001-regress-banner.sh=
-log-input-and-output-files-on-erro.patch<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0so it will not throw an error in AUH<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; <a href=3D"https://www.openssh.com/txt/release-9.6" =
rel=3D"noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-9.=
6</a><br>
&gt; &gt;&gt;&gt; &gt; <a href=3D"https://github.com/openssh/openssh-portab=
le/compare/V_9_5_P1...V_9_6_P1" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/openssh/openssh-portable/compare/V_9_5_P1...V_9_6_P1</a><br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023=
-48795" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/deta=
il/CVE-2023-48795</a><br>
&gt; &gt;&gt;&gt; &gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023=
-51384" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/deta=
il/CVE-2023-51384</a><br>
&gt; &gt;&gt;&gt; &gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023=
-51385" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/deta=
il/CVE-2023-51385</a><br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; CVE: CVE-2023-48795<br>
&gt; &gt;&gt;&gt; &gt; CVE: CVE-2023-51384<br>
&gt; &gt;&gt;&gt; &gt; CVE: CVE-2023-51385<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.=
orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; &gt;&gt;&gt; &gt; ---<br>
&gt; &gt;&gt;&gt; &gt; All ptests passed on core-image-ptest-openssh on qem=
ux86-64<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 ...regress-banner.sh-log-input-and-output-file=
s-on-erro.patch | 4 ++--<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 .../openssh/{<a href=3D"http://openssh_9.5p1.b=
b" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a> =3D&gt; <a hre=
f=3D"http://openssh_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_=
9.6p1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(=
-)<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 rename meta/recipes-connectivity/openssh/{<a h=
ref=3D"http://openssh_9.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openss=
h_9.5p1.bb</a> =3D&gt; <a href=3D"http://openssh_9.6p1.bb" rel=3D"noreferre=
r" target=3D"_blank">openssh_9.6p1.bb</a>} (98%)<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; diff --git a/meta/recipes-connectivity/openssh/opens=
sh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/r=
ecipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-ou=
tput-files-on-erro.patch<br>
&gt; &gt;&gt;&gt; &gt; index 2c14014fed8..8763f30f4b3 100644<br>
&gt; &gt;&gt;&gt; &gt; --- a/meta/recipes-connectivity/openssh/openssh/0001=
-regress-banner.sh-log-input-and-output-files-on-erro.patch<br>
&gt; &gt;&gt;&gt; &gt; +++ b/meta/recipes-connectivity/openssh/openssh/0001=
-regress-banner.sh-log-input-and-output-files-on-erro.patch<br>
&gt; &gt;&gt;&gt; &gt; @@ -34,13 +34,13 @@ return value: 1<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 See: <a href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D15178" rel=3D"noreferrer" target=3D"_blank">https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D15178</a><br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; +Upstream-Status: Denied [<a href=3D"https://github.=
com/openssh/openssh-portable/pull/437" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/openssh/openssh-portable/pull/437</a>]<br>
&gt; &gt;&gt;&gt; &gt; +<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 Signed-off-by: Mikko Rapeli &lt;<a href=3D"mai=
lto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&=
gt;<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 ---<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0regress/banner.sh | 4 +++-<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 delet=
ion(-)<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; -Upstream-Status: Denied [<a href=3D"https://github.=
com/openssh/openssh-portable/pull/437" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/openssh/openssh-portable/pull/437</a>]<br>
&gt; &gt;&gt;&gt; &gt; -<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 diff --git a/regress/banner.sh b/regress/banne=
r.sh<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 index a84feb5a..de84957a 100644<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 --- a/regress/banner.sh<br>
&gt; &gt;&gt;&gt; &gt; diff --git a/meta/recipes-connectivity/openssh/<a hr=
ef=3D"http://openssh_9.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh=
_9.5p1.bb</a> b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh=
_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; &gt;&gt;&gt; &gt; similarity index 98%<br>
&gt; &gt;&gt;&gt; &gt; rename from meta/recipes-connectivity/openssh/<a hre=
f=3D"http://openssh_9.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_=
9.5p1.bb</a><br>
&gt; &gt;&gt;&gt; &gt; rename to meta/recipes-connectivity/openssh/<a href=
=3D"http://openssh_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9=
.6p1.bb</a><br>
&gt; &gt;&gt;&gt; &gt; index bbb8fb091ad..fa44eb0bd4e 100644<br>
&gt; &gt;&gt;&gt; &gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"h=
ttp://openssh_9.5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.=
bb</a><br>
&gt; &gt;&gt;&gt; &gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"h=
ttp://openssh_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.=
bb</a><br>
&gt; &gt;&gt;&gt; &gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot;<a href=3D"http:=
//ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=
=3D"noreferrer" target=3D"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSS=
H/portable/openssh-${PV}.tar</a><br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;<br>
&gt; &gt;&gt;&gt; &gt; -SRC_URI[sha256sum] =3D &quot;f026e7b79ba7fb540f7518=
2af96dc8a8f1db395f922bbc9f6ca603672686086b&quot;<br>
&gt; &gt;&gt;&gt; &gt; +SRC_URI[sha256sum] =3D &quot;910211c07255a8c5ad6543=
91b40ee59800710dd8119dd5362de09385aa7a777c&quot;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;=C2=A0 CVE_STATUS[CVE-2007-2768] =3D &quot;not-applic=
able-config: This CVE is specific to OpenSSH with the pam opie which we don=
&#39;t build/use here.&quot;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt; --<br>
&gt; &gt;&gt;&gt; &gt; 2.34.1<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt; &gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt;&gt;&gt; Embedded Linux and Kernel engineering<br>
&gt; &gt;&gt;&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=
=3D"_blank">https://bootlin.com</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt; &gt;&gt; View/Reply Online (#194821): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/194821" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/194821</=
a><br>
&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/103546397/924729" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/103546397/924729</a><br>
&gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gma=
il.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt;<br>
</blockquote></div></div>

--00000000000084782d06108f71a1--

