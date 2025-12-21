Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC23E66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 23:10:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70375.1766358600549683241
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 15:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WQMiDt4S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso29545465e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 15:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1766358599; x=1766963399; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHVRe1e+TFBV78F+QuXOO18+3D2cDcOGMu5ebhsMF/o=;
        b=WQMiDt4Sk4TYhfvxFuXjiD5Lrsp+Psi5dZwy5YWXlHTKJs4F3EngsRIkNubtndrWTA
         6F4mPc3X59KGEv8/+a/1bfNcBpBjeAbfjUwkJoqBa4CjPqgVhhPgdvRXOe+z3Azl+eta
         R7kuXH9upK8WWXSUDBI0OG/R18hhPkeGdfU0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766358599; x=1766963399;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHVRe1e+TFBV78F+QuXOO18+3D2cDcOGMu5ebhsMF/o=;
        b=NUB7y/uar3TbhEYPMrSRg0Y0a8ZxvRmaR2OOon08YQm9FzzTFhIibkKlJ//AE7otxp
         HtqiyW2bkHmIF1mnA9FPpATINpsugM/MYvz90hCgehJLFJCNsqHAVqXcWNZsymGR1H/l
         Vc75KirE7ekDUvPmwixjxRHgTTNg7I8g0z3v6dpnp2wLkfL1TztIAC1bBwNPrrxGGMc5
         z7lYbIOQsKwqFYv0Q+6AvalEu3PdmRpTwHtVOlzfxw14UjBsj7S9ojbi+sSP6CkRBD6L
         fXjuRiiLdJuuYhQhnjFRrQBRUZ1HpQFyO06diphkdazaZ9g0SeCkDSwoDhQvWWsQmzPL
         DIzw==
X-Forwarded-Encrypted: i=1; AJvYcCXVqW8kggK6KhkdNozKEwEP3POsMOcjDdTPQWCDtd6rx/E6ooHNEPnuT9JJa3wIPUeDDew9IVwZAPIkxxQ2NyXXdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy69D2bCqtrrFH909nQZDcodaTSMf6PhAZZWZ+Kg4Gggp6PDDI2
	daoMovOxKa1h54dEu4jN/qMai5mOLzF0tmqOzhWi8fWVM3BqUfXHXOjBpxHEKMVd75MsdDN/vuF
	aoXM12xw=
X-Gm-Gg: AY/fxX7l5/Emom2x/fULTjJUzFg1GPzQuvaAcqcd65hz/lWsHMaic0NXmGcCnVDQtCM
	mr5hcD2auLU3qkqb2Uci8vCHUqXyfxiEeF3PWMcWZpO28TcS9WW+jYpJig1YWtnugvhx33y7fyv
	bNZTdzjCyb4FjFGmfw6nzMGs+PhAlNQCsbDg46VdhhI4IGc+N2klmoptHjBVR0A0F9F27RSlTO3
	D9sk7ir6c9vHJWjYcSaL6H4Z2qFSSidDtcmTOWp+zV7wDXhvbDsfNjrzKg3CqRt6cl26ndKv7xL
	mmdkOpYP3tR2DE7uen8Rv3Cy49Cig8SJAazOWMRKPJyQG8Z+ECCgXPZkWx1vdqhCcUPL+BZ83e7
	43EQDC4ZoBsDRDhI1dPzrdagVv0VCcz6ycHOLbfIQj+o48PXg8FnLrg1i+jhe3HyqhbSctqBVtI
	qgVRiU9u0iw/hVrhxE/D/zzABMIsXqndAagqu3rBNKGbX+Kkje/u4Z61hhzZ0aAq3AOCKAShI8Z
	ek=
X-Google-Smtp-Source: AGHT+IHHtGEz1cBWJ3i6GnLbzR1Px6FG3IyaSXFZ462B8V2obuEFAKvazIWVqIpTjiv/ajB5hRp4zQ==
X-Received: by 2002:a05:600c:64c7:b0:479:1a09:1c4a with SMTP id 5b1f17b1804b1-47d2950b309mr31816705e9.31.1766358598746;
        Sun, 21 Dec 2025 15:09:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:db4c:d269:6ac6:9df4? ([2001:8b0:aba:5f3c:db4c:d269:6ac6:9df4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3963fc3sm88042555e9.0.2025.12.21.15.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 15:09:58 -0800 (PST)
Message-ID: <67c01b7bbde3068d136b15d3855e3bef11a96990.camel@linuxfoundation.org>
Subject: Re: [PATCH v6 1/8] distro/include: rework debug build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 21 Dec 2025 23:09:57 +0000
In-Reply-To: <20251217152421.1181080-1-hongxu.jia@windriver.com>
References: <20251217152421.1181080-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 23:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228277

On Wed, 2025-12-17 at 23:24 +0800, Hongxu Jia wrote:
> The problem with DEBUG_BUILD is that we have a lot of debug information
> in builds anyway and this is now unclear what it means. The
> documentation.conf entry mentions packages which is now incorrect too.
> The variable is a very old one and the interface is poorly designed
> compared to other areas now.
>=20
> This commit drop DEBUG_BUILD, and add debug_build.inc to instead.
> In bitbake.conf, use ??=3D to set *_OPTIMIZATION, in debug_build.inc to
> use ?=3D to override *_OPTIMIZATION
>=20
> Make a config fragment to use include_all debug_build.inc to allow other
> layers to add their own debug build configurations, user should use the
> following ways to enable debug build
>=20
> =C2=A0 $ bitbake-config-build enable-fragment core/yocto/debug-build
>=20
> Or
>=20
> =C2=A0 $ echo 'OE_FRAGMENTS +=3D "core/yocto/debug-build"' >> conf/local.=
conf
>=20
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Thanks, this series does look much better, I was really happy to see it
and I really wanted to merge it.

Unfortunately, Peter does have a point that this makes it hard to
change this on a per recipe basis and that is a valid use case. I think
we may need to work out how to address that.

I also still don't like the name "debug-build" when it really means
"build without compiler optimisations". I think we need to find a
better name too...

Cheers,

Richard

