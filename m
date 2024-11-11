Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F03D2E9D8
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 11:03:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.56783.1731323035102942521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 03:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OWl2Owxz;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so6633345e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731323033; x=1731927833; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRSGpAkDttmJcFuYQ3R0A3/7qxs70PMtDWwM8CTPeJM=;
        b=OWl2OwxzddxsMuZKp4cJZGyaMlDJ4ZLKSIfeIxmGgPr1vTJBYyNuNCsyktq6wFVIun
         Ydr0DbpLjfk5OimhLx2MZaI3Ce0oakaKMuIRktbjaqRAlpTiLpOTpIos/iOTG4L4lW1d
         CufG4QdQGbGcwxfI86Eet5Rct5M6b9MVGEDV5rdyLCxHsNzGq/31dj4Eouyxa89DoW1z
         vnibimPaWe5dUz7p/Y03vX/5o+Yl6j4R9osnb6mQv0R/Yv/ZmCmWIP3HeJBHY0N6rjzC
         EqIQmaOh9d/jCy3c1dNHryP8gh7czbPbXZQPLWlB2+p2u85ZQa2s8IODYxJcJXP7/qgb
         v96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323033; x=1731927833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRSGpAkDttmJcFuYQ3R0A3/7qxs70PMtDWwM8CTPeJM=;
        b=UtIcljSTFL9AeB8NOy8lGwTxPBwCxshMRaUbxtjP9ctmu+DxzXdb431IoasHpUCGZ8
         ChU1VToXnHNJ1bk8VO5b0tT9GtWpmy8qNvrxHkQWz+22Ja7hFfmHwNNOew7m1tID4aR5
         OLVhx7R5pDAudJTj+Lo5k7rRt8Wq+URFpr8bWxpv6fBjnfCAJ4MZOy4FK+mt4dyU3ASO
         0xG7A30KTLgps9lYhCuhNJ3dhL4o33NCgEGApvi/xUHnLTu5qD84caJf2pgcX1jxjVj5
         RjYv3sOxMsU3h48Uy3M51A+eILV26iOuqLkBdL2KXKvebZIFX1eJHUJHMUHTB3vNsVf4
         MGiQ==
X-Gm-Message-State: AOJu0Yxmgg8/ZuWIlT8uozp01q8lo3zV1e1ZZId7+1DR/LkzmfhneTsn
	xsZiLqt/Nf6yvDHfHwVPSQKksommPmlMQNnDhiUSdEhTTg26a64lixswkyjgDcDord9Oi7q8JYe
	dBnjveEgr7gkS895dSzWueNGe3pc=
X-Google-Smtp-Source: AGHT+IHFrUwTBRQQOQNQeqnIOXNDdBKMoGCpN2sUGQba9mpQU0295psfMxRQEjxyvZQSJtQsfyKrJEftX4dMw5cOkho=
X-Received: by 2002:a05:6512:ac8:b0:53c:7652:6c9e with SMTP id
 2adb3069b0e04-53d862f35dbmr5535811e87.53.1731323032914; Mon, 11 Nov 2024
 03:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20241110132848.2135721-1-f_l_k@t-online.de> <CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
 <1806A2E5B9CEF1AC.19665@lists.openembedded.org> <SQQQMS.OQC2MWOKNELB1@t-online.de>
 <CANNYZj_AK7rWMRkkiincd7TZwWX4+iYziAM=UG5kOmKSC9nvSg@mail.gmail.com> <5HUQMS.SMNF3CYKEZ7C1@t-online.de>
In-Reply-To: <5HUQMS.SMNF3CYKEZ7C1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Nov 2024 12:03:41 +0100
Message-ID: <CANNYZj_2HANLQY6K6xxMNEmUWqy13ERY6vje=msh_uwfC05UfQ@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 11:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206946

On Sun, 10 Nov 2024 at 17:41, Markus Volk <f_l_k@t-online.de> wrote:
> Shouldn't this go to meson.bbclass then? It's useful everywhere.
>
>
> Presumably yes, but I just found out about this command-line option and d=
idn't dare to propose it for the whole system without checking the impact.I=
 have some other stuff I'd like to sort out before I can have a look at. Fo=
r now I only verified that systemd builds with oe-core and poky for qemux86=
-64 with glibc and musl

You can totally propose a patch for the whole system, if you clearly
note that it was not given broad testing (but building as many meson
driven projects as possible with it would be appreciated). We'll take
that into account, and throw it on the autobuilder anyway to see if it
breaks everything, something or nothing at all.

Alex

