Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.11491.1602766865370704592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 06:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qS66EHl9;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id g12so3337717wrp.10
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+p5ESoWqfxPOwxTCBCzZXyIKQfBpWL21ovHPKyKJAKQ=;
        b=qS66EHl99XLLaIafhqa+GN9TNMuri7hWu9gOKl+6EE4JHCNR3pUvjxKSMrmXJv1SFx
         vHexJGVH7UmZb1m1NsU67K2xoHWqknXGFdR24E2Y00XHkKDIaP0lpvuy4jBO9ybTy98V
         8wggM4h/FbSY58oU5sUfbhI31CJ0jC/U4xnTFhtxht3USW2/2gHaACcXnirfLDhzWQJy
         SWQvSjvRIt/5gcZa/3DgHTG2XspBH6a6O1utKN4iaW/ypEJBc6nG//IDf3xqeW7krg7l
         xGYfDF+2TehANVVQmqI8JwqjXAf9o0Nc0Fu5voO8YPa50SUhQfOEqfIebiX2IinoeSU1
         +jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+p5ESoWqfxPOwxTCBCzZXyIKQfBpWL21ovHPKyKJAKQ=;
        b=b1/1wMUnv7k0L5yC/qGZgg3J3TEzGcWMb/hBf7PUsXAg3teywyOtBz8fx1c3vPMPCg
         /N5+vd0I26s4cPUwbLuWW4SzrKDLxi/61ofH7zhIja6JZYwkpNjy1YsmePsme7YqunHi
         bAaPal0hy6musmU3CZ2KVESDFQiAmXzS/DxQCeas0buafggN3oY+PsbrWyRv19jUN7/O
         2Qwjcr8x+feH0CvhtmmMAxNyKPrVYLV324W1WEfaVDKkRWX5kJGRgErp0hLADosaxXBp
         FOpvhQiBSLYeTYm7qSU5bLkqZG1VIswVV0OAH94FH2didBkW7HZTNnJHD/aYYi+k2j8Q
         X16A==
X-Gm-Message-State: AOAM533hZtFtw37seIWu9lOqsmbLCnsck8ffITFrULaEJrhoSM9qhRCQ
	V2eoToE0c+I2ktCOMH7WHOpImI6VTd9U40uiEFQ=
X-Google-Smtp-Source: ABdhPJyt5AEhk9TM4E3WJAYblJmDsiRP4heiex09bVhjwscpTNo3r+8tieiPKl1AR9xkvg6Prvlc7OP4cScFKyLQOwk=
X-Received: by 2002:adf:fd09:: with SMTP id e9mr4339804wrr.241.1602766863808;
 Thu, 15 Oct 2020 06:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201014112620.2244199-1-ross.burton@arm.com> <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
 <0c555406c8db939a1e35bc7621166bb2b832fa84.camel@linuxfoundation.org>
In-Reply-To: <0c555406c8db939a1e35bc7621166bb2b832fa84.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 15 Oct 2020 08:00:52 -0500
Message-ID: <CAJdd5GYKshG8BQAwrOxy0hMqY2jo9PLdxeHHT-54bNspS36JFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 7:44 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-10-14 at 07:41 -0500, Joshua Watt wrote:
> >
> >
> > On Wed, Oct 14, 2020, 6:26 AM Ross Burton <ross@burtonini.com> wrote:
> > > We don't assume Python 2 is on the host and don't expose an unversioned
> > > python in HOSTTOOLS, but waf uses the unversion python binary.
> > >
> > > Typically this is solved by patching waf (see the glmark2 recipe) but
> > > this can be solved centrally by invoking python3 directly.  All wscripts
> > > that needed Python 2 would have been fixed by now.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/classes/waf.bbclass | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > > index 309f625a40..df6d4d53e8 100644
> > > --- a/meta/classes/waf.bbclass
> > > +++ b/meta/classes/waf.bbclass
> > > @@ -42,7 +42,7 @@ python waf_preconfigure() {
> > >      subsrcdir = d.getVar('S')
> > >      wafbin = os.path.join(subsrcdir, 'waf')
> > >      try:
> > > -        result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
> > > +        result = subprocess.check_output(['python3', wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
> >
> > This will break our internal usage... We still use waf 1 which runs under python 2 only :(, although we are working on transitioning
>
> Might I suggest this is parameterised as something like:
>
> WAFPYTHON = "python3"
>
> then OE-Core can continue on and improve but people with legacy can
> handle it better?

That would be fine with me

>
> Cheers,
>
> Richard
>
