Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB3C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:41:35 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.9907.1632926495040599055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18TEePGN017804;
	Wed, 29 Sep 2021 09:40:25 -0500
Subject: Re: [OE-core] [PATCH] openssh: openssh-dev shouldn't depend on
 openssh
To: Matt Johnston <matt@codeconstruct.com.au>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20210929031804.178714-1-matt@codeconstruct.com.au>
 <74dc59a8af928f90c54f3d175c1de1aa1012183e.camel@linuxfoundation.org>
 <7efc4f9ee2b26ddcae0832ff84a1105c6c62aa16.camel@codeconstruct.com.au>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <9dee0330-85f3-78d1-c54a-71ae2bd66355@kernel.crashing.org>
Date: Wed, 29 Sep 2021 09:40:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <7efc4f9ee2b26ddcae0832ff84a1105c6c62aa16.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 14:41:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156456



On 9/29/21 3:36 AM, Matt Johnston wrote:
> On Wed, 2021-09-29 at 09:24 +0100, Richard Purdie wrote:
>>> +RDEPENDS:${PN}-dev = ""
>>
>> At that point what is the point of the -dev package? I think you could make
>> this argument about a lot of the -dev packages and I'm not sure I'd want to
>> see every recipe doing this.
>>
>> What are you using the -dev package for and do you need it at all?
> 
> The -dev package isn't needed for anything, but it gets pulled in when
> "populate_sdk" is built. That does a glob over all -dev packages for
> any built package.

The dev package's SHOULD depend on the regular package by default.  There are
VERY VERY few instances where the dev package is "useful" without the
corresponding run-time package in a 'normal' use-case.  (There are always
exceptions and corner cases, but they're just that exceptions and corner cases
in my experience and lead to massive confusion by developers if exploited.)

populate_sdk, the entire purpose of this is to install the -dev package (and
it's dependencies) for anything in your root filesystem.  This says that you
root filesystem contains "openssh", thus openssh-dev will be installed.

If your root filesystem does NOT have openssh in it, then we need to answer the
question why was the -dev version added?

You mention above it's "any built package", but that should not be the case.  It
should be for any package installed into the corresponding root filesystem.

i.e. bitbake core-image-minimal -c do_populate_sdk

This should NOT install -dev packages for things not located in
core-image-minimal.  If it does, then there is another problem, that was not the
intended design.  The intention when the do_populate_sdk was written was
construct the rootfs, parse what was install and add -dev packages + their
dependencies.

--Mark

> Cheers,
> Matt
> 
>>
>> [As an aside, I do think the -dev package dependencies need rethinking but
>> that is a lot more work which nobody seems very interested in]
>>
>> Cheers,
>>
>> Richard
>>
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156452): https://lists.openembedded.org/g/openembedded-core/message/156452
> Mute This Topic: https://lists.openembedded.org/mt/85941131/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

