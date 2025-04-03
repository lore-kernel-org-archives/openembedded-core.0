Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00032C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:06:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.10770.1743678390325090829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=piIvdaf9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 396E343295;
	Thu,  3 Apr 2025 11:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743678388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVQJYuM5cYhog3j33llodfG9u9bB1NcuMS0zMSCuhdQ=;
	b=piIvdaf9ReJUk77R5MsCIS+tUWEMBQE/FiS1vYtOqvlp4eVxCKovjDiL6AP/1OhEbh0/qx
	9U4vgVAtvo8v1lqb06uwOgxnSZCN0gNr+ABGYRxEEzPmoWkX+ofbWDHLotyR+/iXKjrZVF
	0KFn7Jqzp3cS33D5noEUeNCw7b60KV2/DhyXGWtuT8u3tuU+z693Yjhy/ePbntBNN+npQO
	NtcvM0kv6TH1tZEY4bOHncap7lsMkvqgXQEuKQ1ZAiF5DkqPIYSqBMxNa00Smf89ZomyeW
	Q/tTXNrDa94Za301MOZG+Hk9Sf3vXHkacpd9Xxm10iTunvMVQoDl8xg+jMuUUA==
Message-ID: <21e0daef-2b05-4c33-afb8-3a45ebd97fbf@bootlin.com>
Date: Thu, 3 Apr 2025 13:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] multilib_header class: issue with custom
 multilib setup
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, Khem Raj <raj.khem@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
 <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohgrohcuofgrrhgtohhsucevohhsthgruceojhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkeegfeevtdetkeevjedtffffheekveffleeuueehledvfeffgffhvedvgfeifeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemtggstgejmeguugdtfeemsgefieelmehflegtvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemtggstgejmeguugdtfeemsgefieelmehflegtvgdphhgvlhhopeglkffrggeimedvrgdtudemtggsudegmeehheeimeejrgdttdemtggstgejmeguugdtfeemsgefieelmehflegtvggnpdhmrghilhhfrhhomhepjhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigf
 hhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 11:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214318

Hello, Richard

On 4/3/25 12:10, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2025-04-03 at 12:07 +0200, Joao Marcos Costa wrote:
>> Hello,
>>
>> I'm facing the conflict below (among other conflicts of the same kind)
>> during the rootfs creation of my image, and I would like to ask for some
>> help on this:
>>
>> file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted
>> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
>> libc6-dev-2.37-r0.riscv64
>>
>> AFAIK, multilib_header.bbclass is meant to handle this kind of
>> situation, so I tried the approach below:
>>
>> do_install:append() {
>>       oe_multilib_header gnu/lib-names-lp64d.h
>> }
>>
>> this one too, just in case:
>>
>> do_install:append:virtclass-multilib-libcfi() {
>>       oe_multilib_header gnu/lib-names-lp64d.h
>> }
>>
>> Am I missing something here?
>>
>> With both approaches, I get the error below:
>>
>> file /usr/include/gnu/lib-names-lp64d-64.h conflicts between attempted
>> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
>> libc6-dev-2.37-r0.riscv64
>>
>> and if I try running 'bitbake -c rootfs myimage' once again:
>>
>> file /usr/include/gnu/lib-names-lp64d-64-64.h conflicts between
>> attempted installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
>> libc6-dev-2.37-r0.riscv64
>>
>> I added some debug prints to understand what exactly was being renamed
>> by oe_multilib_handler, and:
>>
>> "renaming gnu/lib-names-lp64d.h to gnu/lib-names-lp64d-64.h"
>>
>> That looks correct, but I don't quite understand why the original header
>> remains there:
>>
>> $ find image/usr/include/gnu/ -name lib-names-lp64d*h
>> image/usr/include/gnu/lib-names-lp64d-64.h
>> image/usr/include/gnu/lib-names-lp64d.h
>>
>> For info, my multilib suffix is 'cfi' rather than '32' or '64'. Am I
>> right to presume I would need to adapt oe_multilib_header to it?
>>
>> Thanks in advance, any help provided is appreciated.
> 
> The code works by injecting a generated header file which does
> redirection depending upon which compiler is being used. "lib-names-
> lp64d.h" will therefore likely be a template generated file which
> directs to lib-names-lp64d-64.h or lib-names-lp64d-32.h depending on
> which multilib is in use.
> 
> You will almost certainly have to adapt that code for cfi.
> 
> Cheers,
> 
> Richard

Thanks for your reply.

Even with the cfi suffix set correctly, the actual file raising the 
conflict is the generated template, no the header with the suffix:

file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted 
installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and 
libc6-dev-2.37-r0.riscv64

In my previous mail, I should have pasted this one instead. My bad.

-- 
Best regards,
João Marcos Costa

