Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4302AC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:04:46 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.293.1741799085133082515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 10:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ps0U+Pyp;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30beedb99c9so681911fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741799083; x=1742403883; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvhVGasXVJ9y4bSsndRcuU5sLx9W45SXMwgHmWg5Za8=;
        b=Ps0U+PypWT/CS4C3dNNBSFY8sgTQGEW3o+GjdSlz2nRfCELgHy7okXphw6mf11s2qU
         yPkZOUdt9zEKfqUx5XhT/AJ8tQxYpemPMLKR7bHdiv5eLrAUFVo731+pLnH+eJfgQwO7
         deNeVCPle6/HgBqckgmHy4W57QPXO/knX//lDZFZx7gd1SzraFfSVLivBUBJ1IijjeFw
         RI1TIOa2ueGDMPaDXU3JR1ATocZY7UV28BUkms1P7wx888uAdNSamc+nyZX/26igG82T
         /f4UkIu3wewSnBW2K049dLjDgq776tTI8i4JGbwNjYRXyWMFQ+XdnbPgoa4zmsV3gVb8
         8mNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741799083; x=1742403883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvhVGasXVJ9y4bSsndRcuU5sLx9W45SXMwgHmWg5Za8=;
        b=Q3vYXdY0luY7eH3HNEJTPHBkGhXcASqq2gDtle0qzJ1p5T6/oF1y9/6PJKewY3MNkT
         3uD86J0o8qUZJGVGsf2zHlK3piQEr2kHmo/ORc+sXTrNy36mp4wS7Inse4qryPRs5dw8
         X7i6Qxock3BTYXbFta6cELOjOO8E4Nc/aNZBA+pdre4jMIbr5S+fIucCkX8QD5yOW5ay
         +4J2C3QBER/tRGJafOpRck2u6+NYxXeB4VXAq7dGICdxWvYCBVLLZWgf4ID8CgCgl7mz
         gL89ATFoI5zuRl4Xq4xylIWuU8TtQxiQoQWKF1gFwkbHYo7KvEP7cjsmr6nzPaCcKE2n
         KymA==
X-Gm-Message-State: AOJu0Yz7BjYyZ8kijim7SkQscOEqCQG2RsgMqOQQFNkTczV/5/xePMZd
	PwCiOQCkgduuYCwqwvQMtBh405wjA01x52RECEaFlgcdrIE8dczm8oJwqeq9eUebiBbcOMnA2Vs
	f+pIdlj1QXw+R7RFfU58DrGB8+ds=
X-Gm-Gg: ASbGncuf52UdOpxSh2KDPNpvcWapu+6IcUxmvfnHEjxKM1I5gRdZt4AK84cguyJXIU8
	hyevpDGT//SsNuSJVwyFIP5F+a8YwiIxcKkmxjnDvfB2krC3tniYVvwbxg+eE3IJCptFFfpd7jQ
	dpy6o65hCGopK1vkYtaRonP/cj8KQRHAW/kqcm+7qihHa7Gs58X2ThVxOIt+D9kZzIBA==
X-Google-Smtp-Source: AGHT+IFbH/rl+PHUOAk5ZwqrHdduJ8KNbZFYyir3Lcx2Nh3m2undUESdAVTbQtAZrXTBjvqdnGth8bao668ZQ0ek7rY=
X-Received: by 2002:a05:6512:3ca0:b0:549:91d3:4f0f with SMTP id
 2adb3069b0e04-549abaac52cmr3051602e87.11.1741799082912; Wed, 12 Mar 2025
 10:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com> <a3091594eeb572a0ec11a356a6ddaeca0081b602.camel@linuxfoundation.org>
In-Reply-To: <a3091594eeb572a0ec11a356a6ddaeca0081b602.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Mar 2025 17:04:31 +0000
X-Gm-Features: AQ5f1JrzdAdvYpah_n2DYV5a14w2NNV-M9pUEBRewXUaYFoz8FjFsHZIDKdIvIU
Message-ID: <CAO5Uq5Tx3051KLdjZdTQYavL5vNaoBoJ7DU-v4fr-hzfqB3G2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core 0/4] Upgrade kmod 33 -> 34.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 17:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212660

On Wed, Mar 12, 2025 at 5:03=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2025-03-12 at 13:00 +0000, Alex Kiernan via lists.openembedded.or=
g wrote:
> > Bring scdoc in from meta-wayland to support generation of the manpages.=
 Convert
> > to meson from autotools. Clean up usage of kmod in eudev.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> > Alex Kiernan (4):
> >       scdoc: Import from meta-wayland
> >       scdoc: Upgrade 1.11.2 -> 1.11.3
> >       kmod: Upgrade 33 -> 34.1
> >       eudev: Drop --output=3D... from kmod call in init script
>
> Throws lots of warnings, e.g.:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/1175
>

Grr... I was testing systemd and had left usrmerge in my config... will go =
look.


--=20
Alex Kiernan

