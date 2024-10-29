Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB34D2AB38
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 12:35:01 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.18337.1730205298821795249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 05:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFNcV0pV;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so5446305e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730205297; x=1730810097; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxn9teWz9xODFrVGGI68qnWD3tkZittwIsAr6U1w58M=;
        b=HFNcV0pVcyCzpjiq8GZ9yvJ2Qf6rSH0a8n9K7d9nIZe0KxOlTan2XgkLeidfeT5zp3
         eD1a+xFcmEkGQWC5LvzVlliHcaYHuCA6SQv4gOJdCEoey8IksuSb5ff47FBbV9m91Z5Y
         IJDoviHEiMIKb12ErDGM3Y98PvPcI3F3qYM45gZrZqZ2lnhMq6NGusKV4aDbQ4tI6Gcc
         6DPn3OM1+KkFUlukAUXvNi17pnR3OF5NO97sm9d8Bgd2PJF4XBO7/CBcVVMYxzYiojrI
         rTkISGz2eqqc5Zp7FiJqnuogZju4OWScKjGsqqsYRW8681NJzT4mMsZYm6Y/Pv4ZimRX
         AhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730205297; x=1730810097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qxn9teWz9xODFrVGGI68qnWD3tkZittwIsAr6U1w58M=;
        b=KOduW6b1WMfh+i9IstX4CCvW/EvGPDR31lBIyWE3rS+ZDnZuGHLNH5suaAUr3CwBQi
         8mlGz+JEietAU5LPGa5yngYqzecCTPmaYwgrBXpfbfInGATq61JQSqn956WHPkNKi+Rq
         jhLbZccreChPQVljjmA+AB/SUV/7o3f2P2aTiYDu5r2kAdL9ig5cQv7v4Vw/wnUuTRTu
         R5SKABgzuRQ+jA/6aTDLCQbRIn2Sb/4sSzpUj57haRWASUq9dNBuBWmFXCAyibHWMeLa
         fGnCHDlTreiAtseDXo5LZjFki7TWtiHl97dhyp4iMr0yTK1Bag/jsdKhe6QKjGKiWZUj
         /jZw==
X-Forwarded-Encrypted: i=1; AJvYcCVPUmWJcIVq4sZKJCMA2WC8xtpwaE3ZrOPnyNKjVCReJeGnb+uVI8nuUwIqTSVyOl+f1s5ClfHjlyNRmUZTDTRqyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzD+Hr4nyv/kom+9l8HeuWl7iz5s8sGfrIUBk3VTL5Onh74LAC+
	oOe6SmC0lsUy1Zoxxa/CdonyEpOU4D8OCvZ8zMm7HemrXlV156saC/R55Lny2uPB8SVUoN2Bxd7
	V86sEa7cFggZGVIvUhOlxPzw7wxQ=
X-Google-Smtp-Source: AGHT+IHZbgUjyPi4H3bO+01iWC+tPnqgiOSlzu3VIhOgnzsXbKdtEOI+5Kg02KIqatRJ9oUMfvY1DprccsO3krdtcvo=
X-Received: by 2002:a05:6512:2807:b0:53b:1671:604f with SMTP id
 2adb3069b0e04-53b348d878dmr6439939e87.23.1730205296418; Tue, 29 Oct 2024
 05:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241027170119.2876289-1-martin.jansa@gmail.com>
 <CAOSpxdbdVd5e1HbQgK9cZpJBU-YP9JJRL=AUQ8M41XXiPrWEGA@mail.gmail.com>
 <18026806371753EE.19860@lists.openembedded.org> <CA+chaQfgHV99s7xJH7nwf4UrohB4M8kLWJ0kM-o92jK1K47cyw@mail.gmail.com>
 <1802A935C3F5B889.20159@lists.openembedded.org> <CAOSpxdbjEWRaQJg6+PaP2fNutr0DkMgf+RTqG3Uesuz0+k6JXw@mail.gmail.com>
 <1802EC4B67CBF4A4.18751@lists.openembedded.org>
In-Reply-To: <1802EC4B67CBF4A4.18751@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Oct 2024 13:34:44 +0100
Message-ID: <CA+chaQcKCs0__VmARAAkSTyfN1BLcw7ErWwRzvZFn78ysoi0HQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] xmlto: backport a patch to fix build
 with gcc-14 on host
To: martin.jansa@gmail.com
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206498

I'll check if backporting
https://pagure.io/xmlto/c/32376c053733c6c0ebaca3c25c0725509342fdf3
as well prevents the build from calling flex as applying this as well
will probably make xmlif.c to be newer than xmlif.l again and then it
might not try to re-create it.

On Tue, Oct 29, 2024 at 1:30=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Tue, Oct 29, 2024 at 1:19=E2=80=AFPM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > On Mon, Oct 28, 2024 at 9:00=E2=80=AFAM Steve Sakoman via
> > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > On Sun, Oct 27, 2024 at 2:06=E2=80=AFPM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
> > > >
> > > > Not sure what else could be different on autobuilder, passed here w=
ith
> > > > poky and poky-altcfg in ubuntu-22.04 as well:
> > >
> > > I can't reproduce locally either :-(
> > >
> > > The autobuilder isn't usable right now, but when it becomes available
> > > I will try again there.
> >
> > I tried the patch again, and sadly there were many failures of
> > xmlto-native and they occurred on multiple distros.
> >
> > For detaIls see:
> >
> > https://valkyrie.yoctoproject.org/#/builders/29/builds/355
>
> :(.
>
> OK, please drop it for now, I'll leave it in my branch and hope that
> one day it will fail for me as well.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206497): https://lists.openembedded.org/g/openembedde=
d-core/message/206497
> Mute This Topic: https://lists.openembedded.org/mt/109242697/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

