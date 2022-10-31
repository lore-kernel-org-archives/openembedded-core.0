Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D004FA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:53:20 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.7231.1667206391699064794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ADpFG/YQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id be13so18208947lfb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg2GbKW97/dSepOPCtGiYGkk0enhlVbWl3hiuDhq7+E=;
        b=ADpFG/YQ9KQeuexdxfRpLfA6N1ptDFgCwwHa9xhhC7WR6OQ3+i0bX5VtgV6u1t6bjA
         M3YXBjlWoa5sq9GIbQty3dHbV7arbEtUeqbZSoWTHXxEs/3BNERP22ha+Gt9TwsNwV88
         ZttOb+nzOBDEkzl+iTAKQyV8XreSEEl4nYO9zSsJAxlX87TVhDe9ul4sh/NCa4CsQ0Ih
         Bo77bhx8cvbq+i+dFWfgq0LY8OyL5rlt1cZv/wGAQMBSEnfgia+ULvTiHUOkupea5rfg
         fHznvhliJ/0N87cwk/ipi3X+ok9oWS+qezIpYJM7SM+D4frP7rbIhOpxwHK0E5rNvDr8
         8RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rg2GbKW97/dSepOPCtGiYGkk0enhlVbWl3hiuDhq7+E=;
        b=gB6/jMOXpAMOUkrn5h1qOTYDOxVOuf21enFXTSCM9IIVeSK3az0aZ0jyCa8IvLqKPV
         iJORi+L/IEJHijypxkdYdcON7lL4ygO9eZ5Pe+QQT2JodrCcvS+yXh+RsOeqPQ72EDuf
         Kl1CFgCvfLQ5vSvkv0b66PsRoeGqE/jIPgwk9l3IjJ6bEsSYCUiK9HQ2dTDH4r5KHgbX
         9sFNMDmGBeEKIpdLEmU7lTlFzgHSQKHw+4I+609m/0nl+pryuBiqSM1fC5VBH0SfdbP5
         3/roiFXCdnwsbmsH44WX5QkhcUFIxVI2apxN2dOR7jW8nAbz5lpecyeLkzQkzHxAhxM/
         9o6w==
X-Gm-Message-State: ACrzQf3utoVtdbXSJjp5Glu/ojuMpCgVQwLTMyXxOgf8hUMNh+rp9HcK
	8yPSPT5sez4fgwMrt051ogVFjBNOG6bJLqJkE40=
X-Google-Smtp-Source: AMsMyM7stss1v+isc/vaHddEC9dkl72mdlfIegCGmhE71KewMML8fosdNSEHIaKb3d/NJ7wWMZGC4sW9ZvcfP+ugZHo=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr4771097lfl.367.1667206390032; Mon, 31
 Oct 2022 01:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj873res=PuBbMB-ffy6=ek-8UFNt+QvYru1dKdU-VjuWg@mail.gmail.com> <OSBPR01MB1845B7BA1558188406E85D23DC379@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1845B7BA1558188406E85D23DC379@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 09:52:58 +0100
Message-ID: <CANNYZj9U-KBCsC=6aNZ5LJ8sx=XqBCEVY2m75U8xZjb5k=7CCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172297

You need to explain why this is useful to the broader community. What
is the use case? Each addition to oe-core adds to the maintenance
costs, so it needs to be justified and explained.

Alex

On Mon, 31 Oct 2022 at 09:38, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote=
:
>
> I need to use nativesdk-systemd-systemctl.
> I added this file in meta-oe, and the maintainers received it.
> However, they suggested that it was better to contribute to oe-core.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Monday, October 31, 2022 4:24 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
> >
> > You need to explain the use case. Why is this beneficial to have on oe-=
core?
> >
> > Alex
> >
> > On Mon, 31 Oct 2022 at 09:17, wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../systemd/nativesdk-systemd-systemctl.bb      | 17
> > +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >  create mode 100644
> > > meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> > >
> > > diff --git a/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> > > b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> > > new file mode 100644
> > > index 0000000000..66b5ec5e6e
> > > --- /dev/null
> > > +++ b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
> > > @@ -0,0 +1,17 @@
> > > +SUMMARY =3D "Wrapper for enabling systemd services"
> > > +
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de
> > 20420"
> > > +
> > > +PR =3D "r0"
> > > +
> > > +inherit nativesdk
> > > +
> > > +SRC_URI =3D "file://systemctl"
> > > +
> > > +S =3D "${WORKDIR}"
> > > +
> > > +do_install() {
> > > +       install -d ${D}${bindir}
> > > +       install -m 0755 ${WORKDIR}/systemctl ${D}${bindir} }
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#172293):
> > > https://lists.openembedded.org/g/openembedded-core/message/172293
> > > Mute This Topic: https://lists.openembedded.org/mt/94680777/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > [alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

