Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.1910.1596045531894966595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 10:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j28iZji3;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id b25so18323311qto.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mK278ssb36yMfJjsmLNyB8joBBqKTvoc89C5VNiLJEM=;
        b=j28iZji3bZ5FgZMGAZY0E5eGUYXliDJsyHQbAZma6ik4HKT9BiW41Nen1kwtRb02I6
         NoQOnNGNOHNk19STrIwwF1FW217mpkgUiIUNUJ2t+SVeJlE0TVs3TR2SsjaMj1gDEyeH
         /xjPXun1lWIL8aIwxAC7lCZ5m9lsMjliSTByWycnxdwtdhMnEBml0p6RByBuDqnz4RBd
         zqU24CNJgF9iFYOUSsSspXCCQ4ATgUY1+NI/kwL5JnN6lWYWuybvxzdl+WGXIged4KlZ
         +VaO4OixN8t4QYTinu0CUUMsxBMG1oEUU/qyzH+tLJhOqu4/Ak6J7rvrkaItQo8iu+ZD
         iNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mK278ssb36yMfJjsmLNyB8joBBqKTvoc89C5VNiLJEM=;
        b=giMENApR9a4VfuprmsbRqyeOYQ91zueDh9U+EeGcKua5xmA+UTL2amrp4PFsTfnfiH
         UoaLpgE78ald9WFPqi8MGCC/ns4Am6S9YeQsKp2SneON4qc6ZeYycbpbtTvCmStMA7+H
         x9l5KyMhL4EqEtZyAd/JmN80N32QvMfrYLee7nWxb4PII1m6d/wONJ6LjufWAjsC8ony
         Bf575qP0wEQMjWk9SdrOnKzRUcTeFQADUANPg4RQHtAy2W57GVZdTmbc3V70kD3EWPmv
         hgwDc+8Nh39YZrzk7czcxDD63bui/jHOSpS7r+Y8RVtkoOtdq6rFfA7SRvcw7w99g1Y7
         XPLQ==
X-Gm-Message-State: AOAM530q+laHpOCxQo48dsxFjVF6hrnhn9rdmwgw3WlpmFk5YBusRXu/
	yrZcWcWrGF9ye/lV9eJf07pPee02AXn5VyfY20Q=
X-Google-Smtp-Source: ABdhPJwFE4McP7SQeFro5Vv89rwnbtkqbqfkKhf3boYZ8cqFCY2soI6ZhauWwrsFEytJFI1byE8U8z6EWsMd8bVY1ck=
X-Received: by 2002:ac8:4097:: with SMTP id p23mr31384695qtl.316.1596045531017;
 Wed, 29 Jul 2020 10:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200729022852.1792061-1-raj.khem@gmail.com> <162630A032FCBA1C.9067@lists.openembedded.org>
 <e3b4f4fd4a29514b30cd8f170d5a518acff0fa02.camel@linuxfoundation.org>
In-Reply-To: <e3b4f4fd4a29514b30cd8f170d5a518acff0fa02.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 29 Jul 2020 10:58:24 -0700
Message-ID: <CAMKF1spTG7P72GKL9hZF-RkPRKyZ4557KeQidMLVCrnGKFw_sA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemumips: Use 34Kf CPU emulation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 29, 2020 at 3:13 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-07-29 at 10:56 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Tue, 2020-07-28 at 19:28 -0700, Khem Raj wrote:
> > > Few years ago we switched to using mips32r2 tunings for qemumips
> > > however
> > > the default CPU emulation still remained 24Kf which is not optimal
> > > for
> > > mips32r2 ISA for qemu [1], therefore switch to recommended 32Kf for
> > > CPU
> > > emulation when running qemu in system mode
> > >
> > > Boot time to console is ~1s faster with this setting, hopefully
> > > this
> > > should speed up qemumips in general
> > >
> > > [1]
> > > https://www.qemu.org/docs/master/system/target-mips.html#preferred-cpu-models-for-mips-hosts
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/conf/machine/qemumips.conf | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/conf/machine/qemumips.conf
> > > b/meta/conf/machine/qemumips.conf
> > > index 31ad754483..4617c3c7b6 100644
> > > --- a/meta/conf/machine/qemumips.conf
> > > +++ b/meta/conf/machine/qemumips.conf
> > > @@ -12,3 +12,5 @@ KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> > >  SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
> > >
> > >  QB_SYSTEM_NAME = "qemu-system-mips"
> > > +
> > > +QB_CPU = "-cpu 34Kf"
> >
> > Thanks!
> >
> > I did run some tests locally, timing core-image-sato -c testimage
> > before and after this change. It took 999s before, 1018s after but
> > the difference looks like noise rather than any speedup or slowdown.
>
> Another try at "after" got 986s so who knows :)
>

Yeah I saw that first boot was slower but reboots were always 1s
faster, but hopefully it
will help with irregular timeouts on tests which is what we are looking for.

> Cheers,
>
> Richard
>
