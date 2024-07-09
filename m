Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD01DC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 08:06:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.7801.1720512366176181331
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 01:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E7XsjGM1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76F13E000A;
	Tue,  9 Jul 2024 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720512363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2nQB71KIPiL6NUqq4OTnOhy190UNk4tCIzu8c0iqS4=;
	b=E7XsjGM1ldx6MKdE8dV/I4eaZ7rTJ1YuTKyMxoL8aRdAAVHcf8kHrUEI9LsbDs9mRhCfM5
	F2Np8/Bof6UsPYAxM8HFEcB1gMe8/9tqJpVoriGQvrqmQpvsggrEE+AIAzJnoVzcg63EX6
	ALgP7ZDF5WgAm9Fy41qkYe3B54ByJpBlHyDgstpDLNo8kFixT98KbIwA9Q4T8oGkTyLxH8
	8TMlAmHtrIeCc1NDbSiKIX0+rG/Hztbxae1ex22ySIclUQskunpF6mwOHfl8AEus0Di4g3
	DAI0dqcTKEZa8nb0r0Ye+gCaIXbXN4tNWKWyAO2jVwEVEZ5lTlniTOmtAVS+cQ==
Message-ID: <3984cea7-5563-4492-9a19-d49f465ad8bd@bootlin.com>
Date: Tue, 9 Jul 2024 10:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] oeqa/utils/postactions: transfer whole
 archive over ssh instead of doing individual copies
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240705144638.441976-1-alexis.lothore@bootlin.com>
 <20240705144638.441976-3-alexis.lothore@bootlin.com>
 <dd50f7eea15a500e7f6334d043b0dfe9c4620675.camel@linuxfoundation.org>
 <e5e4514e-5db0-4d0b-a20a-11e2d786a543@bootlin.com>
 <e9961bfdfdbee4085d010b0ad818a9411e1f130a.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <e9961bfdfdbee4085d010b0ad818a9411e1f130a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 08:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201648

On 7/8/24 23:37, Richard Purdie wrote:
> On Mon, 2024-07-08 at 23:10 +0200, Alexis Lothoré wrote:
>> Hello Richard,

[...]

>> My best guess about those differences is a mismatch on python versions between
>> the autobuilder and my machine. I am running python 3.12, and it appears that it
>> has brought many improvements to python f-strings, especially "quote reuse",
>> which makes python not raise an exception anymore when the expression inside an
>> f-string reuses the same kind of quotes as for the parent f-string (see [1]). I
>> ran a quick test with Python 3.11 instead of 3.12, and I now I see the exception.
> 
> That explains things. I'm very surprised any version of python accepts
> that formatting to be honest!
> 
>> I guess it would be better for me to keep working with the same python version
>> as in the autobuilder. I see mentions of python 3.6 in README-WALKTHROUGHS.md
>> from the autobuilder2 repository, but I am not sure how up-to-date it is. Could
>> you please confirm whether this is the correct version or not?
> 
> The docs are out of date and the definitive version is the one checked in bitbake:
> 
> https://git.openembedded.org/bitbake/tree/lib/bb/__init__.py#n15
> 
> "Sorry, python 3.8.0 or later is required for this version of bitbake"
> 
> so 3.8+ is our current requirement.

ACK, I'll then align with this version for any future development.

Thanks,

Alexis

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


