Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC1CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:35:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2232.1778657718192789817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 00:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mmu5SeZp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 84556C5E175
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:36:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B938606CE;
	Wed, 13 May 2026 07:35:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5617F11AF8CC8;
	Wed, 13 May 2026 09:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778657715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ybxbocZCEKDQKV/VWKWkn05mZzrdT4eJx+dk1NLffbY=;
	b=mmu5SeZpFL2IzCB47cmM4cY/nml5XDBYCTxEf+itsI6iHGsS6lFn8jYEWGcPxFrTvbu2yd
	DVqjWd8yvIiRX5a7guKI87OKc3kmOxAtotmAMeEY40EuEXolslFad5+rPig1zWOd6s9FoK
	54LzrJAkdD0jX+hCoKSqKAYFvFY7gCPFaGERFAqm+r7IDGxKXxhOjFWY3pqOvwpQ8o4EXb
	1+CbevP0uMksBXUJzWxp7ay2a2kVquu15GEp99xeLXmHDQY0PiyPY9E8pn2Tm55ceyP+GP
	9Iev+DiJGteLoJzOE9a5xE58rNQ+W7w50pR3y50mj2E4ELbZwMouIUY+6Z623g==
Message-ID: <7ed8eec9-07e2-45a0-81ba-a346a6288382@bootlin.com>
Date: Wed, 13 May 2026 09:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
To: Benjamin Robin <benjamin.robin@bootlin.com>,
 Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
 <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
 <CAJdd5GZQpHzwYaqpMQ41JgsZov_C8G_5ireXw1vK=uXRa8QvBA@mail.gmail.com>
 <YJowmpLrQSC3VUoZtQt51Q@bootlin.com>
Content-Language: en-US, fr
From: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>
Organization: Bootlin
In-Reply-To: <YJowmpLrQSC3VUoZtQt51Q@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236937

Hello Joshua, Benjamin,

On 13/05/2026 09:07, Benjamin Robin wrote:
> Hello Joshua,
>=20
> On Wednesday, May 13, 2026 at 12:29=E2=80=AFAM, Joshua Watt wrote:
>> On Tue, May 12, 2026 at 4:27=E2=80=AFPM Joshua Watt <jpewhacker@gmail.=
com> wrote:
>>>
>>> On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribe=
s via
>>> lists.openembedded.org
>>> <jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
>>>>
>>>> Add support for optional zstd compression for all types of SBOMs,
>>>> including:
>>>>    - image SBOM
>>>>    - recipe SBOM
>>>>    - SDK SBOM
>>
>> We should perhaps also implement decompression when reading in
>> documents, so that the intermediate documents are compressed as well;
>> if we are allowing the final documents to be compressed, I don't see a
>> compelling reason why we wouldn't just compress all of them.
>=20
> I am not sure this is a good idea performance-wise, mainly because
> Yocto is currently relying on an external program to compress and
> decompress. We need to wait for Python 3.14 to be the minimum required
> Python version to be able to use the native implementation of zstd.
> Indeed intermediate documents are pretty "small".
>=20
> Also with SPDX2, intermediate documents were not compressed.
>=20
> The goal is not to reduce the size of the build directory, but only
> the size of deployed artifacts.

In addition to what Benjamin already explained, our typical use-case is
storing the deployed SBOMs to an external location (typically a cloud
provider) and we encountered some cases where the uncompressed image=20
SBOM size is ~180 MB.

We could compress them outside of Yocto of course, but we thought it=20
would be great to have this feature directly in Yocto, especially since=20
it was already supported in the SPDX 2.2 implementation.

Best regards,
--=20
J=C3=A9r=C3=A9mie Dautheribes, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


