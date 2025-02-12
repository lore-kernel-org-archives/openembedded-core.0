Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5027BC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:39:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.11337.1739353136720564117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 01:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z0vD2m7j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4395561ab71so16275315e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739353135; x=1739957935; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oSL0MrWd+6gjTi0EqYSfqLY0h5le47H5nEofFDqwGEI=;
        b=Z0vD2m7jn0/TDYFHSrrUnkYjBRDw1GDKBhq5suJSdCBQ+NkdhCwVKv4SS5RBHJMwgF
         3CWG+qkYxMH/wlS5OtUBO3UAE4vt+YpQRE4/7Sg3CnCb9wBuBl4Day9z71/9dT6d4+0a
         KKUYe0OFZyZeT3O7LT1VA6OvwYrsrRPJ3Ke0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353135; x=1739957935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSL0MrWd+6gjTi0EqYSfqLY0h5le47H5nEofFDqwGEI=;
        b=ddh3jSmw8R2W+OsBPQkhvkod1eBrrw6lGHVwXIe/NdpTtmZACsBijyQK6zz1Qgydes
         pcrvIOE8VJEyDJ4sWkvpo6L0tdLycs71b7qb/wwsMJKwIP/QZai3bzwBLT5IL1QdR9Ye
         Gc3DBs064IMaWa6w0ITc/Ew7uRE9c5Sv9Qk/m73Y7i4J9KWxxw7WzAQxH2Q7uDTW8Mlh
         yCgajnOo+IfZWVy9XCHSqvqKUf++KqHduz54tz49sIKqk9dvrRB0AYioDefL+/Y5R7tt
         iUCsp7ibAIkwsTFevWn9vja/asaOEXWbKQix7NGYTP9Jw1fo9Es6a/Aagq9119QGQ7nw
         zJpA==
X-Forwarded-Encrypted: i=1; AJvYcCX+RIeOxYsvkbzLG7jpWAMvu4iakrL5/cRI2bAqUDEdkXdFMbzhNSHVFGi3oXE0xquIg91VGB9K4azYJAYpnMNkSw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7aGWtZaqv5pmdgNOzYOSJko0dZG5s5WLIfaP7QKkrn9X8LtOc
	MwPJAdkwJuj6jMpju6ofiTsMEWjKZ9pn+Q1zZ2m6UPntrzvJkOdzqrvBn4azSMo=
X-Gm-Gg: ASbGncssI0IBxCAUjWbcZpsZdq6mIK7t39u+POncX6d9WK2x5T2vxw2I/xBHd7bbMwy
	ZWe8dzfpnLeKSEVgPlYpi0iv7AXd0jlqKvGWX2cYSw9SF7C5HSK9GqJM89F5NoOJFJfqhsbIurh
	elmP9uNxsouQEu36wN9JArYSbBwQqGG5rj4RFCENZJvRumeEyp4tm8sZ5I+yq1MuUApW2/CPPFZ
	cUCXAWVns8kZ9eDUogWNhKKzt0cDAs8+e90OacXiP37CJjigkwPVcizoY+nw6ztMzNVlzImIyQE
	aEqmG6jcu94qu3cSMbno744dsDoYIr+U/0LbzijElTGU9tBWuWf6LODQv7UfoP5qqWEbQqx3Hcs
	iQA==
X-Google-Smtp-Source: AGHT+IGPAFKOFQRGjwM/MqL38WezIObrzR+6rSVh6gnG1LyvnbM3Pw4Ic01U2x6RzgnOVBuIuyitUw==
X-Received: by 2002:a05:600c:c0c:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-439581caafbmr20160645e9.28.1739353134725;
        Wed, 12 Feb 2025 01:38:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af16:73ba:601:d9ae? ([2001:8b0:aba:5f3c:af16:73ba:601:d9ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f22fsm14279855e9.5.2025.02.12.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:38:53 -0800 (PST)
Message-ID: <ea2233e4e8854e59bf2221ead2cb9bab33a6a969.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 05/30] lib: oe: add vendor module
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Wed, 12 Feb 2025 09:38:53 +0000
In-Reply-To: <db370fd9-a390-46c2-bf5b-250110bb0c96@weidmueller.com>
References: 
	<20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20250211150034.18696-6-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org>
	 <db370fd9-a390-46c2-bf5b-250110bb0c96@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 09:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211216

On Wed, 2025-02-12 at 10:27 +0100, Stefan Herbrechtsmeier wrote:
> Am 11.02.2025 um 22:31 schrieb Richard Purdie:
> > On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.ope=
nembedded.org wrote:
> > > From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > >=20
> > > Add a vendor package as base for package manager specific
> > > implementations to resolve dependencies and populate vendor directori=
es.
> > > Add common dump and load function for SRC_URI files.
> > >=20
> > > Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmue=
ller.com>
> > > ---
> > >=20
> > > =C2=A0meta/lib/oe/vendor/__init__.py | 28 +++++++++++++++++++++++++++=
+
> > > =C2=A01 file changed, 28 insertions(+)
> > > =C2=A0create mode 100644 meta/lib/oe/vendor/__init__.py
> > > =C2=A0
> > >=20
> > =C2=A0
> >=20
> > Initially I was going to ask there to be a "fetch" or "download" in the
> > namespacing. That then made me wonder if in the interests of clarity
> > and namepacing, these vendor classes should go into
> > lib/bb/fetch2/vendor in bitbake?
> >=20
> > =C2=A0=C2=A0
> The package isn't limited to fetch / download. In some cases it
> populate the vendor directory and could be used for the license
> extraction in future.

"populate" and "extraction" sound related to the fetcher.

> =C2=A0I think it is a bad idea to move code into bitbake which isn't used
> by bitbake. It will complicate future development without any
> benefit.

You could argue that about the fetch module. It does encourage
strong/stable APIs to the modules, which has been of benefit. I can see
the arguments either way though.

> > I appreciate the class in OE will use them and separation into bitbake
> > can be a bit awkward but it would mean we don't confuse this with any
> > other kind of vendoring
>=20
> What do you mean by "any other kind of vendoring"?

When someone customises their BSP, the original might be from "the
vendor" so perhaps this code handles that? OSV as in software vendor is
going to get confused with this. I'd imagine there will be other ways
people could read it too. We have TARGET_VENDOR, HOST_VENDOR,
SDK_VENDOR and so on in the triplets.

My point is that if someone sees a "vendor" module in isolation, they
aren't going to know what it relates to. You're really close to this
topic so it is obvious to you, it is not going to be obvious to others,
or perhaps even you in a few years time.

Cheers,

Richard


