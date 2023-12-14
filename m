Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E8EC4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:56:28 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.22642.1702562186731588090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0UAS3o5E;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1db99cd1b2so1046607666b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702562185; x=1703166985; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hK/GHu9L094w0GPG4DgcVL+xBR9/i5liJa0IOPWy0w=;
        b=0UAS3o5EoSRhaWbSdK84OR9tu4JGTrMT3z2+dS5W9hltx2wZHCYWqxwQHLDGYlbcbf
         dvTBjB2s4aFmO7W4f6+ELAjfrGD7Adsz2i+LFEWTU5LlCFliYOA8zLfulM1Gyu0R12YX
         yvnY458ulyhbHsdqXPGUP/xCRxmUeN8Bbi+LaP1+8sDCGL4HWQyYZAvDeEAKNqlEK8P6
         eerbU9G4zaWtzWx+g1pSwtvEwstH+D5r51X7NW/JdXrj38vwmlxCQX+3qIX7CszM98kB
         KPX4uyQl95sQ22KW6iN8oYgeyO3tJnAcMoiXjwt7XYuQxXwkYtaAqdod6vOqB2a0Zv67
         ouBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702562185; x=1703166985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hK/GHu9L094w0GPG4DgcVL+xBR9/i5liJa0IOPWy0w=;
        b=V0NMLAd6HfkzdJedaVK1kP3zjwQXJB/l2kLEDczi6zchjVZdPwJg0y/2/MSVf0W8nv
         DJBziDzeBHjQ+ht/4kvIOit2R2rq4cMtLGzUNN042K0mK9bi2dsUUl7vmHiCdMmG/2Ne
         35IrKJvI4n9wKPTjpTdN3y6ZX0n1o72MRv98NAOm7xWKgmWnRvLWLmPIjjZ5XyxtyFjl
         tMdXF+Arw6E+F5AOmfasnLSDS+skGO8C+wiDkR8Cy5M0JEuSVKEoFuWnp6w7IHA6+70f
         gtCyM+xQnW036fG0smawK8C/l9HqOKUA+lGjHfzh//EqIrFylDz7d6o8djMXViFrLHc0
         JDgA==
X-Gm-Message-State: AOJu0YyjeVnwQiI6wcfw65ReRyoQ/TYExFVQ2qwjODIGJ8ugeWsIWUdW
	k8H0SL7Z4vdmukloykfbual7IZjxCRuNz3S2miERfA==
X-Google-Smtp-Source: AGHT+IH+nFVG/TX1plDOn1J9Dft41I73GRZu0ywgrVIhbhUbbgTMCoyKRKJ/esUNR/lUquU6e/l22DveR9MVjQA3Ajo=
X-Received: by 2002:a17:906:5290:b0:a19:a19b:420c with SMTP id
 c16-20020a170906529000b00a19a19b420cmr3118412ejm.119.1702562184957; Thu, 14
 Dec 2023 05:56:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701299008.git.steve@sakoman.com> <9a42349a176ca4d7a1bfab3425a0821dbcbd9368.1701299008.git.steve@sakoman.com>
 <CAEHkU3V=tK-rqKEWkTrk441uDkRM5quNLO2ck824ExY-di5UUQ@mail.gmail.com>
In-Reply-To: <CAEHkU3V=tK-rqKEWkTrk441uDkRM5quNLO2ck824ExY-di5UUQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 14 Dec 2023 03:56:13 -1000
Message-ID: <CAOSpxda_MYNSBs3D1n=Ddz601uC3d_q2Sj12NUsXJ6Q4HXCecQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 7/8] kernel-fitImage: Strip path component
 from dtb
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192381

On Thu, Dec 14, 2023 at 12:42=E2=80=AFAM Max Krummenacher <max.oss.09@gmail=
.com> wrote:
>
> On Thu, Nov 30, 2023 at 12:05=E2=80=AFAM Steve Sakoman <steve@sakoman.com=
> wrote:
> >
> > From: Ninad Palsule <ninad@linux.ibm.com>
> >
> > Machines that have added subdirectires to the KERNEL_DEVICETREE
> > recently, such as arm32 boards that were moved under subdirectories in
> > Linux 6.5, will have that subdirectory in the node name of the FIT. Thi=
s
> > breaks existing systems that select a configuration in u-boot by it's
> > name.
> >
> > Strip off the directory component from the device tree to preserve
> > compatibility.
>
> This now breaks each arm64 machine (and likely mips & riscv) as they did
> have the vendor subdirectories since (nearly) ever and expect those in th=
e
> fitimage.
>
> Breaking those existing machines / kernel combination in order to have a
> smooth transition for arm32 machines which bring a 6.5 kernel to kirkston=
e
> seems wrong to me.
>
> I think we should revert the backport to kirkstone. If someone builds a 6=
.5
> or later kernel in kirkstone for an arm32 based machine one could cope
> with the change e.g. in the kernel recipe which provides that 6.5 kernel.
>
> Any comments? Thanks.
>
> Sorry that I didn't notice the change on the mailing list before it got a=
pplied.

Since this is causing breakage I will revert it prior to the upcoming
kirkstone release build.

Steve

> > (From OE-Core rev: 941ba1a132bafa9c9be855fb91fec96d8b06299f)
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de> # backpor=
t to kirkstone
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel=
-fitimage.bbclass
> > index 27e17db951..194d825b0e 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -542,6 +542,11 @@ fitimage_assemble() {
> >                                 DTB_PATH=3D"arch/${ARCH}/boot/$DTB"
> >                         fi
> >
> > +                       # Strip off the path component from the filenam=
e
> > +                       if "${@'false' if oe.types.boolean(d.getVar('KE=
RNEL_DTBVENDORED')) else 'true'}"; then
> > +                               DTB=3D`basename $DTB`
> > +                       fi
> > +
> >                         DTB=3D$(echo "$DTB" | tr '/' '_')
> >
> >                         # Skip DTB if we've picked it up previously
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191471): https://lists.openembedded.org/g/openembed=
ded-core/message/191471
> > Mute This Topic: https://lists.openembedded.org/mt/102883133/3617484
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
max.oss.09@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

