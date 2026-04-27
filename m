Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE05BFF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:38:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39097.1777279102187441341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=PwhoOwB+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EEFEDC5CD44;
	Mon, 27 Apr 2026 08:39:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC17B600D1;
	Mon, 27 Apr 2026 08:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 633E5107200A4;
	Mon, 27 Apr 2026 10:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777279099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=T6MPkJABqacP9CLo0BpkqN7TfT3AzTWw7goVuUbZ0gQ=;
	b=PwhoOwB+q9eLZcaK7GAgQy23gJay6M5/k1idAdNOv5RNWx3LmpSsg9N3tys4mTkdA8voYG
	gYiIAMf7xiFiFLyJENjNDqAQIdxb5/yAOF0uN8t8P0eDFfq+MIRG8xRHo6jeiBTqfGj9jg
	IIBZp/q74RTIf3Rhp8NPrsBC1YPAX/iteT9CuWiRgZRDS3WP6cYPruCBawrZfvZDJsyMwI
	nECeFK+8GODaFX4RHRjnGba1IpnGy3UIxxol9E8dIP3GZCSl2afmF15I3KYOcbrHehT576
	5pVOxjoM21fkdiHkHh9gtnV78SRZBnksttFAebfxmdBGvyQty381e3o3Xu08Cw==
Message-ID: <d34abdf5-0ea6-4aae-a334-14f85e12449c@bootlin.com>
Date: Mon, 27 Apr 2026 10:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
 <f038565f-4a53-426b-990f-d41e9d1e3732@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <f038565f-4a53-426b-990f-d41e9d1e3732@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 08:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235993

Hello, Quentin

On 4/24/26 17:40, Quentin Schulz via lists.openembedded.org wrote:
> Hi Jo=C3=A3o,
>=20
> On 4/24/26 5:17 PM, Joao Marcos Costa via lists.openembedded.org wrote:
>> Some recipes and configuration files use bb.utils.contains to check fo=
r
>> a string inside a variable, and return the exact same string if true.
>>
>> This can be simplified by a call to bb.utils.filter, since the result =
is
>> the same, and the inline is shorter.
>>
>> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A,=
=20
>> 'a', d)".
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>> ---

(...)

> I'm pretty sure your changes in the conf files won't work, but maybe I'=
m=20
> wrong?
>=20
> Before, we only added a space if there was a new tune to add. Now, it's=
=20
> always added.
>=20
> Considering TUNE_CCARGS_MFPU can now possibly contain only spaces, the=20
> check if TUNE_CCARGS_MFPU is not the empty string to access the last=20
> element in the list returned by split(), which will now be the empty=20
> list, will raise an IndexError exception.
>=20
> You need to adapt anything that's using this variable to check if it=20
> only contains spaces or at least remove spurious ones, possibly with=20
> str.strip() for example. Unfortunately, if TUNE_CCARGS_MFPU doesn't=20
> exist, d.getVar() will return None and you cannot strip() on None. Of=20
> course, considering TUNE_CCARGS_MFPU is declared just above in the file=
,=20
> it'll always be defined, so maybe that's fine to not check for None.
>=20
> If the space didn't matter, we probably would have used +=3D instead of=
=20
> .=3D, so I'm wary of this change (the rest looks fine).
>=20
> Cheers,
> Quentin

Thanks for your review. And yes, I'm looking at this part of the patch=20
again, and I'm considering two things:

a) Add the strip() as you said, here, and keep my changes:

-TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s' %=20
d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if=20
(d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
+TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s' %=20
d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if=20
(d.getVar('TUNE_CCARGS_MFPU').strip() !=3D '') else ''}"
  # The following deals with both vfpv3-d16 and vfpv4-d16
-ARMPKGSFX_FPU =3D "${@ ('-%s'       %=20
d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('-d16', 'd16')) if=20
(d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
+ARMPKGSFX_FPU =3D "${@ ('-%s'       %=20
d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('-d16', 'd16')) if=20
(d.getVar('TUNE_CCARGS_MFPU').strip() !=3D '') else ''}"

b) Simply remove those changes, then send another patch keeping only the=20
changes in recipes.

What do you think?

--=20
Best regards,
Jo=C3=A3o Marcos Costa

