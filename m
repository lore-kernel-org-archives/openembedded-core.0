Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50531C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 19:08:46 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.3899.1706555316665137011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 11:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTrC6+SZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2144ce7ff41so1395802fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 11:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706555316; x=1707160116; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71gfBIc3Uy0ZciKQX1rvVxcQNYINeKEdWegeBdDcV+Q=;
        b=BTrC6+SZWMX0ySl9X/E70+1x9ks2oXVB4z3bdQzxEyAqofr8XWRo4wnObjwe0r9eNJ
         W+OvAby23g9eA2Nnebzr01GeYqMhvg87TtLNIzmD2W+bIxpUS6uuBjOd0Osg66C/0WUm
         HoReePQ9H5EFtNVNCcyCgNIgvEjZOmshim20DAE1E4m1733KpO2p+buKt13YiAib8MJH
         72LqSd1ogeB6FfJt/TSM0/uTyyL7h5XUBO8DMqx/BUCeHNIIweOV7WIvJO9GLs9+tdt4
         8lwyAdViLLYdAKacdhRuC1bGiJAkI5tPYqK7GYKPuvg9o82XhpwyGUduAIAIXaA7yXde
         l/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706555316; x=1707160116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71gfBIc3Uy0ZciKQX1rvVxcQNYINeKEdWegeBdDcV+Q=;
        b=MtQQLlAlHfZJNr94qhiXjfJP6/+v6cTzAQyk8TDsn/gXYEkVVOHH1f/HemhU6ufiqz
         b/6BT6+i3mRNHK19oLmwQHQ4K2NBCDm9CJpucR9afmQ0iZ35D8s8bLH58JiPKriYpfsw
         /M59gEkLTFPB8cT5+pxACT1DstwEvtoIb4/2yRo8beVmrzVfYyyZWRPmTbda7DEIDDIb
         VQMHkgZ9oXRNqdcFjGTEvgtSOSmZx2no7ZRlJXN8nIzmKf4E3xBcn7XstgIx9PosuvKD
         l9cyH5dFWiNgWAMmfgGkDKCm51HWWWXcMPGyGRhP2+VFdLRp/RyuyN/tigeonfBblybR
         Qf4Q==
X-Gm-Message-State: AOJu0YwWu1KdcoSMsH7TE4nIZoWy87kZ9tsI2TzrlhCDgqHe1sxeWYG5
	SfGBZbzZbi8nSwXofYE7dzHplQwH06lWvtsb8y4rRfuDsfRa3hxJeQniDHgdtmIGVVvV7/hsBVC
	OmFdntYOrliXh+f0vnFb0XCyEuQ4=
X-Google-Smtp-Source: AGHT+IH0tTsvQCihqeLW+AvhKeRZqZG2Jk0gDPtl8k3+sKIAyTXO/AHGUL5oEoQLojANiYrl0BeJeHJadyCOsV3pjyg=
X-Received: by 2002:a05:6870:f685:b0:218:4fdd:7f6b with SMTP id
 el5-20020a056870f68500b002184fdd7f6bmr3483034oab.51.1706555315885; Mon, 29
 Jan 2024 11:08:35 -0800 (PST)
MIME-Version: 1.0
References: <3AaT.1706533990818666053.jduk@lists.openembedded.org>
In-Reply-To: <3AaT.1706533990818666053.jduk@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jan 2024 11:08:10 -0800
Message-ID: <CAMKF1srDci3KN9GdeeXVoBr2R=Bgbo07zPFGSsk5VLYAfzSYLA@mail.gmail.com>
Subject: Re: [OE-core] How to enable libstdc++ Pretty Printers in GDB #poky
To: Rahul Chauhan <rahulchauhankitps@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 19:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194481

On Mon, Jan 29, 2024 at 5:13=E2=80=AFAM Rahul Chauhan
<rahulchauhankitps@gmail.com> wrote:
>
> Hi Team,
>
> Can any one please help me  to enable libstdc++ Pretty Printers in GDB .
>
> As of now i am only seeing below pretty printer enable.
> (gdb) info pretty-printer
> global pretty-printers:
>   builtin
>     mpx_bound128
>
> I tried
>
> IMAGE_INSTALL:append =3D " libstdc++"

yeah libstdc++ pretty printing is provided via printer.py which is
part of gcc-runtime-dbg package so try
adding  IMAGE_INSTALL:append =3D " gcc-runtime-dbg" and see if if it
helps. You will also need to add

set auto-load safe-path /

temporarily, or apply a backport of this fix [1] to your core layer

[1] https://lore.kernel.org/openembedded-core/20240129190654.2553357-1-raj.=
khem@gmail.com/T/#u



>
> but unfortunately no luck.
>
> Thanks
> Rahul Chauhan
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194460): https://lists.openembedded.org/g/openembedde=
d-core/message/194460
> Mute This Topic: https://lists.openembedded.org/mt/104030581/1997914
> Mute #poky:https://lists.openembedded.org/g/openembedded-core/mutehashtag=
/poky
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

