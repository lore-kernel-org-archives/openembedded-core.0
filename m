Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.1960.1608249075033438190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 15:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sg6nBrwv;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id s2so448573vsk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 15:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OjUpgwoC4FVwpeKXELoBISZdmY7jfFsqn3+qYjTGr6o=;
        b=Sg6nBrwvV3nJY9NKV+lNZxg+i2mFFmMUbZubfg1QkhqPXjB0k0Bl3xtBNm3g2s8Nqn
         /TH1SBSP012KfiRBacskrj2hw6YpMNyXRZ3d6dgTCCQtflZlEB8qgRjz1UZb+/ke0/+2
         ffr69x1/HYN3qRIlO3TnM20UGkRuHhGOjksfk1iwqkN+evfU7MeOJDe6xsMRQiaSip0R
         WuGLuqAXbmzcvc2CxIwmLa01o+gYT4U2D0/SwItqboKu8JMSLxHbNmSW6T+4u2t2l749
         2MQ18zfp5o4P9qXmyv6IwkwVk1Nmzbf5c0lCX5zIecRdzsBl3nacwLoLWhFt5FzQUT3f
         ITgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OjUpgwoC4FVwpeKXELoBISZdmY7jfFsqn3+qYjTGr6o=;
        b=Yjs83TanccoUm+IkklZ/nLJ2N3EPdH8ZePE5/wqTSZ9WW+rQAUHEIJeWQxrNb1ln7L
         Kb2spqlUsOOXwxaGxFUwuY+95coSeHRfvc+/qxwUgpBByGPL3sEg9XR+UqqFl6graRQb
         9VfKsAbxn9/pDUsT48GNsT2GWe6/kX1eap6I0fSbgsOx0Iio/QBvoAiq7ZjjdGaAfeVF
         WEuHtVG8WKg3V0jmFwjNGC9dYcb7kjoUYmUIzPlwtr3yCiHS/LTwhVpyQ+KkNxhE48kg
         f+5vssOdJjM1tNUkKskVP1CfB0yPwQ54tDLyMh+O6sTbsz1+s6zyp2W8S4fmGLOBWd6I
         Y4OQ==
X-Gm-Message-State: AOAM531K+HmNCcm5uJ6iF0UXVZjCQNiYXvUbDPut95PAgOveLsbF9rl5
	i7Wsfr4kHz9THCCX4xbr3ReMFrI1r22KGNxX4wU=
X-Google-Smtp-Source: ABdhPJwB2fgOUqG4JXAxkO35gapWyxOgsOrofzsgKx9h9BtLU2I/3pAMwSS7jRTohZu+Du1uasUpL/TH1CQav4rKE4k=
X-Received: by 2002:a67:30c1:: with SMTP id w184mr1843214vsw.13.1608249074173;
 Thu, 17 Dec 2020 15:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com>
In-Reply-To: <20201217225440.2633474-1-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 17 Dec 2020 15:51:03 -0800
Message-ID: <CAJ86T=XXi5NtoFoQvTzuQe04gvBPizW6jjin2JkUovLCOti9MA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] initscripts: use quotes for shell variable comparision
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Helps to execute it with busybox shell

How does it help? Adding quotes would help if $rootcheck is an empty
string, but that's not specific to busybox.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> index 02f0351fcb..a63e71b780 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> @@ -74,7 +74,7 @@ test "$VERBOSE" != no && echo "Activating swap"
>  #
>  # Check the root filesystem.
>  #
> -if test -f /fastboot || test $rootcheck = no
> +if test -f /fastboot || test "$rootcheck" = "no"
>  then
>    test $rootcheck = yes && echo "Fast boot, no filesystem check"

Doesn't this instance need to be quoted too?

>  else
> --
> 2.29.2
>
>
> 
>
