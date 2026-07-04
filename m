Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE2CC43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 21:55:29 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.121558.1783202125198440116
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2026 14:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=R1Cm+DSL;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gt4DS1WB1z8v0X;
	Sat, 04 Jul 2026 23:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783202120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zy2FdLK4yj+JdKTSW430xVtG1UA6deTTSTsBbAI2YMo=;
	b=R1Cm+DSLR7qQ8EY6QtvVifOKu5lZJf/0Ii2KpjDXMc1TUq+DEHFzsF3R/cgHBCIbhQgaRp
	Uxf+Xx/5g4t9lIuVt8WyKkV7eegk06h6KO/dXVUKsPO3Bas6c+h+3V+V99Bh8qGgz7ZZQL
	MixAn3npjLN8Q9ERYIYO7i7nkOyXNkMuWnEN4npZ9xvra4En1zngYq2e8YsnsCrtb7Z3/R
	i4krdxJEcqiI8tDPVUrTY5z36apcCl9vVjZzk4YAMVJNczKnbWMCsT+PSZ3IV91MIOeg9u
	pAdn74n7pTckmSuQ5TdTJoD7jDBwt27JD6ULRnRrGVw/VkvKYpD3OFBgnUuwOw==
Message-ID: <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
Date: Sat, 4 Jul 2026 23:55:17 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
To: adrian.freihofer@gmail.com, yoann.congal@smile.fr,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3pqiuarkqdrepwbsdd3dzumgowsw865q
X-MBO-RS-ID: 09c54173d52a4ebabc6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 21:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240135

On 7/2/26 1:38 PM, adrian.freihofer@gmail.com wrote:

Hello everyone,

>>>> I guess, before this patch can be applied, this one (or a back-
>>>> port of
>>>> it) is required:
>>>> https://git.openembedded.org/openembedded-core/commit/?id=85e0408a81bdca0411a8625061e5e343c05f92d9
>>>> Otherwise, the oe-selftest fail.
>>> Thank you for staying vigilant.
>>>
>>> Yoann, can you please pick the aforementioned commit too ?
>>>
>>> Thank you for your help !
>>
>> Hello,
>>
>> I missed that discussion, sorry. But was reminded by Ryan (thanks).
>>
>> If I understood correclty, the set of patches we need for wrynose is:
>> * kernel-fit-image.bbclass: Do not include kernel property in DTBO
>> config subnodes
>> * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =
>> "1"
>> * oe-selftest: fitimage: Do not expect kernel property in DTBO config
>> subnodes
>> * kernel-fit-image: Add KERNEL_DTBVENDORED support for
>> FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)
>>
>> Marek, Adrian, Ryan: does that sound correct?
>>
> 
> Yes, that's correct. One little detail is the order of the patches. If
> you pick the oe-selftest commit first, all commits are compile and
> test-able. That's my suggestion:
> 
>   * oe-selftest: fitimage: Do not expect kernel property in DTBO config
> subnodes

This is [1].

>   * kernel-fit-image.bbclass: Do not include kernel property in DTBO
> config subnodes

This is [2].

>   * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =
> "1"

This is [3].

>   * kernel-fit-image: Add KERNEL_DTBVENDORED support for
> FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)

This is still not even in master-next .

> same order as on master branch.

Thank you for your help !

[1] 
https://patchwork.yoctoproject.org/project/oe-core/patch/20260704214812.365483-1-marek.vasut@mailbox.org/
[2] 
https://patchwork.yoctoproject.org/project/oe-core/patch/20260630074356.10265-1-marek.vasut@mailbox.org/
[3] 
https://patchwork.yoctoproject.org/project/oe-core/patch/20260630074423.10306-1-marek.vasut@mailbox.org/

-- 
Best regards,
Marek Vasut

