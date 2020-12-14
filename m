Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.29878.1607917763397255034
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AXGA4rv0;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id u21so11011283qtw.11
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 19:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JnmyQe0DuWsP+FH2H8+lANEc+sWyzkqCxczk9b2JtfU=;
        b=AXGA4rv0frGObQO3RIpFK0zHfiFif9EG4q5jTdHIf8zkNMy/5JCg7CZPZbkEafWEaS
         Znrzey/0xATvDBxXz60uC9QMNFzQqvpipTQBvJ2zwTc25AbrQcaGOdSICgR9PflT85lW
         hQrtXv/Q2MVZat9A9NMu1iybBcjava3MaRn8q7BdI3J8mks1m81jgvLHHNmLHxp6Krz/
         ixu0Pbv3LhhaoVZ15o8oL2VNvV9Dtio3VAEEy05lEuW56OdBeWfpMRHnm8pVVcnjkQfx
         t5Zbya4TJcX+5uC32VuPW/WSPnPBobV+rQTPQPhwzMHAToSxAJ6bsBYS+R4lc+SpLtM3
         PxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JnmyQe0DuWsP+FH2H8+lANEc+sWyzkqCxczk9b2JtfU=;
        b=V67KonEAe9Na/JusBfRICyzCD1fGlMUlGfNTKKxMEgLFci6FM+xsPesyto+FeG4INp
         +PJ35kRHNxhgwsLkfcnBRRGYRQbpjTS2b+hS1Q2vwCr5wHxDLdxuj7VltAkXFSWZaCBb
         fLWv/zUcHYWwbHC/kDn+h1Oli8oOsjtdmG/2+c+wIfd6GRmpgQ1zxZ3BIRELZE6agJWZ
         3BIJXcwFQMOE8ALzSP2gQzQj1cgg5MU4OglEjpaXBgU8SJvxc+qwIhI6GPYpqYIMHkjH
         3vLFuNaUq6fVFUDGDpl4uO+jNIBapP4Ce2eIDeQezlw6EF+0tp2/jtyXQqJA9qha0QJ2
         yfXQ==
X-Gm-Message-State: AOAM531zc8/o+ClGpqRqorb3mDwRwJ1dxYffTnZkKHHhKsmRVrG6B0gO
	pKIBY4paQnhHNkRF0IRs3kvJTS2q2LkFqIVUlERl3xFlQG0=
X-Google-Smtp-Source: ABdhPJzo/+SJWgaLY1rq2a/m0Terg/hvXCOcg9ERdl2GDeFGSrsaS9KClzaKg3R6AkjrVNzgjMt8VcApxB9viWoL1Qo=
X-Received: by 2002:aed:2ec6:: with SMTP id k64mr29355875qtd.194.1607917762502;
 Sun, 13 Dec 2020 19:49:22 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com> <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
In-Reply-To: <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 13 Dec 2020 19:48:56 -0800
Message-ID: <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 13, 2020 at 6:52 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello Khem,
>
> Em s=C3=A1b., 12 de dez. de 2020 =C3=A0s 23:30, Khem Raj <raj.khem@gmail.=
com> escreveu:
> > On Sat, Dec 12, 2020 at 3:52 PM Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > And this segfault is also happening inside the build. I ran the
> > > readelf on them and it seems to have been modified to use the
> > > uninative libc loader but I am in doubt how if this is the culprit.
> > > Can someone shed any light on this?
> >
> > it seems relocation is not working in some cases. whats your host
> > distro, are you using gold linker by any chance.
>
> Ubuntu 20.04 inside Docker
>
> The features are: DISTRO_FEATURES =3D argp ipv4 ipv6 systemd ldconfig
>

Does it happen outside docker ?

>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
