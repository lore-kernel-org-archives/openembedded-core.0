Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B14C27C40
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 00:33:03 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.80041.1700699577988815067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 16:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RKVtJDlI;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: raj.khem@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4af6a700086so128282e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700699577; x=1701304377; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fICn/BY03LEi97Hsd+uCGdiWf1N5vvNcfUlmYiYng6g=;
        b=RKVtJDlIltiyf13Vm+Dwz/Pz4h3rm2w8rzLdCzd4U7fOSVOgtoSpTfeiVxONN/8H2s
         THM2eNqfhLyt74R3gZeP16J07MEr2uGb4oiMhokzj5IewuoK+CMs2uQR5vE5PXumrR77
         xGqX6YArsbLF+0dNTvrSXohvnQQXSC/1esHLMX81YCL5EFb494O9pnIZUN6cSvPnprEw
         jLHhHJaaAxYYQls498jb4XK7s5yUADFlB3UKRc/pparfeWmfjmIXUp0hDcgL5cvTDdBE
         7Gd02WSOl7EPstsfXX1gceZ9fqoApXHFI9AkdZAprRu5iWAlJJIr24LNXyJJqv5f1ZXg
         1npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700699577; x=1701304377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fICn/BY03LEi97Hsd+uCGdiWf1N5vvNcfUlmYiYng6g=;
        b=MLsPILpC6LsZNZKtyPk6dGz+EayUIEomfebO7d8K1L8W3N+L3D0mqiL3jwf4Dsf/Rv
         S5N2/7TyHt14C37W1oA1X0mOwLB/LN/tp0uMINH85USW9QUhQmPBCdBRSfSAD6AGmdno
         SF6KDTYzBtKWmr4NZvrY5fQMe4/rOo85aqkpZjPPWNu+8iWr7T/kBJrW1/5qkHAM8Z1C
         RZF0AvH0RbIZ8D1f0cHTQq/VHy32iaS1bEChdJaMLGW6G2RaUBo9zyNO3K1YJTfTQMXv
         s3D1RAY3MK49mEM0oVoeDXT/+kxhKGgTvhS4h1nzM04YanAaSmZx3pW6Pm2RZ4k6tALy
         sPWw==
X-Gm-Message-State: AOJu0Yw1rXw72dUfskoFVQSyBokJ4VHhn96zZaDmL275tWAV2ZF6Gs4v
	lZ9RLhkDSUnE0jbsVu3YEDJ7dg0ywt4XPFfMIBs=
X-Google-Smtp-Source: AGHT+IFT2sqLviUng44OGmqgskoIYM3A2xG56c47xnZMwF6K8OK5BFTGt5gF2RYEIPX4kXR58MubU3Rbp9uZSh7HR88=
X-Received: by 2002:a1f:d946:0:b0:49c:79f3:27a4 with SMTP id
 q67-20020a1fd946000000b0049c79f327a4mr4501148vkg.3.1700699576939; Wed, 22 Nov
 2023 16:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20231122220508.3148727-1-raj.khem@gmail.com> <AS1PR10MB5697BBD21B74897C9B766D73FDBAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697BBD21B74897C9B766D73FDBAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Nov 2023 16:32:29 -0800
Message-ID: <CAMKF1sq8P-ER-AmLdwkQJaavNh-=YyAWGkihBvi3N3b_zfU3Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] init-manager-mdev-busybox: Keep sysvinit distro
 feature on
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 00:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191127

On Wed, Nov 22, 2023 at 2:59=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
>
> > The rcS script that busybox-init provides is able to run scripts that
> > are available as part of sysvinit, therefore its fine to keep sysvinit
> > distro feature enabled so that we can build complex systems with
> > busybox as init system.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/init-manager-mdev-busybox.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/m=
eta/conf/distro/include/init-manager-mdev-busybox.inc
> > index 12091cba68c..a5a61bbe4d2 100644
> > --- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
> > +++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
> > @@ -1,5 +1,6 @@
> >  # enable mdev/busybox for init
> > -DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D " systemd sysvinit"
> > +DISTRO_FEATURES:append =3D " sysvinit"
>
> I don't think that this append is a good idea.
> I want a small, lean, controllable init system, not a complex one.
> This probably belongs to distro or to a new INIT_MANAGER type.

That's fair. Although one can easily build a full system just with
busybox-init like this perhaps it should be a separate INIT_MANAGER
perhaps eudev-busybox or some such.

>
> > +DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D " systemd"
> >  VIRTUAL-RUNTIME_dev_manager ??=3D "busybox-mdev"
> >  VIRTUAL-RUNTIME_init_manager ??=3D "busybox"
> >  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
> > --
> > 2.43.0
>

