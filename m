Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.622.1592338333269861022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 13:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=POHYAqzW;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id f185so4382672wmf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WOJcto3WXMew0UbDeC63zgXcliDXiGiwiK84TXXBx7Y=;
        b=POHYAqzWxhqJ6yGqcnP/C405Y743QbYJ938c7cIR4NZTeGSOgOYJd8Debznj1eqbcQ
         opClrLqiG0muzCYvQwbjQOxZ+Zn7xStOalTWVqbRocBQG2h8bhuwiuHU5fcoqpmcrew0
         Akc6bDlhD4C1ZX1ENlb3/DC3hJY62uwAtE6ZtWoP5HKWQZli90ml+1aEt1hp5r03ue9k
         /bDlBdh6FTWFAugNLZCygmAWIiHRtsddVFqSwa+mItZUGYBCVKOnz5Q63OVPAcUbURNH
         fpnWf84HYK5QkewG9Z+cicZDcoQ/gfQ0Dp7AG6XG/6B34wLqZhhq2+2eQ5ijgMRVnnZ1
         jE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOJcto3WXMew0UbDeC63zgXcliDXiGiwiK84TXXBx7Y=;
        b=FCkL1hDnr1Z6EsFeudcLiCY8YbYLnhaGgiHIpyTvA1OlozCwtQtG25BZvtnknUq52v
         eQ4tC0CGnYz7GTljIfS8KJM5eQQ/07La4ZuSM2Wv+Z++KzMxyZzK1YOdXENidVm7m2dk
         rtSsRwXjPHP2WD96lZDqRWknUe+/JH9QXeJNobToD2ad6v8beXUAIUAklyEkANd9tCSm
         hsr9b6+SFxdaYt+DJYDxaQ9xDRWtbOA+q58SZm+gGlPmLsbRtvgtYo8MhlevOVzyR4/y
         tMlXd2cVTMr3/+mBJqm4+9yhBPbhRd7zywob1yd0oyCekVITblmSNiQoPjHMfoASJuKG
         BA8g==
X-Gm-Message-State: AOAM532llJGWY5qvbHfG4tZzwiJwAmADiQRWHT5iurZLFoYLF9BuZped
	jJKwY/73cA1EHjP/5CPXgKgf+pr5QNW8bmEQGoQ=
X-Google-Smtp-Source: ABdhPJwokqwzFbgkAm9jkq2yBnvUStDPDgEEyAC3HNrsRDa6Fg3arYUxZOMU4/RzMcOxM8J/+YAoImYZlU8g+0YRYEw=
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr5051701wmh.111.1592338331576;
 Tue, 16 Jun 2020 13:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592249381.git.steve@sakoman.com> <5e33d1d1d655c50a817acda85f2df67c67196daf.1592249381.git.steve@sakoman.com>
 <20200616194912.GH14969@localhost>
In-Reply-To: <20200616194912.GH14969@localhost>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 16 Jun 2020 10:11:57 -1000
Message-ID: <CAGDS+nkDyBwYqbjJtedLRx43wL8yU7ZNStpn1uvvKm-hr1VwRw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 08/21] cairo: Do not try to remove nonexistent directories
To: Adrian Bunk <bunk@stusta.de>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 16, 2020 at 9:49 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Jun 15, 2020 at 09:35:27AM -1000, Steve Sakoman wrote:
> > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >
> > Commit 0e1f8fa0 (bitbake.conf: propagate 'opengl' DISTRO_FEATURE to
> > native/nativesdk from target) changed the default PACKAGECONFIG for
> > native and nativesdk so that it becomes empty unless "x11" is in
> > DISTRO_FEATURES since "trace" was also removed (propbably
> > unintentionally). This highlighted than an empty PACKAGECONFIG would
> > lead to a build failure since /usr/bin is never created under these
> > conditions, but the recipe still tried to remove it.
> >...
>
> Isn't this a fix for a bug that is not in dunfell?

My impression was that while the bitbake.conf change that highlighted
the issue with an empty PACKAGECONFIG isn't in dunfell, the underlying
bug that this change uncovered does exist in dunfell.

I realize it's not too likely that another layer would set an empty
PACKAGECONFIG.  But people often cut and paste from oe-core recipes so
it's nice not to have known bugs ;-)

Steve
