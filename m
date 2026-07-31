Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7E6C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 02:35:11 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2865.1785465303339663715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 19:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=C8O6y/1e;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hB9C71bMDzKv7c;
	Fri, 31 Jul 2026 04:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785465299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CRsgKB5we5/+CjvU6TBPne/tRwgpyiV7jCCdOa+Qmg=;
	b=C8O6y/1eBka3eVrNT8bDgzyu2/pZBk8fV/JuxTI38R8Asx7jHQuuKJ0HT9LVmpnBIRN5n1
	g2Pll+M0mMTiw0DcWAfQBueCFZcPLamBaIr79eKZRmxXfayCtdqx+AEsOsf7SDeIbVUS7C
	YlZSrTIEPAXvn0Zjv1Qj3UF58w3nG7Kk42mjYrpAw0ZAKt5xqo2IMAnIvn/Erbn41A4Bxd
	LiRBSKXZRUVd4e9NEn8MizSxQ96+T+DUad1JB6fNkXyzwCJ8odPR7kJsOITQhSsd/Ng/0b
	gO83h5nlnrB3N4WD+RjQaIsyJ3wEFz/9hWjBMiAAylSdbwJ1YEn3ASgeH3jL3g==
Message-ID: <398ede22-152a-4b9b-8eeb-8e252bdab4d4@mailbox.org>
Date: Fri, 31 Jul 2026 04:34:56 +0200
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
 <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
 <0be60525b600137c0f723c7faa7ab5c2f04934ae.camel@gmail.com>
 <DKBWUZLGTNVG.ZNWPY3U22BE8@smile.fr>
 <b4fd3e49-e436-40cd-8b62-0c6792cd6f14@mailbox.org>
 <982caddffca561ea3bf1ce907a40447302e74378.camel@gmail.com>
 <DKBYCAF9BZO1.1QQXVA3V614B3@smile.fr>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DKBYCAF9BZO1.1QQXVA3V614B3@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 16c12ae39abeb88daef
X-MBO-RS-META: htz7cwdf8s7k8eub43ukke9fcdcjufcp
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 02:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242390

On 7/30/26 3:49 PM, Yoann Congal wrote:

Hello everyone,

>>>>>> The fitimage fixes landed in oe-core master 6 weeks ago and
>>>>>> they fix
>>>>>> fitImage usability issues which block me from updating to
>>>>>> wrynose in
>>>>>> multiple projects, that's why I keep monitoring this thread so,
>>>>>> but
>>>>>> again, please do not read this as a push.
>>>>>
>>>>> I think going with the four patches from
>>>>> https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
>>>>> without a fifth patch which adds test coverage for this fairly
>>>>> isolated
>>>>> detail is fine.
>>>>
>>>> This is where I disagree. Last time I reviewed this series it
>>>> looked
>>>> good but I had no way to check it actually worked once backported
>>>> to
>>>> wrynose. That is why I asked Ryan to backport the test from master
>>>> to
>>>> wrynose.
>>>
>>> Is there a git tree/branch with those patches ? If so, I can at least
>>> test this locally and confirm whether or not anything is broken on my
>>> end ?
> 
> I pushed that here:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=ycongal/wrynose/kernel-fit

This works for my use cases.

[...]

>>> I ran this now and got 8 commits which cleanly apply on the wrynose
>>> branch, maybe that is all that is missing for the test part ?
>>>
>>> $ git log --oneline --reverse --grep=fitimage
>>> origin/wrynose..origin/master --
>>> meta/lib/oeqa/selftest/cases/fitimage.py
>>> e46d8473fb3 oeqa/selftest/fitimage: fix missing whitespace around
>>> assignment
>>> 0344e652a40 oe-selftest: fitimage: replace _gen_random_file with
>>> _gen_elf64_dummy
>>> 5592be53348 oe-selftest: fitimage: replace bbb-dtbs-as-ext with
>>> test-dtbs-as-ext
>>> befc103a95d oe-selftest: fitimage: replace MACHINE==qemux86-64 guards
>>> with KERNEL_SETUP_BIN
>>> 4b08cf6048b oe-selftest: fitimage: add machine settings table and
>>> skip
>>> helpers
>>> f17f4263c07 oe-selftest: fitimage: stop hardcoding MACHINE and DISTRO
>>> in
>>> tests
>>> 85e0408a81b oe-selftest: fitimage: Do not expect kernel property in
>>> DTBO
>>> config subnodes
>>> de2e11e6362 oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
>>>
>>
>> It's this series which makes back-porting the tests hard, I agree:
>> https://patchwork.yoctoproject.org/project/oe-core/list/?series=47907&state=%2A&archive=both
>>
>> Question is what's simpler and more appropriate: Back-porting major
>> changes for "only" test code or adding test coverage to the old test
>> code on wrynose. Technically, I would have sent the oe-selftest rework
>> earlier if I had it available. So, back-porting=cherry-picking would
>> make sense and be straight forward. Process wise, I would probably
>> stick to just adding test coverage for the changes on wrynose. That
>> should be easy doable, it's just not cherry-pickable.
> 
> Those cherry-picks do not look particularly good, please avoid them if
> we can...
> 
> If you can easily send a single patch that test the series on
> wrynose, that does sound better.

I submitted the backported test, but the test required adjustments to 
not depend on the other commits. I think the adjustments are harmless 
and the test still works as intended:

[wrynose][PATCH] oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED

-- 
Best regards,
Marek Vasut

