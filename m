Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F75DE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:09:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.57211.1734358182139657715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 06:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c3JzPqz+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15C17FF802;
	Mon, 16 Dec 2024 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734358180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jec0KH6BmEgP4eK9RhgfEvr8xLgavG8tkqFNHPCSJvE=;
	b=c3JzPqz+dnmGS/kwMsJ9bBjCP/e558i2dR2wma61Dw7aA0/lq6Oc1nEpUGt7PNO0LDgOsL
	uqocM3C3zG7YrynL+OMHjALKGNhpW45e2sUXKP1CQnT5hVSYIztaBHDlseqx9HC7io0pPh
	/BL5OhA0lDmb4rllMXb6dkC3DwoXeRXBLNVtUXYb3bjKkAOa1G4kNBhIGHQMW7qfhTIaSi
	Ck6X8DOaj2Py5b6HVHH31fhulKfepDYGnQcSuBx21Rva3bKtdiUdCBVCScFG6DXN+ibLoO
	Au7B38NQNuhl/xm2HVwNd+89CncqCz4P5w5+x9vjfJbJTh72ZH3GRH1YbQT4YA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 15:09:39 +0100
Message-Id: <D6D6NWJ7X8T3.EXJR5L6FECYZ@bootlin.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: use oe.types.boolean on
 KMETA_AUDIT
Cc: <openembedded-core@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241216-kmeta-audit-vartrue-v1-1-51bbb0b2085a@bootlin.com>
 <CADkTA4N6oZ6JbzK6bYE6bgC3FwY5tu2a+WKhEipzhpArNhyvLA@mail.gmail.com>
 <CADkTA4MQecma7amP9At6=DiJrCMisx43cfwFUB2kA2=wUt96Kg@mail.gmail.com>
 <D6D69DHP53LV.2LJHX0T8FW1LY@bootlin.com>
 <CADkTA4NLbCiZcqJsPqR8TC_J=hUqkSTbynT6_P9THizw5-vZew@mail.gmail.com>
In-Reply-To: <CADkTA4NLbCiZcqJsPqR8TC_J=hUqkSTbynT6_P9THizw5-vZew@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 14:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208766

On Mon Dec 16, 2024 at 2:56 PM CET, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> On Mon, Dec 16, 2024 at 8:50=E2=80=AFAM Antonin Godard <antonin.godard@bo=
otlin.com>
> wrote:
>
>> Hi Bruce,
>>
>> On Mon Dec 16, 2024 at 2:29 PM CET, Bruce Ashfield via
>> lists.openembedded.org wrote:
>> > On Mon, Dec 16, 2024 at 8:21=E2=80=AFAM Bruce Ashfield <bruce.ashfield=
@gmail.com
>> >
>> > wrote:
>> >
>> >>
>> >>
>> >> On Mon, Dec 16, 2024 at 6:35=E2=80=AFAM Antonin Godard <
>> antonin.godard@bootlin.com>
>> >> wrote:
>> >>
>> >>> Following commit a39a1f7cf78ad1ca07438bce634a47e970f25047
>> >>> ("kernel-yocto: allow early exit to configuration audit"), we can
>> >>> disable auditing of the kernel configuration by setting KMETA_AUDIT
>> >>> empty.
>> >>>
>> >>> Since the default value of this variables is "yes", use
>> >>> oe.types.boolean() so that it will also be disabled when setting it =
to
>> >>> "no", and avoid potential confusion.
>> >>>
>> >>
>> >> That isn't the intent of the variable. It is being used as a flag her=
e,
>> >> but it can also be used to encode other information.
>> >>
>> >> Quite literally, if it is set to anything, the audit should happen. O=
nly
>> >> when it is unset should it not.
>> >>
>> >
>> > I hit send too soon. It's Monday.
>> >
>> > What I wanted to add was this question: Is that still the behaviour wi=
th
>> > the boolean call ? If so, no concerns from me.
>>
>> It seems that this is the only place where the KMETA_AUDIT variable is
>> used so I
>> figured its role was to enable/disable the audit and only that. Maybe th=
e
>> "audit_flag" name is a bit misleading then?
>>
>
> Maybe, but I'd rather not change the name if nothing is broken.
>
> I normally just put a comment above the variable to indicate
> that sort of behaviour (i.e. # if this variable is set to anything non-ze=
ro
> an audit will be performed), but I for some reason didn't do that
> here!
>
> There are some audit modes for in-tree configs that I'm working
> on that will use that variable to change modes (different from the
> allnoconfig/alldefconfig flags that are already used).

Ok. boolean() will error if it doesn't find 'yes', 'no', '1', '0' or any su=
ch
value, so we need to NACK this patch then. Thanks for the added context.

I will work on documenting this in yocto-docs when I have the time (unless
you've got some free time to document these variables :) ). There's an open=
 bug
on this here https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13835, whi=
ch is
the initial reason why I was looking into these.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

