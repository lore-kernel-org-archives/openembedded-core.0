Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B31BECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 16:32:54 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.26916.1662395572713655079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 09:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=m1dROvEH;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0E2955C00F8;
	Mon,  5 Sep 2022 12:32:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 05 Sep 2022 12:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1662395572; x=1662481972; bh=e+
	z3I+bB4hjPuLcTC5NWjHgAVA1HsIucmg3N+8+bTZ8=; b=m1dROvEHecID0YDI61
	749bToszlQHl835Sz0mauEnyerk7NRBC/jOhejxKEgJFGSP2fp6Px28943oHElAp
	HN3kK+FO7w4/kpo4XjyaSBduX1UDmlUuZHvqNUt8RopwgiAB72K2nyPkYM7YyevY
	MLNFOpCZ8s7JbIMTgIwkj6orrllKv2CqRO5kMjOMUArcHpupRUUAdcnqGLKMQUX6
	bPQ9B+sNzD07xUYzA/Y+ixs2vEkwdX+uWHVTEJTKp1M1OvdUzJR2KLEEUs1E6a15
	C+is0N+P1D8l2KEDxGNzyFEHjIhRoc0HwRSBc4xG1Kb2/lUsaK9MtoG9010Z7rfL
	TumQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1662395572; x=1662481972; bh=e+z3I+bB4hjPu
	LcTC5NWjHgAVA1HsIucmg3N+8+bTZ8=; b=ZSx+x1n1rThCxoApuUmDiWg7U1PxA
	aU4n5SBzMrPDQvZJWDvR3JyAb6Gd/tRtcA82/B1O6Au3z8go3q8lM75gd0mnKuqA
	HRESwqjvnPEdY+mgCK4JsK/3aocSnZgiIqoPmE6HgFr7SqJEmsB9lRiq1isHe35A
	1I64Ehom4xhs3RBZ3kPGjJS3qjYPG64Led7X3G/1pjhNk/UCRa1jbJjBdyNFQmgg
	W/F5wczNrBhBzShRhcgGg0tG7eUCh4miT6unxGEeHVKs2QmifttCZNereVzlMcA1
	JkP/OasO8TEy6XksOvNaUtfkfwbbosCNUhE2afm42D5Dv7oksfZ//P+/g==
X-ME-Sender: <xms:syQWY6UcAq2-8F8BREUP9YElQA0i6jTeQpXpX5ZeOB43PDvFmEvywA>
    <xme:syQWY2mMtFXCPRMvrZGDIM1lFjy3jlefXjGOVFtpIZLNrpjCVcbHaVfVG0vk5vQWp
    GHt8tGjv6HyqxKj8gU>
X-ME-Received: 
 <xmr:syQWY-Z2MioVvy6VALLrMawQN0R9Ug0PYLKSFtVZSWs6U7L84flsXvj3lM14n2-tfYN9ctk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpehffgfhvfevufffrhgjkfggtgesthdtredttdertdenucfhrhhomheprfgr
    vhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrf
    grthhtvghrnhepkedtueegheduueekkeeuveehledvffekueehtdfgtedvteefleelgeek
    geegueegnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhu
    khhofhhfrdhnvght
X-ME-Proxy: <xmx:syQWYxWwOqOFnKAvxMJbQRCzIefV-aZrXvm9yAVl9kombEQrIbabvw>
    <xmx:syQWY0mbz_8JdoVZCfeNkvg7j95TFyI78qByWnNmRdmE6rS5NVYhlQ>
    <xmx:syQWY2dQG2dACEvhpQyajVeMsfuv27P4yFantonBuU3V4TEIV0sTdQ>
    <xmx:tCQWY7tK5fl-wc-yPIPd_-wjmYTqRyaUmowXvIAafsyxpgoSeqxJYw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 12:32:51 -0400 (EDT)
References: <20220828195405.8213-1-pavel@zhukoff.net>
 <220679d0e3253221aae25368e6ea4583d55e883f.camel@linuxfoundation.org>
User-agent: mu4e 1.8.7; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] core-image: Exclude openssh complementary
 packages
Date: Mon, 05 Sep 2022 18:27:26 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: 
 <220679d0e3253221aae25368e6ea4583d55e883f.camel@linuxfoundation.org>
Message-ID: <87tu5lzssg.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 16:32:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170321


"Richard Purdie" <richard.purdie@linuxfoundation.org> writes:

> On Sun, 2022-08-28 at 21:54 +0200, Pavel Zhukov wrote:
>> Openssh (main) package may be marked for installation via complementary
>> packages mechanism as a dependency of openssh-ptest
>> and this causes conflict with dropbear [Yocto #14858] [1].
>> Excluding openssh complementary packages if ssh-server-dropbear is in
>> DISTRO_FEATURES fixes this issue.
>> To install openssh complementary packages in the images with
>> ssh-server-dropbear they may be added manually into the list because
>> they will be excluded from the installation even if corresonding class
>> (dev-pkg or dbg-pkgs) inherited.
>> 
>> [1]
>> Error:
>>  Problem: problem with installed package dropbear-2020.81-r0.core2_64
>>   - package dropbear-2020.81-r0.core2_64 conflicts with openssh provided by openssh-8.9p1-r0.core2_64
>>   - package openssh-8.9p1-r0.core2_64 conflicts with dropbear provided by dropbear-2020.81-r0.core2_64
>>   - package openssh-ptest-8.9p1-r0.core2_64 requires openssh, but none of the providers can be installed
>>   - conflicting requests
>> (try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)
>> 
>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>> ---
>>  meta/classes-recipe/core-image.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
>> index 4b5f2c99c4b..fa38ae876d0 100644
>> --- a/meta/classes-recipe/core-image.bbclass
>> +++ b/meta/classes-recipe/core-image.bbclass
>> @@ -78,5 +78,6 @@ CORE_IMAGE_BASE_INSTALL = '\
>>  CORE_IMAGE_EXTRA_INSTALL ?= ""
>>  
>>  IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>> +PACKAGE_EXCLUDE_COMPLEMENTARY:append = "{@ openssh if 'ssh-server-dropbear' in d.getVar('IMAGE_FEATURES')}"
>
> This doesn't seem to be correct syntax, e.g. no $ before {@ and I'm not
> sure that is valid python?

Resent. I should have tested it more carefully.
I've tested new revision with few cases I'm aware of and it worked.

>
> Cheers,
>
> Richard
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170271): https://lists.openembedded.org/g/openembedded-core/message/170271
> Mute This Topic: https://lists.openembedded.org/mt/93313521/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-


