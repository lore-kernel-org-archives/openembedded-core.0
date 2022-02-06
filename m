Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058DCC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 17:27:19 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web08.11062.1644168438022228608
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 09:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 216HQDME003257;
	Sun, 6 Feb 2022 11:26:13 -0600
Message-ID: <d59a9eeb-4d7a-3050-bcdf-9cbdb284bdb6@kernel.crashing.org>
Date: Sun, 6 Feb 2022 11:26:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
        openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
 <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 17:27:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161406



On 2/6/22 10:39 AM, Stefan Herbrechtsmeier wrote:
> Am 06.02.22 um 09:10 schrieb Richard Purdie:
>> On Wed, 2022-02-02 at 08:35 +0100, Stefan Herbrechtsmeier wrote:
>>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>>
>>> Link udev shared with systemd helper to minimize the udev package size
>>> if DISTRO_FEATURES contains systemd.
>>>
>>> It is only usefull to link udev static with systemd helper if udev
>>> should be installed without systemd.
>>>
>>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>    meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>>>    1 file changed, 1 insertion(+)
>>
>>
>> This seems to break some of our tests:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/4708
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3121
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3085
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3089
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3127
>>
>> Presumably it causes extra dependencies to be pulled in causing the file overlap
>> where there was previously none.
> 
> Sorry, I was told sysvinit with systemd isn't a valid use case anymore.

It definitely works in Honister (I'm actively using it.)

We produce a single package set, then allow for multiple image recipes to select 
which init manager to use.  This simplifies the eSDK, sstate-cache and binary 
package feed -- while still giving the end user the ability to switch.

(And there is a HUGE difference in image size between sysvinit and systemd.)

--Mark

> Would it be okay to enable it only if sysvinit isn't in distro?
> 
> Otherwise reject the change because it is impossible to know if a
> dependency between udev and systemd is okay or not.
> 
> Regads
>     Stefan
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161402): https://lists.openembedded.org/g/openembedded-core/message/161402
> Mute This Topic: https://lists.openembedded.org/mt/88853822/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

