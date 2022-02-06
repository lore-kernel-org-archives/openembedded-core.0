Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AD8C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 17:24:17 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.11193.1644168255284301912
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 09:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 216HNBl0003186;
	Sun, 6 Feb 2022 11:23:11 -0600
Message-ID: <3fda48d4-4db4-09c8-526d-4a895f457901@kernel.crashing.org>
Date: Sun, 6 Feb 2022 11:23:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
        openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: 
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 17:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161405

I just noticed this.  It might make sense to link udev static when BOTH systemd 
and sysvinit are enabled.  (A single package set, multiple images with different 
init managers.)

Not sure though how that works in Honister, just something I noticed with this 
commit.  (And yes, I do use a distro with BOTH sysvinit and systemd enabled for 
a single package set.)

--Mark

On 2/6/22 2:10 AM, Richard Purdie wrote:
> On Wed, 2022-02-02 at 08:35 +0100, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Link udev shared with systemd helper to minimize the udev package size
>> if DISTRO_FEATURES contains systemd.
>>
>> It is only usefull to link udev static with systemd helper if udev
>> should be installed without systemd.
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>> (no changes since v1)
>>
>>   meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>>   1 file changed, 1 insertion(+)
> 
> 
> This seems to break some of our tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/4708
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3121
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3085
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3089
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3127
> 
> Presumably it causes extra dependencies to be pulled in causing the file overlap
> where there was previously none.
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
> View/Reply Online (#161392): https://lists.openembedded.org/g/openembedded-core/message/161392
> Mute This Topic: https://lists.openembedded.org/mt/88853822/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

