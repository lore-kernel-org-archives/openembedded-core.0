Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web12.5926.1607417340340632763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 00:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=grCLP/E/;
 spf=pass (domain: konsulko.com, ip: 209.85.210.45, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f45.google.com with SMTP id j12so15163326ota.7
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 00:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wsv6ZoICveKbDEcYpsCR/kfKkDsVLQOP7IKvu4AEnxU=;
        b=grCLP/E/VwUxppfFt74SkcQOhcOLgIZ8z8y4wJGpMYB1sQK2vlgOmNj2fCy70RqvxH
         7DJgePKAmrI1RSsYP4idTFHquVaQ6M57znhqw/mJS+S955gv5l7oQzK7uJM9ljDVYVMQ
         VF5YcPeYXgXJ2fkYhWGbraxvGy0j2MxCF4WQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wsv6ZoICveKbDEcYpsCR/kfKkDsVLQOP7IKvu4AEnxU=;
        b=d2uOVioYJnnkF5Ymo1Fxa2fibSat7zKI72mfHJposaEkR4wETWGUjd+82sjGLT6OsO
         FsYESPUraVdWAtdU/9cKHies9D4X6ETrCQUih6UNpuKbSHVhStTZwt792WGALrIsLEUd
         u7wYeKJ41U/OwWYw5sR+BvcB8lE9aMRRRzE76WCfkQQl8R8LLMBGp/DI1wmj2H5CUY3T
         QSIskfAgXkGMzoo8jESXEBVE2ScmsNmQcNvgXEzgP3D+jZtYQsA8932R6hXMxPqiiLg5
         sJdVGFGg7X0vhlYbKhpGidiNZggfKwohs4MVu0W5CUqnUo/yyqSUggKPo974kRp724Ye
         ozEg==
X-Gm-Message-State: AOAM531FNsB5SG7c0C7j9guZ4y/A6Ns4lsAbTXQKTTKYjgo7O5MV8JnG
	nLmncLIPRVmLR4a6x3+fudmog08f+V2sxb86dm4sHw==
X-Google-Smtp-Source: ABdhPJy0juz2G8BZCxngosBNKi1t5ErayIxZICbmDoRRpYRD2zGXz43B7h8g8a6lhl3HCmkyOOFzc9XM3cfJVV0ZCgQ=
X-Received: by 2002:a9d:1725:: with SMTP id i37mr15881048ota.258.1607417339645;
 Tue, 08 Dec 2020 00:48:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606846217.git.pkj@axis.com> <b7bae6e1633fba206d9c7abad93d79fbe7b0f654.1606846217.git.pkj@axis.com>
 <CAM9ZRVtVRk2CrBKeG=Ks8a+OPhTPKu6q=HctT39tKyYCbAguFA@mail.gmail.com>
 <CAM9ZRVsX+r31zxDHDNA7BOiBCrGyrwwYJWwMmjdF6p69QScJUg@mail.gmail.com> <88d9a9dea0420aa5944c0acba44f14f6eb24d771.camel@linuxfoundation.org>
In-Reply-To: <88d9a9dea0420aa5944c0acba44f14f6eb24d771.camel@linuxfoundation.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 8 Dec 2020 08:48:49 +0000
Message-ID: <CAM9ZRVuTxAwqRAntHaf5UGg2iiAPW=KBC7v0hCM02J0a8WgPyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 2/5] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Dec 2020 at 12:46, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-12-07 at 12:04 +0000, Paul Barker wrote:
> > On Mon, 7 Dec 2020 at 10:29, Paul Barker <pbarker@konsulko.com>
> > wrote:
> > To follow up some more: The entries in PSEUDO_IGNORE_PATHS are
> > treated
> > as string prefixes within pseudo. So if
> > "/home/pbarker/Projects/Yocto/meta-linux-mainline" is added to the
> > ignore list it will exclude not just
> > "/home/pbarker/Projects/Yocto/meta-linux-mainline/build" but also
> > ""/home/pbarker/Projects/Yocto/meta-linux-mainline-build".
> >
> > I wonder if some more of those entries should have trailing slashes.
>
> In most (all?) cases it was very deliberate FWIW...

That does make sense. Ignoring "${COREBASE}/meta" will also ignore
most layers unpacked or cloned within the poky directory as their
names start with "meta". However that does miss layers if you use a
different directory structure which is what Peter's patch addresses
(though I'm still not sure if there's an actual build failure with
some layers which it is intended to fix or if it's just to make things
consistent).

The issue comes when you clone a layer as the top-level of your
working tree and build within that. That's how I work with
meta-sancloud & meta-linux-mainline. It's also what happens if you
build using the kas config in meta-raspberrypi. So it's not uncommon.

Investigating why the layer directories are being ignored I found this
commit added the ignore of "${COREBASE}/meta":

    commit e0cb6dd689a362d8433caa14cc5a9fdd5eb44923
    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
    Date:   Wed Oct 7 23:08:45 2020 +0100

       bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta

        Unfortunately, .pyc files can be generated in meta/lib/oe
which corrupt the pseudo
        database so we need to extend the ignore list to cover this as well.

        Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Could we instead ignore "${LAYERDIR}/lib" for each layer?

An alternative would be to detect the case where TOPDIR or TMPDIR is
beneath an entry in BBLAYERS and handle that as a special case.

Thanks,

-- 
Paul Barker
Konsulko Group
