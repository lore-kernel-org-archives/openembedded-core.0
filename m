Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ADFC55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 20:38:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12621.1785616725169403707
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 13:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hEZNaqEi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so9421965e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 13:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785616723; x=1786221523; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sKo/lFMmzrtnBxxLpdXImjvpGksd09hpAD1UTVCO9uQ=;
        b=hEZNaqEig5NJlBnHukW3KrS60Bx+cJ5Mm41/j3BYNvkDM5WYLJ6JnKjI72MhBLn6VN
         GJNWUO7feFsppNpQvTi+bOUfTHQYZ7cr+Q3xBwQE+QA46gTBGBrhwgp6VZDAEEGCFzus
         6a+Eiw1mmiJDio+4mLgDeYj8RHSWLwUUIp934=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785616723; x=1786221523;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKo/lFMmzrtnBxxLpdXImjvpGksd09hpAD1UTVCO9uQ=;
        b=bxksVCwIgjrvgAjaz4BZ3fn1JLZXCAWoWpJsle/kleNNXNG7YG25NtqE7jaG88gZi/
         KyuULSY9zFQMIvavPOnhnlJ6CuDeK3H9HhYfHI9ikAfrzXRhx6tLAKdVT5Ls9LzCtRkp
         n8jJ3B4r5zo1DIbcQj9SAQGVHpOBbhuDA5a+uu0CcUMGBilECVKL/799vo3Hwy9cAQpt
         c5qKdmdg75jjoRq3S+xbmaiH261gdGGtyM29SCZi8Qxi5J2KEWE2rAzI6ulxmdaQnWBL
         B3ZPQAH4o4/L+kZ6nO7v6jVqSwR91YVKrg6QxoVfrVwkGh4fec1JkiuSD/v4ZMqV2tgx
         2o6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1BFQLM4GvudaIf/5c7XHgXpLK/TzczrGsMXy1FMHeyG3WRjGHWgdEOM1AVFEdF/E3Sq3JuzCXkfpcNLe9+9qjNA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2AlojU3SWS5T1bhjbCxZ2+jLbDTHFN627ifPfY9QaVO31Rdwa
	d2gRpe0QidQfQLqLRXK/OGEDtWK8T3X/6p3CVX4BrGdxndltU97DPVG/pocXqCWUank=
X-Gm-Gg: AR+sD13PtoRcTQvmOyEBA75pscQmWhbk85CpdthRQXGCXh19iJdvZ99G93+9Nq5oeXi
	tBVLa8tuq9MSAUmuZLe9qoxs+a9nR4KAqiFFTRNhiH7g6KIMYUpYsABM3gpOXMMtRfySPNtoCxs
	0WXR83AJb3oJZvrngd4qrW7kGC6f8T/EEu2pW1K/l5DN6nQn5JkWHbE4VPuzVuyu0KaZyj4V27V
	9zBFXLwx0a+4fQuefioOHr/Nq1njKQS65iyTUnfNJhftcZxyME3RyXw7f++5p4anZHcfQbAgYam
	8I2cAgRRPAHhak3ZdYIKpJvaY137OG0M6F6YwqQG9BVClztVhj2M+ox9qGyDE+EWtrLEAEro+mA
	jQWsYYDjAvoRiM+AtEZFwrANl0fQ+tByGBYi3nZZgoecfOvb+HIirgbtTtUilDVFkZMlmkOqMzk
	lSXc238RZRNcHv8MS8d3t6pFM72nOtrtwqz4rUh3TfFFc7u9oh8XzVT1X7YX6My/Rnpp2mwdnKI
	C7T+Mcw5TiJ3g+iqJCWgAUai5wWqkCgs5Od/a/YwALxfIOs2Mtiiw==
X-Received: by 2002:a05:600c:6298:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4980ebc216amr68969755e9.9.1785616723047;
        Sat, 01 Aug 2026 13:38:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585? ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808a721d2sm76069305e9.15.2026.08.01.13.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:38:41 -0700 (PDT)
Message-ID: <ed706c3879b38bb0e588725b3074f68008161949.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] python3-websockets: upgrading to 17.0 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <tim.orling@konsulko.com>
Cc: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Sat, 01 Aug 2026 21:38:40 +0100
In-Reply-To: <CAOyo-84CvS6-hHAdU4T2+8PRs1U-N1-bwmrc-kbm-D-E+hf0hg@mail.gmail.com>
References: 
	<0101019fb18e1918-6e60db78-fa07-43d5-8bb5-0f1a3bf1758a-000000@us-west-2.amazonses.com>
	 <040de8e5eb3f8b57f00cfa691c8d5889103b7e50.camel@linuxfoundation.org>
	 <CAOyo-84CvS6-hHAdU4T2+8PRs1U-N1-bwmrc-kbm-D-E+hf0hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 20:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242504

On Sat, 2026-08-01 at 13:07 -0700, Tim Orling wrote:
> On Fri, Jul 31, 2026 at 11:14=E2=80=AFPM Richard Purdie <richard.purdie@l=
inuxfoundation.org> wrote:
> > On Thu, 2026-07-30 at 05:45 +0000, Auto Upgrade Helper via lists.openem=
bedded.org wrote:
> > > Hello,
> > >=20
> > > this email is a notification from the Auto Upgrade Helper
> > > that the automatic attempt to upgrade the recipe(s) *python3-websocke=
ts* to *17.0* has Succeeded.
> > >=20
> > > Next steps:
> > > =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-websockets-=
upgrade-16.1.1-17.0.patch
> > > =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches and summar=
ize them in the commit message,
> > > =C2=A0=C2=A0=C2=A0 - compile an image that contains the package
> > > =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
> > > =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git commit -s -=
-reset-author --amend
> > > =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list
> > >=20
> > > Alternatively, if you believe the recipe should not be upgraded at th=
is time,
> > > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so tha=
t
> > > automatic upgrades would no longer be attempted.
> > >=20
> > > Please review the attached files for further information and build/up=
date failures.
> > > Any problem please file a bug at https://bugzilla.yoctoproject.org/en=
ter_bug.cgi?product=3DAutomated%20Update%20Handler
> > >=20
> > > Regards,
> > > The Upgrade Helper
> >=20
> > This creates ptest failures. I note a new point release in AUH today to=
o.
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2047
> >=20
>=20
> This upgrade was already "on my list", so I will follow up on the
> ptest failures next week. Thank you for the feedback and the link.

Thanks, the newer version still has the ptest issue FWIW (with no ptest
results showing at all).

I've held off the uv-build upgrade as that doesn't work with the
current python3-crytopgraphy too!

Cheers,

Richard

