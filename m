Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A694E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:54:51 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.93161.1734472481605886417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 13:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TYxKwqOQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385dece873cso2728260f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 13:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734472480; x=1735077280; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=roH1Ly0X38vs7dUX4xqeMpacxGOEIQewe81NeMukAek=;
        b=TYxKwqOQWJlLnvMCwAII9rDaz/iyOkVkjfA+SMDGR/xC+YtgS7QEyTiHxYtNOUrYf4
         zROfhcJfLTn3d8OqgAcYOi1JvnrmF7KhXrzAA3TOVV7UJvSPZ1TTcwUbpJJA/C+4cb1h
         HD1ongB29ttkl9ZRuR99kwfm1uvbQZPoQ/zHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734472480; x=1735077280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=roH1Ly0X38vs7dUX4xqeMpacxGOEIQewe81NeMukAek=;
        b=jmqo+HLXHX8ZwYue2LaYtk9J2u5mb5ixv+XzAMT7SIa1jbrCODJq2oaW4XUH6TEPyO
         ymNxhJKQCPazFx7JP+Ux1CShL1GYLZ9gAq8DH96juEuOFkNel1PG4zLtBu0remg+zU6B
         xJQmfu1QCBdCC70bDS62dp15oNEpgftiz1d8IOIcsfhybdGi5Tod31xl1gVLLmt43AlP
         pB0902o0IxNXXdnBuyU6rfLQ+N7ghzxS2xjkwhyLn3FU77srYAVdLrP0HhdlH9R0VMaJ
         EYnjVnxVbTlOkBfXbRFa/nM2k+3O7RWXPKCWATeNp2Rbp+evDeshTND0/Wm9N7A1e9hK
         nS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3Dv+eMNEF0j1luuUhzZnZv/zMHmABSBrS8LS+e/SazKs/LU5I9B8MXNZzIGkaS8yLd7DhB55qo7Hc9TWZVSutww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEBe0Oxd28ooGeEfuKBXcPQ0/uUa7s5sEDBZh1kGUihPhA8V0B
	Qg3uPNd9ddgpsJlBNpvgu9SyB/nAAVum8WarZs0tZ2GG3i/IwRdqQiSkpk3WXFI=
X-Gm-Gg: ASbGncvrGnS2l+ds7J6Y3ZN5+3vtpCfJbJOHrorHu0dROYfoUOqpcPWpTKwk0z4IdXY
	5xO3I4vf3y7Y6QniPWMP0TbnJqu4CvOs12VOTkad37dIo8XZDMUUK4JjdvStO6ireKt4k18Zrhe
	PEeCEj627fpsOHluVeWyA7NNEOLhYWxNXZ7tPdtXmqMQR0Un0KdckwQ75ACHzyTeShdikHnwf8c
	oJ7rCF3re2IdIdNRLO5yENYvi9srL7Z3T3U/EDTo/D7E0vq42jizWh1I6Wj0bOT00slU7d6AU9k
	lgymwB4bQSlQBitlALnLvBhk4y29EfLDloRAs5/b5CZtzA==
X-Google-Smtp-Source: AGHT+IF6/BaGnzW3624iPaZlIHaY5yyXZtshKm3OfGwoefjlGFB1OYOT23/AryxYV+exDacmU6LNnw==
X-Received: by 2002:a5d:59ad:0:b0:386:3213:5b9d with SMTP id ffacd0b85a97d-388e4d8e7e1mr346423f8f.41.1734472479714;
        Tue, 17 Dec 2024 13:54:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac68:38dd:218a:1df1? ([2001:8b0:aba:5f3c:ac68:38dd:218a:1df1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801626asm12263821f8f.29.2024.12.17.13.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 13:54:39 -0800 (PST)
Message-ID: <44c02d8227fc53f02b088048ba150db84c5ab86d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 03/21] boost: upgrade 1.86.0 -> 1.87.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Date: Tue, 17 Dec 2024 21:54:37 +0000
In-Reply-To: <1734425887-18069-3-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
	 <1734425887-18069-3-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208858

On Tue, 2024-12-17 at 16:57 +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>=20
> boost-math-disable-pch-for-gcc.patch
> refreshed for 1.87.0
>=20
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
> =C2=A0.../boost/{boost-1.86.0.inc =3D> boost-1.87.0.inc}=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0...uild-native_1.86.0.bb =3D> boost-build-native_1.87.0.bb} | 0
> =C2=A0.../boost/boost/boost-math-disable-pch-for-gcc.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++----
> =C2=A0.../boost/{boost_1.86.0.bb =3D> boost_1.87.0.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> =C2=A04 files changed, 5 insertions(+), 5 deletions(-)
> =C2=A0rename meta/recipes-support/boost/{boost-1.86.0.inc =3D> boost-1.87=
.0.inc} (90%)
> =C2=A0rename meta/recipes-support/boost/{boost-build-native_1.86.0.bb =3D=
> boost-build-native_1.87.0.bb} (100%)
> =C2=A0rename meta/recipes-support/boost/{boost_1.86.0.bb =3D> boost_1.87.=
0.bb} (100%)

I think this breaks kea:

https://valkyrie.yoctoproject.org/#/builders/6/builds/680/steps/12/logs/std=
io

Cheers,

Richard

