Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD10FC8303B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.21179.1650546438732572588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 06:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1nhWWi-0000v5-Cp; Thu, 21 Apr 2022 15:07:16 +0200
Message-ID: <261b85dd-08d4-00cb-b682-990d9fc27805@pengutronix.de>
Date: Thu, 21 Apr 2022 15:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: wic --offset: how to create GPT images with out-of-order
 partitions?
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Enrico Joerns <ejo@pengutronix.de>
References: <29ddcf5f-5b9f-490b-2ed2-faac7f6985bd@pengutronix.de>
 <CAJdd5Gavt_eJQ3J2pz-5grj_T+UWK3=SNG6JRxRQ2w2fx=0fWg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: 
 <CAJdd5Gavt_eJQ3J2pz-5grj_T+UWK3=SNG6JRxRQ2w2fx=0fWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164761

Hello Joshua,

On 20.04.22 17:33, Joshua Watt wrote:
> On Wed, Apr 20, 2022 at 9:43 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>   part rootfs-a --offset=64M --fixed-size=64M --fstype=ext4
>>   part env-a    --offset=4M  --fixed-size=8K  --source rawcopy --sourceparams="file=uboot-env.bin"
>>   bootloader --ptable gpt
>>
>> If I swap the partitions around, image creation succeeds, but I need
>> them ordered the other way round.
> 
> RIght, the code creates image partitions linearly from top to bottom,
> so a partition lower in the list can't be inserted before an earlier
> one; I believe this is mostly to simplify the logic for ensuring that
> partitions don't overlap.

Thanks for the quick answer! I feared as much.

> If you are using GPT, I'd recommend mounting the disk by label or UUID
> instead of position, so the ordering isn't important

Ye, that is one possibility. Unfortunately, I need to support existing
systems that don't have distinct PARTUUIDs or labels, so it's easier
to recreate the existing partitioning offline. I will stick to genimage then.

Thanks again.

Cheers,
Ahmad

> 
>>
>> Cheers,
>> Ahmad
>>
>> --
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

