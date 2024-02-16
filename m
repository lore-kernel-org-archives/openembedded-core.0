Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E376FC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 21:11:21 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.9675.1708117873555590146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 13:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=Sd/8kYwL;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A3D31240103
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 22:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708117871; bh=grUqVMPgL0NGX49wSJqMkJORc2/5Al47e5b6gw6O/h4=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=Sd/8kYwLhgO5+flA/49XrTnwbdQ7y+Su/wPnKQ96lJm4tHEhjLlHqlOgpgDFhKblU
	 RcTv0s4wLMrNnANK8nJolTcvptbGfWUiAboe9TjKD+HrOD+Oi9K2S8AG5rJayR1wSS
	 uUK1rfwvU+uHF6+Eh32GzU+xLIHUKEZ/quOGp7F1Lx7pYG8BJwbNyWhPUGfb9AHuqh
	 A/ylaWpeo5EQ4fF3CpHoYQT9iJLMUh7nLhmjh+dspNb2dFZlgNvZ2WB182dlcWLp8C
	 nFSW2GEvFSUvHAQh7FmK2T6f8OlWvmwv+e+Bf7FDwPHmchUX+fvqn89GepvQTKoydd
	 68KBICw8ZSDow==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Tc4NZ5TNwz9rxF;
	Fri, 16 Feb 2024 22:11:10 +0100 (CET)
Message-ID: <833fd8bc41ee867a8cd8b80ea849f57275b0c706.camel@posteo.net>
Subject: Re: [PATCH] patchtest: add stronger indication for failed tests
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: simone.p.weiss@posteo.com, openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2024 21:11:10 +0000
In-Reply-To: <20240216210028.16028-1-simone.p.weiss@posteo.com>
References: <20240216210028.16028-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 21:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195809

Please ignore this, v2 is already sent...

On Fri, 2024-02-16 at 21:00 +0000, simone.p.weiss@posteo.com wrote:
> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>=20
> Do not only log that there has been an issue but add WARNING before for
> local
> runs. Hopefully this helps to avoid that people reading the log to
> quickly miss
> issues.
>=20
> Fixes [YOCTO #15389]
>=20
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>=20
> sfdf
>=20
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
> =C2=A0scripts/patchtest | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/patchtest b/scripts/patchtest
> index d0dc6e8fac..3163420220 100755
> --- a/scripts/patchtest
> +++ b/scripts/patchtest
> @@ -164,9 +164,9 @@ def run(patch, logfile=3DNone):
> =C2=A0=C2=A0=C2=A0=C2=A0 if premerge_result =3D=3D 2 and postmerge_result=
 =3D=3D 2:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error('patchtest:=
 No test cases found - did you specify
> the correct suite directory?')
> =C2=A0=C2=A0=C2=A0=C2=A0 if premerge_result =3D=3D 1 or postmerge_result =
=3D=3D 1:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error('patchtest: At l=
east one patchtest caused a
> failure or an error - please check')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error('WARNING: patcht=
est: At least one patchtest caused
> a failure or an error - please check')
> =C2=A0=C2=A0=C2=A0=C2=A0 else:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error('patchtest: All =
patchtests passed')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error('OK: patchtest: =
All patchtests passed')
> =C2=A0=C2=A0=C2=A0=C2=A0 print('-----------------------------------------=
-------------------
> ----------\n')
> =C2=A0=C2=A0=C2=A0=C2=A0 return premerge_result or postmerge_result
> =C2=A0


