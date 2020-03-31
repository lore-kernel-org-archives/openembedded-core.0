Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.5772.1585647795365627801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 02:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=UNA4MoUz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.65, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f65.google.com with SMTP id m15so21064618iob.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z38GQgHdvv0oz6Llu7oZgEGmSVV/MpAlQ9+faZdIENE=;
        b=UNA4MoUzpD7cuGePi0O6dcFIpo/u6KbmDK2vZ+lUXStb20K4Nr+73JlgvA80sj6UO5
         Mfe/rAGsXNlYCk/IiRVJV4HiPPAuSMEr1dNendE/OhAGpwiiM2KAh/mu5M/zZ19Svqy5
         nNfFpGGstO0CWWX8gQA0NGYjLoC+EOyMKQ4rHN0xkwlUbFKaypiaj0b8QjDXI5KItpqd
         l85Qr0Rq9rIr6ioCfEPBxB1pK2QSPCUTZPKwfFQa8OF1Y/9PbzJCnMI24Wtl71T9TY70
         ukWs414GxtLdPahv6GUTOGkqQHpNNI4PVtGxzvU+hi86Hzxz1m90CMEsuzEuciEtFz1w
         T40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z38GQgHdvv0oz6Llu7oZgEGmSVV/MpAlQ9+faZdIENE=;
        b=XZWyTOuOwPycMrtDABVPFzaBKiXC1P1MMuwTT0nZ9QDODlmvEtWTC3Lv+QlJDA+2PR
         D1nX7n3M28Z6OsImTOhX0vaEa0IBIVBJKmelKKvtcafC5qfIDifNSplG9Igc8JE475Xp
         O+uD/Edb6iKIijVPnODLMyGC+ZPP2ErSQAjIFJZECHJtUGxNxJFwTqBG2JI1OHzuTqm2
         6TiECTLOXOutRiCqo5duOBi9ieJc/S4Nd/4QY2FfBXKiP1nYV32GHTJjRzH1JyktnpUu
         AL2YIY5spxSI7KkvoVudKDIf7eq1MWBzK2yPFsOjEzTjdLnGwMwYrp3TK2S/iTS0KDdR
         EF3g==
X-Gm-Message-State: ANhLgQ058PEDmfdCCTvjkTwo0zJTZCJhbU81d38jxz/b0XSmPDsNJsUC
	97Pex7Rb7k6sJ0YbGcErlQRzFlfaI+CGUlP+GEbV3g==
X-Google-Smtp-Source: ADFU+vtEVkBo1NjwUmUvEwFmYOHpk8pOZrHh1XwFaGl1uAT9NNZ3thdHcOTNHkMLoA2E7OpkpBed+w4fs5/riK6pi+I=
X-Received: by 2002:a05:6602:199:: with SMTP id m25mr14538467ioo.13.1585647794698;
 Tue, 31 Mar 2020 02:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200323172808.26338-1-brgl@bgdev.pl> <20200323172808.26338-3-brgl@bgdev.pl>
 <CAMRc=Md2DfUTEhR-DzswDc=LQSHdJ35NMeQCVMJ_qC7V_4jiEw@mail.gmail.com> <673150a994845977a61edbd6a3a3e39f5dc8b3c6.camel@linuxfoundation.org>
In-Reply-To: <673150a994845977a61edbd6a3a3e39f5dc8b3c6.camel@linuxfoundation.org>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 31 Mar 2020 11:43:03 +0200
Message-ID: <CAMRc=MfSekw0gNRjvmJQ=RT8sUVmyvv5gxuDbLxzHj4h5048gg@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 2/2] image.bbclass: deploy image artifacts in stages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Jerome Neanne <jneanne@baylibre.com>, Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 30 mar 2020 o 18:31 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> On Mon, 2020-03-30 at 18:26 +0200, Bartosz Golaszewski wrote:
> > pon., 23 mar 2020 o 18:28 Bartosz Golaszewski <brgl@bgdev.pl>
> > napisa=C5=82(a):
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> > > override. This way each generated set of artifacts is deployed as
> > > soon
> > > as it's ready instead of the do_image_complete task handling the
> > > entire
> > > deployement. This allows us to better fine-tune dependencies e.g.
> > > we
> > > can make do_image_wic depend on fitImage task which can in turn
> > > depend
> > > on do_image_ext4.
> > >
> > > We need to completely delete the do_package task in order to avoid
> > > problems with task hash changes as well as delete the IMGDEPLOYDIR
> > > variable from the data object passed to each image task so that
> > > it's
> > > expanded with the correct override.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > It's been a week. Can I get some feedback on this? Is the idea at
> > least remotely acceptable/can we build upon it?
>
> FWIW at a quick glance I didn't think it was too bad.
>
> I think there will be corner cases to resolve which I was hoping to
> look into and give some pointers to but I haven't had the time.
>
> I'm hoping somehow we can improve the FIXME you mention too.
>

Yeah, after thinking about it more, I figured that if a task signature
changes, then something is wrong. I guess it's because we end up
assigning pre- and postfuncs to tasks twice: once in anonymous python
code from image.bbclass and then from sstate.bbclass. Maybe we should
provide a python helper for explicitly making a task an sstate task
and - when using it - not add said task to SSTATETASKS, so that
sstate.bbclass code ignores it? Or maybe this anonymous function
should become an event handler invoked at event.RecipeParsed?

> The do_package change should probably be separated out - I'm guessing
> we did noexec there for a reason though?
>

I couldn't find a reason. Maybe it's a leftover from some previous,
now cleaned up change.

> Also, you used {}.format which I'm torn on since most of the codebase
> uses the other approach.
>

I couldn't find any official guidelines for that. {} is the preferred
way in Python. Maybe it's time to start slowly converting the bitbake
codebase?

> Its too late to get this into 3.1 and that is where I'm focusing my
> effort right now but I think this is probably going the right way.
>

Sure, I didn't expect it to go into the next release. If you're happy
with this direction I'll try to improve it and send a v2.

Bartosz
