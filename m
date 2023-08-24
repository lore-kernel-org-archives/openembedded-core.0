Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A042C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 20:18:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1765.1692908288064425320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 13:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GM+6VkLv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fee8b78097so2000485e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 13:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692908286; x=1693513086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XEpCOi4iPRuktRi8028bnDnGFFLVrWudHmw+uHjjIVM=;
        b=GM+6VkLvKfHnU8+8mhNVo07pe8+LhgfZ+M0q/XTTZzxQr5MPJJWW0Mgnw7nDjevtj9
         yg8sZ5WNrlRGVwDjqSGfzLEoVoluNxsz+YQSjIFfmdjNytgfNz2DwAo7gmlq4CxBceG8
         R5L9z3jc7hnBPRMLu7RLjDEf4w15R1r2RSpkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692908286; x=1693513086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEpCOi4iPRuktRi8028bnDnGFFLVrWudHmw+uHjjIVM=;
        b=h5Z/Bs2Hbu1YzmLPmP8G8m3xGcFANLv2D2YDWQ9m1y3p50HhO6prU52ICaVH8ZLjiN
         tu1HUVlodTWS1HZV4qIHKeVyPIPjTy7rC1tQxP4ALGnJY257yU+Zpa4BueM4n7vJS2tM
         pCEFD1/NJFJgHe0vwbC1tpLCT/oDBtXJ34pD1gC0K4u87+ivL0X/6zuySmDFuGOKXU2c
         yLdYmgkiASiaT1rJ81z/lJtiCIjbnsb4ccWiRBm1FFRO6f1UBApCTvTXq/Y/OkIRTN61
         jQ5fcCJsuKavmRs92U/D3qsLG0mCIAoR0vLv0NTHdL36vOxFDXnKHBPyf4kC4zqAFfJx
         ad3A==
X-Gm-Message-State: AOJu0Yzd1ojo3rejF/8RpoRfZd4G6HKRYBOglvO8tVZqrd3UE22C3fBA
	D948+8e2QdWMtTKE/vsZCajlfw==
X-Google-Smtp-Source: AGHT+IENLq6eTxHB8YGLlcNTCq7PVPpr7OQnAuoLdFi6v4olJ8+8qRZPmTENXyGuHy0XZLOHVeLT7g==
X-Received: by 2002:a7b:ce86:0:b0:3fe:45e5:f6ee with SMTP id q6-20020a7bce86000000b003fe45e5f6eemr13128878wmj.19.1692908286536;
        Thu, 24 Aug 2023 13:18:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f51:6592:7dd5:4623? ([2001:8b0:aba:5f3c:5f51:6592:7dd5:4623])
        by smtp.gmail.com with ESMTPSA id s16-20020a05600c045000b003fee0741b8csm3491757wmb.23.2023.08.24.13.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:18:05 -0700 (PDT)
Message-ID: <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2023 21:18:03 +0100
In-Reply-To: <177E56C1DFAB4DFC.13053@lists.openembedded.org>
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
	 <177E56C1DFAB4DFC.13053@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 20:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186672

On Thu, 2023-08-24 at 15:04 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2023-08-23 at 22:16 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Tue, 2023-08-22 at 23:01 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > so the commands are stopping mid flow for unknown reasons or the ssh
> > > connection fails. I can't tell if this coincides with an rcu stall or
> > > not. Both logs do have rcu stalls in.
> > >=20
> > > After these failures the system does continue to otherwise work
> > > normally and subsequent tests pass.
> > >=20
> > > I wonder if the slow emulation might be causing the networking to
> > > glitch and break the ssh connection.
> > >=20
> > > I'm at a bit of a loss on where from here.=20
> >=20
> > I thought I'd update the thread with new information.
> >=20
> > I went back to the start with this and looked again and what is going
> > on. Interestingly, I found one of the autobuilder workers would
> > consistently fail the qemuppc-alt configuration for core-image-sato-
> > sdk. I paused the worker and experimented.
> >=20
> > I saw two different failures (included below). One shows systemd-udevd
> > timing out on it's watchdog after 3 minutes and resetting, including
> > taking out an ssh session running the cpio configure command. There was
> > no RCU stall reported.
> >=20
> > The second failure shows systemd-logind as well as systemd-udevd with
> > the 3 minute time out, the kernel complaining about missed IRQs, an RCU
> > stall and lots of breakage following including cut ssh commands.
> >=20
> > I could not get the cpio build test to complete.
> >=20
> > Interestingly, I came back to the same image/worker later this evening
> > and now it all works fine. The difference is earlier there was a world
> > build running on the worker, which continued to wind down even after I
> > paused the worker. By the evening, that background load was no longer
> > present and the ppc image works in isolation. This tells us the issue
> > is system load dependent and only occurs on loaded systems.
> >=20
> > I suspect I need to replicate the load and retry locally, see if I can
> > reliably reproduce the hang. The watchdog won't be present on sysvinit
> > systems which also show the issues but I'd guess there is still some
> > other starvation/timeout occurring.
>=20
> I've now seen the failure on the autobuilder:
>=20
> * with linux-yocto 6.1.38
> * with linux-yocto 6.1.46
> * with qemu 8.0.4
> * with qemu 8.0.3
> * with qemu 8.0.0
>=20
> I was a little suspicious of:
>=20
> "hw/ppc: Fix clock update drift"
> https://gitlab.com/qemu-project/qemu/-/commit/73d6ac24c81f1aeae554d469616=
c9181511e6523
>=20
> but we've tested with and without that.
>=20
> qemu has just released 8.1.0 so perhaps we should try that next.

qemu 8.1.0 brings with it a new set of problems but I've reproduced the
hang with 8.1.0 so it does not solve that.

I'm really struggling to understand which change brought in these
issues for qemuppc.

Cheers,

Richard

