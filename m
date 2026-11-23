Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51305.1795428481217412974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 02:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=P6m4tTF9;
 spf=pass (domain: geanix.com, ip: 79.135.106.105, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795428478; x=1795687678;
	bh=yLu8zDMoLhar0tHzKRJIO6KgBvhibSpl3CsSjsTCQao=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=P6m4tTF9RZvKowVo0wXdHKkGdIaOUbHDRTyaLAwDXTvslu5lA8Hb88YJgYnNncXQE
	 au3y86wr+zFmTBf+4hEVDYDyd9yzui5Ea37avv3Ce4Scuj7yPRWTr/1pCYX5Bfnsna
	 eQk/8+sKVDRcJb0HEzLeQTxDPg7AVNzQLr+IDM2UpVxGWEp3slem2zWPLxXUR5IvnK
	 Mz66osYGebi2hL1oClVZnkVDI/b1gBGEFpFQzuh6oaQYwpF7DSragUFEeTPwf60O3b
	 VW8VWs2slNAicFUfLGXAa3bhJOyASxygNVc7CjuYHsDiugzPwSHK/SacnOL93bwvCy
	 yQNrHSr3PYW9Q==
Date: Mon, 23 Nov 2026 10:07:49 +0000
To: =?utf-8?Q?J=C3=B6rg_Vehlow?= <joerg.vehlow@emlix.com>, peter.kjellerstedt@axis.com, alex.kanavin@gmail.com
From: Sean Nyekjaer <sean@geanix.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
Message-ID: <18990849-B4AB-4C55-A1E9-31602F973614@geanix.com>
In-Reply-To: <7d835c61-abbc-49b8-82b0-6e1ea9a67f6b@emlix.com>
References: <20261117120155.3986876-1-sean@geanix.com> <20261117120155.3986876-3-sean@geanix.com> <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com> <8E72F94E-03F6-432E-B1AB-C4B7B42FD4A3@geanix.com> <DB5PR02MB10213B63F5917CAD5A8070AB4EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com> <46D00DCD-2239-4A77-B776-EC59838FD31E@geanix.com> <7d835c61-abbc-49b8-82b0-6e1ea9a67f6b@emlix.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 8d9a58cccef561e31ef7461ca1458f6dff81c03c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 10:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250895



> On 18 Nov 2026, at 08.25, J=C3=B6rg Vehlow <joerg.vehlow@emlix.com> wrote=
:
>=20
>=20
>=20
> On 18.11.2026 08:05, Sean Nyekjaer via openembedded-core wrote:
>>=20
>>=20
>>> On 17 Nov 2026, at 16.09, Peter Kjellerstedt <peter.kjellerstedt@axis.c=
om> wrote:
>>>=20
>>> The way we solved the above when the license check for the SDK was intr=
oduced
>>> was to add explicit exceptions for the nativesdk packages, e.g.:
>>>=20
>>> AXIS_SDK_LICENSE_EXCEPTIONS +=3D " \
>>>    binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>>>    elfutils-dev:GPL-3.0-or-later \
>>>    gawk:GPL-3.0-or-later \
>>>    gawk-dev:AGPL-3.0-or-later \
>>>    gawk-dev:GPL-3.0-or-later \
>>>    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>>>    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-or-later \
>>>    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:LGPL-3.0-or-later \
>>>    gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>>>    gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:LGPL-3.0-only \
>>>    ...
>>> "
>>>=20
>>> We put them in a separate variable, which we only add to
>>> INCOMPATIBLE_LICENSE_EXCEPTIONS in the image recipe we use to build our=
 SDK.
>>> That way the exceptions do not affect our normal images, but at the sam=
e
>>> time we have documented every tool and exception so that we can be sure=
 to
>>> comply with their licenses.
>>=20
>> Thanks, that answers my question from [0] :)
>>=20
>> Seems very cumbersome when we don=E2=80=99t really care about licenses i=
n the SDK.Wouldn't the simplest solution be to just disable the check for
> populate_sdk, if you do not want it?
> Using:
> INCOMPATIBLE_LICENSE:task-populate-sdk =3D ""

Hi Joerg,

That seems to do what I=E2=80=99m after, cool :)

Should we add a note in the documentation?

/Sean



