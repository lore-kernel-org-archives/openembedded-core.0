Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.56094.1629301878288045040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 08:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nzeRknBR;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id r19so3816383eds.13
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iFqr7MHEWjPwLeLgvvFJH3lmrR268g2Mu195QtAyP6k=;
        b=nzeRknBRGZmGBBQ+c4Ak2PW5smMNriLstfWYdKuFXd87O6iv+VRqFxdVDgiRDQQGlZ
         q+SQJCibhyJ72GCQ5JBkfLOukiBdaU+q/ve++DxN0WKrLyvLvizFL1xb6QzkTQoV9Gru
         lO+g8iOHp1rDZ8GZAecmS/Z5Yy4wzQOuQqPSRAYhreF9zL9x4mvNHXl8OXUlae27Okbo
         XL7JUDZ5jTRTmbdKKNDBqYutl88MUtx/NOOwgG3MTlJXJ9KRIlto71BUEScA10UyI20n
         sQkUMfUSpLD2kuCYHYqDgqP7p+ChyPPeEGJ6YOaq9WtZ3AAwLJQPzxGduIrnrOfiPx3G
         LuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iFqr7MHEWjPwLeLgvvFJH3lmrR268g2Mu195QtAyP6k=;
        b=sdj+rtjn+lYz/P6xwggZ5FThXjfQr14H4nVzVjZveByOb2jnVfF+Ggn/Qce4qflEJ3
         2i7okYEEuTku59op8bkUQwk0qlSTRpExmAhKo/Pdo4p7sgKV9NY9Tm+t38FII4JRG20t
         oiKNeSMXKjVgaRgruaJhGumTcc8em1mR0yK3geePOGxdgKdPXxoOD8HcJ2DNCAi4l7JO
         YosaWjTgfL3cGNFsgn14KYmtTTf1k7c1toXZcyuWEPlxoEnWiWIhvpmeZIfzDyroDc7+
         GvNh42iq/g2aVT9Xijx9kkV4XarXQp7EigsZdMybCTH+MZPnLhZEOe64DXhcaYZcHe0x
         Tl0Q==
X-Gm-Message-State: AOAM532ddW+e9qchxMGfz6dPKkoeLww25p6OyEWuKyxxUuohZbpN5l5n
	IgOJq9BeiwdRYwXkf+HfUSjTgSoP//vmt5T4+X4=
X-Google-Smtp-Source: ABdhPJyoKM88vYn63+wOrxdfeXh2szS2tGytRPWYVd0hEj59dhmfzWnz9bSglS4v1Ezbzo2QmOBxbOBBMF9B43eYl0M=
X-Received: by 2002:aa7:de0e:: with SMTP id h14mr11262552edv.150.1629301876787;
 Wed, 18 Aug 2021 08:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210809094853.3619155-1-quaresma.jose@gmail.com>
 <20210809094853.3619155-4-quaresma.jose@gmail.com> <55b8a86a8662b7221aeddc0da5c3589afd62f9d6.camel@linuxfoundation.org>
In-Reply-To: <55b8a86a8662b7221aeddc0da5c3589afd62f9d6.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 18 Aug 2021 16:51:06 +0100
Message-ID: <CANPvuRmT8FO1X5GGsgt4SHafowO+a__mLt+LzgxKjqBj9--bQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] sstate.bbclass: disable thread lock if we don't have events
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

First of all, sorry for the inconvenience of this patch that adds many trou=
bles.

I have concluded from the commit history that the lock is introduced
because of the progress bar and I don't know that the debug message
uses the events when it runs inside threads.

Basically I am wrong in my assumption and this patch doesn't make sense,
so I will remove it from the series and send the others that are minor twea=
ks
and little improvements in the sstate mirror.

Best regards,
Jos=C3=A9 Quaresma

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quarta, 11/08/2021 =C3=A0(s) 20:40:
>
> On Mon, 2021-08-09 at 10:48 +0100, Jose Quaresma wrote:
> > commit f2053844958325496a9387874a8f3182400b71ca
> > 'classes/sstate.bbclass: Enable thread lock when checkstatus'
> > adds a thread lock to don't lose the events from multiple threads
> > that runs on the ThreadPool.
> >
> > commit 1444b8a2ae226829e719d3d184fca27e5940ae0d
> > 'sstate.bbclass: Only show sstate mirror progress bar for >=3D 100 obje=
cts'
> > disable the events if we don't have a minium number of objects.
> >
> > So we can only use the thread lock when we have the events in place.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 63085a7f3a..948779386d 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -969,17 +969,17 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e, currentcount=3D0, summary=3DTrue,
> >              if len(tasklist) >=3D min_tasks:
> >                  msg =3D "Checking sstate mirror object availability"
> >                  bb.event.fire(bb.event.ProcessStarted(msg, len(tasklis=
t)), d)
> > +                bb.event.enable_threadlock()
> >
> >
> >
> >
> > -            bb.event.enable_threadlock()
> >              pool =3D oe.utils.ThreadedPool(nproc, len(tasklist),
> >                      worker_init=3Dcheckstatus_init, worker_end=3Dcheck=
status_end)
> >              for t in tasklist:
> >                  pool.add_task(checkstatus, t)
> >              pool.start()
> >              pool.wait_completion()
> > -            bb.event.disable_threadlock()
> >
> >
> >
> >
> >              if len(tasklist) >=3D min_tasks:
> > +                bb.event.disable_threadlock()
> >                  bb.event.fire(bb.event.ProcessFinished(msg), d)
> >
> >
>
> This patch series somehow breaks the build in weird ways, typically:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/3789
>
> i.e. the sdk-update from an eSDK somehow fails to get sstate objects from=
 the
> network. Michael and I spent hours trying to figure out what was breaking
> things and whether this was an infrastructure issue with sstate or not :(=
.
>
> I dropped this series and builds look much happier. I think this patch
> isn't correct as the threadlock isn't guarding against just progress
> events, it guards against any events from threads. There are debug messag=
es
> in the code which turn into events too. As such, when threads are in use,
> the lock is needed.
>
> I therefore suspect it is this change that breaks things in weird ways
> but I haven't confirmed that.
>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma
