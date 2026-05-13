Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F19CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:47:19 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2352.1778658428077762397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 00:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=CHviFEdL;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1CA8DC5DC43
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:47:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2D14606CE;
	Wed, 13 May 2026 07:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1838511AF874F;
	Wed, 13 May 2026 09:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778658425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nYJ6DY7SYpnisI6jykHxu5yw/bSOJBa6/WAQfFSREII=;
	b=CHviFEdLCNae7cI/TsvlJ6BKi4LNW4XGU4GT6gBiM+n85MmM0QVw1m569pzCmp7SP8GABz
	vyoEt8CWsRYQEUY70NkZztq4VNZilH8JN/b7cGm+FsnEqoQmTVagW2muU/TpsgpNDERfZZ
	/xc4rv1O4khkrWITDwI9vw0jhFgRMvtap2DKSZXur4kQUgI4a8gaQDzHQoX9dqdjsJZ7FO
	JMyH7x4wGb61042CnhqkJazIeUAJ/sUUJAf5DrJK81l6V5eI8Wyt6hR930Yt7rgtnNAYi6
	sJOQHo1bXJMWdTcs3Q/V0wAWS2SFtsgYsT4CBTlt8IHFbAi4cuV2YKXILtmO0w==
Message-ID: <238b271a-30c9-4070-993c-3749375fe5a0@bootlin.com>
Date: Wed, 13 May 2026 09:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, benjamin.robin@bootlin.com
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
 <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
 <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236938

Hello Joshua,

On 13/05/2026 00:27, Joshua Watt wrote:
> On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribes =
via
> lists.openembedded.org
> <jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
>>
>> Add support for optional zstd compression for all types of SBOMs,
>> including:
>>    - image SBOM
>>    - recipe SBOM
>>    - SDK SBOM
>>
>> Zstd compression is applied if SPDX_SBOM_EXT ends with ".zst".
>>
>> Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bo=
otlin.com>
>> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jer=
emie.dautheribes@bootlin.com>
>> ---
>>   meta/classes/create-spdx-3.0.bbclass |  3 ++-
>>   meta/lib/oe/sbom30.py                | 11 +++++++++--
>>   2 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/creat=
e-spdx-3.0.bbclass
>> index 785edb9865..6cf8fa4688 100644
>> --- a/meta/classes/create-spdx-3.0.bbclass
>> +++ b/meta/classes/create-spdx-3.0.bbclass
>> @@ -75,7 +75,8 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base vari=
able that describes how to \
>>               SPDX 3 spec. Optional but recommended"
>>
>>   SPDX_SBOM_EXT ??=3D ".spdx.json"
>> -SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
>> +SPDX_SBOM_EXT[doc] =3D "SBOM file extension name.\
>> +    If it ends with '.zst', SBOMs are automatically compressed using =
Zstd."
>>
>>   # Agents
>>   #   Bitbake variables can be used to describe an SPDX Agent that may=
 be used
>> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
>> index 0f1f9281ad..2184c1a07f 100644
>> --- a/meta/lib/oe/sbom30.py
>> +++ b/meta/lib/oe/sbom30.py
>> @@ -1036,8 +1036,15 @@ def write_jsonld_doc(d, objset, dest):
>>           serializer =3D oe.spdx30.JSONLDInlineSerializer()
>>
>>       objset.objects.add(objset.doc)
>> -    with dest.open("wb") as f:
>> -        serializer.write(objset, f, force_at_graph=3DTrue)
>> +
>> +    if dest.name.endswith(".zst"):
>=20
> I'm not sure I like this detection mechanism; I think we usually do
> something more explicit for compression rather than relying on the
> suffix in other places?

Maybe we should then introduce a SPDX_COMPRESSED_SBOM boolean variable,
which would be used by SPDX_SBOM_EXT_SUFFIX to determine whether ".zst"
is appended to the SBOM file name or not. Then, we could check in the
`write_jsonld_doc` function whether compression is enabled based on this
SPDX_COMPRESSED_SBOM variable.

What do you think? Do you have any other suggestions?

Best regards,
--=20
J=C3=A9r=C3=A9mie Dautheribes, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


