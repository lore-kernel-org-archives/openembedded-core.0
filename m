Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703E0C021B5
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 00:23:49 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.37817.1740183826520585562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 16:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=gqq7EZlq;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 209B510382D3C;
	Sat, 22 Feb 2025 01:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740183824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hk2CLva9AY2SvOil+j0NFCsg5UBlfgJlFa4dscpqU4=;
	b=gqq7EZlqGSCPa9/SED+AvMoogZ/yA4GdQdmLplJPjtTGOaLT0fBlsyCCyJtIxjc2o64g02
	PAO0aHL+SrjTN5SnjMmTy19KQztDcMZhPOKfpBEsPGR0J8hgfGeWSqwAKqoYlrTlPx5oe5
	jwc2P+qlpLm0o59rwCWaUHHE45lPMnFkSUdiGzyHl1pQ4wDF/QFMzXkzp9uv3TgCo/Ri56
	Z+0ix82jD0ZIemq3kYuLRZwswkhhoDmxFxvMcnmbCqOrbzeNy5WAvCjojlIWME5JvP55Sj
	WmHCuu1FAukWOW35HA1bjqz4ASLreIDTq1Wiowmeuwd77GgMqsYu+jn543u2KQ==
Message-ID: <b8245bb4-7fa0-4156-8062-5c97212a675f@denx.de>
Date: Sat, 22 Feb 2025 01:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: Adrian Freihofer <adrian.freihofer@gmail.com>, rogerio.borin@toradex.com,
 Sean Anderson <seanga2@gmail.com>, Quentin Schulz
 <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
 <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
 <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
 <3341efe1-1515-4549-97ac-d3a82f71f16b@denx.de>
 <f5807fe9-d460-8f69-c480-84396db1fee8@gmail.com>
 <da99bdf6-49d6-4efa-861b-9277f01e0588@toradex.com>
 <ff5d5da647878d6f50afa30f80ed068c50453f5b.camel@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ff5d5da647878d6f50afa30f80ed068c50453f5b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 00:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211816

On 2/21/25 3:45 PM, Adrian Freihofer wrote:

[...]

>> Having said all of that, notice that if the decision was really to
>> switch to interpretation (1) then other changes would be required
>> besides those made to concat_dtb(). In particular, I imagine
>> fitimage_emit_section_config() would require changes to avoid
>> emitting
>> the signature node for the configurations.
>>
>> Hope this clarifies things...
> 
> Yes, from my point of view that is the case. I came to exactly the same
> conclusion. The use of FIT_SIGN_INDIVIDUAL is strange, but not wrong.
> It means that it's definitely not something that can be changed on an
> LTS branch. Although I really like Marek's patch, we need to revert
> that part of it.

That would break the use of signed fitImages with embedded env script, 
which does not work either.

I've posted the following patch instead, you should all be on CC:

[PATCH] u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1" behavior

