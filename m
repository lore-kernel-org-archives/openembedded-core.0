Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C72C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 23:02:42 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.312.1737759754422289768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 15:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=aNyRgHa8;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE2001047DC0A;
	Sat, 25 Jan 2025 00:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737759751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb/XTtyc8deT1lMw3AMikFX+yAbkFMG/YUUwRDGQeYo=;
	b=aNyRgHa8uKNKoXLRZMLQyoy7RSHOrHaSJ48ETM2JpU3FCdzl+01vaOgvD56SdIBnhh5qxe
	IDXJH4pTro58uI23shokEV5fuLu0fnwwavazqh2hrsR+HGO/pD2M+Tjsos/WQHlqOTEKqX
	E4fl9cgBhXsdX75krVhjVN52ybScR2fDKMFSBvYqjXtfreJdTct6rGszPmygGegpAPi/Uk
	iRl6xOFs5ehhwWVf1MyqjMwwLQ9JMjgkYbIENW8tWwRMcpIivOITVBssbDxVXduGhrFLx8
	mrMPYcIAiMI2SODz9TI2zwWvhjjMI1m8g7M7yoEIg9OgYdDt0dy6pDXOtwGwEw==
Message-ID: <ec4f386d-7d5e-4354-960f-490101a3d093@denx.de>
Date: Fri, 24 Jan 2025 20:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: Mark Hatle <mark.hatle@kernel.crashing.org>, alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250123201229.182266-1-marex@denx.de>
 <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
 <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de>
 <CANNYZj8XgBiaa9aqRPmETXzFgn1v-oeqN2-1zqugDAK6xuyYxQ@mail.gmail.com>
 <7adc6819-4e38-4dd0-b8fd-c80ed9f61d1c@kernel.crashing.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <7adc6819-4e38-4dd0-b8fd-c80ed9f61d1c@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 23:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210255

On 1/24/25 6:55 PM, Mark Hatle wrote:
>=20
>=20
> On 1/24/25 10:39 AM, Alexander Kanavin via lists.openembedded.org wrote=
:
>> I wonder if we can just drop /etc/shells altogether from base-files?
>=20
> /etc/shells is used by pam as one of it's multiple validation steps.=C2=
=A0 If=20
> the shell is not listed there then remote login can be denied.=C2=A0 So=
 the=20
> existence of /etc/shells is definitely required.=C2=A0 The file doesn't=
 need=20
> to come from base-files (but usually should).
>=20
> With that said, "something" needs to provide /bin/sh.=C2=A0 Just droppi=
ng /=20
> bin/sh from a shell, by itself, it's the right answer as there are=20
> ABSOLUTELY systems out there where '/bin/bash' _is_ the only shell=20
> installed on the system.
>=20
> Just like we have busybox only systems providing /bin/sh...
>=20
> or dash based systems where it is the only thing providing /bin/sh...
>=20
>=20
> I'm more inclined to say that base-files depending on /bin/sh is the=20
> error. AFAIK nothing in base-files should require /bin/sh (or are there=
=20
> post-install scripts?).

There is a pre-install script:

$ git grep bin.sh meta/recipes-core/base-files/base-files_3.0.14.bb
meta/recipes-core/base-files/base-files_3.0.14.bb:    #!/bin/sh -e
..
     #!/bin/sh -e
     if [ x"$D" =3D "x" ]; then
         if [ -h "/var/lock" ]; then
             # Remove the symbolic link
             rm -f /var/lock
         fi

         if [ -h "/run" ]; then
             # Remove the symbolic link
             rm -f /run
         fi
     fi
..

> Once that is resolved, then various POSIX /=20
> bin/sh providers can each provide it -- using update-alternatives to=20
> have the 'best' matching providing the right /bin/sh link.=C2=A0 (This =
is why=20
> update-alternatives [in the past at least] run directly and didn't=20
> require a shell to execute.=C2=A0 I don't know that we have the ability=
 to do=20
> this with our multi-package support approach though.)
>=20
> So essential install order may be something like:
>=20
> base-files
> libc (libraries only)
> update-alternatives
> <a shell>
>  =C2=A0- shell calls update-alternatives to register it as /bin/sh, as =
well=20
> as add this as a valid shell to /etc/shells.
>=20
> End result (for bash)
>=20
> /bin/sh -> /bin/bash
>=20
> /etc/shell contains:
>  =C2=A0 /bin/sh
>  =C2=A0 /bin/bash
>=20
> (Note, circular dependencies for some base components have been=20
> considered normal in the workstation world.=C2=A0 They work around this=
 by=20
> use the 'install' to temporarily provide the /bin/sh and some other=20
> resources until they can be installed into the chroot.=C2=A0=C2=A0 This=
 really=20
> isn't anything different from what we're doing, we expect some host-=20
> system (native) items to be available in order to populate the image.)
[...]

