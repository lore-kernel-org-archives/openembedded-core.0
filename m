Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9EDC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:15:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.116962.1738678508481235329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 06:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h4cVgJxv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so4997283f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 06:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738678507; x=1739283307; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i52+00T6wQ0kE0jyPOWCsuQHqnk5ex1oeD1cAddeeHA=;
        b=h4cVgJxv7KjBpm76B9aqjNGVRe8XS+R7vR3WCMDVzKY0aXo4sPODzG7dLhz6snhMPI
         D+/MwlBoSEbkUNhoSVjwcvEpa5E54YUTaHAVIjZ9tOlxVscUlaEfoIdnrrP0AR/ZBSL+
         3ySrjWaXD2I4beIuV3H04T5od86aXHW5eAGxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678507; x=1739283307;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i52+00T6wQ0kE0jyPOWCsuQHqnk5ex1oeD1cAddeeHA=;
        b=HpDaGAUQWytSr98vFU0Bn4DI2Jge0ZEPQL1ndUu8yZvnHZHENxsXMzDqdjeUFBzCwE
         84VhVgGq+rs92huIG/QL0ukarBuNX09pbexhlzlq4Qd8LVydTRzct/939Ndobn4LueYM
         kWdC3ouewCjmqG/SuB70yArbq2EqRxOV6iu6p17j1mfkvkDrOQTwqJK/ChFEiWeWn2cl
         ojP2wGi67DfpEUvoLMY65S6YQ4h/X61Q+0LfuSMCqlnXf5VeDVAFTS8IpVnQtPneMjNd
         BHLc47sn2AcZfP2SOa4sXiEPfUxba9DfVf6jKuMrWs0CTXP2HIEutw+5W9/WYr9uHq/v
         PURw==
X-Gm-Message-State: AOJu0YwqGMHn/MPaegywzgh59WmGb5vu6n9/triQ1V1LQFVV+UgUG5vW
	aTc7fEa1DnYu2JzEuSuJTS+3vvtlNNK3MASrSG1lH4SnyjLwSOhVZVAqw1Ftrow=
X-Gm-Gg: ASbGncuifRD/v4Ebqo7DWoHLBKq+huLusssRzL/w7pPCmgczP8Ju+PBNi5vSXpRljip
	ZXxi9AMa++d3vW1IsGTxowACQZoKXYjB9O6uhDqL9uXAH+1KRKc33vf8e6YoNh2xFvY4O9AxKNi
	91WyPRFK8k01Mdd94jQl3/V+PSZENAHdRQY+6jFmqtuureEbouSeaNUdxigAkAiqu29G71Fk1Eq
	uE99HlZ2XTbFpHLLA+ij4/DegkiDl/82ClTZCadB5ERQzYc6zrWtR3b6xhKz4zVqBHvNVU7b51H
	TTaohtT6Q6/EftxeiRXEgExn+YDWArNsA7KlShMjnO5ceLft9v3l9taGp/ALhIdZaDiyR208JYe
	DT/Og
X-Google-Smtp-Source: AGHT+IHtkYpW05p3N4qy6gDzvWtP590cgUsuGJm2PwgZsFGEnM4ZS+cpndOwBYW5bwcx3bgr3dVriQ==
X-Received: by 2002:a5d:584e:0:b0:38a:8b00:6908 with SMTP id ffacd0b85a97d-38c520b0b23mr22730353f8f.54.1738678506798;
        Tue, 04 Feb 2025 06:15:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b0f0:1828:fe17:cc0d? ([2001:8b0:aba:5f3c:b0f0:1828:fe17:cc0d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38da6b73174sm2311889f8f.65.2025.02.04.06.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:15:06 -0800 (PST)
Message-ID: <38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sean@geanix.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 04 Feb 2025 14:15:05 +0000
In-Reply-To: <ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
References: <20250117130851.4055166-1-sean@geanix.com>
	 <C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
	 <3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
	 <ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210804

On Tue, 2025-02-04 at 14:59 +0100, Sean Nyekjaer via
lists.openembedded.org wrote:
> Hi Ross,
>=20
> On Wed, Jan 22, 2025 at 03:04:35PM +0100, Sean Nyekjaer wrote:
> > On Wed, Jan 22, 2025 at 01:41:11PM +0100, Ross Burton wrote:
> > > Hi Sean,
> > >=20
> > > On 17 Jan 2025, at 13:08, Sean Nyekjaer via
> > > lists.openembedded.org <sean=3Dgeanix.com@lists.openembedded.org>
> > > wrote:
> > > > Some recipes(systemd) requires usrmerge. Create the required
> > > > symlinks for `/bin`, `/lib` and `/sbin`, when installing
> > > > nativesdk
> > > > packages.
> > > > Enable the symlink creation by setting the `usrmerge` flag in
> > > > DISTRO_FEATURES_NATIVESDK.
> > >=20
> > > This implies that there is some layout dependency between the
> > > target and the sdk environment. There really shouldn't be, what
> > > broke to cause you to send this?
> >=20
> > Hi Ross,
> >=20
> > In order to build and test our rust programs, we need libudev which
> > systemd is providing.
> > We are running our tests with nativesdk.
> >=20
> > Systemd is requires usrmerge.
> >=20
> > Hope that explains :)
> >=20
> > /Sean
>=20
> Forgot to ask you yesterday at the OE Workshop.
>=20
> Is anything holding this back?

Yes, there is.

You're using the SDK in a way which it wasn't really intended for and
we're seeing "feature creep" where systemd's requirements being pushed
into places they don't really belong.

If systemd was truly "cross", you wouldn't need to force the target
layout into the SDK. The SDK layout should be independent of the target
system and this breaks that understanding. If we accept this patch, how
can one SDK work with different init systems?

So I don't really feel it appropriate to merge this change, sorry.

Cheers,

Richard



