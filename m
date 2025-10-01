Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B112CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 22:13:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.1007.1759356808152656650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 15:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bX+LpN7j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso197906f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 15:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759356806; x=1759961606; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y56K9n5ow5e514bA3KZ5d2ZcGJEo+Bltf6kJHykUbXs=;
        b=bX+LpN7jeh7ao/m/TKXkulWFGHj8hiyfe9+spsCw4u3d8LEOoGIaEYGF7wAq1KV7S2
         wXluaThpc9F6jS/gr2rNT95TzcoJFcx/iQRUKKEhyxFMqeEsxM5X4nX2uIO07ip89elC
         ootpcRTu5dyw4PHzqzzV635ywSyhEs6r1D9g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356806; x=1759961606;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y56K9n5ow5e514bA3KZ5d2ZcGJEo+Bltf6kJHykUbXs=;
        b=rVoEVvC+kXleSceNxe8miHLUInJeYO65aUO0YIsQVesgLhc4dKkEl2UlZAeZQj9nje
         Uj6/8cKjbAENnlR+6zSj0R9qcejKYFcEmwZq48tqCQHVVcinjZH3Ty5snPmtqy6ZZ7MC
         O2e0XqTrfyFwy5lpi/LEwML7gurrpdzk5CUp3zz4C6dVcV7MlYZM63lxj7AONDEEmJKM
         iye3PtJ427+CanuWqyRrf8sOA2xG1kN2AgnHB1V/GAeS2cbPoeW1HSSqlwQbStLglQX/
         g2xBcrQQ+Jx9zDsM6jZcEPEE+gwPVVNMWZEKCyfWqc1vNlDgqnPpUY2dtcKGlg5tXe/e
         +GeA==
X-Forwarded-Encrypted: i=1; AJvYcCVAnku/av8ISdOfP6ITJH6HLT3STEVD0YihTJX7HTmxeIlGAZfZHnbEIthNPufhuJQTnq6jOEBwzvSkaDU+WKbdrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzq03b6vgygg1FxKXisB8JF8V3DaJ7Hs8Z9G7JFumYrwufk90/w
	wNuIOyBwGiGh30HtxwkHI6EHx1VjEOhv2YDNWyb8byh4qH6wEhuwBHGJwoX0avC58aw=
X-Gm-Gg: ASbGnctiN09Itc5NC/KZlZfvi4DYbXMjK7irD9lrR3ja6sr40UWPPeaOKkV9xz7AhF1
	pX6Q5T02w7GyOoae0z4mwGMTQhpGAk2ugK2QEV7Szn7J1W8a1YKYPpLygk2Ov7oNG7uZnSLFJfD
	L93HP2OG2+43v+KFl5yi2mfZQZiUAQT/t14MdBWBLU0lzvtkgQT9JcBy+qVPYHEDcZtLIlyAV9m
	kgkrxEE8qkYj2X8FrNLHc/SSTI6u3Zq/5L4wqWWZqmAjujHLEV3lWBy0ExaQy+EXWvR62uKbC2Y
	C7n3PN9gr3kpOHeusnDP8/lmRjKGI7yHCtn8G6rrrUjjl9oinXDRRPJou2ZfJqju5duPX3FrzuD
	rJD7K1JT+9WxefmDJSozQYmZ7AAyV43c34pQBTuJz/8u7ZjCEXJaOM+Zy+0QYD60uOVzZREGBR4
	zVGT2NFOaYGOJqDMvu7uVeEC38cIEW0U7+lSo=
X-Google-Smtp-Source: AGHT+IHubQBAxMvfjTM+ncJOAd3fdoqa1CfXhaxGSwEeL387Qmzyl0roZihMQ7ByhMGDhsFygSGVnA==
X-Received: by 2002:a05:6000:40cc:b0:403:8cc:db66 with SMTP id ffacd0b85a97d-425578149b0mr3456854f8f.32.1759356806289;
        Wed, 01 Oct 2025 15:13:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d53b:59af:db6b:d4f7? ([2001:8b0:aba:5f3c:d53b:59af:db6b:d4f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b6d81f2sm42941245e9.5.2025.10.01.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:13:25 -0700 (PDT)
Message-ID: <1d3aba29ea3d06c9c6066df0ce4728ece53680a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] expect: fix native build with GCC 15
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Wed, 01 Oct 2025 23:13:24 +0100
In-Reply-To: <20251001204638.1442908-1-adrian.freihofer@siemens.com>
References: <20251001204638.1442908-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 22:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224332

On Wed, 2025-10-01 at 22:46 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> This does not work for native builds:
> =C2=A0 CFLAGS +=3D "-std=3Dgnu17"
> The line from native.bbclass gets priority:
> =C2=A0 CFLAGS =3D "${BUILD_CFLAGS}"
>=20
> From bitbake-getvar -r expect-native CFLAGS
> =C2=A0 ...
> =C2=A0 append ...poky/meta/recipes-devtools/expect/expect_5.45.4.bb:44
> =C2=A0=C2=A0=C2=A0=C2=A0 "-std=3Dgnu17"
> =C2=A0 set ...poky/meta/classes-recipe/native.bbclass:44
> =C2=A0=C2=A0=C2=A0=C2=A0 "${BUILD_CFLAGS}"
> =C2=A0 ...
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> =C2=A0meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

Whilst the patch applies cleanly on master, was the command output
above from master? I suspect it was not...

Cheers,

Richard

