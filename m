Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C616AFF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:12:55 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38660.1777277568775836092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJ0qg8Ek;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so65848995e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777277567; x=1777882367; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b+QdKExUaUyiksUVtC5gvuB8hXYey4JaUYPKOGppvGg=;
        b=NJ0qg8EkYPJWZPpJE5oATvOLdFjbVvnQ14O/EO99ZdPJrZ+1gKiwXTCXZqR0OmrhiN
         BW2kRiAFd4aw3lOXc6BQfcYuCBZa/OjU28HJhQeMcUE7qhv2Ulp3EGjykV/EErmu47B6
         /e1yTPC8EDKja0C1zyw7Dy1VkY303YVcrCJ6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277567; x=1777882367;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+QdKExUaUyiksUVtC5gvuB8hXYey4JaUYPKOGppvGg=;
        b=kuZ2myidoTBoxeYTghOviE9GxDVDJshlCFc1rGa4CSjfQupyXv65Sp5z8A+zz+n2tW
         p+OnagL03V/bUfIodjvIFALQUY3vDWqruhKDDYycFBdpEw/LOfaW+nz5xJOEfPD+iGgh
         lXvwJkvZFZRoY6xJ35G45ZDuflGYT33gNpRfT1enS+Ny2lEu7lFG/3+1+m36wHokxzyt
         jXW5uxVoj0UBdRV8wDHHdey8Hidxo7YGQDnU7EHB4rhxisGZgAPJikYzw/X+mLk5xleE
         NleH2JCw7PZFM4BgdPM4C0rJecc9SMwUOn4e40AMjhpSLJOSflZLe63atRL8UdioKJB7
         h0CA==
X-Forwarded-Encrypted: i=1; AFNElJ+6qXUXCal2i4PvD5AM0IiaIKqy+l8wFWDS2ZoSmrF3PpXF995gKnbeBcq/hI0rPPyFUotF7s2EGTa7tBYDAWrq5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEEEhOS9010d8Od7AUHK+h0wdPCJQ7vZTGTQABa6TTMxHQBaew
	QopBmJrWBcMuvQ8ODFW/hU/ejb/AELImMUiiZ8h3SGtx0SRhisqSIxWxr3SHHl16myE=
X-Gm-Gg: AeBDiesHT5kszC5szkucREi7/0ZLFVjFOZ9Bt3hVTz2r5Aw+J8ynDtXSZTpXxXY3cw1
	SeKSp+ozW8BY2AVqYuWxEZoW9QfrX13/f2XhnKzCOLFo8MW87v6MEEjwddTOhS4fvozILD/A06K
	e9wDWJKm3KT+dJ1HKBBaBK1to1R6WAEJ9rSsOrpNclLlhF/kIlsfd7fDm+9A7gB4oOSpy58tqcN
	ChaKY3rB9rvyZR0DdB7MKxLZKQ8NHBkCy1c5oabC9QXrL8UgVj2r2to60p8qir7w9C5Uv7XxC07
	ZYQGikYcLRDvtgXstHA8XyVCMyClwoCl0mlgde+5nGXPLr89lRJ8Bf4fAj6Qc9BQD3N6d2fL7EI
	KPiVNhFKReBXpD7ijQkOQJADcBWkAPui3QRlg2kQpRnYjISAafWtoHQy9Ns+7+d5W73qy+ZImSq
	kqQeOp80Pp2KB++kBZg8ZjmvKIaLGG1JS+WLD7clwsUQiKg3zL2XONeOLoCbtfHBykNxhuCaclb
	n/JWH27b41G6LsQPOGZqNx2WiU=
X-Received: by 2002:a05:600c:2d91:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48a5301bc69mr232680285e9.16.1777277566990;
        Mon, 27 Apr 2026 01:12:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b? ([2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm448572445e9.13.2026.04.27.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:12:46 -0700 (PDT)
Message-ID: <2a147c52ba3934f42ef8f337b1bde0ed1ecec90c.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/3] python3-shacl2code: Update to version 1.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Marko, Peter"
	 <Peter.Marko@siemens.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, "jpewhacker@gmail.com"
	 <jpewhacker@gmail.com>, "olivier.benjamin@bootlin.com"
	 <olivier.benjamin@bootlin.com>, "antonin.godard@bootlin.com"
	 <antonin.godard@bootlin.com>, "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>, "thomas.petazzoni@bootlin.com"
	 <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2026 09:12:45 +0100
In-Reply-To: <6mazmQ5FTz6zTys132BKJQ@bootlin.com>
References: 
	<20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
	 <7o6_XKvhQ267WrzPXGIUdQ@bootlin.com>
	 <2b38a0354bdcb17270f8ce97db3eca2835320b3c.camel@linuxfoundation.org>
	 <6mazmQ5FTz6zTys132BKJQ@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 08:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235992

On Mon, 2026-04-27 at 10:05 +0200, Benjamin Robin wrote:
> On Monday, April 27, 2026 at 9:59=E2=80=AFAM, Richard Purdie wrote:
> > On Mon, 2026-04-27 at 09:25 +0200, Benjamin Robin wrote:
> > > On Sunday, April 26, 2026 at 9:22=E2=80=AFPM, Marko, Peter wrote:
> > > > I have sent ton of new false-positive cleanup commits this weekend.
> > > > For many I couldn't find any explanation why they reappeared.
> > > > Since there were also new true positives I think this is fine.
> > > >=20
> > > > But there should be a follow-up investigation for most of my
> > > > commits to identify why those false-positives appeared and if the
> > > > tooling can be fixed.
> > > > Peter
> > >=20
> > > The current behavior of sbom-cve-check is documented here:
> > > https://sbom-cve-check.readthedocs.io/en/latest/design.html#find-appl=
icable-cve
> > >=20
> > > I don't think that the tool is not currently working as designed, but
> > > maybe
> > > there are wrong entries the product database. Also maybe we could
> > > improve
> > > the algorithm to try to reduce the number of false-positives.
> > > The main problem is that the current state of the CVEs databases is
> > > not great.
> > > This is really not an easy problem to solve.
> > >=20
> > > Most of the time, the proper solution is going to define CVE_PRODUCT.
> > >=20
> > > If you have a list of CVEs that need to be investigated, could you
> > > send it.
> > > This way I could explain or investigate why there is a problem?
> >=20
> > One idea in the back of my mind is our own "enrichment" data.
> >=20
> > Rather than recipe fixes every time, perhaps we start maintaining our
> > own supplement to the CVE database data?
>=20
> I am not sure this is the proper way of doing this.
> =C2=A0
> > That might be useful to others, encourage collaboration and perhaps get
> > the upstream entries ultimately updated?
>=20
> The proper way is to contact the CNA which is responsible for the entry.
> For example for https://cveawg.mitre.org/api/cve/CVE-2025-9951
> The providerMetadata->orgId is 14ed7db2-1595-443d-9d34-6215bf890778, whic=
h
> is "Google LLC", and the associated contact email is "alphabet-cna@google=
.com"
> (see the CNA database inside sbom-cve-check: look for cna.toml)
>=20
> But yes it is more work...

I agree contacting the CNA is the right thing to do, however
realistically, some CNAs won't update or respond, so having some amount
of supplemental data is going to be the reality. Our aim would be to
keep it as minimal as possible but I suspect we would struggle to reach
zero based on our past results (which isn't for trying!).

Cheers,

Richard

