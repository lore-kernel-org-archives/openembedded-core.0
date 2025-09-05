Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240ECCA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 13:15:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.21739.1757078147157956044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 06:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HDQgdTbL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 717C64E40BA2;
	Fri,  5 Sep 2025 13:15:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44DBE6060B;
	Fri,  5 Sep 2025 13:15:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAF93102F286C;
	Fri,  5 Sep 2025 15:15:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757078144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X+LtAx/JaDxD+D4jBI2MZL/vNuysVwHaEZy7aEDm/O4=;
	b=HDQgdTbLzmdjhiMvdulQobSrf2tZW4IJxj1Q98uo361I4ZEvz944ib9SPESt6nDsuqsTPa
	X6RDrVH8Y2rs38C3JYoX9O/zLKDnEmqYg6z/Tb/cx6O7Q/ChIkvVd9DxLQhYDReFnq04q6
	YTSBHbhBQL9edWitKnBfqUuuokFpgJHK8h6iWvp+Wg21pSd/Xn6okaAXQ5jogbK9Avty6J
	/Goa+y7vDrdPGVMmsrIipAkZLbAw0KHQpK+11BgWCJRuGTK8Q4UnuSwZDg0GEkwc2jcsY3
	FoaTinthVjV8fznpl0Sj1IDoZGUbe1tS+bieu6Kl5F/ksqmcQUyNi6N6tq8YSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 15:15:33 +0200
Message-Id: <DCKW7R98LZAP.19SKBT6URU40X@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC
 policy when using the 'pni-names' DISTRO_FEATURE
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>, "Peter Marko"
 <peter.marko@siemens.com>, "Jose Quaresma" <jose.quaresma@oss.qualcomm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <koen.kooi@oss.qualcomm.com>, "Ross Burton" <ross.burton@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
 <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
 <18626142A7130E51.28137@lists.openembedded.org>
 <D98DABEC-9D8B-4D6A-ADB8-EABFAADAA502@oss.qualcomm.com>
In-Reply-To: <D98DABEC-9D8B-4D6A-ADB8-EABFAADAA502@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 13:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223003

On Fri Sep 5, 2025 at 3:09 PM CEST, Koen Kooi via lists.openembedded.org wr=
ote:
>
>
>> Op 5 sep 2025, om 14:02 heeft Koen Kooi via lists.openembedded.org <koen=
.kooi=3Doss.qualcomm.com@lists.openembedded.org> het volgende geschreven:
>>=20
>>=20
>>=20
>>> Op 5 sep 2025, om 11:09 heeft Ross Burton <ross.burton@arm.com> het vol=
gende geschreven:
>>>=20
>>> On 5 Sep 2025, at 09:33, Antonin Godard <antonin.godard@bootlin.com> wr=
ote:
>>>>> + if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', 'pni-names'=
, 'true', 'false', d) else 'false'}; then
>>>>=20
>>>> This could be simplified to=20
>>>>=20
>>>> if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'false', 'true',=
 d)}; then
>>>>=20
>>>> no?
>>>=20
>>> I dislike contains() calls that return false,true because that subverts=
 expectations,
>>=20
>> Same here, which is why I lifted this variant from an existing OE-core b=
bclass :)=20
>>=20
>>> but this seems like a compromise to me:
>>>=20
>>> if not ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', =E2=80=99true=
', =E2=80=98false', d)}; then
>>=20
>> I can rework it to that. If that works, a v2 will best sent!
>
> So that *technically* works because 'not' is both not a bash builtin nor =
a command installed in the sysroot. This ends up giving us a=20
>
> not: not found=20
>
> in log.do_install. I don't think this is an improvement over the original=
 patch. Thoughts?

It should be=20

if ! ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', =E2=80=99true', =E2=
=80=98false', d)}; then

We mixed up python and shell syntax here :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


