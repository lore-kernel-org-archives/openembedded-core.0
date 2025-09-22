Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB28CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:06:17 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.web11.46718.1758528367601166965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 058E85F87F;
	Mon, 22 Sep 2025 10:06:05 +0200 (CEST)
Message-ID: <ca7c6bc4f4f80fb260758915c379385fca211419.camel@emlix.com>
Subject: Re: [OE-core] [PATCH] os-release: do not add empty parentheses to
 VERSION
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Date: Mon, 22 Sep 2025 10:06:04 +0200
In-Reply-To: <DB5PR02MB10213CC660236ED26287025A1EF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250912161917.844344-2-dwagenknecht@emlix.com>
	 <DB5PR02MB10213CC660236ED26287025A1EF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 08:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223810

Hello Peter,

thanks for the Review!

On Sat, 2025-09-13 at 10:28 +0000, Peter Kjellerstedt wrote:
>=20
> VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if
> (d.getVar('DISTRO_CODENAME') or '') !=3D '' else ''}"

you are correct, I'll send a v2.

> One thing I do not understand, and this is mostly a question for RP,=20
> is how the first DISTRO_CODENAME is actually expanded in the above=20
> definition.
> [...]
> Or are all variables in d somehow available as Python variables=20
> inside ${@...}?=20

This is indeed very interesting. I tried to trace the variable
expansion code in bitbake/lib/bb/data_smart.py and found this commit
from 2010:
https://git.openembedded.org/bitbake/commit/?id=3D606fa1fd97cbd47a6a7ebdc7a=
2e6aa93a8f65cf5

> Access metadata vars as locals in python snippets
>
> Example:
> FOO =3D "bar"
> BAR =3D "${@FOO + '/baz'}"
>
> ${BAR} =3D=3D "bar/baz"

So `${@VARNAME}` expanding the vars in inline python expressions seems
to be intended but undocumented and mostly unused behaviour.

Sincerely
Daniel Wagenknecht


