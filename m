Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927ECC433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 01:38:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1059.1643420331343028850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 17:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=MWw5NgwD;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BCE08820AE;
	Sat, 29 Jan 2022 02:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643420327;
	bh=dXFarsZzF+iRSIL3TJc8nqTZ9i3UN1tmuAss9ICkM2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWw5NgwDnzk5Dcd/dSkWXKld5IUXm2Y0OQTYBMu7zlVLQ+m9niNTNsXp8REv67S++
	 lHkl1AT8uLTWerx3B0Wu+1a3SEDwvY9eMaCsAxnF4HXITebS6CNF3sbZ6wsuczgPs0
	 tyXvmIWdtG/BDRfrZWp9yxnoL/WGUvMzKhDjNyimQCoxr0tUgAn/eX4vtl8cNurhc4
	 gjnHbGodOu7hzJF5gvx7medQK580zs3kNXDSsIGGLsJ5+z6/pGLECZazZsb0tMOWkI
	 ta/jNdKCWmEDCsJCwmJnkbmnQvQ2XhPPFZluY301obZ3Pi/jIVx107PmL22X+BOXzh
	 i9YroW67UUyQQ==
Message-ID: <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
Date: Sat, 29 Jan 2022 02:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] Revert "featimage: refactor style"
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Andrej Valek <andrej.valek@siemens.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220129002907.84534-1-marex@denx.de>
 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 01:38:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161090

On 1/29/22 02:06, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Marek Vasut
>> Sent: den 29 januari 2022 01:29
>> To: openembedded-core@lists.openembedded.org
>> Cc: Marek Vasut <marex@denx.de>; Andrej Valek <andrej.valek@siemens.com>;
>> Richard Purdie <richard.purdie@linuxfoundation.org>
>> Subject: [OE-core] [PATCH] Revert "featimage: refactor style"
>>
>> This reverts commit f44bb458884da64356ee188917094b5515d3b159.
>>
>> The reverted patch attempted to perform some sort of clean up, however
>> it only brought in style inconsistencies like this:
>>
>> ```
>> conf_desc="$conf_desc${sep}setup"
>> ```
>>
>> The curly brackets around variables were placed in the kernel-fitimage
>> bbclass deliberately, since when assembling the fitimage ITS there are
>> multiple variables where it is difficult to identify where the variable
>> ends and some sort of follow up string starts.
> 
> There is actually a technical reason to not use ${foo} for shell
> variables unless necessary in bitbake files and it is because
> bitbake will treat them all as potential bitbake variables. This
> means they are unnecessarily included in the taskhashes that
> bitbake calculates.

Yikes. (it would be good to include this gem in the commit message)

So are we stuck with this inconsistent coding style change or is there a 
third alternative ? I mean, besides rewriting the fitimage generation 
into python, which might make it more flexible too.

