Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E11C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 10:21:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.10403.1679307704131458932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 03:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=HdAG10Ow;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6230485A1D;
	Mon, 20 Mar 2023 11:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1679307701;
	bh=4n8WmRC4QPLPgrrXNsTFezPd5SX0fzqkj7vIDLgsts8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HdAG10OwEx/OSeJL/d8LPmEKRiubBojXSba80Bfs0vHONytDT2d/c/3l5tZ/YrMgu
	 DT7MKbbJ1sCrwfYzYCMBZQcMgA7KzEoWt5fyFEyRCZZxO8ugCRLj7U2FwYT/j/snKf
	 NtfLILF5x91rZqsFYR3/nwtMEYCvygDJTW6uksHkjvWPyvGkMEcXUfmcsvmKyUpu6w
	 0JyHjNRe/9GmrrMPcEyJHutW5+RmqfeWly7zo3RSE5QoQRFKmSXLY3+AamerS/eMrQ
	 qmohzuAmxLk+NpHPMOEHzUU/DVwz/T3/NHzPI9rWFXxm53/I6vNEnsopcWed8AeHcg
	 tUHNq7unypmzA==
Message-ID: <181b96a5-62de-225b-417d-67d3b5197264@denx.de>
Date: Mon, 20 Mar 2023 11:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] systemd-systemctl: Create machine-id with
 "uninitialized" text in it
To: ChenQi <Qi.Chen@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Armin Kuster <akuster808@gmail.com>, Bob Henz <robert_henz@jabil.com>,
 Kristian Klausen <kristian@klausen.dk>,
 Nick Potenski <nick.potenski@garmin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230227191548.95504-1-marex@denx.de>
 <b006eac7-bc3b-59f7-0ac3-7701042bac54@windriver.com>
 <34a6fdfb-f96d-536d-7761-fb46b06a302f@denx.de>
 <CO6PR11MB560219C3F043786F9A9EF378EDBD9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <4cea1d51-8291-48a9-629c-8ebdd1a97e71@denx.de>
 <335648f9-d1d3-fe27-f492-1fdda85fa3fc@windriver.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <335648f9-d1d3-fe27-f492-1fdda85fa3fc@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 10:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178810

On 3/20/23 03:23, ChenQi wrote:
> On 3/20/23 06:55, Marek Vasut wrote:
>> On 3/17/23 15:32, Chen, Qi wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>> sorry for the delay
>>
>>> I used the following line in local.conf and the firstboot worked:
>>> IMAGE_PREPROCESS_COMMAND:remove = "systemd_preset_all;"
>>
>> But doesn't that also inhibit the rootfs-time preset-all ? I would 
>> like to keep that, I just need for the systemd firstboot units to run 
>> on first boot to do first boot system setup things, which they won't 
>> without the 'uninitialized' in /etc/machine-id .
> 
> 
> 1) Lacking of /etc/machine-id file also triggers firstboot.
> 
> 2) systemd firstboot does 'preset-all'. If you enable firstboot, then 
> you don't need rootfs-time preset-all.

All right, thank you. Please go ahead with the revert.

But can you please document this IMAGE_PREPROCESS_COMMAND:remove = 
"systemd_preset_all;" somewhere at least in the commit message, so 
others who run into non-working firstboot won't have to struggle with it 
? Maybe even add this into the comment in 'systemctl' script ?

