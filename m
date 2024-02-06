Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC9AC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 13:23:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.21202.1707225784333993705
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 05:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HfJdTzmV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBB56C0004;
	Tue,  6 Feb 2024 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707225782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7tlutbUKxY2OkcQ/8KXT3aqM0KG7icczi0twWKVcyU=;
	b=HfJdTzmVw5jR1G0l5uIdhV+J1jb/ot/88BQBav2Wi8AVCahce5fojrdVzVrvzEX9Wv71M0
	5/yTjgLNs2Nl3TENz/5k9uD3tsDFYtLZUN+XLbg+OpzQ2u6jKIS89knbommt7S+2DZQu8U
	WfswMYp0KU3w48sxe9ExljaJ8ceMvLOHjz8dL8SXwuZmkQ0suYnUjOVEfpDjip7JtplAx9
	mmX45uf6CLooFjXU2Qk9242ScCUdlb60j+HJaUxS627jrDPzvmTU/0z7zmF7P4mCUugjVD
	tPZ57RiWhAXAP+Eh5qp6jqUhXswIAL5YApAmP0ERiWb8r6/L3wG9pepOTNdM7g==
Message-ID: <349bf837-7540-4aa0-878f-cdbfe2b3c0b8@bootlin.com>
Date: Tue, 6 Feb 2024 14:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v3 1/2] testimage: move
 TESTIMAGE_FAILED_QA_ARTIFACTS default to core-image
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20240205143757.81826-1-alexis.lothore@bootlin.com>
 <20240205143757.81826-2-alexis.lothore@bootlin.com>
 <5358961809135d87d89ec9004c7f4bc164c82fe2.camel@linuxfoundation.org>
 <93350237-c4ea-4859-93fa-113a3ccc0452@bootlin.com>
 <d20952f5-2240-448b-a803-00dcc7b65575@bootlin.com>
 <cbd17e6e8b5777ab7f926dc2af99468541f803bd.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <cbd17e6e8b5777ab7f926dc2af99468541f803bd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 13:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194992

On 2/6/24 13:00, Richard Purdie wrote:
> On Tue, 2024-02-06 at 12:09 +0100, Alexis Lothoré wrote:
>> So I've did multiple attempts to make this work, and I see no way to define the
>> default value in testimage.bbclass with "=", and add content to it in
>> core-image-ptest.bbwith "+=". My understanding is that testimage is always
>> parsed after core-image-ptest.bb, so there is no nice way to set its default
>> value in there:
>> - "=" will always overwrite ptests artifacts set with "+="
>> - "?=" or "??=" will always be overwritten by ptests artifacts set with "+="
>> My configuration relies on IMAGE_CLASSES += 'testimage', which is also done in CI.
> 
> The issue is this:
> 
> classes-recipe/image.bbclass:inherit_defer ${IMGCLASSES}
>
> since this is deferred to after the recipe is parsed.

Ah, thank you for the explanation, I was not aware of this defer mechanism.

>> Still, I understand your concern about keeping default value in
>> testimage.bbclass. The only compromise I see here to both keep the default value
>> in testimage and be able to override it at user level is not to enrich it in
>> core-image-ptest but to redefine it:
>>
>> diff --git a/meta/recipes-core/images/core-image-ptest.bb
>> b/meta/recipes-core/images/core-image-ptest.bb
>> index fb96c542c0a3..4a90181afd83 100644
>> --- a/meta/recipes-core/images/core-image-ptest.bb
>> +++ b/meta/recipes-core/images/core-image-ptest.bb
>> @@ -43,5 +43,8 @@ python () {
>>          raise bb.parse.SkipRecipe("No class extension set")
>>  }
>>
>> -# Include ptest directory in artifacts to retrieve if there is a failed test
>> -TESTIMAGE_FAILED_QA_ARTIFACTS += "${libdir}/${MCNAME}/ptest"
>> +TESTIMAGE_FAILED_QA_ARTIFACTS = "\
>> +    ${localstatedir}/log \
>> +    ${sysconfdir}/version \
>> +    ${sysconfdir}/os-release \
>> +    ${libdir}/${MCNAME}/ptest"
>>
>> That's for example what is done with TEST_SUITES. In this setup, we can keep a
>> default value in testimage, and override it as needed with append/prepend/remove
>> syntax at user level.
>>
>> I'll wait a bit in case there's any comment or concern about this approach, and
>> then send a new version.
> 
> I see two options:
> 
> a) Make testimage.bbclass a +=
> 
> or
> 
> b) Put the new entry into testimage.bbclass even if it is ptest
> specific.
> 
> 
> I'm leaning to doing both, make it a += and just put it there by
> default in case someone includes ptests in a non ptest image.

Ok, sounds good to me too and ptests artifact retrieval seems to behave properly
even when defined in testimage. I'll submit a new version which keeps the
default artifact list in testimage, and adds immediately ptests artifacts to it.

Thanks for the guidance :)

Alexis

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


