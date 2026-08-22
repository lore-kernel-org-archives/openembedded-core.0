Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B0EC5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 09:05:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3561.1787389510112709090
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 02:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dMrKbpaY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so17649145e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787389508; x=1787994308; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yct3nFo/sKmPPEKOgJY+WYK6YRmbn+NJlYPCg0lusgw=;
        b=dMrKbpaYREI5q7x4Cy62fqJfG8QPuIKtVOVd+Qnx7YMzM0DYZboNKMJr1BDQ0M9/EV
         6GlzGZ6VI5/w2lARtZRMdNtegxxl0eFmVGjuf60DR/uw0DncVQFjvyZXGePKQ4REE0GG
         qwdRpa8iVgdqnnrj7IspkVWlFMK2p0eFPtWlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389508; x=1787994308;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yct3nFo/sKmPPEKOgJY+WYK6YRmbn+NJlYPCg0lusgw=;
        b=WHKxzxsEGcgBXmnuYBRfMSu+y1fG3FbrPrpTbUjlkG5eQwyYqz3I+wkSG6XlXIeE2y
         odArEs+ls7/bQgFGWD7L6DM2Om31a8rCN6KNyMTv6nfUX/2L7T61+79wXNZCv4DDx06b
         bAqT1qBl+WiWIwHUmVP8Bb6kWMLJYihd8nJkTgMrKo7K+X3HFcVslU7FTmM/TPGU6lli
         OfkpvEnlQORHxV4Hpx+l0SSqHgNudXWrfzR+GB5Ldtw1qua6M4/U2GaIRGv5YePgEFYA
         f9br+jR5XbfL2APgWiZgHdDFQgTSriKDhG9WGCyT509HFij6bDgbcc7B7sFk4Kk1FoOB
         Y6Qw==
X-Forwarded-Encrypted: i=1; AHgh+Rq286ThVp+EC/AnLhxYNekHzuwHKA/YKxE/ZLFI3QyIeAWpjxg8Yu4QDdV/NTELNnmxXCP+pPQAdvBgq7QuU8/2jQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++l8mzUirahwjgliHE/D1fPG9uA1EJYxky/zUnrB5m93iRYjLn2H
	0AE/4twjg0Iwra/WcBnPYP37MrUQ//ekNZ2TiauSmso9VAgnTBSbMMe+WTjf/x68I04=
X-Gm-Gg: AR+sD100/4jOcovh0UfRKL/7ibMweMPaWluzxnmTukwoGnoqAskpeEvUnluvEKG/EwY
	GNfFhwrSrZFBqbkbzWsm7yXkFx5L3kwZHCyGaAi50U+1FdLqoJ6NOIiSvuasos/YXNGPlITiQMr
	vAnkollLs+mhFUg/VJIpJZjl6OtzVk3JNPtVaZQDlCs8efxqXq4bmFp+iHkq9OKa++NytyN1agH
	KZXJUPamqiKjzyZreRZMtxkWV/Jxq76ygYsDXRjYrEFQ3HkgEoYJPbCW824b26LedcpW42lMlFP
	WF/8fY/puA+g4jawUE23pb6s0j7WhOfdYZ3URl4o/TZzP09TvDRzpRi/SqEh4y06toASRdOF8Jo
	lxLaX/Gqwu0LnuU4Q/hjI+NRvrsXjjPHV41KYzoUIcy7D+ImDBRit+1uLq2bOwSlL3K2kBFUlOt
	UWGWp8P5o275j5cKsGnEr55QcgZqZyasnZPPeKLxAbxNJUP7cnojR/5tWRX1ceAOcZ2MNUKk3LL
	1AIfH/N1fdsH8Qdb3bSjeZ3eakrLTUpTkujq7CTpjP/7ZMi8UFNfA==
X-Received: by 2002:a05:600c:3556:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-499b8454819mr140611595e9.11.1787389508259;
        Sat, 22 Aug 2026 02:05:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a8c4:50ac:ead0:576c? ([2001:8b0:aba:5f3c:a8c4:50ac:ead0:576c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90e747esm59996355e9.4.2026.08.22.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 02:05:06 -0700 (PDT)
Message-ID: <fe869a36b0dc0ce880f72759c31edcb55a536faa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v15 01/12] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com, 
	randy.macleod@windriver.com
Date: Sat, 22 Aug 2026 10:05:04 +0100
In-Reply-To: <20260816231104.3871015-2-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
	 <20260816231104.3871015-2-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 09:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243970

On Sun, 2026-08-16 at 16:10 -0700, Sumanth Gavini via lists.openembedded.or=
g wrote:
> The rpm 6 doesn't support external dependency generator. Oe-core used it =
for
> per file dependency which was saved into pn.requires and pn.provides,but =
that
> hasn't been used any more since 2012 (rev:
> be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
> updates in the past 13 years, so just drop it to support rpm 6.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---
> =C2=A0meta/classes-global/package_rpm.bbclass | 84 +---------------------=
---
> =C2=A01 file changed, 3 insertions(+), 81 deletions(-)

I think this patch is the right thing to do but it should be split into
two changes. One is the removal of support for "per file" dependencies
in the rpm backend, i.e. MERGEPERFILEDEPS=3D0. We can say that hasn't
been enabled/used in a long time and has performance issues. That
change is most of this commit and is only tangentially related to
disabling the external dependency generator.

The second patch is the single change to remove external dependency
generator support. There are probably other pieces which go with that
one.

Cheers,

Richard


