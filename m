Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46460E64004
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 02:19:21 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28602.1775355551929215461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 19:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PzmLbD1l;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-47018d3416aso687400b6e.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 19:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775355551; cv=none;
        d=google.com; s=arc-20240605;
        b=iyxfKm7JKxvbV0uTKW9h2klGghxU/N/IXJSD2HloADAdw67RuKIKmKx0nwkr1f6Nox
         XJrxcI7uH9vcPhwXaijBqy6SD3AhIAGPslGz0JLqJWj6Ga8PJAf4Gc0sFV3WznpeKA2r
         RQ6iNhRH/l8BlrdOnbdzi1juNmXTE80E8ngwRd9VNVxIDWPbTCRiH+GQmsvhc1TNHXSh
         85WoYr07XxSxOYISTQdQeSBf9iCVGPf5zMFc7nwKK72kpkN6JWTzMffUCg6Q1KtY5tLv
         h/Lrx9zozZT1bgxSLeX68sWZauJWTLMSb+yOywfgljLiw+WjojZ7w49JqPH9V567sM13
         i0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hJ+F3zzQBTg4hYqnM4rI+rXUO6t7Nmp7dOMw+mzFGyk=;
        fh=ZOF5V285Os0vFzKOifzdKQwUJEta1eQ3tlo86y8k8bo=;
        b=b+lTRXzuw6ZkVTUa9W/7lprtnyEzyGoruirIZvtARVEvBBhg/qxY0+JLLXAlaQP8nl
         RuODNLLr0GO0nuYX8hauH+ZJTMauqYWshkVxpybPBj1N/eyFQxZWdB8c7XBpnYm/doq+
         ue5lB31nfS6CccRM2cqJbYBJDiD/utJy+KuWzUv1aHCNoZyTKBPO7qCWuIAZREEnD3XK
         l1roJMalF4xoG5aCoL06YPu97OPvU7B5wOzZ1hUTeyKZ6Pzfs9hQvcrS1GRfhhX3rLAp
         5eKe6cy9zrTPME0igekPQk+Q81YhXAprq6vzHtbQNuWZtHp30v8UL2oG2rXVPLPvBjv9
         innw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775355551; x=1775960351; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ+F3zzQBTg4hYqnM4rI+rXUO6t7Nmp7dOMw+mzFGyk=;
        b=PzmLbD1lAwm3U0zdkyr6XsAHx9C0aznqRi1YvvOh2+jXxXcJZjo1xF9MJk4W2Y3dF1
         t8/U5dmFDJeH8hqnX1/6afu1zJkdcwDHSvix+xEy0W91dPw2BG0t0prW6EhUVswVWsn9
         f3GUjJ3ReJQdHtNatcM1ZraisIgaKzkXURWqP/2hKkwt+PlOTSLS4lk91I+oy/EtPjgm
         edS4xtkBHW5iF99XQ52wRazXs4gV8YIekCC9Xd/b1g5CdjszqG1/ata4tyrS6FbpDw6H
         nIvlTEE0uN9fuLIAYf4Iyetfp1S/QFGZmGP4OggBHLbET35eiAm+CQYIxPY4l1M837sB
         qDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775355551; x=1775960351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJ+F3zzQBTg4hYqnM4rI+rXUO6t7Nmp7dOMw+mzFGyk=;
        b=NBQ/MuAR44KoSaQEuk+xJ1tB9ApPJJ3TELQ6xghxOm/vq7MdPvP0If/vUe8V1Ves2h
         z8SgiXClrRq+sz/ZCO7DTiOORE/2cKde1kX33G7pYAh4XIpFpnonrC4oTfTHJBWus2ay
         pLIHMbC3o/dstaGd4UmcAlZeSkma0xuV5HrDlbBXU5rqtWFoV6jEF3tbfMIZ1F4EZq7l
         xanGVBPU9o5TcaIvQUsQFZhLzAlCrwkUvlcZ9TBoHpl4nFelzktoC1yhhKHJI63N6z+k
         5D+HWWO4zmE5AV/P7HJSC8O9UyuMVtkaOyHf7Zv+7o00g7m5PqgJQRKIFWMxd/zjLiZZ
         g3kA==
X-Gm-Message-State: AOJu0YxXCkbmswG59J57uLqn0+9RGlTZ9jGPBBgC5VXz+qjN0ttDa+Is
	61+EnDN4moO+QjUNF1wFgUuSyCEglGbTtewJC3YKrFNWliR0ZtPvRZE+0oAa5Wn5N/tzeD19xiY
	hX14wOiFmnaKk3rzlgvCRKH8bG5NLe2c=
X-Gm-Gg: AeBDievHsWdUtCoOxZFd0Q0rTqqthEwc2mpxPXuNdzblx6I8hhLpiuuEPwq3KM2ogup
	l910Xd1r+/3H6oPWJ7j5RXxmVMGhJeiNc19t+hMGkMpM083AZd/ZpxqNvnyG1AwN52+jDnfTXsj
	GTR4i0TcvSaHkCRcTNEm1Qjc/roXWesfIu6uEP3nnUTEaM5ZTpcStjbJU30nEa30uINbxMRkPj5
	DhKT+9tlBJ81eaBunnXMuQacU1LeYzCZKBnDnC1wUUIfYZq2RNF00XxCiAH9eF+QeTheTrE87o5
	4qczrLu8
X-Received: by 2002:a05:6808:1a09:b0:467:f150:afbc with SMTP id
 5614622812f47-46ef851ee4amr3900833b6e.6.1775355551107; Sat, 04 Apr 2026
 19:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
 <20260325021856.4053666-7-ankur.tyagi85@gmail.com> <DHHWO7MO7KHD.1VQQRFF9Z3TC0@smile.fr>
In-Reply-To: <DHHWO7MO7KHD.1VQQRFF9Z3TC0@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 5 Apr 2026 14:18:59 +1200
X-Gm-Features: AQROBzCsvvWHcHOXYjf3SgQayZR6QpUrTabBRL_VdeSKTWYRYetdI90BSsV20Wk
Message-ID: <CADySD0ENzDKBtSyYho-pBExQQJCOVapj7ebjoUZLpKgKjNS-=g@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 07/12] seatd: Create seat user and
 package systemd service
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 02:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234624

On Thu, Apr 2, 2026 at 3:58=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Wed Mar 25, 2026 at 3:18 AM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > With latest version seatd does not work properly if
> > user access permissions are not correctly set, therefore
> > create 'seat' group and package the seatd.service file
> > and enable it by default with systemd distro feature
> >
> > set logind to systemd when using systemd as default init system
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 26746a02fc94b569f633d581b27a8634cfba38f5)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta/recipes-core/seatd/seatd_0.9.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core=
/seatd/seatd_0.9.1.bb
> > index 3be27dda9d..f9f72c9e82 100644
> > --- a/meta/recipes-core/seatd/seatd_0.9.1.bb
> > +++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
> > @@ -34,6 +34,8 @@ PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystem=
d,,systemd"
> >  do_install:append() {
> >          if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
> >                  install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/in=
it.d/seatd
> > +        else
> > +                install -Dm644 ${S}/contrib/systemd/seatd.service ${D}=
${systemd_unitdir}/system/seatd.service
>
> Hello,
>
> The patch content does not match the description anymore (no added seat
> user). Can you update it?
>

Please drop this patch.

> Thanks!
>
> >          fi
> >          install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${system=
d_unitdir}/system/seatd.service
> >  }
>
>
> --
> Yoann Congal
> Smile ECS
>

