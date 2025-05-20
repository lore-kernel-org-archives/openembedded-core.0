Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4294C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 13:23:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.20699.1747747410064655526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 06:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P44hPNoY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a064a3e143so3082511f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747747408; x=1748352208; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3HetEZRjNv9wM9tySd8Ceodyxv0tXlxQokVqtB/bYZk=;
        b=P44hPNoYejVdoZLjOyY9PDglT5OiUWGuLdOWKxNjsgGhDSh2Kv2YrQc+V0tGsgHDlF
         xzq4nu6gqa1wLo7Ty4SieeiSY+aj8ihLKO+yiq4XJP87bccYa7VwLYNrOitdeai7kjLL
         MhEEAIUSlmEc/HzY4dpYshtl+uFQxZXFHNyiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747408; x=1748352208;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HetEZRjNv9wM9tySd8Ceodyxv0tXlxQokVqtB/bYZk=;
        b=ok/tXIAgkK0vLhNFmvFlwJgpEIptJpT3Y31EpmeGNlXcxAiCgq43JqvpfOUnkqIpMY
         wff7vgA22IIB1pvJfuy5MCd4yjYVHpyJhY3cv8RPma/1Jx7sczjjl92Thm1vY9gYzxBO
         oHjpXdmXnM3aYRasZit1/SuLFfd57RVUiq3J0RiUkZ5PZ+ex+OzT61ECmfBBf+HZaQgz
         SMng+XPwCCRISNL3s7PPbZM8oiw7UeMMPMAIroiWnREbctEMp2EDchkl4/ofLrOmF6y8
         AjQ3uTw3PJxRED1FsuJfKQ+s4JuF4xkb0xJZDg77JvAX/2cUm1WLwqC17OuFLdXIev8b
         +RSg==
X-Gm-Message-State: AOJu0YxQQj6TkpY+hOLq/1d/Bj6ARVvPyU+8PkxjLjVD71s+jL0xDLBF
	3/xgn0TB3K9XlmVdUWCx0Fel2k72722ZiS6h5oxAYra15RIYEotmrb4yhHH7dM7akxg=
X-Gm-Gg: ASbGncsheR2pzthv0XUey9K+jMoXP4mz2wFJSVBgZlzfvJ/mBfpfSnEMVOUj0RtE2wY
	JFf81ckO6iIZCSIv/6K2PxE6bp7cimpOSGICVarp8dmtma+v7DqnleeiKYf+DJdKOQtN/5MZHEr
	fbEkryULIpazURqQFhX8gxz7MoKZ7Fwa7vK4lszYWBs7Qh1RbKNtCr6mIODYu57aDCJilca5cG7
	yOZmGHxsPMUoEnEAhii2ajWp5iOCTj8n52EdGtOktyDbqYHXtXPZiQgtcopydpyS50XVOjLUVwU
	UbO57eS8cYurS8ATf283ljNxPhgnghl98gypAT8ZNoHnqh7sqRESmM29Fd0Bmjua00KWGqY0qEs
	BBYc8pfuw2pOx4hkyLFjrcp0l14YhLD9vCVwjpuRwrYB7Gr8m
X-Google-Smtp-Source: AGHT+IGNK/wH2XbRRPh+QUTTwrcsWNsAk/s62LDN3oEsYhw0ZJpklEipHAf/dKJvDst3OORW49sJyQ==
X-Received: by 2002:a05:6000:18ab:b0:3a3:6e23:3a46 with SMTP id ffacd0b85a97d-3a36e233c0amr7539931f8f.43.1747747408263;
        Tue, 20 May 2025 06:23:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:685:a6df:9777:90ca? ([2001:8b0:aba:5f3c:685:a6df:9777:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f062fcsm30123215e9.15.2025.05.20.06.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:23:27 -0700 (PDT)
Message-ID: <089fb60e663c2cd5f378fc12acd37d7a718bd458.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 May 2025 14:23:26 +0100
In-Reply-To: <CANNYZj9mqhhwvr145RCzR5NULK48_SmphXyiprLFbK9dOGnyhw@mail.gmail.com>
References: <23322.1747649580665167105@lists.openembedded.org>
	 <23322.1747650258056298980@lists.openembedded.org>
	 <CANNYZj9mqhhwvr145RCzR5NULK48_SmphXyiprLFbK9dOGnyhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 13:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216911

On Tue, 2025-05-20 at 15:06 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Mon, 19 May 2025 at 12:24, Oleksandr Hnatiuk via
> lists.openembedded.org <ohnatiuk=3Dcisco.com@lists.openembedded.org>
> wrote:
> >=20
> > Also, consider this
> >=20
> > packagegroup.bbclass inherits allarch.bbclass - except when PACKAGE_ARC=
H is set before inheriting packagegroup
> > in order to do so, a nativesdk packagegroup must inherit nativesdk firs=
t
> > there is a native-last QA check which strongly suggests inheriting nati=
vesdk last
> > nativesdk is inherited last via inherit_defer in nativesdk-packagegroup=
-sdk-host
> >=20
> > I see all of this as either very misleading at best or a mistake at wor=
st.
>=20
> This is probably true. It does look like a pile of ad hoc fixups
> rather than an overall design and structure. Maybe it's possible to
> clean and simplify?
>=20
> =C2=A0I'd say if you resubmit the patch with all the extra research you d=
id
> in the commit message, that would help review. I don't have objections
> anymore.

There is a lot of history here. I'm tempted to suggest we remove the
allarch inherit from packagegroup and add it to the recipes explicitly
as it is all getting far too convoluted and I'd like to see things
simplified, not complicated.

I'd like to see the conditional code in allarch removed too FWIW if we
can work out how to do it.

Cheers,

Richard


