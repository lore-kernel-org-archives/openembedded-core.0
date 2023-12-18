Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEBFC46CCD
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 13:15:45 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.43689.1702905341401383567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 05:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R+MwgPTd;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e3cde8ab8so508281e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 05:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702905339; x=1703510139; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dia30cw19c3OWheRrU0PfBDVH5nQTj+VoE8BYKlPAcI=;
        b=R+MwgPTduFzcGq2HoDONEggy4DFBqDzcePGgCjEoYIm1B+jPHufjkCwZzzRECgFzaP
         VYIyCb3oGqmItBuyetjo/98Sy9iLrPESFiHBjDKr1UOG0wXd7zhaf4d55Ivae2gbKmUR
         VxkpBvVlhMajrFALo0MW8ylblY+lwxlWplctF1tiDqAbzVVSa+2bWJHUeFR99V4fQHPO
         1zRTDX4+sgH7liYhYRBUr49Z6chl0Uw6adGjuoG7cSlGyLs5UDd2OomTm2wRcLaYTzjt
         8OZdIJaQUenf5so951f9DekpJ6FW5HG0R63V2f+8ZPxjvqbO4OAF1DodvukP/K4nHERL
         IFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702905339; x=1703510139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dia30cw19c3OWheRrU0PfBDVH5nQTj+VoE8BYKlPAcI=;
        b=WF/uo/+3f/AE5mm0dSTo1chm0LiRD1BtEmSLsKTYgmTmOPEaxVOVEi+Q5RXOMMmxTy
         ZKbi/oMd9Yxd8y83GBKaf8BaQsWWqdRdRTy35DxgB3tGzMbf24Ou7Ew6LWEA6o5+/Shv
         APBaGImzjU3k6rz213zhMqZdd4Q4/IPv1w5SozRotXftcBlBUZXNZ0dIaFV0N2mUKknd
         MVd05Wjpq/OF+YMao3a7QL5IOHAyAt+vZli3FvoYpdxXNeGSi6VXFB3AQyThyP1Miv3t
         52EOOQ0/v1WVc85SWRPOYVmd14r1+fG39k6qevl4h3dy7OEhsX3arvxmYITawJjRMoBc
         COaQ==
X-Gm-Message-State: AOJu0Yycd9LmO6VTv0qrDirA4epWMxtCBjYRI4tP6Oj4Hpc3q5WtDgYX
	nbZsDEBrFsz9BtH+cBrJK1n3Apx9FnLgJv5sXgA=
X-Google-Smtp-Source: AGHT+IGnCmTsOx1+s0gfAcZH6q7kP5tuBruSks1dXLv6pECoDYYVJU2rWoUjOElG7G0B3c1NF1s3q+PlcMHV4tBRvXY=
X-Received: by 2002:a05:6512:3c96:b0:50b:c50c:dbc4 with SMTP id
 h22-20020a0565123c9600b0050bc50cdbc4mr11506264lfv.0.1702905339393; Mon, 18
 Dec 2023 05:15:39 -0800 (PST)
MIME-Version: 1.0
References: <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
 <CAMKF1souVOjHqkd15+FX3NMGvggFFrhhR9nGs-BN53Y=yzYbSw@mail.gmail.com>
 <CANx9H-Cts0d7vRqaKSW4rPk__4=iEOG7pffaoUQBFn6mWDfWwQ@mail.gmail.com> <81df8e01-1431-4a9d-b478-4256f70fd555@gmail.com>
In-Reply-To: <81df8e01-1431-4a9d-b478-4256f70fd555@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 18 Dec 2023 13:15:27 +0000
Message-ID: <CAO5Uq5Qmh43-7jzcSbCNsVpeBq1UiA6V0D3S59G9=V5jjU9Psw@mail.gmail.com>
Subject: Re: [OE-core] mdns on musl
To: Matt Wood <mattwood2000@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 13:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192641

On Sat, Dec 16, 2023 at 9:42=E2=80=AFPM Matt Wood <mattwood2000@gmail.com> =
wrote:
>
> This is a fundamental issue with musl:
> https://wiki.musl-libc.org/future-ideas
>
> I thought there was a solution using the mdns package (mDNSResponder from=
 Apple), but I could be misinterpreting what I have read.
>

I think there is (mDNSMacOSX/dnsproxy.c) but its only part of the MacOSX bu=
ild.

> I saw a go implementation of avahi2dns, but this is for an initramfs so t=
rying to keep things small.
>
> I'll keep looking around but if anyone else has any suggestions I'd appre=
ciate it.
>
> Thanks, Matt
>
> On 12/16/23 15:42, Tim Orling wrote:
> >
> > On Sat, Dec 16, 2023 at 12:16=E2=80=AFPM Khem Raj <raj.khem@gmail.com <=
mailto:raj.khem@gmail.com>> wrote:
> >
> >     is this issue specific to musl systems?
> >     Maybe try to reproduce it with glibc on qemu or something?
> >
> >
> > You might also search for mdns issues/solutions in Alpine Linux which i=
s always musl.
> >
> >
> >     On Sat, Dec 16, 2023 at 9:11=E2=80=AFAM <mattwood2000@gmail.com <ma=
ilto:mattwood2000@gmail.com>> wrote:
> >     >
> >     > Hi all,
> >     >
> >     > I'm working on an embedded system and it needs mDNS in order to i=
nteract with .local hostnames.
> >     >
> >     > The image is based on musl so it cannot use the libnss-mdns libra=
ry.
> >     >
> >     > From what I've read the mdns recipe is supposed to support mDNS o=
n non-glibc systems.
> >     >
> >     > The recipe takes care of modifying /etc/nsswitch.conf and appends=
 mdns to the hosts line.
> >     >
> >     > When the system boots it runs mdnsd and I can see it join the mul=
ticast group in wireshark, but I cannot ping any .local addresses.
> >     >
> >     > Is there some other configuration that needs to be done?
> >     >
> >     > Has anyone successfully done this with a musl system?
> >     >
> >     > Thanks, Matt.
> >     >
> >     >
> >     >
> >     >
> >     >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192571): https://lists.openembedded.org/g/openembedde=
d-core/message/192571
> Mute This Topic: https://lists.openembedded.org/mt/103211493/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

