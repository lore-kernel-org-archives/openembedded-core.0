Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C19AC55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 11:53:06 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9939.1785412382290365155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 04:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=lGrpbDc/;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h9ndQ6CnZzKmJX;
	Thu, 30 Jul 2026 13:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785412378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9w6rdydcy/JPUlFOV79NVJUbZStSnBDMQZuuKbRHsk=;
	b=lGrpbDc/EfvN24fDR18F3dyk8KVLC/pu5ZXI4xNUrdXvEYcsBPGdG0vA6HnHtTV4jjtltB
	J9UZfGW+399IlRupHYnWJzqh5QITm9y78lZArcjgwXc2v1QcSiO3Diu2mG7I2XT88V2ez1
	XFHspo6U2YssvAa1BNFNcXxdC/wJONDosZ+kqbFCFzsbUVrdO7Jb0V9hF3Tn5clP5kq8oB
	bfEnomYNWYhbYDmT6HAnGV5oDCVhsHkmaidGL+tJCdT+kzpBlj4BEAVqBTOHzVJn9lgz1O
	NnMFD+aZOEZ1EhPbz7UNHthQiaXe4uhMjqpm1i3wKrVIoYRfwrXIcNnbjY4Acg==
Message-ID: <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
Date: Thu, 30 Jul 2026 13:52:56 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
To: Yoann Congal <yoann.congal@smile.fr>, adrian.freihofer@gmail.com,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
 <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
 <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
 <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
 <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
 <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a991a32618d1d4a4209
X-MBO-RS-META: jec8d8a44jk3b87kd9e7m7ys3x74w1e5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 11:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242343

On 7/30/26 9:36 AM, Yoann Congal wrote:

Hello Yoann,

>>>>>> [1] https://patchwork.yoctoproject.org/project/oe-core/
>>>>>> patch/20260704214812.365483-1-marek.vasut@mailbox.org/
>>>>>> [2] https://patchwork.yoctoproject.org/project/oe-core/
>>>>>> patch/20260630074356.10265-1-marek.vasut@mailbox.org/
>>>>>> [3] https://patchwork.yoctoproject.org/project/oe-core/
>>>>>> patch/20260630074423.10306-1-marek.vasut@mailbox.org/
>>>>>
>>>>> Do you think those three backports can be picked up for OE wrynose ?
>>>>>
>>>>> Thank you for your help !
>>>>
>>>> Sure! They even are in the branch I sent for review:
>>>> https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
>>>
>>> Oh, that's nice.
>>>
>>>> Following Paul's review, I will most likely hold it for one cycle in
>>>> order to merge
>>>> the test at the same time.
>>>> See: https://lore.kernel.org/all/
>>>> c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev/
>>
>> Are there any news on getting the fitImage fixes into the wrynose
>> branch, is this still on your radar ?
>>
>> Thank you, and I'm sorry for the push.
> 
> Hello,
> 
> I don't mind the push, it's fair :)
> 
> This series is still on my radar but blocked on a wrynose test patch:
> Basically this:
> https://lore.kernel.org/openembedded-core/20260706221933.4026508-2-reatmon@ti.com/
> ... but backported to wrynose.
> Ryan was working on it but did not sent the patch, I don't know what
> happened.

Do you think the fitImage fixes could be backported without the test 
patch, or would that make some test suite fail? Please pardon my ignorance.

The fitimage fixes landed in oe-core master 6 weeks ago and they fix 
fitImage usability issues which block me from updating to wrynose in 
multiple projects, that's why I keep monitoring this thread so, but 
again, please do not read this as a push.

-- 
Best regards,
Marek Vasut

