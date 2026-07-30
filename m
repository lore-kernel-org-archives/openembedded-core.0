Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A860AC55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 12:19:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10394.1785413967838101499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 05:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jq4XDUo+;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495635a85d2so16570125e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785413966; x=1786018766; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jGyOA0zMYqNrIRsXADIDIdpwu+FT9I7iVckTYO5WHQE=;
        b=jq4XDUo+IDghomatPX0xpIZGFduQcqe8Ymuwfrsct6kseLM5dp420UtA/Y6u2ikxTY
         ZuXDoNRhRE2wWV6p2yyem50D0pTqEx0D3GbItuBVztNUWQv1kX+U3+1PosZFav7XYey3
         iN9lxAPXTL+5vQfmNC8f5N1aSPv4RUR/WKLoYvkTlFi2/WB3XpQ9TkrbLHLNG3LpiyEU
         3jS71IYoToOlVXjTGjSYcSYvyVx1/Zzm436c8COs/eYCAHYgpcNj/FZSLxfXmR253N+h
         s7bfGRvW6CgdzVdH36fJaZLdZT4xcB0UVujWvlNoYRFFfkugg4Mh0s2xwGhFqQCIAEfL
         8mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785413966; x=1786018766;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGyOA0zMYqNrIRsXADIDIdpwu+FT9I7iVckTYO5WHQE=;
        b=QOYm5vsSuRT25q4dXB1fWh4Ap2thwO2x4Z55NZk2YBKmGe24m/wdkhVr1YeF0vrXvq
         /Z9rH4JZa6KM/L6ttmGbXdUjhFiSViLlKrNQWBG0a9ek+OSxz30101WyrVtlKicqRCSM
         gNPslcqdd7bmXVGxQvKrPmwfnhR11lPAjPSsyd6gGI4r4IG71T6+l7hHm0TuMX4mWLYT
         flPpMxXkwT7g86j/CJg4qCorQ2789dQY6xkpGib5GpAfIuJk49/kEBjqaYFNbLmXMvIN
         nk1B5WEvCrBL0HgY5+C55JxHKd55LeSnTt63dyvr95/9xzW+KZchCGq1k+QolKuXZutR
         mhXw==
X-Forwarded-Encrypted: i=1; AHgh+RrCTbPJdDkcr35fS8xSMAPSZIfI2UPtsUZBYoBN8M6N2vVGUX8o8Bhod59JAOFtPHfHgj6Tx9H2WvCDPT+RtROyoQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbJlDyeLi3ifO/KAvpx7/CEb1lzrYPGIZ7I+45tRz2tFkIb16Y
	Yx6maydBKs9zdSe5lYI+d2RkMBhS6TtgywcGfQL0Ki/tRGIInJL04TQy
X-Gm-Gg: AR+sD12KDV0FD4dXyKVefeNf/1fhN8KE4pnoRBQC1Lr7WLkFEw3BNdT9qu5mPARDGbD
	o/EgEpWO3q2/aYHBaj9mtTLEoiESG09xk1aYcxBtucF++2P1oYrjHvOCJDnAzWaUWwicififwQe
	jd5FhRnWB9eoqlJwz89Szmq+z5sjo8oXncmYcF7Posa8HXyMlcCX2GnfoaGsBorsI1Ez2o/bqJy
	LnpBhQflvP7a8XCLkyBPImRM4DsttNZWk0UDGQ7HwJIWaEdowfOUhPLjwBkzsG9OdOs6YuzA9wD
	H4eilhitVW5oZFb7+WTn9IJOCFAKgiFUeFt1bsfrX867pULAuPiRPvjjMJsSkF72skG0tLyoOoK
	j3xNtTKOiB3DR7ESu940YYrwX9QDqh13xD0H9oGX+WotusBLnJnMsNax2DbL6PsVun1roTpaGd3
	oHAoFAtSNhcvC9Z1UVz7YBE7i2zDs4+pnThG0jhp9awslA4kaP5dd6kK+K00CRXro9en2sKQ5dj
	+qVxz6BZ8raE+KUAta5blt93LKrnJAvm/8lt58=
X-Received: by 2002:a05:600c:3512:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-49800e93aecmr33126295e9.9.1785413965593;
        Thu, 30 Jul 2026 05:19:25 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496fa4605c5sm134184455e9.1.2026.07.30.05.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:19:19 -0700 (PDT)
Message-ID: <0be60525b600137c0f723c7faa7ab5c2f04934ae.camel@gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: adrian.freihofer@gmail.com
To: Marek Vasut <marek.vasut@mailbox.org>, Yoann Congal
 <yoann.congal@smile.fr>,  "Freihofer, Adrian"
 <adrian.freihofer@siemens.com>, "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
Date: Thu, 30 Jul 2026 14:19:17 +0200
In-Reply-To: <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
	 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
	 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
	 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
	 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
	 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
	 <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
	 <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
	 <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
	 <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
	 <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
	 <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 12:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242345

Hello Marek, hello Yoann

On Thu, 2026-07-30 at 13:52 +0200, Marek Vasut wrote:
> On 7/30/26 9:36 AM, Yoann Congal wrote:
>=20
> Hello Yoann,
>=20
> > > > > > > [1] https://patchwork.yoctoproject.org/project/oe-core/
> > > > > > > patch/20260704214812.365483-1-marek.vasut@mailbox.org/
> > > > > > > [2] https://patchwork.yoctoproject.org/project/oe-core/
> > > > > > > patch/20260630074356.10265-1-marek.vasut@mailbox.org/
> > > > > > > [3] https://patchwork.yoctoproject.org/project/oe-core/
> > > > > > > patch/20260630074423.10306-1-marek.vasut@mailbox.org/
> > > > > >=20
> > > > > > Do you think those three backports can be picked up for OE
> > > > > > wrynose ?
> > > > > >=20
> > > > > > Thank you for your help !
> > > > >=20
> > > > > Sure! They even are in the branch I sent for review:
> > > > > https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smi=
le.fr/
> > > >=20
> > > > Oh, that's nice.
> > > >=20
> > > > > Following Paul's review, I will most likely hold it for one
> > > > > cycle in
> > > > > order to merge
> > > > > the test at the same time.
> > > > > See: https://lore.kernel.org/all/
> > > > > c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev/
> > >=20
> > > Are there any news on getting the fitImage fixes into the wrynose
> > > branch, is this still on your radar ?
> > >=20
> > > Thank you, and I'm sorry for the push.
> >=20
> > Hello,
> >=20
> > I don't mind the push, it's fair :)
> >=20
> > This series is still on my radar but blocked on a wrynose test
> > patch:
> > Basically this:
> > https://lore.kernel.org/openembedded-core/20260706221933.4026508-2-reat=
mon@ti.com/
> > ... but backported to wrynose.
> > Ryan was working on it but did not sent the patch, I don't know
> > what
> > happened.
>=20
> Do you think the fitImage fixes could be backported without the test=20
> patch, or would that make some test suite fail? Please pardon my
> ignorance.
>=20
> The fitimage fixes landed in oe-core master 6 weeks ago and they fix=20
> fitImage usability issues which block me from updating to wrynose in=20
> multiple projects, that's why I keep monitoring this thread so, but=20
> again, please do not read this as a push.

I think going with the four patches from
https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
without a fifth patch which adds test coverage for this fairly isolated
detail is fine.


Important is: We need 4 not only 3 patches:

Adrian Freihofer (1):
  oe-selftest: fitimage: Do not expect kernel property in DTBO config
    subnodes

Marek Vasut (2):
  kernel-fit-image.bbclass: Do not include kernel property in DTBO
    config subnodes
  kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D "1"

Ryan Eatmon (1):
  kernel-fit-image: Add KERNEL_DTBVENDORED support for
    FIT_CONF_DEFAULT_DTB


And also important is: We need time for testing on master before back-
porting to stable. Six weeks is probably enough. But the exact same
pattern ended up with a broken stable branch maybe one year ago. And
also this time there was a state on master which was at least
incomplete (three instead of four patches). But still, I think this is
ready for stable now.


Regards,
Adrian



