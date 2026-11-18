Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7716.1794986751442309341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 23:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=P7lieOeh;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1794986748;
	bh=+F4qpQ11T7TaDk5tK2CkXUJg1bGbfSiCR8u6VymRTMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P7lieOehRf8asdHzH4lUN+hBbiPHwiJ8yD7YuISQdJRMqKvRjUeg20Zxq/kyNCsyE
	 NKECXyHV+kt42RO0Oj2uLOdb2ZXMuuKIJsqbEtuOJTu+yzLXUThe8t6R3kB3xYUvN1
	 ZA842bj5epeClesi3y/bd/rPWTbsHlw8InkFn9LWyS5qxtOil7rpqCp6jJ5T6mme5g
	 WGz+yRPJRbFtonmRlLT4Klp8EWoezGrDpcIq0YCB15HvZNdlr0SOvYDAszqxF24MPI
	 rOuvViVK6xNJcP5ckfymQT0PJjQy9Zni24fHirhEHdTDfvY1CUM1OrVj6D37bhVoRx
	 +NUPiEBLr1AHQ==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id CC2735F7E2;
	Wed, 18 Nov 2026 08:25:48 +0100 (CET)
Message-ID: <7d835c61-abbc-49b8-82b0-6e1ea9a67f6b@emlix.com>
Date: Wed, 18 Nov 2026 08:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] license_image: don't apply
 INCOMPATIBLE_LICENSE to SDK host tools
To: sean@geanix.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20261117120155.3986876-1-sean@geanix.com>
 <20261117120155.3986876-3-sean@geanix.com>
 <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <8E72F94E-03F6-432E-B1AB-C4B7B42FD4A3@geanix.com>
 <DB5PR02MB10213B63F5917CAD5A8070AB4EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <46D00DCD-2239-4A77-B776-EC59838FD31E@geanix.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=B6rg_Vehlow?= <joerg.vehlow@emlix.com>
In-Reply-To: <46D00DCD-2239-4A77-B776-EC59838FD31E@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 1.4.3 at mx1.emlix.com
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 07:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250522



On 18.11.2026 08:05, Sean Nyekjaer via openembedded-core wrote:
>=20
>=20
>> On 17 Nov 2026, at 16.09, Peter Kjellerstedt <peter.kjellerstedt@axis.=
com> wrote:
>>
>> The way we solved the above when the license check for the SDK was int=
roduced
>> was to add explicit exceptions for the nativesdk packages, e.g.:
>>
>> AXIS_SDK_LICENSE_EXCEPTIONS +=3D " \
>>     binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>>     elfutils-dev:GPL-3.0-or-later \
>>     gawk:GPL-3.0-or-later \
>>     gawk-dev:AGPL-3.0-or-later \
>>     gawk-dev:GPL-3.0-or-later \
>>     gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>>     gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-or-later \
>>     gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}:LGPL-3.0-or-later \
>>     gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:GPL-3.0-only \
>>     gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}:LGPL-3.0-only \
>>     ...
>> "
>>
>> We put them in a separate variable, which we only add to
>> INCOMPATIBLE_LICENSE_EXCEPTIONS in the image recipe we use to build ou=
r SDK.
>> That way the exceptions do not affect our normal images, but at the sa=
me
>> time we have documented every tool and exception so that we can be sur=
e to
>> comply with their licenses.
>=20
> Thanks, that answers my question from [0] :)
>=20
> Seems very cumbersome when we don=E2=80=99t really care about licenses =
in the SDK.Wouldn't the simplest solution be to just disable the check fo=
r=20
populate_sdk, if you do not want it?
Using:
INCOMPATIBLE_LICENSE:task-populate-sdk =3D ""

Joerg
