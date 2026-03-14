Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B393F10706CB
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 10:28:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7328.1773484110016551275
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 03:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U2LKt6BB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so24735265e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 03:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773484108; x=1774088908; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgmBVvbUpNh22zynIWa4V6B74GQ1o1FX7neFn8CYt9U=;
        b=U2LKt6BBnnWi1KyJxAXjmNLRrcY/QHIfpRGBgVQYzSFEcYLsNVdkmWZQbYD70TM0yj
         v3sV+yHWQ24+xa/OsOuKHDX9hNTq2iXywZK8a+Om/WMgZBuPSaf4swPjXVs8Wnw42G42
         9Z3NGnNtAteuOoN9ixSSUpCB5xjrnEGeBc4HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773484108; x=1774088908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgmBVvbUpNh22zynIWa4V6B74GQ1o1FX7neFn8CYt9U=;
        b=ZtMweckCbVGdN3i4qZnEOhbTT14eFfgUgWDVNGSDbikssjBerJWTvgN33amOmandpJ
         w4YBf6HmLLQiDDkeHEqvFLHHy7EnUBVl9KvWpPEobWaCsR/KISJLjtKTZ6SRxeHjfakq
         dCxU4hQd2znHl1mxvdGeW1e1wCK59aY+HLSUhiGSxi1Enytqj6K5z/7Yk9V3K20nIEC+
         ssary6gZfMhrirf/N8W+4VO9/Qb8iodZ09ogyXFVukICDOs27v2Unjw/EITsI8EOcGR3
         Dzc9Y+YU65hk6Bj1EJ9lHPog3EuXatq9aUjx+gE2rV/9fAiIGLciSwsK9NoqqrrChZUT
         tOyQ==
X-Gm-Message-State: AOJu0YwWy1VN0+mtqkdiWr9jqGVIVcSrKbYIIe4WNbYVmjpx6u10StF3
	CA+JcR4ULiF8kih32srgLgoULLkscOlTZfkWqSeyMkQoa9XtQA0PuEB3qJ5BOqJY5JTsGVqW0lv
	KrkVX9Tg=
X-Gm-Gg: ATEYQzwn2ARpj9RsCg9C8sW6OFVvGLin8btHbHJvlOZluRQ7kaPRdTP3QgeJHQCPJZJ
	/G47IEjVDsc19IVLmAujZAhKyGhsEN+ocnVZQf1M2Gs+LbJ/I1QEhCJI92e32QQK92pMHF+Oas5
	tzW4/pdwhzzYnPRH68He7r7HKPCQ1uP7qWM5Skq4HSqlE3YzeWv7g5lP/tCSXXkIuvMKa0BmsN3
	f2tDK81ZxjAj6q6Lxuim85vBLerCNCmVguIv944ibg7moP6xxYklOnCgvaZmcLIff/gxZa+2Olw
	asNPXqAAQI4hj2ehSGH3cl4Y29KebJgIcbcRuMadiVnh4GXBpH/R23Ogj2J4A0i1IcKKc3eE/1L
	Dmoz39I+QfdzKrpgpQbUh5wJXOj3K4dKzzy9o9oSuICgHe14KYROjatjwTYEEkw5a5kbo2TRCb5
	ujPsDDBnw3XoXT5IG8Pspm9CfQb+8FS/6FpCrtHc61C+N7tAUiqljf1a6Q0pPmJY9+9+KLGHx85
	vP2yGJMWOTu0tU=
X-Received: by 2002:a05:600c:8b2c:b0:485:4bd1:4c7e with SMTP id 5b1f17b1804b1-485567148e8mr101136665e9.33.1773484107954;
        Sat, 14 Mar 2026 03:28:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1366:c81f:8eb8:9990? ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66ffe2sm251796975e9.13.2026.03.14.03.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 03:28:27 -0700 (PDT)
Message-ID: <e116990c00b33a1bf02da5b45707f3b48a5cc9f9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/5] meta/dummy-sdk-package: Improve SDK dummy
 package handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, Joshua Watt
 <JPEWhacker@gmail.com>,  Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Mar 2026 10:28:26 +0000
In-Reply-To: <189CACDC59FF3062.2629287@lists.openembedded.org>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
		 <189CAC32AB5A06DA.1508127@lists.openembedded.org>
	 <189CACDC59FF3062.2629287@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 10:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233083

On Sat, 2026-03-14 at 10:00 +0000, Richard Purdie via lists.openembedded.or=
g wrote:
> Options could be:
>=20
> a) move the recipe to core and add another entry to
> sstate.bbclass/sstatesig.py . That doesn't help it anyone else does
> this
>=20
> b) Create some layer.conf variables which allow these to be
> defined/added generically. That would need careful manipulation of the
> hash variable dependencies to stop things rebuilding like crazy.

Having said this all out loud, b) is the only realistic option so I've
just sent a patch which does that. I don't like it but it is the least
worst option I can see right now.

Cheers,

Richard


