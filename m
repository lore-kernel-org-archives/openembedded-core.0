Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112E2C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 17:21:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.60799.1699291275651345585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 09:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GrJ9s8/h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40850b244beso36234375e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699291274; x=1699896074; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WzmlD/6vPQg5VhfA3H/u35kr9juFBxO50DM3lQLJJwE=;
        b=GrJ9s8/hfMb1aAIVjg0bdKCK5IB9/yC65V3+Aga3iiwfC8KQouh6vgKdjdjpDAm045
         LiW8c4yYK0Q28yA/QyDN0CuTrMBFlGUnd/1tVhXq6YV0BsuHA/I205qdoTP5PoFRb1tC
         0a4zuGnaGJ4zI4lckl4462gC4aQaat0rm17CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699291274; x=1699896074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzmlD/6vPQg5VhfA3H/u35kr9juFBxO50DM3lQLJJwE=;
        b=ieIFYWDMy24AohpiWfLVne/JD3vJbTyoUAWIG0MMda9MWy0DWIwHPGvC3AiHS/6P1r
         X4Xx2hDlUBEbHrtRQbjLkrBJY91ig4FXwgvCw3dVk1XxqfFlRxPk7QIk48yMx/Vh75Bv
         tq+1c+MJG78GwWHRl4zdO9hCGjt7m4p6VeG1llpOVTWghba29PFTuVl5JWR02UtvaAxm
         gDSvekEYiKaQap3LZZNgFFozyeilx3p3KX6O1nMupfT4jP4b9enxnxWOv+AWSTI/5r9x
         iMnmDI44Rr+rp1li6DxI+AtuNpoX7BUvr777YoMS2JJn1j7mwCi3pPM3fkZWLhSc+YNJ
         PMQQ==
X-Gm-Message-State: AOJu0Yw/LdE9DPs6dxk7PommJ4w2ua0cpAK4ErcJmo9fb/z2AU4aOsiR
	pIVAiVDkbF063rNrPQhxysoXoQ==
X-Google-Smtp-Source: AGHT+IEVSUCjdEwj0r5rWVFr2FxbmX9HTLhOPX433FroWo2VnXb3025QAO6t5ptyudWGqCbpgUT4Cw==
X-Received: by 2002:a05:600c:1909:b0:40a:25f1:7a28 with SMTP id j9-20020a05600c190900b0040a25f17a28mr266988wmq.40.1699291273985;
        Mon, 06 Nov 2023 09:21:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id er14-20020a05600c84ce00b0040472ad9a3dsm12548198wmb.14.2023.11.06.09.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 09:21:13 -0800 (PST)
Message-ID: <8721eadcfd550afdcb98156b028917c4d3070d87.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v3 0/4] recipetool: Add handler to create go
 recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Vyacheslav Yurkov
 <uvv.mail@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Peter
 Kjellerstedt <peter.kjellerstedt@axis.com>, u.oelmann@pengutronix.de, Lukas
 Funke <lukas.funke@weidmueller.com>
Date: Mon, 06 Nov 2023 17:21:12 +0000
In-Reply-To: <1794ACDB8DBB20CE.26468@lists.openembedded.org>
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
	 <1794ACDB8DBB20CE.26468@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 17:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190240

On Sun, 2023-11-05 at 08:30 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-11-02 at 16:53 +0100, Lukas Funke wrote:
> > From: Lukas Funke <lukas.funke@weidmueller.com>
> >=20
> > This patch series adds a recipetool handler in order to create 'go' rec=
ipes.
> > Each recipe contains a list of dependencies in their SRC_URI.
> > Dependencies are derived from the projects `go.mod` file. For each
> > dependency the corresponding license file uri/hash is added.
> >=20
> > The recipe may not work ad-hoc, but is a good starting point to create
> > a working recipe and have a working offline-build.
> >=20
> > In addition to the main recipe three additional files will be generated=
:
> >   - $pn-modules.inc
> >   - $pn-license.inc
> >   - modules.txt
> >=20
> > Changes from v2:
> >   - Generate separate *.inc for go dependencies and licenses
> >   - Adapted oe-selftest according to change above
> >   - Incorparate community suggestions
> >=20
> > Lukas Funke (4):
> >   classes: go-vendor: Add go-vendor class
> >   selftest: recipetool: Add test for go recipe handler
> >   recipetool: Ignore *.go files while scanning for licenses
> >   recipetool: Add handler to create go recipes
>=20
> This looks to be getting there but the code failed in testing:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2371/s=
teps/14/logs/stdio
>=20
> since removeprefix is python 3.9 syntax and 3.8 is our minimum version
> at present.

Since these were through testing, there was no other negative review
feedback, the patches appeared to do what I thought we'd all agreed was
needed and I had the minor tweak needed for the python version issue I
did merge them. I squashed the tweak in with a comment in the commit
message.

Cheers,

Richard


