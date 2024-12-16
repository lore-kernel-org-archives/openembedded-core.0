Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01367E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:02:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.61583.1734368539305952472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IFnEqDQW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283d48so31373565e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734368538; x=1734973338; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ozG9tnZX7WusVAeJ3QSjQ/bQXz8L4P1oK9RU+V6icVU=;
        b=IFnEqDQWzK066BWJ+xOuPyXYWBmupefQgcbWXKzDZWMT+wVCZ7bDdRkxvRaIBIdE6g
         OE8xvzdPV3NMRasOHdEgiTjZQSbGBojhXdMr4yeK/KO3MuiBOukBl/iCk8lfpjJUN8Br
         +IyDTFtnj+X6pvDPlyA8FvhCwBw4ygxUTLujc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734368538; x=1734973338;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozG9tnZX7WusVAeJ3QSjQ/bQXz8L4P1oK9RU+V6icVU=;
        b=VChJNGHpaFmOOpNBgO7elpmR1QrNPiPqiNxYl4HqV7IuJCPTiLskZkcKruO0EdOD3s
         ZGIzytMJEUt7rGG89WY/yNcDJ/a0jbJx9TIq3I/NCUObch4oZfUuiD//EVvEVdPBgSX/
         hODNsoqck3N9dOKQNJzJRCq1VYSF5HVyqYiOamczQ2lA5//InhkGBCAhme3iLEQJKoG3
         tUGP0ZpJh1QruDLURGKgmUx80C5HFv6gwxbw/Y7AILNZnLSrQFeEkhCNblcAVxN/yfKg
         jtCmy5vCmoildGCl8CrrTWa8u8cSX0SuTr6EzoshMQTeih4lFQo4Q2a4x505AvP3rCoA
         kULg==
X-Gm-Message-State: AOJu0YwA4s7Hbz5RAfOmP9yDDyBbF33fu8LKkmszQfEMHgIE6BahBAxU
	YD6hLhKboeUNMo8uARnoWWw2jPYkyz+nll7EWjthyay0eqW/nFZIqmLuh5UAOi0=
X-Gm-Gg: ASbGncvQ7tgn/C46+rTsFom5N4+KoMnQBxTVc+GMkT52NlffiHSIT6rts+uOvXeeo8B
	SCF6qw7K/ArAetB0cV7F4437AHagnacpGwnhv5UquMd4tz7IS7GMS3nA8JyDCQgGtNCJ6PuPWbt
	hiCOdm0dS/mz/agkFbueRUH25ZR6Xxree5WYVqyhym5MCen/2jn+FN/N0/knBYD6oOyt7g2wFBw
	1iIMTuRNCrzhEVYt5MTu4vmW5LgMGwl/FByRCAW1my5KsNkkqevAbSXXKIp9l/yy2jwFoQ58pgO
	ifCY24Ka0mwajq2SGG3e9sqBG4sl2FWBUy9M8aZCVeix9w==
X-Google-Smtp-Source: AGHT+IG/D/dNg4fvL7D9mX/1LCwEN4AwEUjKUxlAwt0Me0ABN0YIzLwgMpfA1obciw6o/pAMc0GIPQ==
X-Received: by 2002:a05:600c:1c0d:b0:434:f871:1b96 with SMTP id 5b1f17b1804b1-436476d18dbmr4284285e9.29.1734368537437;
        Mon, 16 Dec 2024 09:02:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7? ([2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362c8fbasm89813365e9.44.2024.12.16.09.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:02:16 -0800 (PST)
Message-ID: <7262a79ef16c1e01a26491d0a6cc1ddc46d969df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icecc: fix PN 'no-pn' handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Mon, 16 Dec 2024 17:02:15 +0000
In-Reply-To: <20241209173815.lq7fh5nr55mttn6u@pengutronix.de>
References: <20241209164608.3595821-1-m.felsch@pengutronix.de>
	 <180F920C983A7BC6.8554@lists.openembedded.org>
	 <d470ced4a402955d9061201ba33c8b875f0bce63.camel@linuxfoundation.org>
	 <20241209173815.lq7fh5nr55mttn6u@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208781

On Mon, 2024-12-09 at 18:38 +0100, Marco Felsch wrote:
> On 24-12-09, Richard Purdie wrote:
> > On Mon, 2024-12-09 at 17:22 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> >=20
> Okay, thanks for the clarification. I'm not very deep into the
> bitbake
> core development.
>=20
> > > If we're hitting the "NULL prefix" code in icecc_version(),
> > > wouldn't it
> > > be better to special case pn =3D=3D "no-pn" there, note that it is at
> > > dependency parse time and return a dummy "parse-time-dummy-
> > > icetarball.tgz" value?
>=20
> I used the current location (use_icecc) since it makes no sense to me
> to
> check for recipe names (disabled_recipes, enabled_recipes) if we
> can't
> use the PN value.
>=20
> > I meant to add, if we rewrite some of these functions in python,
> > these
> > issues would go away as we don't expand data in python functions.
>=20
> Now with your explanation it makes more sense to me why only
> set_icecc_env() failed... Thanks a lot!
>=20
> > The modern way of doing much of this would be a python prefunc on
> > the
> > appropriate tasks. I have to wonder how many people are using icecc
> > :/.
>=20
> Okay, I will give it a try with a python based prefunc.

Just wanted to say thanks for that patch, it looks like a neater way to
fix this and likely other issues too.

Cheers,

Richard

