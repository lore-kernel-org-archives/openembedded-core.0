Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D216C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 13:40:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.11993.1709732441838925600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 05:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1rhrVg-0001ng-Bs; Wed, 06 Mar 2024 14:40:40 +0100
Message-ID: <4830be50-69d6-4122-abcd-5cc2ab574f02@pengutronix.de>
Date: Wed, 6 Mar 2024 14:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] kernel-fitImage: only include valid compatible line
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Christian Taedcke <christian.taedcke@weidmueller.com>,
 Denis Osterland-Heim <denis.osterland@diehl.com>
References: <20240305093628.1094525-1-christian.taedcke-oss@weidmueller.com>
 <17BA308225892468.21429@lists.openembedded.org>
In-Reply-To: <17BA308225892468.21429@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 13:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196679

On 06.03.24 14:39, Ahmad Fatoum wrote:
> Hello Christian,
> 
> On 05.03.24 10:36, Taedcke, Christian wrote:
>> From: Christian Taedcke <christian.taedcke@weidmueller.com>
>>
>> Without this commit the configuration node includes the compatible
>> line 'compatible = [00];' if EXTERNAL_KERNEL_DEVICETREE is not
>> defined, i.e. if PREFERRED_PROVIDER_virtual/dtb is not used.
>> This prevents u-boot from using this configuration and it prints the
>> message "Could not find configuration node".
>>
>> The functionality to add the compatible line was added in commit
>> f4c82fb6da89 ("kernel-fitImage: add machine compatible to config
>> section").
>>
>> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
>> ---
> 
>>  	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
>> -	compatible_line="compatible = \"$(fdtget "$dtb_path" / compatible | sed 's/ /", "/g')\";"
>> +	if [ -e "$dtb_path" ]; then
>> +		compatible_line="compatible = \"$(fdtget "$dtb_path" / compatible | sed 's/ /", "/g')\";"
>> +	fi
> 
> The change is ok, but I'd prefer we harden this against errors a bit more:
> 
>   if [ -e "$dtb_path" ]; then
>         compat=$(fdtget -t -s "$dtb_path" / compatible | sed 's/ /", "/g')
>         if [ -n "$compat" ]; then
>   		compatible_line="compatible = \"compat\";"
> 	fi  
>   fi
> 
> This should ensure that compatible = "" only results when the DT indeed has compatible = "".

Scratch that line. This should ensure we never get an empty compatible
(or one with a wrong type).

> What do you think?
> 
> Thanks,
> Ahmad
> 
>>  
>>  	dtb_image=$(echo $dtb_image | tr '/' '_')
>>  	dtb_image_sect=$(echo "${dtb_image_sect}" | tr '/' '_')
>>
>>
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196678): https://lists.openembedded.org/g/openembedded-core/message/196678
> Mute This Topic: https://lists.openembedded.org/mt/104741166/4830399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a.fatoum@pengutronix.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


