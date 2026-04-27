Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F4CFF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 10:54:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42282.1777287234763767445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 03:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=SZ0eKq7H;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8957E1A3440
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:53:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59826600D1;
	Mon, 27 Apr 2026 10:53:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB27C10728063;
	Mon, 27 Apr 2026 12:53:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777287231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SjebCLEPCWf1V0GspVrJbBfcHpIV1NnZ+AczYIcU5Uo=;
	b=SZ0eKq7HDpv9tOSCRP/xGTZq+o9AidGoaEtIp7pJFvhnrr9ifsk6e2E+SrzSvhX80+e+Qy
	4bsTOB7/8Bb9A6RiSIkWHeQ+47gGObCVwe+SJqEugvaCD7fpxxoVQTHPWynlH1GqmvI+WO
	u424pNFcP+N78Xk2XcDxWFBuC9KutK90/yIBnqjtT8m8gyotC28WZWtF873QZ7tABRbC1f
	g00yFiPK3WHE/Tzqob31p86twwL7vljyM/6Q/BCSI9PT44fFRqX7Kz+UqTsHhp424AkhoK
	oYYY6IvZfUpq+9A126aElyXdxj0zZXdm3B4FehPEQ+kQETTZ1qChT56Atcuskw==
Message-ID: <3a7b2ce3-7cc0-4d48-8dda-5a37e1647393@bootlin.com>
Date: Mon, 27 Apr 2026 12:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
 <f038565f-4a53-426b-990f-d41e9d1e3732@cherry.de>
 <d34abdf5-0ea6-4aae-a334-14f85e12449c@bootlin.com>
 <f3192818-b214-4733-82e7-4799de9f2bc6@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <f3192818-b214-4733-82e7-4799de9f2bc6@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236005

Hello again,

(...)
>=20
> Yet another option is to do
>=20
> (d.getVar('TUNE_CCARGS_MFPU') or '').strip() !=3D ''
>=20
> but it's a bit eww :)

I'm pretty sure that's how ERROR_QA is handled, actually:

meta/lib/oe/qa.py:    if error_class in (d.getVar("ERROR_QA") or=20
"").split():

Unless this is different in a way I simply cannot see :)

>=20
>> b) Simply remove those changes, then send another patch keeping only=20
>> the changes in recipes.
>>
>=20
> Yeah that works too. It's the same change but the implications are=20
> different. So maybe three patches (one for machihes, one for QA, one fo=
r=20
> recipes (maybe even in two, one for PACKAGECONFIG, one for RDEPENDS=20
> since Chen Qi doesn't seem to like the latter too much :) ) so everybod=
y=20
> can bikeshed as much as they want on one and still have the rest merged=
 :)
>=20
> Cheers,
> Quentin

I'll do that. Maybe that's what I should have done in the first place,=20
but I didn't want to spam N different patches that essentially do the=20
same replacement.

Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

