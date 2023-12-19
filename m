Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D59C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 12:12:49 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.10531.1702987960895922016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 04:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Dzg7E9jD;
 spf=pass (domain: linaro.org, ip: 209.85.167.66, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-50e44c1b35fso826971e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702987959; x=1703592759; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iCbvPCLxC0RjL1NefmiOvZoP3Yr6/5KHKzvBtFmgg7Q=;
        b=Dzg7E9jDn7wyGu4x/bDWyxQDk7NMaukR3z0FH/PSMAKf6AG2dZkKRCVxfebxXRI22Q
         U1/JJR7lar/zgven1cirhVnq+i7aO/zQaJb3uDX4VSpo16aO3gkrGH3ADsRrH6z61VUf
         lw3whc1i53yohe4rZQhcU/ealFm12VDRazqq2GobH3wGAfPOWiwHp/x6NTffv/xrYfkV
         F8qil+zIJ4bk8EI4egHEJmjE4nVtjlV5rfDHS7Qb/n7KjI/Ac+CdDDG2xtET3ULQTX2h
         KC/rtBMunDQj2Nx2a8tOqm4WHCiJLxXRpZ4wE4huMl2UZz36BfP0WAyo4x+CCB3lyggX
         1qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702987959; x=1703592759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCbvPCLxC0RjL1NefmiOvZoP3Yr6/5KHKzvBtFmgg7Q=;
        b=dY5qxP/hGFZgvUU6I0wI9kMlYw1xcbkdbgJI33LIPcDlEiAMD4KrceBWTmvNgPBr+X
         YJZqmXgttYU/dbPKP4PqyxCGlVis1cKQxA4KSIGlmEwOMbT6Q/CP0g/Z8tqT0o9Om563
         z4qjdCCW24tA9FLhnAEznrB4m9vd5BfnBoDEamamVmRlnrzJxxk+aAIgDBox313YkBs5
         uC91xBh3s7Tf+tIGxz8+RHwe9TwD3Wn0Xmx7spG3pi2/1k8+X+zE8rO+vpFOTYHRJAS7
         X0RSApuABSlQpDiw7nlfua53+QvgSl5GgXnPMELGloiPuy7V7+SARPjKR3+Jb2fRLcRJ
         oFLw==
X-Gm-Message-State: AOJu0YwGRSW/SlN1umhgBKCB5J3j1h/1augspA/uyvziWUCPJpQYxCkB
	t9dSpokVukFF+9Wb2Cn5zS8IPQ==
X-Google-Smtp-Source: AGHT+IEGoZGjGFTqRzNXA2lrBcW/9AtZGOIXUbz62vCRaakc8ZobZfkZWYhkxtQElfhPZbp2i3VaZQ==
X-Received: by 2002:a05:6512:b0d:b0:50b:f7fc:ac5 with SMTP id w13-20020a0565120b0d00b0050bf7fc0ac5mr11019943lfu.97.1702987958841;
        Tue, 19 Dec 2023 04:12:38 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id c20-20020ac244b4000000b0050e38ffd9e7sm537126lfm.204.2023.12.19.04.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:12:38 -0800 (PST)
Date: Tue, 19 Dec 2023 14:12:36 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
Message-ID: <ZYGItGxg-TAO4JIE@nuoska>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
 <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
 <CAMKF1srWbpjj7ojaQ-0fdtu5XAW3qA04bbjvqZWekYRqp0s=5A@mail.gmail.com>
 <17A20F573E606BC3.25349@lists.openembedded.org>
 <8ba14102f0ea38d9bb691538e3b2171e82aead33.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ba14102f0ea38d9bb691538e3b2171e82aead33.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 12:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192725

Hi,

On Tue, Dec 19, 2023 at 12:03:07PM +0000, Richard Purdie wrote:
> On Mon, 2023-12-18 at 23:01 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2023-12-18 at 10:07 -0800, Khem Raj wrote:
> > > On Mon, Dec 18, 2023 at 9:58 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
> > > > > I tried the two patches in this series. It did improve the situation
> > > > > but I am still getting SSH timeouts. But this time its 13 tests
> > > > > earlier it used to be 40+
> > > > > btw. my images are using systemd. So it might be good to see if we see
> > > > > this with poky-altcfg as well or not.
> > > > 
> > > > Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?
> > > 
> > > yes, further I ran the failing tests in loop one after another still
> > > one test gzip fails with ssh timeouts
> > > 
> > > https://busybox.net/~kraj/log.do_testimage.503
> > > https://busybox.net/~kraj/testimage/
> > > 
> > > there are two runs in the testimages folder. In one you see the RCU
> > > stall and in second you do not
> > > but it fails with same ssh timeout issue.
> > > 
> > > > 
> > > > Did you still see rcu stalls in the logs?
> > 
> > What is interesting is there is ~3MB of nulls in the .2 serial log. The
> > rcu stall is also:
> > 
> > [   88.261687]  serial8250_tx_chars+0xea/0x2b0
> > [   88.261689]  serial8250_handle_irq+0x1e9/0x330
> > [   88.261691]  serial8250_default_handle_irq+0x4a/0x90
> > [   88.261693]  serial8250_interrupt+0x66/0xc0
> > [   88.261696]  __handle_irq_event_percpu+0x54/0x1c0
> > [   88.261701]  handle_irq_event+0x3d/0x80
> > 
> > i.e. it is stalled in the serial TX path.
> > 
> > The big question is why is there so many nulls on the serial port. I
> > see a few on my local x86 test runs but only ~4kb, not megabytes of
> > them. I hadn't worked out where/what they are from yet.
> > 
> > I suspect something in the serial/kernel/qemu space isn't interacting
> > correctly.
> > 
> > Find the cause of the nulls and we might make progress on this.
> 
> I went digging and it is a mess. That 3MB file is actually a wtmp file
> from /var/log. The reason is a failure of the "target_dumper" commands
> and that the simplistic serial command handling doesn't like binary
> files.
> 
> I've a few patches which should improve the situation but we're clearly
> multiple issues at play here where issues are stacking on top of other
> issues. My rough list of issues:
> 
> a) stdout logging from qemu wasn't being read and could overflow
> buffers locking qemu
> b) serial data from commands wasn't being fully read and could overflow
> buffers locking qemu
> c) the dumper log reading command is reading binary files like wtmp
> d) the dumper logs overwrite each other so are useless anyway
> e) the dumper logs run on every failed command
> f) qmp monitor dump command also run on every failed command
> 
> I think we'd be much better off if we drop the dumper/monitor stuff and
> qemu runs might be quite a bit faster too.

I agree to this. If target has serious issues like a full lockup, then dumper and
monitor commands don't help anyway. Capturing the full serial logs would be sufficient,
though I'd like to see a live capture of /var/log/message and systemd journal in case
services started by init have major issues.

Cheers,

-Mikko

