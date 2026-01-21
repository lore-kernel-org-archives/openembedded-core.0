Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29891D46956
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15994.1769013426028867302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 08:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NYs6v4vO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801bc32725so433735e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 08:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1769013424; x=1769618224; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdkPHg+NsUjsoQ6vzu+jSGTLplVc7GqJ3OK7R0m6cTg=;
        b=NYs6v4vO4DPBAQV4U4oMXqUuAbzfb25Bi+2U7Lvo+QzQCtawQtgdTx50lnNf7K+97I
         PMsmmKXppgnZ4tXiylXuQ46+3Xq/F79p5gm3Jvl0ypoRoKxjC5wQ6tvP/Oa9LmmKVyIW
         3ObQVdfKN5CU89lgNQP2rf0m3gyx8EXtEfhiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013424; x=1769618224;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdkPHg+NsUjsoQ6vzu+jSGTLplVc7GqJ3OK7R0m6cTg=;
        b=C5xe6I/pIAtVUYhzH28ao2BO2slC64o2ZFEqf0TPp45kl6oiLrSlxd95TVhPsZqoSe
         lgXijuVaTYxxvU3CkLzgg14mGmhToTWYjDtVLwIFYNMK7FF8YWehJcX0+m+jon5/XEio
         SY+NvldQlb+7uZp2SbRlytQdtqsJdULxrqGWn7He3sWhG1d1fhi/AlLrUZuSRPTTfr92
         zzfoZMhnPNCCBjwxXgAZVErAlo8RMx8tcJxPH84Tw5w3uqSh6fyiUe5LPmo7Pd3C3XF6
         tk1cR2wnvggvPT6uRsG2gcOfruge+RakNpDQGPXInEk5V+EQ0OYumGwY6FBA+KYcR2U9
         krdA==
X-Forwarded-Encrypted: i=1; AJvYcCVVDARlJsqy1EZz2rmQBHPzD0jeLC9dIM5c6OAPCrhcP+ZpGhUGBhS5J+sc63QsdoMVSi9pUWlVl8zzpeGOuKCp1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCaft7ZanX5u+zz50U/ojujOPcJkb/cQmymh8Dt/TFbO3JhHgB
	d7gaaqOmZWKctaxhee//YnSe1HvmEO0cqB1imvKe/r7IE76ZfCEPSmp8IuWfKNGaSMk=
X-Gm-Gg: AZuq6aLEpv8KfBnMYZqM4VXT8So/RYfZKum9IFXJGkO00ihs9Hh9ERFWnmjJEheGHTU
	LHZiOc/JcbohWI1E/1hMrxLih2UISVou/k12e04FC8gJHT54NN8AnCou8//yrzFDQbAcmqyUUVQ
	O7iCBIT0xFI35+0Oqce+biN2XoA11dcVV+65Ax2XpxA4jjjJIpPyxJ4/M4neK2QPlOtCPEOvifX
	06nuPH2fFJ5ZOU0ekr41vevCVXiuXqQ6VTlohO+IIhz63z/5eywIEir1y9jwOa+5vvO81OaDjOH
	wiQdZXuN5GSN/50cFQiwhrYc9NqEPAHcTyL/r13qa0lpkK8JrpdqA70AZleQjAZP40mDsGjQVt+
	HPyj0m0YPVqN1gxesGVzQCqU2Zj3RAeKNFUTBk+JEOhNprhhNRTlR659veNpP3uA9BjzLkYFSHe
	gkNDPRm16WKz4jKJ5kedPcHz27BlWQpmt7xMZc3U0eaP5Bobky71cqpYnncRRxhpE2LeTAnnF7T
	Ww=
X-Received: by 2002:a05:600c:a11c:b0:480:1aae:676c with SMTP id 5b1f17b1804b1-4801eb0928bmr191919885e9.18.1769013423600;
        Wed, 21 Jan 2026 08:37:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b41a:7081:80dc:66f5? ([2001:8b0:aba:5f3c:b41a:7081:80dc:66f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470472f1sm478875e9.7.2026.01.21.08.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:37:02 -0800 (PST)
Message-ID: <fe5405de8dfa9bc1a2ef3bfe2e425e3be63b254c.camel@linuxfoundation.org>
Subject: Re: [yocto] Yocto Project Status 20 January 2026 (WW03)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org, peter.marko@siemens.com, 
 "sjolley.yp.pm@gmail.com"
	 <sjolley.yp.pm@gmail.com>, ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2026 16:37:02 +0000
In-Reply-To: <AS1PR10MB56974C5DBF70E373FD7B7901FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
	<CAK5yBb-P30Rk4rc9maME3=y69MTrF0NeviEY5FAQOTj-1MQ_1Q@mail.gmail.com>
	 <AS1PR10MB56974C5DBF70E373FD7B7901FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229818

On Wed, 2026-01-21 at 13:15 +0000, Peter Marko via lists.yoctoproject.org w=
rote:
> > Tracking Metrics:
> >=20
> > *	WDD 3041 (last week 3026)
> > (https://wiki.yoctoproject.org/charts/combo.html
> > <https://wiki.yoctoproject.org/charts/combo.html> )
> >=20
> > *	OE-Core/Poky Patch Metrics
> >=20
> > 	*	Total patches found: 1099 (last week 1089)
> >=20
> > 	*	Patches in the Pending State: 152 (14%) [last week 151 (14%)]
> >=20
> > 	*	https://autobuilder.yocto.io/pub/non-release/patchmetrics/
> > <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
>=20
> Would be nice to update this link which points to abandoned infrastructur=
e with last update from 2024-10.
> New URL is https://valkyrie.yocto.io/pub/non-release/patchmetrics/

Well spotted, we should fix that, yes.

> But that one is also a bit outdated, so someone could be so nice and merg=
e these two series to add whinlatter...
> * https://lists.yoctoproject.org/g/yocto-patches/message/2935=C2=A0(2 pat=
ches)
> * https://lists.yoctoproject.org/g/yocto-patches/message/2937=C2=A0(3 pat=
ches)

I keep looking at these, realising you also dropped styhead as well and
that then means me not finding the time to reply about that.

Adding whinlatter is an easy add. Dropping styhead is more contentious
as we've been trying to continue to collect metrics beyond the release.
I've not wanted to get into a discussion about why we might do that,
for how long and so on.

No, we don't have a policy, it isn't documented, we should have one, we
should document it, someone needs to do it, I haven't had time. As
anyone who's attended the weekly status calls knows, I'm drowning.

So if we want to move forward, I'm fine adding whinlatter if you want
to resend with that bit first.

Cheers,

Richard
>=20



