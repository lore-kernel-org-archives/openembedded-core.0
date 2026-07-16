Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F8C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 10:44:40 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9989.1784198671662644611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 03:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XAQ6phmZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c167aa9500dso220600366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 03:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784198670; x=1784803470; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yfV22wJyCO16tELMtheWdpWTCSZlaV33LxgV1Cjaytk=;
        b=XAQ6phmZJA8lLdT3Yg11SO2YKK1eD57cmYNTBUzZPzAOz00WVTwZw0qinoAnmTGmQ/
         BTG9c/XQHPfO9yYrb+XjmPR2NcYhUIzrsHgh7s6HW1fC0/VfYd9Rve1MlPrzznQbfNil
         9pJ29Vl9pDEV54d/EQNrP5nHJ2e9TqZxDugRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198670; x=1784803470;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfV22wJyCO16tELMtheWdpWTCSZlaV33LxgV1Cjaytk=;
        b=Xaz/vakn7Pn18BfM6QhlzqOlqyOCA3oQTynqJEWWKGLhBAZHGSlv2RsfJ0rb5flqUx
         hoCMg61k1s96+hUROZA1L+4dvRV0DM7XxS4J0GuEZqjJlsLyoV73El4KVVwHCShHIX87
         x8f0Tldu+b/HEJkeRiF3AbJCgZcnEGlysx3ypthA7CVfQit4MV26P11KkXJRedmL4lwF
         DSpdIIHjRsDC/x1hGm6f9MysG7Ux/jDVYU4p89vxW/Cr+3H4vc3hgovPne8PYQDlMC9c
         8bkfapDU+VZ9tbgr7F6Kbth11bw7Xj7DN5qVfJItGicZmAroYgwOgoYgrTDL3jWivq+4
         j8WA==
X-Forwarded-Encrypted: i=1; AHgh+RpSDlw6Zg4IMdP84pmUS5zeQuIM+h2kHYbJIX8cc4wMOedNAOlkCB5Cdbt/Qq16SeZALaEcVR64WIcP0QjsUnZCNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxiM29seBHtsH+CHkIrFaHe1n9TndjfBv+VMs/10a9JOjexmXGV
	+D36zkVkOYWQAKBz7+zZlIM12udNDQf7nFqjSnIphkg7x3TDfhQDGXGB/4+Doc57Kh8=
X-Gm-Gg: AfdE7cnxn+UIzrf9Qmz8guou8H+8le9xJ+o/poUK0GHcN3Ei4qHRuPGJM04rnJyV3zX
	Pu6grybTt4kvXQg8+yxuFvW5EKR2a1AGswgVNsUmeknYWVWgQ6pVvFkf6RqRhJWdiCaKt9Mz5HI
	mS7gl1RE6n/CYhejSqFIPVVYnB1oH7EqmQtrHqL7DsQQ1MqvR6dUpDPPpwM5Be0BBY4Cpr/si9R
	e94pT7yBB7sBHZytIiQib7E0IcWqGQaAgE1Vk4p+jJ/wFYPb3vG91CMKl8GkWHEviPFy4VJ9xE9
	gIFcg6GMTrJVQcu6C6DSO0a/fQivm95CVlBBc/i+GIcw7fS+yMCkFttTT13QdIMOgwzGKNNr/rR
	1zpg5GEAZZgwJNf3Xxers3CX8gCsENwYiHwm6yzaDVPa+UQ8cPJqZcVw5rLQE6nGWvJB5/1Ic58
	yTxE8bffAQlY4yXOk4K77vtSLyztivJzxZfeq1OUEbVYvbG7tTzL7/uAGnPsH/Qtg/4sY=
X-Received: by 2002:a17:907:c1e:b0:c15:f4aa:f30c with SMTP id a640c23a62f3a-c166188a6b5mr658687966b.42.1784198669914;
        Thu, 16 Jul 2026 03:44:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03c:6417:d88d:c21a? ([2001:8b0:aba:5f3c:a03c:6417:d88d:c21a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16874a27f7sm181260766b.57.2026.07.16.03.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:44:29 -0700 (PDT)
Message-ID: <cfde322b512c0666e480b8febac22481afb7734e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using
 systemd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leon.anavi@konsulko.com, Joshua Watt <jpewhacker@gmail.com>, Paul Barker
	 <paul@pbarker.dev>
Cc: p.zabel@pengutronix.de, openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2026 11:44:27 +0100
In-Reply-To: <CALtQ3O1pW9C_DJNf2SjTBG=QZ1EteAt6_3KHGaOJAHbCTp0+SQ@mail.gmail.com>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
	 <c068df721aaa08116114fca946a3eaa6936b4f76.camel@pengutronix.de>
	 <CAJdd5GaqWhzsOS-5DVxDGyS8ORd-hmDqW3PKYu95H2XcKCyERg@mail.gmail.com>
	 <CALtQ3O1pW9C_DJNf2SjTBG=QZ1EteAt6_3KHGaOJAHbCTp0+SQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 10:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241080

On Thu, 2026-07-16 at 13:02 +0300, Leon Anavi via lists.openembedded.org wr=
ote:
> Hi Paul, Joshua, Philipp,
>=20
> Philipp, Joshua thank you for the code review and for the insights
> regarding weston and weston-init. In the long term, discussing
> modifications to weston and weston-init probably makes sense.
> However, for the moment, I think my single-line change to add pam to
> the defaults is simple and makes sense, especially considering that
> this fix is also suitable for cherry-picking to release Wrynose.

I have to disagree, whilst it is a single line change, it does have
significant implications as it changes the distro feature configuration
and may require the user to take specific actions if they don't want or
need pam in their system.

Changing such a thing in an LTS release series now is not a change we
can undertake lightly. So yes, it might backport easily but that
doesn't mean it means the policy criteria.

I'm afraid we need to work out and resolve this issue properly, not
rushing a fix. I will push back harder on taking this if merging will
make it an instant backport request!

I should also highlight that as soon as I did merge this patch,
everyone would move on and do something else leaving the other
questions unresolved. That is another reason I don't think I should
merge something which I don't think is the right/complete fix.

> Paul, following your initial code review, could you please have a
> look at the third iteration of this patch? I would appreciate your
> feedback on whether any additional modifications on my side are
> necessary to get it merged in the upstream.
>=20
> Please note that my modification through DISTRO_FEATURES_DEFAULTS
> targets the nodistro and the yocto-check-layer use case. I consider
> this change to be safe because in my opinion Poky or custom
> distributions are expected to define an explicit DISTRO_FEATURES. So
> (most) other cases will remain unaffected by this adjustment of the
> defaults.

That isn't the case, people can take the defaults and adjust them. They
don't expect the defaults to change underneath them.

Cheers,

Richard

