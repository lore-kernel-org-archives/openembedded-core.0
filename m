Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF17EE95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 12:30:49 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.59848.1696854640607572562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 05:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OT+x5/Tw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso8016139a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696854639; x=1697459439; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pWIogwp/Z5CR2HQjQ4oFsrIOY2Ucw9nIz0jnzH3aNHQ=;
        b=OT+x5/TwvXEHcqBJCRoHiwDf818Q5LqeHbiHqq/QFljrxJdJpxBgVIAuK05KYrOoqA
         yw2E5kGVG0pCzCFns9uMpiQ6bH8bpmaGUG7GAgCJoOVM9X85Im32mYtuUNIAB2yEan54
         2Dy1D6PY3AX9epPuGv8psLHwvstwBdgUlKpbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854639; x=1697459439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWIogwp/Z5CR2HQjQ4oFsrIOY2Ucw9nIz0jnzH3aNHQ=;
        b=bqfPUnsgVvPzE+fbMtVQ/1k7MBLgVdXC+7L0tVSNJUpCbh31DcC/xvIGt3ceLu0oYx
         wHca0TwwyBKMi8FnK18ksGhhJb2cusXoDl4psUhcXGvdYgodepqp+RrXWdgvK7aUi6hZ
         fsWgw4j3m0XJn9WADTxJ8MU+04+3V5KHwZ8bwQKoxLlhQrfGWS5n6/xUDZ450D3yp6Sg
         qkit8dHzUzdEw1wG2U5qSjSHD016bkei61LESCE/Inq2S9v+fbpYGooRS0hCBzU6Le9Q
         0Hymkcb6ltzT8ekDOyAIGcaYM765/OuYreynkRBkQ2hJOWywnIqjWGRILVZvIFWwQHR0
         Xx8A==
X-Gm-Message-State: AOJu0Yy570J7trf+34BT9MdCUAouJPlb8jxm/ElzV2ek2T/JnNuXcaEB
	Uc0DxFjDACqPa2PebTBehrrmiA/1k1ZBptaYKTo=
X-Google-Smtp-Source: AGHT+IFFfKYaDzIPuICKye0vi2cti0HgsYF4YqAVT3c3mKaSCipdcH3dgNuYRoczb7BnnkeciabfhA==
X-Received: by 2002:a17:906:2250:b0:9ae:69c4:5b4f with SMTP id 16-20020a170906225000b009ae69c45b4fmr14571750ejr.19.1696854638450;
        Mon, 09 Oct 2023 05:30:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8318:8840:ca53:f6f2? ([2001:8b0:aba:5f3c:8318:8840:ca53:f6f2])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709063c1100b009b94a8150d8sm6759831ejg.199.2023.10.09.05.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:30:37 -0700 (PDT)
Message-ID: <521bdbceceb506421e496989b30999f780df6d35.camel@linuxfoundation.org>
Subject: Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and
 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Paul Gortmaker <p_gortmaker@yahoo.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, Randy
	MacLeod <randy.macleod@windriver.com>
Date: Mon, 09 Oct 2023 13:30:35 +0100
In-Reply-To: <178C1443D3C8D91F.5378@lists.openembedded.org>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
	 <178C1443D3C8D91F.5378@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 12:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188835

On Sun, 2023-10-08 at 09:23 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sat, 2023-10-07 at 23:05 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > I thought I'd summarise where things are at with the 6.5 kernel.
> >=20
> > We've fixed:
> > * the ARM LTP OOM lockup (kernel patch)
> > * the locale ARM selftest failure which was OOM due to silly buffer=C2=
=A0
> >   allocations in 6.5 (kernel commandline)
> > * the ARM jitterentropy errors (kernel patch)
> > * the cryptodev build failures (recipe updated)
> >=20
> > We've also:
> > * disabled the strace tests that fail with 6.5.
> > * made sure the serial ports and getty counts match
> > * added ttyrun which wraps serial consoles and avoids hacks
> > * made the qemurunner logging save all the port logs
> > * made the qemurunner write the binary data it is sent verbatim
> > * made sure to use nodelay on qemu's tcpserial
> >=20
> > This leaves an annoying serial console problem where ttyS1 never has
> > the getty login prompt appear.
> >=20
> > What we know:
> >=20
> > * We've only seen this on x86 more recently (yesterday/today) but have
> > seen it on ARM in the days before that.
> >=20
> > * It affects both sysvinit and systemd images.
> >=20
> > * Systemd does print that it started a getty on ttyS0 and ttyS1 when
> > the failure occurs
> >=20
> > * There is a getty running according to "ps" when the failure occurs
> >=20
> > * There are only ever one or three characters received to ttyS1 in the
> > failure case (0x0d and 0x0a chars, i.e. CR and LF)
> >=20
> > * It can't be any kind of utf-8 conversion issue since the login prompt
> > isn't visible in the binary log
> >=20
> > * the kernel boot logs do show the serial port created with the same
> > ioport and irq on x86.
> >=20
> > Previously we did see some logs with timing issues on the ttyS0 port
> > but the nodelay parameter may have helped with that.
> >=20
> > There are debug patches in master-next against qemurunner which try and
> > poke around to gather more debug when things fail using ttyS0.
> >=20
> > The best failure log we have is now this one:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5874/=
steps/14/logs/stdio
> >=20
> > where I've saved the logs:
> >=20
> > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/j/qemu=
_boot_log.20231007084853
> > and
> > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/j/qemu=
_boot_log.20231007084853.2
> >=20
> > You can see ttyS1 times out after 1000 seconds and the port only has a
> > single byte (in the .2 file). The other log shows ps output showing the
> > getty running for ttyS1.
> >=20
> > Ideas welcome on where from here.=C2=A0
> >=20
> > I've tweaked master-next to keep reading the ttyS1 port after we poke
> > it from ttyS0 to see if that reveals anything next time it fails (build
> > running).
>=20
> Testing overnight with the new debug yielded:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5895/st=
eps/14/logs/stdio
>=20
> The interesting bit being:
>=20
> """
> WARNING: core-image-full-cmdline-1.0-r0 do_testimage: Extra read data:=
=20
> Poky (Yocto Project Reference Distro) 4.2+snapshot-
> 7cb4ffbd8380b0509d7fac9191095379af321686 qemux86-64 ttyS1
>=20
> qemux86-64 login: helloA
>=20
> Poky (Yocto Project Reference Distro) 4.2+snapshot-
> 7cb4ffbd8380b0509d7fac9191095379af321686 qemux86-64 ttyS1
> qemux86-64 login:=20
>=20
> """
>=20
> i.e. the getty didn't appear in 1000s but sometime in shutdown the
> original prompt, the "helloA" and the new getty prompt did.
>=20
> So the data *is* there but stuck in a buffer somehow. Kernel or qemu
> side, I don't know.

To update, the latest debug is:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5836/step=
s/14/logs/stdio

which shows that it is enough to echo "helloA" to /dev/ttyS1 to cause
the data to be flushed, we don't need to restart the getty. It also
shows there can be other system console messages "stuck" in the queue.

I did also test forcing a read onto the socket but that just triggers a
BlockingIOError exception and doesn't help.

I'm going to try writing "\n\n" to the port after 120s if the getty
hasn't appeared, see if that helps.

Cheers,

Richard





