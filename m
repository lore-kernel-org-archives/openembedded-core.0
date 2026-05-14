Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A61CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 12:41:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9987.1778762462648781234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 05:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=M/xRzucy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 84FF74E42C99
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:41:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51CD660495;
	Thu, 14 May 2026 12:41:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2348311AF8B51;
	Thu, 14 May 2026 14:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778762459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ET6n/B3WcWndGXIyT8Tye2p8R/6rkb0FlWpc+SdQK+w=;
	b=M/xRzucymYUFIUEjvl2VPDBGzjGAq4UK/ACv+dT3lq0c0g5oktZvV1XexZ7TPSM9WGm8Zs
	3uO/qB+o9idTKP5S5EYyduJGnYfcNbRC9BNflRLUP1+A6OZCI+Q7THedmiHUzWN1ukI9w7
	TgehWfjatTnZAh9LaIpR936vQDPmj8yHikNbkyBaT72rQLO5SGmtGO8Xvj1EoSftFzTrFL
	WNae849R1MGq76Wa4Bxb/Q/l+QyQUxE8xm5e8h1Wt92MvcXb/UHQ8cyB8YrzFEEVxOy567
	keaZtEAPv0u4g8rGlX+vUFwYlVJfCrq2bL2TKFgSTTQXOUn7A7XZP446s4uR9w==
Message-ID: <5437d8a8-8fbe-4f58-853d-acc86da2959a@bootlin.com>
Date: Thu, 14 May 2026 14:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] ovmf: simplify PACKAGECONFIG's default
 value
To: Ross Burton <Ross.Burton@arm.com>
Cc: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-2-joaomarcos.costa@bootlin.com>
 <16ac5a86-680c-46c6-8079-92a0880f5def@cherry.de>
 <B94EE239-0488-4DF5-80CD-81B9EC3A630E@arm.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <B94EE239-0488-4DF5-80CD-81B9EC3A630E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237028

Hello, folks

On 5/14/26 12:57, Ross Burton wrote:
> On 11 May 2026, at 14:19, Quentin Schulz via lists.openembedded.org <qu=
entin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>>
>>> -PACKAGECONFIG ??=3D ""
>>> -PACKAGECONFIG +=3D "${@bb.utils.filter('MACHINE_FEATURES', 'tpm', d)=
}"
>>> -PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2',=
 'tpm', '', d)}"
>>> +PACKAGECONFIG ?=3D "${@bb.utils.contains_any('MACHINE_FEATURES', 'tp=
m tpm2', 'tpm', '', d)}"
>>
>> Just a heads up that this is *not* equivalent.
>>
>> The use of ??=3D meant that any ?=3D (and ??=3D) parsed anywhere befor=
e that line is meant that it would set the default values, and then we wo=
uld append to those default values tpm.
>>
>> Now by merging those into a single ?=3D, a previous ?=3D will override=
 this new ?=3D operator, meaning tpm won't make  it to the PACKAGECONFIG =
even if the MACHINE_FEATURES is set to tpm/tpm2. Also, an earlier ??=3D w=
on't do anything anymore.
>>
>> Whether that's an actual issue, I don't know, but you may break users.
>>
>> Merging the two +=3D into a single one would truly be equivalent.
>=20
> The old value _was_ very un-idiomatic but the replacement is too.
>=20
> However:
>=20
> PACKAGECONFIG ??=3D "${@bb.utils.contains_any('MACHINE_FEATURES', 'tpm =
tpm2', 'tpm', '', d)}=E2=80=9D
>=20
> Is idiomatic and whilst a change of behaviour, it has the expected beha=
viour.  Can you use ??=3D and clarify that whilst this changes the behavi=
our in edge cases, what we prefer is consistency between recipes.
>=20
> Ross

I missed one of the "?", and playing with bitbake-getvar was leading to=20
the same results, but yes, this needs to be fixed. I will send a v2=20
fixing this and other slight issues with the commit message in another=20
patch (the second one, IIRC).

That said, I'd still appreciate some feedback on the third patch with=20
regards to Clang support (cc Richard and Khem). Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

