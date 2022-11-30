Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04440C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 13:15:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.10699.1669814141189705202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 05:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LU2DEHyW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so1387712wma.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 05:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wcbvI7EjvrKG2uXFllOCsuA8zi1xKHxAP8ULPAfKL2c=;
        b=LU2DEHyWI32NILzPAeFF+Qx50+mb35bM9iBsScJSIjmD49s80FThhNGxh+PgwRpY6M
         5D40xARzLmmCBcgD1qj0fig9pB3WCa1YW+MXrLusoI+ld6epe+dJbEPss7w4jReBZkSZ
         vMh2zIuTtUuVpxRY4qI4si/oJLdN4t88izR2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcbvI7EjvrKG2uXFllOCsuA8zi1xKHxAP8ULPAfKL2c=;
        b=kLXLFJm/Nu+fKkdq16FiiyRtTnK9f0bODZ/oXdP9j4sqdjfMoujWnKqRzTNNTT5dMO
         LQiBHvIO9QkIFi+OvoO3gnGqKnmaMnAvfJxmNQ8/4Qa0jiLnE3cbyRPnoDcg68XlY3RG
         Wpr+1MKh2V5TvsSXcHs4/1CBVNfGP/9M5EdLO7Wm0zFHiWBP+r5R2gU+Uvcg6KXAQEjf
         i3pCmAw743ozlahD+D+uWg/a/uECqlkjIFEh6yVhtao8KOhbgj0rC+JSbFoWYkYqGOW1
         reUlgprh0qcq18sV+mvj4LZDrO+b29deKic0CFpigHs99ZHhFJsnBajMNY7QX+LEDyKP
         ZgJw==
X-Gm-Message-State: ANoB5pmsBJb6taGM3CCkO10UBKOensjlmUr8VyQ9Bdwej8b/AKKaSgXv
	sKB7aORSKOdMa7WiLAauzHeWFQ==
X-Google-Smtp-Source: AA0mqf7BkOGgDNUAVAj72ypCrlkG/mHNwi0RHtfjYo9jj2rWkOvoddqHBFawJGtPlR6TwrirhUYWFg==
X-Received: by 2002:a05:600c:4f45:b0:3cf:9be3:8d26 with SMTP id m5-20020a05600c4f4500b003cf9be38d26mr37397943wmq.185.1669814139303;
        Wed, 30 Nov 2022 05:15:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d673:1517:32d1:98? ([2001:8b0:aba:5f3c:d673:1517:32d1:98])
        by smtp.gmail.com with ESMTPSA id h130-20020a1c2188000000b003b4fdbb6319sm5588275wmh.21.2022.11.30.05.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:15:38 -0800 (PST)
Message-ID: <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Y2038 proposal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2022 13:15:36 +0000
In-Reply-To: <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 13:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174006

On Wed, 2022-11-30 at 09:07 +0100, Alexander Kanavin wrote:
> On Tue, 29 Nov 2022 at 16:45, Stephen Jolley <sjolley.yp.pm@gmail.com> wr=
ote:
> > We=E2=80=99d welcome a proposal/series on how to move forward with the =
Y2038 work for 32 bit platforms.
>=20
> I have the following proposal:
>=20
> 1. A branch is made where:
> a. "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" is enabled globally.
> b. qemu is always started with "-rtc base=3D2040-01-01", simulating
> Y2038 actually occurring.
> c. an additional runtime test verifies that both RTC clock and system
> clock report 2040.
>=20
> 2. This branch is run through a-full on the autobuilder. Any uncovered
> issues are filed as bugs.
>=20
> 3. Once *all* of the bugs are addressed, repeat point 2.
>=20
> 4. Once there are no more open bugs, 1a is merged into master.
>=20
> Any fatal flaws in the plan?

Others have made some good comments. My thoughts:

* We need to add some runtime tests to oeqa for this (in addition to
the ptests)

* We need to have a 32 bit ptest run on the autobuilder (qemux86 should
work, not sure we can make qemuarm fast). Whether this is manually
triggered, not sure. We could have a smaller set of ptests to run for
it?

* Could we optionally disable some of the glibc 32 bit function calls
to ensure they're not being used? We don't really want to diverge from
upstream glibc much though.

* We need to work out how to communicate this change happened and have
people "buy in" to it. The reason for that is that if someone has
existing binaries, there could be problems using them after the change.
We therefore need to be sure they are aware of it.

Cheers,

Richard





