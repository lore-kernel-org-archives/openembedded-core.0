Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C48FF8862
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 09:31:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39929.1777282261387176038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 02:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=kYUSNbtG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D013C5CD44;
	Mon, 27 Apr 2026 09:31:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 064CE600D1;
	Mon, 27 Apr 2026 09:30:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0C441072237F;
	Mon, 27 Apr 2026 11:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777282258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LW5WJJvXF/bvqUqxsuCqFhjLdu0+230b/rMbZgDA/oE=;
	b=kYUSNbtGJcmAj6VZF28poxQgq/MXvViNudKGlo43pI4HjX6Nr2ao0ayRV1JXAFAM4oafwP
	pFL779u30mCWlZhWM9lB5A2IJ0K0ApDRGkcvlA49m0aViXfH/5F0soU3WXa2r+AODfjaLt
	dxChGPEohuYTtN8zIbYbh/mmWsWLV4RIqkKZU0X9OBLOspg+2ygmFaTGBJGoa+Mkalj7ea
	6G28ldIsXxYQSjWlH56ElVBc5ZdYIZESKq265jUb00asNIM/rDAKvyQi4cD/pNoLKVCy9v
	2Nfsbgx019pO/4d8Io3He2MuM9+Kb6kbmb7rnrXFdMqEk6aMVwLMLz57vgxK5A==
Message-ID: <fa2f6061-1c36-484c-9f7b-00691d9bf7fb@bootlin.com>
Date: Mon, 27 Apr 2026 11:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
 <25ab1432-5860-4985-8827-e1a672f66a9a@windriver.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <25ab1432-5860-4985-8827-e1a672f66a9a@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 09:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235997

Hello, Chen

On 4/27/26 10:49, Chen Qi via lists.openembedded.org wrote:
> When using filter for two different things, isn't it a little strange?
>=20
> Take the first change you made as an example:
>=20
> -ERROR_QA:append =3D"${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge'=
, '=20
> usrmerge', '', d)}"
> +ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge'=
, d)}"
>=20
> Previously, the line is very clear. It reads like: if DISTRO_FEATURES=20
> contains 'usrmerge', append ' usrmerge' to ERROR_QA.

So far, this applies to bb.utils.filter() as a whole. Unless your point=20
is about the space in ' usrmerge'.

> After the change, it reads like: filter usrmerge from DISTRO_FEATRUES t=
o=20
> ERROR_QA.
> By doing this, you're connecting these two variables (DISTRO_FEATURES &=
=20
> ERROR_QA) conceptually.

I'm not sure I interpret/read this line the same way you do. Once again,=20
unless I misunderstood your point, the way you read bb.utils.filter()=20
applies to every use of such helper.

How different is this ERROR_QA case from the other occurences of=20
bb.utils.filter() in my patch (i.e., in the *.bb), or even in oe-core?

> And the leading space is also a tiny problem.

After Quentin's comment, I double-checked and ERROR_QA is not handled in=20
the same way as TUNE_CCARGS_MFPU, so the extra leading space should be=20
fine. I agree, however, that it's not very nice to add it unconditionally=
.

One more thing: could you please clarify what you mean by "two different=20
things"? I'm not sure to follow, even with the example. The use case is=20
still one and only: check if the string is in the variable, and if so,=20
return it.

> Regards,
> Qi

Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

