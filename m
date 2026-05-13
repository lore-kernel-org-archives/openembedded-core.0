Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D71CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:04:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2482.1778659439443188790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=XewBMw2o;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4706F4E42C8C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:03:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18816606CE;
	Wed, 13 May 2026 08:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8475C11AF84A7;
	Wed, 13 May 2026 10:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778659436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZJxD3lzghYSxvN/GO1UrDL9ORBWo9EhhdIdGKe1xPMA=;
	b=XewBMw2oAkY5tcEBpgSD8PwA+gQXv5atY/eexLH6Wx52gqOt2bxl1na/H9abp/DWBGRQFM
	MTv9auFFw3Y4/JWkCllBVIyCUYuZ77Wz4VtOzxssXnLQh2XbhKrRORKtfpxUOuSO/txk5P
	r0EKIRmeQYyvfyeIBGVXPD3A1ukEdR7PvF7D9KDRCjb0C2e4fH4Mw84cC3ECJr/yqHwpyt
	gdf9iIlv/sJwejj4WZfnYSmv6dwd9m27nZ/eY+PZu4QjkeiJfIqCH0LA7RIi0rmruGRA5x
	vKhXBaW/kZVY5GTSinnWCE6jH0H+lSAARkH89L3tuWU1X1sh3Kbgq8E5mNkANg==
Message-ID: <b227586e-0d54-4134-bf93-1a6d717b9cf5@bootlin.com>
Date: Wed, 13 May 2026 10:03:54 +0200
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
 <18AF106AF6BDC73B.3227972@lists.openembedded.org>
Content-Language: en-US, fr
From: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>
Organization: Bootlin
In-Reply-To: <18AF106AF6BDC73B.3227972@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236941

On 13/05/2026 09:47, J=C3=A9r=C3=A9mie Dautheribes via lists.openembedded=
.org wrote:
> Hello Joshua,
>=20
> On 13/05/2026 00:27, Joshua Watt wrote:
>> On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribes=
 via
>> lists.openembedded.org
>> <jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
>>>
>>> Add support for optional zstd compression for all types of SBOMs,
>>> including:
>>> =C2=A0=C2=A0 - image SBOM
>>> =C2=A0=C2=A0 - recipe SBOM
>>> =C2=A0=C2=A0 - SDK SBOM
>>>
>>> Zstd compression is applied if SPDX_SBOM_EXT ends with ".zst".
>>>
>>> Co-authored-by: Benjamin Robin (Schneider Electric)=20
>>> <benjamin.robin@bootlin.com>
>>> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric)=20
>>> <jeremie.dautheribes@bootlin.com>
>>> ---
>>> =C2=A0 meta/classes/create-spdx-3.0.bbclass |=C2=A0 3 ++-
>>> =C2=A0 meta/lib/oe/sbom30.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++--
>>> =C2=A0 2 files changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/=20
>>> create-spdx-3.0.bbclass
>>> index 785edb9865..6cf8fa4688 100644
>>> --- a/meta/classes/create-spdx-3.0.bbclass
>>> +++ b/meta/classes/create-spdx-3.0.bbclass
>>> @@ -75,7 +75,8 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base=20
>>> variable that describes how to \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 SPDX 3 spec. Optional but recommended"
>>>
>>> =C2=A0 SPDX_SBOM_EXT ??=3D ".spdx.json"
>>> -SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
>>> +SPDX_SBOM_EXT[doc] =3D "SBOM file extension name.\
>>> +=C2=A0=C2=A0=C2=A0 If it ends with '.zst', SBOMs are automatically c=
ompressed using=20
>>> Zstd."
>>>
>>> =C2=A0 # Agents
>>> =C2=A0 #=C2=A0=C2=A0 Bitbake variables can be used to describe an SPD=
X Agent that=20
>>> may be used
>>> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
>>> index 0f1f9281ad..2184c1a07f 100644
>>> --- a/meta/lib/oe/sbom30.py
>>> +++ b/meta/lib/oe/sbom30.py
>>> @@ -1036,8 +1036,15 @@ def write_jsonld_doc(d, objset, dest):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 serializer =3D=
 oe.spdx30.JSONLDInlineSerializer()
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 objset.objects.add(objset.doc)
>>> -=C2=A0=C2=A0=C2=A0 with dest.open("wb") as f:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 serializer.write(objset, =
f, force_at_graph=3DTrue)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if dest.name.endswith(".zst"):
>>
>> I'm not sure I like this detection mechanism; I think we usually do
>> something more explicit for compression rather than relying on the
>> suffix in other places?
>=20
> Maybe we should then introduce a SPDX_COMPRESSED_SBOM boolean variable,
> which would be used by SPDX_SBOM_EXT_SUFFIX to determine whether ".zst"
> is appended to the SBOM file name or not. Then, we could check in the
> `write_jsonld_doc` function whether compression is enabled based on thi=
s
> SPDX_COMPRESSED_SBOM variable.
>=20

After further thought, that solution would not work well since
`write_jsonld_doc` is not only used for SBOM generation.

--=20
J=C3=A9r=C3=A9mie Dautheribes, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


