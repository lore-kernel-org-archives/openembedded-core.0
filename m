Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B5DC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:32:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.12352.1739457152839373941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qfv8URzW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso755111f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739457151; x=1740061951; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j3Urus9GYnZ0Vpuj5F2Sg6Osr9jwgJKfRu2hcfK43y0=;
        b=Qfv8URzWDkZA+bOz5C5WiAsQqOgW2pqRpX1M616m9fX9axnGqbe98ifWJxFo7LIg93
         peaqQJl89SaQkaobYT1whHF9fLNZpiTiFUDtTPGg8rEmXSw/7qnUg+AD+h0o1b71fOdv
         LHkaiajvLC4Ps5OYO/am8Cdhz0Jd6V0oLwboY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457151; x=1740061951;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3Urus9GYnZ0Vpuj5F2Sg6Osr9jwgJKfRu2hcfK43y0=;
        b=iClJbioOXGJaoUovt3eP7KXcyyXZQzrX+rh0Y/+pKiG+elikt8mkyqS6V+LrHvPgiP
         B+L9PUscELbso17GJQM1AzBGgXlFGzI7M/gPhmIWTZ8/jRb9vEhn7W8XKWI1I7QjmDkH
         XLYWVumc57+SrJnRQV4SCAcar1iBOtrtgsHPuDADaqsggMCDVViIWkLCrNfFDwOzSpm6
         ztiwzgGrRQO93sWGIsI8Y2nC8tFFpRs899QhNzz30xeT+2Svr/C7i4kVeWh+1MXXAERS
         0BM729tdYHeUhF1PydutXKUn6jLNlsHATjuuGbdYXbrkJksWEQP9J55FWXbt8Cfjs3FL
         T9sw==
X-Forwarded-Encrypted: i=1; AJvYcCVU8GLJ3dx7bebrHz2UQGzigMoSIC8rt7HAkKq6ySjZfR8cr62U2ahXePqdEZQ4iwBJlZAbUvmmS49wMuqxkSw3xQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyV+/dGk9co77s9aZkPo7xDvWy34itiA3BlLeWyXOIEOeZsujHJ
	orD2UYwbK4HJQfM+2z0pgetxNHB6f7WJsBOJTli4O7mP6RthTVMNeEr7aP8WV2w=
X-Gm-Gg: ASbGncv8Ie+QL3lrD2aRg52UjvP9MLgRnugZ92k/SN/bnrnRsoNe6viD9H+ibcf2T4y
	2Ubg+zAPA9z5y/Zn+2suei7IJIh0Q71tn+ZNNdtiu7B0pslvp+8Ftbft21czV6G7HK8EghJupeg
	AP0uEJ5DIXod3cAdD+pJ9PPBibxRlmvaQkcu1utkGcSH+NOGlnLQ3WSZ6JL/CmcYQltferayddB
	VApRwdzNlvTqRhSRmxCgR2X7Ta7D7JrSBHO59lQx7+BujzGUbAgPIYh3PxXYdTct+6C+ogGfBcK
	xTJrhEe8A8+dg+5VDbK17+HVT3w3NRxsW4zeEFS0YEzme/7XAzA4r4PC49p1XK/viob4IBsE+Do
	H+skk
X-Google-Smtp-Source: AGHT+IECg1D2+NopZP1Vs5SJWg2vFa8CumXaoITczUR54cxibx7+qUKS2Y0wNXJJ5EkD7hpe+Dc/RA==
X-Received: by 2002:a5d:6d86:0:b0:38d:c105:e22f with SMTP id ffacd0b85a97d-38f245268femr4339125f8f.52.1739457151023;
        Thu, 13 Feb 2025 06:32:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e? ([2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dd5acsm2088173f8f.35.2025.02.13.06.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:32:30 -0800 (PST)
Message-ID: <32282675112f0a8c60ed09c9799971bf0fa03803.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2025 14:32:29 +0000
In-Reply-To: <eb47ba1c-fac3-49a1-9d5c-d56168c39595@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
	 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
	 <eb47ba1c-fac3-49a1-9d5c-d56168c39595@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211341

On Thu, 2025-02-13 at 15:20 +0100, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> 2025. 02. 13. 14:36 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADrta:
> > On Wed Feb 12, 2025 at 5:35 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi wrote:
> > > This ships a crypto policy file for rpm-sequoia.
> > >=20
> > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> > > ---
> > Hi Zolt=C3=A1n,
> >=20
> > I believe we have a new issue with this version:
> >=20
> > > python/build-crypto-policies.py --reloadcmds policies output
> > > /tmp/tmpqvyryz80: line 5: Bad configuration option:
> > > pubkeyacceptedalgorithms
> > > /tmp/tmpqvyryz80: line 6: Bad configuration option:
> > > hostbasedacceptedalgorithms
> > > /tmp/tmpqvyryz80: line 8: Bad configuration option:
> > > requiredrsasize
> > > /tmp/tmpqvyryz80: terminating, 3 bad configuration options
> > > There is an error in OpenSSH server generated policy
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027=
/steps/11/logs/stdio
> >=20
> > Can you have a look at this error please?
>=20
> I tested the recipe on Fedora 41 with:
> * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
> * faking uninstalling it by renaming /usr/bin/nss-policy-check
>=20
> Both worked.
>=20
> Some of your build hosts where nss was not installed complained
> about executing nss-policy-check unconditionally, which is now fixed.
>=20
> I think this is on a build host with a very old nss version
> installed.
> Can you uninstall it?

We aim to filter the environment and work the same way in all cases so
this sounds like host contamination.

I think we may have to just stop it using it from the host
unconditionally.

Cheers,

Richard


