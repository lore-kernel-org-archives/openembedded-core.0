Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36859C54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 11:31:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.14484.1725190275062304388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 04:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TDU7MN+c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c3400367so463070f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725190273; x=1725795073; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj2cEh3pmaRC/eLpYpkdW99BJzGxdhNzBvf6UN9D8ro=;
        b=TDU7MN+cTQP2Th8MkI2bTpRrKY06oPfFsZJ2VoxhEBWiKJwbw3EA/oLgzVnN/NhQDz
         c4fmw3EYnwS0bsJHgKUBzJuDwgkjSZ1lrCCoEBVCBnb7T+DmyPGibBLyWQLe77c7sM+p
         Dsv5+Kt/IzxjqflgRvK4M9lCMM5MkgO6cijho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725190273; x=1725795073;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nj2cEh3pmaRC/eLpYpkdW99BJzGxdhNzBvf6UN9D8ro=;
        b=ryJ93OLL0vIM5/f6DxT+Xc/Kewq/d/5Ro8diZxr7c14Fq4haoDChriqW058DcutmxZ
         4riVNhOpbtoD76voKn+5MtkqNyy1RDIQiBsvw/7lq+/nxBX4q1cBsYFddNgqH/W/17r+
         R6dj4wnKx3y0r1z5lvkhrtOmx5dZrdvTy0GXBTXDPxOy8Ga8CM+QkNbLU9BCYyzqzlne
         JxX5QjXBQRqDBB0BZnRNI3Ewi4ZCn45UbRRdw5xPT4KRFEqxnkb41SUdS6Uy/2Se/+2v
         bREs4/omKkAjZJ3pc4RTOcoAIxx2JVc79hOTjbt341BJHKRAZfDWUAoNgIFVkJGXSRgH
         OfoA==
X-Forwarded-Encrypted: i=1; AJvYcCXAsccOD3HJm2+C4fFjsio70M0on5/qzeQIValxetc4ZpykYmxnrZyTJt1VqjGAiE/5550EKBapv0aNBGwyibhNUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhU6g3QfTZNd1Z66bDI1y0z7Y7cLpfAkQkge0ZyYobx5OKkIJh
	AaHNO2qxVvTtf66RyN/8pgm3b3PgXvG/WKlxVoIDeqbK6/rLL0JWBhr6WLraYG8=
X-Google-Smtp-Source: AGHT+IFbBcZq+W/aFBuw6VTKof38WEfm0RK7UMuiuqtgdx0TgLMVjzwKj9lVz2/bJlz4QX4wgaBfng==
X-Received: by 2002:a05:6000:889:b0:371:8dd3:27c8 with SMTP id ffacd0b85a97d-3749b544d81mr8908356f8f.23.1725190272831;
        Sun, 01 Sep 2024 04:31:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c6b5:7d2b:4127:f9f9? ([2001:8b0:aba:5f3c:c6b5:7d2b:4127:f9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b34725desm5919011f8f.81.2024.09.01.04.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 04:31:12 -0700 (PDT)
Message-ID: <8e3db3ca88fa5d5911a5b7d76b4703ab9ccd1dfd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] insane: Drop oe.qa.add_message usage
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 01 Sep 2024 12:31:11 +0100
In-Reply-To: <DB5PR02MB1021325EB5E087023B3C12C78EF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240828161450.1488792-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB1021325EB5E087023B3C12C78EF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 11:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204046

On Sun, 2024-09-01 at 11:21 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@=
lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 28 augusti 2024 18:15
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] insane: Drop oe.qa.add_message usage
> >=20
> > Drop the oe.qa.add_message() usage in favour of oe.qa.handle_error() wh=
ich has
> > code allowing it to be optimised with contains usage.
> >=20
> > The patch also drops unused return values which we stopped using a whil=
e ago
> > and drops the now unneeded function parameters, generally leading to cl=
eaner
> > code.
> >=20
> > The code should be functionally equivalent.
>=20
> There is at least one difference. We have the following in our distro:
>=20
> WARN_QA:remove =3D "virtual-slash"
> ERROR_QA:remove =3D "virtual-slash"
>=20
> since we do not build any package feeds and thus this QA error is not a p=
roblem=20
> for us.
>=20
> After the change from add_message() to handle_error(), I now get a lot of=
:
>=20
> NOTE: /path/to/recipe_1.2.3.bb: QA Issue: RDEPENDS is set to virtual/foob=
ar but the substring 'virtual/' holds no meaning in this context. It only w=
orks for build time dependencies, not runtime ones. It is suggested to use =
'VIRTUAL-RUNTIME_' variables instead. [virtual-slash]
>=20
> during recipe parsing, which defeats the purpose of turning of the QA err=
or.
>=20
> Now, we can of course fix our recipes to avoid the use of runtime depende=
ncies=20
> on virtual/. I just wanted to point out that there is a difference in
> functionality, and one that is hard to do anything about in layers on top=
 of=20
> OE-Core.

You're right, that is an unintended side effect. That said, I think the
note log level is very noisy anyway?=C2=A0

Is the issue that notes at parse time get handled differently to those
during task execution?

Cheers,

Richard

