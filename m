Return-Path: <zboszor@pr.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF05C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 17:25:20 +0000 (UTC)
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.9270.1632590717831549579
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 10:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=Lw0Fq13F;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mUBQG-0003zd-0w; Sat, 25 Sep 2021 19:25:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4um8vcAeET3vBXrqmOJEhk+4zxXQVWj5S8yF4GePCc8=; b=Lw0Fq13FStMp4iq/u6mdAKQ/Zf
	d8si7O5ZNzPUMTaYFPS50vYgMB6uvStMuOaMOhFK26hAfr1XDkXDO53DeR4r+6VLm6FSi8rMJ8KPy
	VLQu6ISVaQfl9CRs2LSysrEQMQSdnbYkEv7t066Mof2Z67nhkNbwHZfQDEHWd6ZRAvpq0CF7QG0Ma
	16SrJ+TrTKX5RKKllfrad7FLfnS/qasbgfavrHQuPGac06arTwkZuFu2IW+lHolGB/NO/+/MELJjz
	SDiU1lkuNGDWUsb7R/t2MOvybY+MGxWoP2rn9gpLmSsvulD6CHVd51KopMKRSIq4ebO5zWAbLGd/V
	ahLEVofA==;
Received: from host-87-242-33-29.prtelecom.hu ([87.242.33.29]
 helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mUBQB-0004hW-Cw; Sat, 25 Sep 2021 19:25:09 +0200
Message-ID: <967631af-76b4-7038-987f-cbd0f2ccb9ee@pr.hu>
Date: Sat, 25 Sep 2021 19:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [OE-core] user/group XXX does not exist, using root with RPM/DNF
 packaging in Hardknott and Honister
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mark Hatle <mark.hatle@kernel.crashing.org>,
 openembedded-core@lists.openembedded.org
References: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
 <c1c5df22-9bed-6d90-6d04-aec9e44a4efd@kernel.crashing.org>
 <77b48aa1-3f41-3185-d820-9f956ce48a2a@pr.hu>
 <f819c66c154fda5ab2bb91702ed8fb1d14bfa20f.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
In-Reply-To: 
 <f819c66c154fda5ab2bb91702ed8fb1d14bfa20f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scan-Signature: 379ecbcb7d1e2dff7c512375274bbca6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 17:25:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156351

On 2021. 09. 25. 11:18, Richard Purdie wrote:
> On Sat, 2021-09-25 at 10:48 +0200, Zoltan Boszormenyi via lists.openembedded.org
> wrote:
>> On 2021. 09. 24. 19:17, Mark Hatle wrote:
>>>
>>>
>>> On 9/24/21 9:02 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>> Hi,
>>>>
>>>> I have a special package that creates users and groups
>>>> via inherit useradd. This package doesn't depend on any
>>>> others but it is depended on, both via DEPENDS and RDEPENDS
>>>> by packages using those users/groups in their do_install
>>>> scripts.
>>>>
>>>> This works for packaging becase these ownerships
>>>> are encoded in the packages, confirmed by rpm -qp --dump ...
>>>
>>> Does it show the useradd in the _PREINSTALL_ (you can use --scriptlets in the
>>> rpm -qp)?
>>
>> For the package that adds the users, yes.
>>
>>>
>>>> However, during do_rootfs, a couple of
>>>> "user/group XXX does not exist, using root"
>>>> messages appear for the packages depending on others
>>>> creating these users/groups.
>>>
>>> Do the using packages contain RDEPENDS on the package that adds the user/group
>>> to the system?
>>
>> My bad. One of my custom packages did not and the
>> warnings were printed by that single package.
>>
>> On the other hand, clamav-freshclam (both in meta-security
>> and my layer where I forked an older version of the recipe)
>> do not have an RDEPENDS on clamav. Instead, it's the other
>> way around.
>>
>> There the problem is that clamav-freshclam is shipping
>> /var/lib/clamav that should be owned by clamav:clamav.
>> meta-security works this around badly by using chown in its
>> pkg_postinst which is NOT marked as "ontarget" so if clamav
>> is included in an image, then that chown doesn't take effect
>> and e.g. freshclamd (running under the clamav user) cannot
>> populate /var/lib/clamav with the current virus database.
>>
>>
> 
> That sounds like a bug in clamav-freshclam which needs a dependency adding?

Or just move /var/lib/clamav (the empty directory)
from clamav-freshclam to clamav.

> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156342): https://lists.openembedded.org/g/openembedded-core/message/156342
> Mute This Topic: https://lists.openembedded.org/mt/85839631/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@pr.hu]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


