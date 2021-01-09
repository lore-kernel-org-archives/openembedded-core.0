Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.9007.1610224655273848685
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jan 2021 12:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBntmN6x;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id l14so5914693qvh.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Jan 2021 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJMEDQ8Rs1+IDY5ADzZtzTCuCudecdm4Qx+g+8CSmC4=;
        b=dBntmN6x+oAllR2+1j/TUFUG9PfeChKm9418L9dKNQZou5YodGjcykfqvxqtV3pL8Z
         cWl2RFqhgKEPdxni5KDZtxTnpDJT/J4ktF+55SVRCNMmwN9TjRbh4NIKz0sMZkMuldap
         2yLcKIK3wz5yG03TZK/7Q/GkXGYWEPPmoX520sfMF6xCzCZyFa5hCW61RUbIiNd9DJAC
         h9SFlqmSRsk7Dg5pPgIOB3/2ueuPJG53bS0snAMgL5u+E/I4tQ3s6kYpjg9HGNfiBTFq
         4s2ywxTZHwpyVtGpIYsFqR8nRWan32gtVtPl8R9hGDoK40kcefCRYz39ehmFs/FC1vpd
         NNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJMEDQ8Rs1+IDY5ADzZtzTCuCudecdm4Qx+g+8CSmC4=;
        b=KTh5VUtbPiQGupUlGww14469OyZenszqaej3FDyQ+O5lSJETKz0jj11ZoAfMraWdj8
         kkCFnuaMT7PTUyrCaZkiEtlnbn+Uk7YCDTQF9ZDkOxyr6ATR44GsevUIgpab90RAai0f
         EnwRu/lbmjEykrqjdFxJsNv/QIW9D0XrPDHJh6+zNkEB8TtXKCGEEwL1tk05aNCwWJeZ
         txFPn8dA93WKBaXz2uZZJSDm+eQzyNay+FwEab26AhpMD7slEWvR5RKNrioPfRa3Plhg
         SajPxsrcn9YmQZZ69UwCt/5zqsLdIGIVXT+TOXepQFgyQNugdvp8I44HtVAMFtkdkBPD
         DRMw==
X-Gm-Message-State: AOAM531RI9II53s9A6iBGzUn8Js+jTcPZW8LBFipVGHNz/pxRUh9G/Qk
	pfzdIdJEk4aoi80ffxnOPbWR8W/i0M8JEd7n3K4=
X-Google-Smtp-Source: ABdhPJxFNRjTtN/sDiUhafcnyNwVB2JsOPiBxJnRLKowHKZV7AhRiFTaZpvm3Ccmwj9AZ5S39+vw9gOz/y8VFfLBnIA=
X-Received: by 2002:ad4:4431:: with SMTP id e17mr9444735qvt.21.1610224654373;
 Sat, 09 Jan 2021 12:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
 <20210106223628.561432-3-richard.purdie@linuxfoundation.org>
 <CAKmqyKM9UtUSs6sQReZqzoy8=kPGmOyGNG4+BJx5vU0gFvhWVA@mail.gmail.com>
 <1658397859ED357D.11938@lists.openembedded.org> <dc27903d2eafc24814d131cce1f57bb7380024e4.camel@linuxfoundation.org>
In-Reply-To: <dc27903d2eafc24814d131cce1f57bb7380024e4.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 9 Jan 2021 12:37:08 -0800
Message-ID: <CAMKF1sphYeSi74Vja+AF-Vz=96SeyKZfFrZ6CAKf3hu1hx6K7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] qemu: Drop vm reservation changes to resolve build issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alistair Francis <alistair23@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 9, 2021 at 1:19 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-01-08 at 10:00 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2021-01-06 at 14:53 -0800, Alistair Francis wrote:
> > > On Wed, Jan 6, 2021 at 2:36 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > When building with the new version of qemu we see errors like:
> > > >
> > > > """
> > > > qemu-i386: Unable to reserve 0x7ffff000 bytes of virtual address space at
> > > > 0x1000 (Success) for use as guest address space (check your virtual memory
> > > > ulimit setting, min_mmap_addr or reserve less using -R option)
> > > >
> > > > ERROR: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed
> > > > """
> > > >
> > > > The VM reseration patches we're carrying look suspicious in this context.
> > > > Drop them since we don't appear to be seeing those issues any more on the
> > > > autobuilder and I suspect the patches have become broken and a liability.
> > > > webkitgtk builds seem to be ok now.
> > >
> > > Yes! Getting rid of these patches is great!
> > >
> > > >
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > Unfortunately this issue is still present, I thought we weren't seeing
> > it but once other errors cleared, this one remains, only on
> > qemux86+musl for webkitgtk.
> >
> > I think we need to get to the bottom of it and figure out something
> > which is upstreamable. This will block the qemu upgrade until we can
> > fix it unfortunately unless we block webkitgtk on musl on 32 bit x86.
>
> I've sent out a couple of linux-user mmap patches for this. With those
> fixes applied, qemu seems fine so I've upgraded.
>
> Khem: I do wonder whether musl's memory allocation is all ok given it
> loops indefinitely if it doesn't see EFAULT and only ENOMEM. That may
> need investigation?

I forwarded it to musl community as well. Other musl distros are also
carrying some patches in qemu
eg, voidlinux has this
https://github.com/void-linux/void-packages/blob/master/srcpkgs/qemu/patches/mmap-mremap-efault.patch
which actually could be forwarded upstream qemu.

>
> Cheers,
>
> Richard
>
