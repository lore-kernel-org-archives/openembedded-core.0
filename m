Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEA0C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 08:30:21 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.26766.1699173017897801801
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 01:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cf+dLQTT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso49086691fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Nov 2023 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699173016; x=1699777816; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VYwUpIcFWsqi9+BgDNSR7knfhh9VVGsXwlcJFrCVW0M=;
        b=cf+dLQTT7JR21FDDj5INFb+sbCL3ZHjJSnzpGoHSP3ic6Lh+ykrki8UiB9MMfph0dZ
         WURKqsvLwRTakevhCa70gRpGy4d/LU0SuzyfDsqJs6yxr5UaWPJJlyI9UeELVwGYKzcY
         9/0TByG0Kj6hA35yRyUvNrpawEIiijhejoYNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699173016; x=1699777816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYwUpIcFWsqi9+BgDNSR7knfhh9VVGsXwlcJFrCVW0M=;
        b=Anm2Anyh7AU6HxkgJtNmY4oQ1cab24dTGPdkNBrt6Doq6TiUV7rGlvXIKDPgj40NTG
         XvEm78KwS74xEBRbMZmjdxm4beYCxbmAuTacUDGCqFYz5LKqdzUA4psl16/MdetUdJ6w
         n3ilwmTOmP00uLZsPJSwnQVcLnc8c6O42mNwl+swz19TSSs5dKovncKpkxZmuA40eyGE
         HzKpd1NWrksVJKXnJnxZvMSayhpKNsuClEy4WlvuydiKAMs6Cg6udzhf8B8zMKFXDwHH
         EVKMXi739n5ywJJNHeDcUKjyDKUjOagQK7eChqIdVVqMtc2pd3wVU9kjExvq2O4kFYWJ
         dZAA==
X-Gm-Message-State: AOJu0Ywx0gRhKBVONu0CziMnbBzme6DfX1k2MJFTTWQgVfY6rUiTiWzk
	4oJv4CMmDJPrvDdNHFWSiYhdpA==
X-Google-Smtp-Source: AGHT+IFaIhPMtam800zJq6Vsec33F5+sAlycc8ShGo2V+hPWih2LQ+FwQ+sFioWqAFP5JhDUKxpQsw==
X-Received: by 2002:a05:651c:1031:b0:2c6:eb44:2e12 with SMTP id w17-20020a05651c103100b002c6eb442e12mr8955241ljm.43.1699173016050;
        Sun, 05 Nov 2023 01:30:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c8b8:43bd:3cc1:92af? ([2001:8b0:aba:5f3c:c8b8:43bd:3cc1:92af])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003fee6e170f9sm8354387wms.45.2023.11.05.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 01:30:15 -0700 (PDT)
Message-ID: <c27ece603012c2df3a50d67b9e5337e1880768d7.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v3 0/4] recipetool: Add handler to create go
 recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Vyacheslav Yurkov
 <uvv.mail@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Peter
 Kjellerstedt <peter.kjellerstedt@axis.com>, u.oelmann@pengutronix.de, Lukas
 Funke <lukas.funke@weidmueller.com>
Date: Sun, 05 Nov 2023 08:30:14 +0000
In-Reply-To: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Nov 2023 08:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190184

On Thu, 2023-11-02 at 16:53 +0100, Lukas Funke wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
>=20
> This patch series adds a recipetool handler in order to create 'go' recip=
es.
> Each recipe contains a list of dependencies in their SRC_URI.
> Dependencies are derived from the projects `go.mod` file. For each
> dependency the corresponding license file uri/hash is added.
>=20
> The recipe may not work ad-hoc, but is a good starting point to create
> a working recipe and have a working offline-build.
>=20
> In addition to the main recipe three additional files will be generated:
>   - $pn-modules.inc
>   - $pn-license.inc
>   - modules.txt
>=20
> Changes from v2:
>   - Generate separate *.inc for go dependencies and licenses
>   - Adapted oe-selftest according to change above
>   - Incorparate community suggestions
>=20
> Lukas Funke (4):
>   classes: go-vendor: Add go-vendor class
>   selftest: recipetool: Add test for go recipe handler
>   recipetool: Ignore *.go files while scanning for licenses
>   recipetool: Add handler to create go recipes

This looks to be getting there but the code failed in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2371/ste=
ps/14/logs/stdio

since removeprefix is python 3.9 syntax and 3.8 is our minimum version
at present.

Cheers,

Richard

