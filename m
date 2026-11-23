Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52892.1795438138286596825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 04:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=AMoDbn4+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0141A4E41634
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:48:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAABC601E1;
	Mon, 23 Nov 2026 12:48:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7422011E68F49;
	Mon, 23 Nov 2026 13:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438135; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f21HwshSBQTqKfUqPLLLg2ZTy/hUa2wmY5eTR9HP5Og=;
	b=AMoDbn4+PawlWv1C77oxvjOb7G+ANFah4vSf2121ZCni1tBPlxS2pdSa+HvuLdxglav5yy
	tny25YUpUKrIEvzVGmoB46q8/y7I7dOxg9L+NymZ9pFH7L+yhTvjgBSzkHx2og0G/Ggn7a
	x3OZRFN75XVylBEdoI92dAgkhdS2yszWZrnCHTKRZO7ZMnVBQSVTPfrw/4Fe/EtTfu7qcv
	WuTJiqeKNUiP0untTDnLMteTJkwVfkJBxF5YWijJyVfHQaU6DkCSSHKjaWiwbnqDv6N2eT
	LchVYS/3JpwNiC0N2H+Gm1/iUsOgDm+jmlbJBQbFO3akUXKwY3J15I9V+GHQ5g==
Message-ID: <26a1abae-94e5-4a17-ae9b-127a4ad0b924@bootlin.com>
Date: Mon, 23 Nov 2026 13:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][wrynose][PATCH 3/3] expat: fix CVE-2026-118370
To: Yoann Congal <yoann.congal@smile.fr>, dkelaiya@cisco.com,
 openembedded-core@lists.openembedded.org
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
 <20261105091719.1622520-3-dkelaiya@cisco.com>
 <DN2K9NVN0739.1ZT0ITGNS0QQG@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DN2K9NVN0739.1ZT0ITGNS0QQG@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250911

Hello, all

On 11/23/26 12:41 PM, Yoann Congal wrote:
> On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E INFO=
CHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>
>> Backport the upstream prefix and attribute-index fixes [1,2]
>> identified by the release announcement [3]. Use size_t for storeAtts
>> bookkeeping and reject values that cannot be represented by the
>> existing public int attribute-count interfaces.
>>
>> Include the related tokenizer-count correction [4] so XmlGetAttributes
>> and getAtts do not overflow a signed count or narrow the available
>> attribute capacity before the storeAtts checks. This closes the same
>> large-attribute data path; it corrects a pre-existing issue rather tha=
n
>> a regression introduced by the first two fixes. Preserve Expat 2.8.3's
>> PTRCALL annotations on the tokenizer callback and implementation.
>>
>> Validated with the full native unit suite, inline undefined-behavior
>> traps and an arithmetic boundary model. A multi-gigabyte attribute
>> payload and BitBake were not run.
>>
>> [1] https://github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86b=
c91d6ddb048481c04c
>> [2] https://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860=
f39501c7979f6750ae
>> [3] https://www.openwall.com/lists/oss-security/2026/11/02/6
>> [4] https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2=
f46280d5982f50f2cf
>>
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
(...)

While I'm not familiar with expat's sources, I get the point of=20
backporting this extra commit to make sure that getAtts and setAtts will=20
"agree" upon using the same size_t type.

I don't see, however, any clear statements (e.g., from libexpat=20
maintainers, NVD, Debian's security tracker, Debian's bug tracker) that=20
this 3rd patch is directly related to PR#1450 or to CVE-2026-118370.

>=20
> Hello,
>=20
> If I'm not mistaken, this _p3 never was submitted for master &
> blacksail. Specifically, it was not part of Jo=C3=A3o's patch:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20261118103042=
.1825679-2-joaomarcos.costa@bootlin.com/
> Note that I've taken this patch in my review branch.
>=20
> Please submit this _p3 for master/blacksail so I can take this one here=
.
>=20
> Jo=C3=A3o (CC'd), do we need this for blacksail?
>=20
> Thanks,

@Yoan: as per my comment above, I'm not sure p3 is actually mandatory,=20
and the PR#1463 [1] introducing doesn't mention this CVE or PR#1450 in=20
any way. There's only a 'enhancement' tag (whatever that means), as=20
opposed to 'bug' and 'security' at PR#1450.

To summarize my POV: not mandatory, but nice to have.

That said, will we apply this same reasoning for all the other CVE fix=20
backports, or stick with the directly-related patches only?

Please let me know in case that wasn't clear (or helpful!) enough.

[1] https://github.com/libexpat/libexpat/pull/1463

--=20
Best regards,
Jo=C3=A3o Marcos Costa

