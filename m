Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.2686.1587981268183215671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 02:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p/pUVup8;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id c24so16649036uap.13
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dHi1DKpAa8lDG8vUPIhFEa9WP75TI05A2eHpdp34ITs=;
        b=p/pUVup8sz2y1Sm25mTBXRc8wrZ5OthkfF/o4zyP4cGiO4TWS6Im1bGzXHNDsnnNCC
         vwZxn97FmkyW3NzdDAoXXsanHzoxl+eLpOdQWlZr0JlxkyfdfFCOfmXBU4CyfQHtMsDS
         zAQ9loaC1sG5mSnfLPJVcRZm8ZNvKxGFZgxXCkWJL3q7ooiU2Y2r0T/dhzwT0jerIsrf
         rfRDGbl5ASNnGs8RxlYvRUC5l9jGw3cthjqnRNzPlTb/QBh+HDBe+n8x/ddI27LPsHMA
         TF2ut5jTIeTMd1GNTD/rCX7ISMrwmUMVW0vLjU4hrSfz1uazN5sL+7UrLTocWrEdbsGI
         ftZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dHi1DKpAa8lDG8vUPIhFEa9WP75TI05A2eHpdp34ITs=;
        b=D2T0CWSgJOdyJX5ymiYhhyvRaIf60ElCjBG1yBKoewulde65XtqmHqpQOddIRuLy4M
         FBbb4ihiStAXzj/1srHKL8P5tSo0sYnv78OvFc4MrRh4mHDTDmfzL+vYA5Gete1kaeeB
         xzWZVtyM5JaT1wXiofksEXew62KKNueTSvkhWJ1JYSE0MiY+4mo8QcHjgE8TXjjGDh7C
         J2BfLzTaSWgyjagkI/I1nACFVqYS7uVK47wkwVQA5/U//4IDzLJoMhDSVRl41uCQsqbF
         jrp2+mTPhW6PpD1qAUZw3yXzNHDm35qWQViQULQrkZqSXzENWo4qzSH3QOUYe+i8nSN2
         2vig==
X-Gm-Message-State: AGi0PuaB6+6eisHskMDxrVWWAtPLsK73GR63rjCojMm7IXJAEzBxn1hX
	x61mbsDkMjpWD74IqaXpZNizimhWfgK2NqVc52E=
X-Google-Smtp-Source: APiQypLxT4qpgpGkRRSTKfSvpW/YPoWNLDwPef78Xqzk8FHrAnUkloOYPRH7KemXQRVnwNavVW41cSTEo2dFl5+pK6M=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr16406964vsp.83.1587981267237;
 Mon, 27 Apr 2020 02:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
 <160972188EAFC253.2907@lists.openembedded.org> <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
 <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org> <20200427090911.GA19242@localhost>
In-Reply-To: <20200427090911.GA19242@localhost>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 27 Apr 2020 11:54:15 +0200
Message-ID: <CANNYZj-=p9Ov7JJrDOAHZcFKu4m-aiYURQ4_mYLbBNT_R1T=AQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
To: Adrian Bunk <bunk@stusta.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000057ff5b05a442b39f"

--00000000000057ff5b05a442b39f
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2020 at 11:09, Adrian Bunk <bunk@stusta.de> wrote:

> I don't see omp.h installed anywhere by the buildtools-extended tarball.
> This would explain the build failures.
>
> gcc 6 updated OpenMP support from OpenMP 4.0 to OpenMP 4.5.
> This might be a plausible explanation for segfaults on systems
> with older libgomp.
>

Yes, I thought of sending a patch that adds libgomp-dev to the extended
tarball, but... the mysterious problem is, in some cases, rpm-native will
compile on the same worker machines without any failure (and maybe it then
gets linked against 'wrong' gomp, hence failures)  - see links above. I'd
like to try to ssh in and see how this could happen.

Alex

--00000000000057ff5b05a442b39f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 27 Apr 2020 at 11:09, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">I don&#39;t see omp.h installed anywhere by the buildtools-extended ta=
rball.<br>
This would explain the build failures.<br>
<br>
gcc 6 updated OpenMP support from OpenMP 4.0 to OpenMP 4.5.<br>
This might be a plausible explanation for segfaults on systems<br>
with older libgomp.<br></blockquote><div><br></div><div>Yes, I thought of s=
ending a patch that adds libgomp-dev to the extended tarball, but... the my=
sterious problem is, in some cases, rpm-native will compile on the same wor=
ker machines without any failure (and maybe it then gets linked against &#3=
9;wrong&#39; gomp, hence failures)=C2=A0 - see links above. I&#39;d like to=
 try to ssh in and see how this could happen. <br></div><div><br></div><div=
>Alex<br></div></div></div>

--00000000000057ff5b05a442b39f--
