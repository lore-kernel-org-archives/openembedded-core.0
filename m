Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368A0C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:05:06 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11759.1692885900178126064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 07:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yr4yOXCZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31c79850df5so500408f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692885898; x=1693490698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t8zFqODBk1bqql9zZRjS2k6CSGLbl7uqHjtz8152N80=;
        b=Yr4yOXCZO7J7ztkQkb1DJyadDzm3jrVEZXV83kDpxU9OpfCcNZ7L9CYZcj/oACr1/I
         FmH5d33gvGs6KVC2aQPBCUa1/QNpsZp2e8dRL9LqLWM8h+mQaWD9rxSj0zN9G8DB9C9j
         N53DyHvXUhybTIc8AKrF/HLdNZYa3C3lvy6B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692885898; x=1693490698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8zFqODBk1bqql9zZRjS2k6CSGLbl7uqHjtz8152N80=;
        b=O6IsYMDXSlbjeWZFu685UbifPAJOfumxmXMcm1ZDVYy4GOdx9Tv6oBY2hEJIdwBnLc
         Ll7JxTpVeuLCRePuw1J2oNYRAq/WZ0GWHkAVrZDFKBm2+bEv7kp6UeYvKRIMyOdABZbs
         2xeXx0vWRTULU8tEch/6lsZFO/LxvNmORQnDawHYDTrbzqRlI5zYCl3EmCJqpanxd7Nm
         rJ0B7NTmy2www++eJJHL1uW6jGS1FVjDdlkYvznB3fiKlXLckF0h/Ph3iJkW1miPL8So
         8B0UhHCcWlS++N25A4kDVEC/r/GoHIyZOB1Mkkm7x4IHxfmprQPIBa6gvBC5oUd5tYt/
         saOQ==
X-Gm-Message-State: AOJu0YySFf/3L1MBpFHZiHOcR3msyJU8KeUZsB2ybXLptTF17jTJnuo7
	a0I6MX9lFkMpYhqVcCiXMkZFag==
X-Google-Smtp-Source: AGHT+IEq8TohlV3fdsSINwj7qiHd/gOsB/0vYiWHW54pNgBg/OC32x4Z9eK5voNkiY7OU+8frbLMlQ==
X-Received: by 2002:a5d:5101:0:b0:317:e515:d623 with SMTP id s1-20020a5d5101000000b00317e515d623mr11253794wrt.60.1692885898543;
        Thu, 24 Aug 2023 07:04:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5461:c902:2158:9a5d? ([2001:8b0:aba:5f3c:5461:c902:2158:9a5d])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d6101000000b0031c612146f1sm9036880wrt.100.2023.08.24.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 07:04:57 -0700 (PDT)
Message-ID: <5eea44f9b7ea3c73fc1441ab307ff533239159d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2023 15:04:56 +0100
In-Reply-To: <177E1FB73F514F09.8058@lists.openembedded.org>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
	 <177DAAB2E4C3384A.4797@lists.openembedded.org>
	 <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
	 <177DBC07E94591CC.4797@lists.openembedded.org>
	 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
	 <177DD39B5534099F.27837@lists.openembedded.org>
	 <177E1FB73F514F09.8058@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 14:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186662

On Wed, 2023-08-23 at 22:16 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > so the commands are stopping mid flow for unknown reasons or the ssh
> > connection fails. I can't tell if this coincides with an rcu stall or
> > not. Both logs do have rcu stalls in.
> >=20
> > After these failures the system does continue to otherwise work
> > normally and subsequent tests pass.
> >=20
> > I wonder if the slow emulation might be causing the networking to
> > glitch and break the ssh connection.
> >=20
> > I'm at a bit of a loss on where from here.=20
>=20
> I thought I'd update the thread with new information.
>=20
> I went back to the start with this and looked again and what is going
> on. Interestingly, I found one of the autobuilder workers would
> consistently fail the qemuppc-alt configuration for core-image-sato-
> sdk. I paused the worker and experimented.
>=20
> I saw two different failures (included below). One shows systemd-udevd
> timing out on it's watchdog after 3 minutes and resetting, including
> taking out an ssh session running the cpio configure command. There was
> no RCU stall reported.
>=20
> The second failure shows systemd-logind as well as systemd-udevd with
> the 3 minute time out, the kernel complaining about missed IRQs, an RCU
> stall and lots of breakage following including cut ssh commands.
>=20
> I could not get the cpio build test to complete.
>=20
> Interestingly, I came back to the same image/worker later this evening
> and now it all works fine. The difference is earlier there was a world
> build running on the worker, which continued to wind down even after I
> paused the worker. By the evening, that background load was no longer
> present and the ppc image works in isolation. This tells us the issue
> is system load dependent and only occurs on loaded systems.
>=20
> I suspect I need to replicate the load and retry locally, see if I can
> reliably reproduce the hang. The watchdog won't be present on sysvinit
> systems which also show the issues but I'd guess there is still some
> other starvation/timeout occurring.

I've now seen the failure on the autobuilder:

* with linux-yocto 6.1.38
* with linux-yocto 6.1.46
* with qemu 8.0.4
* with qemu 8.0.3
* with qemu 8.0.0

I was a little suspicious of:

"hw/ppc: Fix clock update drift"
https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1aeae554d469616c9=
181511e6523

but we've tested with and without that.

qemu has just released 8.1.0 so perhaps we should try that next.

I'm still struggling to pin down exactly which change caused the
problems to start...

Cheers,

Richard





