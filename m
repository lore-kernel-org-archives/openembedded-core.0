Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0276BCD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:59:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19631.1779191957055909014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 04:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=LvTOce9c;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F27891A3628
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:59:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C01835FFC8;
	Tue, 19 May 2026 11:59:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEE2B107E8E8F;
	Tue, 19 May 2026 13:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779191954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sZ1XKJaU5BVIpjYsonWJIzXb0DiD3lPw5LYYgShUeaA=;
	b=LvTOce9cZoHJHTr6LIIrQwLSPz2jg1kRm1W7UzCZa5qi3gYvoR2hC1pR/BLHHNfUDV+Gi6
	CiJP7fshk5E8mmIhDo96Insd3EJ34owZNRx4ccE7wuEE+wgwgmfRtR/CDcP/rv9S+9OAHY
	NapsSxnOfe8WTZ7jYl5ZZI2mLywW1mLQgBtS1mLQWziqulLgoE7JhBD2m3okuJxtDQetdo
	AHu0hF7NSmvQfN1zfcgicaVsrWkEiT5wkTQueQ9xx05VF6b+Ch6jOy6YVhYSEripGZMwD/
	USbL3mVbDNGU6MY6kSLhnPRVxZGZuYlPpZ5eicl9+qNvhCjnCm7CIx+EcF1Z5Q==
Message-ID: <e8674aa9-a98b-4d39-bc9f-a525516d3c24@bootlin.com>
Date: Tue, 19 May 2026 13:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 dmitry.baryshkov@oss.qualcomm.com,
 Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
 <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com>
 <9dc8c3b7-c358-4a7d-af1a-c1aec83906af@rootcommit.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <9dc8c3b7-c358-4a7d-af1a-c1aec83906af@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237319

Hello, Mike

On 5/18/26 21:40, Michael Opdenacker wrote:
> Greetings,
>=20
> On 5/9/26 12:55 AM, Joao Marcos Costa via lists.openembedded.org wrote:
>> Hello,
>>
>> On 5/8/26 21:09, Dmitry Baryshkov via lists.openembedded.org wrote:
>> (...)
>>>
>>> We are fetching the source basing on the PV. The patch might be
>>> applicable or might not. I'd suggest listing the patch twice: in the
>>> u-boot_2026.04.bb and u-boot-tools_2026.04.bb.
>>>
>>> (in fact I did that in a local patch, it's good that I checked the ML
>>> before sending it).
>>
>> I agree with this approach. Also, even if someone does not like seeing=
=20
>> the same patch applied in two different recipes, the patch was already=
=20
>> merged upstream and should be available in v2026.05 (I hope?). So, in=20
>> any case, we will drop it soon enough.
>=20
>=20
> Any update on this patch?
> Building u-boot-tools on master for the "qemuriscv64" machine is still=20
> broken.
>=20
> For people facing this too, a workaround is the add back=20
> "libyaml-native" to depends in meta/recipes-bsp/u-boot/u-boot-common.in=
c
>=20
> How come the autobuilder didn't catch this issue on one of our=20
> officially supported machines?
> Cheers
> Michael.
>=20

The same patch [1] must be applied to u-boot-tools' sources to fix this,=20
rather than adding back the dependency.

That said, unfortunately I don't know what is the current status of=20
Ricardo's patch, nor how come the autobuilder didn't catch this issue.

[1]=20
meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation=
.patch
--=20
Best regards,
Jo=C3=A3o Marcos Costa

