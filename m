Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CD2CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 14:39:18 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.16886.1726670352429016171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 07:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lEbnlz65;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e202003bceaso955488276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726670351; x=1727275151; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj87o0p/+CZSw+3eH0zv0jfrHHM5Ga69UeNR7n/b/g8=;
        b=lEbnlz655MS/kXfYrYtGrqY2fgY3aBnhI2OlgKH6KK/G+8yBh+BBVaCIa91V7WhBzi
         2sfiYmVIiZwLOlTgNKfdZVotS7cGmlEZT+uIRV2+lekEWUVVzsE8IrilGB/IcJv6M29h
         hnzUOTz15YuD+LzGqYRYvBpOuvGY8tbI7Ln9Q2du8fMLP3x9OQmiqqipg7beV/lteymh
         T/2S8FQcMQ1VtIkBuf+vfxQLFG4P0T+Wogm5PLTIYO3x6HFVcTcGhE6cViHEzLNVQhFU
         QNY3XpuMpJG5UiVyjq8G3WLNLdT//TpGPW10ZIMDx1G0Hm3eqiYASB0Is98WqTKW6sZq
         VS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726670351; x=1727275151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uj87o0p/+CZSw+3eH0zv0jfrHHM5Ga69UeNR7n/b/g8=;
        b=DMJKD0eHCulQqa7C9dpGiVo/THJ/ql/Tdyb+kXK6ETuBQzxhcE75f2blxH7mttKGOa
         xm9prZXyBhJBXHVDaIqzlntq60cyqOnBps2jWUo7zttTzcY/kIQFg3HevIOA1XqQurPy
         xFPOdPN5JWBb1nMo7UYkbXkJHDRarwvGnyOcoTKlsPooSymlZ1dE4HKl+GLLujMNMnsm
         foZWW5cFbttl1s3qofEe07CJD1zXQiLjrzh+ZnTPnzpNhF5hY5DjMySliWkClpt1CM3p
         GRXaXlpbyThOHQ9piVY9eap9irOhk9WGnLrEF7rj9LkwrTBjI97G8QKCag8pGWQ0foIb
         mnMA==
X-Gm-Message-State: AOJu0Yxk9BzHVBFRUjMT7WZ1IYdfgZ5k0BNZyzPbFXkax4riS95uZjpB
	BD7fbkMLMcc2mnyi4b4J/2tYT77x5c1Y33GQu+XZh6+DCMBS2W22SRPiUB1Oro3A19gm48+ubSY
	owKx3n5RfposNtG8RZv5/JkU2AA71IJeI3Qe7cA==
X-Google-Smtp-Source: AGHT+IHePRaJY0W2AOVMH36rwfC88VDc2ME4qjyFmD9ZIEHstIxbeg65PqdJ34xLa+uDsF+efSpREboEs1YITKiKjaY=
X-Received: by 2002:a05:6902:1242:b0:e08:6f3d:3a41 with SMTP id
 3f1490d57ef6-e1d9db9bd28mr19695619276.8.1726670351516; Wed, 18 Sep 2024
 07:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdbQ0wgTTbs-PB604CrvsKTxgiRGhy7x5PYUemUztk8iGg@mail.gmail.com>
 <31078.1726590855634409156@lists.openembedded.org>
In-Reply-To: <31078.1726590855634409156@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 18 Sep 2024 07:39:00 -0700
Message-ID: <CAOSpxdZu+mt-HtSAJ=-ybYQH4fs91UMT3+J_9EaijZqGD7t-Dg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] python3: upgrade 3.12.4 -> 3.12.5
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 14:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204647

On Tue, Sep 17, 2024 at 9:34=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi I suspect this patch needs to be backported at the same time (see link=
). It was added to master branch along with the upgrade.
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dde569ddffd5ea=
36b70c56df21dec9c892e5dee7d

Thanks!  I see that Peter Marko sent a series with this included, so
hopefully that will resolve the issue.

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204626): https://lists.openembedded.org/g/openembedde=
d-core/message/204626
> Mute This Topic: https://lists.openembedded.org/mt/108303922/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

