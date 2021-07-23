Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.820.1627064167076411040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 11:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ulVQUQoE;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id g13so3412930lfj.12
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Wkr3fNKLOeAXN8EmBgvJ78yKug8r8if0OzV6/LCOLA=;
        b=ulVQUQoEYkl+/o07A+bbgDlz16GD/KkjRmIprWW/vSQ/tPWtmYibcpQdCE/gjU7mFH
         CuGpe8qssSbYMZGLNFlNLDKkNps24mSVE6tdfwZW3TPlrlsYnUqr3kscs7o2BhybOy3I
         TUAYf5yu4TmkubNqDVAcX4TrsEP968pMAhd0IVa6AgPg+HeEVNjpqeRuReMXVbKW2f8v
         7hc+wZGkdmX1MbUdqLc6APBiw2uKZ+Gii+gwbyEruzoCZC1j7zaaW4eX5qeRt9992me1
         NWC8/nXVPIkkskI6bCMJgiQUCiPjpJj2l3Z9G4qqmdgK0k8U5tNwV76mWHxS0PLvMnj4
         VdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Wkr3fNKLOeAXN8EmBgvJ78yKug8r8if0OzV6/LCOLA=;
        b=qMv+ulUzJyY4btd6jZ6Hg6xRaFH5JqYUV52hjIOtqhs4EZFOy4m6LatOzlDoj66nEx
         TPn1oqMBhA2p8y8oVj/trj50FNcPoPQsdQIKts/vcwvVAMXuUs6wpVBwKjq3LGrgZRg9
         igAn5Jy+cH1qHd8vt7B9d/RoI/9Wof/lKShJGso7xod8Dfz+b/ey+GPVVI9WtQS5aqGK
         tBIhb7tBCb31gE4tPCJY9ESUX//1QxLtHPmHWKjjIllHQ8kitD/7nRdOjffaK8EYurFU
         AkRWIl/hOAyDyeL8gvjKBVb87zxv8JCDjFx/URaMpAEfTRTojxEwAjAKwY6dfHHz7VRx
         iw5g==
X-Gm-Message-State: AOAM533mlUvZu50ZmRjaguQXYGmp/X65TAHZ7rMKQhlWYGWeF0MTe/0J
	x4xL71eQbLRrBCUplX7PLEl35ilVxkKIeU822vI=
X-Google-Smtp-Source: ABdhPJzlMJ9ivQN1ZSFnANtg3nlKcc0e87rFrMKtVjzMkmNlXLe3Jdoz3iEN6RgxqFfX1+3QtB1esJmH1+qUenMKlPI=
X-Received: by 2002:a05:6512:2205:: with SMTP id h5mr3917397lfu.257.1627064164991;
 Fri, 23 Jul 2021 11:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl>
 <CAJ86T=WmKA=aSWBF0iNv8=MiWQNu6Rj0n+3ONDKB481OZC2nng@mail.gmail.com> <17ad2a6bf52.1190799f1319848.3273288296398942369@ertelnet.rybnik.pl>
In-Reply-To: <17ad2a6bf52.1190799f1319848.3273288296398942369@ertelnet.rybnik.pl>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 23 Jul 2021 11:15:54 -0700
Message-ID: <CAJ86T=U7=keJadAzQ4C6D5xzOnJkvRnAwbo9qAs_FYW-_PC9ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs: remove ldconfig auxiliary cache where appropriate
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 2:16 AM Damian Wrobel
<dwrobel@ertelnet.rybnik.pl> wrote:
>
>  ---- On Thu, 22 Jul 2021 21:00:15 +0200 Andre McCurdy <armccurdy@gmail.com> wrote ----
>  > On Thu, Jul 22, 2021 at 2:48 AM Damian Wrobel
>  > <dwrobel@ertelnet.rybnik.pl> wrote:
>  > >
>  > > Removes the /var/cache/ldconfig auxiliary cache directory from
>  > > the rootfs when:
>  > >  - read-only-rootfs is in DISTRO_FEATURES,
>  > >  - ldconfig is not in DISTRO_FEATURES.
>  > >
>  > > In both cases the /var/cache/ldconfig/aux-cache is useless.
>  >
>  > Should there be a test for package management being supported in the
>  > image too? A read-only rootfs is one case where it's not possible to
>  > install ldconfig support at run time but a writeable rootfs without
>  > package management support would seem to be another?
>
> It seems to be perfectly fine to use the ldconfig without having any package management system.

Of course. But if ldconfig support is disabled at build time (ie the
ldconfig distro feature is disabled) and there is no package
management support (so ldconfig can not be installed at run time) then
is there any need for /var/cache/ldconfig/aux-cache ?
