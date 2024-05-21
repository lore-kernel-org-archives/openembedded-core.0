Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15ECC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 13:54:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.20248.1716299680356230812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 06:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=O9WIMzdt;
 spf=pass (domain: foundries.io, ip: 209.85.167.48, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso2485765e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1716299678; x=1716904478; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIzTAqjVaLeyWmFk8wNS5ubb6Rxei/qxXTo7LybvPlc=;
        b=O9WIMzdtwQDDTZAQ+5IofP6IRIOKq6CG5GLCuZWyNbmw+URaoLH3HF/wAXHvb03NjA
         NwMFHFWj5AttbMgkqHx2+Emk4nPNB2pUybQceeHcdD9nuNSX0rER+cApkrYl8CX0gBXB
         f5DEg8umdtMhvjM6Xbh3sqKyCk9VIDYuAmcaebhRiZg+brLb3rL/EnEF/u57lglJyX02
         tqVI//ChWxI2YpW6h+ESylUwH2x5IDtb8gYHYkOOpU0d9Nvvvp+aSyQb5vlbq2BQeIGf
         rfjwkgRonj5wYsOy2ZBcxEGwOxkiLtfgo34a8MvD7qbzvPwrO3sRDALuC9eDKtnJDrbI
         Wwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716299678; x=1716904478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIzTAqjVaLeyWmFk8wNS5ubb6Rxei/qxXTo7LybvPlc=;
        b=CBsDCLRUElX/gFvNZ4NsDI/XiJesWZM5PvPPhBaeAgJKh9SsQ16WO3h3b3RYLDfTsy
         Kn856GzQdrNfdkeCABft0LnSpbC9scTz/CRIMgiJ2S6syhxsfTIgSU93d9hKNXHAuOau
         RHCm3rj/IXLFC5/K08Lvb8NCpZD9bovLopZYyQ4zMuciUezBVaCXHRoVz7WaKLbXvqON
         heO8SzRsDosUkxwFLjsDxaurO6bk5Vg8sBF4l4QOHUefZmYJYg4QDrCA9RcjxTd5Nwjm
         XJmdQwY1dxmnwEDkDYDGeLdF2zzovysRmC8iIh2TWgCWwNA6PRPwPoG3Z5oqGbwAYvYs
         skYg==
X-Gm-Message-State: AOJu0YzD6OZQLAKCc0rUNvGr35NpI+KjZP+chTHGFEpchygAcU0ulfRU
	ryrUu58+JXAxxGupkUjUlhBceW6ABVX2p0GxV1hZzn3GBw+HHpFy5Z495nyQSGEHRoj2yjtUXU9
	avxOytL9oHaYbUCk5iGI3eCdrFaloBGvbkG0GfQ==
X-Google-Smtp-Source: AGHT+IHi2iNo7YKZDBOMAFQjlDtuVejMjROTrepPSlcyd1XdMY9sXlkdVIipu/kMzrFex1DjbwfCgeWa7MAaInjNem0=
X-Received: by 2002:a05:6512:304b:b0:51d:162e:bf9e with SMTP id
 2adb3069b0e04-5220fc77af7mr23042378e87.15.1716299678233; Tue, 21 May 2024
 06:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240520153106.150218-1-igor.opaniuk@foundries.io> <CANNYZj8TiMHaZ3OjaBYvuyVW4g8HGsRAy=kb=LBvWaaAPPjbTQ@mail.gmail.com>
In-Reply-To: <CANNYZj8TiMHaZ3OjaBYvuyVW4g8HGsRAy=kb=LBvWaaAPPjbTQ@mail.gmail.com>
From: Igor Opaniuk <igor.opaniuk@foundries.io>
Date: Tue, 21 May 2024 15:54:25 +0200
Message-ID: <CAL6CDMG+NX49604qiBDG6qdn-LVWdfMf-qs5j9UfDWYwzA4Cuw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/1] initramfs-framework: support force
 reboot if fatal error occurs
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, jorge@foundries.io, 
	jose.quaresma@foundries.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 13:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199642

Hello Alex,

On Tue, May 21, 2024 at 1:17=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Seems ok to me, you can resend without the RFC.
I'll just send v2 without the RFC tag, thanks!

>
> Alex
>
> On Mon, 20 May 2024 at 17:31, Igor Opaniuk via lists.openembedded.org
> <igor.opaniuk=3Dfoundries.io@lists.openembedded.org> wrote:
> >
> > Add support for force reboot in the case of fatal error. In some cases
> > it's better to force reboot (especially when hw watchdog is not
> > engaged) instead of waiting for 3600 seconds, for example in order to
> > trigger some recovery procedure during next boot procedure
> > (after unsuccessful OTA update etc).
> >
> > ALso fix indendation issues in the fatal() function implementation.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> > ---
> >  .../initrdscripts/initramfs-framework/init    | 23 +++++++++++--------
> >  1 file changed, 13 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b=
/meta/recipes-core/initrdscripts/initramfs-framework/init
> > index 567694aff7..e3d8caa0e1 100755
> > --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> > @@ -54,17 +54,20 @@ debug() {
> >  }
> >
> >  # Prints a message and start a endless loop
> > +# Force reboot if init_fatal_reboot bootparam is set
> >  fatal() {
> > -    echo $1 >/dev/console
> > -    echo >/dev/console
> > -
> > -    if [ -n "$bootparam_init_fatal_sh" ]; then
> > -        sh
> > -    else
> > -       while [ "true" ]; do
> > -               sleep 3600
> > -       done
> > -    fi
> > +       echo $1 >/dev/console
> > +       echo >/dev/console
> > +
> > +       if [ -n "$bootparam_init_fatal_reboot" ]; then
> > +               reboot -f
> > +       elif [ -n "$bootparam_init_fatal_sh" ]; then
> > +               sh
> > +       else
> > +               while [ "true" ]; do
> > +                       sleep 3600
> > +               done
> > +       fi
> >  }
> >
> >  # Variables shared amoung modules
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199595): https://lists.openembedded.org/g/openembed=
ded-core/message/199595
> > Mute This Topic: https://lists.openembedded.org/mt/106205536/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations

Igor Opaniuk
Senior Software Engineer, Embedded & Security
E: igor.opaniuk@foundries.io
W: www.foundries.io

