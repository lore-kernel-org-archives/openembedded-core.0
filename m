Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4CDCE7D05
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:44:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.77501.1727775882644953463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XFyVC6mO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so43216205e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727775881; x=1728380681; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Wj6UYGJ2FogqKgmgEK2deVG+cUdN21fO6zt1UChRD4=;
        b=XFyVC6mOpLjQHMlTgUsXDXYK83vZx1/qV2XU0Czzw5FQO5UHcBHQYmRrJqEhZCZJG0
         p1ktyzHvKlgpP8q96qm094Mzghp8GiXF/8fGyJf/6aY/h8vhIjfaHENyl4qKqRnX3ige
         qT0LFS1ltWCNrHqsLpSl4F2LX2A87Qw8YePUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775881; x=1728380681;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Wj6UYGJ2FogqKgmgEK2deVG+cUdN21fO6zt1UChRD4=;
        b=CJX7m3cElJnyftWy2xWVmN8L/qrTWSq9K/IDpw091CSZdWEmplKyP/YLFhn8tBVcYC
         rQvS9iqawk0v3UK5hUA3uwFdqhtqmgKWiU34/eNZUm8w71F5+affDY2rxGzIftxz3/SM
         Ds4vVstmEqvUxbeEyjK7tDJ/+qXP857L0VP1fFKTmSHz1kOZtm9HVPJLvFQ91ZTSpQjO
         QysPaAFKInOD2NJ7nGhGDTICpXsI9Xi23n8Ok/V8K7a+CRPSMxRA72C8J2yIGo/nmfPY
         nlE+LyDe+pk1k0b17FNxbmZc6O2FRNz9AcKf5QpyH6pZ8XV+WEhmkSts0slOlnDFTjx5
         PBWw==
X-Forwarded-Encrypted: i=1; AJvYcCXRuzGOd6MbRFlcZeIcqwqlMw846OElMrzFMbXMbuO69Es8T8MK86MWhN8jRmDfF2aBG8zDco4esxj4p3ALCZIBvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywf0ABetbotufO6ps3toMOUB7WxRvxZyE5JuYBJhxNQRwhhezfA
	AZc/LYu573+8tqoSdkUoz195FFm0c/hZvxGctA67OLgOU1Od6fd4sZkjeEhgHX/ck0tYmbFvWSq
	6
X-Google-Smtp-Source: AGHT+IFPiiWBho1qEewWinD/xGn9j+TOoERPHK2k66NHHvN9Gb+OOgrTULEAyyoJlya+te4pnoPyGw==
X-Received: by 2002:a05:6000:10c3:b0:374:c8a0:5d05 with SMTP id ffacd0b85a97d-37cd5b10875mr9268508f8f.50.1727775880982;
        Tue, 01 Oct 2024 02:44:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d? ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5742a23sm11385790f8f.105.2024.10.01.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:44:40 -0700 (PDT)
Message-ID: <85b15dfd7c6638225bbd73cab5c79524dbe9e8b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: modify: don't accidentally override
 existing source tree
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rhi@pengutronix.de, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Date: Tue, 01 Oct 2024 10:44:39 +0100
In-Reply-To: <20240930133007.1184996-1-rhi@pengutronix.de>
References: <20240930133007.1184996-1-rhi@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205153

On Mon, 2024-09-30 at 15:30 +0200, Roland Hieber via lists.openembedded.org=
 wrote:
> The 'srctree' argument might point to an existing source directory, and
> 'devtool modify' without '--no-extract' given (maybe because of the
> user's forgetfulness or inexperience) will override its content without
> futher warning. Catch this accidental use case, and prompt the user to
> specify '--no-extract' if this source tree should be used.
>=20
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
> Note: this patch was developed on kirkstone and will probably also apply
> on scarthgap.
>=20
> =C2=A0scripts/lib/devtool/standard.py | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index b2e1a6ca3a5e..5354f298f598 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -790,6 +790,10 @@ def modify(args, config, basepath, workspace):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "not exist or is not a directory" %
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 srctree)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not args.no_extract and os=
.path.isdir(srctree):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise=
 DevtoolError("Source path %s already exists. Did you mean to "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "specify --no-extract?" % srctree)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipefile =3D rd.getVar=
('FILE')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appendfile =3D recipe_to=
_append(recipefile, config, args.wildcard)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists(append=
file):
>=20

This causes most of the devtool tests to fail:

https://valkyrie.yoctoproject.org/#/builders/48/builds/130/steps/14/logs/st=
dio

(oe-selftest -r devtool)

This does make me worry that combination of options is used quite commonly.

Cheers,

Richard


