Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F63E77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 13:50:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.56971.1734357043719461365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 05:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hUzRgWfw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84063FF809;
	Mon, 16 Dec 2024 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734357041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kRRYO7y7WlAHPqtvMPdEyZ6GVMCaOYHv5CgRcxFKd20=;
	b=hUzRgWfwYUt1lFilQW2d4LO2CbCnzE6EQgkmmOrb/nTByHViE5FrBfQ+2U5V9AD8q+kJlX
	kipbf/MXioFfLng2kv0+cNYifjIuuHauxyXr5q+D6cY9CsAidJWqNcNWh4cxy64Hr6ZpTn
	Zh7LGiYGSUV3N2wphBsR8JTP2uqt8KjsB7AGYxtypvDNE/zGRiBl48XQpF9+NSSDElb+s/
	929BWRCn+a7MYkNuq8GX1yE44JogepWS9koAzP8cqTXeGU79GECIxXQ+A80wRoSl0ZedeT
	gfn6Sx8VA0jozbhsStDwIlcw+m2kwjiU4OhDs5CrJyZpz7iFEta747q70lh3Dg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 14:50:41 +0100
Message-Id: <D6D69DHP53LV.2LJHX0T8FW1LY@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: use oe.types.boolean on
 KMETA_AUDIT
Cc: <openembedded-core@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241216-kmeta-audit-vartrue-v1-1-51bbb0b2085a@bootlin.com>
 <CADkTA4N6oZ6JbzK6bYE6bgC3FwY5tu2a+WKhEipzhpArNhyvLA@mail.gmail.com>
 <CADkTA4MQecma7amP9At6=DiJrCMisx43cfwFUB2kA2=wUt96Kg@mail.gmail.com>
In-Reply-To: <CADkTA4MQecma7amP9At6=DiJrCMisx43cfwFUB2kA2=wUt96Kg@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 13:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208764

Hi Bruce,

On Mon Dec 16, 2024 at 2:29 PM CET, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> On Mon, Dec 16, 2024 at 8:21=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com>
> wrote:
>
>>
>>
>> On Mon, Dec 16, 2024 at 6:35=E2=80=AFAM Antonin Godard <antonin.godard@b=
ootlin.com>
>> wrote:
>>
>>> Following commit a39a1f7cf78ad1ca07438bce634a47e970f25047
>>> ("kernel-yocto: allow early exit to configuration audit"), we can
>>> disable auditing of the kernel configuration by setting KMETA_AUDIT
>>> empty.
>>>
>>> Since the default value of this variables is "yes", use
>>> oe.types.boolean() so that it will also be disabled when setting it to
>>> "no", and avoid potential confusion.
>>>
>>
>> That isn't the intent of the variable. It is being used as a flag here,
>> but it can also be used to encode other information.
>>
>> Quite literally, if it is set to anything, the audit should happen. Only
>> when it is unset should it not.
>>
>
> I hit send too soon. It's Monday.
>
> What I wanted to add was this question: Is that still the behaviour with
> the boolean call ? If so, no concerns from me.

It seems that this is the only place where the KMETA_AUDIT variable is used=
 so I
figured its role was to enable/disable the audit and only that. Maybe the
"audit_flag" name is a bit misleading then?

The behavior of the boolean call is to return False if KMETA_AUDIT =3D=3D "=
no", so
it _is_ different from "if set to anything, the audit happens".


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

