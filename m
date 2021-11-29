Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3ECC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 04:08:13 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.56346.1638158891441194995
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 20:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jAAJyqB4;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id o17so15273604qtk.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 20:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4BZdCpEvd8zmozNVHJ8gPpxRqL/LqBxxcO+CAyIQUXk=;
        b=jAAJyqB4UzX3L0pBq5zCS6XAzAAuRJUgKZiq0q5t/gvBfpa3GmrDjew6XW2PXZffrQ
         Dz7upCeLEfFmbyED3KGdZBJ7+jL+ytiZYGy6cnwnZqVe7s+fcArEKBAAczzUv2xHUMu7
         M1+ZPN/oKpsCfT3dBMdBz67G/l5Q7ryEOum+nGt0/jFm/czcqGXO2s6THEVDTnRCdZVD
         9n6OQtVIFwA2hUF+gmscNe6ZbQIr+RaMNncsBfdwiFtZqCdF4lcPA2y7Lj3qr0aa3j8r
         NzaerSC0KUoKMZf6e3ghq4XlTZVpVXKaNU5BTmSCtaLLvSZmpXonWa/7TXwDS8tRuxm7
         trFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4BZdCpEvd8zmozNVHJ8gPpxRqL/LqBxxcO+CAyIQUXk=;
        b=V8WaFKytmFxffXIc8eOL10O1L5EaLF3R8ycmjorF9tJZmaN94PiYl2pjxu/so9sjUL
         3CC/7Q8i4I6eAx7SZ/XPp0o791xWZ67fnLNEZkjL8qXlXX5fb/bUYubRfqSnjvP49pcD
         fXyevxUzVNZX5h9fcVdqaThh2pvEvS+XggTE6H2yr+9ZTzrLXsbYMvkSz72rjAHMy6nv
         G8nuYePttUUTehrw82cdZb9gEiivNFE6PIEiaL01ZoLxMVMadE5FfF+86vz+NGezrklH
         8HgcHcfhs8gvZRQ3xRLEdqYYES4L60nbz9SMkvaq1iyJbhBR7Ema+ThrKSe/0VwBGgOG
         4rJg==
X-Gm-Message-State: AOAM533lnsBfLrl6zait0m9LnQ6LB1zdipqOrSLcKW5+sagEivPHNtwd
	Gu+MGimH/tj0o7+AEn1Wytg+m4W0r8pataGnGW2yKhqErY8=
X-Google-Smtp-Source: 
 ABdhPJzLcP4UX6ft8CVs82W4gxi8t9ezlyWR4skzUNHdTuYlf7aKZl/OCF4T4XEMjxKOmhui1++JnoGZmivdT5VqF4Y=
X-Received: by 2002:ac8:518e:: with SMTP id
 c14mr32155158qtn.665.1638158890229;
 Sun, 28 Nov 2021 20:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20211127092239.4144840-1-raj.khem@gmail.com>
In-Reply-To: <20211127092239.4144840-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 Nov 2021 20:07:44 -0800
Message-ID: 
 <CAMKF1spxQZMirvqGMQQy7Dj=wzDk2h4H7xasQR36S9UihHJigQ@mail.gmail.com>
Subject: Re: [PATCH] weston-init: Pass --continue-without-input when launching
 weston
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 04:08:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158925

hold on to this one, since this option needs to be passed selectively
only when drm backend is being used.

On Sat, Nov 27, 2021 at 1:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This ensures that we do not need keyboard/mouse or other input system
> Weston's default behavior is to not open if input devices are not
> found, but we may not always have input devices connected for systems
> running weston in field
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/wayland/weston-init/init           | 2 +-
>  meta/recipes-graphics/wayland/weston-init/weston.service | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
> index a849f29bcbd..f74ac8b1846 100644
> --- a/meta/recipes-graphics/wayland/weston-init/init
> +++ b/meta/recipes-graphics/wayland/weston-init/init
> @@ -32,7 +32,7 @@ case "$1" in
>          . /etc/profile
>         export HOME=ROOTHOME
>
> -        weston-start -- $OPTARGS
> +        weston-start -- --continue-without-input $OPTARGS
>    ;;
>
>    stop)
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
> index e09625b31c6..c7583e92e6e 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston.service
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.service
> @@ -34,7 +34,7 @@ ConditionPathExists=/dev/tty0
>  # Requires systemd-notify.so Weston plugin.
>  Type=notify
>  EnvironmentFile=/etc/default/weston
> -ExecStart=/usr/bin/weston --modules=systemd-notify.so
> +ExecStart=/usr/bin/weston --continue-without-input --modules=systemd-notify.so
>
>  # Optional watchdog setup
>  TimeoutStartSec=60
> --
> 2.34.1
>

