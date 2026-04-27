Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0197BFF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 11:02:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42744.1777287725037896874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 04:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=lV47IXTS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3B94B1A3440
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 11:02:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 132C2600D1;
	Mon, 27 Apr 2026 11:02:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11A5B1072807C;
	Mon, 27 Apr 2026 13:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777287722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RglKxhAPH5Rv46pQNNsLSJdQwjBvXHw1gJeadvgd6qU=;
	b=lV47IXTStkyWulg+a53XeqpdUw7TDuTSUZ4FVz8txd0obCtkw1NgzNaMs6u2SYKzzGd9eB
	FqOEeyPbhbpKmvOMImi7RZpbFthRvaQKQLjWo/qx6YsU29pyapHG/Fsgi1o9N/tUZpATjl
	qu2Gs4UZfV3+zSrBmMIy+CETUdswlmE+rBwNKnhFtHwhHG0wazNDencmEEn0km5kJX3p8o
	PEspUrOgBlPILuopnPuRaimsGz4Vsp036aNmQUJuqkWEsSOrt0PRF1xytHCuD44ssIU/Z/
	Vb/hciZesFEInqXZgQHTtWrne/IMSkj2n7h4YfQojV70Jvvi+jzx1H8QEK4p6Q==
Message-ID: <290b6b60-068a-44f8-b82f-bcc8b38b91e0@bootlin.com>
Date: Mon, 27 Apr 2026 13:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@cherry.de>
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
 <25ab1432-5860-4985-8827-e1a672f66a9a@windriver.com>
 <fa2f6061-1c36-484c-9f7b-00691d9bf7fb@bootlin.com>
 <66648f7c-755a-4aa1-a6cd-2900c91cbec9@windriver.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <66648f7c-755a-4aa1-a6cd-2900c91cbec9@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 11:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236006

Hello,

(...)

>=20
> VAR_1 =3D bb.utils.filter(VAR_2, ....)
>=20
> When you do this, this gives people an impression that VAR1 and VAR2 ar=
e=20
> conceptually related.
>=20
> For example, PACKAGECONFIG & DISTRO_FEATURES both control the way=20
> recipes are built, they are switches for recipes, and they are related.=
=20
> Many PACKAEGECONFIG items' names are selected to be the same with=20
> DISTRO_FEAETURES, e.g., pam, acl., because they are the most reasonable=
=20
> names.

I see what you mean now, thanks!

> But if you look at ERROR_QA, the items names really have no relations=20
> with DISTRO_FEATURES. The usrmerge QA check was actually checking=20
> filesystem hierarchy. If we consider the possible sbin -> bin merge in=20
> the future, the QA check name should be something like=20
> "filesystem-hierarchy-check".

Indeed.

>=20
> To be clear, I'm not against *all* parts of this patch. For example, yo=
u=20
> have:
>=20
>  =C2=A0PACKAGECONFIG ?=3D "\
> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', =
'selinux', '',=20
> d)} \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)=
} \
>  =C2=A0"
>=20
> And I think it's a correct change.
>=20
> I think the problematic ones are ERROR_QA and RDEPENDS.

Well, PACKAGECONFIG is also related to runtime, not only build-time.=20
What I mean is you can specify additional runtime dependencies in the=20
PACKAGECONFIG declaration/definition [1], so one could argue that=20
RDEPENDS and PACKAGECONFIG are not so conceptually distant as the=20
ERROR_QA and DISTRO_FEATURES example.

> Regards,
> Qi

Thanks for the review, and for the clarification as well.

[1]=20
https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFI=
G
--=20
Best regards,
Jo=C3=A3o Marcos Costa

