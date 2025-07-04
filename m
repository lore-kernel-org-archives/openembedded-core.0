Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06066C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:39:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.12674.1751636368227313167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H6keuHiB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso10144205e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751636366; x=1752241166; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URQgbRmXQU8Al9MUYtdCHFVAUJXb7gpI7gLEHJg+7cI=;
        b=H6keuHiBXTxCR/1VBFPntHNlRNimJgImBghPgoLdt7ErrPrLFvQ6MnkOWLz7tzUqXC
         iCoEWVr9SAu/vJWVv4+dVjsYmSj/ZKDqnD1iHvzapLJ1GNzjXiOWKeG+AuloxsgQfV12
         pdIwxmF+o3tB93H0Us2m6omYtYkrIIVtCQ5Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636366; x=1752241166;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URQgbRmXQU8Al9MUYtdCHFVAUJXb7gpI7gLEHJg+7cI=;
        b=Ii1+u7fAb0OL8OX0QTdeO+im2mwehRyZcJqPg6Uh2twPAJCrfdyyL70Aq5EJHPaKmS
         IapjKDyQvBQfsTVY7TLt1Moyx5xr8kcBGhZhfdwWw5NiAYLK+W/gXiZkAeg2iYxwYCcn
         FZ2Cn0X34YPviulrZKiadP7gyXbXYzlrCOn/SlqKHiwL/7+m6UClZAZ0afimcv92miHI
         5R8b2apz+DsVGdq5ZcAm78yEeYlOfmRXqCRskCULSrzDGd6MwxZVCyQJ678wgBTdE32w
         ZmJUDSMTthV6GR++sZvfSqLFW1gi7jThYeqOGalFcP2q6pYa0Hfoc4XLvt370MrdpPc3
         PUAw==
X-Forwarded-Encrypted: i=1; AJvYcCWaKXRfPl996zeO+fXliBZQpz9+5StlBuXU/f9ox9z3IRc7VL/eZmsquSnSiC+LoLkGZ7dNWikQfnBbp3bLI1rpow==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1DG5LtWmHVC4en11O9euh+6S30hSMEV0mPDVudUpSYlerG5Mk
	ajdiaRnSkM1j980IajKTDJhnpj2KhgiWVIcjC7RkZ4VjfRzv+kVdTCn5I+8/KEEj4yQ=
X-Gm-Gg: ASbGncvGYKQLrZEohUgAlxRIpSWgyF8b+5KFM8u/Y/jgind9mRBeOsQTaOuV1mX48qw
	YtfNMjN/4qLSwLc6N9zJX4YMJeI3E8Cza8sXRSQcs0dy2nmZp03ZwDeW3mR3BZDMWdDcO0rxBI+
	ynjYmasE6lAZ2J4qCXyvip/JeldoCy8epvlX5AT85rExf8CU1boBS27crNiV5+gUamYd7RxGE8e
	X0xWak+COeTAYJIH/f8iiCSYVykPOagdvfyeBmompUeJOgeGFtrMC9RDS0lVpQtiZQqBkuBFJar
	25VI9HXV5glYalD/krxmiYHUr9a2A5+9VnJiyeOmTrVWkt7csAbIIPrZ+TS6YOXAz9LPn/3Kh0p
	CnhXbC1rrh3mLW4EoqFUXV4xOGBDIXc6IOmHgCZ3kmvGrR3AHFZg=
X-Google-Smtp-Source: AGHT+IF0FtCebzumX6buw5Czu+erJsYctXTy5PNJNbzMN4DQ+7oVgNTrRJSxMEzVeNnIuv9lXWfoFQ==
X-Received: by 2002:a05:600c:528e:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-454b3115054mr35334275e9.30.1751636366284;
        Fri, 04 Jul 2025 06:39:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609? ([2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b3542838sm69215335e9.1.2025.07.04.06.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:39:25 -0700 (PDT)
Message-ID: <f75a5489f7a188dc8a03d68d971f208dcfc538e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH] classes: Move package RDEPENDS
 processing out of debian.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>, 
	openembedded-core@lists.openembedded.org, s.zhmylev@yadro.com, 
	alexandre.belloni@bootlin.com
Date: Fri, 04 Jul 2025 14:39:24 +0100
In-Reply-To: <4ibw4a2a3ipn7q4zi7ccr6lll7hiim4jixqw5kius5jkt6m7ul@qypqeob6esee>
References: <184F0B7F5F23DACA.27863@lists.openembedded.org>
	 <4ibw4a2a3ipn7q4zi7ccr6lll7hiim4jixqw5kius5jkt6m7ul@qypqeob6esee>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 13:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219923

On Fri, 2025-07-04 at 14:25 +0200, J=C3=B6rg Sommer wrote:
> J=C3=B6rg Sommer via lists.openembedded.org schrieb am Fr 04. Jul, 14:16 =
(+0200):
> > From: Sergei Zhmylev <s.zhmylev@yadro.com>
> >=20
> > INHERIT_DIRSTO by default includes debian.bbclass which in turn properl=
y
> > establishes dependencies between package management tasks and build
> > process. Debian class also unconditionally renames several packages in =
a
> > Debian way. In order to allow disabling of such renaming rules, the log=
ic
> > of RDEPENDS handling is moved to a package.bbclass.
> > This commit also solves the SDK building issue without debian.bbclass.
>=20
> Is this code in master still required or can it be removed?
>=20
> ```
> bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:100:DEBIANRDEP =
=3D "do_packagedata"
> bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:101:oo_package_w=
rite_ipk[rdeptask] =3D "${DEBIANRDEP}"
> bitbake/lib/bb/tests/runqueue-tests/classes/base.bbclass:102:do_package_w=
rite_rpm[rdeptask] =3D "${DEBIANRDEP}"
> ```

That is in a bitbake test, specifically testing certani kinds of
dependency so wouldn't we still need that? What makes you think it
should be removed?

Cheers,

Richard


