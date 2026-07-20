Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557A0C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:09:32 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11315.1784560164917165818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=w10Y5EE6;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h3kSc5DnrzMlGQ;
	Mon, 20 Jul 2026 17:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784560160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRvHxokNUnXwaXZGjng6tJaun8mudr4gZ/oyWiZHOuE=;
	b=w10Y5EE65vyaF15jPye7ssfOMqCoUFRfUWGrdUMl3c2I3HD4cveFHu2ejT7IjiJm+c9Cp/
	SZsDPntm2qmG74rwhKPJlFp9isNnKAQT+HmBBDgsjqZGEDRfsmoVShrn32XBOtpRRBn3m1
	+U3N+hchbeXXDU9OET65/dKYhILbW/siSW9omkZBd4jb/KQrNaJcMO8lw0WYIuPokSmp/z
	oC39Cx8P44U9h57c/tk/WXa3En/vvv+QhA+Rml/UtwHW5N+twlFJ92uk2ogdRT3ni4g7x8
	SOc6eeCR9qFcgL/MBPyZZwDYeJ4yMqaV1MPiV8ZUFVFX+VJ+N7SwAwI84cxKUA==
Message-ID: <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
Date: Mon, 20 Jul 2026 17:09:18 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: Marek Vasut <marek.vasut@mailbox.org>
To: adrian.freihofer@gmail.com, yoann.congal@smile.fr,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
Content-Language: en-US
In-Reply-To: <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-MBO-RS-ID: 625b942406bbc9dc7d1
X-MBO-RS-META: umcy1ybpd8ggk4ehqpsomoozghp5pkr3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241408

On 7/4/26 11:55 PM, Marek Vasut wrote:

Hello one more time,

>>>>> I guess, before this patch can be applied, this one (or a back-
>>>>> port of
>>>>> it) is required:
>>>>> https://git.openembedded.org/openembedded-core/commit/?=20
>>>>> id=3D85e0408a81bdca0411a8625061e5e343c05f92d9
>>>>> Otherwise, the oe-selftest fail.
>>>> Thank you for staying vigilant.
>>>>
>>>> Yoann, can you please pick the aforementioned commit too ?
>>>>
>>>> Thank you for your help !
>>>
>>> Hello,
>>>
>>> I missed that discussion, sorry. But was reminded by Ryan (thanks).
>>>
>>> If I understood correclty, the set of patches we need for wrynose is:
>>> * kernel-fit-image.bbclass: Do not include kernel property in DTBO
>>> config subnodes
>>> * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D
>>> "1"
>>> * oe-selftest: fitimage: Do not expect kernel property in DTBO config
>>> subnodes
>>> * kernel-fit-image: Add KERNEL_DTBVENDORED support for
>>> FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)
>>>
>>> Marek, Adrian, Ryan: does that sound correct?
>>>
>>
>> Yes, that's correct. One little detail is the order of the patches. If
>> you pick the oe-selftest commit first, all commits are compile and
>> test-able. That's my suggestion:
>>
>> =C2=A0 * oe-selftest: fitimage: Do not expect kernel property in DTBO =
config
>> subnodes
>=20
> This is [1].
>=20
>> =C2=A0 * kernel-fit-image.bbclass: Do not include kernel property in D=
TBO
>> config subnodes
>=20
> This is [2].
>=20
>> =C2=A0 * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDOR=
ED =3D
>> "1"
>=20
> This is [3].
>=20
>> =C2=A0 * kernel-fit-image: Add KERNEL_DTBVENDORED support for
>> FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)
>=20
> This is still not even in master-next .
>=20
>> same order as on master branch.
>=20
> Thank you for your help !
>=20
> [1] https://patchwork.yoctoproject.org/project/oe-core/=20
> patch/20260704214812.365483-1-marek.vasut@mailbox.org/
> [2] https://patchwork.yoctoproject.org/project/oe-core/=20
> patch/20260630074356.10265-1-marek.vasut@mailbox.org/
> [3] https://patchwork.yoctoproject.org/project/oe-core/=20
> patch/20260630074423.10306-1-marek.vasut@mailbox.org/

Do you think those three backports can be picked up for OE wrynose ?

Thank you for your help !

--=20
Best regards,
Marek Vasut


